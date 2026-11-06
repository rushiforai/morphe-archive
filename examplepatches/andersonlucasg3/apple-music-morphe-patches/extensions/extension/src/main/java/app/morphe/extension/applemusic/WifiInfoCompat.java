package app.morphe.extension.applemusic;

import android.net.wifi.WifiInfo;
import android.os.Build;

/**
 * API 29 replacement for {@link WifiInfo#getWifiStandard()} (API 30), used by the playback
 * telemetry snapshot. On older releases the standard is reported as
 * {@code WIFI_STANDARD_UNKNOWN} (0), the same value the call site already uses when the
 * WifiInfo is null.
 */
public final class WifiInfoCompat {

    private WifiInfoCompat() {
    }

    public static int getWifiStandard(WifiInfo wifiInfo) {
        return Build.VERSION.SDK_INT >= 30 ? wifiInfo.getWifiStandard() : 0;
    }
}
