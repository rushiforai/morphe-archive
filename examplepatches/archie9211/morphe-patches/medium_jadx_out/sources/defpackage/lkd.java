package defpackage;

import android.os.Trace;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lkd extends q28 implements sp6, xl3, xxb {
    public kkd A;
    public String o;
    public mkd p;
    public yy4 q;
    public int r;
    public boolean s;
    public int t;
    public int u;
    public dv1 v;
    public HashMap w;
    public g29 x;
    public mkd y;
    public jkd z;

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public final g29 I0() {
        mkd mkdVar = this.y;
        if (mkdVar == null) {
            mkdVar = this.p;
        }
        mkd mkdVar2 = mkdVar;
        g29 g29Var = this.x;
        if (g29Var == null) {
            g29 g29Var2 = new g29(this.o, mkdVar2, this.q, this.r, this.s, this.t, this.u);
            this.x = g29Var2;
            g29Var = g29Var2;
        }
        g29Var.getClass();
        return g29Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.g29 J0(defpackage.bl7 r10) {
        /*
            r9 = this;
            r0 = 1
            boolean r0 = r9.K0(r0)
            if (r0 == 0) goto L21
            mkd r0 = r9.y
            if (r0 != 0) goto Ld
            mkd r0 = r9.p
        Ld:
            r3 = r0
            g29 r1 = r9.I0()
            java.lang.String r2 = r9.o
            yy4 r4 = r9.q
            int r5 = r9.r
            boolean r6 = r9.s
            int r7 = r9.t
            int r8 = r9.u
            r1.f(r2, r3, r4, r5, r6, r7, r8)
        L21:
            kkd r0 = r9.A
            if (r0 == 0) goto L31
            boolean r1 = r0.c
            if (r1 == 0) goto L2a
            goto L2b
        L2a:
            r0 = 0
        L2b:
            if (r0 == 0) goto L31
            g29 r0 = r0.d
            if (r0 != 0) goto L35
        L31:
            g29 r0 = r9.I0()
        L35:
            r0.d(r10)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lkd.J0(bl7):g29");
    }

    public final boolean K0(int i) {
        mkd mkdVar = this.y;
        mkd mkdVar2 = this.p;
        br7.z(this, "StyleOuterNode", new tjd(1));
        this.y = mkdVar2;
        if (mkdVar == null) {
            return false;
        }
        return !mkdVar.equals(mkdVar2);
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return jq7.g(J0(fb7Var).e(fb7Var.getLayoutDirection()).q());
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        Trace.beginSection("TextStringSimpleNode::measure");
        try {
            g29 g29VarJ0 = J0(bl7Var);
            boolean zB = g29VarJ0.b(j, bl7Var.getLayoutDirection());
            b29 b29Var = g29VarJ0.n;
            if (b29Var != null) {
                b29Var.a();
            }
            wq wqVar = g29VarJ0.j;
            wqVar.getClass();
            ojd ojdVar = wqVar.d;
            long j2 = g29VarJ0.l;
            if (zB) {
                flb.t0(this, 2).V0();
                HashMap map = this.w;
                if (map == null) {
                    map = new HashMap(2);
                    this.w = map;
                }
                map.put(be.a, Integer.valueOf(Math.round(ojdVar.d(0))));
                map.put(be.b, Integer.valueOf(Math.round(ojdVar.d(ojdVar.g - 1))));
            }
            int i = (int) (j2 >> 32);
            int i2 = (int) (j2 & 4294967295L);
            t99 t99VarS = tk7Var.s(g01.Q(i, i, i2, i2));
            HashMap map2 = this.w;
            map2.getClass();
            return bl7Var.q0(i, i2, map2, new y0(t99VarS, 15));
        } finally {
            Trace.endSection();
        }
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return J0(fb7Var).a(i, fb7Var.getLayoutDirection());
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return J0(fb7Var).a(i, fb7Var.getLayoutDirection());
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0016  */
    @Override // defpackage.xl3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e0(defpackage.cq6 r11) {
        /*
            Method dump skipped, instruction units count: 211
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lkd.e0(cq6):void");
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return jq7.g(J0(fb7Var).e(fb7Var.getLayoutDirection()).h());
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [x45] */
    /* JADX WARN: Type inference failed for: r0v2, types: [jkd] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        jkd jkdVar = this.z;
        ?? r0 = jkdVar;
        if (jkdVar == null) {
            final int i = 0;
            ?? r02 = new x45(this) { // from class: jkd
                public final /* synthetic */ lkd b;

                {
                    this.b = this;
                }

                /* JADX WARN: Removed duplicated region for block: B:27:0x00ac  */
                @Override // defpackage.x45
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final java.lang.Object invoke(java.lang.Object r30) {
                    /*
                        Method dump skipped, instruction units count: 292
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: defpackage.jkd.invoke(java.lang.Object):java.lang.Object");
                }
            };
            this.z = r02;
            r0 = r02;
        }
        mx mxVar = new mx(this.o);
        fj6[] fj6VarArr = gyb.a;
        jybVar.d(eyb.C, d46.Q(mxVar));
        kkd kkdVar = this.A;
        if (kkdVar != null) {
            boolean z = kkdVar.c;
            iyb iybVar = eyb.E;
            fj6[] fj6VarArr2 = gyb.a;
            fj6 fj6Var = fj6VarArr2[17];
            jybVar.d(iybVar, Boolean.valueOf(z));
            mx mxVar2 = new mx(kkdVar.b);
            iyb iybVar2 = eyb.D;
            fj6 fj6Var2 = fj6VarArr2[16];
            jybVar.d(iybVar2, mxVar2);
        }
        final int i2 = 1;
        jybVar.d(sxb.l, new i4(null, new x45(this) { // from class: jkd
            public final /* synthetic */ lkd b;

            {
                this.b = this;
            }

            /* JADX WARN: Removed duplicated region for block: B:27:0x00ac  */
            @Override // defpackage.x45
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object invoke(java.lang.Object r30) {
                /*
                    Method dump skipped, instruction units count: 292
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.jkd.invoke(java.lang.Object):java.lang.Object");
            }
        }));
        final int i3 = 2;
        jybVar.d(sxb.m, new i4(null, new x45(this) { // from class: jkd
            public final /* synthetic */ lkd b;

            {
                this.b = this;
            }

            /* JADX WARN: Removed duplicated region for block: B:27:0x00ac  */
            @Override // defpackage.x45
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object invoke(java.lang.Object r30) {
                /*
                    Method dump skipped, instruction units count: 292
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: defpackage.jkd.invoke(java.lang.Object):java.lang.Object");
            }
        }));
        jybVar.d(sxb.n, new i4(null, new doc(15, this)));
        gyb.a(jybVar, r0);
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
