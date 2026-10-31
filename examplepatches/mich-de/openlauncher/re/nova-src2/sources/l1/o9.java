package l1;

/* loaded from: classes2.dex */
public final class o9 {

    /* renamed from: d, reason: collision with root package name */
    public static final ab.c0 f73758d = y1.j.b(i1.J, x.f74204u);

    /* renamed from: a, reason: collision with root package name */
    public final p1.m2 f73759a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.m2 f73760b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.m2 f73761c;

    public o9(float f11, float f12, float f13) {
        this.f73759a = androidx.compose.runtime.d.f(f11);
        this.f73760b = androidx.compose.runtime.d.f(f13);
        this.f73761c = androidx.compose.runtime.d.f(f12);
    }

    public final float a() {
        if (c() == 0.0f) {
            return 0.0f;
        }
        return b() / c();
    }

    public final float b() {
        return this.f73761c.m();
    }

    public final float c() {
        return this.f73759a.m();
    }

    public final void d(float f11) {
        this.f73761c.p(kotlin.ranges.a.d0(f11, c(), 0.0f));
    }
}
