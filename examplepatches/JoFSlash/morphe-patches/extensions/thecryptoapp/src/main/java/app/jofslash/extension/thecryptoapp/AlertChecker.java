package app.jofslash.extension.thecryptoapp;

import android.content.Context;
import android.util.Log;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Evaluates all enabled rules against freshly fetched prices and posts notifications for the ones
 * whose condition is now met. One batched fetch per source (see {@link PriceFetcher}). Blocking;
 * always called off the main thread. Never throws to its caller.
 */
public final class AlertChecker {

    static final String TAG = CustomAlerts.TAG;

    /** After firing, a rule won't fire again for this long unless the price crosses back first. */
    private static final long COOLDOWN_MS = 30L * 60L * 1000L;

    private AlertChecker() {
    }

    /** One check at a time, so the start-up, alarm and "Check now" runs can't double-notify. */
    private static final Object RUN_LOCK = new Object();

    public static void checkNow(Context ctx) {
        synchronized (RUN_LOCK) {
            run(ctx);
        }
    }

    private static void run(Context ctx) {
        try {
            Context app = ctx.getApplicationContext();
            List<AlertRule> rules = AlertStore.load(app);
            Set<String> symbols = new LinkedHashSet<>();
            int enabled = 0;
            for (AlertRule r : rules) {
                if (r.enabled && r.symbol != null && !r.symbol.isEmpty()) {
                    enabled++;
                    symbols.add(r.symbol);
                }
            }
            Log.i(TAG, "check: start (" + rules.size() + " rules, " + enabled + " enabled)");
            if (enabled == 0) {
                Log.i(TAG, "check: nothing enabled, done");
                return;
            }

            PriceFetcher.PriceMap pm = PriceFetcher.fetchAll(app, symbols);

            // 24h change, only for symbols that have a percent rule.
            Set<String> pctSymbols = new LinkedHashSet<>();
            for (AlertRule r : rules) if (r.enabled && r.isPercent()) pctSymbols.add(r.symbol);
            Map<String, Double> changes = pctSymbols.isEmpty()
                    ? java.util.Collections.emptyMap()
                    : PriceFetcher.fetchChanges(app, pctSymbols);

            for (String s : symbols) {
                Double p = pm.prices.get(s);
                Log.i(TAG, "check: " + s + " = "
                        + (p == null ? "unavailable" : ("$" + p + (pm.stale.contains(s) ? " (stale)" : "")))
                        + (changes.get(s) != null ? (" 24h " + changes.get(s) + "%") : ""));
            }

            // Evaluate against a FRESH copy of the rules, inside the store lock: the fetch above
            // can take seconds, and the user may add, edit, toggle or delete rules meanwhile. Saving
            // the snapshot from the top would undo those changes (a deleted rule would come back).
            final long now = System.currentTimeMillis();
            final Map<String, Double> pcts = changes;
            AlertStore.mutate(app, current -> {
                for (AlertRule r : current) {
                    if (!r.enabled || !symbols.contains(r.symbol)) continue;
                    evaluate(app, r, pm, pcts, now);
                }
            });
            Log.i(TAG, "check: done");
        } catch (Throwable t) {
            Log.e(TAG, "check: unexpected failure", t);
        }
    }

    /** Records the latest readings on [r] and fires its notification when the condition is met. */
    private static void evaluate(Context app, AlertRule r, PriceFetcher.PriceMap pm,
                                 Map<String, Double> changes, long now) {
        Double price = pm.prices.get(r.symbol);
        Double pct = changes.get(r.symbol);

        // Record the latest readings for the UI. Only bump the checked-time on a fresh price, so a
        // stale (rate-limited) reading keeps the old timestamp.
        if (price != null) {
            r.lastPrice = price;
            r.hasLastPrice = true;
            if (!pm.stale.contains(r.symbol)) r.lastCheckedAt = now;
        }
        if (pct != null) {
            r.lastPct = pct;
            r.hasLastPct = true;
        }

        // Percent rules need a pct; absolute rules need a price.
        if (r.isPercent() ? (pct == null) : (price == null)) return;

        if (r.conditionMet(price == null ? 0d : price, pct)) {
            boolean cooled = r.lastTriggeredAt == 0L || (now - r.lastTriggeredAt) > COOLDOWN_MS;
            if (cooled) {
                // Notifications off: leave the rule as it is, so it fires once they are back on.
                if (!AlertNotifier.notifyRule(app, r, price, pct)) return;
                r.lastTriggeredAt = now;
                if (!r.repeat) {
                    // One-time: disable after firing.
                    r.enabled = false;
                    Log.i(TAG, "check: " + r.displayName + " one-time fired, disabling");
                }
            } else {
                Log.i(TAG, "check: " + r.displayName + " met but in cooldown");
            }
        } else if (r.lastTriggeredAt != 0L) {
            // Crossed back; re-arm so it can fire again next time.
            r.lastTriggeredAt = 0L;
        }
    }
}
