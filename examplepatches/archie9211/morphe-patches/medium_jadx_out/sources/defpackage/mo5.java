package defpackage;

import android.content.res.Resources;
import com.medium.android.core.share.PostShareData;
import com.medium.android.donkey.post.PostFragment;
import com.medium.android.graphql.fragment.PostMetaData;
import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mo5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public final /* synthetic */ Object e;
    public /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mo5(Integer num, kv6 kv6Var, fj9 fj9Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 22;
        this.d = num;
        this.e = kv6Var;
        this.f = fj9Var;
    }

    private final Object i(Object obj) {
        Integer num = (Integer) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        c1e c1eVar = c1e.a;
        if (i != 0) {
            if (i == 1) {
                br7.v(obj);
                return c1eVar;
            }
            ygf.f("call to 'resume' before 'invoke' with coroutine");
            return null;
        }
        br7.v(obj);
        if (num != null) {
            u50 u50VarE = no7.E(new f91((kv6) this.e, 6));
            q9 q9Var = new q9(num, 29, (fj9) this.f);
            this.c = 1;
            if (u50VarE.b(q9Var, this) == tb2Var) {
                return tb2Var;
            }
        }
        return c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0066 A[PHI: r3
      0x0066: PHI (r3v2 java.lang.Object) = (r3v1 java.lang.Object), (r3v1 java.lang.Object), (r3v3 java.lang.Object) binds: [B:23:0x0054, B:25:0x0063, B:12:0x0027] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x006c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object n(java.lang.Object r11) {
        /*
            r10 = this;
            java.lang.Object r0 = r10.e
            java.lang.String r0 = (java.lang.String) r0
            java.lang.Object r1 = r10.f
            ko9 r1 = (defpackage.ko9) r1
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r10.c
            c1e r4 = defpackage.c1e.a
            r5 = 4
            r6 = 3
            r7 = 2
            r8 = 1
            r9 = 0
            if (r3 == 0) goto L3a
            if (r3 == r8) goto L36
            if (r3 == r7) goto L2d
            if (r3 == r6) goto L27
            if (r3 != r5) goto L21
            defpackage.br7.v(r11)
            return r4
        L21:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r9
        L27:
            java.lang.Object r3 = r10.d
            defpackage.br7.v(r11)
            goto L66
        L2d:
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r11 = r11.a
        L34:
            r3 = r11
            goto L52
        L36:
            defpackage.br7.v(r11)
            goto L47
        L3a:
            defpackage.br7.v(r11)
            xpc r11 = r1.u
            r10.c = r8
            r11.a(r9, r10)
            if (r4 != r2) goto L47
            goto L7d
        L47:
            x53 r11 = r1.j
            r10.c = r7
            java.lang.Object r11 = r11.b(r0, r10)
            if (r11 != r2) goto L34
            goto L7d
        L52:
            boolean r11 = r3 instanceof defpackage.ajb
            if (r11 != 0) goto L66
            r11 = r3
            c1e r11 = (defpackage.c1e) r11
            sye r11 = r1.f
            r10.d = r3
            r10.c = r6
            java.lang.Object r11 = r11.c(r0, r10)
            if (r11 != r2) goto L66
            goto L7d
        L66:
            java.lang.Throwable r11 = defpackage.bjb.b(r3)
            if (r11 == 0) goto L7e
            r6c r11 = r1.s
            p24 r1 = new p24
            r1.<init>(r0)
            r10.d = r3
            r10.c = r5
            java.lang.Object r10 = r11.a(r1, r10)
            if (r10 != r2) goto L7e
        L7d:
            return r2
        L7e:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo5.n(java.lang.Object):java.lang.Object");
    }

    private final Object o(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            r6c r6cVar = ((sw9) this.d).x0;
            PostShareData postShareData = (PostShareData) this.f;
            g08 g08Var = (g08) this.e;
            bu9 bu9Var = new bu9(postShareData, g08Var.d, g08Var.a, g08Var.c);
            this.c = 1;
            if (r6cVar.a(bu9Var, this) == tb2Var) {
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

    private final Object r(Object obj) {
        sw9 sw9Var = (sw9) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        int i2 = 1;
        if (i == 0) {
            br7.v(obj);
            cxe cxeVar = sw9Var.W;
            String id = sw9Var.b.getId();
            cxeVar.getClass();
            id.getClass();
            gn9 gn9Var = cxeVar.a;
            gn9Var.getClass();
            bo4 bo4VarJ = m40.J(new pc1(gn9Var.g, 26, id));
            eh9 eh9Var = new eh9((pya) this.f, (rya) this.e, sw9Var, i2);
            this.c = 1;
            if (bo4VarJ.b(eh9Var, this) == tb2Var) {
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

    private final Object u(Object obj) {
        sw9 sw9Var = (sw9) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        int i2 = 1;
        if (i == 0) {
            br7.v(obj);
            bo4 bo4VarX = sw9Var.F.x(wh9.a((PostMetaData) this.f), false);
            vu9 vu9Var = new vu9((rya) this.e, sw9Var, i2);
            this.c = 1;
            if (bo4VarX.b(vu9Var, this) == tb2Var) {
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
        eg1 eg1Var = (eg1) this.f;
        sw9 sw9Var = (sw9) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            sw9Var.k.h(eg1Var.b, sw9Var.d, (String) this.e, sw9Var.D0);
            au9 au9Var = new au9(eg1Var);
            r6c r6cVar = sw9Var.x0;
            this.c = 1;
            if (r6cVar.a(au9Var, this) == tb2Var) {
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

    private final Object w(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            r6c r6cVar = ((sw9) this.d).x0;
            zs9 zs9Var = new zs9(((b08) this.f).c, (String) this.e);
            this.c = 1;
            if (r6cVar.a(zs9Var, this) == tb2Var) {
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

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new mo5((bo4) this.d, (ap5) this.f, (kv6) obj2, n92Var, 0);
            case 1:
                return new mo5((bo4) this.d, (bq5) this.f, (kv6) obj2, n92Var, 1);
            case 2:
                return new mo5((gz8) this.d, (rq5) this.f, (vq5) obj2, n92Var, 2);
            case 3:
                mo5 mo5Var = new mo5((rw5) obj2, n92Var, 3);
                mo5Var.f = obj;
                return mo5Var;
            case 4:
                return new mo5((x86) this.d, (ny9) this.f, (Long) obj2, n92Var, 4);
            case 5:
                return new mo5((mt6) this.d, (tj4) this.f, (of5) obj2, n92Var, 5);
            case 6:
                mo5 mo5Var2 = new mo5((b55) this.f, (q41) obj2, n92Var, 6);
                mo5Var2.d = obj;
                return mo5Var2;
            case 7:
                return new mo5((qi1) this.d, (l78) this.f, (tg1) obj2, n92Var, 7);
            case 8:
                mo5 mo5Var3 = new mo5((zd7) obj2, n92Var, 8);
                mo5Var3.f = obj;
                return mo5Var3;
            case 9:
                return new mo5((me7) this.d, (nhc) this.f, (Resources) obj2, n92Var, 9);
            case 10:
                mo5 mo5Var4 = new mo5((yi7) obj2, n92Var, 10);
                mo5Var4.f = obj;
                return mo5Var4;
            case 11:
                mo5 mo5Var5 = new mo5((File) obj2, n92Var, 11);
                mo5Var5.f = obj;
                return mo5Var5;
            case 12:
                mo5 mo5Var6 = new mo5((rya) this.f, (lt5) obj2, n92Var, 12);
                mo5Var6.d = obj;
                return mo5Var6;
            case 13:
                return new mo5((nhc) this.d, (Resources) this.f, (i98) obj2, n92Var, 13);
            case 14:
                return new mo5((hwb) this.d, (l78) this.f, (g49) obj2, n92Var, 14);
            case 15:
                mo5 mo5Var7 = new mo5((e72) this.f, (me8) obj2, n92Var, 15);
                mo5Var7.d = obj;
                return mo5Var7;
            case 16:
                mo5 mo5Var8 = new mo5((c79) obj2, n92Var, 16);
                mo5Var8.f = obj;
                return mo5Var8;
            case 17:
                return new mo5((rya) this.f, (lc9) obj2, n92Var, 17);
            case 18:
                return new mo5((tl) this.d, (String) this.f, (String) obj2, n92Var, 18);
            case 19:
                return new mo5((PostFragment) this.d, (ou9) this.f, (nhc) obj2, n92Var, 19);
            case 20:
                return new mo5((PostFragment) this.d, (nhc) this.f, (sb2) obj2, n92Var, 20);
            case 21:
                return new mo5((String) this.d, (su9) this.f, (kv6) obj2, n92Var, 21);
            case 22:
                return new mo5((Integer) this.d, (kv6) obj2, (fj9) this.f, n92Var);
            case 23:
                return new mo5((ko9) this.f, (String) obj2, n92Var, 23);
            case 24:
                return new mo5((sw9) this.d, (PostShareData) this.f, (g08) obj2, n92Var, 24);
            case 25:
                return new mo5((sw9) this.d, (pya) this.f, (rya) obj2, n92Var, 25);
            case 26:
                return new mo5((sw9) this.d, (PostMetaData) this.f, (rya) obj2, n92Var, 26);
            case 27:
                return new mo5((sw9) this.d, (eg1) this.f, (String) obj2, n92Var, 27);
            case 28:
                return new mo5((sw9) this.d, (b08) this.f, (String) obj2, n92Var, 28);
            default:
                return new mo5((sw9) this.d, (oh8) this.f, (String) obj2, n92Var, 29);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((mo5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:145:0x029b, code lost:
    
        if (r2.a(r14, r4) == r3) goto L149;
     */
    /* JADX WARN: Code restructure failed: missing block: B:148:0x02aa, code lost:
    
        if (r2.a(r1, r4) == r3) goto L149;
     */
    /* JADX WARN: Code restructure failed: missing block: B:359:0x071c, code lost:
    
        if (defpackage.ur7.w(r2, r3, r4) == r0) goto L360;
     */
    /* JADX WARN: Code restructure failed: missing block: B:399:0x07fb, code lost:
    
        if (r9.f(r4, r0) != r10) goto L377;
     */
    /* JADX WARN: Code restructure failed: missing block: B:444:0x08f5, code lost:
    
        if (r10.e(r1, r22, r4) == r12) goto L445;
     */
    /* JADX WARN: Code restructure failed: missing block: B:541:0x0acb, code lost:
    
        if (r0.a(r3, r4) == r1) goto L542;
     */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0214  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x021a  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x029e  */
    /* JADX WARN: Removed duplicated region for block: B:268:0x0556  */
    /* JADX WARN: Removed duplicated region for block: B:396:0x07ec  */
    /* JADX WARN: Removed duplicated region for block: B:397:0x07ed A[Catch: all -> 0x075c, PHI: r0
      0x07ed: PHI (r0v56 java.lang.Object) = (r0v55 java.lang.Object), (r0v60 java.lang.Object) binds: [B:395:0x07ea, B:379:0x0758] A[DONT_GENERATE, DONT_INLINE], TRY_LEAVE, TryCatch #3 {all -> 0x075c, blocks: (B:378:0x0755, B:397:0x07ed, B:394:0x07d9), top: B:580:0x0731 }] */
    /* JADX WARN: Removed duplicated region for block: B:443:0x08d4  */
    /* JADX WARN: Removed duplicated region for block: B:540:0x0ab3  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r32) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 3026
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mo5.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mo5(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mo5(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.e = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mo5(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.f = obj2;
        this.e = obj3;
    }
}
