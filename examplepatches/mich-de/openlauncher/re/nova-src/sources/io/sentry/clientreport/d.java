package io.sentry.clientreport;

import com.instabridge.mobilesdk.internal.analytics.PaymentReasons;

/* loaded from: classes4.dex */
public enum d {
    QUEUE_OVERFLOW("queue_overflow"),
    CACHE_OVERFLOW("cache_overflow"),
    RATELIMIT_BACKOFF("ratelimit_backoff"),
    NETWORK_ERROR(PaymentReasons.NETWORK_ERROR),
    SAMPLE_RATE("sample_rate"),
    BEFORE_SEND("before_send"),
    EVENT_PROCESSOR("event_processor"),
    BACKPRESSURE("backpressure");

    private final String reason;

    d(String str) {
        this.reason = str;
    }

    public String getReason() {
        return this.reason;
    }
}
