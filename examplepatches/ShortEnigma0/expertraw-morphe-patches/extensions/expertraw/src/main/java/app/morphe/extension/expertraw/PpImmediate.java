/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Expert RAW extension for Morphe. See LICENSE and NOTICE in the repository root.
 */
package app.morphe.extension.expertraw;

import android.util.Log;
import com.samsung.android.app.galaxyraw.core2.processor.request.ProcessRequestImpl;

/**
 * MOD: Expert RAW normally parks its post-processing request until the camera goes to background
 * ("Refining image" notification later). A single-frame request (our bypass) is processed right
 * away and without the progress notification. Lab modes and multi-frame shots keep stock behaviour.
 */
@SuppressWarnings("unused")
public final class PpImmediate {
    /** True while the request being processed is a single-frame bypass shot. */
    public static volatile boolean quiet;

    private PpImmediate() {}

    public static boolean processNow(ProcessRequestImpl r) {
        boolean now = false;
        if (r != null) {
            int ds = r.getDsCondition();
            int mode = ds >>> 16;
            now = (mode == 0xAA || mode == 0xB0) && (ds & 0xFF) == 1;
        }
        if (now != quiet) Log.i("GrawMod", "immediate single-frame processing: " + now);
        quiet = now;
        return now;
    }

    /** Called from PostProcessNotificationManager.sendMessage: drop the notification-showing messages. */
    public static boolean suppressNotification(Enum<?> msg) {
        if (!quiet || msg == null) return false;
        String n = msg.name();
        return "START_FOREGROUND".equals(n) || "SET_PROGRESS".equals(n);
    }
}
