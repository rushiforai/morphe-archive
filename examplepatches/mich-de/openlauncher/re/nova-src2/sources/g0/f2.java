package g0;

/* loaded from: classes.dex */
public final class f2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h2 f56522a;

    public f2(h2 h2Var) {
        this.f56522a = h2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x021b  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x024c  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x025b A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0261  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0269  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x0312  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01ac  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01d2  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01de  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long a(int i5, long j11) {
        long j12;
        long j13;
        float fIntBitsToFloat;
        int i11;
        char c11;
        float fIntBitsToFloat2;
        long jFloatToRawIntBits;
        long jF;
        boolean z11;
        boolean zF;
        boolean z12;
        int i12;
        boolean z13;
        h2 h2Var = this.f56522a;
        h2Var.f56566j = i5;
        e0.n1 n1Var = h2Var.f56558b;
        if (n1Var == null || !(h2Var.f56557a.e() || h2Var.f56557a.c())) {
            return h2Var.c(h2Var.f56567k, j11, i5);
        }
        int i13 = h2Var.f56566j;
        cw.c0 c0Var = h2Var.f56569m;
        e0.k kVar = (e0.k) n1Var;
        e0.k0 k0Var = kVar.f50037c;
        if (h2.e.e(kVar.f50041g)) {
            return ((h2.b) c0Var.invoke(new h2.b(j11))).f59016a;
        }
        if (!kVar.f50040f) {
            if (e0.k0.g(k0Var.f50049f)) {
                kVar.f(0L);
            }
            if (e0.k0.g(k0Var.f50050g)) {
                kVar.g(0L);
            }
            if (e0.k0.g(k0Var.f50047d)) {
                kVar.h(0L);
            }
            if (e0.k0.g(k0Var.f50048e)) {
                kVar.e(0L);
            }
            kVar.f50040f = true;
        }
        int i14 = e0.m.f50069a;
        float f11 = i13 == 2 ? 4.0f : 1.0f;
        long jH = h2.b.h(f11, j11);
        int i15 = (int) (j11 & 4294967295L);
        if (Float.intBitsToFloat(i15) != 0.0f) {
            if (!e0.k0.g(k0Var.f50047d) || Float.intBitsToFloat(i15) >= 0.0f) {
                j12 = 4294967295L;
                if (!e0.k0.g(k0Var.f50048e) || Float.intBitsToFloat(i15) <= 0.0f) {
                    j13 = jH;
                } else {
                    float fE = kVar.e(jH);
                    if (!e0.k0.g(k0Var.f50048e)) {
                        k0Var.b().finish();
                    }
                    j13 = jH;
                    fIntBitsToFloat = fE == Float.intBitsToFloat((int) (j13 & 4294967295L)) ? Float.intBitsToFloat(i15) : fE / f11;
                }
            } else {
                float fH = kVar.h(jH);
                j12 = 4294967295L;
                if (!e0.k0.g(k0Var.f50047d)) {
                    k0Var.e().finish();
                }
                fIntBitsToFloat = fH == Float.intBitsToFloat((int) (jH & 4294967295L)) ? Float.intBitsToFloat(i15) : fH / f11;
                j13 = jH;
            }
            i11 = (int) (j11 >> 32);
            if (Float.intBitsToFloat(i11) == 0.0f) {
                if (!e0.k0.g(k0Var.f50049f) || Float.intBitsToFloat(i11) >= 0.0f) {
                    long j14 = j13;
                    c11 = ' ';
                    if (e0.k0.g(k0Var.f50050g) && Float.intBitsToFloat(i11) > 0.0f) {
                        float fG = kVar.g(j14);
                        if (!e0.k0.g(k0Var.f50050g)) {
                            k0Var.d().finish();
                        }
                        fIntBitsToFloat2 = fG == Float.intBitsToFloat((int) (j14 >> 32)) ? Float.intBitsToFloat(i11) : fG / f11;
                    }
                } else {
                    long j15 = j13;
                    float f12 = kVar.f(j15);
                    c11 = ' ';
                    if (!e0.k0.g(k0Var.f50049f)) {
                        k0Var.c().finish();
                    }
                    fIntBitsToFloat2 = f12 == Float.intBitsToFloat((int) (j15 >> 32)) ? Float.intBitsToFloat(i11) : f12 / f11;
                }
                jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat) & j12) | (Float.floatToRawIntBits(fIntBitsToFloat2) << c11);
                if (!h2.b.b(jFloatToRawIntBits, 0L)) {
                    kVar.d();
                }
                jF = h2.b.f(j11, jFloatToRawIntBits);
                long j16 = ((h2.b) c0Var.invoke(new h2.b(jF))).f59016a;
                long jF2 = h2.b.f(jF, j16);
                if ((Float.intBitsToFloat((int) (jF >> c11)) != 0.0f || Float.intBitsToFloat((int) (jF & j12)) != 0.0f) && ((Float.intBitsToFloat((int) (j16 >> c11)) != 0.0f || Float.intBitsToFloat((int) (j16 & j12)) != 0.0f) && (e0.k0.g(k0Var.f50049f) || e0.k0.g(k0Var.f50047d) || e0.k0.g(k0Var.f50050g) || e0.k0.g(k0Var.f50048e)))) {
                    kVar.a();
                }
                if (i13 == 1) {
                    int i16 = (int) (jF2 >> c11);
                    if (Float.intBitsToFloat(i16) > 0.5f) {
                        kVar.f(jF2);
                    } else if (Float.intBitsToFloat(i16) < -0.5f) {
                        kVar.g(jF2);
                    } else {
                        z12 = false;
                        i12 = (int) (jF2 & j12);
                        if (Float.intBitsToFloat(i12) <= 0.5f) {
                            kVar.h(jF2);
                        } else if (Float.intBitsToFloat(i12) < -0.5f) {
                            kVar.e(jF2);
                        } else {
                            z13 = false;
                            z11 = !z12 || z13;
                        }
                        z13 = true;
                        if (z12) {
                        }
                    }
                    z12 = true;
                    i12 = (int) (jF2 & j12);
                    if (Float.intBitsToFloat(i12) <= 0.5f) {
                    }
                    z13 = true;
                    if (z12) {
                    }
                }
                if (!h2.b.b(jF, 0L)) {
                    if (!e0.k0.f(k0Var.f50049f) || Float.intBitsToFloat(i11) >= 0.0f) {
                        zF = false;
                    } else {
                        jk.b.R(k0Var.c(), Float.intBitsToFloat(i11));
                        zF = e0.k0.f(k0Var.f50049f);
                    }
                    if (e0.k0.f(k0Var.f50050g) && Float.intBitsToFloat(i11) > 0.0f) {
                        jk.b.R(k0Var.d(), Float.intBitsToFloat(i11));
                        zF = zF || e0.k0.f(k0Var.f50050g);
                    }
                    if (e0.k0.f(k0Var.f50047d) && Float.intBitsToFloat(i15) < 0.0f) {
                        jk.b.R(k0Var.e(), Float.intBitsToFloat(i15));
                        zF = zF || e0.k0.f(k0Var.f50047d);
                    }
                    if (e0.k0.f(k0Var.f50048e) && Float.intBitsToFloat(i15) > 0.0f) {
                        jk.b.R(k0Var.b(), Float.intBitsToFloat(i15));
                        zF = zF || e0.k0.f(k0Var.f50048e);
                    }
                    z11 = zF || z11;
                }
                if (z11) {
                    kVar.d();
                }
                return h2.b.g(jFloatToRawIntBits, j16);
            }
            c11 = ' ';
            fIntBitsToFloat2 = 0.0f;
            jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat) & j12) | (Float.floatToRawIntBits(fIntBitsToFloat2) << c11);
            if (!h2.b.b(jFloatToRawIntBits, 0L)) {
            }
            jF = h2.b.f(j11, jFloatToRawIntBits);
            long j162 = ((h2.b) c0Var.invoke(new h2.b(jF))).f59016a;
            long jF22 = h2.b.f(jF, j162);
            if (Float.intBitsToFloat((int) (jF >> c11)) != 0.0f) {
                kVar.a();
            } else {
                kVar.a();
            }
            if (i13 == 1) {
            }
            if (!h2.b.b(jF, 0L)) {
            }
            if (z11) {
            }
            return h2.b.g(jFloatToRawIntBits, j162);
        }
        j13 = jH;
        j12 = 4294967295L;
        fIntBitsToFloat = 0.0f;
        i11 = (int) (j11 >> 32);
        if (Float.intBitsToFloat(i11) == 0.0f) {
        }
        fIntBitsToFloat2 = 0.0f;
        jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat) & j12) | (Float.floatToRawIntBits(fIntBitsToFloat2) << c11);
        if (!h2.b.b(jFloatToRawIntBits, 0L)) {
        }
        jF = h2.b.f(j11, jFloatToRawIntBits);
        long j1622 = ((h2.b) c0Var.invoke(new h2.b(jF))).f59016a;
        long jF222 = h2.b.f(jF, j1622);
        if (Float.intBitsToFloat((int) (jF >> c11)) != 0.0f) {
        }
        if (i13 == 1) {
        }
        if (!h2.b.b(jF, 0L)) {
        }
        if (z11) {
        }
        return h2.b.g(jFloatToRawIntBits, j1622);
    }
}
