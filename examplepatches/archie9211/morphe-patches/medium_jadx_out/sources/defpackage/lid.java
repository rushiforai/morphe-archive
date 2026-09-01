package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lid {
    public boolean A;
    public final wzd a;
    public kx6 d;
    public m45 f;
    public ap1 g;
    public sb2 h;
    public qa9 i;
    public li5 j;
    public sr4 k;
    public final k49 l;
    public final k49 m;
    public long n;
    public bkd o;
    public long p;
    public final k49 q;
    public final k49 r;
    public int s;
    public uid t;
    public o72 u;
    public bkd v;
    public final k49 w;
    public final mya x;
    public final jid y;
    public final o72 z;
    public yqa b = xz5.l;
    public x45 c = new d3d(25);
    public final k49 e = qo7.u(new uid((String) null, 7, 0));

    public lid(wzd wzdVar) {
        this.a = wzdVar;
        Boolean bool = Boolean.TRUE;
        this.l = qo7.u(bool);
        this.m = qo7.u(bool);
        this.n = 0L;
        this.p = 0L;
        this.q = qo7.u(null);
        this.r = qo7.u(null);
        this.s = -1;
        this.t = new uid((String) null, 7, 0L);
        this.w = qo7.u(Boolean.FALSE);
        mya myaVar = new mya(14, false);
        myaVar.c = ynd.Uninitialized;
        this.x = myaVar;
        this.y = new jid(this);
        this.z = new o72(this);
    }

    public static uid b(mx mxVar, long j) {
        return new uid(mxVar, j, (bkd) null);
    }

    public final enc a(boolean z) {
        sb2 sb2Var = this.h;
        n92 n92Var = null;
        if (sb2Var != null) {
            return vx0.c0(sb2Var, null, wb2.UNDISPATCHED, new wd0(this, z, n92Var, 7), 1);
        }
        return null;
    }

    public final void c() {
        sb2 sb2Var = this.h;
        if (sb2Var != null) {
            vx0.c0(sb2Var, null, wb2.UNDISPATCHED, new fid(this, null, 1), 1);
        }
    }

    public final void d(ip8 ip8Var) {
        int iE;
        if (!bkd.c(l().b)) {
            kx6 kx6Var = this.d;
            rjd rjdVarD = kx6Var != null ? kx6Var.d() : null;
            if (ip8Var == null || rjdVarD == null) {
                iE = bkd.e(l().b);
            } else {
                yqa yqaVar = this.b;
                iE = rjdVarD.b(ip8Var.a, true);
                yqaVar.c(iE);
            }
            uid uidVarA = uid.a(l(), null, lk7.q(iE, iE), 5);
            this.c.invoke(uidVarA);
            this.v = new bkd(uidVarA.b);
        }
        r((ip8Var == null || l().a.b.length() <= 0) ? ci5.None : ci5.Cursor);
        u(false);
    }

    public final void e(boolean z) {
        sr4 sr4Var;
        kx6 kx6Var = this.d;
        if (kx6Var != null && !kx6Var.b() && (sr4Var = this.k) != null) {
            sr4.a(sr4Var);
        }
        this.t = l();
        u(z);
        r(ci5.Selection);
    }

    public final f09 f() {
        String str;
        bkd bkdVar;
        mx mxVarK = k();
        if (mxVarK == null || (str = mxVarK.b) == null || (bkdVar = this.v) == null) {
            return null;
        }
        long j = bkdVar.a;
        int i = (int) (j >> 32);
        this.b.a(i);
        int i2 = (int) (j & 4294967295L);
        this.b.a(i2);
        return new f09(str, new bkd(lk7.q(i, i2)));
    }

    public final ip8 g() {
        return (ip8) this.r.getValue();
    }

    public final boolean h() {
        return ((Boolean) this.l.getValue()).booleanValue();
    }

    public final boolean i() {
        return ((Boolean) this.m.getValue()).booleanValue();
    }

    public final long j(boolean z) {
        rjd rjdVarD;
        long j;
        kx6 kx6Var = this.d;
        if (kx6Var == null || (rjdVarD = kx6Var.d()) == null) {
            return 9205357640488583168L;
        }
        qjd qjdVar = rjdVarD.a;
        f58 f58Var = qjdVar.b;
        mx mxVarK = k();
        if (mxVarK == null) {
            return 9205357640488583168L;
        }
        if (!g76.L(mxVarK.b, qjdVar.a.a.b)) {
            return 9205357640488583168L;
        }
        uid uidVarL = l();
        if (z) {
            long j2 = uidVarL.b;
            int i = bkd.c;
            j = j2 >> 32;
        } else {
            long j3 = uidVarL.b;
            int i2 = bkd.c;
            j = j3 & 4294967295L;
        }
        int i3 = (int) j;
        this.b.a(i3);
        boolean zG = bkd.g(l().b);
        long j4 = qjdVar.c;
        int iD = f58Var.d(i3);
        if (iD >= f58Var.f) {
            return 9205357640488583168L;
        }
        boolean z2 = qjdVar.a(((!z || zG) && (z || !zG)) ? Math.max(i3 + (-1), 0) : i3) == qjdVar.h(i3);
        f58Var.l(i3);
        int length = ((mx) f58Var.a.b).b.length();
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(i3 == length ? arrayList.size() - 1 : mk7.r(i3, arrayList));
        wq wqVar = y19Var.a;
        int iD2 = y19Var.d(i3);
        ojd ojdVar = wqVar.d;
        return (((long) Float.floatToRawIntBits(iq7.u(f58Var.b(iD), 0.0f, (int) (j4 & 4294967295L)))) & 4294967295L) | (((long) Float.floatToRawIntBits(iq7.u(z2 ? ojdVar.h(iD2, false) : ojdVar.i(iD2, false), 0.0f, (int) (j4 >> 32)))) << 32);
    }

    public final mx k() {
        kx6 kx6Var = this.d;
        if (kx6Var != null) {
            return (mx) kx6Var.a.b;
        }
        return null;
    }

    public final uid l() {
        return (uid) this.e.getValue();
    }

    public final void m() {
        enc encVar;
        nhd nhdVar = (nhd) this.x.b;
        if (nhdVar == null || (encVar = nhdVar.u) == null) {
            return;
        }
        encVar.m(null);
        nhdVar.u = null;
    }

    public final void n(bkd bkdVar) {
        mx mxVarK;
        String str;
        sb2 sb2Var;
        if (bkdVar == null) {
            return;
        }
        long j = bkdVar.a;
        qa9 qa9Var = this.i;
        if (qa9Var == null || (mxVarK = k()) == null || (str = mxVarK.b) == null) {
            return;
        }
        yqa yqaVar = this.b;
        int i = (int) (j >> 32);
        yqaVar.a(i);
        int i2 = (int) (j & 4294967295L);
        yqaVar.a(i2);
        long jQ = lk7.q(i, i2);
        if (str.length() <= 0 || bkd.c(jQ) || (sb2Var = this.h) == null) {
            return;
        }
        vx0.c0(sb2Var, null, null, new i82(qa9Var, str, jQ, bkdVar, this, yqaVar, (n92) null), 3);
    }

    public final void o() {
        sb2 sb2Var = this.h;
        if (sb2Var != null) {
            vx0.c0(sb2Var, null, wb2.UNDISPATCHED, new fid(this, null, 2), 1);
        }
    }

    public final void p(ip8 ip8Var) {
        this.r.setValue(ip8Var);
    }

    public final void q(ai5 ai5Var) {
        this.q.setValue(ai5Var);
    }

    public final void r(ci5 ci5Var) {
        kx6 kx6Var = this.d;
        if (kx6Var != null) {
            if (kx6Var.a() == ci5Var) {
                kx6Var = null;
            }
            if (kx6Var != null) {
                kx6Var.k.setValue(ci5Var);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0027, code lost:
    
        if (((java.lang.Boolean) r4.q.getValue()).booleanValue() == false) goto L34;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void s() {
        /*
            r7 = this;
            oic r0 = defpackage.vn7.A()
            r1 = 0
            if (r0 == 0) goto Lc
            x45 r2 = r0.e()
            goto Ld
        Lc:
            r2 = r1
        Ld:
            oic r3 = defpackage.vn7.G(r0)
            boolean r4 = r7.i()     // Catch: java.lang.Throwable -> L71
            if (r4 == 0) goto L73
            kx6 r4 = r7.d     // Catch: java.lang.Throwable -> L71
            if (r4 == 0) goto L2a
            k49 r4 = r4.q     // Catch: java.lang.Throwable -> L71
            java.lang.Object r4 = r4.getValue()     // Catch: java.lang.Throwable -> L71
            java.lang.Boolean r4 = (java.lang.Boolean) r4     // Catch: java.lang.Throwable -> L71
            boolean r4 = r4.booleanValue()     // Catch: java.lang.Throwable -> L71
            if (r4 != 0) goto L2a
            goto L73
        L2a:
            defpackage.vn7.T(r0, r3, r2)
            mya r7 = r7.x
            java.lang.Object r0 = r7.c
            ynd r0 = (defpackage.ynd) r0
            ynd r2 = defpackage.ynd.Uninitialized
            if (r0 == r2) goto L38
            goto L3d
        L38:
            java.lang.String r0 = "ToolbarRequester is not initialized."
            defpackage.e26.c(r0)
        L3d:
            java.lang.Object r7 = r7.b
            nhd r7 = (defpackage.nhd) r7
            if (r7 == 0) goto L70
            boolean r0 = r7.n
            if (r0 == 0) goto L70
            enc r0 = r7.u
            r2 = 1
            if (r0 == 0) goto L53
            boolean r0 = r0.f()
            if (r0 != r2) goto L53
            goto L70
        L53:
            sn3 r0 = defpackage.ihd.b
            java.lang.Object r0 = defpackage.bo.K(r7, r0)
            hhd r0 = (defpackage.hhd) r0
            if (r0 != 0) goto L5e
            goto L70
        L5e:
            sb2 r3 = r7.u0()
            wb2 r4 = defpackage.wb2.UNDISPATCHED
            j5d r5 = new j5d
            r6 = 3
            r5.<init>(r7, r0, r1, r6)
            enc r0 = defpackage.vx0.c0(r3, r1, r4, r5, r2)
            r7.u = r0
        L70:
            return
        L71:
            r7 = move-exception
            goto L77
        L73:
            defpackage.vn7.T(r0, r3, r2)
            return
        L77:
            defpackage.vn7.T(r0, r3, r2)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lid.s():void");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object t(defpackage.p92 r5) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.kid
            if (r0 == 0) goto L13
            r0 = r5
            kid r0 = (defpackage.kid) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            kid r0 = new kid
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            lid r4 = r0.b
            defpackage.br7.v(r5)
            goto L5b
        L29:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L30:
            defpackage.br7.v(r5)
            ap1 r5 = r4.g
            if (r5 == 0) goto L65
            r0.b = r4
            r0.e = r3
            tm r5 = (defpackage.tm) r5
            um r5 = r5.a
            android.content.ClipboardManager r5 = r5.a()
            android.content.ClipDescription r5 = r5.getPrimaryClipDescription()
            r0 = 0
            if (r5 == 0) goto L53
            java.lang.String r2 = "text/*"
            boolean r5 = r5.hasMimeType(r2)
            if (r5 != r3) goto L53
            goto L54
        L53:
            r3 = r0
        L54:
            java.lang.Boolean r5 = java.lang.Boolean.valueOf(r3)
            if (r5 != r1) goto L5b
            return r1
        L5b:
            java.lang.Boolean r5 = (java.lang.Boolean) r5
            r5.getClass()
            k49 r4 = r4.w
            r4.setValue(r5)
        L65:
            c1e r4 = defpackage.c1e.a
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lid.t(p92):java.lang.Object");
    }

    public final void u(boolean z) {
        kx6 kx6Var = this.d;
        if (kx6Var != null) {
            kx6Var.l.setValue(Boolean.valueOf(z));
        }
        if (z) {
            s();
        } else {
            m();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x01e7  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0156  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long v(defpackage.uid r22, long r23, boolean r25, boolean r26, defpackage.ywb r27, boolean r28, defpackage.mi5 r29) {
        /*
            Method dump skipped, instruction units count: 780
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lid.v(uid, long, boolean, boolean, ywb, boolean, mi5):long");
    }
}
