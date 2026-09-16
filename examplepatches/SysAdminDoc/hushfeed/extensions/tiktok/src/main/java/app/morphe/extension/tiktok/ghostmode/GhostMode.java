/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 * Follows eduardo3677-ai/tiktok-patches-for-morphe.
 */
package app.morphe.extension.tiktok.ghostmode;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Answers TikTok's own reporting calls so they return before sending anything. This stops
 * the client telling other people what you looked at; it cannot take back what the server
 * already recorded, and a viewer list can still fill up from another device.
 *
 * <h2>Why the answers are reported</h2>
 *
 * <p>An export taken while another person's profile showed no follower counts could not say
 * whether the hooked call had run for that page, what it answered, or whether TikTok's Profile
 * views feature was asking at all: two exports on 2026-09-15, one with the setting on and one
 * with it off, carried no ghost-mode line of any kind. That left a reported defect with two
 * builds' worth of failed reproduction and no way to tell a hooked call from a call that never
 * happened. So each answer is recorded, and the three states a reader needs are separable in
 * the export:
 *
 * <ul>
 *   <li>no ghost mode family at all: the patch is not in this build;
 *   <li>the family with only {@code installed}: the patch is in and no reporter was reached;
 *   <li>a call site's own entry: that reporter was reached, and the log line says what it got.
 * </ul>
 *
 * <p>Nothing here names an account or a handle, in line with the rest of the report.
 */
public final class GhostMode {
    /** How this appears in the export's hook status section. */
    private static final String HOOK_FAMILY = "ghost mode";

    private static final String INSTALLED = "installed";
    private static final String STORY_VIEW = "story view";
    private static final String PROFILE_VIEW = "profile view";
    private static final String TYPING_STATUS = "typing status";

    private static final String BLOCKED = "blocked";
    private static final String SENT = "sent";

    /**
     * The last answer written for each call site.
     *
     * <p>The typing indicator asks on a timer while a message is being written, so a line per
     * call would push everything else out of a buffer a reader is trying to read. A steady
     * state is worth one line; what a reader needs is the change and the fact it happened.
     */
    private static final Map<String, String> reported = new ConcurrentHashMap<>();

    private GhostMode() {
    }

    /**
     * Called once where the settings load, so the family is in the export even on a run where
     * no reporter is reached. Without it, a missing family says both "not patched" and "never
     * called" and a reader cannot tell which.
     */
    public static void installed() {
        HookStatus.bound(HOOK_FAMILY, INSTALLED);
    }

    public static boolean shouldBlockStoryView() {
        return answer(STORY_VIEW);
    }

    public static boolean shouldBlockProfileView() {
        return answer(PROFILE_VIEW);
    }

    public static boolean shouldBlockTypingStatus() {
        return answer(TYPING_STATUS);
    }

    /** The setting, recorded against the call site that asked for it. */
    private static boolean answer(String callSite) {
        boolean blocked = Settings.GHOST_MODE.get();
        String outcome = blocked ? BLOCKED : SENT;
        HookStatus.bound(HOOK_FAMILY, callSite + " " + outcome);
        if (!outcome.equals(reported.put(callSite, outcome))) {
            Logger.diagnosticInfo(
                    DiagnosticCategory.OTHER,
                    "GhostMode",
                    () -> "Ghost mode " + callSite + ": " + outcome);
        }
        return blocked;
    }
}
