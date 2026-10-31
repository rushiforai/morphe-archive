package com.amplitude.eventbridge;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\u0014\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001Bu\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0018\b\u0002\u0010\u0004\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005\u0012\u0018\b\u0002\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005\u0012\u0018\b\u0002\u0010\u0007\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005\u0012\u0018\b\u0002\u0010\b\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005¢\u0006\u0002\u0010\tJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u0019\u0010\u0014\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005HÆ\u0003J\u0019\u0010\u0015\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005HÆ\u0003J\u0019\u0010\u0016\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005HÆ\u0003J\u0019\u0010\u0017\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005HÆ\u0003J{\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0018\b\u0002\u0010\u0004\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00052\u0018\b\u0002\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00052\u0018\b\u0002\u0010\u0007\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00052\u0018\b\u0002\u0010\b\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R!\u0010\u0004\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR*\u0010\b\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000b\"\u0004\b\u000f\u0010\u0010R!\u0010\u0007\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000bR!\u0010\u0006\u001a\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000b¨\u0006\u001f"}, d2 = {"Lcom/amplitude/eventbridge/Event;", b.f42142b, "eventType", b.f42142b, "eventProperties", b.f42142b, "userProperties", "groups", "groupProperties", "(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V", "getEventProperties", "()Ljava/util/Map;", "getEventType", "()Ljava/lang/String;", "getGroupProperties", "setGroupProperties", "(Ljava/util/Map;)V", "getGroups", "getUserProperties", "component1", "component2", "component3", "component4", "component5", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class Event {

    @Nullable
    private final Map<String, Object> eventProperties;

    @NotNull
    private final String eventType;

    @Nullable
    private Map<String, ? extends Object> groupProperties;

    @Nullable
    private final Map<String, Object> groups;

    @Nullable
    private final Map<String, Object> userProperties;

    public Event(@NotNull String eventType, @Nullable Map<String, ? extends Object> map, @Nullable Map<String, ? extends Object> map2, @Nullable Map<String, ? extends Object> map3, @Nullable Map<String, ? extends Object> map4) {
        Intrinsics.g(eventType, "eventType");
        this.eventType = eventType;
        this.eventProperties = map;
        this.userProperties = map2;
        this.groups = map3;
        this.groupProperties = map4;
    }

    public static /* synthetic */ Event copy$default(Event event, String str, Map map, Map map2, Map map3, Map map4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = event.eventType;
        }
        if ((i5 & 2) != 0) {
            map = event.eventProperties;
        }
        if ((i5 & 4) != 0) {
            map2 = event.userProperties;
        }
        if ((i5 & 8) != 0) {
            map3 = event.groups;
        }
        if ((i5 & 16) != 0) {
            map4 = event.groupProperties;
        }
        Map map5 = map4;
        Map map6 = map2;
        return event.copy(str, map, map6, map3, map5);
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
    public final Map<String, Object> component3() {
        return this.userProperties;
    }

    @Nullable
    public final Map<String, Object> component4() {
        return this.groups;
    }

    @Nullable
    public final Map<String, Object> component5() {
        return this.groupProperties;
    }

    @NotNull
    public final Event copy(@NotNull String eventType, @Nullable Map<String, ? extends Object> eventProperties, @Nullable Map<String, ? extends Object> userProperties, @Nullable Map<String, ? extends Object> groups, @Nullable Map<String, ? extends Object> groupProperties) {
        Intrinsics.g(eventType, "eventType");
        return new Event(eventType, eventProperties, userProperties, groups, groupProperties);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Event)) {
            return false;
        }
        Event event = (Event) other;
        return Intrinsics.b(this.eventType, event.eventType) && Intrinsics.b(this.eventProperties, event.eventProperties) && Intrinsics.b(this.userProperties, event.userProperties) && Intrinsics.b(this.groups, event.groups) && Intrinsics.b(this.groupProperties, event.groupProperties);
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
    public final Map<String, Object> getGroupProperties() {
        return this.groupProperties;
    }

    @Nullable
    public final Map<String, Object> getGroups() {
        return this.groups;
    }

    @Nullable
    public final Map<String, Object> getUserProperties() {
        return this.userProperties;
    }

    public int hashCode() {
        int iHashCode = this.eventType.hashCode() * 31;
        Map<String, Object> map = this.eventProperties;
        int iHashCode2 = (iHashCode + (map == null ? 0 : map.hashCode())) * 31;
        Map<String, Object> map2 = this.userProperties;
        int iHashCode3 = (iHashCode2 + (map2 == null ? 0 : map2.hashCode())) * 31;
        Map<String, Object> map3 = this.groups;
        int iHashCode4 = (iHashCode3 + (map3 == null ? 0 : map3.hashCode())) * 31;
        Map<String, ? extends Object> map4 = this.groupProperties;
        return iHashCode4 + (map4 != null ? map4.hashCode() : 0);
    }

    public final void setGroupProperties(@Nullable Map<String, ? extends Object> map) {
        this.groupProperties = map;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("Event(eventType=");
        sb2.append(this.eventType);
        sb2.append(", eventProperties=");
        sb2.append(this.eventProperties);
        sb2.append(", userProperties=");
        sb2.append(this.userProperties);
        sb2.append(", groups=");
        sb2.append(this.groups);
        sb2.append(", groupProperties=");
        return c9.l(sb2, this.groupProperties, ')');
    }

    public /* synthetic */ Event(String str, Map map, Map map2, Map map3, Map map4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : map, (i5 & 4) != 0 ? null : map2, (i5 & 8) != 0 ? null : map3, (i5 & 16) != 0 ? null : map4);
    }
}
