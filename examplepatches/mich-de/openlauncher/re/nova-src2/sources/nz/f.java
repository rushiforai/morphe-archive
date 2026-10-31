package nz;

import e10.y2;
import y9.z;

/* loaded from: classes4.dex */
public final class f implements c {

    /* renamed from: a, reason: collision with root package name */
    public float f78703a;

    /* renamed from: b, reason: collision with root package name */
    public float f78704b;

    /* renamed from: c, reason: collision with root package name */
    public float f78705c;

    @Override // nz.c
    public final int a(int i5, int i11, int i12) {
        return i11 == 0 ? 0 : -1;
    }

    @Override // nz.c
    public final int b() {
        return 1;
    }

    @Override // nz.c
    public final void c(int i5, float f11, boolean z11) {
        float f12 = i5;
        this.f78703a = f12;
        this.f78704b = f11;
        this.f78705c = f12 / (f11 * 1.0f);
    }

    @Override // nz.c
    public final z e(int i5, int i11, z zVar, float f11) {
        float f12 = (this.f78704b * f11) / 2.0f;
        float f13 = this.f78703a;
        float f14 = (f13 / 2.0f) - f12;
        float f15 = (f13 / 2.0f) - f12;
        if (zVar == null) {
            return new z(f14, f15, f11);
        }
        zVar.a(f14, f15, f11);
        return zVar;
    }

    @Override // nz.c
    public final float g() {
        return this.f78704b;
    }

    @Override // nz.c
    public final float h(int i5, int i11) {
        return this.f78705c / ((fz.d) y2.f51877a.i().l()).d();
    }
}
