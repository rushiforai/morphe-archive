package io.sentry;

import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum i {
    All("__all__"),
    Default(CarrierConfigurator.APN_TYPE),
    Error("error"),
    Session("session"),
    Attachment("attachment"),
    Monitor("monitor"),
    Profile("profile"),
    MetricBucket("metric_bucket"),
    Transaction("transaction"),
    Replay("replay"),
    Span("span"),
    Security("security"),
    UserReport("user_report"),
    Unknown("unknown");

    private final String category;

    i(@NotNull String str) {
        this.category = str;
    }

    public String getCategory() {
        return this.category;
    }
}
