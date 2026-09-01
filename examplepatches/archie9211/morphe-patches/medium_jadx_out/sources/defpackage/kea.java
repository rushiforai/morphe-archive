package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.graphql.type.ResponseSortType;
import com.medium.android.postpublishing.ui.TopicData;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kea implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ kea(List list, Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = list;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        p65 p65Var;
        boolean z;
        boolean z2;
        p65 p65Var2;
        boolean z3;
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj5 = this.e;
        List list = this.b;
        Object obj6 = this.c;
        Object obj7 = this.d;
        switch (i) {
            case 0:
                xr6 xr6Var = (xr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                rea reaVar = (rea) obj6;
                int i2 = (iIntValue2 & 6) == 0 ? iIntValue2 | (((p65) x12Var).f(xr6Var) ? 4 : 2) : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i2 |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var;
                if (!p65Var3.P(i2 & 1, (i2 & 147) != 146)) {
                    p65Var3.S();
                } else {
                    TopicData topicData = (TopicData) list.get(iIntValue);
                    p65Var3.Y(1351258524);
                    jp7 jp7Var = (jp7) p65Var3.j(kt7.a);
                    o28 o28Var = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var3.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var3.l();
                    r28 r28VarR = gx1.R(p65Var3, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var3, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var3, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var3, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var3, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var3, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var3.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var3.l();
                    r28 r28VarR2 = gx1.R(p65Var3, r28VarD);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar, zk7VarC2);
                    tp7.B(p65Var3, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var3, cuVar3, p65Var3, fnVar);
                    tp7.B(p65Var3, cuVar4, r28VarR2);
                    d46.r(topicData, reaVar.a.contains(topicData), iIntValue == reaVar.c.size() - 1, (jea) obj7, (eb8) obj5, p65Var3, 0);
                    b09.H(p65Var3, true, true, false);
                }
                break;
            case 1:
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                rea reaVar2 = (rea) obj6;
                int i5 = (iIntValue4 & 6) == 0 ? iIntValue4 | (((p65) x12Var2).f(xr6Var2) ? 4 : 2) : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i5 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var2;
                if (!p65Var4.P(i5 & 1, (i5 & 147) != 146)) {
                    p65Var4.S();
                } else {
                    TopicData topicData2 = (TopicData) list.get(iIntValue3);
                    p65Var4.Y(1116587378);
                    jp7 jp7Var2 = (jp7) p65Var4.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j3 = p65Var4.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var4.l();
                    r28 r28VarR3 = gx1.R(p65Var4, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var2);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var4, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var4, cuVar6, i89VarL3);
                    Integer numValueOf2 = Integer.valueOf(i6);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var4, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var4, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var4, cuVar8, r28VarR3);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j4 = p65Var4.T;
                    int i7 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var4.l();
                    r28 r28VarR4 = gx1.R(p65Var4, r28VarD2);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var2);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar5, zk7VarC4);
                    tp7.B(p65Var4, cuVar6, i89VarL4);
                    ka1.z(i7, p65Var4, cuVar7, p65Var4, fnVar2);
                    tp7.B(p65Var4, cuVar8, r28VarR4);
                    d46.r(topicData2, reaVar2.a.contains(topicData2), iIntValue3 == reaVar2.b.size() - 1, (jea) obj7, (eb8) obj5, p65Var4, 0);
                    b09.H(p65Var4, true, true, false);
                }
                break;
            default:
                xr6 xr6Var3 = (xr6) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                x12 x12Var3 = (x12) obj3;
                int iIntValue6 = ((Number) obj4).intValue();
                yq0 yq0Var = z46.p;
                rz5 rz5Var = qb8.c;
                zhb zhbVar = (zhb) obj7;
                lgb lgbVar = (lgb) obj6;
                int i8 = (iIntValue6 & 6) == 0 ? iIntValue6 | (((p65) x12Var3).f(xr6Var3) ? 4 : 2) : iIntValue6;
                if ((iIntValue6 & 48) == 0) {
                    i8 |= ((p65) x12Var3).d(iIntValue5) ? 32 : 16;
                }
                p65 p65Var5 = (p65) x12Var3;
                if (!p65Var5.P(i8 & 1, (i8 & 147) != 146)) {
                    p65Var5.S();
                } else {
                    qzd qzdVar = (qzd) ((ArrayList) list).get(iIntValue5);
                    p65Var5.Y(-1301168667);
                    jp7 jp7Var3 = (jp7) p65Var5.j(kt7.a);
                    o28 o28Var3 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var3, o28Var3, 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j5 = p65Var5.T;
                    int i9 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var5.l();
                    r28 r28VarR5 = gx1.R(p65Var5, r28VarJ3);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var3);
                    } else {
                        p65Var5.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var5, cuVar9, zk7VarC5);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var5, cuVar10, i89VarL5);
                    Integer numValueOf3 = Integer.valueOf(i9);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var5, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var5, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var5, cuVar12, r28VarR5);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j6 = p65Var5.T;
                    int i10 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var5.l();
                    r28 r28VarR6 = gx1.R(p65Var5, r28VarD3);
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var3);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, cuVar9, zk7VarC6);
                    tp7.B(p65Var5, cuVar10, i89VarL6);
                    ka1.z(i10, p65Var5, cuVar11, p65Var5, fnVar3);
                    tp7.B(p65Var5, cuVar12, r28VarR6);
                    boolean z4 = qzdVar instanceof sfb;
                    uob uobVar = w12.a;
                    if (!z4) {
                        p65Var = p65Var5;
                        if (qzdVar instanceof yvb) {
                            p65Var.Y(-1396314519);
                            yvb yvbVar = (yvb) qzdVar;
                            boolean zF = p65Var.f(lgbVar);
                            Object objM = p65Var.M();
                            if (zF || objM == uobVar) {
                                z = false;
                                objM = new ggb(lgbVar, 0);
                                p65Var.j0(objM);
                            } else {
                                z = false;
                            }
                            ur7.t(yvbVar, (b55) objM, null, p65Var, z ? 1 : 0);
                            p65Var.p(z);
                        } else if (qzdVar instanceof k57) {
                            p65Var.Y(-335617893);
                            k57 k57Var = (k57) qzdVar;
                            if (k57Var.b == 0) {
                                p65Var.Y(-335561938);
                                tp7.c(0.0f, 6, 6, 0L, p65Var, jfc.d(o28Var3, 1.0f));
                                z = false;
                            } else {
                                z = false;
                                p65Var.Y(-378305296);
                            }
                            p65Var.p(z);
                            k50.H(k57Var, null, p65Var, z ? 1 : 0);
                            p65Var.p(z);
                        } else if (qzdVar instanceof j57) {
                            p65Var.Y(-335170408);
                            j57 j57Var = (j57) qzdVar;
                            p65Var.Y(-335130418);
                            tp7.c(0.0f, 6, 6, 0L, p65Var, jfc.d(o28Var3, 1.0f));
                            p65Var.p(false);
                            boolean zF2 = p65Var.f(lgbVar);
                            Object objM2 = p65Var.M();
                            if (zF2 || objM2 == uobVar) {
                                objM2 = new uta(0, lgbVar, lgb.class, "loadMore", "loadMore()V", 0, 25);
                                p65Var.j0(objM2);
                            }
                            m45 m45Var = (m45) ((qh6) objM2);
                            boolean zF3 = p65Var.f(lgbVar);
                            Object objM3 = p65Var.M();
                            if (zF3 || objM3 == uobVar) {
                                objM3 = new ggb(lgbVar, 1);
                                p65Var.j0(objM3);
                            }
                            t40.m(j57Var, m45Var, (b55) objM3, null, p65Var, 0);
                            z = false;
                            p65Var.p(false);
                        } else if (!(qzdVar instanceof pfb)) {
                            if (qzdVar instanceof il5) {
                                p65Var.Y(-1396238835);
                                r28 r28VarD4 = jfc.d(o28Var3, 1.0f);
                                wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
                                long j7 = p65Var.T;
                                int i11 = (int) (j7 ^ (j7 >>> 32));
                                i89 i89VarL7 = p65Var.l();
                                r28 r28VarR7 = gx1.R(p65Var, r28VarD4);
                                p65Var.c0();
                                if (p65Var.S) {
                                    p65Var.k(ot2Var3);
                                } else {
                                    p65Var.m0();
                                }
                                tp7.B(p65Var, cuVar9, wv1VarA);
                                tp7.B(p65Var, cuVar10, i89VarL7);
                                ka1.z(i11, p65Var, cuVar11, p65Var, fnVar3);
                                tp7.B(p65Var, cuVar12, r28VarR7);
                                z = false;
                                gx1.v((il5) qzdVar, null, p65Var, 0);
                                tp7.c(0.0f, 6, 6, 0L, p65Var, jfc.d(o28Var3, 1.0f));
                                z2 = true;
                                p65Var.p(true);
                            } else {
                                z = false;
                                z2 = true;
                                p65Var.Y(-378305296);
                            }
                            p65Var.p(z);
                            b09.H(p65Var, z2, z2, z);
                        } else {
                            p65Var.Y(-334247817);
                            pfb pfbVar = (pfb) qzdVar;
                            List list2 = pfbVar.a;
                            ResponseSortType responseSortType = pfbVar.b;
                            boolean zF4 = p65Var.f(lgbVar);
                            Object objM4 = p65Var.M();
                            if (zF4 || objM4 == uobVar) {
                                objM4 = new hgb(1, lgbVar, lgb.class, "sort", "sort(Lcom/medium/android/graphql/type/ResponseSortType;)V", 0, 0);
                                p65Var.j0(objM4);
                            }
                            kp7.c(list2, responseSortType, (x45) ((qh6) objM4), jfc.d(w2g.D(o28Var3, 24.0f, 8.0f), 1.0f), p65Var, 3072);
                            p65Var.p(false);
                            z = false;
                        }
                    } else {
                        p65Var5.Y(-1396402927);
                        r28 r28VarD5 = jfc.d(o28Var3, 1.0f);
                        wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var5, 0);
                        long j8 = p65Var5.T;
                        int i12 = (int) (j8 ^ (j8 >>> 32));
                        i89 i89VarL8 = p65Var5.l();
                        r28 r28VarR8 = gx1.R(p65Var5, r28VarD5);
                        p65Var5.c0();
                        if (p65Var5.S) {
                            p65Var5.k(ot2Var3);
                        } else {
                            p65Var5.m0();
                        }
                        tp7.B(p65Var5, cuVar9, wv1VarA2);
                        tp7.B(p65Var5, cuVar10, i89VarL8);
                        ka1.z(i12, p65Var5, cuVar11, p65Var5, fnVar3);
                        tp7.B(p65Var5, cuVar12, r28VarR8);
                        if (iIntValue5 <= 1 || ((sfb) qzdVar).k != 0) {
                            p65Var2 = p65Var5;
                            z3 = false;
                            p65Var2.Y(-1877253506);
                        } else {
                            p65Var5.Y(-1837738302);
                            tp7.c(0.0f, 6, 6, 0L, p65Var5, w2g.E(jfc.d(o28Var3, 1.0f), 24.0f, 0.0f, 2));
                            p65Var2 = p65Var5;
                            z3 = false;
                        }
                        p65Var2.p(z3);
                        sn3 sn3Var = kt7.b;
                        long j9 = ((zo7) p65Var2.j(sn3Var)).b;
                        long j10 = ((zo7) p65Var2.j(sn3Var)).l;
                        long jB = uu1.b(0.0f, ((zo7) p65Var2.j(sn3Var)).a);
                        bib bibVar = zhbVar.j;
                        String str = zhbVar.l;
                        boolean zF5 = p65Var2.f(bibVar.e) | p65Var2.f(str);
                        Object objM5 = p65Var2.M();
                        if (zF5 || objM5 == uobVar) {
                            String str2 = zhbVar.j.e;
                            String str3 = ((sfb) qzdVar).a;
                            if (!g76.L(str2, str3)) {
                                j9 = g76.L(str, str3) ? j10 : jB;
                            }
                            objM5 = qo7.u(new uu1(j9));
                            p65Var2.j0(objM5);
                        }
                        l78 l78Var = (l78) objM5;
                        p65 p65Var6 = p65Var2;
                        sfb sfbVar = (sfb) qzdVar;
                        ep7.j(sfbVar, zhbVar.f, zhbVar.h, (ngb) obj5, flb.a0(o28Var3, ((uu1) wec.a(((uu1) l78Var.getValue()).a, f76.Q(PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE, 0, zn3.a, 2), "Background color", p65Var6, 384, 8).getValue()).a, rv8.r), p65Var6, 0, 0);
                        p65Var = p65Var6;
                        boolean zF6 = p65Var.f(zhbVar) | p65Var.h(qzdVar) | p65Var.f(l78Var) | p65Var.e(jB);
                        Object objM6 = p65Var.M();
                        if (zF6 || objM6 == uobVar) {
                            objM6 = new m0((zhb) obj7, sfbVar, jB, l78Var, (n92) null);
                            p65Var.j0(objM6);
                        }
                        kyd.k(p65Var, (b55) objM6, str);
                        p65Var.p(true);
                        z = false;
                        p65Var.p(false);
                    }
                    z2 = true;
                    b09.H(p65Var, z2, z2, z);
                }
                break;
        }
        return c1eVar;
    }
}
