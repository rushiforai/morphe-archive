package com.moloco.sdk.internal;

import b.c9;
import com.moloco.sdk.publisher.MolocoAdError;
import java.util.Map;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: d, reason: collision with root package name */
    public static final int f38181d = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final MolocoAdError f38182a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c f38183b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f38184c;

    public t(@NotNull MolocoAdError molocoAdError, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c subErrorType, @NotNull Map<String, String> details) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        Intrinsics.g(subErrorType, "subErrorType");
        Intrinsics.g(details, "details");
        this.f38182a = molocoAdError;
        this.f38183b = subErrorType;
        this.f38184c = details;
    }

    @NotNull
    public final MolocoAdError a() {
        return this.f38182a;
    }

    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c b() {
        return this.f38183b;
    }

    @NotNull
    public final Map<String, String> c() {
        return this.f38184c;
    }

    @NotNull
    public final Map<String, String> d() {
        return this.f38184c;
    }

    @NotNull
    public final MolocoAdError e() {
        return this.f38182a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Intrinsics.b(this.f38182a, tVar.f38182a) && Intrinsics.b(this.f38183b, tVar.f38183b) && Intrinsics.b(this.f38184c, tVar.f38184c);
    }

    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c f() {
        return this.f38183b;
    }

    public int hashCode() {
        return this.f38184c.hashCode() + ((this.f38183b.hashCode() + (this.f38182a.hashCode() * 31)) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("MolocoInternalAdError(molocoAdError=");
        sb2.append(this.f38182a);
        sb2.append(", subErrorType=");
        sb2.append(this.f38183b);
        sb2.append(", details=");
        return c9.l(sb2, this.f38184c, ')');
    }

    @NotNull
    public final t a(@NotNull MolocoAdError molocoAdError, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c subErrorType, @NotNull Map<String, String> details) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        Intrinsics.g(subErrorType, "subErrorType");
        Intrinsics.g(details, "details");
        return new t(molocoAdError, subErrorType, details);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ t a(t tVar, MolocoAdError molocoAdError, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVar, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            molocoAdError = tVar.f38182a;
        }
        if ((i5 & 2) != 0) {
            cVar = tVar.f38183b;
        }
        if ((i5 & 4) != 0) {
            map = tVar.f38184c;
        }
        return tVar.a(molocoAdError, cVar, map);
    }

    public /* synthetic */ t(MolocoAdError molocoAdError, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVar, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(molocoAdError, cVar, (i5 & 4) != 0 ? b70.h.f17594a : map);
    }
}
