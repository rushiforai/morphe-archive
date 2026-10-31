package x9;

import o9.g3;

/* loaded from: classes2.dex */
public final class m {

    /* renamed from: e, reason: collision with root package name */
    public static final wj.i f95664e = new wj.i(1);

    /* renamed from: a, reason: collision with root package name */
    public final u f95665a;

    /* renamed from: b, reason: collision with root package name */
    public final z5.c f95666b;

    /* renamed from: c, reason: collision with root package name */
    public final float f95667c;

    /* renamed from: d, reason: collision with root package name */
    public float f95668d;

    public m(u uVar, float f11) {
        this.f95665a = uVar;
        float f12 = uVar.getResources().getDisplayMetrics().density * 8.0f;
        this.f95667c = f12;
        float fMax = Math.max(f12, f11);
        z5.c cVar = new z5.c((Object) this, (ps.j) f95664e, 0.0f);
        cVar.f98233h = -fMax;
        cVar.f98232g = fMax;
        z5.d dVar = new z5.d(0.0f);
        dVar.a(1.0f);
        dVar.b(4000.0f);
        cVar.f98238m = dVar;
        this.f95666b = cVar;
    }

    public final void b(float f11) {
        float f12 = this.f95667c;
        float fB = g3.b(f11, -f12, f12);
        z5.c cVar = this.f95666b;
        if (cVar.f98231f) {
            cVar.n = fB;
            return;
        }
        if (cVar.f98238m == null) {
            cVar.f98238m = new z5.d(fB);
        }
        cVar.f98238m.f98247i = fB;
        cVar.e();
    }
}
