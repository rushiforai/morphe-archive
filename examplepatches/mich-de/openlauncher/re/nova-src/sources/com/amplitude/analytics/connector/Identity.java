package com.amplitude.analytics.connector;

import b.c9;
import b70.h;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B5\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006¢\u0006\u0002\u0010\u0007J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0017\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006HÆ\u0003J9\u0010\u0010\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u001f\u0010\u0005\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/amplitude/analytics/connector/Identity;", b.f42142b, "userId", b.f42142b, "deviceId", "userProperties", b.f42142b, "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", "getDeviceId", "()Ljava/lang/String;", "getUserId", "getUserProperties", "()Ljava/util/Map;", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "analytics-connector_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class Identity {

    @Nullable
    private final String deviceId;

    @Nullable
    private final String userId;

    @NotNull
    private final Map<String, Object> userProperties;

    public Identity() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Identity copy$default(Identity identity, String str, String str2, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = identity.userId;
        }
        if ((i5 & 2) != 0) {
            str2 = identity.deviceId;
        }
        if ((i5 & 4) != 0) {
            map = identity.userProperties;
        }
        return identity.copy(str, str2, map);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getDeviceId() {
        return this.deviceId;
    }

    @NotNull
    public final Map<String, Object> component3() {
        return this.userProperties;
    }

    @NotNull
    public final Identity copy(@Nullable String userId, @Nullable String deviceId, @NotNull Map<String, ? extends Object> userProperties) {
        Intrinsics.g(userProperties, "userProperties");
        return new Identity(userId, deviceId, userProperties);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof Identity)) {
            return false;
        }
        Identity identity = (Identity) other;
        return Intrinsics.b(this.userId, identity.userId) && Intrinsics.b(this.deviceId, identity.deviceId) && Intrinsics.b(this.userProperties, identity.userProperties);
    }

    @Nullable
    public final String getDeviceId() {
        return this.deviceId;
    }

    @Nullable
    public final String getUserId() {
        return this.userId;
    }

    @NotNull
    public final Map<String, Object> getUserProperties() {
        return this.userProperties;
    }

    public int hashCode() {
        String str = this.userId;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.deviceId;
        return this.userProperties.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("Identity(userId=");
        sb2.append((Object) this.userId);
        sb2.append(", deviceId=");
        sb2.append((Object) this.deviceId);
        sb2.append(", userProperties=");
        return c9.l(sb2, this.userProperties, ')');
    }

    public Identity(@Nullable String str, @Nullable String str2, @NotNull Map<String, ? extends Object> userProperties) {
        Intrinsics.g(userProperties, "userProperties");
        this.userId = str;
        this.deviceId = str2;
        this.userProperties = userProperties;
    }

    public /* synthetic */ Identity(String str, String str2, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? h.f17594a : map);
    }
}
