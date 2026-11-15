package app.kmaps.extension.kakao;

import android.location.Location;

/** KakaoMap (KNSDK) high-rate GNSS helpers, injected by the patch "KakaoMap high-rate GNSS". */
@SuppressWarnings("unused")
public final class UbxKakao {
    /** Time (Location.getTime, ms) of the last fix accepted as "origin". */
    private static long lastOrigin;

    /**
     * KNGPSData: a 500 ms Kalman output counts as an "origin" fix (fresh measurement) at most once per 900 ms.
     * Stock behaviour with 1 Hz GNSS is about one origin per second; with 10 Hz GNSS every tick would be one,
     * doubling every isOrigin-gated counter/history downstream (map matching, network-link matching, off-route).
     * A clock going backwards (new session, simulation restart) resets the gate.
     */
    public static boolean originGate(Location location) {
        long t = location.getTime();
        long d = t - lastOrigin;
        if (d >= 0 && d < 900) return false;
        lastOrigin = t;
        return true;
    }
}
