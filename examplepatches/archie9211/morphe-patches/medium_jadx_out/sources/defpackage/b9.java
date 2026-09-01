package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.graphql.type.PostType;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public Object f;
    public Object g;
    public Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b9(qu4 qu4Var, nhc nhcVar, sb2 sb2Var, zm7 zm7Var, Resources resources, n92 n92Var) {
        super(2, n92Var);
        this.b = 18;
        this.f = qu4Var;
        this.d = nhcVar;
        this.g = sb2Var;
        this.h = zm7Var;
        this.e = resources;
    }

    private final Object A(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((ax4) this.f).n;
            a9 a9Var = new a9((nhc) this.d, (sb2) this.g, (Resources) this.e, this.h, 13);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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

    private final Object B(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((sy4) this.f).o;
            a9 a9Var = new a9((nhc) this.d, (sb2) this.g, (Resources) this.e, this.h, 14);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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

    /* JADX WARN: Removed duplicated region for block: B:19:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x007c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object C(java.lang.Object r12) throws java.lang.Throwable {
        /*
            r11 = this;
            java.lang.Object r0 = r11.e
            hx4 r0 = (defpackage.hx4) r0
            java.lang.Object r1 = r11.d
            java.lang.String r1 = (java.lang.String) r1
            java.lang.Object r2 = r11.h
            sb2 r2 = (defpackage.sb2) r2
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r11.c
            r5 = 2
            r6 = 1
            r7 = 0
            if (r4 == 0) goto L2d
            if (r4 == r6) goto L25
            if (r4 != r5) goto L1f
            java.lang.Object r11 = r11.g
            defpackage.br7.v(r12)
            goto L67
        L1f:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r7
        L25:
            java.lang.Object r0 = r11.f
            o33 r0 = (defpackage.o33) r0
            defpackage.br7.v(r12)
            goto L51
        L2d:
            defpackage.br7.v(r12)
            u95 r12 = new u95
            r12.<init>(r0, r1, r7, r6)
            r4 = 3
            o33 r12 = defpackage.vx0.G(r2, r7, r12, r4)
            u95 r8 = new u95
            r9 = 0
            r8.<init>(r0, r1, r7, r9)
            o33 r0 = defpackage.vx0.G(r2, r7, r8, r4)
            r11.h = r7
            r11.f = r0
            r11.c = r6
            java.lang.Object r12 = r12.i(r11)
            if (r12 != r3) goto L51
            goto L63
        L51:
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r12 = r12.a
            r11.h = r7
            r11.f = r7
            r11.g = r12
            r11.c = r5
            java.lang.Object r11 = r0.p0(r11)
            if (r11 != r3) goto L64
        L63:
            return r3
        L64:
            r10 = r12
            r12 = r11
            r11 = r10
        L67:
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r12 = r12.a
            java.lang.Throwable r0 = defpackage.bjb.b(r11)
            if (r0 == 0) goto L7c
            ajb r11 = new ajb
            r11.<init>(r0)
            bjb r12 = new bjb
            r12.<init>(r11)
            return r12
        L7c:
            java.lang.Throwable r0 = defpackage.bjb.b(r12)
            if (r0 == 0) goto L8d
            ajb r11 = new ajb
            r11.<init>(r0)
            bjb r12 = new bjb
            r12.<init>(r11)
            return r12
        L8d:
            defpackage.br7.v(r11)
            java.lang.String r11 = (java.lang.String) r11
            defpackage.br7.v(r12)
            jda r12 = (defpackage.jda) r12
            tb4 r0 = new tb4
            r0.<init>(r1, r11, r12)
            bjb r11 = new bjb
            r11.<init>(r0)
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b9.C(java.lang.Object):java.lang.Object");
    }

    private final Object D(Object obj) {
        String str = (String) this.d;
        xc5 xc5Var = (xc5) this.h;
        sb2 sb2Var = (sb2) this.f;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            n92 n92Var = null;
            vx0.c0(sb2Var, null, null, new m1(xc5Var, n92Var, 20), 3);
            do4 do4Var = (do4) this.g;
            hk1 hk1VarB = ip4.b(xc5Var.b.a(str), new wc5(n92Var, xc5Var, str, (bie) this.e, 0));
            this.f = null;
            this.c = 1;
            if (wgf.l(do4Var, hk1VarB, this) == tb2Var) {
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

    private final Object E(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((bq5) this.f).n;
            a9 a9Var = new a9((nhc) this.d, (Resources) this.e, this.g, this.h, 15);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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

    private final Object F(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((u97) this.f).r;
            a9 a9Var = new a9((nhc) this.d, (Resources) this.e, this.g, this.h, 17);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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

    private final Object G(Object obj) {
        ba8 ba8Var;
        g49 g49Var = (g49) this.d;
        l78 l78Var = (l78) this.e;
        d12 d12Var = (d12) this.g;
        l78 l78Var2 = (l78) this.h;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        c1e c1eVar = c1e.a;
        try {
            if (i == 0) {
                br7.v(obj);
                bo4 bo4Var = (bo4) this.f;
                if (((List) l78Var2.getValue()).size() < 2) {
                    jv5 jv5Var = jv5.c;
                    this.c = 1;
                    if (bo4Var.b(jv5Var, this) != tb2Var) {
                        return c1eVar;
                    }
                } else {
                    g49Var.h(0.0f);
                    ba8 ba8Var2 = (ba8) bu1.H0((List) l78Var2.getValue());
                    d12Var.b().g(ba8Var2);
                    d12Var.b().g((ba8) ((List) l78Var2.getValue()).get(((List) l78Var2.getValue()).size() - 2));
                    q9 q9Var = new q9(l78Var, 28, g49Var);
                    this.f = ba8Var2;
                    this.c = 2;
                    if (bo4Var.b(q9Var, this) != tb2Var) {
                        ba8Var = ba8Var2;
                    }
                }
                return tb2Var;
            }
            if (i == 1) {
                br7.v(obj);
                return c1eVar;
            }
            if (i != 2) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            ba8Var = (ba8) this.f;
            br7.v(obj);
            d12Var.i(ba8Var, false);
            return c1eVar;
        } finally {
            l78Var.setValue(Boolean.FALSE);
        }
    }

    private final Object H(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((tk8) this.f).o;
            a9 a9Var = new a9((nhc) this.d, (sb2) this.g, (Resources) this.e, this.h, 18);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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

    /* JADX WARN: Code restructure failed: missing block: B:30:0x00ad, code lost:
    
        if (r1.a(r2, r16) != r10) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x009e A[PHI: r0
      0x009e: PHI (r0v8 n7e) = (r0v6 n7e), (r0v7 n7e), (r0v15 n7e) binds: [B:18:0x0068, B:27:0x009b, B:11:0x002c] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object I(java.lang.Object r17) {
        /*
            r16 = this;
            r6 = r16
            java.lang.Object r0 = r6.d
            r7 = r0
            java.lang.String r7 = (java.lang.String) r7
            java.lang.Object r0 = r6.g
            r8 = r0
            tk8 r8 = (defpackage.tk8) r8
            r6c r9 = r8.m
            tb2 r10 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r6.c
            r11 = 4
            r12 = 3
            r13 = 2
            r14 = 0
            r1 = 1
            if (r0 == 0) goto L43
            if (r0 == r1) goto L3d
            if (r0 == r13) goto L35
            if (r0 == r12) goto L2c
            if (r0 != r11) goto L26
            defpackage.br7.v(r17)
            goto Lb0
        L26:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r14
        L2c:
            java.lang.Object r0 = r6.f
            n7e r0 = (defpackage.n7e) r0
            defpackage.br7.v(r17)
            goto L9e
        L35:
            java.lang.Object r0 = r6.f
            n7e r0 = (defpackage.n7e) r0
            defpackage.br7.v(r17)
            goto L7c
        L3d:
            defpackage.br7.v(r17)
            r0 = r17
            goto L64
        L43:
            defpackage.br7.v(r17)
            kbe r0 = r8.g
            java.lang.String r5 = r8.c
            java.lang.String r4 = r8.h
            java.lang.Object r2 = r6.h
            java.lang.String r2 = (java.lang.String) r2
            java.lang.Object r3 = r6.d
            java.lang.String r3 = (java.lang.String) r3
            java.lang.Object r15 = r6.e
            gen.model.SourceParameter r15 = (gen.model.SourceParameter) r15
            r6.c = r1
            r1 = r2
            r2 = r3
            r3 = r15
            java.lang.Object r0 = r0.a(r1, r2, r3, r4, r5, r6)
            if (r0 != r10) goto L64
            goto Laf
        L64:
            n7e r0 = (defpackage.n7e) r0
            boolean r1 = r0 instanceof defpackage.m7e
            if (r1 == 0) goto L9e
            kk8 r1 = new kk8
            bt4 r2 = defpackage.bt4.FOLLOWING
            r1.<init>(r7, r2)
            r6.f = r0
            r6.c = r13
            java.lang.Object r1 = r9.a(r1, r6)
            if (r1 != r10) goto L7c
            goto Laf
        L7c:
            r1 = r0
            m7e r1 = (defpackage.m7e) r1
            java.lang.String r1 = r1.a
            if (r1 == 0) goto L89
            bg8 r2 = new bg8
            r2.<init>(r1)
            goto L8e
        L89:
            ag8 r2 = new ag8
            r2.<init>(r14)
        L8e:
            lk8 r1 = new lk8
            r1.<init>(r7, r2)
            r6.f = r0
            r6.c = r12
            java.lang.Object r1 = r9.a(r1, r6)
            if (r1 != r10) goto L9e
            goto Laf
        L9e:
            r6c r1 = r8.n
            nk8 r2 = new nk8
            r2.<init>(r0)
            r6.f = r14
            r6.c = r11
            java.lang.Object r0 = r1.a(r2, r6)
            if (r0 != r10) goto Lb0
        Laf:
            return r10
        Lb0:
            c1e r0 = defpackage.c1e.a
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b9.I(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x00a3, code lost:
    
        if (r1.a(r2, r16) != r10) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0094 A[PHI: r0
      0x0094: PHI (r0v8 g8e) = (r0v6 g8e), (r0v7 g8e), (r0v15 g8e) binds: [B:18:0x0067, B:23:0x0091, B:11:0x002c] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object J(java.lang.Object r17) {
        /*
            r16 = this;
            r6 = r16
            java.lang.Object r0 = r6.d
            r7 = r0
            java.lang.String r7 = (java.lang.String) r7
            java.lang.Object r0 = r6.g
            r8 = r0
            tk8 r8 = (defpackage.tk8) r8
            r6c r9 = r8.m
            tb2 r10 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r6.c
            r11 = 0
            r12 = 4
            r13 = 3
            r14 = 2
            r1 = 1
            if (r0 == 0) goto L42
            if (r0 == r1) goto L3c
            if (r0 == r14) goto L34
            if (r0 == r13) goto L2c
            if (r0 != r12) goto L26
            defpackage.br7.v(r17)
            goto La6
        L26:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r11
        L2c:
            java.lang.Object r0 = r6.f
            g8e r0 = (defpackage.g8e) r0
            defpackage.br7.v(r17)
            goto L94
        L34:
            java.lang.Object r0 = r6.f
            g8e r0 = (defpackage.g8e) r0
            defpackage.br7.v(r17)
            goto L7b
        L3c:
            defpackage.br7.v(r17)
            r0 = r17
            goto L63
        L42:
            defpackage.br7.v(r17)
            kbe r0 = r8.g
            java.lang.String r5 = r8.c
            java.lang.String r4 = r8.h
            java.lang.Object r2 = r6.h
            java.lang.String r2 = (java.lang.String) r2
            java.lang.Object r3 = r6.d
            java.lang.String r3 = (java.lang.String) r3
            java.lang.Object r15 = r6.e
            gen.model.SourceParameter r15 = (gen.model.SourceParameter) r15
            r6.c = r1
            r1 = r2
            r2 = r3
            r3 = r15
            java.lang.Object r0 = r0.g(r1, r2, r3, r4, r5, r6)
            if (r0 != r10) goto L63
            goto La5
        L63:
            g8e r0 = (defpackage.g8e) r0
            boolean r1 = r0 instanceof defpackage.a8e
            if (r1 == 0) goto L94
            kk8 r1 = new kk8
            bt4 r2 = defpackage.bt4.NOT_FOLLOWING
            r1.<init>(r7, r2)
            r6.f = r0
            r6.c = r14
            java.lang.Object r1 = r9.a(r1, r6)
            if (r1 != r10) goto L7b
            goto La5
        L7b:
            lk8 r1 = new lk8
            ag8 r2 = new ag8
            java.lang.Object r3 = r6.h
            java.lang.String r3 = (java.lang.String) r3
            r2.<init>(r3)
            r1.<init>(r7, r2)
            r6.f = r0
            r6.c = r13
            java.lang.Object r1 = r9.a(r1, r6)
            if (r1 != r10) goto L94
            goto La5
        L94:
            r6c r1 = r8.n
            nk8 r2 = new nk8
            r2.<init>(r0)
            r6.f = r11
            r6.c = r12
            java.lang.Object r0 = r1.a(r2, r6)
            if (r0 != r10) goto La6
        La5:
            return r10
        La6:
            c1e r0 = defpackage.c1e.a
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b9.J(java.lang.Object):java.lang.Object");
    }

    private final Object i(Object obj) {
        yd0 yd0Var = (yd0) this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        n92 n92Var = null;
        int i2 = 1;
        try {
            if (i == 0) {
                br7.v(obj);
                SusiOperation susiOperation = (SusiOperation) this.f;
                SusiOperation susiOperation2 = SusiOperation.LOGIN;
                boolean z = susiOperation == susiOperation2;
                boolean z2 = susiOperation == susiOperation2;
                String str = (String) this.g;
                if (str.length() <= 0) {
                    throw new IllegalArgumentException("serverClientId should not be empty");
                }
                x95 x95Var = new x95(str, z, z2);
                ArrayList arrayList = new ArrayList();
                arrayList.add(x95Var);
                i95 i95Var = new i95(bu1.m1(arrayList));
                bh2 bh2Var = (bh2) ((vq6) this.e).getValue();
                Context context = (Context) this.h;
                this.c = 1;
                obj = bh2Var.b(context, i95Var, this);
                if (obj == tb2Var) {
                    return tb2Var;
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            vx0.c0(f76.F(yd0Var), null, null, new ud0(((k95) obj).a, yd0Var, n92Var, i2), 3);
        } catch (Exception e) {
            yd0Var.n(e);
        }
        return c1e.a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0070, code lost:
    
        if (r8.a(r0, r14) == r9) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x008b, code lost:
    
        if (r8.a(r0, r14) == r9) goto L29;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object n(java.lang.Object r15) {
        /*
            r14 = this;
            java.lang.Object r0 = r14.e
            r7 = r0
            java.lang.String r7 = (java.lang.String) r7
            java.lang.Object r0 = r14.f
            id1 r0 = (defpackage.id1) r0
            r6c r8 = r0.L
            tb2 r9 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r14.c
            r10 = 0
            r11 = 3
            r12 = 2
            r3 = 1
            if (r2 == 0) goto L2b
            if (r2 == r3) goto L26
            if (r2 == r12) goto L22
            if (r2 != r11) goto L1c
            goto L22
        L1c:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r10
        L22:
            defpackage.br7.v(r15)
            goto L8e
        L26:
            defpackage.br7.v(r15)
            r0 = r15
            goto L5f
        L2b:
            defpackage.br7.v(r15)
            ax2 r2 = r0.h
            java.lang.Object r4 = r14.g
            java.lang.String r4 = (java.lang.String) r4
            java.lang.String r5 = r0.c
            java.lang.Object r6 = r14.h
            gen.model.SourceParameter r6 = (gen.model.SourceParameter) r6
            java.lang.String r6 = defpackage.gp7.u(r6)
            java.lang.String r13 = r0.g()
            r2.d(r4, r5, r6, r13)
            o2b r0 = r0.w
            java.lang.Object r2 = r14.g
            r4 = r2
            java.lang.String r4 = (java.lang.String) r4
            java.lang.Object r2 = r14.d
            r5 = r2
            java.lang.String r5 = (java.lang.String) r5
            com.medium.android.core.models.EntityType r2 = com.medium.android.core.models.EntityType.AUTHOR
            r14.c = r3
            r6 = 0
            r3 = 0
            r1 = r14
            java.lang.Object r0 = r0.u(r1, r2, r3, r4, r5, r6)
            if (r0 != r9) goto L5f
            goto L8d
        L5f:
            swc r0 = (defpackage.swc) r0
            boolean r2 = r0 instanceof defpackage.rwc
            if (r2 == 0) goto L73
            tb1 r0 = new tb1
            r0.<init>(r7)
            r14.c = r12
            java.lang.Object r0 = r8.a(r0, r14)
            if (r0 != r9) goto L8e
            goto L8d
        L73:
            boolean r2 = r0 instanceof defpackage.pwc
            if (r2 != 0) goto L80
            boolean r0 = r0 instanceof defpackage.qwc
            if (r0 == 0) goto L7c
            goto L80
        L7c:
            defpackage.ygf.a()
            return r10
        L80:
            sb1 r0 = new sb1
            r0.<init>(r7)
            r14.c = r11
            java.lang.Object r0 = r8.a(r0, r14)
            if (r0 != r9) goto L8e
        L8d:
            return r9
        L8e:
            c1e r0 = defpackage.c1e.a
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b9.n(java.lang.Object):java.lang.Object");
    }

    private final Object o(Object obj) {
        aj1 aj1Var = (aj1) this.h;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            m40 m40Var = ((bj1) this.f).a;
            nhc nhcVar = (nhc) this.d;
            Resources resources = (Resources) this.e;
            m50 m50Var = (m50) this.g;
            int i2 = 0;
            int i3 = 1;
            Class<aj1> cls = aj1.class;
            k0 k0Var = new k0(i3, aj1Var, cls, "goToEditCatalog", "goToEditCatalog(Lcom/medium/android/listitems/catalogs/CatalogUiModel;)V", i2, 4);
            k0 k0Var2 = new k0(i3, aj1Var, cls, "goToMakeCatalogPrivateConfirmation", "goToMakeCatalogPrivateConfirmation(Lcom/medium/android/listitems/catalogs/CatalogUiModel;)V", i2, 5);
            xi1 xi1Var = new xi1(2, aj1Var, cls, "goToDeleteCatalog", "goToDeleteCatalog(Ljava/lang/String;Ljava/lang/String;)V", i2, 0);
            this.c = 1;
            if (vc2.K(m40Var, nhcVar, resources, m50Var, k0Var, k0Var2, xi1Var, this) == tb2Var) {
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
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((ru1) this.f).i;
            a9 a9Var = new a9((nhc) this.d, (sb2) this.g, (Resources) this.e, this.h, 5);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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
        kx6 kx6Var = (kx6) this.f;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        try {
            if (i == 0) {
                br7.v(obj);
                u50 u50VarE = no7.E(new vs((l78) this.g, 8));
                a9 a9Var = new a9(kx6Var, (zid) this.h, (lid) this.d, (ry5) this.e, 6);
                this.c = 1;
                if (u50VarE.b(a9Var, this) == tb2Var) {
                    return tb2Var;
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            rv8.w(kx6Var);
            return c1e.a;
        } catch (Throwable th) {
            rv8.w(kx6Var);
            throw th;
        }
    }

    private final Object v(Object obj) {
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
        qy0 qy0Var = (qy0) this.f;
        uid uidVar = (uid) this.g;
        i00 i00Var = ((kx6) this.h).a;
        qjd qjdVar = ((rjd) this.d).a;
        yqa yqaVar = (yqa) this.e;
        this.c = 1;
        int iE = bkd.e(uidVar.b);
        yqaVar.a(iE);
        Object objA = qy0Var.a(iE < qjdVar.a.a.b.length() ? qjdVar.b(iE) : iE != 0 ? qjdVar.b(iE - 1) : new zwa(0.0f, 0.0f, 1.0f, (int) (uhd.a((mkd) i00Var.c, (m73) i00Var.d, (yy4) i00Var.f, uhd.a, 1) & 4294967295L)), this);
        if (objA != tb2Var) {
            objA = c1eVar;
        }
        return objA == tb2Var ? tb2Var : c1eVar;
    }

    private final Object w(Object obj) {
        do4 do4Var = (do4) this.f;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            yu yuVar = new yu(do4Var, (zj2) this.g, (PostType) this.h, (x45) this.d, (c55) this.e, (n92) null, 5);
            this.f = null;
            this.c = 1;
            if (o7f.s(yuVar, this) == tb2Var) {
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

    private final Object x(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((qe3) this.f).l;
            a9 a9Var = new a9(this.g, (nhc) this.d, (Resources) this.e, this.h, 8);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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

    private final Object y(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((ju3) this.f).p;
            a9 a9Var = new a9(this.g, (nhc) this.d, (Resources) this.e, this.h, 11);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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

    private final Object z(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            uua uuaVar = ((qu4) this.f).r;
            a9 a9Var = new a9((nhc) this.d, this.g, this.h, (Resources) this.e, 12);
            this.c = 1;
            if (uuaVar.a.b(a9Var, this) == tb2Var) {
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
                return new b9((r9) this.f, (akc) this.g, (s26) this.h, (nhc) this.d, (Resources) obj2, n92Var, 0);
            case 1:
                return new b9(this.f, this.g, (nhc) this.d, (Resources) obj2, this.h, n92Var, 1);
            case 2:
                return new b9((eg) this.g, (String) this.h, (String) this.d, (SourceParameter) obj2, n92Var, 2);
            case 3:
                return new b9((eg) this.g, (String) this.h, (String) this.d, (SourceParameter) obj2, n92Var, 3);
            case 4:
                return new b9((que) this.f, (nhc) this.d, (sb2) this.g, (Resources) obj2, this.h, n92Var, 4);
            case 5:
                return new b9((rj) this.g, (String) this.h, (String) this.d, (SourceParameter) obj2, n92Var, 5);
            case 6:
                return new b9((rj) this.g, (String) this.h, (String) this.d, (SourceParameter) obj2, n92Var, 6);
            case 7:
                b9 b9Var = new b9((kr) this.g, (x45) this.h, (cq) this.d, (fx6) obj2, n92Var, 7);
                b9Var.f = obj;
                return b9Var;
            case 8:
                return new b9((SusiOperation) this.f, (String) this.g, (Context) this.h, (yd0) this.d, (vq6) obj2, n92Var, 8);
            case 9:
                return new b9((yd0) this.f, (String) this.g, (SusiDestination) this.h, (String) this.d, (SusiOperation) obj2, n92Var, 9);
            case 10:
                return new b9((id1) this.f, (String) this.g, (SourceParameter) this.h, (String) this.d, (String) obj2, n92Var, 10);
            case 11:
                return new b9(this.f, (nhc) this.d, (Resources) obj2, this.g, this.h, n92Var, 11);
            case 12:
                return new b9((que) this.f, (nhc) this.d, (sb2) this.g, (Resources) obj2, this.h, n92Var, 12);
            case 13:
                return new b9((kx6) this.f, (l78) this.g, (zid) this.h, (lid) this.d, (ry5) obj2, n92Var, 13);
            case 14:
                return new b9((qy0) this.f, (uid) this.g, (kx6) this.h, (rjd) this.d, (yqa) obj2, n92Var, 14);
            case 15:
                b9 b9Var2 = new b9((zj2) this.g, (PostType) this.h, (x45) this.d, (c55) obj2, n92Var, 15);
                b9Var2.f = obj;
                return b9Var2;
            case 16:
                return new b9(this.f, this.g, (nhc) this.d, (Resources) obj2, this.h, n92Var, 16);
            case 17:
                return new b9(this.f, this.g, (nhc) this.d, (Resources) obj2, this.h, n92Var, 17);
            case 18:
                return new b9((qu4) this.f, (nhc) this.d, (sb2) this.g, (zm7) this.h, (Resources) obj2, n92Var);
            case 19:
                return new b9((que) this.f, (nhc) this.d, (sb2) this.g, (Resources) obj2, this.h, n92Var, 19);
            case 20:
                return new b9((que) this.f, (nhc) this.d, (sb2) this.g, (Resources) obj2, this.h, n92Var, 20);
            case 21:
                b9 b9Var3 = new b9(n92Var, (hx4) obj2, (String) this.d);
                b9Var3.h = obj;
                return b9Var3;
            case 22:
                b9 b9Var4 = new b9((do4) this.g, (xc5) this.h, (String) this.d, (bie) obj2, n92Var, 22);
                b9Var4.f = obj;
                return b9Var4;
            case 23:
                return new b9(this.f, (nhc) this.d, (Resources) obj2, this.g, this.h, n92Var, 23);
            case 24:
                return new b9(this.f, (nhc) this.d, (Resources) obj2, this.g, this.h, n92Var, 24);
            case 25:
                b9 b9Var5 = new b9((d12) this.g, (l78) this.h, (g49) this.d, (l78) obj2, n92Var, 25);
                b9Var5.f = obj;
                return b9Var5;
            case 26:
                return new b9((que) this.f, (nhc) this.d, (sb2) this.g, (Resources) obj2, this.h, n92Var, 26);
            case 27:
                return new b9((tk8) this.g, (String) this.h, (String) this.d, (SourceParameter) obj2, n92Var, 27);
            case 28:
                return new b9((tk8) this.g, (String) this.h, (String) this.d, (SourceParameter) obj2, n92Var, 28);
            default:
                b9 b9Var6 = new b9((tk8) obj2, n92Var);
                b9Var6.d = obj;
                return b9Var6;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 12:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 13:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 14:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 15:
                return ((b9) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 16:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 17:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 18:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 19:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 20:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 21:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 22:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 23:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 24:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 25:
                return ((b9) create((bo4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 26:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 27:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 28:
                return ((b9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((b9) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:270:0x0573, code lost:
    
        if (r2.a(r0, r79) == r3) goto L286;
     */
    /* JADX WARN: Code restructure failed: missing block: B:272:0x0576, code lost:
    
        r0 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:276:0x058c, code lost:
    
        if (r2.a(defpackage.ok8.a, r79) == r3) goto L286;
     */
    /* JADX WARN: Code restructure failed: missing block: B:285:0x05d1, code lost:
    
        if (defpackage.r6c.m(r4, r5, r79) != r3) goto L287;
     */
    /* JADX WARN: Code restructure failed: missing block: B:404:0x07d6, code lost:
    
        if (r1.a(r2, r79) == r8) goto L405;
     */
    /* JADX WARN: Code restructure failed: missing block: B:422:0x0847, code lost:
    
        if (r1.a(r2, r79) == r8) goto L423;
     */
    /* JADX WARN: Code restructure failed: missing block: B:451:0x0901, code lost:
    
        if (r1.a(r2, r79) == r10) goto L452;
     */
    /* JADX WARN: Code restructure failed: missing block: B:469:0x0976, code lost:
    
        if (r1.a(r2, r79) == r10) goto L470;
     */
    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:281:0x0598  */
    /* JADX WARN: Removed duplicated region for block: B:284:0x05b6 A[PHI: r0 r1 r17
      0x05b6: PHI (r0v166 rya) = (r0v164 rya), (r0v164 rya), (r0v170 rya) binds: [B:280:0x0596, B:282:0x05b3, B:13:0x0033] A[DONT_GENERATE, DONT_INLINE]
      0x05b6: PHI (r1v71 rya) = (r1v69 rya), (r1v69 rya), (r1v77 rya) binds: [B:280:0x0596, B:282:0x05b3, B:13:0x0033] A[DONT_GENERATE, DONT_INLINE]
      0x05b6: PHI (r17v10 java.lang.Object) = (r17v8 java.lang.Object), (r17v8 java.lang.Object), (r17v12 java.lang.Object) binds: [B:280:0x0596, B:282:0x05b3, B:13:0x0033] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:342:0x0688  */
    /* JADX WARN: Removed duplicated region for block: B:345:0x06b1  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r80) {
        /*
            Method dump skipped, instruction units count: 2666
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b9.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b9(n92 n92Var, hx4 hx4Var, String str) {
        super(2, n92Var);
        this.b = 21;
        this.d = str;
        this.e = hx4Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b9(tk8 tk8Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 29;
        this.e = tk8Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b9(que queVar, nhc nhcVar, sb2 sb2Var, Resources resources, Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = queVar;
        this.d = nhcVar;
        this.g = sb2Var;
        this.e = resources;
        this.h = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b9(Object obj, nhc nhcVar, Resources resources, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.d = nhcVar;
        this.e = resources;
        this.g = obj2;
        this.h = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b9(Object obj, Object obj2, nhc nhcVar, Resources resources, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.d = nhcVar;
        this.e = resources;
        this.h = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b9(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = obj;
        this.h = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b9(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.g = obj2;
        this.h = obj3;
        this.d = obj4;
        this.e = obj5;
    }
}
