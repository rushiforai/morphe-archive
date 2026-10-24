package app.template.extension.pdb;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;

/**
 * Client-side limit extensions — the {@code Pdb Extras → Limits} tab.
 *
 * <p>Pdb enforces two different kinds of limit:
 *
 * <ul>
 *   <li><b>Server-side</b> — e.g. the premium Soul filters ({@code PUT
 *       /api/v2/irl/feeds/filters} answers "need to be pro user to access"). No
 *       client patch can change those; they follow the real subscription.</li>
 *   <li><b>Client-side</b> — counters the app keeps in its own MMKV store and
 *       compares locally. These are the ones worth extending, and the ones this
 *       class covers.</li>
 * </ul>
 *
 * <p>Known client-side limits today:
 *
 * <ol>
 *   <li><b>Profile-visitor limit</b> — {@code Lnjf} keeps {@code visitsViewCount}
 *       and {@code visitsCardClickCount} inside a rolling one-hour window
 *       ({@code visitsViewWindowStart} / {@code visitsCardClickWindowStart},
 *       0x36EE80 ms) and shows its "slow down" popup once either reaches 3, at
 *       most twice a day. {@link VisitorLimitPatch} routes the comparison through
 *       {@link #visitorLimitReached(int, int)} so the switch can lift it.</li>
 *   <li><b>Daily counters</b> — {@code irlLiked}, {@code irlReplyCount},
 *       {@code irlSwiped}, {@code irlTotalLiked}, {@code enterChatTimes},
 *       {@code likeProgressGoingDone}, …, each keyed by day. {@link
 *       #resetDailyCounters(Context)} drops them so the app's own arithmetic
 *       starts from zero again instead of waiting for tomorrow; deleting the key
 *       (not writing 0) keeps MMKV's per-key type intact.</li>
 * </ol>
 */
public final class PdbLimits {

    /**
     * Mirrors the "No profile-visitor limit" switch. {@code public static volatile}
     * on purpose: {@link PdbStartup} writes it at app start and the patched
     * bytecode in {@code Lnjf;->invoke()} reads it, so it must not be inlined by R8.
     */
    public static volatile boolean NO_VISITOR_LIMIT = false;

    /** The app's own limit: 3 visitor views or 3 visitor-card clicks per hour. */
    private static final int VISITOR_LIMIT = 3;

    /** Keys the app uses for its day-scoped counters, matched by prefix. */
    private static final String[] COUNTER_PREFIXES = {
        // Soul / IRL feed counters (keyed irlLiked_<uid>, irlReplyCount_<uid>, …).
        "irlLiked", "irlReplyCount", "irlSwiped", "irlSkipped",
        "irlTotalLiked", "irlLikeProfile", "irlLikeReplyChoice",
        "irlRewardDone", "irlCounting_day_", "irlCompleteProfileTimes",
        // Profile-visitor window.
        "visitsViewCount", "visitsViewWindowStart",
        "visitsCardClickCount", "visitsCardClickWindowStart",
        "visitPopupCount", "visitPopupDate",
        // Chat entry + like-progress nudges.
        "enterChatTimes", "likeProgressGoingDone",
    };

    private PdbLimits() {}

    /**
     * Called from the patched {@code Lnjf;->invoke()} in place of the original
     * {@code viewCount >= 3 || clickCount >= 3} comparison.
     *
     * @return {@code true} when the app's "you have seen enough visitors for now"
     *     path should run; {@code false} while the switch is on.
     */
    public static boolean visitorLimitReached(int viewCount, int clickCount) {
        if (NO_VISITOR_LIMIT) return false;
        return viewCount >= VISITOR_LIMIT || clickCount >= VISITOR_LIMIT;
    }

    /**
     * Deletes the app's day-scoped counters from every MMKV store.
     *
     * <p>Removing the key rather than writing a zero matters: MMKV is typed per
     * key, so overwriting an int-typed entry with a string — or the reverse —
     * makes the app's own read throw. A removed key simply reports the caller's
     * default, which is exactly "nothing done today yet".
     *
     * @return a human-readable report of what was dropped.
     */
    public static String resetDailyCounters(Context ctx) {
        PdbMmkv.init(ctx);
        StringBuilder sb = new StringBuilder();
        int total = 0;
        for (String id : PdbMmkv.ids()) {
            List<String> dropped = new ArrayList<>();
            for (String key : PdbMmkv.keys(id)) {
                if (isCounter(key)) dropped.add(key);
            }
            if (dropped.isEmpty()) continue;
            SharedPreferences sp = PdbMmkv.storeFor(id);
            if (sp == null) continue;
            SharedPreferences.Editor e = sp.edit();
            for (String key : dropped) e.remove(key);
            e.apply();
            total += dropped.size();
            sb.append('\n').append(id).append("  \u2014 ").append(dropped.size()).append(" key(s)\n");
            for (String key : dropped) sb.append("    ").append(key).append('\n');
        }
        if (total == 0) {
            return "No client-side counters found \u2014 nothing to reset.";
        }
        return "Reset " + total + " counter key(s). The app reads them fresh on the "
            + "next screen load, so daily allowances start over."
            + sb;
    }

    /** Every counter key the app currently holds, with its value — read-only. */
    public static String counterReport(Context ctx) {
        PdbMmkv.init(ctx);
        StringBuilder sb = new StringBuilder();
        int total = 0;
        for (String id : PdbMmkv.ids()) {
            List<String> keys = new ArrayList<>();
            for (String key : PdbMmkv.keys(id)) {
                if (isCounter(key)) keys.add(key);
            }
            if (keys.isEmpty()) continue;
            sb.append('\n').append(id).append('\n');
            for (String key : keys) {
                String value = PdbMmkv.value(id, key);
                sb.append("  ").append(key).append(" = ").append(value).append('\n');
                total++;
            }
        }
        if (total == 0) {
            return "No client-side counters stored yet on this device.";
        }
        sb.insert(0, total + " counter key(s) in the app's own store:\n");
        sb.append("\nThese are what the app compares locally. Server-side caps "
            + "(premium Soul filters, coin/boost budgets) are not in this list.");
        return sb.toString();
    }

    private static boolean isCounter(String key) {
        if (key == null) return false;
        for (String prefix : COUNTER_PREFIXES) {
            if (key.startsWith(prefix)) return true;
        }
        return false;
    }
}
