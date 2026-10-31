package com.amplitude.analytics.connector;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BI\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0016\b\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0005\u0012\"\b\u0002\u0010\u0006\u001a\u001c\u0012\u0004\u0012\u00020\u0003\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0005\u0018\u00010\u0005¢\u0006\u0002\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0017\u0010\u000e\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0005HÆ\u0003J#\u0010\u000f\u001a\u001c\u0012\u0004\u0012\u00020\u0003\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0005\u0018\u00010\u0005HÆ\u0003JO\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0016\b\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u00052\"\b\u0002\u0010\u0006\u001a\u001c\u0012\u0004\u0012\u00020\u0003\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0005\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u001f\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR+\u0010\u0006\u001a\u001c\u0012\u0004\u0012\u00020\u0003\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u0005\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\t¨\u0006\u0017"}, d2 = {"Lcom/amplitude/analytics/connector/AnalyticsEvent;", b.f42142b, "eventType", b.f42142b, "eventProperties", b.f42142b, "userProperties", "(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V", "getEventProperties", "()Ljava/util/Map;", "getEventType", "()Ljava/lang/String;", "getUserProperties", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "analytics-connector_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class AnalyticsEvent {

    @Nullable
    private final Map<String, Object> eventProperties;

    @NotNull
    private final String eventType;

    @Nullable
    private final Map<String, Map<String, Object>> userProperties;

    /* JADX WARN: Multi-variable type inference failed */
    public AnalyticsEvent(@NotNull String eventType, @Nullable Map<String, ? extends Object> map, @Nullable Map<String, ? extends Map<String, ? extends Object>> map2) {
        Intrinsics.g(eventType, "eventType");
        this.eventType = eventType;
        this.eventProperties = map;
        this.userProperties = map2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ AnalyticsEvent copy$default(AnalyticsEvent analyticsEvent, String str, Map map, Map map2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = analyticsEvent.eventType;
        }
        if ((i5 & 2) != 0) {
            map = analyticsEvent.eventProperties;
        }
        if ((i5 & 4) != 0) {
            map2 = analyticsEvent.userProperties;
        }
        return analyticsEvent.copy(str, map, map2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getEventType() {
        return this.eventType;
    }

    @Nullable
    public final Map<String, Object> component2() {
        return this.eventProperties;
    }

    @Nullable
    public final Map<String, Map<String, Object>> component3() {
        return this.userProperties;
    }

    @NotNull
    public final AnalyticsEvent copy(@NotNull String eventType, @Nullable Map<String, ? extends Object> eventProperties, @Nullable Map<String, ? extends Map<String, ? extends Object>> userProperties) {
        Intrinsics.g(eventType, "eventType");
        return new AnalyticsEvent(eventType, eventProperties, userProperties);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AnalyticsEvent)) {
            return false;
        }
        AnalyticsEvent analyticsEvent = (AnalyticsEvent) other;
        return Intrinsics.b(this.eventType, analyticsEvent.eventType) && Intrinsics.b(this.eventProperties, analyticsEvent.eventProperties) && Intrinsics.b(this.userProperties, analyticsEvent.userProperties);
    }

    @Nullable
    public final Map<String, Object> getEventProperties() {
        return this.eventProperties;
    }

    @NotNull
    public final String getEventType() {
        return this.eventType;
    }

    @Nullable
    public final Map<String, Map<String, Object>> getUserProperties() {
        return this.userProperties;
    }

    public int hashCode() {
        int iHashCode = this.eventType.hashCode() * 31;
        Map<String, Object> map = this.eventProperties;
        int iHashCode2 = (iHashCode + (map == null ? 0 : map.hashCode())) * 31;
        Map<String, Map<String, Object>> map2 = this.userProperties;
        return iHashCode2 + (map2 != null ? map2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AnalyticsEvent(eventType=");
        sb2.append(this.eventType);
        sb2.append(", eventProperties=");
        sb2.append(this.eventProperties);
        sb2.append(", userProperties=");
        return c9.l(sb2, this.userProperties, ')');
    }

    public /* synthetic */ AnalyticsEvent(String str, Map map, Map map2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : map, (i5 & 4) != 0 ? null : map2);
    }
}
