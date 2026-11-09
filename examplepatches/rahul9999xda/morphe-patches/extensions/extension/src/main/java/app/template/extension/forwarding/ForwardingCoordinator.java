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
    private final Set<String> inFlight = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private final LinkedHashSet<String> recentlyDispatched = new LinkedHashSet<>();
    private static final int MAX_RECENT_KEYS = 2048;
    private volatile boolean running;

    public ForwardingCoordinator(ForwardingRuleStore store, TelegramMessageGateway gateway, Executor executor) {
        if (store == null || gateway == null || executor == null) throw new IllegalArgumentException("Dependencies are required");
        this.store = store;
        this.gateway = gateway;
        this.executor = executor;
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
                    catch (Throwable ignored) { return; }
                    if (rules == null) return;
                    for (ForwardingRule rule : rules) {
                        if (!running) return;
                        if (rule == null) continue;
                        final boolean matches;
                        try { matches = ForwardingRuleMatcher.matches(rule, message); }
                        catch (Throwable ignored) { continue; }
                        if (!matches) continue;
                        if (store instanceof app.template.extension.telegram.SharedPreferencesForwardingRuleStore) {
                            try { ((app.template.extension.telegram.SharedPreferencesForwardingRuleStore) store).recordAutomation(rule.getId()); }
                            catch (Throwable ignored) { /* stats must not block delivery */ }
                        }
                        Set<Long> destinations = rule.getDestinationChatIds();
                        if (destinations == null) continue;
                        for (Long destination : destinations) {
                            if (!running) return;
                            if (destination == null || destination.longValue() == message.getSourceChatId()) continue;
                            dispatch(rule, message, destination.longValue());
                        }
                    }
                }
            });
        } catch (RuntimeException rejected) {
            // A rejected event is not marked as handled; a later Telegram update can retry it.
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

        final AtomicBoolean completed = new AtomicBoolean(false);
        TelegramMessageGateway.ResultCallback callback = new TelegramMessageGateway.ResultCallback() {
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
            }
        };
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
}
