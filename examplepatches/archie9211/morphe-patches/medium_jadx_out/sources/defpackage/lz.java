package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.res.Resources;
import android.widget.Toast;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lz implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public lz(nya nyaVar, rya ryaVar, do4 do4Var, rya ryaVar2, d55 d55Var, n0c n0cVar, nya nyaVar2) {
        this.a = 2;
        this.b = nyaVar;
        this.c = ryaVar;
        this.h = do4Var;
        this.d = ryaVar2;
        this.e = d55Var;
        this.f = n0cVar;
        this.g = nyaVar2;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.h;
        Object obj3 = this.g;
        Object obj4 = this.e;
        Object obj5 = this.d;
        Object obj6 = this.c;
        int i2 = 3;
        Object obj7 = this.f;
        Object obj8 = this.b;
        switch (i) {
            case 0:
                return b((j00) obj, n92Var);
            case 1:
                sb2 sb2Var = (sb2) obj6;
                bc1 bc1Var = (bc1) obj;
                z81 z81Var = (z81) obj4;
                id1 id1Var = (id1) obj3;
                Resources resources = (Resources) obj7;
                nhc nhcVar = (nhc) obj8;
                ihc ihcVarA = nhcVar.a();
                if (ihcVarA != null) {
                    ihcVarA.a();
                }
                n92 n92Var2 = null;
                if (bc1Var instanceof ob1) {
                    vx0.c0(sb2Var, null, null, new o91(resources, bc1Var, nhcVar, null), 3);
                    return c1eVar;
                }
                int i3 = 1;
                if (bc1Var instanceof vb1) {
                    vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, n92Var2, i3), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof ub1) {
                    vx0.c0(sb2Var, null, null, new p91((nhc) obj8, bc1Var, (Resources) obj7, id1Var, (n92) null), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof za1) {
                    vx0.c0(sb2Var, null, null, new n91(nhcVar, resources, id1Var, n92Var2, 4), 3);
                    return c1eVar;
                }
                int i4 = 0;
                if (bc1Var instanceof ab1) {
                    Toast.makeText((Context) obj5, R.string.list_deleted, 0).show();
                    k40.X(((w81) z81Var).a).b.m(R.id.catalogDetailFragment, true);
                    return c1eVar;
                }
                if (bc1Var instanceof bb1) {
                    vx0.c0(sb2Var, null, null, new n91(nhcVar, resources, id1Var, n92Var2, 5), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof cb1) {
                    vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, n92Var2, 2), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof db1) {
                    db1 db1Var = (db1) bc1Var;
                    String str = db1Var.a;
                    String str2 = db1Var.b;
                    w81 w81Var = (w81) z81Var;
                    w81Var.getClass();
                    str.getClass();
                    CatalogDetailFragment catalogDetailFragment = w81Var.a;
                    ((p13) catalogDetailFragment.Z()).h0(catalogDetailFragment.S(), str, str2);
                    return c1eVar;
                }
                if (bc1Var instanceof eb1) {
                    vx0.c0(sb2Var, null, null, new o91(nhcVar, resources, bc1Var, n92Var2, 9), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof fb1) {
                    fb1 fb1Var = (fb1) bc1Var;
                    String str3 = fb1Var.a;
                    String str4 = fb1Var.b;
                    w81 w81Var2 = (w81) z81Var;
                    w81Var2.getClass();
                    str3.getClass();
                    CatalogDetailFragment catalogDetailFragment2 = w81Var2.a;
                    ((p13) catalogDetailFragment2.Z()).w0(catalogDetailFragment2.S(), str3, str4);
                    return c1eVar;
                }
                if (bc1Var instanceof gb1) {
                    vx0.c0(sb2Var, null, null, new n91(nhcVar, resources, id1Var, n92Var2, 6), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof hb1) {
                    vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, n92Var2, i2), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof jb1) {
                    jb1 jb1Var = (jb1) bc1Var;
                    String str5 = jb1Var.b;
                    UpsellInfo upsellInfo = jb1Var.a;
                    w81 w81Var3 = (w81) z81Var;
                    w81Var3.getClass();
                    CatalogDetailFragment catalogDetailFragment3 = w81Var3.a;
                    ((p13) catalogDetailFragment3.Z()).J(catalogDetailFragment3.S(), upsellInfo, str5, null);
                    return c1eVar;
                }
                if (bc1Var instanceof kb1) {
                    vx0.c0(sb2Var, null, null, new n91(nhcVar, resources, id1Var, n92Var2, 0), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof lb1) {
                    vx0.c0(sb2Var, null, null, new o91(nhcVar, resources, bc1Var, n92Var2, 0), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof mb1) {
                    vx0.c0(sb2Var, null, null, new n91(nhcVar, resources, id1Var, n92Var2, 1), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof nb1) {
                    vx0.c0(sb2Var, null, null, new o91(nhcVar, resources, bc1Var, n92Var2, 1), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof pb1) {
                    vx0.c0(sb2Var, null, null, new ra(bc1Var, (nhc) obj8, (Resources) obj7, (v91) obj2, null, 23), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof qb1) {
                    vx0.c0(sb2Var, null, null, new p91((nhc) obj8, (Resources) obj7, id1Var, bc1Var, (n92) null), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof rb1) {
                    vx0.c0(sb2Var, null, null, new n91(nhcVar, resources, id1Var, n92Var2, 2), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof wb1) {
                    vx0.c0(sb2Var, null, null, new n91(nhcVar, resources, id1Var, n92Var2, 3), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof xb1) {
                    vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, n92Var2, i4), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof ib1) {
                    vx0.c0(sb2Var, null, null, new o91(bc1Var, nhcVar, resources, n92Var2, 2), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof yb1) {
                    vx0.c0(sb2Var, null, null, new o91(bc1Var, nhcVar, resources, n92Var2, 4), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof zb1) {
                    vx0.c0(sb2Var, null, null, new o91(nhcVar, resources, bc1Var, n92Var2, 5), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof sb1) {
                    vx0.c0(sb2Var, null, null, new o91(nhcVar, resources, bc1Var, n92Var2, 6), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof tb1) {
                    vx0.c0(sb2Var, null, null, new o91(nhcVar, resources, bc1Var, n92Var2, 7), 3);
                    return c1eVar;
                }
                if (bc1Var instanceof ac1) {
                    vx0.c0(sb2Var, null, null, new o91(nhcVar, resources, bc1Var, n92Var2, 8), 3);
                    return c1eVar;
                }
                ygf.a();
                return null;
            case 2:
                return c((vz8) obj, n92Var);
            case 3:
                ou9 ou9Var = (ou9) obj;
                ihc ihcVarA2 = ((nhc) obj8).a();
                if (ihcVarA2 != null) {
                    ihcVarA2.a();
                }
                vx0.c0((sb2) obj6, null, null, new nz(ou9Var, (nhc) obj8, (fj9) obj5, (Context) obj4, (l78) obj7, (sw9) obj3, (kv6) obj2, null, 13), 3);
                return c1eVar;
            default:
                return d((bff) obj, n92Var);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x00bf, code lost:
    
        if (r11.a(r12, r6) != r7) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.j00 r12, defpackage.n92 r13) {
        /*
            r11 = this;
            java.lang.Object r0 = r11.e
            r1 = r0
            sz r1 = (defpackage.sz) r1
            java.lang.Object r0 = r11.d
            rya r0 = (defpackage.rya) r0
            java.lang.Object r2 = r11.c
            rya r2 = (defpackage.rya) r2
            boolean r3 = r13 instanceof defpackage.kz
            if (r3 == 0) goto L21
            r3 = r13
            kz r3 = (defpackage.kz) r3
            int r4 = r3.f
            r5 = -2147483648(0xffffffff80000000, float:-0.0)
            r6 = r4 & r5
            if (r6 == 0) goto L21
            int r4 = r4 - r5
            r3.f = r4
        L1f:
            r6 = r3
            goto L27
        L21:
            kz r3 = new kz
            r3.<init>(r11, r13)
            goto L1f
        L27:
            java.lang.Object r13 = r6.d
            tb2 r7 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r6.f
            java.lang.Object r4 = r11.f
            r8 = 3
            r5 = 1
            r9 = 2
            r10 = 0
            if (r3 == 0) goto L55
            if (r3 == r5) goto L4d
            if (r3 == r9) goto L46
            if (r3 != r8) goto L40
            defpackage.br7.v(r13)
            goto Lc2
        L40:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r10
        L46:
            j00 r12 = r6.b
            defpackage.br7.v(r13)
            goto Lb3
        L4d:
            rya r12 = r6.c
            j00 r2 = r6.b
            defpackage.br7.v(r13)
            goto L89
        L55:
            defpackage.br7.v(r13)
            java.lang.Object r13 = r11.b
            u78 r13 = (defpackage.u78) r13
            if (r13 == 0) goto L6b
            java.lang.Object r3 = r2.a
            if (r3 != 0) goto L63
            goto L6b
        L63:
            com.apollographql.apollo.exception.DefaultApolloException r11 = new com.apollographql.apollo.exception.DefaultApolloException
            java.lang.String r12 = "Apollo: optimistic updates can only be applied with one network response"
            r11.<init>(r12, r10)
            throw r11
        L6b:
            r2.a = r12
            java.lang.Object r2 = r0.a
            if (r2 != 0) goto L94
            if (r13 == 0) goto L8c
            zw2 r13 = r1.a
            r2 = r4
            h00 r2 = (defpackage.h00) r2
            java.util.UUID r2 = r2.b
            r6.b = r12
            r6.c = r0
            r6.f = r5
            java.lang.Object r13 = r13.e(r2, r6)
            if (r13 != r7) goto L87
            goto Lc1
        L87:
            r2 = r12
            r12 = r0
        L89:
            java.util.Set r13 = (java.util.Set) r13
            goto L90
        L8c:
            ny3 r13 = defpackage.ny3.a
            r2 = r12
            r12 = r0
        L90:
            r12.a = r13
            r3 = r2
            goto L95
        L94:
            r3 = r12
        L95:
            r2 = r4
            h00 r2 = (defpackage.h00) r2
            java.lang.Object r12 = r11.g
            r4 = r12
            yl2 r4 = (defpackage.yl2) r4
            java.lang.Object r12 = r0.a
            r12.getClass()
            r5 = r12
            java.util.Set r5 = (java.util.Set) r5
            r6.b = r3
            r6.c = r10
            r6.f = r9
            java.lang.Object r12 = r1.b(r2, r3, r4, r5, r6)
            if (r12 != r7) goto Lb2
            goto Lc1
        Lb2:
            r12 = r3
        Lb3:
            java.lang.Object r11 = r11.h
            do4 r11 = (defpackage.do4) r11
            r6.b = r10
            r6.f = r8
            java.lang.Object r11 = r11.a(r12, r6)
            if (r11 != r7) goto Lc2
        Lc1:
            return r7
        Lc2:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lz.b(j00, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:129:0x027f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0280 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00cd A[PHI: r0
      0x00cd: PHI (r0v33 java.lang.Object) = (r0v32 java.lang.Object), (r0v1 java.lang.Object) binds: [B:39:0x00c9, B:26:0x007d] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0181 A[PHI: r0
      0x0181: PHI (r0v49 java.lang.Object) = (r0v48 java.lang.Object), (r0v1 java.lang.Object) binds: [B:77:0x017d, B:21:0x0068] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0189  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01b8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object c(defpackage.vz8 r17, defpackage.n92 r18) {
        /*
            Method dump skipped, instruction units count: 676
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lz.c(vz8, n92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00b2, code lost:
    
        if (r4.a(defpackage.hff.a, r0) != r1) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object d(defpackage.bff r5, defpackage.n92 r6) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lz.d(bff, n92):java.lang.Object");
    }

    public /* synthetic */ lz(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
        this.g = obj6;
        this.h = obj7;
    }
}
