package defpackage;

import com.medium.android.profile.ui.view.UserProfileTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jo9 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ jo9(int i, do4 do4Var, Object obj) {
        this.a = i;
        this.c = obj;
        this.b = do4Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object c(defpackage.n92 r12, java.lang.Object r13) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof defpackage.idd
            if (r0 == 0) goto L13
            r0 = r12
            idd r0 = (defpackage.idd) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            idd r0 = new idd
            r0.<init>(r11, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2f
            if (r2 != r3) goto L29
            defpackage.br7.v(r12)
            goto La6
        L29:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2f:
            defpackage.br7.v(r12)
            java.lang.Object r12 = r11.b
            do4 r12 = (defpackage.do4) r12
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r13 = r13.a
            java.lang.Throwable r2 = defpackage.bjb.b(r13)
            if (r2 != 0) goto L8a
            w7d r13 = (defpackage.w7d) r13
            ocd r5 = new ocd
            java.lang.String r6 = r13.c
            java.lang.Integer r7 = r13.d
            java.lang.Long r2 = r13.e
            if (r2 == 0) goto L56
            long r8 = r2.longValue()
            int r2 = (int) r8
            java.lang.Integer r4 = new java.lang.Integer
            r4.<init>(r2)
        L56:
            r8 = r4
            boolean r9 = r13.f
            java.lang.Object r11 = r11.c
            odd r11 = (defpackage.odd) r11
            tz7 r11 = r11.y
            r11.getClass()
            sbd r10 = new sbd
            java.lang.String r11 = r13.b
            java.lang.String r2 = defpackage.i03.b
            android.net.Uri r2 = android.net.Uri.parse(r2)
            android.net.Uri$Builder r2 = r2.buildUpon()
            java.lang.String r4 = "tag"
            android.net.Uri$Builder r2 = r2.appendEncodedPath(r4)
            android.net.Uri$Builder r2 = r2.appendEncodedPath(r11)
            android.net.Uri r2 = r2.build()
            r2.getClass()
            java.lang.String r13 = r13.c
            r10.<init>(r2, r11, r13)
            r5.<init>(r6, r7, r8, r9, r10)
            goto L9d
        L8a:
            uld r11 = defpackage.wld.a
            java.lang.String r13 = "Watch tag detail failed"
            r4 = 0
            java.lang.Object[] r4 = new java.lang.Object[r4]
            r11.e(r2, r13, r4)
            pcd r5 = new pcd
            b24 r11 = defpackage.m4.I(r2)
            r5.<init>(r11)
        L9d:
            r0.c = r3
            java.lang.Object r11 = r12.a(r5, r0)
            if (r11 != r1) goto La6
            return r1
        La6:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.c(n92, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object d(defpackage.n92 r10, java.lang.Object r11) {
        /*
            Method dump skipped, instruction units count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.d(n92, java.lang.Object):java.lang.Object");
    }

    private final Object e(n92 n92Var, Object obj) {
        c56 c56Var = (c56) obj;
        pya pyaVar = (pya) this.b;
        if (c56Var instanceof h0a) {
            pyaVar.a++;
        } else if ((c56Var instanceof i0a) || (c56Var instanceof g0a)) {
            pyaVar.a--;
        }
        boolean z = pyaVar.a > 0;
        tld tldVar = (tld) this.c;
        if (tldVar.r != z) {
            tldVar.r = z;
            gx1.M(tldVar);
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0288 A[RETURN] */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v12, types: [wpd] */
    /* JADX WARN: Type inference failed for: r7v14 */
    /* JADX WARN: Type inference failed for: r7v27 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object f(defpackage.n92 r71, java.lang.Object r72) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 656
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.f(n92, java.lang.Object):java.lang.Object");
    }

    private final Object i(n92 n92Var, Object obj) {
        oie oieVar = (oie) obj;
        boolean z = oieVar instanceof mie;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        if (z) {
            q9e q9eVar = (q9e) this.b;
            vx0.c0(f76.F(q9eVar), null, null, new e9e(q9eVar, n92Var2, 2), 3);
            return c1eVar;
        }
        if (oieVar instanceof nie) {
            Object objL = kv6.l((kv6) this.c, 0, n92Var);
            return objL == tb2.COROUTINE_SUSPENDED ? objL : c1eVar;
        }
        ygf.a();
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object j(defpackage.n92 r9, java.lang.Object r10) {
        /*
            Method dump skipped, instruction units count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.j(n92, java.lang.Object):java.lang.Object");
    }

    private final Object k(n92 n92Var, Object obj) {
        cce cceVar = (cce) obj;
        boolean zL = g76.L(cceVar, ace.a);
        c1e c1eVar = c1e.a;
        if (zL) {
            ((ide) this.b).j();
            return c1eVar;
        }
        if (g76.L(cceVar, bce.a)) {
            Object objL = kv6.l((kv6) this.c, 0, n92Var);
            return objL == tb2.COROUTINE_SUSPENDED ? objL : c1eVar;
        }
        ygf.a();
        return null;
    }

    private final Object l(n92 n92Var, Object obj) {
        oie oieVar = (oie) obj;
        boolean z = oieVar instanceof mie;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        if (z) {
            mfe mfeVar = (mfe) this.b;
            vx0.c0(f76.F(mfeVar), null, null, new ood(mfeVar, n92Var2, 3), 3);
            return c1eVar;
        }
        if (!(oieVar instanceof nie)) {
            ygf.a();
            return null;
        }
        Object objR = gq7.R((yrb) this.c, 0 - r3.a.g(), n92Var);
        return objR == tb2.COROUTINE_SUSPENDED ? objR : c1eVar;
    }

    private final Object n(n92 n92Var, Object obj) {
        oie oieVar = (oie) obj;
        boolean z = oieVar instanceof mie;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        if (z) {
            oge ogeVar = (oge) this.b;
            vx0.c0(f76.F(ogeVar), null, null, new nge(ogeVar, n92Var2, 1), 3);
            return c1eVar;
        }
        if (oieVar instanceof nie) {
            Object objL = kv6.l((kv6) this.c, 0, n92Var);
            return objL == tb2.COROUTINE_SUSPENDED ? objL : c1eVar;
        }
        ygf.a();
        return null;
    }

    private final Object o(n92 n92Var, Object obj) {
        oie oieVar = (oie) obj;
        boolean z = oieVar instanceof mie;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        if (z) {
            cie cieVar = (cie) this.b;
            vx0.c0(f76.F(cieVar), null, null, new yhe(cieVar, n92Var2, 1), 3);
            return c1eVar;
        }
        if (oieVar instanceof nie) {
            Object objL = kv6.l((kv6) this.c, 0, n92Var);
            return objL == tb2.COROUTINE_SUSPENDED ? objL : c1eVar;
        }
        ygf.a();
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object p(defpackage.n92 r66, java.lang.Object r67) {
        /*
            Method dump skipped, instruction units count: 300
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.p(n92, java.lang.Object):java.lang.Object");
    }

    private final Object q(n92 n92Var, Object obj) {
        ((ihe) this.b).q0((UserProfileTab) ((jje) this.c).a.get(((Number) obj).intValue()));
        return c1e.a;
    }

    private final Object r(n92 n92Var, Object obj) {
        oie oieVar = (oie) obj;
        boolean z = oieVar instanceof mie;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        if (z) {
            ime imeVar = (ime) this.b;
            vx0.c0(f76.F(imeVar), null, null, new eme(imeVar, n92Var2, 4), 3);
            return c1eVar;
        }
        if (oieVar instanceof nie) {
            Object objL = kv6.l((kv6) this.c, 0, n92Var);
            return objL == tb2.COROUTINE_SUSPENDED ? objL : c1eVar;
        }
        ygf.a();
        return null;
    }

    private final Object s(n92 n92Var, Object obj) {
        mf9 mf9Var = (mf9) obj;
        n0c n0cVar = ((kle) this.b).c;
        boolean z = mf9Var instanceof jf9;
        c1e c1eVar = c1e.a;
        if (z) {
            Object objC0 = n0cVar.c0(n92Var);
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            if (objC0 != tb2Var) {
                objC0 = c1eVar;
            }
            if (objC0 == tb2Var) {
                return objC0;
            }
        } else if (mf9Var instanceof kf9) {
            Object objD0 = n0cVar.d0(new vrd((tjd) this.c, 14, mf9Var), n92Var);
            tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
            if (objD0 != tb2Var2) {
                objD0 = c1eVar;
            }
            if (objD0 == tb2Var2) {
                return objD0;
            }
        }
        return c1eVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x0099, code lost:
    
        if (r0 == r2) goto L41;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0203  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x02a5  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x02fa  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x0398  */
    /* JADX WARN: Removed duplicated region for block: B:282:0x05e5  */
    /* JADX WARN: Removed duplicated region for block: B:338:0x07e1  */
    /* JADX WARN: Removed duplicated region for block: B:346:0x07fd  */
    /* JADX WARN: Removed duplicated region for block: B:401:0x0a48  */
    /* JADX WARN: Removed duplicated region for block: B:410:0x0a69  */
    /* JADX WARN: Removed duplicated region for block: B:445:0x0b0e  */
    /* JADX WARN: Removed duplicated region for block: B:494:0x0c1c  */
    /* JADX WARN: Removed duplicated region for block: B:505:0x0c54  */
    /* JADX WARN: Removed duplicated region for block: B:586:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:9:0x002f  */
    /* JADX WARN: Type inference failed for: r15v0, types: [n92] */
    /* JADX WARN: Type inference failed for: r15v16 */
    /* JADX WARN: Type inference failed for: r15v21 */
    /* JADX WARN: Type inference failed for: r5v55, types: [rac] */
    @Override // defpackage.do4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r116, defpackage.n92 r117) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 3406
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.a(java.lang.Object, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(int r6, defpackage.n92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.wnc
            if (r0 == 0) goto L13
            r0 = r7
            wnc r0 = (defpackage.wnc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            wnc r0 = new wnc
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            c1e r3 = defpackage.c1e.a
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L29
            defpackage.br7.v(r7)
            return r3
        L29:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L30:
            defpackage.br7.v(r7)
            if (r6 <= 0) goto L4e
            java.lang.Object r6 = r5.c
            nya r6 = (defpackage.nya) r6
            boolean r7 = r6.a
            if (r7 != 0) goto L4e
            r6.a = r4
            java.lang.Object r5 = r5.b
            do4 r5 = (defpackage.do4) r5
            k7c r6 = defpackage.k7c.START
            r0.d = r4
            java.lang.Object r5 = r5.a(r6, r0)
            if (r5 != r1) goto L4e
            return r1
        L4e:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.b(int, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object m(defpackage.n92 r14, java.lang.Object r15) {
        /*
            Method dump skipped, instruction units count: 241
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jo9.m(n92, java.lang.Object):java.lang.Object");
    }

    public /* synthetic */ jo9(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
