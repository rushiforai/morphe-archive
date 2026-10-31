package e1;

import e10.z2;

/* loaded from: classes2.dex */
public final class t implements h {

    /* renamed from: b, reason: collision with root package name */
    public static final t f51382b = new t(0);

    /* renamed from: c, reason: collision with root package name */
    public static final t f51383c = new t(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a5.i f51384d = new a5.i(15);

    /* renamed from: e, reason: collision with root package name */
    public static final a5.i f51385e = new a5.i(16);

    /* renamed from: f, reason: collision with root package name */
    public static final a5.i f51386f = new a5.i(17);

    /* renamed from: g, reason: collision with root package name */
    public static final a5.i f51387g = new a5.i(18);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51388a;

    public /* synthetic */ t(int i5) {
        this.f51388a = i5;
    }

    @Override // e1.h
    public long a(aq.y yVar, int i5) {
        switch (this.f51388a) {
            case 0:
                String str = ((m3.l0) yVar.f15540e).f75927a.f75914a.f75880b;
                return z2.u(pg.p.k(i5, str), pg.p.j(i5, str));
            default:
                return ((m3.l0) yVar.f15540e).i(i5);
        }
    }
}
