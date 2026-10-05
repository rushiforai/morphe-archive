/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.Activity;
import android.content.Intent;
import android.os.Looper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Replaces the pin recipient picker with Android's ordinary text sharing sheet. */
public final class SystemShare {
    private SystemShare() {}

    public static boolean open(Object pin, Object source) {
        HookStatus.invoked(FamilyNames.SYSTEM_SHARE);
        return openUrl(PinMedia.pinUrl(pin), source);
    }

    public static boolean openSendable(Object sendable, Object source) {
        HookStatus.invoked(FamilyNames.SYSTEM_SHARE);
        return openUrl(sendablePinUrl(sendable), source);
    }

    private static boolean openUrl(String url, Object source) {
        if (!Utils.settingsReady() || !PatchFamily.Capability.PIN_SHARE.installed() ||
                !Settings.SYSTEM_SHARE.get()) return false;
        try {
            if (source instanceof Enum<?>) {
                String name = ((Enum<?>) source).name();
                if ("SCREENSHOT".equals(name) || "DOWNLOAD".equals(name)) return false;
            }
            Activity activity = Utils.getActivity();
            if (url == null || activity == null || activity.isFinishing() || activity.isDestroyed() ||
                    Looper.myLooper() != Looper.getMainLooper()) return false;
            Intent send = new Intent(Intent.ACTION_SEND).setType("text/plain")
                    .putExtra(Intent.EXTRA_TEXT, url);
            activity.startActivity(Intent.createChooser(send, L10n.t("Share pin")));
            HookStatus.counted(FamilyNames.SYSTEM_SHARE, "pin sent to Android share sheet");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_SHARE, "open share sheet", failure);
            return false;
        }
    }

    private static String sendablePinUrl(Object sendable) {
        try {
            if (sendable == null) return null;
            int type = intValue(sendable, "c", -1, "d", "c");
            if (type != 0) return null;
            String id = stringValue(sendable, "e", "a");
            if (id == null || !id.matches("[0-9]{1,30}")) return null;
            return "https://www.pinterest.com/pin/" + id + "/";
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SYSTEM_SHARE, "read sendable pin", failure);
            return null;
        }
    }

    private static int intValue(Object target, String field, int fallback, String... methods) throws Exception {
        for (String method : methods) {
            try {
                Method reader = target.getClass().getDeclaredMethod(method);
                reader.setAccessible(true);
                Object value = reader.invoke(target);
                if (value instanceof Number) return ((Number) value).intValue();
            } catch (ReflectiveOperationException missingMethod) {
                // Try the next known accessor, then the stored field.
            }
        }
        Field stored = target.getClass().getDeclaredField(field);
        stored.setAccessible(true);
        Object value = stored.get(target);
        return value instanceof Number ? ((Number) value).intValue() : fallback;
    }

    private static String stringValue(Object target, String method, String field) throws Exception {
        try {
            Method reader = target.getClass().getDeclaredMethod(method);
            reader.setAccessible(true);
            Object value = reader.invoke(target);
            return value instanceof String ? (String) value : null;
        } catch (ReflectiveOperationException missingMethod) {
            Field stored = target.getClass().getDeclaredField(field);
            stored.setAccessible(true);
            Object value = stored.get(target);
            return value instanceof String ? (String) value : null;
        }
    }
}
