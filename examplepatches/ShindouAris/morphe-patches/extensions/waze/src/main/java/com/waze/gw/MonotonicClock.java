package com.waze.gw;

/** Small platform-neutral clock used by the vendored USB serial drivers. */
final class MonotonicClock {
    private MonotonicClock() { }
    static long millis() { return android.os.SystemClock.elapsedRealtime(); }
}
