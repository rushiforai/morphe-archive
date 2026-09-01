package defpackage;

import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h9g implements x9g {
    public zzfx b;
    public jrf c;
    public final bh4 e;
    public final uz5 f;
    public vx1 a = new vx1();
    public p9g d = p9g.a;

    public h9g(uz5 uz5Var, bh4 bh4Var) {
        this.f = uz5Var;
        this.e = bh4Var;
    }

    public static final boolean c(Exception exc) {
        if (!(exc instanceof zzfx)) {
            return true;
        }
        d87 d87Var = ((zzfx) exc).a;
        return (g76.L(d87Var, d87.V0) || g76.L(d87Var, d87.W0) || g76.L(d87Var, d87.X0)) ? false : true;
    }

    @Override // defpackage.x9g
    public final ycg a(String str, awa awaVar, long j) {
        return new ycg(new i82(this, j, str, awaVar, (n92) null));
    }

    @Override // defpackage.x9g
    public final ycg b(long j, g8g g8gVar) {
        return new ycg(new f9g(j, null, this));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.v8g r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.r8g
            if (r0 == 0) goto L13
            r0 = r8
            r8g r0 = (defpackage.r8g) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            r8g r0 = new r8g
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r8 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.d
            r2 = 1
            if (r1 == 0) goto L30
            if (r1 != r2) goto L29
            ujf r7 = r0.e
            defpackage.br7.v(r6)
            goto L45
        L29:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L30:
            defpackage.br7.v(r6)
            ujf r6 = new ujf
            r1 = 18
            r6.<init>(r1)
            r0.e = r6
            r0.d = r2
            java.lang.Object r7 = r7.invoke(r0)
            if (r7 == r8) goto L7e
            r7 = r6
        L45:
            java.lang.Object r6 = r7.b
            jfg r6 = (defpackage.jfg) r6
            long r0 = java.lang.System.nanoTime()
            boolean r8 = r6.a
            java.lang.String r2 = "This stopwatch is already stopped."
            defpackage.jq7.y(r2, r8)
            r8 = 0
            r6.a = r8
            long r2 = r6.b
            long r4 = r6.c
            long r0 = r0 - r4
            long r0 = r0 + r2
            r6.b = r0
            java.lang.Object r6 = r7.b
            jfg r6 = (defpackage.jfg) r6
            boolean r7 = r6.a
            if (r7 == 0) goto L72
            long r7 = java.lang.System.nanoTime()
            long r0 = r6.c
            long r7 = r7 - r0
            long r0 = r6.b
            long r7 = r7 + r0
            goto L74
        L72:
            long r7 = r6.b
        L74:
            r0 = 1000000(0xf4240, double:4.940656E-318)
            long r7 = r7 / r0
            java.lang.Long r6 = new java.lang.Long
            r6.<init>(r7)
            return r6
        L7e:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h9g.d(v8g, p92):java.lang.Object");
    }
}
