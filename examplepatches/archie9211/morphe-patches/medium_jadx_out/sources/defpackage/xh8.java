package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xh8 implements do4 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ rya b;
    public final /* synthetic */ do4 c;
    public final /* synthetic */ rya d;

    public xh8(rya ryaVar, do4 do4Var, rya ryaVar2) {
        this.b = ryaVar;
        this.c = do4Var;
        this.d = ryaVar2;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        switch (this.a) {
            case 0:
                return b((j00) obj, n92Var);
            default:
                mk8 mk8Var = (mk8) obj;
                boolean z = mk8Var instanceof kk8;
                rya ryaVar = this.d;
                do4 do4Var = this.c;
                rya ryaVar2 = this.b;
                if (z) {
                    Iterable<xj8> iterable = (Iterable) ryaVar2.a;
                    ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
                    for (xj8 xj8VarB : iterable) {
                        xi8 xi8Var = xj8VarB.b;
                        if (xi8Var instanceof yne) {
                            kk8 kk8Var = (kk8) mk8Var;
                            if (g76.L(((yne) xi8Var).b, kk8Var.a)) {
                                xj8VarB = xj8.b(xj8VarB, yne.a((yne) xj8VarB.b, kk8Var.b, null, 223));
                            }
                        }
                        arrayList.add(xj8VarB);
                    }
                    ryaVar2.a = arrayList;
                    Object objA = do4Var.a(new qk8((Long) ryaVar.a, arrayList), n92Var);
                    if (objA == tb2.COROUTINE_SUSPENDED) {
                        return objA;
                    }
                } else {
                    if (!(mk8Var instanceof lk8)) {
                        ygf.a();
                        return null;
                    }
                    Iterable<xj8> iterable2 = (Iterable) ryaVar2.a;
                    ArrayList arrayList2 = new ArrayList(cu1.k0(iterable2, 10));
                    for (xj8 xj8VarB2 : iterable2) {
                        xi8 xi8Var2 = xj8VarB2.b;
                        if (xi8Var2 instanceof yne) {
                            lk8 lk8Var = (lk8) mk8Var;
                            if (g76.L(((yne) xi8Var2).b, lk8Var.a)) {
                                xj8VarB2 = xj8.b(xj8VarB2, yne.a((yne) xj8VarB2.b, null, lk8Var.b, 191));
                            }
                        }
                        arrayList2.add(xj8VarB2);
                    }
                    ryaVar2.a = arrayList2;
                    Object objA2 = do4Var.a(new qk8((Long) ryaVar.a, arrayList2), n92Var);
                    if (objA2 == tb2.COROUTINE_SUSPENDED) {
                        return objA2;
                    }
                }
                return c1e.a;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0060, code lost:
    
        if (r7.a(r9, r0) == r1) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.j00 r8, defpackage.n92 r9) {
        /*
            r7 = this;
            boolean r0 = r9 instanceof defpackage.wh8
            if (r0 == 0) goto L13
            r0 = r9
            wh8 r0 = (defpackage.wh8) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            wh8 r0 = new wh8
            r0.<init>(r7, r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            c1e r3 = defpackage.c1e.a
            r4 = 2
            r5 = 1
            rya r6 = r7.d
            if (r2 == 0) goto L3b
            if (r2 == r5) goto L35
            if (r2 != r4) goto L2e
            defpackage.br7.v(r9)
            return r3
        L2e:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L35:
            j00 r8 = r0.b
            defpackage.br7.v(r9)
            goto L63
        L3b:
            defpackage.br7.v(r9)
            rya r9 = r7.b
            r9.a = r8
            boolean r9 = r8.h
            do4 r7 = r7.c
            if (r9 == 0) goto L66
            java.lang.Object r9 = r6.a
            if (r9 == 0) goto L63
            java.lang.String r9 = "ApolloGraphQL: extra response received after the last one"
            java.io.PrintStream r2 = java.lang.System.out
            r2.println(r9)
            java.lang.Object r9 = r6.a
            r9.getClass()
            r0.b = r8
            r0.e = r5
            java.lang.Object r7 = r7.a(r9, r0)
            if (r7 != r1) goto L63
            goto L6e
        L63:
            r6.a = r8
            return r3
        L66:
            r0.e = r4
            java.lang.Object r7 = r7.a(r8, r0)
            if (r7 != r1) goto L6f
        L6e:
            return r1
        L6f:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xh8.b(j00, n92):java.lang.Object");
    }

    public xh8(rya ryaVar, rya ryaVar2, do4 do4Var) {
        this.b = ryaVar;
        this.d = ryaVar2;
        this.c = do4Var;
    }
}
