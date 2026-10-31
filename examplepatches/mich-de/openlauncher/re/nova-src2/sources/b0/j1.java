package b0;

/* loaded from: classes.dex */
public final class j1 {

    /* renamed from: a, reason: collision with root package name */
    public final float f16154a;

    /* renamed from: b, reason: collision with root package name */
    public final float f16155b;

    public j1(float f11, y3.c cVar) {
        this.f16154a = f11;
        float density = cVar.getDensity();
        float f12 = k1.f16165a;
        this.f16155b = density * 386.0878f * 160.0f * 0.84f;
    }

    public i1 a(float f11) {
        float[] fArr = b.f16051a;
        double dA = b.a(f11, this.f16154a * this.f16155b);
        double d5 = k1.f16165a;
        double d11 = d5 - 1.0d;
        return new i1(f11, (float) (Math.exp((d5 / d11) * dA) * r0 * r1), (long) (Math.exp(dA / d11) * 1000.0d));
    }

    public j1(float f11, float f12) {
        this.f16154a = f11;
        this.f16155b = f12;
    }
}
