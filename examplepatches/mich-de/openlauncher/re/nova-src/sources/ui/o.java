package ui;

import android.os.Bundle;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import ni.i0;

/* loaded from: classes.dex */
public final class o extends ni.k implements mi.h, q {

    /* renamed from: j, reason: collision with root package name */
    public final List f91295j;

    /* renamed from: k, reason: collision with root package name */
    public final List f91296k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f91297l;

    /* renamed from: m, reason: collision with root package name */
    public final b f91298m;
    public final ni.b n;
    public final i0 o;

    /* renamed from: p, reason: collision with root package name */
    public final c f91299p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f91300q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f91301r;

    /* renamed from: s, reason: collision with root package name */
    public final mi.a f91302s;

    /* renamed from: t, reason: collision with root package name */
    public final List f91303t;

    /* renamed from: u, reason: collision with root package name */
    public final boolean f91304u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f91305v;

    public o(String str, Set set, String str2, Map map, Bundle bundle, Set set2, Set set3, LinkedHashMap linkedHashMap, String str3, List list, List list2, boolean z11, b bVar, ni.b bVar2, i0 i0Var, c cVar, boolean z12, boolean z13, mi.a aVar, List list3, boolean z14, boolean z15) {
        super(str, set, str2, map, bundle, set2, set3, linkedHashMap, str3);
        this.f91295j = list;
        this.f91296k = list2;
        this.f91297l = z11;
        this.f91298m = bVar;
        this.n = bVar2;
        this.o = i0Var;
        this.f91299p = cVar;
        this.f91300q = z12;
        this.f91301r = z13;
        this.f91302s = aVar;
        this.f91303t = list3;
        this.f91304u = z14;
        this.f91305v = z15;
    }

    @Override // ui.q
    public final List a() {
        return this.f91296k;
    }

    @Override // ui.q
    public final c b() {
        return this.f91299p;
    }

    @Override // mi.h
    public final i0 c() {
        return this.o;
    }

    @Override // ui.q
    public final List d() {
        return this.f91295j;
    }

    @Override // ui.q
    public final ni.b e() {
        return this.n;
    }

    @Override // ui.q
    public final boolean f() {
        return this.f91300q;
    }

    @Override // mi.h
    public final boolean g() {
        return this.f91304u;
    }

    @Override // ui.q
    public final b getMediaAspectRatio() {
        return this.f91298m;
    }

    @Override // mi.h
    public final List h() {
        return this.f91303t;
    }

    @Override // ui.q
    public final boolean i() {
        return this.f91297l;
    }

    @Override // ui.q
    public final boolean j() {
        return this.f91301r;
    }

    @Override // mi.h
    public final mi.a k() {
        return this.f91302s;
    }
}
