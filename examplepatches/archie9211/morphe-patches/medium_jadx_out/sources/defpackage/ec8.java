package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ec8 implements zk7 {
    public final /* synthetic */ m45 a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ boolean c;

    public ec8(m45 m45Var, b55 b55Var, boolean z) {
        this.a = m45Var;
        this.b = b55Var;
        this.c = z;
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int a(y66 y66Var, List list, int i) {
        return ev6.c(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final al7 b(final bl7 bl7Var, List list, long j) {
        float f;
        Object obj;
        t99 t99VarS;
        t99 t99VarS2;
        float fFloatValue = ((Number) this.a.invoke()).floatValue();
        float f2 = fFloatValue >= 0.0f ? fFloatValue : 0.0f;
        long jA = f72.a(j, 0, 0, 0, 0, 10);
        int size = list.size();
        for (int i = 0; i < size; i++) {
            tk7 tk7Var = (tk7) list.get(i);
            if (g76.L(kng.F(tk7Var), "icon")) {
                final t99 t99VarS3 = tk7Var.s(jA);
                float f3 = 2.0f;
                int iI0 = bl7Var.i0(fc8.d * 2.0f) + t99VarS3.a;
                int iW0 = nk7.w0(iI0 * f2);
                int iI02 = bl7Var.i0(fc8.e * 2.0f) + t99VarS3.b;
                int size2 = list.size();
                int i2 = 0;
                while (i2 < size2) {
                    tk7 tk7Var2 = (tk7) list.get(i2);
                    float f4 = f3;
                    if (g76.L(kng.F(tk7Var2), "indicatorRipple")) {
                        if (!((iI0 >= 0) & (iI02 >= 0))) {
                            d26.a("width and height must be >= 0");
                        }
                        final t99 t99VarS4 = tk7Var2.s(h72.h(iI0, iI0, iI02, iI02));
                        int size3 = list.size();
                        int i3 = 0;
                        while (true) {
                            if (i3 >= size3) {
                                f = f2;
                                obj = null;
                                break;
                            }
                            obj = list.get(i3);
                            f = f2;
                            if (g76.L(kng.F((tk7) obj), "indicator")) {
                                break;
                            }
                            i3++;
                            f2 = f;
                        }
                        tk7 tk7Var3 = (tk7) obj;
                        if (tk7Var3 != null) {
                            if (!((iW0 >= 0) & (iI02 >= 0))) {
                                d26.a("width and height must be >= 0");
                            }
                            t99VarS = tk7Var3.s(h72.h(iW0, iW0, iI02, iI02));
                        } else {
                            t99VarS = null;
                        }
                        b55 b55Var = this.b;
                        if (b55Var != null) {
                            int size4 = list.size();
                            for (int i4 = 0; i4 < size4; i4++) {
                                tk7 tk7Var4 = (tk7) list.get(i4);
                                if (g76.L(kng.F(tk7Var4), "label")) {
                                    t99VarS2 = tk7Var4.s(jA);
                                }
                            }
                            z27.c("Collection contains no element matching the predicate.");
                            z72.b();
                            return null;
                        }
                        t99VarS2 = null;
                        fy3 fy3Var = fy3.a;
                        if (b55Var == null) {
                            final int iI03 = f72.h(j) == Integer.MAX_VALUE ? (bl7Var.i0(fc8.g) * 2) + t99VarS3.a : f72.h(j);
                            final int iF = h72.f(bl7Var.i0(fc8.a), j);
                            final int i5 = (iI03 - t99VarS3.a) / 2;
                            final int i6 = (iF - t99VarS3.b) / 2;
                            final int i7 = (iI03 - t99VarS4.a) / 2;
                            final int i8 = (iF - t99VarS4.b) / 2;
                            final t99 t99Var = t99VarS;
                            return bl7Var.q0(iI03, iF, fy3Var, new x45() { // from class: bc8
                                @Override // defpackage.x45
                                public final Object invoke(Object obj2) {
                                    s99 s99Var = (s99) obj2;
                                    t99 t99Var2 = t99Var;
                                    if (t99Var2 != null) {
                                        s99.j(s99Var, t99Var2, (iI03 - t99Var2.a) / 2, (iF - t99Var2.b) / 2);
                                    }
                                    s99.j(s99Var, t99VarS3, i5, i6);
                                    s99.j(s99Var, t99VarS4, i7, i8);
                                    return c1e.a;
                                }
                            });
                        }
                        final t99 t99Var2 = t99VarS;
                        t99VarS2.getClass();
                        float f5 = t99VarS3.b;
                        float f6 = fc8.e;
                        float fZ = bl7Var.Z(f6) + f5;
                        float f7 = fc8.c;
                        float fZ2 = bl7Var.Z(f7) + fZ + t99VarS2.b;
                        float fI = (f72.i(j) - fZ2) / f4;
                        float fZ3 = bl7Var.Z(f6);
                        if (fI < fZ3) {
                            fI = fZ3;
                        }
                        float f8 = (fI * f4) + fZ2;
                        final boolean z = this.c;
                        final float f9 = (1.0f - f) * ((z ? fI : (f8 - t99VarS3.b) / f4) - fI);
                        final float fZ4 = bl7Var.Z(f7) + bl7Var.Z(f6) + t99VarS3.b + fI;
                        final int iI04 = f72.h(j) == Integer.MAX_VALUE ? (bl7Var.i0(fc8.g) * 2) + t99VarS3.a : f72.h(j);
                        final int i9 = (iI04 - t99VarS2.a) / 2;
                        final int i10 = (iI04 - t99VarS3.a) / 2;
                        final int i11 = (iI04 - t99VarS4.a) / 2;
                        final float fZ5 = fI - bl7Var.Z(f6);
                        final float f10 = fI;
                        final t99 t99Var3 = t99VarS2;
                        final float f11 = f;
                        return bl7Var.q0(iI04, nk7.w0(f8), fy3Var, new x45() { // from class: ac8
                            @Override // defpackage.x45
                            public final Object invoke(Object obj2) {
                                s99 s99Var = (s99) obj2;
                                t99 t99Var4 = t99Var2;
                                float f12 = f9;
                                float f13 = f10;
                                if (t99Var4 != null) {
                                    s99.j(s99Var, t99Var4, (iI04 - t99Var4.a) / 2, nk7.w0((f13 - bl7Var.i0(fc8.e)) + f12));
                                }
                                if (z || f11 != 0.0f) {
                                    s99.j(s99Var, t99Var3, i9, nk7.w0(fZ4 + f12));
                                }
                                s99.j(s99Var, t99VarS3, i10, nk7.w0(f13 + f12));
                                s99.j(s99Var, t99VarS4, i11, nk7.w0(fZ5 + f12));
                                return c1e.a;
                            }
                        });
                    }
                    i2++;
                    f3 = f4;
                }
                z27.c("Collection contains no element matching the predicate.");
                z72.b();
                return null;
            }
        }
        z27.c("Collection contains no element matching the predicate.");
        z72.b();
        return null;
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int c(y66 y66Var, List list, int i) {
        return ev6.g(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int d(y66 y66Var, List list, int i) {
        return ev6.a(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int e(y66 y66Var, List list, int i) {
        return ev6.e(this, y66Var, list, i);
    }
}
