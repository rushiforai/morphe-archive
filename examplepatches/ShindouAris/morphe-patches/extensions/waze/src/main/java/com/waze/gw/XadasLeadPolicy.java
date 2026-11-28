package com.waze.gw;

/** Pure interpretation of an xADAS LeadState; unknown constants are treated as "no data". */
final class XadasLeadPolicy {
    static final int STATUS_MEASURING = 1;
    static final int VERDICT_SAFE = 1;
    static final int VERDICT_TOO_CLOSE = 2;
    /** xADAS sends at least once a second; a few missed seconds means the link is stale. */
    static final long STALE_MS = 3000L;

    // Why the link is not up (XadasLink.failure).
    static final int FAIL_NONE = 0;
    static final int FAIL_NOT_INSTALLED = 1;
    static final int FAIL_UNTRUSTED = 2;
    static final int FAIL_BIND = 3;
    static final int FAIL_API = 4;

    // What the Settings status card shows.
    static final int UI_OFF = 0;
    static final int UI_NOT_INSTALLED = 1;
    static final int UI_UNTRUSTED = 2;
    static final int UI_API_OLD = 3;
    static final int UI_CONNECTING = 4;
    static final int UI_SHARING_OFF = 5;
    static final int UI_PENDING = 6;
    static final int UI_DENIED = 7;
    static final int UI_NO_CAMERA = 8;
    static final int UI_PAUSED = 9;
    static final int UI_STOPPED = 10;
    static final int UI_UNSUPPORTED = 11;
    static final int UI_NO_LEAD = 12;
    static final int UI_LIVE = 13;
    static final int UI_WAITING = 14;

    // IXadasLink.ACCESS_* / STATUS_* values, copied so this class stays free of the AIDL types.
    private static final int ACCESS_PENDING = 2;
    private static final int ACCESS_DENIED = 3;
    private static final int ACCESS_DISABLED = 4;

    /** Measured gap in metres, or -1 when there is no fresh measurement. */
    static int metres(int status, int distanceM, int distanceAgeMs, long receivedAtMs, long nowMs) {
        if (status != STATUS_MEASURING || distanceM < 0 || distanceAgeMs < 0 || receivedAtMs <= 0) return -1;
        long age = nowMs - receivedAtMs;
        if (age < 0 || age + distanceAgeMs >= STALE_MS) return -1;
        return distanceM;
    }

    static boolean tooClose(int verdict) { return verdict == VERDICT_TOO_CLOSE; }

    /**
     * The single answer to "why does the xADAS switch show nothing?". Checked in the order a user
     * would have to fix things: switch, install, genuine app, connection, xADAS sharing, consent,
     * then what xADAS itself is doing. {@code ageMs} is the time since the last state arrived.
     */
    static int uiState(boolean enabled, int failure, boolean connected, int access, int status,
                       int metres, long ageMs) {
        if (!enabled) return UI_OFF;
        if (failure == FAIL_NOT_INSTALLED) return UI_NOT_INSTALLED;
        if (failure == FAIL_UNTRUSTED) return UI_UNTRUSTED;
        if (failure == FAIL_API) return UI_API_OLD;
        if (!connected) return UI_CONNECTING;
        if (access == ACCESS_DISABLED) return UI_SHARING_OFF;
        if (access == ACCESS_PENDING) return UI_PENDING;
        if (access == ACCESS_DENIED) return UI_DENIED;
        if (ageMs > STALE_MS * 2) return UI_WAITING;
        switch (status) {
            case 1: return metres >= 0 ? UI_LIVE : UI_NO_LEAD;
            case 2: return UI_PAUSED;
            case 3: return UI_NO_CAMERA;
            case 4: return UI_UNSUPPORTED;
            case 5: return UI_STOPPED;
            default: return UI_WAITING;
        }
    }
}
