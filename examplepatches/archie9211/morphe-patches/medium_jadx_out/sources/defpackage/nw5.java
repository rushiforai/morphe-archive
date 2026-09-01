package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nw5 implements lfc {
    public final sw5 b;
    public final int c;
    public final int d;

    public nw5(Context context, sw5 sw5Var) {
        context.getClass();
        int i = context.getResources().getDisplayMetrics().widthPixels;
        int i2 = context.getResources().getDisplayMetrics().heightPixels;
        this.b = sw5Var;
        this.c = i;
        this.d = i2;
    }

    public final cfc a() {
        sw5 sw5Var = this.b;
        Float fValueOf = sw5Var.getOriginalWidth() != null ? Float.valueOf(r1.intValue()) : null;
        if (g76.J(fValueOf, 0.0f)) {
            fValueOf = null;
        }
        int i = this.c;
        int i2 = this.d;
        if (fValueOf == null) {
            int iMin = Math.min(i, i2);
            return kk7.o(iMin, iMin);
        }
        float fFloatValue = fValueOf.floatValue();
        Float fValueOf2 = sw5Var.getOriginalHeight() != null ? Float.valueOf(r0.intValue()) : null;
        Float f = g76.J(fValueOf2, 0.0f) ? null : fValueOf2;
        if (f == null) {
            int iMin2 = Math.min(i, i2);
            return kk7.o(iMin2, iMin2);
        }
        float fFloatValue2 = f.floatValue();
        float f2 = fFloatValue2 / fFloatValue;
        return fFloatValue >= fFloatValue2 ? kk7.o(i, nk7.w0(i * f2)) : kk7.o(nk7.w0(i2 / f2), i2);
    }

    @Override // defpackage.lfc
    public final Object f(p92 p92Var) {
        return a();
    }
}
