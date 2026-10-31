package e1;

import z2.r1;

/* loaded from: classes2.dex */
public abstract class h0 {
    public static final h2.c a(z2.y yVar) {
        h2.c cVarE = r1.e(yVar);
        long j11 = yVar.j(cVarE.d());
        float f11 = cVarE.f59020c;
        float f12 = cVarE.f59021d;
        long j12 = yVar.j((Float.floatToRawIntBits(f11) << 32) | (Float.floatToRawIntBits(f12) & 4294967295L));
        return new h2.c(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)), Float.intBitsToFloat((int) (j12 >> 32)), Float.intBitsToFloat((int) (j12 & 4294967295L)));
    }
}
