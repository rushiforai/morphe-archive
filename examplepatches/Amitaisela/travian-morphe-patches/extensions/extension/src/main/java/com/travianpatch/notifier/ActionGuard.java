package com.travianpatch.notifier;

import java.util.Map;

/** Decides whether one game action may be sent now. Pure logic, no Android APIs. */
final class ActionGuard {

    /**
     * The exact shapes of the only request paths that may ever be sent (whole-path match, digits only for
     * ids). Anything else - other endpoints, every /premium (gold) path, "..", query strings, encoded
     * characters, doubled slashes - is refused.
     */
    static final java.util.regex.Pattern[] ALLOWED = {
            java.util.regex.Pattern.compile("/building/build/[0-9]{1,3}"),
            java.util.regex.Pattern.compile("/building/cancel/[0-9]{1,12}"),
            java.util.regex.Pattern.compile("/building/[0-9]{1,12}/train(Units)?"),
            java.util.regex.Pattern.compile("/units/(research|improve)"),
            java.util.regex.Pattern.compile("/farm-list/send"),
            java.util.regex.Pattern.compile("/village/change-current"),
            java.util.regex.Pattern.compile("/village/[0-9]{1,12}/celebrations/start"),
            java.util.regex.Pattern.compile("/troop/send"),
            java.util.regex.Pattern.compile("/hero/auction/bid"),
            java.util.regex.Pattern.compile("/hero/auction/sell-item"),
    };
    static final long DEDUPE_MS = 60_000L;

    static final class Input {
        String path;
        boolean automated;
        boolean masterOn;
        boolean dryRun;
        long nowMs;
        long nextAttackLandingMs;
        /** The user's "pause when an attack lands soon" switch; off means attacks never pause automation. */
        boolean attackPauseOn;
        int attackPauseMinutes;
        /** Troop escape: it exists to act while an attack is coming, so the attack pause doesn't stop it. */
        boolean passesAttackPause;
        /** Inside the user's quiet hours (Auto-build timing): every automatic action waits, escape included. */
        boolean quietNow;
        String dedupeKey;
        Map<String, Long> recentKeys;
    }

    static final class Verdict {
        final boolean allowed;
        final String reason;

        Verdict(boolean allowed, String reason) {
            this.allowed = allowed;
            this.reason = reason;
        }
    }

    static Verdict check(Input in) {
        if (in.path == null || in.path.startsWith("/premium")) {
            return new Verdict(false, "gold actions are never sent");
        }
        if (!pathAllowed(in.path)) {
            return new Verdict(false, "not an allowed action: " + in.path);
        }
        if (in.automated && !in.masterOn) {
            return new Verdict(false, "automation is off");
        }
        if (in.automated && in.quietNow) {
            return new Verdict(false, "quiet hours (Settings → Auto-build timing)");
        }
        if (in.automated && !in.passesAttackPause && in.attackPauseOn && in.nextAttackLandingMs > 0
                && in.nextAttackLandingMs - in.nowMs < in.attackPauseMinutes * 60_000L) {
            return new Verdict(false, "paused: an attack lands soon");
        }
        Long last = in.recentKeys == null ? null : in.recentKeys.get(in.dedupeKey);
        if (last != null && in.nowMs - last < DEDUPE_MS) {
            return new Verdict(false, "already sent less than a minute ago");
        }
        return new Verdict(true, in.dryRun ? "dry run" : "ok");
    }

    static boolean pathAllowed(String path) {
        if (path == null) {
            return false;
        }
        for (java.util.regex.Pattern p : ALLOWED) {
            if (p.matcher(path).matches()) {
                return true;
            }
        }
        return false;
    }
}
