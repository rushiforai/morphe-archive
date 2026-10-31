package uy;

import kl.q0;

/* loaded from: classes.dex */
public class s {

    /* renamed from: a, reason: collision with root package name */
    public String f91749a;

    /* renamed from: c, reason: collision with root package name */
    public n0 f91751c;

    /* renamed from: b, reason: collision with root package name */
    public boolean f91750b = false;

    /* renamed from: d, reason: collision with root package name */
    public y30.b f91752d = null;

    /* renamed from: e, reason: collision with root package name */
    public int f91753e = -1;

    /* renamed from: f, reason: collision with root package name */
    public int f91754f = -1;

    /* renamed from: g, reason: collision with root package name */
    public int f91755g = 262914;

    /* renamed from: h, reason: collision with root package name */
    public iz.c f91756h = new iz.c(0);

    /* renamed from: i, reason: collision with root package name */
    public b f91757i = null;

    public s(String str) {
        this.f91749a = str;
    }

    public o a() {
        return b(null);
    }

    public o b(q0 q0Var) {
        return new o(this);
    }

    public ya.v c() {
        return this.f91757i == null ? new h() : new i(this, 0);
    }

    public final boolean d() {
        return !x7.f.I(this.f91756h.f68417a, 128);
    }

    public final boolean e() {
        return this.f91752d != null;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DrawerGroup(");
        sb2.append(this.f91749a);
        sb2.append(", ");
        return b.c0.o(sb2, this.f91753e, ")");
    }
}
