package com.instabridge.ai.auth;

import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import io.p;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\f\b\u0087\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00020\u0005¢\u0006\u0004\b\b\u0010\tJ\u0015\u0010\f\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u0013\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\n0\u000e¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0012\u0010\u0013\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0014J\u001c\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0016J<\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\u0014\b\u0002\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001c\u001a\u00020\u001bHÖ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u001a\u0010\u001f\u001a\u00020\u00022\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001f\u0010 R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010!\u001a\u0004\b\"\u0010\u0012R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010#\u001a\u0004\b$\u0010\u0014R#\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010%\u001a\u0004\b&\u0010\u0016¨\u0006'"}, d2 = {"Lcom/instabridge/ai/auth/ConsentStatus;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "asked", "globalEnabled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "types", "<init>", "(ZLjava/lang/Boolean;Ljava/util/Map;)V", "Lio/p;", "category", "isEnabled", "(Lio/p;)Z", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getEnabledCategories", "()Ljava/util/List;", "component1", "()Z", "component2", "()Ljava/lang/Boolean;", "component3", "()Ljava/util/Map;", "copy", "(ZLjava/lang/Boolean;Ljava/util/Map;)Lcom/instabridge/ai/auth/ConsentStatus;", "toString", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", "()I", InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "Z", "getAsked", "Ljava/lang/Boolean;", "getGlobalEnabled", "Ljava/util/Map;", "getTypes", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final /* data */ class ConsentStatus {
    public static final int $stable = 8;
    private final boolean asked;

    @Nullable
    private final Boolean globalEnabled;

    @NotNull
    private final Map<String, Boolean> types;

    public ConsentStatus(boolean z11, @Nullable Boolean bool, @NotNull Map<String, Boolean> types) {
        Intrinsics.g(types, "types");
        this.asked = z11;
        this.globalEnabled = bool;
        this.types = types;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ConsentStatus copy$default(ConsentStatus consentStatus, boolean z11, Boolean bool, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = consentStatus.asked;
        }
        if ((i5 & 2) != 0) {
            bool = consentStatus.globalEnabled;
        }
        if ((i5 & 4) != 0) {
            map = consentStatus.types;
        }
        return consentStatus.copy(z11, bool, map);
    }

    /* renamed from: component1, reason: from getter */
    public final boolean getAsked() {
        return this.asked;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Boolean getGlobalEnabled() {
        return this.globalEnabled;
    }

    @NotNull
    public final Map<String, Boolean> component3() {
        return this.types;
    }

    @NotNull
    public final ConsentStatus copy(boolean asked, @Nullable Boolean globalEnabled, @NotNull Map<String, Boolean> types) {
        Intrinsics.g(types, "types");
        return new ConsentStatus(asked, globalEnabled, types);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ConsentStatus)) {
            return false;
        }
        ConsentStatus consentStatus = (ConsentStatus) other;
        return this.asked == consentStatus.asked && Intrinsics.b(this.globalEnabled, consentStatus.globalEnabled) && Intrinsics.b(this.types, consentStatus.types);
    }

    public final boolean getAsked() {
        return this.asked;
    }

    @NotNull
    public final List<p> getEnabledCategories() {
        i70.a aVar = p.f66716s;
        ArrayList arrayList = new ArrayList();
        aVar.getClass();
        b70.a aVar2 = new b70.a(aVar);
        while (aVar2.hasNext()) {
            Object next = aVar2.next();
            String str = ((p) next).f66720d;
            if (str == null ? false : Intrinsics.b(this.types.get(str), Boolean.TRUE)) {
                arrayList.add(next);
            }
        }
        return arrayList;
    }

    @Nullable
    public final Boolean getGlobalEnabled() {
        return this.globalEnabled;
    }

    @NotNull
    public final Map<String, Boolean> getTypes() {
        return this.types;
    }

    public int hashCode() {
        int iHashCode = Boolean.hashCode(this.asked) * 31;
        Boolean bool = this.globalEnabled;
        return this.types.hashCode() + ((iHashCode + (bool == null ? 0 : bool.hashCode())) * 31);
    }

    public final boolean isEnabled(@NotNull p category) {
        Intrinsics.g(category, "category");
        String str = category.f66720d;
        if (str == null) {
            return false;
        }
        return Intrinsics.b(this.types.get(str), Boolean.TRUE);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ConsentStatus(asked=");
        sb2.append(this.asked);
        sb2.append(", globalEnabled=");
        sb2.append(this.globalEnabled);
        sb2.append(", types=");
        return c9.l(sb2, this.types, ')');
    }
}
