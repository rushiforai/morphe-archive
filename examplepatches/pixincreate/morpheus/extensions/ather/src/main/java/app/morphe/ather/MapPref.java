package app.morphe.ather;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import com.ather.maps.a0;

/**
 * Map-provider preference applied on top of Ather's own resolver.
 *
 * The patched {@code com.ather.maps.usecase.b} routes the provider it resolved
 * through {@link #apply(a0)}. The stored preference decides the final provider:
 *
 * <ul>
 *   <li>{@code auto} (default): keep Ather's choice, but if it is Google Maps and
 *       Google Play services is not installed, fall back to OSM. This is the
 *       GrapheneOS-safe default.</li>
 *   <li>{@code google} / {@code mmi} / {@code osm}: force that provider.</li>
 * </ul>
 *
 * The preference is read from and written to {@code SharedPreferences} file
 * {@link #PREFS}. {@link MorpheMapSettingsActivity} writes it.
 */
public final class MapPref {

    public static final String PREFS = "ather_morphe";
    public static final String KEY = "map_provider";
    public static final String KEY_ANALYTICS = "analytics_enabled";
    public static final String KEY_RIDE_SERVICE = "ride_service";
    public static final String KEY_PACK_KWH = "pack_kwh";

    public static final String AUTO = "auto";
    public static final String GOOGLE = "google";
    public static final String MMI = "mmi";
    public static final String OSM = "osm";

    private MapPref() {
    }

    public static Context appContext() {
        try {
            Object app = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (app instanceof Application) {
                return ((Application) app).getApplicationContext();
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public static String getProvider(Context ctx) {
        if (ctx == null) {
            return AUTO;
        }
        try {
            SharedPreferences sp = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String v = sp.getString(KEY, AUTO);
            return v != null ? v : AUTO;
        } catch (Throwable ignored) {
            return AUTO;
        }
    }

    public static void setProvider(Context ctx, String value) {
        if (ctx == null) {
            return;
        }
        try {
            ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putString(KEY, value).apply();
        } catch (Throwable ignored) {
        }
    }

    /**
     * True when Ather may send analytics events.
     *
     * Defaults to true so the patch changes nothing until you switch the
     * option off in {@link MorpheMapSettingsActivity}. Fails open: if the
     * preference cannot be read the app behaves as if analytics is on, so a
     * broken preference file can never crash a caller.
     */
    public static boolean analyticsEnabled() {
        return analyticsEnabled(appContext());
    }

    /** See {@link #analyticsEnabled()}. */
    public static boolean analyticsEnabled(Context ctx) {
        if (ctx == null) {
            ctx = appContext();
        }
        if (ctx == null) {
            return true;
        }
        try {
            return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getBoolean(KEY_ANALYTICS, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    /** Turn analytics on or off. */
    /**
     * True when the ride service should run. Off by default: it keeps the app's process alive so
     * rides are recorded even while the app is closed, at the cost of an ongoing notification.
     */
    public static boolean rideServiceEnabled() {
        return rideServiceEnabled(appContext());
    }

    public static boolean rideServiceEnabled(Context ctx) {
        if (ctx == null) {
            ctx = appContext();
        }
        if (ctx == null) {
            return false;
        }
        try {
            return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getBoolean(KEY_RIDE_SERVICE, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void setRideServiceEnabled(Context ctx, boolean enabled) {
        if (ctx == null) {
            ctx = appContext();
        }
        if (ctx == null) {
            return;
        }
        try {
            ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putBoolean(KEY_RIDE_SERVICE, enabled).apply();
        } catch (Throwable ignored) {
            // Nothing to do.
        }
    }

    /**
     * The battery pack size in kWh, used to turn a ride's charge drop into km/unit. Defaults to
     * 3.7, the published figure for the 450X, and is settable because the app ships no pack size.
     */
    public static double packKwh() {
        Context ctx = appContext();
        if (ctx == null) {
            return 3.7;
        }
        try {
            return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getFloat(KEY_PACK_KWH, 3.7f);
        } catch (Throwable ignored) {
            return 3.7;
        }
    }

    public static void setPackKwh(Context ctx, double kwh) {
        if (ctx == null) {
            ctx = appContext();
        }
        if (ctx == null || kwh <= 0.0) {
            return;
        }
        try {
            ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putFloat(KEY_PACK_KWH, (float) kwh).apply();
        } catch (Throwable ignored) {
            // Nothing to do.
        }
    }

    public static void setAnalyticsEnabled(Context ctx, boolean enabled) {
        if (ctx == null) {
            return;
        }
        try {
            ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putBoolean(KEY_ANALYTICS, enabled).apply();
        } catch (Throwable ignored) {
        }
    }

    /**
     * Remove phone-location permissions from a permission-request list.
     *
     * The scooter reports its own location, so the phone's location is not
     * needed. The calling, contacts, messages and call-log permissions belong to
     * the Bluetooth helmet's dialer, which is not used either. Dropping these
     * entries keeps the permission sheet quiet without disabling it: every
     * remaining permission still shows its normal system dialog when a feature
     * needs it. Called from the patched permission composable
     * {@code com.ather.designsystem.components.utils.d.f()}.
     *
     * @param perms the permission list Ather wants to request.
     * @return the input unchanged when it holds none of the dropped permissions,
     *         otherwise a new list without them.
     */
    public static java.util.List<String> dropLocationRequests(java.util.List<?> perms) {
        if (perms == null || perms.isEmpty()) {
            return castUnchecked(perms);
        }
        boolean found = false;
        for (Object o : perms) {
            if (o instanceof String && isDropped((String) o)) {
                found = true;
                break;
            }
        }
        if (!found) {
            return castUnchecked(perms);
        }
        java.util.List<String> kept = new java.util.ArrayList<>(perms.size());
        for (Object o : perms) {
            if (o instanceof String && !isDropped((String) o)) {
                kept.add((String) o);
            }
        }
        return kept;
    }

    /** True if the patch never asks for this permission. */
    private static boolean isDropped(String p) {
        return isLocationPermission(p) || isSensitivePermission(p);
    }

    /**
     * The calling, contacts, messages and call-log permissions. They belong to the
     * Bluetooth helmet's dialer and message reader. The permissions stay ungranted and
     * nothing is faked; the app simply stops asking for them.
     */
    private static boolean isSensitivePermission(String p) {
        if (p == null) {
            return false;
        }
        return p.equals("android.permission.READ_CALL_LOG")
                || p.equals("android.permission.WRITE_CALL_LOG")
                || p.equals("android.permission.READ_CONTACTS")
                || p.equals("android.permission.WRITE_CONTACTS")
                || p.equals("android.permission.GET_ACCOUNTS")
                || p.equals("android.permission.SEND_SMS")
                || p.equals("android.permission.RECEIVE_SMS")
                || p.equals("android.permission.READ_SMS")
                || p.equals("android.permission.RECEIVE_MMS")
                || p.equals("android.permission.CALL_PHONE")
                || p.equals("android.permission.ANSWER_PHONE_CALLS")
                || p.equals("android.permission.MANAGE_OWN_CALLS")
                || p.equals("android.permission.PROCESS_OUTGOING_CALLS")
                || p.equals("android.permission.READ_PHONE_STATE")
                || p.equals("android.permission.READ_PHONE_NUMBERS");
    }

    @SuppressWarnings("unchecked")
    private static java.util.List<String> castUnchecked(java.util.List<?> perms) {
        return (java.util.List<String>) perms;
    }

    /** True if a single permission is a location permission. */
    private static boolean isLocationPermission(String p) {
        return p != null
                && (p.equals("android.permission.ACCESS_FINE_LOCATION")
                    || p.equals("android.permission.ACCESS_COARSE_LOCATION")
                    || p.equals("android.permission.ACCESS_BACKGROUND_LOCATION"));
    }

    /**
     * Post-process the provider Ather resolved. Called from the patched resolver.
     * Never throws: on any error it returns the input unchanged.
     */
    public static a0 apply(a0 resolved) {
        try {
            Context ctx = appContext();
            String pref = getProvider(ctx);

            if (GOOGLE.equals(pref)) {
                return a0.GOOGLE_MAP;
            }
            if (MMI.equals(pref)) {
                // Mappls needs a licence tied to Ather's own signature, so it cannot load in a
                // re-signed build. An old Mappls choice falls back to OpenStreetMap.
                return a0.OSM;
            }
            if (OSM.equals(pref)) {
                return a0.OSM;
            }

            // auto: replace the providers that cannot work here with OpenStreetMap. GMS-package
            // detection is unreliable on GrapheneOS (sandboxed Play / gmscompat installs
            // com.google.android.gms), so we do not gate on it -- if Ather resolved a provider
            // that needs Google Play Services or Ather's Mappls licence, use OSM instead.
            if (resolved == a0.GOOGLE_MAP || resolved == a0.MMI) {
                return a0.OSM;
            }
            return resolved;
        } catch (Throwable t) {
            return resolved;
        }
    }
}
