package com.instabridge.mobilesdk.internal.analytics;

import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.api.AnalyticsSink;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\b\u0001\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0004\b\u0006\u0010\u0007J&\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0014\u0010\f\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\rH\u0016R\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/analytics/ConsentGatedSink;", "Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "delegate", "granted", "Lkotlin/Function0;", b.f42142b, "<init>", "(Lcom/instabridge/mobilesdk/api/AnalyticsSink;Lkotlin/jvm/functions/Function0;)V", "track", b.f42142b, DatabaseConstants.EVENT_FIELD, b.f42142b, "properties", b.f42142b, b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ConsentGatedSink implements AnalyticsSink {
    public static final int $stable = 8;

    @NotNull
    private final AnalyticsSink delegate;

    @NotNull
    private final Function0<Boolean> granted;

    public ConsentGatedSink(@NotNull AnalyticsSink delegate, @NotNull Function0<Boolean> granted) {
        Intrinsics.g(delegate, "delegate");
        Intrinsics.g(granted, "granted");
        this.delegate = delegate;
        this.granted = granted;
    }

    @Override // com.instabridge.mobilesdk.api.AnalyticsSink
    public void track(@NotNull String event, @NotNull Map<String, ? extends Object> properties) {
        Intrinsics.g(event, "event");
        Intrinsics.g(properties, "properties");
        if (((Boolean) this.granted.invoke()).booleanValue()) {
            this.delegate.track(event, properties);
        }
    }
}
