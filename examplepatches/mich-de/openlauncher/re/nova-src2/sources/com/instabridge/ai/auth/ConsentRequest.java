package com.instabridge.ai.auth;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B+\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0016\b\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\nJ\u0017\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0005HÆ\u0003J2\u0010\u0010\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\u0016\b\u0002\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0011J\u0013\u0010\u0012\u001a\u00020\u00032\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0006HÖ\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u000b\u001a\u0004\b\t\u0010\nR\u001f\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/auth/ConsentRequest;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "enabled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "types", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/Boolean;Ljava/util/Map;)V", "getEnabled", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getTypes", "()Ljava/util/Map;", "component1", "component2", "copy", "(Ljava/lang/Boolean;Ljava/util/Map;)Lcom/instabridge/ai/auth/ConsentRequest;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
final /* data */ class ConsentRequest {

    @Nullable
    private final Boolean enabled;

    @Nullable
    private final Map<String, Boolean> types;

    /* JADX WARN: Multi-variable type inference failed */
    public ConsentRequest() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ConsentRequest copy$default(ConsentRequest consentRequest, Boolean bool, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            bool = consentRequest.enabled;
        }
        if ((i5 & 2) != 0) {
            map = consentRequest.types;
        }
        return consentRequest.copy(bool, map);
    }

    @Nullable
    /* renamed from: component1, reason: from getter */
    public final Boolean getEnabled() {
        return this.enabled;
    }

    @Nullable
    public final Map<String, Boolean> component2() {
        return this.types;
    }

    @NotNull
    public final ConsentRequest copy(@Nullable Boolean enabled, @Nullable Map<String, Boolean> types) {
        return new ConsentRequest(enabled, types);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ConsentRequest)) {
            return false;
        }
        ConsentRequest consentRequest = (ConsentRequest) other;
        return Intrinsics.b(this.enabled, consentRequest.enabled) && Intrinsics.b(this.types, consentRequest.types);
    }

    @Nullable
    public final Boolean getEnabled() {
        return this.enabled;
    }

    @Nullable
    public final Map<String, Boolean> getTypes() {
        return this.types;
    }

    public int hashCode() {
        Boolean bool = this.enabled;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Map<String, Boolean> map = this.types;
        return iHashCode + (map != null ? map.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ConsentRequest(enabled=");
        sb2.append(this.enabled);
        sb2.append(", types=");
        return c9.l(sb2, this.types, ')');
    }

    public ConsentRequest(@Nullable Boolean bool, @Nullable Map<String, Boolean> map) {
        this.enabled = bool;
        this.types = map;
    }

    public /* synthetic */ ConsentRequest(Boolean bool, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : bool, (i5 & 2) != 0 ? null : map);
    }
}
