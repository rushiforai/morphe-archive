package nz;

import y9.z;

/* loaded from: classes4.dex */
public final class b implements c {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f78686a;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f78687b = new float[2];

    /* renamed from: c, reason: collision with root package name */
    public float f78688c;

    /* renamed from: d, reason: collision with root package name */
    public float f78689d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f78690e;

    /* renamed from: f, reason: collision with root package name */
    public float f78691f;

    public b(boolean z11) {
        this.f78686a = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x002a A[RETURN] */
    @Override // nz.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(int i5, int i11, int i12) {
        if (i12 == 2) {
            if (i11 > 2) {
                return -1;
            }
        } else if (i12 <= 2 || i5 != 2) {
            if (!this.f78686a) {
                if (i11 != 0) {
                    if (i11 == 1) {
                        return 0;
                    }
                    if (i11 != 2) {
                        return -1;
                    }
                }
            }
            if (i12 < i5) {
                if (i11 == 0) {
                    return 0;
                }
                if (i11 != 1) {
                    return i11 == i12 ? 2 : -1;
                }
            }
            if (i11 == 0) {
                return 0;
            }
            if (i11 != 1) {
                return i11 != 2 ? -1 : 1;
            }
        }
        return i11;
    }

    @Override // nz.c
    public final int b() {
        return 3;
    }

    @Override // nz.c
    public final void c(int i5, float f11, boolean z11) {
        float f12 = i5;
        this.f78688c = f12;
        this.f78689d = f11;
        this.f78690e = z11;
        this.f78691f = f12 / (f11 * 1.0f);
    }

    @Override // nz.c
    public final z e(int i5, int i11, z zVar, float f11) {
        float[] fArr = this.f78687b;
        if (i5 == -2) {
            j(fArr, 0);
        } else if (i5 == -3) {
            j(fArr, 1);
        } else if (i5 >= 3) {
            float f12 = 2;
            float f13 = (this.f78688c / f12) - ((this.f78689d * f11) / f12);
            fArr[1] = f13;
            fArr[0] = f13;
        } else {
            k(i5, i11, fArr);
        }
        float f14 = fArr[0];
        float f15 = fArr[1];
        if (zVar == null) {
            return new z(f14, f15, f11);
        }
        zVar.a(f14, f15, f11);
        return zVar;
    }

    @Override // nz.c
    public final float g() {
        return this.f78689d;
    }

    @Override // nz.c
    public final float h(int i5, int i11) {
        return this.f78691f * (i5 == 0 ? 0.6666667f : 0.53333336f);
    }

    @Override // nz.c
    public final float i(int i5, int i11) {
        return i5 == 0 ? 1.0f : 0.0f;
    }

    public final void j(float[] fArr, int i5) {
        k(0, 4, fArr);
        float f11 = fArr[0];
        float f12 = fArr[1];
        k(3, 4, fArr);
        float f13 = fArr[0] - f11;
        float f14 = fArr[1] - f12;
        fArr[0] = (2 * f13) + f11;
        fArr[1] = (i5 * f14) + f12;
    }

    public final void k(int i5, int i11, float[] fArr) {
        float f11 = 2;
        float fH = (h(i5, i11) * this.f78689d) / f11;
        if (this.f78690e) {
            if (i5 == 1) {
                i5 = 2;
            } else if (i5 == 2) {
                i5 = 1;
            }
        }
        fArr[0] = i5 != 0 ? i5 != 1 ? ((this.f78688c / f11) - ((1 * fH) / 40.0f)) - (f11 * fH) : (this.f78688c / f11) + ((1 * fH) / 40.0f) : (this.f78688c / f11) - fH;
        fArr[1] = (this.f78688c / f11) - fH;
    }
}
