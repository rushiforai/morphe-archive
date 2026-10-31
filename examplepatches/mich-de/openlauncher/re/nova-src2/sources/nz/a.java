package nz;

import y9.z;

/* loaded from: classes4.dex */
public final class a implements c {

    /* renamed from: a, reason: collision with root package name */
    public final int f78680a;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f78681b = new float[2];

    /* renamed from: c, reason: collision with root package name */
    public float f78682c;

    /* renamed from: d, reason: collision with root package name */
    public float f78683d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f78684e;

    /* renamed from: f, reason: collision with root package name */
    public float f78685f;

    public a(int i5) {
        this.f78680a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x003c A[RETURN] */
    @Override // nz.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(int i5, int i11, int i12) {
        int i13;
        int i14 = i11 % i12;
        int i15 = i11 / i12;
        if (i5 == 3) {
            if (i11 == 0) {
                return 0;
            }
            if (i11 != 1) {
                return i11 != 2 ? -1 : 2;
            }
        }
        if (i5 == 4 && i12 == 3) {
            if (i11 == 0) {
                return 0;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        return -1;
                    }
                }
                return 3;
            }
        }
        if (i5 == 5 && i12 == 4) {
            if (i11 == 0) {
                return 0;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 4) {
                        return -1;
                    }
                }
            }
            return 3;
        }
        if (i5 <= 5 && i12 > 3) {
            if (i11 == 0) {
                return 0;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    return i11 != 3 ? -1 : 1;
                }
                return 3;
            }
        }
        if (this.f78680a != 4 && i12 != 2) {
            if (i5 == 10 && i12 == 4) {
                if (i14 >= 3 || i15 >= 3) {
                    return (i14 == 3 && i15 == 1) ? 9 : -1;
                }
            } else if (i14 >= 3 || i15 >= 3) {
                return -1;
            }
            i13 = i15 * 3;
        } else {
            if (i14 >= 2 || i15 >= 2) {
                return -1;
            }
            i13 = i15 * 2;
        }
        return i13 + i14;
    }

    @Override // nz.c
    public final int b() {
        return this.f78680a;
    }

    @Override // nz.c
    public final void c(int i5, float f11, boolean z11) {
        float f12 = i5;
        this.f78682c = f12;
        this.f78683d = f11;
        this.f78684e = z11;
        this.f78685f = f12 / (f11 * 1.0f);
    }

    @Override // nz.c
    public final z e(int i5, int i11, z zVar, float f11) {
        float[] fArr = this.f78681b;
        if (i5 == -2) {
            j(f11, 0, fArr);
        } else if (i5 == -3) {
            j(f11, 1, fArr);
        } else if (i5 >= this.f78680a) {
            float f12 = 2;
            float f13 = (this.f78682c / f12) - ((this.f78683d * f11) / f12);
            fArr[1] = f13;
            fArr[0] = f13;
        } else {
            k(i5, i11, f11, fArr);
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
        return this.f78683d;
    }

    @Override // nz.c
    public final float h(int i5, int i11) {
        return (i11 <= 4 ? 0.48f : 0.3f) * this.f78685f;
    }

    @Override // nz.c
    public final float i(int i5, int i11) {
        return i11 - i5;
    }

    public final void j(float f11, int i5, float[] fArr) {
        k(0, 4, f11, fArr);
        float f12 = fArr[0];
        float f13 = fArr[1];
        k(3, 4, f11, fArr);
        float f14 = fArr[0] - f12;
        float f15 = fArr[1] - f13;
        fArr[0] = (2 * f14) + f12;
        fArr[1] = (i5 * f15) + f13;
    }

    public final void k(int i5, int i11, float f11, float[] fArr) {
        float f12 = 2;
        float f13 = (this.f78683d * f11) / f12;
        if (this.f78684e) {
            if (i11 <= 4) {
                float f14 = this.f78682c / f12;
                float f15 = f14 / f12;
                fArr[0] = (((1 - (i5 % 2)) * f14) + f15) - f13;
                fArr[1] = (((i5 / 2) * f14) + f15) - f13;
                return;
            }
            float f16 = this.f78682c / 3;
            float f17 = f16 / f12;
            fArr[0] = (((2 - (i5 % 3)) * f16) + f17) - f13;
            fArr[1] = (((i5 / 3) * f16) + f17) - f13;
            return;
        }
        if (i11 <= 4) {
            float f18 = this.f78682c / f12;
            float f19 = f18 / f12;
            fArr[0] = (((i5 % 2) * f18) + f19) - f13;
            fArr[1] = (((i5 / 2) * f18) + f19) - f13;
            return;
        }
        float f21 = this.f78682c / 3;
        float f22 = f21 / f12;
        fArr[0] = (((i5 % 3) * f21) + f22) - f13;
        fArr[1] = (((i5 / 3) * f21) + f22) - f13;
    }
}
