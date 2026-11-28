/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.warunglife;

import android.content.Context;
import android.content.SharedPreferences;

import java.security.SecureRandom;

/** Generates and persists a random 16-hex-char device ID in place of Settings.Secure.ANDROID_ID. */
public final class DeviceId {
    private static final String PREFS = "fakh_device";
    private static final String KEY = "android_id";
    private static final char[] HEX = "0123456789abcdef".toCharArray();
    private static volatile String cached;

    private DeviceId() {
    }

    /** Returns a per-install random 16-char hex ID without reading the real ANDROID_ID. */
    public static String get(Context context) {
        String id = cached;
        if (id != null) {
            return id;
        }
        synchronized (DeviceId.class) {
            id = cached;
            if (id != null) {
                return id;
            }
            if (context != null) {
                SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
                id = prefs.getString(KEY, null);
                if (id == null || id.length() != 16) {
                    id = randomHex();
                    prefs.edit().putString(KEY, id).apply();
                }
            } else {
                id = randomHex();
            }
            cached = id;
            return id;
        }
    }

    private static String randomHex() {
        byte[] bytes = new byte[8];
        new SecureRandom().nextBytes(bytes);
        char[] out = new char[16];
        for (int i = 0; i < 8; i++) {
            int b = bytes[i] & 0xFF;
            out[i * 2] = HEX[b >>> 4];
            out[i * 2 + 1] = HEX[b & 0x0F];
        }
        return new String(out);
    }
}
