package defpackage;

import android.app.Activity;
import com.medium.android.graphql.type.PostType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l0(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
    }

    private final Object i(Object obj) {
        String str = (String) this.f;
        id1 id1Var = (id1) this.e;
        qi1 qi1Var = id1Var.d;
        l2a l2aVar = (l2a) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        int i2 = 1;
        n92 n92Var = null;
        if (i == 0) {
            br7.v(obj);
            vx0.c0(l2aVar, null, null, new zc1(id1Var, str, n92Var, 2), 3);
            qi1Var.getClass();
            str.getClass();
            int i3 = 12;
            int i4 = 0;
            zj1 zj1VarA = ip4.a(kyd.H(m40.J(new u50(i3, new ei1(qi1Var, str, null)))), id1Var.S);
            qc1 qc1Var = new qc1(id1Var, null, str);
            int i5 = ip4.a;
            pc1 pc1Var = new pc1(zj1VarA, 10, qc1Var);
            if (i5 <= 0) {
                ywb.g(b09.w(i5, "Expected positive concurrency level, but had "));
                return null;
            }
            pc1 pc1VarR = k40.R(i5 == 1 ? new u50(8, pc1Var) : new ck1(pc1Var, i5, zx3.a, -2, nz0.SUSPEND), qi1Var.G(str), new u50(i3, new uc0(id1Var, null, str)), ip4.b(id1Var.T, new gd1(n92Var, id1Var, str, i4)), id1Var.T, new dd1(id1Var, null, str));
            ob0 ob0Var = new ob0(i2, l2aVar);
            this.d = null;
            this.c = 1;
            if (pc1VarR.b(ob0Var, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x006d, code lost:
    
        if (r1.a(r9, r8) == r2) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:19:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object n(java.lang.Object r9) throws java.lang.Throwable {
        /*
            r8 = this;
            java.lang.Object r0 = r8.e
            qi1 r0 = (defpackage.qi1) r0
            java.lang.Object r1 = r8.d
            do4 r1 = (defpackage.do4) r1
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r8.c
            r4 = 0
            r5 = 2
            r6 = 1
            if (r3 == 0) goto L23
            if (r3 == r6) goto L1f
            if (r3 != r5) goto L19
            defpackage.br7.v(r9)
            goto L70
        L19:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r4
        L1f:
            defpackage.br7.v(r9)
            goto L57
        L23:
            defpackage.br7.v(r9)
            zk2 r9 = r0.b
            java.lang.String r9 = r9.m()
            java.lang.Object r3 = r8.f
            java.lang.String r3 = (java.lang.String) r3
            boolean r9 = r9.equals(r3)
            if (r9 == 0) goto L70
            zk2 r9 = r0.b
            zw7 r9 = r9.o()
            boolean r9 = r9.getOfflineReadingEnabled()
            if (r9 == 0) goto L70
            eo8 r9 = r0.d
            r8.d = r1
            r8.c = r6
            elb r0 = r9.a
            ao8 r3 = new ao8
            r7 = 0
            r3.<init>(r9, r7)
            java.lang.Object r9 = defpackage.n01.d0(r8, r0, r6, r7, r3)
            if (r9 != r2) goto L57
            goto L6f
        L57:
            com.medium.android.graphql.fragment.CatalogPreviewData r9 = (com.medium.android.graphql.fragment.CatalogPreviewData) r9
            if (r9 == 0) goto L70
            ff1 r0 = new ff1
            r0.<init>(r9, r6)
            bjb r9 = new bjb
            r9.<init>(r0)
            r8.d = r4
            r8.c = r5
            java.lang.Object r8 = r1.a(r9, r8)
            if (r8 != r2) goto L70
        L6f:
            return r2
        L70:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l0.n(java.lang.Object):java.lang.Object");
    }

    private final Object o(Object obj) {
        oyb oybVar = (oyb) this.f;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        try {
            if (i == 0) {
                br7.v(obj);
                bo4 bo4Var = (bo4) this.d;
                hzb hzbVar = (hzb) this.e;
                this.c = 1;
                if (bo4Var.b(hzbVar, this) == tb2Var) {
                    return tb2Var;
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            oybVar.c();
            return c1e.a;
        } catch (Throwable th) {
            oybVar.c();
            throw th;
        }
    }

    private final Object r(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            zj2 zj2Var = (zj2) this.d;
            uua uuaVar = ((ex1) zj2Var.a.a).c;
            sa saVar = new sa(zj2Var, (PostType) this.e, (x45) this.f, 12);
            this.c = 1;
            if (uuaVar.a.b(saVar, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        z72.b();
        return null;
    }

    private final Object u(Object obj) {
        do4 do4Var = (do4) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            ra raVar = new ra(do4Var, (ek2) this.e, (yaf) this.f, (n92) null, 29);
            this.d = null;
            this.c = 1;
            if (o7f.s(raVar, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    private final Object v(Object obj) {
        do4 do4Var = (do4) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            fl2 fl2Var = new fl2(do4Var, (gl2) this.e, (zaf) this.f, (n92) null, 0);
            this.d = null;
            this.c = 1;
            if (o7f.s(fl2Var, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00d4, code lost:
    
        if (r10.a(r4, r2) == r3) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object w(defpackage.ua r23, defpackage.rya r24, defpackage.do4 r25, defpackage.yd4 r26, defpackage.n92 r27) {
        /*
            Method dump skipped, instruction units count: 218
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l0.w(ua, rya, do4, yd4, n92):java.lang.Object");
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                return new l0((m68) this.d, (g0a) this.e, (yh3) obj2, n92Var, 0);
            case 1:
                l0 l0Var = new l0((ua) obj2, n92Var, 1);
                l0Var.e = obj;
                return l0Var;
            case 2:
                l0 l0Var2 = new l0((oc) obj2, n92Var, 2);
                l0Var2.e = obj;
                return l0Var2;
            case 3:
                return new l0((bi) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 3);
            case 4:
                l0 l0Var3 = new l0((c55) this.e, (sl) obj2, n92Var, 4);
                l0Var3.d = obj;
                return l0Var3;
            case 5:
                l0 l0Var4 = new l0((c55) this.e, (tl) obj2, n92Var, 5);
                l0Var4.d = obj;
                return l0Var4;
            case 6:
                l0 l0Var5 = new l0((c55) this.e, (ul) obj2, n92Var, 6);
                l0Var5.d = obj;
                return l0Var5;
            case 7:
                l0 l0Var6 = new l0((d55) this.e, (sl) obj2, n92Var, 7);
                l0Var6.d = obj;
                return l0Var6;
            case 8:
                l0 l0Var7 = new l0((d55) this.e, (tl) obj2, n92Var, 8);
                l0Var7.d = obj;
                return l0Var7;
            case 9:
                l0 l0Var8 = new l0((d55) this.e, (ul) obj2, n92Var, 9);
                l0Var8.d = obj;
                return l0Var8;
            case 10:
                l0 l0Var9 = new l0((dsd) this.e, (l78) obj2, n92Var, 10);
                l0Var9.d = obj;
                return l0Var9;
            case 11:
                return new l0((e00) this.d, (h00) this.e, (l2a) obj2, n92Var, 11);
            case 12:
                l0 l0Var10 = new l0((e00) this.e, (h00) obj2, n92Var, 12);
                l0Var10.d = obj;
                return l0Var10;
            case 13:
                return new l0((g90) this.e, (a90) obj2, n92Var, 13);
            case 14:
                return new l0((yd0) this.e, (Activity) obj2, n92Var, 14);
            case 15:
                return new l0((yd0) this.e, (IllegalStateException) obj2, n92Var, 15);
            case 16:
                return new l0((yd0) this.e, (Exception) obj2, n92Var, 16);
            case 17:
                return new l0((xpc) this.e, (pod) obj2, n92Var, 17);
            case 18:
                return new l0((m45) this.d, (v7c) this.e, (js0) obj2, n92Var, 18);
            case 19:
                return new l0((uy0) this.d, (eh8) this.e, (cn) obj2, n92Var, 19);
            case 20:
                return new l0((id1) this.d, (SourceParameter) this.e, (lj3) obj2, n92Var, 20);
            case 21:
                l0 l0Var11 = new l0((id1) obj2, n92Var, 21);
                l0Var11.e = obj;
                return l0Var11;
            case 22:
                l0 l0Var12 = new l0((id1) this.e, (String) obj2, n92Var, 22);
                l0Var12.d = obj;
                return l0Var12;
            case 23:
                l0 l0Var13 = new l0((qi1) this.e, (String) obj2, n92Var, 23);
                l0Var13.d = obj;
                return l0Var13;
            case 24:
                l0 l0Var14 = new l0((do4) this.e, (yj1) obj2, n92Var, 24);
                l0Var14.d = obj;
                return l0Var14;
            case 25:
                return new l0((bo4) this.d, (hzb) this.e, (oyb) obj2, n92Var, 25);
            case 26:
                return new l0((zj2) this.d, (PostType) this.e, (x45) obj2, n92Var, 26);
            case 27:
                l0 l0Var15 = new l0((ek2) this.e, (yaf) obj2, n92Var, 27);
                l0Var15.d = obj;
                return l0Var15;
            case 28:
                l0 l0Var16 = new l0((gl2) this.e, (zaf) obj2, n92Var, 28);
                l0Var16.d = obj;
                return l0Var16;
            default:
                l0 l0Var17 = new l0((mu2) obj2, n92Var, 29);
                l0Var17.e = obj;
                return l0Var17;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((l0) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:252:0x05e4, code lost:
    
        if (r1 == r0) goto L253;
     */
    /* JADX WARN: Code restructure failed: missing block: B:271:0x0642, code lost:
    
        if (r1 == r2) goto L276;
     */
    /* JADX WARN: Code restructure failed: missing block: B:473:0x0a6a, code lost:
    
        if (defpackage.r6c.m(r4, r5, r65) == r2) goto L474;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0320  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x032e  */
    /* JADX WARN: Removed duplicated region for block: B:200:0x0464  */
    /* JADX WARN: Removed duplicated region for block: B:280:0x066b  */
    /* JADX WARN: Removed duplicated region for block: B:282:0x0680  */
    /* JADX WARN: Removed duplicated region for block: B:455:0x0a07 A[PHI: r3
      0x0a07: PHI (r3v12 java.lang.Object) = (r3v11 java.lang.Object), (r3v11 java.lang.Object), (r3v16 java.lang.Object) binds: [B:451:0x09ef, B:453:0x0a04, B:445:0x09cb] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:457:0x0a0d  */
    /* JADX WARN: Removed duplicated region for block: B:498:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:527:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:569:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r66) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2782
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l0.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l0(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l0(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
    }
}
