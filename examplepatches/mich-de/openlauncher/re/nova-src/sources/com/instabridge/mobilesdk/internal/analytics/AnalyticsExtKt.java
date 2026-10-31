package com.instabridge.mobilesdk.internal.analytics;

import b70.h;
import com.instabridge.mobilesdk.api.AnalyticsSink;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\u001a,\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0006H\u0000¨\u0006\b"}, d2 = {"screenView", b.f42142b, "Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "eventName", b.f42142b, "props", b.f42142b, b.f42142b, "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AnalyticsExtKt {
    public static final void screenView(@NotNull AnalyticsSink analyticsSink, @NotNull String eventName, @NotNull Map<String, ? extends Object> props) {
        Intrinsics.g(analyticsSink, "<this>");
        Intrinsics.g(eventName, "eventName");
        Intrinsics.g(props, "props");
        analyticsSink.track(eventName, props);
    }

    public static /* synthetic */ void screenView$default(AnalyticsSink analyticsSink, String str, Map map, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            map = h.f17594a;
        }
        screenView(analyticsSink, str, map);
    }
}
