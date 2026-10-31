package com.google.android.gms.internal.measurement;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class mc {

    /* renamed from: b, reason: collision with root package name */
    public static final mc f32819b;

    /* renamed from: a, reason: collision with root package name */
    public final xk.k1 f32820a;

    static {
        int i5 = xk.k1.f95949f;
        f32819b = new mc(xk.a3.f95859h);
    }

    public mc(xk.k1 k1Var) {
        this.f32820a = k1Var;
    }

    public static mc a(y0 y0Var) throws zzaeh {
        long j11;
        String strW;
        lc lcVar;
        int iG = y0Var.G();
        if (iG < 0) {
            throw new zzaeh("Negative number of flags");
        }
        int i5 = xk.k1.f95949f;
        xk.i2 i2Var = xk.i2.f95937b;
        w20.e.e(4, "initialCapacity");
        Object[] objArrCopyOf = new Object[4];
        int i11 = 0;
        int i12 = 0;
        boolean z11 = false;
        long j12 = 0;
        while (i11 < iG) {
            long jH = y0Var.H();
            int i13 = (int) jH;
            long j13 = jH >>> 3;
            if (j13 == 0) {
                j11 = 0;
                strW = y0Var.w();
            } else {
                long j14 = j13 + j12;
                if (j14 > 2305843009213693951L) {
                    throw new zzaeh("Flag name larger than max size");
                }
                j11 = j14;
                strW = null;
            }
            int i14 = i13 & 7;
            if (i14 == 0 || i14 == 1) {
                lcVar = new lc(j11, strW, i14, 0L, null);
            } else if (i14 == 2) {
                lcVar = new lc(j11, strW, i14, y0Var.H(), null);
            } else if (i14 == 3) {
                lcVar = new lc(j11, strW, i14, Double.doubleToRawLongBits(y0Var.o()), null);
            } else if (i14 == 4) {
                lcVar = new lc(j11, strW, i14, 0L, y0Var.w());
            } else {
                if (i14 != 5) {
                    throw new zzaeh(b.c0.p(new StringBuilder(String.valueOf(i14).length() + 23), "Unrecognized flag type ", i14));
                }
                lcVar = new lc(j11, strW, i14, 0L, y0Var.z());
            }
            lc lcVar2 = lcVar;
            long j15 = lcVar2.f32785a;
            if (j15 != 0) {
                j12 = j15;
            }
            int i15 = i12 + 1;
            if (objArrCopyOf.length < i15) {
                objArrCopyOf = Arrays.copyOf(objArrCopyOf, rg.m.c(objArrCopyOf.length, i15));
            } else if (z11) {
                objArrCopyOf = (Object[]) objArrCopyOf.clone();
            } else {
                objArrCopyOf[i12] = lcVar2;
                i11++;
                i12++;
            }
            z11 = false;
            objArrCopyOf[i12] = lcVar2;
            i11++;
            i12++;
        }
        xk.a3 a3VarS = xk.k1.s(i2Var, i12, objArrCopyOf);
        a3VarS.f95860g.size();
        return new mc(a3VarS);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof mc)) {
            return false;
        }
        return this.f32820a.equals(((mc) obj).f32820a);
    }

    public final int hashCode() {
        xk.k1 k1Var = this.f32820a;
        k1Var.getClass();
        return xk.w.l(k1Var);
    }
}
