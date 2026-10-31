package com.moloco.sdk.internal.publisher.nativead.model;

import android.net.Uri;
import com.moloco.sdk.internal.publisher.nativead.model.b;
import com.moloco.sdk.internal.publisher.nativead.model.c;
import java.util.List;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x8.h;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: g, reason: collision with root package name */
    public static final int f37353g = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Map<Integer, c.a> f37354a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Map<Integer, c.b> f37355b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Map<Integer, c.C0169c> f37356c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Map<Integer, c.d> f37357d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<Pair<b.a, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c>> f37358e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Lazy f37359f;

    /* JADX WARN: Multi-variable type inference failed */
    public d(@NotNull Map<Integer, c.a> data, @NotNull Map<Integer, c.b> images, @NotNull Map<Integer, c.C0169c> titles, @NotNull Map<Integer, c.d> videos, @NotNull List<? extends Pair<? extends b.a, ? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c>> failedAssets) {
        Intrinsics.g(data, "data");
        Intrinsics.g(images, "images");
        Intrinsics.g(titles, "titles");
        Intrinsics.g(videos, "videos");
        Intrinsics.g(failedAssets, "failedAssets");
        this.f37354a = data;
        this.f37355b = images;
        this.f37356c = titles;
        this.f37357d = videos;
        this.f37358e = failedAssets;
        this.f37359f = LazyKt.a(new as.c(this, 17));
    }

    public final Map<Integer, c.a> a() {
        return this.f37354a;
    }

    public final Map<Integer, c.b> b() {
        return this.f37355b;
    }

    public final Map<Integer, c.C0169c> c() {
        return this.f37356c;
    }

    public final Map<Integer, c.d> d() {
        return this.f37357d;
    }

    public final List<Pair<b.a, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c>> e() {
        return this.f37358e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f37354a, dVar.f37354a) && Intrinsics.b(this.f37355b, dVar.f37355b) && Intrinsics.b(this.f37356c, dVar.f37356c) && Intrinsics.b(this.f37357d, dVar.f37357d) && Intrinsics.b(this.f37358e, dVar.f37358e);
    }

    public final Map<Integer, c> f() {
        return (Map) this.f37359f.getValue();
    }

    public int hashCode() {
        return this.f37358e.hashCode() + h.c(this.f37357d, h.c(this.f37356c, h.c(this.f37355b, this.f37354a.hashCode() * 31, 31), 31), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("PreparedNativeAssets(data=");
        sb2.append(this.f37354a);
        sb2.append(", images=");
        sb2.append(this.f37355b);
        sb2.append(", titles=");
        sb2.append(this.f37356c);
        sb2.append(", videos=");
        sb2.append(this.f37357d);
        sb2.append(", failedAssets=");
        return fq.c.e(sb2, this.f37358e, ')');
    }

    @NotNull
    public final d a(@NotNull Map<Integer, c.a> data, @NotNull Map<Integer, c.b> images, @NotNull Map<Integer, c.C0169c> titles, @NotNull Map<Integer, c.d> videos, @NotNull List<? extends Pair<? extends b.a, ? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c>> failedAssets) {
        Intrinsics.g(data, "data");
        Intrinsics.g(images, "images");
        Intrinsics.g(titles, "titles");
        Intrinsics.g(videos, "videos");
        Intrinsics.g(failedAssets, "failedAssets");
        return new d(data, images, titles, videos, failedAssets);
    }

    @Nullable
    public final Uri b(int i5) {
        c.b bVar = this.f37355b.get(Integer.valueOf(i5));
        if (bVar != null) {
            return bVar.d();
        }
        return null;
    }

    @Nullable
    public final String c(int i5) {
        c.C0169c c0169c = this.f37356c.get(Integer.valueOf(i5));
        if (c0169c != null) {
            return c0169c.d();
        }
        return null;
    }

    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.a d(int i5) {
        c.d dVar = this.f37357d.get(Integer.valueOf(i5));
        if (dVar != null) {
            return dVar.d();
        }
        return null;
    }

    public static /* synthetic */ d a(d dVar, Map map, Map map2, Map map3, Map map4, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            map = dVar.f37354a;
        }
        if ((i5 & 2) != 0) {
            map2 = dVar.f37355b;
        }
        if ((i5 & 4) != 0) {
            map3 = dVar.f37356c;
        }
        if ((i5 & 8) != 0) {
            map4 = dVar.f37357d;
        }
        if ((i5 & 16) != 0) {
            list = dVar.f37358e;
        }
        List list2 = list;
        Map map5 = map3;
        return dVar.a(map, map2, map5, map4, list2);
    }

    public static final Map a(d dVar) {
        return MapsKt.m0(MapsKt.m0(MapsKt.m0(dVar.f37354a, dVar.f37355b), dVar.f37356c), dVar.f37357d);
    }

    @Nullable
    public final String a(int i5) {
        c.a aVar = this.f37354a.get(Integer.valueOf(i5));
        if (aVar != null) {
            return aVar.d();
        }
        return null;
    }
}
