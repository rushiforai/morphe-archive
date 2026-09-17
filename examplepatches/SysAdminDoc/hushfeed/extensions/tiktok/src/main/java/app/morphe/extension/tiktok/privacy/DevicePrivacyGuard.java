/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.content.ClipData;
import android.content.ClipboardManager;

import app.morphe.extension.shared.Logger;

/**
 * Clipboard reads answered without touching the real clipboard.
 *
 * <p>One method per intercepted signature, each returning what the call site expects. A single
 * helper returning {@link ClipData} for all three handed a ClipData back where getText's
 * CharSequence and hasPrimaryClip's boolean were expected, and the verifier rejects that class
 * as soon as it loads rather than failing at the call.
 */
@SuppressWarnings("unused")
public final class DevicePrivacyGuard {

    public static ClipData interceptPrimaryClip(ClipboardManager manager) {
        Logger.printInfo(() -> "Device privacy guard: blocked a getPrimaryClip read");
        return null;
    }

    public static CharSequence interceptClipboardText(ClipboardManager manager) {
        Logger.printInfo(() -> "Device privacy guard: blocked a getText read");
        return "";
    }

    public static boolean interceptHasPrimaryClip(ClipboardManager manager) {
        Logger.printInfo(() -> "Device privacy guard: answered hasPrimaryClip as false");
        return false;
    }

    private DevicePrivacyGuard() {}
}
