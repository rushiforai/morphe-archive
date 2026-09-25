/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.content.ClipData;
import android.content.ClipboardManager;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Clipboard reads answered without touching the real clipboard while the switch is on.
 *
 * <p>One method per intercepted signature, each returning what the call site expects. A single
 * helper returning {@link ClipData} for all three handed a ClipData back where getText's
 * CharSequence and hasPrimaryClip's boolean were expected, and the verifier rejects that class
 * as soon as it loads rather than failing at the call.
 */
@SuppressWarnings("unused")
public final class DevicePrivacyGuard {

    private static boolean blocks(String what) {
        if (Utils.getContext() != null && !Settings.BLOCK_CLIPBOARD_READS.get()) return false;
        Logger.printInfo(() -> "Device privacy guard: " + what);
        return true;
    }

    public static ClipData interceptPrimaryClip(ClipboardManager manager) {
        if (blocks("blocked a getPrimaryClip read")) return null;
        return manager.getPrimaryClip();
    }

    public static CharSequence interceptClipboardText(ClipboardManager manager) {
        if (blocks("blocked a getText read")) return "";
        return manager.getText();
    }

    public static boolean interceptHasPrimaryClip(ClipboardManager manager) {
        if (blocks("answered hasPrimaryClip as false")) return false;
        return manager.hasPrimaryClip();
    }

    private DevicePrivacyGuard() {}
}
