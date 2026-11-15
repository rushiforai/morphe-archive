package com.naver.maps.navi.mapmatching;

import android.os.SystemClock;

/**
 * NAVER Map high-rate GNSS: map matching runs on every new GPS fix instead of a fixed 1 s timer, at most 20 Hz
 * (faster receivers are thinned to the newest fix on each >= 45 ms poll; polls are 50 ms apart).
 * {@link #w} = milliseconds represented by the current map-matching run (time since the previous run, 1..1000).
 * Per-run counters add w instead of 1 and their thresholds are in ms (x1000), so they keep their real-time meaning
 * at any fix rate (10 Hz with GNSS, 1 Hz fallback without).
 * <p>
 * Lives in NAVER's package because the patched code calls it with NAVER's own types. Ported 1:1 from the smali
 * version used until 2026-11 (fields stay public static: patched sites read them directly).
 */
@SuppressWarnings("unused")
public final class RateGate {
    public static int w = 1000;
    public static Object lastA;
    public static Object lastB;
    public static long lastRunMs;
    public static long[] marks = new long[4];

    /** True when the snapshot holds a new location (mobile b or AVN a) and >= 45 ms passed, or 1 s passed; sets w. */
    public static boolean shouldRun(LocationSnapshot s) {
        long now = SystemClock.elapsedRealtime();
        long dt = now - lastRunMs;
        Object b = s.b();
        Object a = s.a();
        if (b == lastB && a == lastA) {
            if (dt < 1000) return false;
        } else if (dt < 45) {
            // lastA/lastB stay unchanged, so a later poll runs with the newest fix
            return false;
        }
        lastB = b;
        lastA = a;
        lastRunMs = now;
        long v = dt <= 1000 ? dt : 1000;
        if (v < 1) v = 1;
        w = (int) v;
        return true;
    }

    /** x + w */
    public static int inc(int x) {
        return w + x;
    }

    /** x + k*w */
    public static int addk(int x, int k) {
        return w * k + x;
    }

    /** x * 1000 (tick threshold -> ms) */
    public static int ms(int x) {
        return x * 1000;
    }

    /** x / 1000 (ms counter -> ticks) */
    public static int sec(int x) {
        return x / 1000;
    }

    /** w / 1000.0 */
    public static double dtSec() {
        return w / 1000.0;
    }

    /** x * w / 1000 (per-1s-step quantity -> per-run quantity) */
    public static double scale(double x) {
        return dtSec() * x;
    }

    /** x * 1000 / w (seconds -> number of runs at the current rate) */
    public static double perTick(double x) {
        return x / dtSec();
    }

    /** Map/car-icon interpolation: the default 1000 ms becomes ~1.15 x the current update interval (50..1000 ms). */
    public static long animDur(long d) {
        if (d != 1000) return d;
        int v = w * 115 / 100;
        if (v < 50) v = 50;
        if (v > 1000) v = 1000;
        return v;
    }

    /** True at most once per ~1 s for slot i (keeps 1 Hz sample buffers / reports at 1 Hz). */
    public static boolean due(int i) {
        long now = SystemClock.elapsedRealtime();
        if (now - marks[i] < 900) return false;
        marks[i] = now;
        return true;
    }

    public static boolean gateStopBuf() {
        return due(0);
    }

    public static boolean gateVec() {
        return due(1);
    }

    public static boolean gateTrip() {
        return due(2);
    }

    public static boolean gateTrack() {
        return due(3);
    }
}
