package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class o08 {
    public static final long o;
    public static final long p;
    public static final long q;
    public static final long r;
    public static final /* synthetic */ int s = 0;
    public final sb2 a;
    public final kb2 b;
    public final rp7 c;
    public final j08 d;
    public final m45 e;
    public final long f;
    public final hx4 g;
    public final a98 h;
    public final ArrayList i;
    public final olb j;
    public final olb k;
    public boolean l;
    public int m;
    public long n;

    static {
        int i = in3.d;
        o = hlg.T(5, mn3.DAYS);
        mn3 mn3Var = mn3.SECONDS;
        p = hlg.T(5, mn3Var);
        q = hlg.T(5, mn3.MINUTES);
        r = hlg.T(30, mn3Var);
    }

    public o08(sb2 sb2Var, kb2 kb2Var, rp7 rp7Var, j08 j08Var, hx4 hx4Var) {
        sb2Var.getClass();
        rp7Var.getClass();
        oo7 oo7Var = new oo7(14);
        this.a = sb2Var;
        this.b = kb2Var;
        this.c = rp7Var;
        this.d = j08Var;
        this.e = oo7Var;
        this.f = r;
        this.g = hx4Var;
        this.h = new a98();
        this.i = new ArrayList();
        this.j = new olb(21);
        this.k = new olb(21);
    }

    public static long c(int i) {
        double dK;
        long jS;
        if (i > 10) {
            i = 10;
        }
        double dPow = Math.pow(3.0d, i);
        int i2 = in3.d;
        int iV0 = nk7.v0(dPow);
        double d = iV0;
        long j = p;
        if (d == dPow) {
            jS = in3.i(iV0, j);
        } else {
            int i3 = ((int) j) & 1;
            mn3 mn3Var = i3 == 0 ? mn3.NANOSECONDS : mn3.MILLISECONDS;
            mn3Var.getClass();
            if (j == in3.b) {
                dK = Double.POSITIVE_INFINITY;
            } else if (j == in3.c) {
                dK = Double.NEGATIVE_INFINITY;
            } else {
                dK = kng.k(j >> 1, i3 == 0 ? mn3.NANOSECONDS : mn3.MILLISECONDS, mn3Var);
            }
            jS = hlg.S(dK * dPow, mn3Var);
        }
        in3 in3Var = new in3(jS);
        in3 in3Var2 = new in3(q);
        if (in3Var.compareTo(in3Var2) > 0) {
            in3Var = in3Var2;
        }
        return in3Var.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.m08
            if (r0 == 0) goto L13
            r0 = r7
            m08 r0 = (defpackage.m08) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            m08 r0 = new m08
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L34
            if (r2 != r4) goto L2e
            java.util.List r6 = r0.b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r7 = r7.a
            goto L58
        L2e:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L34:
            defpackage.br7.v(r7)
            olb r7 = r6.k
            java.lang.Object r7 = r7.b
            m70 r7 = (defpackage.m70) r7
            java.util.List r7 = defpackage.bu1.m1(r7)
            k08 r2 = new k08
            r2.<init>(r7)
            r0.b = r7
            r0.e = r4
            rp7 r6 = r6.c
            java.lang.String r4 = "pending_stats"
            java.lang.Object r6 = r6.e(r4, r2, r0)
            if (r6 != r1) goto L55
            return r1
        L55:
            r5 = r7
            r7 = r6
            r6 = r5
        L58:
            boolean r0 = r7 instanceof defpackage.ajb
            r1 = 0
            if (r0 != 0) goto L73
            r0 = r7
            c1e r0 = (defpackage.c1e) r0
            int r6 = r6.size()
            java.lang.String r0 = "Persisted "
            java.lang.String r2 = " pending stats to disk"
            java.lang.String r6 = defpackage.ev6.w(r0, r6, r2)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r1]
            defpackage.km4.I(r0, r3, r6, r2, r6)
        L73:
            java.lang.Throwable r6 = defpackage.bjb.b(r7)
            if (r6 == 0) goto L82
            uld r7 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r1]
            java.lang.String r1 = "Failed to persist pending stats to disk"
            r7.e(r6, r1, r0)
        L82:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o08.b(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.util.List r21, defpackage.p92 r22) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 267
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o08.d(java.util.List, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x02bd A[Catch: all -> 0x030f, TRY_LEAVE, TryCatch #10 {all -> 0x030f, blocks: (B:100:0x02af, B:102:0x02bd), top: B:186:0x02af }] */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0303  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0316  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x035e A[Catch: all -> 0x03e2, TRY_LEAVE, TryCatch #1 {all -> 0x03e2, blocks: (B:133:0x03dc, B:140:0x03eb, B:142:0x03f1, B:138:0x03e7, B:139:0x03ea, B:123:0x035a, B:125:0x035e, B:120:0x0318), top: B:172:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:132:0x03db  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x03eb A[Catch: all -> 0x03e2, PHI: r0 r2 r3 r4 r5 r18
      0x03eb: PHI (r0v54 java.lang.Object) = (r0v43 java.lang.Object), (r0v57 java.lang.Object) binds: [B:124:0x035c, B:133:0x03dc] A[DONT_GENERATE, DONT_INLINE]
      0x03eb: PHI (r2v42 boolean) = (r2v60 boolean), (r2v61 boolean) binds: [B:124:0x035c, B:133:0x03dc] A[DONT_GENERATE, DONT_INLINE]
      0x03eb: PHI (r3v32 boolean) = (r3v45 boolean), (r3v46 boolean) binds: [B:124:0x035c, B:133:0x03dc] A[DONT_GENERATE, DONT_INLINE]
      0x03eb: PHI (r4v21 java.util.List) = (r4v13 java.util.List), (r4v23 java.util.List) binds: [B:124:0x035c, B:133:0x03dc] A[DONT_GENERATE, DONT_INLINE]
      0x03eb: PHI (r5v34 a98) = (r5v29 a98), (r5v35 a98) binds: [B:124:0x035c, B:133:0x03dc] A[DONT_GENERATE, DONT_INLINE]
      0x03eb: PHI (r18v10 java.lang.String) = (r18v6 java.lang.String), (r18v11 java.lang.String) binds: [B:124:0x035c, B:133:0x03dc] A[DONT_GENERATE, DONT_INLINE], TryCatch #1 {all -> 0x03e2, blocks: (B:133:0x03dc, B:140:0x03eb, B:142:0x03f1, B:138:0x03e7, B:139:0x03ea, B:123:0x035a, B:125:0x035e, B:120:0x0318), top: B:172:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:142:0x03f1 A[Catch: all -> 0x03e2, TRY_LEAVE, TryCatch #1 {all -> 0x03e2, blocks: (B:133:0x03dc, B:140:0x03eb, B:142:0x03f1, B:138:0x03e7, B:139:0x03ea, B:123:0x035a, B:125:0x035e, B:120:0x0318), top: B:172:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0447  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x046f  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0160 A[Catch: all -> 0x017a, TRY_LEAVE, TryCatch #7 {all -> 0x017a, blocks: (B:47:0x015c, B:49:0x0160, B:58:0x0182, B:65:0x0196, B:67:0x019c, B:71:0x01a6, B:77:0x01c0, B:79:0x01c6, B:83:0x01fa, B:85:0x0201, B:87:0x0235, B:91:0x024d, B:92:0x0253, B:94:0x0264, B:95:0x0285, B:84:0x01ff, B:165:0x047b), top: B:181:0x015c }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01fa A[Catch: all -> 0x017a, TRY_ENTER, TryCatch #7 {all -> 0x017a, blocks: (B:47:0x015c, B:49:0x0160, B:58:0x0182, B:65:0x0196, B:67:0x019c, B:71:0x01a6, B:77:0x01c0, B:79:0x01c6, B:83:0x01fa, B:85:0x0201, B:87:0x0235, B:91:0x024d, B:92:0x0253, B:94:0x0264, B:95:0x0285, B:84:0x01ff, B:165:0x047b), top: B:181:0x015c }] */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01ff A[Catch: all -> 0x017a, TryCatch #7 {all -> 0x017a, blocks: (B:47:0x015c, B:49:0x0160, B:58:0x0182, B:65:0x0196, B:67:0x019c, B:71:0x01a6, B:77:0x01c0, B:79:0x01c6, B:83:0x01fa, B:85:0x0201, B:87:0x0235, B:91:0x024d, B:92:0x0253, B:94:0x0264, B:95:0x0285, B:84:0x01ff, B:165:0x047b), top: B:181:0x015c }] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0235 A[Catch: all -> 0x017a, TRY_LEAVE, TryCatch #7 {all -> 0x017a, blocks: (B:47:0x015c, B:49:0x0160, B:58:0x0182, B:65:0x0196, B:67:0x019c, B:71:0x01a6, B:77:0x01c0, B:79:0x01c6, B:83:0x01fa, B:85:0x0201, B:87:0x0235, B:91:0x024d, B:92:0x0253, B:94:0x0264, B:95:0x0285, B:84:0x01ff, B:165:0x047b), top: B:181:0x015c }] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x024b  */
    /* JADX WARN: Type inference failed for: r13v3, types: [java.lang.Object, java.util.ArrayList, y88] */
    /* JADX WARN: Type inference failed for: r13v4, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r13v43 */
    /* JADX WARN: Type inference failed for: r13v47 */
    /* JADX WARN: Type inference failed for: r13v48 */
    /* JADX WARN: Type inference failed for: r13v49 */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v12 */
    /* JADX WARN: Type inference failed for: r14v2, types: [y88] */
    /* JADX WARN: Type inference failed for: r22v0, types: [o08] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v68 */
    /* JADX WARN: Type inference failed for: r2v69 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v30 */
    /* JADX WARN: Type inference failed for: r3v4, types: [boolean] */
    /* JADX WARN: Type inference failed for: r3v48 */
    /* JADX WARN: Type inference failed for: r3v54 */
    /* JADX WARN: Type inference failed for: r3v55 */
    /* JADX WARN: Type inference failed for: r3v56 */
    /* JADX WARN: Type inference failed for: r3v57 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v30 */
    /* JADX WARN: Type inference failed for: r4v31 */
    /* JADX WARN: Type inference failed for: r4v4, types: [boolean] */
    /* JADX WARN: Type inference failed for: r5v32 */
    /* JADX WARN: Type inference failed for: r5v4, types: [a98] */
    /* JADX WARN: Type inference failed for: r5v40 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(boolean r23, boolean r24, defpackage.p92 r25) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o08.a(boolean, boolean, p92):java.lang.Object");
    }
}
