/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.misc;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * The phone model TikTok's effect platform sends (issue #176).
 *
 * <p>Before an effect downloads, the effect platform asks TikTok's server whether the phone can
 * run it, and sends the phone's {@code Build.MODEL} as its {@code device_type}. A refusal comes
 * back as API error 2003 and shows "This effect doesn't work on this device". The patch routes
 * the model strings that feed the effect platform's two config builders through here. While the
 * switch is on they carry a Galaxy S24 Ultra. Sign-in, analytics and every other model read keep
 * the real phone.
 *
 * <p>Off, paused, or a failure in here, and the real model goes out as TikTok has it.
 */
public final class EffectDeviceSpoof {
    /** The model reported while the switch is on. */
    static final String NEWER_MODEL = "SM-S928B";

    private EffectDeviceSpoof() {
    }

    /** Injection point right after each {@code Build.MODEL} read that feeds the effect platform. Never throws. */
    public static String deviceType(String real) {
        try {
            if (!Settings.REPORT_NEWER_PHONE_TO_EFFECTS.get()) return real;
        } catch (Throwable failure) {
            return real;
        }
        Logger.printDebug(() -> "Effect device type: reporting " + NEWER_MODEL + " instead of " + real);
        return NEWER_MODEL;
    }
}
