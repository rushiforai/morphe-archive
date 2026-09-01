package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e3b {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;
    public final float[] f;
    public final ml0 g;

    public e3b(long j, long j2, long j3, long j4, long j5, float[] fArr, ml0 ml0Var) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
        this.f = fArr;
        this.g = ml0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x004d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r7) {
        /*
            r6 = this;
            r0 = 1
            if (r6 != r7) goto L4
            return r0
        L4:
            r1 = 0
            if (r7 == 0) goto L61
            java.lang.Class<e3b> r2 = defpackage.e3b.class
            java.lang.Class r3 = r7.getClass()
            if (r2 == r3) goto L10
            goto L61
        L10:
            e3b r7 = (defpackage.e3b) r7
            long r2 = r6.a
            long r4 = r7.a
            int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r2 == 0) goto L1b
            goto L61
        L1b:
            long r2 = r6.b
            long r4 = r7.b
            int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r2 == 0) goto L24
            goto L61
        L24:
            long r2 = r6.e
            long r4 = r7.e
            int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r2 == 0) goto L2d
            goto L61
        L2d:
            long r2 = r6.c
            long r4 = r7.c
            boolean r2 = defpackage.k46.b(r2, r4)
            if (r2 != 0) goto L38
            goto L61
        L38:
            long r2 = r6.d
            long r4 = r7.d
            boolean r2 = defpackage.k46.b(r2, r4)
            if (r2 != 0) goto L43
            goto L61
        L43:
            float[] r2 = r7.f
            float[] r3 = r6.f
            if (r3 != 0) goto L4f
            if (r2 != 0) goto L4d
            r2 = r0
            goto L56
        L4d:
            r2 = r1
            goto L56
        L4f:
            if (r2 != 0) goto L52
            goto L4d
        L52:
            boolean r2 = r3.equals(r2)
        L56:
            if (r2 != 0) goto L59
            goto L61
        L59:
            ml0 r6 = r6.g
            ml0 r7 = r7.g
            if (r6 == r7) goto L60
            return r1
        L60:
            return r0
        L61:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.e3b.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        int i = ((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        long j3 = this.e;
        int i2 = (i + ((int) (j3 ^ (j3 >>> 32)))) * 31;
        long j4 = this.c;
        int i3 = (((int) (j4 ^ (j4 >>> 32))) + i2) * 31;
        long j5 = this.d;
        int i4 = (((int) (j5 ^ (j5 >>> 32))) + i3) * 31;
        float[] fArr = this.f;
        return this.g.hashCode() + ((i4 + (fArr != null ? Arrays.hashCode(fArr) : 0)) * 31);
    }
}
