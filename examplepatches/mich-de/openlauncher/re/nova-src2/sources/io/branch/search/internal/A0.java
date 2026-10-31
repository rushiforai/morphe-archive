package io.branch.search.internal;

import io.branch.search.internal.C7;
import io.branch.search.internal.requesthandler.model.Link;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class A0 implements Yd {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Long f61895a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f61896b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f61897c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f61898d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f61899e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final C7 f61900f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final C7 f61901g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final List<C3155g> f61902h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final String f61903i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final String f61904j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final String f61905k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final Object f61906l;

    /* renamed from: m, reason: collision with root package name */
    @Nullable
    public final Object f61907m;

    @Nullable
    public final Long n;

    @NotNull
    public final List<Link> o;

    /* renamed from: p, reason: collision with root package name */
    @Nullable
    public final String f61908p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f61909q;

    /* renamed from: r, reason: collision with root package name */
    @Nullable
    public final Float f61910r;

    /* renamed from: s, reason: collision with root package name */
    @Nullable
    public final Long f61911s;

    /* renamed from: t, reason: collision with root package name */
    @Nullable
    public final String f61912t;

    /* renamed from: u, reason: collision with root package name */
    @Nullable
    public final String f61913u;

    /* renamed from: v, reason: collision with root package name */
    @NotNull
    public final List<Yd> f61914v;

    /* renamed from: w, reason: collision with root package name */
    @Nullable
    public final String f61915w;

    public A0(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable C7.d dVar, @NotNull List actions, @Nullable String str4, @Nullable String str5, @Nullable String str6, @Nullable String str7, @Nullable Long l9, @NotNull List linking, @Nullable String str8, @NotNull Map analytics, @Nullable Float f11, @Nullable Long l11, @Nullable String str9, @Nullable String str10, @NotNull List subShortcuts, @Nullable String str11) {
        Intrinsics.g(actions, "actions");
        Intrinsics.g(linking, "linking");
        Intrinsics.g(analytics, "analytics");
        Intrinsics.g(subShortcuts, "subShortcuts");
        this.f61895a = null;
        this.f61896b = str;
        this.f61897c = null;
        this.f61898d = str2;
        this.f61899e = str3;
        this.f61900f = dVar;
        this.f61901g = null;
        this.f61902h = actions;
        this.f61903i = str4;
        this.f61904j = str5;
        this.f61905k = null;
        this.f61906l = str6;
        this.f61907m = str7;
        this.n = l9;
        this.o = linking;
        this.f61908p = str8;
        this.f61909q = analytics;
        this.f61910r = f11;
        this.f61911s = l11;
        this.f61912t = str9;
        this.f61913u = str10;
        this.f61914v = subShortcuts;
        this.f61915w = str11;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String a() {
        return this.f61905k;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String b() {
        return this.f61904j;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String c() {
        return this.f61912t;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Object d() {
        return this.f61906l;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long e() {
        return this.f61911s;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final C7 f() {
        return this.f61901g;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Object g() {
        return this.f61907m;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final EnumC3396u4 getContainerType() {
        return EnumC3396u4.AppStoreSearch;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String h() {
        return this.f61896b;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String i() {
        return this.f61897c;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String j() {
        return this.f61908p;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String k() {
        return this.f61903i;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String l() {
        return this.f61899e;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long m() {
        return this.n;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Float n() {
        return this.f61910r;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final EnumC3449x6 o() {
        return EnumC3449x6.AppStore;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final C7 p() {
        return this.f61900f;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String q() {
        return this.f61898d;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final Long r() {
        return this.f61895a;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<Link> s() {
        return this.o;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<Yd> t() {
        return this.f61914v;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final Map<String, String> u() {
        return this.f61909q;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String v() {
        return this.f61915w;
    }

    @Override // io.branch.search.internal.Yd
    @Nullable
    public final String w() {
        return this.f61913u;
    }

    @Override // io.branch.search.internal.Yd
    @NotNull
    public final List<C3155g> x() {
        return this.f61902h;
    }
}
