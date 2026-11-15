package com.zai.sysvpn;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.service.quicksettings.TileService;

/**
 * Static control surface shared by the VPN service, the quick-settings tile
 * and the app widget. All components live in the main app process, so a
 * simple static flag plus the hev JNI running-flag is a reliable state
 * source.
 */
public final class VpnController {

    public static final String ACTION_ENABLE = "com.zai.sysvpn.ENABLE";
    public static final String ACTION_DISABLE = "com.zai.sysvpn.DISABLE";
    public static final String ACTION_TOGGLE = "com.zai.sysvpn.TOGGLE";
    public static final String ACTION_RESTART = "com.zai.sysvpn.RESTART";
    public static final String EXTRA_REGION = "region";

    static final String PREFS = "sysvpn";
    static final String KEY_REGION = "region";

    public static final String[] REGIONS = { "EU", "AS", "AM" };

    private VpnController() {
    }

    public static String getRegion(Context c) {
        String r = c.getSharedPreferences(PREFS, 0).getString(KEY_REGION, "EU");
        if (!"EU".equals(r) && !"AS".equals(r) && !"AM".equals(r)) {
            r = "EU";
        }
        return r;
    }

    public static void setRegion(Context c, String region) {
        if ("EU".equals(region) || "AS".equals(region) || "AM".equals(region)) {
            c.getSharedPreferences(PREFS, 0).edit().putString(KEY_REGION, region).apply();
        }
    }

    public static String regionName(String code) {
        if ("AS".equals(code)) {
            return "Asia";
        }
        if ("AM".equals(code)) {
            return "Americas";
        }
        return "Europe";
    }

    /**
     * True when the system VPN tunnel is up in this process. The tile and
     * the widget run in the same (main) process as the service.
     */
    public static boolean isRunning(Context c) {
        if (com.kape.vpnservicemanager.data.externals.Service.sRunning) {
            return true;
        }
        try {
            if (hev.htproxy.TProxyService.TProxyIsRunning()) {
                return true;
            }
        } catch (Throwable ignored) {
            // native lib missing / not loaded yet
        }
        return false;
    }

    public static void enable(Context c) {
        send(c, ACTION_ENABLE, null);
    }

    public static void disable(Context c) {
        send(c, ACTION_DISABLE, null);
    }

    public static void toggle(Context c) {
        send(c, ACTION_TOGGLE, null);
    }

    /** Set region and (re)start the tunnel with it. */
    public static void region(Context c, String region) {
        setRegion(c, region);
        send(c, ACTION_RESTART, region);
    }

    private static void send(Context c, String action, String region) {
        Intent i = new Intent(c, com.kape.vpnservicemanager.data.externals.Service.class);
        i.setAction(action);
        if (region != null) {
            i.putExtra(EXTRA_REGION, region);
        }
        try {
            if (Build.VERSION.SDK_INT >= 26) {
                c.startForegroundService(i);
            } else {
                c.startService(i);
            }
        } catch (Throwable ignored) {
            // app in background restrictions; user can retry from the tile
        }
    }

    /** Ask the system to re-bind (and refresh) the quick-settings tile. */
    public static void refreshTile(Context c) {
        try {
            TileService.requestListeningState(c, new ComponentName(
                    c.getPackageName(),
                    "com.opera.android.vpn.quick_settings_tile"
                            + ".VpnProQuickSettingsTileService"));
        } catch (Throwable ignored) {
        }
    }

    public static PendingIntent servicePending(Context c, String action, int requestCode) {
        Intent i = new Intent(c, com.kape.vpnservicemanager.data.externals.Service.class);
        i.setAction(action);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= 23) {
            flags |= PendingIntent.FLAG_IMMUTABLE;
        }
        return PendingIntent.getService(c, requestCode, i, flags);
    }
}
