package com.google.firebase.crashlytics.internal.metadata;

import b.c0;
import b.c9;
import b70.h;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010$\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0080\b\u0018\u00002\u00020\u0001B/\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0014\b\u0002\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\u0015\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0007HÆ\u0003J3\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\u0014\b\u0002\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u001d\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/google/firebase/crashlytics/internal/metadata/EventMetadata;", b.f42142b, "sessionId", b.f42142b, "timestamp", b.f42142b, "additionalCustomKeys", b.f42142b, "<init>", "(Ljava/lang/String;JLjava/util/Map;)V", "getSessionId", "()Ljava/lang/String;", "getTimestamp", "()J", "getAdditionalCustomKeys", "()Ljava/util/Map;", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "com.google.firebase-firebase-crashlytics"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class EventMetadata {

    @NotNull
    private final Map<String, String> additionalCustomKeys;

    @NotNull
    private final String sessionId;
    private final long timestamp;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public EventMetadata(@NotNull String sessionId, long j11) {
        this(sessionId, j11, null, 4, null);
        Intrinsics.g(sessionId, "sessionId");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ EventMetadata copy$default(EventMetadata eventMetadata, String str, long j11, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = eventMetadata.sessionId;
        }
        if ((i5 & 2) != 0) {
            j11 = eventMetadata.timestamp;
        }
        if ((i5 & 4) != 0) {
            map = eventMetadata.additionalCustomKeys;
        }
        return eventMetadata.copy(str, j11, map);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getSessionId() {
        return this.sessionId;
    }

    /* renamed from: component2, reason: from getter */
    public final long getTimestamp() {
        return this.timestamp;
    }

    @NotNull
    public final Map<String, String> component3() {
        return this.additionalCustomKeys;
    }

    @NotNull
    public final EventMetadata copy(@NotNull String sessionId, long timestamp, @NotNull Map<String, String> additionalCustomKeys) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(additionalCustomKeys, "additionalCustomKeys");
        return new EventMetadata(sessionId, timestamp, additionalCustomKeys);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EventMetadata)) {
            return false;
        }
        EventMetadata eventMetadata = (EventMetadata) other;
        return Intrinsics.b(this.sessionId, eventMetadata.sessionId) && this.timestamp == eventMetadata.timestamp && Intrinsics.b(this.additionalCustomKeys, eventMetadata.additionalCustomKeys);
    }

    @NotNull
    public final Map<String, String> getAdditionalCustomKeys() {
        return this.additionalCustomKeys;
    }

    @NotNull
    public final String getSessionId() {
        return this.sessionId;
    }

    public final long getTimestamp() {
        return this.timestamp;
    }

    public int hashCode() {
        return this.additionalCustomKeys.hashCode() + c0.d(this.sessionId.hashCode() * 31, 31, this.timestamp);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("EventMetadata(sessionId=");
        sb2.append(this.sessionId);
        sb2.append(", timestamp=");
        sb2.append(this.timestamp);
        sb2.append(", additionalCustomKeys=");
        return c9.l(sb2, this.additionalCustomKeys, ')');
    }

    @JvmOverloads
    public EventMetadata(@NotNull String sessionId, long j11, @NotNull Map<String, String> additionalCustomKeys) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(additionalCustomKeys, "additionalCustomKeys");
        this.sessionId = sessionId;
        this.timestamp = j11;
        this.additionalCustomKeys = additionalCustomKeys;
    }

    public /* synthetic */ EventMetadata(String str, long j11, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, j11, (i5 & 4) != 0 ? h.f17594a : map);
    }
}
