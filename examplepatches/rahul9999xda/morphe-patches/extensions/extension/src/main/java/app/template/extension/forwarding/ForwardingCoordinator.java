package app.template.extension.forwarding;

import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Event-driven, account-scoped forwarding coordinator. The supplied executor serializes
 * incoming events, while each rule/destination has an independent de-duplication key.
 */
public final class ForwardingCoordinator {
    private final ForwardingRuleStore store;
    private final TelegramMessageGateway gateway;
    private final Executor executor;
    private final Executor forwardExecutor;
    private final Executor copyExecutor;
    private final Set<String> inFlight = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private final LinkedHashSet<String> recentlyDispatched = new LinkedHashSet<>();
    private static final int MAX_RECENT_KEYS = 2048;
    private volatile boolean running;

    /** Backward-compatible constructor; older callers intentionally share one delivery queue. */
    public ForwardingCoordinator(ForwardingRuleStore store, TelegramMessageGateway gateway, Executor executor) {
        this(store, gateway, executor, executor, executor);
    }

    /**
     * Event matching, FORWARD delivery and COPY delivery have independent queues. A slow
     * media/forward operation can therefore no longer block text-copy automations (or vice versa).
     */
    public ForwardingCoordinator(ForwardingRuleStore store, TelegramMessageGateway gateway,
                                 Executor eventExecutor, Executor forwardExecutor, Executor copyExecutor) {
        if (store == null || gateway == null || eventExecutor == null
                || forwardExecutor == null || copyExecutor == null)
            throw new IllegalArgumentException("Dependencies are required");
        this.store = store;
        this.gateway = gateway;
        this.executor = eventExecutor;
        this.forwardExecutor = forwardExecutor;
        this.copyExecutor = copyExecutor;
    }

    public void start() { running = true; }

    /** Stops accepting queued work; already-started native sends may complete. */
    public void stop() { running = false; }

    public boolean isRunning() { return running; }

    public void onIncomingMessage(final ForwardingMessage message) {
        if (!running || message == null || message.isOutgoing() || message.isSecretChat()
                || message.isServiceMessage()) return;
        try {
            executor.execute(new Runnable() {
                @Override public void run() {
                    if (!running) return;
                    final List<ForwardingRule> rules;
                    try { rules = store.loadRules(); }
                    catch (Throwable error) {
                        reportFailure(null, "Could not load forwarding rules", error);
                        return;
                    }
                    if (rules == null) {
                        reportFailure(null, "Rule store returned no rule list", null);
                        return;
                    }
                    boolean matchedAnyRule = false;
                    for (ForwardingRule rule : rules) {
                        if (!running) return;
                        if (rule == null) continue;
                        final boolean matches;
                        try { matches = ForwardingRuleMatcher.matches(rule, message); }
                        catch (Throwable error) {
                            reportFailure(rule.getId(), "Rule matching failed", error);
                            continue;
                        }
                        if (!matches) continue;
                        matchedAnyRule = true;
                        setRuntimeStatus("Incoming message matched rule: " + rule.getName());
                        if (store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
                            try { ((app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store).recordAutomation(rule.getId()); }
                            catch (Throwable ignored) { /* stats must not block delivery */ }
                        }
                        Set<Long> destinations = rule.getDestinationChatIds();
                        if (destinations == null) continue;
                        for (Long destination : destinations) {
                            if (!running) return;
                            if (destination == null || destination.longValue() == message.getSourceChatId()) continue;
                            // A destination is an independent delivery. Even an unexpected
                            // scheduling/runtime failure for one target must not abort the
                            // remaining targets configured on this rule.
                            try {
                                dispatch(rule, message, destination.longValue());
                            } catch (Throwable destinationError) {
                                reportFailure(rule.getId(),
                                        "Could not schedule delivery for destination " + destination,
                                        destinationError);
                            }
                        }
                    }
                    if (!matchedAnyRule) {
                        setRuntimeStatus("Incoming message from " + message.getSourceChatId()
                                + " did not match an enabled rule");
                    }
                }
            });
        } catch (RuntimeException rejected) {
            // The event queue can reject before the worker has matched rules. Attribute
            // this lost event to every enabled rule that would have matched it, rather
            // than updating only a global status string (which left per-rule Failed at 0).
            try {
                List<ForwardingRule> rules = store.loadRules();
                if (rules != null && store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
                    app.template.extension.telegram.SharedPreferencesForwardingRuleStore prefs =
                            (app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store;
                    for (ForwardingRule rule : rules) {
                        if (rule == null) continue;
                        try {
                            if (ForwardingRuleMatcher.matches(rule, message)) {
                                prefs.recordAutomation(rule.getId());
                                prefs.recordQueueFailure(rule.getId());
                            }
                        } catch (Throwable ignored) { }
                    }
                }
            } catch (Throwable ignored) { }
            reportFailure(null, "Automation queue is full; incoming event was not queued", rejected);
        }
    }

    private void setRuntimeStatus(String status) {
        if (store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
            try { ((app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store).setRuntimeStatus(status); }
            catch (Throwable ignored) { }
        }
    }

    private void reportFailure(String ruleId, String message, Throwable error) {
        String detail = message;
        if (error != null) detail += " (" + error.getClass().getSimpleName() + ")";
        if (store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
            app.template.extension.telegram.SharedPreferencesForwardingRuleStore prefs =
                    (app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store;
            if (ruleId != null) {
                try { prefs.recordQueueFailure(ruleId); } catch (Throwable ignored) { }
            }
            try { prefs.setRuntimeStatus(detail); } catch (Throwable ignored) { }
        }
    }

    private void dispatch(final ForwardingRule rule, final ForwardingMessage message, final long destination) {
        final String key = message.getAccountId() + ":" + rule.getId() + ":" + message.getSourceChatId()
                + ":" + message.getMessageId() + ":" + destination;

        // Claim in-flight and recent state atomically. Never poison the recent set before
        // successfully claiming the in-flight slot.
        synchronized (recentlyDispatched) {
            if (recentlyDispatched.contains(key) || !inFlight.add(key)) return;
            recentlyDispatched.add(key);
            while (recentlyDispatched.size() > MAX_RECENT_KEYS) {
                String oldest = recentlyDispatched.iterator().next();
                recentlyDispatched.remove(oldest);
            }
        }

        final AtomicBoolean queued = new AtomicBoolean(false);
        final AtomicBoolean completed = new AtomicBoolean(false);
        TelegramMessageGateway.ResultCallback callback = new TelegramMessageGateway.ResultCallback() {
            @Override public void onQueued() {
                if (!queued.compareAndSet(false, true)) return;
                // This is a local Telegram queue acceptance, not a server delivery ACK.
                // Keep a distinct metric so the settings screen never overstates delivery.
                if (rule.getDeliveryMode() == ForwardingRule.DeliveryMode.COPY) {
                    if (store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
                        try { ((app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store).recordCopyQueued(rule.getId()); }
                        catch (Throwable ignored) { }
                    }
                    setRuntimeStatus("COPY queued for " + rule.getName() + " → " + destination);
                } else {
                    if (store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
                        try { ((app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store).recordForwardQueued(rule.getId()); }
                        catch (Throwable ignored) { }
                    }
                    setRuntimeStatus("FORWARD queued for " + rule.getName() + " → " + destination);
                }
                inFlight.remove(key);
            }
            @Override public void onSuccess() {
                if (!completed.compareAndSet(false, true)) return;
                inFlight.remove(key);
                if (store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
                    try {
                        app.template.extension.telegram.SharedPreferencesForwardingRuleStore stats =
                                (app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store;
                        if (rule.getDeliveryMode() == ForwardingRule.DeliveryMode.COPY) stats.recordCopied(rule.getId());
                        else stats.recordForwarded(rule.getId());
                    } catch (Throwable ignored) { }
                }
                // Keep recent key after local acceptance to suppress duplicate update delivery.
            }
            @Override public void onFailure(Throwable error) {
                if (!completed.compareAndSet(false, true)) return;
                inFlight.remove(key);
                synchronized (recentlyDispatched) { recentlyDispatched.remove(key); }
                reportFailure(rule.getId(),
                        (rule.getDeliveryMode() == ForwardingRule.DeliveryMode.COPY ? "Copy" : "Forward")
                                + " failed for destination " + destination, error);
            }
        };
        Executor deliveryQueue = rule.getDeliveryMode() == ForwardingRule.DeliveryMode.COPY
                ? copyExecutor : forwardExecutor;
        try {
            deliveryQueue.execute(new Runnable() {
                @Override public void run() {
                    try {
                        if (rule.getDeliveryMode() == ForwardingRule.DeliveryMode.COPY) {
                            gateway.copy(message.getAccountId(), message, destination, rule.isShowSenderName(), callback);
                        } else {
                            gateway.forward(message.getAccountId(), message, destination, rule.isShowSenderName(), callback);
                        }
                    } catch (Throwable error) {
                        callback.onFailure(error);
                    }
                }
            });
        } catch (RuntimeException rejected) {
            // Queue rejection is a real automation failure. Release the de-duplication
            // key in onFailure so a later Telegram update can retry this message.
            callback.onFailure(rejected);
        }
    }
}
