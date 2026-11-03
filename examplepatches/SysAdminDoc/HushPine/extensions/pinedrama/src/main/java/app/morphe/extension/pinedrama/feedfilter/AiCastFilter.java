/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.feedfilter;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.Settings;

/**
 * The camera's AI Cast button, PineDrama's AI Self feature (AI Theater in its code).
 *
 * <p>The recorder adds the AI Theater toolbar component only when one gate says yes. That gate
 * already says no for minors, duets, stories, the DM camera and templates, so a no here is a
 * camera PineDrama knows how to build. The answer is read each time a camera is built.
 */
@SuppressWarnings("unused")
public final class AiCastFilter {
    private static final String HOOK_FAMILY = "AI Cast";

    private AiCastFilter() {
    }

    /** True to leave the AI Cast button out of the camera being built. */
    public static boolean shouldHideRecordEntrance() {
        boolean enabled = Settings.HIDE_AI_CAST.get();
        HookStatus.bound(HOOK_FAMILY, "camera button " + (enabled ? "hidden" : "left"));
        return enabled;
    }
}
