/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;

import java.lang.reflect.Field;

/**
 * Google Photos: the device-feature answers this install gives instead of the phone's own.
 *
 * Photos asks a {@code Predicate<Object>.test(Object)} for every device feature it knows. The object passed in is
 * that feature; its feature-name String is the only thing we read (the enum's field stays whitelisted, the name is
 * kept by R8 because it is a system feature id). Only the two decisions that matter to backup are answered, and
 * every other question is left to the app.
 */
public final class PhotosDevice {
    static final String KEY = "pixel_spoof";

    /** Google Photos' own feature ids, as the app stores them. */
    private static final String PHOTOS_FEATURE = "com.google.android.apps.photos.";
    private static final String SYSTEM_FEATURE = "com.google.android.feature.";

    private PhotosDevice() {
    }

    /**
     * Injection point, at the start of the feature predicate.
     *
     * @return -1 to let the app ask Android as usual, 0 for "this phone does not have it", 1 for "it has it".
     */
    public static int answer(Object feature) {
        try {
            if (feature == null) return -1;
            Context context = LokiLog.application();
            if (context == null || !LokiSwitches.get(context, KEY)) return -1;

            String name = featureName(feature);
            if (name == null) return -1;
            if (name.endsWith("NEXUS_PRELOAD")) {
                LokiLog.note("photos: reporting the Pixel XL backup entitlement");
                return 1;
            }
            if (name.startsWith(PHOTOS_FEATURE) || name.startsWith(SYSTEM_FEATURE)) {
                if (name.contains("PIXEL_20")) return 0;
            }
            return -1;
        } catch (Throwable error) {
            LokiLog.note("photos: feature answer failed: " + error);
            return -1;
        }
    }

    /** The feature-name String carried by the object, or null when it carries none. */
    private static String featureName(Object feature) {
        Class<?> type = feature.getClass();
        // The enum keeps its name in a String field; read every one and take the feature id.
        while (type != null && type != Object.class) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != String.class) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(feature);
                    if (!(value instanceof String)) continue;
                    String text = (String) value;
                    if (text.startsWith(PHOTOS_FEATURE) || text.startsWith(SYSTEM_FEATURE)) return text;
                } catch (Throwable ignored) {
                    // A field the platform refuses to open is simply not the one we need.
                }
            }
            type = type.getSuperclass();
        }
        return null;
    }

    // region Device identity (what every upload tells Google's server)

    /** Original Pixel XL, Android 10 - the same build the device that ships unlimited backup reported. */
    private static final String FINGERPRINT = "google/marlin/marlin:10/QP1A.191005.007.A3/5972272:user/release-keys";
    private static final String BUILD_ID = "QP1A.191005.007.A3";

    /** -1 not read yet, 0 off, 1 on. Read once per process: Photos copies these values when it starts. */
    private static volatile int identity = -1;

    private static boolean identityOn() {
        int known = identity;
        if (known >= 0) return known == 1;
        Context context = LokiLog.application();
        if (context == null) return true; // too early to read the switch: the patch's default (on) applies
        boolean on = LokiSwitches.get(context, KEY);
        identity = on ? 1 : 0;
        if (on) LokiLog.debug("photos: this phone reports itself as a Pixel XL (Google marlin)");
        return on;
    }

    private static String pick(String spoof, String real) {
        try {
            return identityOn() ? spoof : real;
        } catch (Throwable error) {
            return real;
        }
    }

    // Injection points: one per android.os.Build field, called right after the app reads it.
    public static String buildMODEL(String real) { return pick("Pixel XL", real); }
    public static String buildDEVICE(String real) { return pick("marlin", real); }
    public static String buildPRODUCT(String real) { return pick("marlin", real); }
    public static String buildBOARD(String real) { return pick("marlin", real); }
    public static String buildHARDWARE(String real) { return pick("marlin", real); }
    public static String buildBRAND(String real) { return pick("google", real); }
    public static String buildMANUFACTURER(String real) { return pick("Google", real); }
    public static String buildFINGERPRINT(String real) { return pick(FINGERPRINT, real); }
    public static String buildID(String real) { return pick(BUILD_ID, real); }
    public static String buildDISPLAY(String real) { return pick(BUILD_ID, real); }
    public static String buildTAGS(String real) { return pick("release-keys", real); }
    public static String buildTYPE(String real) { return pick("user", real); }

    // endregion

    // region Camera folder

    static final String CAMERA_ONLY = "photos_camera_only";

    /**
     * Injection point, at the start of Photos' "is this file in the camera folder?" check.
     *
     * Photos counts everything under DCIM as camera roll, so on Samsung and most other phones screenshots
     * (DCIM/Screenshots) and other apps' DCIM folders are uploaded with Camera and cannot be switched off.
     *
     * @return -1 to let Photos decide, 1 for a real camera folder, 0 for anything else.
     */
    public static int cameraFolder(String path) {
        try {
            Context context = LokiLog.application();
            if (context == null || !LokiSwitches.get(context, CAMERA_ONLY)) return -1;
            if (path == null) return 0;
            String lower = path.toLowerCase(java.util.Locale.US);
            if (lower.contains("/dcim/camera/") || lower.endsWith("/dcim/camera")) return 1;
            // Pixel's own camera volume, which Photos already treats as camera roll.
            if (lower.contains("cafef00d2019/camera")) return 1;
            return 0;
        } catch (Throwable error) {
            return -1;
        }
    }

    // endregion
}
