package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pj2 implements yn3 {
    public final float a;
    public final float b;
    public final float c;
    public final float d;
    public final float e;
    public final float f;

    public pj2(float f, float f2, float f3, float f4) {
        int iM;
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
        if (!((Float.isNaN(f) || Float.isNaN(f2) || Float.isNaN(f3) || Float.isNaN(f4)) ? false : true)) {
            zx9.a("Parameters to CubicBezierEasing cannot be NaN. Actual parameters are: " + f + ", " + f2 + ", " + f3 + ", " + f4 + '.');
        }
        float[] fArr = new float[5];
        float f5 = (f2 - 0.0f) * 3.0f;
        float f6 = (f4 - f2) * 3.0f;
        float f7 = (1.0f - f4) * 3.0f;
        double d = f5;
        double d2 = f6;
        double d3 = f7;
        double d4 = d2 * 2.0d;
        double d5 = (d - d4) + d3;
        if (d5 == 0.0d) {
            iM = d2 == d3 ? 0 : o7f.M((float) ((d4 - d3) / (d4 - (d3 * 2.0d))), fArr, 0);
        } else {
            double d6 = -Math.sqrt((d2 * d2) - (d3 * d));
            double d7 = (-d) + d2;
            int iM2 = o7f.M((float) ((-(d6 + d7)) / d5), fArr, 0);
            int iM3 = o7f.M((float) ((d6 - d7) / d5), fArr, iM2) + iM2;
            if (iM3 > 1) {
                float f8 = fArr[0];
                float f9 = fArr[1];
                if (f8 > f9) {
                    fArr[0] = f9;
                    fArr[1] = f8;
                } else if (f8 == f9) {
                    iM = iM3 - 1;
                }
                iM = iM3;
            } else {
                iM = iM3;
            }
        }
        float f10 = (f6 - f5) * 2.0f;
        int iM4 = o7f.M((-f10) / (((f7 - f6) * 2.0f) - f10), fArr, iM) + iM;
        float fMin = Math.min(0.0f, 1.0f);
        float fMax = Math.max(0.0f, 1.0f);
        for (int i = 0; i < iM4; i++) {
            float f11 = fArr[i];
            float f12 = (((((((((f2 - f4) * 3.0f) + 1.0f) - 0.0f) * f11) + (((f4 - (f2 * 2.0f)) + 0.0f) * 3.0f)) * f11) + f5) * f11) + 0.0f;
            fMin = Math.min(fMin, f12);
            fMax = Math.max(fMax, f12);
        }
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fMin)) << 32) | (((long) Float.floatToRawIntBits(fMax)) & 4294967295L);
        this.e = Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32));
        this.f = Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L));
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0092 A[PHI: r3
      0x0092: PHI (r3v27 float) = (r3v5 float), (r3v16 float), (r3v21 float), (r3v31 float), (r3v36 float) binds: [B:128:0x0236, B:117:0x0206, B:92:0x01bb, B:47:0x00e5, B:22:0x008e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0162 A[PHI: r12
      0x0162: PHI (r12v41 float) = (r12v25 float), (r12v36 float) binds: [B:68:0x0160, B:81:0x0191] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.yn3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final float a(float r27) {
        /*
            Method dump skipped, instruction units count: 658
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pj2.a(float):float");
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof pj2)) {
            return false;
        }
        pj2 pj2Var = (pj2) obj;
        return this.a == pj2Var.a && this.b == pj2Var.b && this.c == pj2Var.c && this.d == pj2Var.d;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + km4.p(this.c, km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CubicBezierEasing(a=");
        sb.append(this.a);
        sb.append(", b=");
        sb.append(this.b);
        sb.append(", c=");
        sb.append(this.c);
        sb.append(", d=");
        return lv8.s(sb, this.d, ')');
    }
}
