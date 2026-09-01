package defpackage;

import com.medium.android.data.settings.NotificationNetwork;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pr3 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ pr3(Object obj, Object obj2, boolean z, int i) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.b = z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean z;
        boolean z2;
        boolean z3;
        int i = this.a;
        final int i2 = 2;
        final int i3 = 3;
        uob uobVar = w12.a;
        boolean z4 = this.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.d;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                final fq3 fq3Var = (fq3) obj5;
                final l78 l78Var = (l78) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.edit_story_preview), false, null, null, 30);
                    boolean zF = p65Var.f(fq3Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        final int i4 = 0;
                        objM = new m45() { // from class: qr3
                            @Override // defpackage.m45
                            public final Object invoke() {
                                int i5 = i4;
                                c1e c1eVar2 = c1e.a;
                                l78 l78Var2 = l78Var;
                                fq3 fq3Var2 = fq3Var;
                                switch (i5) {
                                    case 0:
                                        r40.k(l78Var2, false);
                                        fq3Var2.a();
                                        break;
                                    case 1:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment = fq3Var2.a;
                                        upc upcVar = fq3Var2.b;
                                        int i6 = EditPostFragment.Q0;
                                        editPostFragment.m1((String) upcVar.getValue(), "TOPICS_DESTINATION");
                                        break;
                                    case 2:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment2 = fq3Var2.a;
                                        upc upcVar2 = fq3Var2.b;
                                        int i7 = EditPostFragment.Q0;
                                        editPostFragment2.m1((String) upcVar2.getValue(), "PUBLICATION_DESTINATION");
                                        break;
                                    default:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment3 = fq3Var2.a;
                                        upc upcVar3 = fq3Var2.b;
                                        int i8 = EditPostFragment.Q0;
                                        editPostFragment3.m1((String) upcVar3.getValue(), "METER_DESTINATION");
                                        break;
                                }
                                return c1eVar2;
                            }
                        };
                        p65Var.j0(objM);
                    }
                    aq7.b(bq7Var, (m45) objM, null, 0L, 0L, p65Var, 0, 28);
                    bq7 bq7Var2 = new bq7(vo7.R(p65Var, R.string.edit_story_topics), false, null, null, 30);
                    boolean zF2 = p65Var.f(fq3Var);
                    Object objM2 = p65Var.M();
                    if (zF2 || objM2 == uobVar) {
                        final int i5 = 1;
                        objM2 = new m45() { // from class: qr3
                            @Override // defpackage.m45
                            public final Object invoke() {
                                int i52 = i5;
                                c1e c1eVar2 = c1e.a;
                                l78 l78Var2 = l78Var;
                                fq3 fq3Var2 = fq3Var;
                                switch (i52) {
                                    case 0:
                                        r40.k(l78Var2, false);
                                        fq3Var2.a();
                                        break;
                                    case 1:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment = fq3Var2.a;
                                        upc upcVar = fq3Var2.b;
                                        int i6 = EditPostFragment.Q0;
                                        editPostFragment.m1((String) upcVar.getValue(), "TOPICS_DESTINATION");
                                        break;
                                    case 2:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment2 = fq3Var2.a;
                                        upc upcVar2 = fq3Var2.b;
                                        int i7 = EditPostFragment.Q0;
                                        editPostFragment2.m1((String) upcVar2.getValue(), "PUBLICATION_DESTINATION");
                                        break;
                                    default:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment3 = fq3Var2.a;
                                        upc upcVar3 = fq3Var2.b;
                                        int i8 = EditPostFragment.Q0;
                                        editPostFragment3.m1((String) upcVar3.getValue(), "METER_DESTINATION");
                                        break;
                                }
                                return c1eVar2;
                            }
                        };
                        p65Var.j0(objM2);
                    }
                    aq7.b(bq7Var2, (m45) objM2, null, 0L, 0L, p65Var, 0, 28);
                    bq7 bq7Var3 = new bq7(vo7.R(p65Var, R.string.edit_story_publication), false, null, null, 30);
                    boolean zF3 = p65Var.f(fq3Var);
                    Object objM3 = p65Var.M();
                    if (zF3 || objM3 == uobVar) {
                        objM3 = new m45() { // from class: qr3
                            @Override // defpackage.m45
                            public final Object invoke() {
                                int i52 = i2;
                                c1e c1eVar2 = c1e.a;
                                l78 l78Var2 = l78Var;
                                fq3 fq3Var2 = fq3Var;
                                switch (i52) {
                                    case 0:
                                        r40.k(l78Var2, false);
                                        fq3Var2.a();
                                        break;
                                    case 1:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment = fq3Var2.a;
                                        upc upcVar = fq3Var2.b;
                                        int i6 = EditPostFragment.Q0;
                                        editPostFragment.m1((String) upcVar.getValue(), "TOPICS_DESTINATION");
                                        break;
                                    case 2:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment2 = fq3Var2.a;
                                        upc upcVar2 = fq3Var2.b;
                                        int i7 = EditPostFragment.Q0;
                                        editPostFragment2.m1((String) upcVar2.getValue(), "PUBLICATION_DESTINATION");
                                        break;
                                    default:
                                        r40.k(l78Var2, false);
                                        EditPostFragment editPostFragment3 = fq3Var2.a;
                                        upc upcVar3 = fq3Var2.b;
                                        int i8 = EditPostFragment.Q0;
                                        editPostFragment3.m1((String) upcVar3.getValue(), "METER_DESTINATION");
                                        break;
                                }
                                return c1eVar2;
                            }
                        };
                        p65Var.j0(objM3);
                    }
                    aq7.b(bq7Var3, (m45) objM3, null, 0L, 0L, p65Var, 0, 28);
                    if (z4) {
                        p65Var.Y(1936351883);
                        bq7 bq7Var4 = new bq7(vo7.R(p65Var, R.string.edit_members_only_settings), false, null, null, 30);
                        boolean zF4 = p65Var.f(fq3Var);
                        Object objM4 = p65Var.M();
                        if (zF4 || objM4 == uobVar) {
                            objM4 = new m45() { // from class: qr3
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i52 = i3;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var2 = l78Var;
                                    fq3 fq3Var2 = fq3Var;
                                    switch (i52) {
                                        case 0:
                                            r40.k(l78Var2, false);
                                            fq3Var2.a();
                                            break;
                                        case 1:
                                            r40.k(l78Var2, false);
                                            EditPostFragment editPostFragment = fq3Var2.a;
                                            upc upcVar = fq3Var2.b;
                                            int i6 = EditPostFragment.Q0;
                                            editPostFragment.m1((String) upcVar.getValue(), "TOPICS_DESTINATION");
                                            break;
                                        case 2:
                                            r40.k(l78Var2, false);
                                            EditPostFragment editPostFragment2 = fq3Var2.a;
                                            upc upcVar2 = fq3Var2.b;
                                            int i7 = EditPostFragment.Q0;
                                            editPostFragment2.m1((String) upcVar2.getValue(), "PUBLICATION_DESTINATION");
                                            break;
                                        default:
                                            r40.k(l78Var2, false);
                                            EditPostFragment editPostFragment3 = fq3Var2.a;
                                            upc upcVar3 = fq3Var2.b;
                                            int i8 = EditPostFragment.Q0;
                                            editPostFragment3.m1((String) upcVar3.getValue(), "METER_DESTINATION");
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM4);
                        }
                        aq7.b(bq7Var4, (m45) objM4, null, 0L, 0L, p65Var, 0, 28);
                        z = false;
                    } else {
                        z = false;
                        p65Var.Y(1931807965);
                    }
                    p65Var.p(z);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                m68 m68Var = (m68) obj5;
                qfc qfcVar = (qfc) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((bgc) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    ufc.a.a(m68Var, bgf.N(w2g.G(o28.b, 0.0f, zr7.b, 0.0f, 0.0f, 13), "thumb"), qfcVar, this.b, zr7.a, p65Var2, 221238, 0);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                tw8 tw8Var = (tw8) obj5;
                upc upcVar = (upc) obj4;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    mkd mkdVarA = mkd.a(dl7.m((mkd) tw8Var.getTextStyle().invoke(p65Var3, 0)), ((uu1) upcVar.getValue()).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    r28 r28VarB = xz5.B(jfc.f(o28.b, ((m73) p65Var3.j(z22.h)).z(mkdVarA.b.c), 0.0f, 2));
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var3.T;
                    int i6 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var3.l();
                    r28 r28VarR = gx1.R(p65Var3, r28VarB);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, zk7VarC);
                    tp7.B(p65Var3, q12.e, i89VarL);
                    tp7.B(p65Var3, q12.g, Integer.valueOf(i6));
                    tp7.y(p65Var3, q12.h);
                    tp7.B(p65Var3, q12.d, r28VarR);
                    jjd.b(vo7.R(p65Var3, z4 ? R.string.common_following : R.string.common_follow), null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var3, 0, 24960, 110590);
                    p65Var3.p(true);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                final pj8 pj8Var = (pj8) obj5;
                final x45 x45Var = (x45) obj4;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    boolean z5 = pj8Var instanceof nj8;
                    boolean z6 = this.b;
                    if (z5) {
                        p65Var4.Y(-477414449);
                        nj8 nj8Var = (nj8) pj8Var;
                        boolean z7 = !z6;
                        boolean zF5 = p65Var4.f(x45Var) | p65Var4.f(pj8Var);
                        Object objM5 = p65Var4.M();
                        if (zF5 || objM5 == uobVar) {
                            z2 = false;
                            final Object[] objArr = null == true ? 1 : 0;
                            objM5 = new x45() { // from class: bqa
                                @Override // defpackage.x45
                                public final Object invoke(Object obj6) {
                                    int i7 = objArr;
                                    c1e c1eVar2 = c1e.a;
                                    pj8 pj8Var2 = pj8Var;
                                    x45 x45Var2 = x45Var;
                                    switch (i7) {
                                        case 0:
                                            boolean zBooleanValue = ((Boolean) obj6).booleanValue();
                                            nj8 nj8Var2 = (nj8) pj8Var2;
                                            x45Var2.invoke(new nj8(nj8Var2.b, nj8Var2.a, zBooleanValue));
                                            break;
                                        default:
                                            NotificationNetwork notificationNetwork = (NotificationNetwork) obj6;
                                            notificationNetwork.getClass();
                                            oj8 oj8Var = (oj8) pj8Var2;
                                            x45Var2.invoke(new oj8(oj8Var.a, oj8Var.b, notificationNetwork));
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var4.j0(objM5);
                        } else {
                            z2 = false;
                        }
                        qb8.b(nj8Var, z7, (x45) objM5, null, p65Var4, 0);
                        p65Var4.p(z2);
                    } else {
                        if (!(pj8Var instanceof oj8)) {
                            throw ho2.L(p65Var4, -477417382, false);
                        }
                        p65Var4.Y(-477400943);
                        oj8 oj8Var = (oj8) pj8Var;
                        boolean zF6 = p65Var4.f(x45Var) | p65Var4.f(pj8Var);
                        Object objM6 = p65Var4.M();
                        if (zF6 || objM6 == uobVar) {
                            final int i7 = 1;
                            objM6 = new x45() { // from class: bqa
                                @Override // defpackage.x45
                                public final Object invoke(Object obj6) {
                                    int i72 = i7;
                                    c1e c1eVar2 = c1e.a;
                                    pj8 pj8Var2 = pj8Var;
                                    x45 x45Var2 = x45Var;
                                    switch (i72) {
                                        case 0:
                                            boolean zBooleanValue = ((Boolean) obj6).booleanValue();
                                            nj8 nj8Var2 = (nj8) pj8Var2;
                                            x45Var2.invoke(new nj8(nj8Var2.b, nj8Var2.a, zBooleanValue));
                                            break;
                                        default:
                                            NotificationNetwork notificationNetwork = (NotificationNetwork) obj6;
                                            notificationNetwork.getClass();
                                            oj8 oj8Var2 = (oj8) pj8Var2;
                                            x45Var2.invoke(new oj8(oj8Var2.a, oj8Var2.b, notificationNetwork));
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var4.j0(objM6);
                        }
                        qb8.e(oj8Var, z6, (x45) objM6, null, p65Var4, 0);
                        p65Var4.p(false);
                    }
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                q1d q1dVar = (q1d) obj5;
                String str = (String) obj4;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    p65Var5.S();
                    return c1eVar;
                }
                jp7 jp7Var = (jp7) p65Var5.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.h, false);
                long j2 = p65Var5.T;
                int i8 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var5.l();
                r28 r28VarR2 = gx1.R(p65Var5, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var5.c0();
                if (p65Var5.S) {
                    p65Var5.k(ot2Var2);
                } else {
                    p65Var5.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var5, cuVar, zk7VarC2);
                cu cuVar2 = q12.e;
                tp7.B(p65Var5, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i8);
                cu cuVar3 = q12.g;
                tp7.B(p65Var5, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var5, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var5, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC3 = dy0.c(z46.d, false);
                long j3 = p65Var5.T;
                int i9 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var5.l();
                r28 r28VarR3 = gx1.R(p65Var5, r28VarD);
                p65Var5.c0();
                if (p65Var5.S) {
                    p65Var5.k(ot2Var2);
                } else {
                    p65Var5.m0();
                }
                tp7.B(p65Var5, cuVar, zk7VarC3);
                tp7.B(p65Var5, cuVar2, i89VarL3);
                ka1.z(i9, p65Var5, cuVar3, p65Var5, fnVar);
                tp7.B(p65Var5, cuVar4, r28VarR3);
                r28 r28VarD2 = jfc.d(o28Var, 1.0f);
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var5, 0);
                long j4 = p65Var5.T;
                int i10 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL4 = p65Var5.l();
                r28 r28VarR4 = gx1.R(p65Var5, r28VarD2);
                p65Var5.c0();
                if (p65Var5.S) {
                    p65Var5.k(ot2Var2);
                } else {
                    p65Var5.m0();
                }
                tp7.B(p65Var5, cuVar, wv1VarA);
                tp7.B(p65Var5, cuVar2, i89VarL4);
                ka1.z(i10, p65Var5, cuVar3, p65Var5, fnVar);
                tp7.B(p65Var5, cuVar4, r28VarR4);
                String strR = vo7.R(p65Var5, R.string.refine_recommendations_see_more_suggestions);
                boolean zF7 = p65Var5.f(q1dVar) | p65Var5.f(str);
                Object objM7 = p65Var5.M();
                if (zF7 || objM7 == uobVar) {
                    objM7 = new o1d(q1dVar, str, 0);
                    p65Var5.j0(objM7);
                }
                qb8.t(strR, (m45) objM7, bgf.N(o28Var, "see_more_tags_suggestions"), p65Var5, 384);
                hp7.t(p65Var5, jfc.l(o28Var, 16.0f));
                if (z4) {
                    p65Var5.Y(-1884138655);
                    tp7.c(0.0f, 0, 7, 0L, p65Var5, null);
                    z3 = false;
                } else {
                    z3 = false;
                    p65Var5.Y(-1908322375);
                }
                p65Var5.p(z3);
                b09.H(p65Var5, true, true, true);
                return c1eVar;
            default:
                String str2 = (String) obj5;
                x45 x45Var2 = (x45) obj4;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 17) != 16)) {
                    lk7.c(0, p65Var6, x45Var2, null, str2, this.b);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ pr3(Object obj, boolean z, Object obj2, int i) {
        this.a = i;
        this.c = obj;
        this.b = z;
        this.d = obj2;
    }
}
