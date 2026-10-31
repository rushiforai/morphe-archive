package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2982i;
import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: f, reason: collision with root package name */
    public static final int f40873f = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final f f40874a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final c f40875b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final List<String> f40876c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final List<String> f40877d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final C2982i f40878e;

    public a(@NotNull f linear, @Nullable c cVar, @NotNull List<String> impressionTracking, @NotNull List<String> errorTracking, @Nullable C2982i c2982i) {
        Intrinsics.g(linear, "linear");
        Intrinsics.g(impressionTracking, "impressionTracking");
        Intrinsics.g(errorTracking, "errorTracking");
        this.f40874a = linear;
        this.f40875b = cVar;
        this.f40876c = impressionTracking;
        this.f40877d = errorTracking;
        this.f40878e = c2982i;
    }

    @NotNull
    public final f a() {
        return this.f40874a;
    }

    @Nullable
    public final c b() {
        return this.f40875b;
    }

    @NotNull
    public final List<String> c() {
        return this.f40876c;
    }

    @NotNull
    public final List<String> d() {
        return this.f40877d;
    }

    @Nullable
    public final C2982i e() {
        return this.f40878e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f40874a, aVar.f40874a) && Intrinsics.b(this.f40875b, aVar.f40875b) && Intrinsics.b(this.f40876c, aVar.f40876c) && Intrinsics.b(this.f40877d, aVar.f40877d) && Intrinsics.b(this.f40878e, aVar.f40878e);
    }

    @Nullable
    public final c f() {
        return this.f40875b;
    }

    @Nullable
    public final C2982i g() {
        return this.f40878e;
    }

    @NotNull
    public final List<String> h() {
        return this.f40877d;
    }

    public int hashCode() {
        int iHashCode = this.f40874a.hashCode() * 31;
        c cVar = this.f40875b;
        int iC = u4.c(u4.c((iHashCode + (cVar == null ? 0 : cVar.hashCode())) * 31, 31, this.f40876c), 31, this.f40877d);
        C2982i c2982i = this.f40878e;
        return iC + (c2982i != null ? c2982i.hashCode() : 0);
    }

    @NotNull
    public final List<String> i() {
        return this.f40876c;
    }

    @NotNull
    public final f j() {
        return this.f40874a;
    }

    @NotNull
    public String toString() {
        return "Ad(linear=" + this.f40874a + ", companion=" + this.f40875b + ", impressionTracking=" + this.f40876c + ", errorTracking=" + this.f40877d + ", dec=" + this.f40878e + ')';
    }

    @NotNull
    public final a a(@NotNull f linear, @Nullable c cVar, @NotNull List<String> impressionTracking, @NotNull List<String> errorTracking, @Nullable C2982i c2982i) {
        Intrinsics.g(linear, "linear");
        Intrinsics.g(impressionTracking, "impressionTracking");
        Intrinsics.g(errorTracking, "errorTracking");
        return new a(linear, cVar, impressionTracking, errorTracking, c2982i);
    }

    public static /* synthetic */ a a(a aVar, f fVar, c cVar, List list, List list2, C2982i c2982i, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            fVar = aVar.f40874a;
        }
        if ((i5 & 2) != 0) {
            cVar = aVar.f40875b;
        }
        if ((i5 & 4) != 0) {
            list = aVar.f40876c;
        }
        if ((i5 & 8) != 0) {
            list2 = aVar.f40877d;
        }
        if ((i5 & 16) != 0) {
            c2982i = aVar.f40878e;
        }
        C2982i c2982i2 = c2982i;
        List list3 = list;
        return aVar.a(fVar, cVar, list3, list2, c2982i2);
    }

    public /* synthetic */ a(f fVar, c cVar, List list, List list2, C2982i c2982i, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(fVar, cVar, list, list2, (i5 & 16) != 0 ? null : c2982i);
    }
}
