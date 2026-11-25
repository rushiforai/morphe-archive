package dev.materialtidal.extension.tidal.crossfade;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Thread-safe persistent preferences for live Crossfade curve, blend strength, and gapless-album
 * preservation. Volatile fields allow zero-allocation reads from the 40 Hz audio fade loop, while
 * isolating Android {@link SharedPreferences} access in {@link Store} keeps {@link CrossfadePrefs}
 * and {@link CrossfadeEngine} directly loadable in desktop JVM unit tests.
 */
@SuppressWarnings("unused")
public final class CrossfadePrefs {

    private static final String PREFS_NAME = "materialtidal_crossfade";
    private static final String KEY_CURVE_TYPE = "curve_type";
    private static final String KEY_STRENGTH_PERCENT = "strength_percent";
    private static final String KEY_PRESERVE_GAPLESS_ALBUMS = "preserve_gapless_albums";

    private static volatile Object prefsRef;
    private static volatile boolean initialized;

    private static volatile int cachedCurveType = clampCurve(CrossfadeConfig.getDefaultCurveType());
    private static volatile int cachedStrengthPercent = clampStrength(CrossfadeConfig.getDefaultStrengthPercent());
    private static volatile boolean cachedPreserveGaplessAlbums = CrossfadeConfig.isDefaultPreserveGaplessAlbums();

    private CrossfadePrefs() {
    }

    public static void init(Object contextObj) {
        if (contextObj == null) {
            return;
        }
        synchronized (CrossfadePrefs.class) {
            if (initialized && prefsRef != null) {
                return;
            }
            Store.loadFromContext(contextObj);
            initialized = true;
        }
    }

    public static void ensureInitialized(Object contextObj) {
        if (!initialized && contextObj != null) {
            init(contextObj);
        }
    }

    public static int getCurveType() {
        return cachedCurveType;
    }

    public static void setCurveType(int curveType) {
        int clamped = clampCurve(curveType);
        cachedCurveType = clamped;
        Object sp = prefsRef;
        if (sp != null) {
            Store.putInt(sp, KEY_CURVE_TYPE, clamped);
        }
        notifyStyleRow();
    }

    public static int getStrengthPercent() {
        return cachedStrengthPercent;
    }

    public static void setStrengthPercent(int strengthPercent) {
        int clamped = clampStrength(strengthPercent);
        cachedStrengthPercent = clamped;
        Object sp = prefsRef;
        if (sp != null) {
            Store.putInt(sp, KEY_STRENGTH_PERCENT, clamped);
        }
        notifyStyleRow();
    }

    public static boolean isPreserveGaplessAlbums() {
        return cachedPreserveGaplessAlbums;
    }

    public static void setPreserveGaplessAlbums(boolean preserve) {
        cachedPreserveGaplessAlbums = preserve;
        Object sp = prefsRef;
        if (sp != null) {
            Store.putBoolean(sp, KEY_PRESERVE_GAPLESS_ALBUMS, preserve);
        }
        notifyStyleRow();
    }

    public static int clampCurve(int curveType) {
        if (curveType < CrossfadeConfig.CURVE_EQUAL_POWER) {
            return CrossfadeConfig.CURVE_EQUAL_POWER;
        }
        if (curveType > CrossfadeConfig.CURVE_DJ_BLEND) {
            return CrossfadeConfig.CURVE_DJ_BLEND;
        }
        return curveType;
    }

    public static int clampStrength(int strengthPercent) {
        if (strengthPercent < 0) {
            return 0;
        }
        if (strengthPercent > 100) {
            return 100;
        }
        return strengthPercent;
    }

    private static void notifyStyleRow() {
        if (prefsRef == null) {
            return;
        }
        try {
            CrossfadeTidalBridge.notifySettingsStyleItemChanged();
        } catch (Throwable ignored) {
        }
    }

    private static final class Store {
        static void loadFromContext(Object contextObj) {
            if (!(contextObj instanceof Context)) {
                return;
            }
            Context context = (Context) contextObj;
            Context appCtx = context.getApplicationContext();
            if (appCtx == null) {
                appCtx = context;
            }
            SharedPreferences sp = appCtx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            prefsRef = sp;
            cachedCurveType = clampCurve(sp.getInt(KEY_CURVE_TYPE, CrossfadeConfig.getDefaultCurveType()));
            cachedStrengthPercent = clampStrength(sp.getInt(KEY_STRENGTH_PERCENT, CrossfadeConfig.getDefaultStrengthPercent()));
            cachedPreserveGaplessAlbums = sp.getBoolean(
                    KEY_PRESERVE_GAPLESS_ALBUMS,
                    CrossfadeConfig.isDefaultPreserveGaplessAlbums()
            );
        }

        static void putInt(Object spObj, String key, int value) {
            try {
                ((SharedPreferences) spObj).edit().putInt(key, value).apply();
            } catch (Throwable ignored) {
            }
        }

        static void putBoolean(Object spObj, String key, boolean value) {
            try {
                ((SharedPreferences) spObj).edit().putBoolean(key, value).apply();
            } catch (Throwable ignored) {
            }
        }
    }
}
