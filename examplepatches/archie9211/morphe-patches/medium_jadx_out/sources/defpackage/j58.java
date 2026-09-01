package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class j58 {
    public static final long a = en7.B(14);

    public static final long a(long j, long j2) {
        if (!qkd.d(j2)) {
            throw new IllegalArgumentException("The multiplier must be in em, but was " + ((Object) qkd.e(j2)) + '.');
        }
        if (qkd.d(j)) {
            z10.j("Cannot convert Em to Px when style.fontSize is Em (", qkd.e(j2), "). Please declare the style.fontSize with Sp units instead.");
            return 0L;
        }
        long j3 = j & 1095216660480L;
        if (j3 != 0) {
            float fC = qkd.c(j2);
            en7.m(j);
            return en7.M(qkd.c(j) * fC, j3);
        }
        float fC2 = qkd.c(j2);
        long j4 = a;
        en7.m(j4);
        return en7.M(qkd.c(j4) * fC2, j4 & 1095216660480L);
    }
}
