package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import com.medium.android.postpublishing.ui.publicationSelection.c;
import com.medium.android.unsplash.data.UnsplashPhoto;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o37 implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public o37(ArrayList arrayList, ek8 ek8Var, obe obeVar, vk8 vk8Var) {
        this.a = 2;
        this.b = arrayList;
        this.c = ek8Var;
        this.d = obeVar;
    }

    private final Object a(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        o28 o28Var;
        float f;
        ot2 ot2Var;
        boolean z;
        cu cuVar;
        xr6 xr6Var = (xr6) obj;
        int iIntValue = ((Number) obj2).intValue();
        x12 x12Var = (x12) obj3;
        int iIntValue2 = ((Number) obj4).intValue();
        ar0 ar0Var = z46.d;
        ar0 ar0Var2 = z46.h;
        if ((iIntValue2 & 6) == 0) {
            i = (((p65) x12Var).f(xr6Var) ? 4 : 2) | iIntValue2;
        } else {
            i = iIntValue2;
        }
        if ((iIntValue2 & 48) == 0) {
            i |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(i & 1, (i & 147) != 146)) {
            bae baeVar = (bae) ((List) this.b).get(iIntValue);
            p65Var.Y(1659491505);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var2);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar2 = q12.f;
            tp7.B(p65Var, cuVar2, wv1VarA);
            cu cuVar3 = q12.e;
            tp7.B(p65Var, cuVar3, i89VarL);
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar4 = q12.g;
            tp7.B(p65Var, cuVar4, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar5 = q12.d;
            tp7.B(p65Var, cuVar5, r28VarR);
            if (iIntValue > 0) {
                p65Var.Y(1865267599);
                r28 r28VarJ = ka1.j((jp7) p65Var.j(kt7.a), o28Var2, 3, 1.0f);
                zk7 zk7VarC = dy0.c(ar0Var2, false);
                long j2 = p65Var.T;
                int i3 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar2, zk7VarC);
                tp7.B(p65Var, cuVar3, i89VarL2);
                ka1.z(i3, p65Var, cuVar4, p65Var, fnVar);
                tp7.B(p65Var, cuVar5, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(ar0Var, false);
                o28Var = o28Var2;
                long j3 = p65Var.T;
                int i4 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar2, zk7VarC2);
                tp7.B(p65Var, cuVar3, i89VarL3);
                ka1.z(i4, p65Var, cuVar4, p65Var, fnVar);
                tp7.B(p65Var, cuVar5, r28VarR3);
                ot2Var = ot2Var2;
                cuVar = cuVar2;
                f = 1.0f;
                tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                p65Var = p65Var;
                z = false;
                b09.H(p65Var, true, true, false);
            } else {
                o28Var = o28Var2;
                f = 1.0f;
                ot2Var = ot2Var2;
                z = false;
                cuVar = cuVar2;
                p65Var.Y(1844517253);
                p65Var.p(false);
            }
            o28 o28Var3 = o28Var;
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(kt7.a), o28Var3, 3, f);
            zk7 zk7VarC3 = dy0.c(ar0Var2, z);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar3, i89VarL4);
            ka1.z(i5, p65Var, cuVar4, p65Var, fnVar);
            tp7.B(p65Var, cuVar5, r28VarR4);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var, false);
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar3, i89VarL5);
            ka1.z(i6, p65Var, cuVar4, p65Var, fnVar);
            tp7.B(p65Var, cuVar5, r28VarR5);
            er7.r(baeVar, (n8e) this.c, (sh9) this.d, bgf.N(o28Var3, "user_activity_" + baeVar.getId()), p65Var, 0);
            ho2.N(p65Var, true, true, true, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        ot2 ot2Var;
        cu cuVar;
        boolean z;
        cu cuVar2;
        p65 p65Var;
        o28 o28Var;
        xr6 xr6Var = (xr6) obj;
        int iIntValue = ((Number) obj2).intValue();
        x12 x12Var = (x12) obj3;
        int iIntValue2 = ((Number) obj4).intValue();
        ar0 ar0Var = z46.d;
        ar0 ar0Var2 = z46.h;
        if ((iIntValue2 & 6) == 0) {
            i = (((p65) x12Var).f(xr6Var) ? 4 : 2) | iIntValue2;
        } else {
            i = iIntValue2;
        }
        if ((iIntValue2 & 48) == 0) {
            i |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
        }
        p65 p65Var2 = (p65) x12Var;
        if (p65Var2.P(i & 1, (i & 147) != 146)) {
            j8b j8bVar = (j8b) ((List) this.b).get(iIntValue);
            p65Var2.Y(1063040795);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j = p65Var2.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var2, o28Var2);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            cu cuVar3 = q12.f;
            tp7.B(p65Var2, cuVar3, wv1VarA);
            cu cuVar4 = q12.e;
            tp7.B(p65Var2, cuVar4, i89VarL);
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar5 = q12.g;
            tp7.B(p65Var2, cuVar5, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar6 = q12.d;
            tp7.B(p65Var2, cuVar6, r28VarR);
            if (iIntValue > 0) {
                p65Var2.Y(725542487);
                r28 r28VarJ = ka1.j((jp7) p65Var2.j(kt7.a), o28Var2, 3, 1.0f);
                zk7 zk7VarC = dy0.c(ar0Var2, false);
                long j2 = p65Var2.T;
                int i3 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var2.l();
                r28 r28VarR2 = gx1.R(p65Var2, r28VarJ);
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var2);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, cuVar3, zk7VarC);
                tp7.B(p65Var2, cuVar4, i89VarL2);
                ka1.z(i3, p65Var2, cuVar5, p65Var2, fnVar);
                tp7.B(p65Var2, cuVar6, r28VarR2);
                ot2Var = ot2Var2;
                cuVar = cuVar3;
                r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(ar0Var, false);
                long j3 = p65Var2.T;
                int i4 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var2.l();
                r28 r28VarR3 = gx1.R(p65Var2, r28VarD);
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, cuVar, zk7VarC2);
                tp7.B(p65Var2, cuVar4, i89VarL3);
                ka1.z(i4, p65Var2, cuVar5, p65Var2, fnVar);
                tp7.B(p65Var2, cuVar6, r28VarR3);
                cuVar2 = cuVar5;
                o28Var = o28Var2;
                tp7.c(0.0f, 0, 7, 0L, p65Var2, null);
                p65Var = p65Var2;
                z = false;
                b09.H(p65Var, true, true, false);
            } else {
                ot2Var = ot2Var2;
                cuVar = cuVar3;
                z = false;
                cuVar2 = cuVar5;
                p65Var = p65Var2;
                o28Var = o28Var2;
                p65Var.Y(700692205);
                p65Var.p(false);
            }
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var2, z);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar4, i89VarL4);
            ka1.z(i5, p65Var, cuVar2, p65Var, fnVar);
            tp7.B(p65Var, cuVar6, r28VarR4);
            o28 o28Var3 = o28Var;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var, false);
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar4, i89VarL5);
            ka1.z(i6, p65Var, cuVar2, p65Var, fnVar);
            tp7.B(p65Var, cuVar6, r28VarR5);
            p65 p65Var3 = p65Var;
            lk7.o(j8bVar, (k8b) this.c, (sh9) this.d, ((zo7) p65Var.j(kt7.b)).o, bgf.N(o28Var3, "user_repost_" + j8bVar.a), p65Var3, 0, 0);
            ho2.N(p65Var3, true, true, true, false);
        } else {
            p65Var2.S();
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r13v19 */
    /* JADX WARN: Type inference failed for: r13v20, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r13v21 */
    /* JADX WARN: Type inference failed for: r13v22 */
    /* JADX WARN: Type inference failed for: r13v23, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r13v24 */
    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        ar0 ar0Var;
        ot2 ot2Var;
        boolean z;
        ?? r13;
        ?? r132;
        boolean z2;
        boolean z3;
        boolean z4;
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj5 = this.d;
        Object obj6 = this.c;
        Object obj7 = this.b;
        switch (i) {
            case 0:
                xr6 xr6Var = (xr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                int i2 = (iIntValue2 & 6) == 0 ? iIntValue2 | (((p65) x12Var).f(xr6Var) ? 4 : 2) : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i2 |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(i2 & 1, (i2 & 147) != 146)) {
                    p65Var.S();
                } else {
                    rg1 rg1Var = (rg1) ((List) obj7).get(iIntValue);
                    p65Var.Y(1861034651);
                    float fP = br7.p(p65Var, R.dimen.list_catalog_preview_horizontal_padding);
                    o28 o28Var2 = o28.b;
                    r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.E(o28Var2, fP, 0.0f, 2), 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarX);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, cuVar, zk7VarC2);
                    tp7.B(p65Var, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    g01.b(rg1Var, (ye1) obj6, null, (oe1) obj5, p65Var, 0, 4);
                    b09.H(p65Var, true, true, false);
                }
                break;
            case 1:
                xr6 xr6Var2 = (xr6) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                int i5 = (iIntValue4 & 6) == 0 ? iIntValue4 | (((p65) x12Var2).f(xr6Var2) ? 4 : 2) : iIntValue4;
                if ((iIntValue4 & 48) == 0) {
                    i5 |= ((p65) x12Var2).d(iIntValue3) ? 32 : 16;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(i5 & 1, (i5 & 147) != 146)) {
                    p65Var2.S();
                } else {
                    xj8 xj8Var = (xj8) ((List) obj7).get(iIntValue3);
                    p65Var2.Y(-1780783282);
                    sn3 sn3Var = kt7.a;
                    jp7 jp7Var = (jp7) p65Var2.j(sn3Var);
                    o28 o28Var3 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var3, 3, 1.0f);
                    ar0 ar0Var2 = z46.h;
                    zk7 zk7VarC3 = dy0.c(ar0Var2, false);
                    long j3 = p65Var2.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var3);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var2, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var2, cuVar6, i89VarL3);
                    Integer numValueOf2 = Integer.valueOf(i6);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var2, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var2, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var2, cuVar8, r28VarR3);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    ar0 ar0Var3 = z46.d;
                    zk7 zk7VarC4 = dy0.c(ar0Var3, false);
                    long j4 = p65Var2.T;
                    int i7 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var2.l();
                    r28 r28VarR4 = gx1.R(p65Var2, r28VarD2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var3);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC4);
                    tp7.B(p65Var2, cuVar6, i89VarL4);
                    ka1.z(i7, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR4);
                    if (iIntValue3 > 0) {
                        p65Var2.Y(189915169);
                        ar0Var = ar0Var3;
                        ot2Var = ot2Var3;
                        tp7.c(0.0f, 6, 6, 0L, p65Var2, jfc.d(o28Var3, 1.0f));
                        z = false;
                    } else {
                        ar0Var = ar0Var3;
                        ot2Var = ot2Var3;
                        z = false;
                        p65Var2.Y(179054567);
                    }
                    p65Var2.p(z);
                    p65Var2.p(true);
                    p65Var2.p(true);
                    r28 r28VarJ2 = ka1.j((jp7) p65Var2.j(sn3Var), o28Var3, 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(ar0Var2, z);
                    long j5 = p65Var2.T;
                    int i8 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var2.l();
                    r28 r28VarR5 = gx1.R(p65Var2, r28VarJ2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC5);
                    tp7.B(p65Var2, cuVar6, i89VarL5);
                    ka1.z(i8, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR5);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(ar0Var, false);
                    long j6 = p65Var2.T;
                    int i9 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var2.l();
                    r28 r28VarR6 = gx1.R(p65Var2, r28VarD3);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC6);
                    tp7.B(p65Var2, cuVar6, i89VarL6);
                    ka1.z(i9, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR6);
                    cj8.a(xj8Var.b, (ek8) obj6, (obe) obj5, p65Var2, 0);
                    b09.H(p65Var2, true, true, false);
                }
                break;
            case 2:
                xr6 xr6Var3 = (xr6) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                x12 x12Var3 = (x12) obj3;
                int iIntValue6 = ((Number) obj4).intValue();
                int i10 = (iIntValue6 & 6) == 0 ? iIntValue6 | (((p65) x12Var3).f(xr6Var3) ? 4 : 2) : iIntValue6;
                if ((iIntValue6 & 48) == 0) {
                    i10 |= ((p65) x12Var3).d(iIntValue5) ? 32 : 16;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(i10 & 1, (i10 & 147) != 146)) {
                    p65Var3.S();
                } else {
                    qzd qzdVar = (qzd) ((ArrayList) obj7).get(iIntValue5);
                    p65Var3.Y(1361038214);
                    jp7 jp7Var2 = (jp7) p65Var3.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var2, o28Var4, 3, 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.h, false);
                    long j7 = p65Var3.T;
                    int i11 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var3.l();
                    r28 r28VarR7 = gx1.R(p65Var3, r28VarJ3);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var4);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var3, cuVar9, zk7VarC7);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var3, cuVar10, i89VarL7);
                    Integer numValueOf3 = Integer.valueOf(i11);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var3, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var3, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var3, cuVar12, r28VarR7);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.d, false);
                    long j8 = p65Var3.T;
                    int i12 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var3.l();
                    r28 r28VarR8 = gx1.R(p65Var3, r28VarD4);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var4);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar9, zk7VarC8);
                    tp7.B(p65Var3, cuVar10, i89VarL8);
                    ka1.z(i12, p65Var3, cuVar11, p65Var3, fnVar3);
                    tp7.B(p65Var3, cuVar12, r28VarR8);
                    if (iIntValue5 > 0) {
                        p65Var3.Y(-1154702115);
                        tp7.c(0.0f, 6, 6, 0L, p65Var3, jfc.d(o28Var4, 1.0f));
                        r13 = 0;
                    } else {
                        r13 = 0;
                        p65Var3.Y(-1167940169);
                    }
                    p65Var3.p(r13);
                    if (qzdVar instanceof xj8) {
                        p65Var3.Y(378402387);
                        cj8.a(((xj8) qzdVar).b, (ek8) obj6, (obe) obj5, p65Var3, r13);
                        p65Var3.p(r13);
                    } else {
                        p65Var3.Y(378417103);
                        p65Var3.p(r13);
                    }
                    b09.H(p65Var3, true, true, r13);
                }
                break;
            case 3:
                xr6 xr6Var4 = (xr6) obj;
                int iIntValue7 = ((Number) obj2).intValue();
                x12 x12Var4 = (x12) obj3;
                int iIntValue8 = ((Number) obj4).intValue();
                int i13 = (iIntValue8 & 6) == 0 ? iIntValue8 | (((p65) x12Var4).f(xr6Var4) ? 4 : 2) : iIntValue8;
                if ((iIntValue8 & 48) == 0) {
                    i13 |= ((p65) x12Var4).d(iIntValue7) ? 32 : 16;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(i13 & 1, (i13 & 147) != 146)) {
                    p65Var4.S();
                } else {
                    pe9 pe9Var = (pe9) ((List) obj7).get(iIntValue7);
                    p65Var4.Y(1878112499);
                    if (iIntValue7 == 0) {
                        p65Var4.Y(1878120806);
                        hp7.t(p65Var4, jfc.p(o28Var, 24.0f));
                        r132 = 0;
                    } else {
                        r132 = 0;
                        p65Var4.Y(1875089006);
                    }
                    p65Var4.p(r132);
                    ek7.l(pe9Var, (cv9) obj6, p65Var4, r132);
                    hp7.t(p65Var4, jfc.p(o28Var, iIntValue7 != ((List) obj5).size() + (-1) ? 16.0f : 24.0f));
                    p65Var4.p(r132);
                }
                break;
            case 4:
                xr6 xr6Var5 = (xr6) obj;
                int iIntValue9 = ((Number) obj2).intValue();
                x12 x12Var5 = (x12) obj3;
                int iIntValue10 = ((Number) obj4).intValue();
                int i14 = (iIntValue10 & 6) == 0 ? iIntValue10 | (((p65) x12Var5).f(xr6Var5) ? 4 : 2) : iIntValue10;
                if ((iIntValue10 & 48) == 0) {
                    i14 |= ((p65) x12Var5).d(iIntValue9) ? 32 : 16;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(i14 & 1, (i14 & 147) != 146)) {
                    p65Var5.S();
                } else {
                    dr9 dr9Var = (dr9) ((List) obj7).get(iIntValue9);
                    p65Var5.Y(1766545388);
                    jp7 jp7Var3 = (jp7) p65Var5.j(kt7.a);
                    o28 o28Var5 = o28.b;
                    r28 r28VarJ4 = ka1.j(jp7Var3, o28Var5, 3, 1.0f);
                    zk7 zk7VarC9 = dy0.c(z46.h, false);
                    long j9 = p65Var5.T;
                    int i15 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL9 = p65Var5.l();
                    r28 r28VarR9 = gx1.R(p65Var5, r28VarJ4);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var5);
                    } else {
                        p65Var5.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var5, cuVar13, zk7VarC9);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var5, cuVar14, i89VarL9);
                    Integer numValueOf4 = Integer.valueOf(i15);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var5, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var5, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var5, cuVar16, r28VarR9);
                    r28 r28VarD5 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC10 = dy0.c(z46.d, false);
                    long j10 = p65Var5.T;
                    int i16 = (int) (j10 ^ (j10 >>> 32));
                    i89 i89VarL10 = p65Var5.l();
                    r28 r28VarR10 = gx1.R(p65Var5, r28VarD5);
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var5);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, cuVar13, zk7VarC10);
                    tp7.B(p65Var5, cuVar14, i89VarL10);
                    ka1.z(i16, p65Var5, cuVar15, p65Var5, fnVar4);
                    tp7.B(p65Var5, cuVar16, r28VarR10);
                    il7.k(dr9Var, (stc) obj6, (md3) obj5, null, null, p65Var5, 0, 24);
                    tp7.c(0.0f, 0, 4, ((zo7) p65Var5.j(kt7.b)).x, p65Var5, jfc.d(w2g.G(iy0.a.a(o28Var5, z46.k), 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f));
                    b09.H(p65Var5, true, true, false);
                }
                break;
            case 5:
                long j11 = ((uu1) obj).a;
                long j12 = ((uu1) obj2).a;
                x12 x12Var6 = (x12) obj3;
                int iIntValue11 = ((Number) obj4).intValue();
                int i17 = (iIntValue11 & 6) == 0 ? iIntValue11 | (((p65) x12Var6).e(j11) ? 4 : 2) : iIntValue11;
                if ((iIntValue11 & 48) == 0) {
                    i17 |= ((p65) x12Var6).e(j12) ? 32 : 16;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(i17 & 1, (i17 & 147) != 146)) {
                    p65Var6.S();
                } else {
                    kk7.k((tla) obj7, j11, j12, (v08) obj6, (r28) obj5, p65Var6, (i17 << 3) & PhotoshopDirectory.TAG_CAPTION);
                }
                break;
            case 6:
                xr6 xr6Var6 = (xr6) obj;
                int iIntValue12 = ((Number) obj2).intValue();
                x12 x12Var7 = (x12) obj3;
                int iIntValue13 = ((Number) obj4).intValue();
                int i18 = (iIntValue13 & 6) == 0 ? iIntValue13 | (((p65) x12Var7).f(xr6Var6) ? 4 : 2) : iIntValue13;
                if ((iIntValue13 & 48) == 0) {
                    i18 |= ((p65) x12Var7).d(iIntValue12) ? 32 : 16;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(i18 & 1, (i18 & 147) != 146)) {
                    p65Var7.S();
                } else {
                    dr9 dr9Var2 = (dr9) ((az5) obj7).get(iIntValue12);
                    p65Var7.Y(-472851178);
                    o28 o28Var6 = o28.b;
                    r28 r28VarD6 = jfc.d(jfc.r(o28Var6, 3), 1.0f);
                    zk7 zk7VarC11 = dy0.c(z46.h, false);
                    long j13 = p65Var7.T;
                    int i19 = (int) (j13 ^ (j13 >>> 32));
                    i89 i89VarL11 = p65Var7.l();
                    r28 r28VarR11 = gx1.R(p65Var7, r28VarD6);
                    r12.W.getClass();
                    ot2 ot2Var6 = q12.b;
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var6);
                    } else {
                        p65Var7.m0();
                    }
                    cu cuVar17 = q12.f;
                    tp7.B(p65Var7, cuVar17, zk7VarC11);
                    cu cuVar18 = q12.e;
                    tp7.B(p65Var7, cuVar18, i89VarL11);
                    Integer numValueOf5 = Integer.valueOf(i19);
                    cu cuVar19 = q12.g;
                    tp7.B(p65Var7, cuVar19, numValueOf5);
                    fn fnVar5 = q12.h;
                    tp7.y(p65Var7, fnVar5);
                    cu cuVar20 = q12.d;
                    tp7.B(p65Var7, cuVar20, r28VarR11);
                    r28 r28VarD7 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC12 = dy0.c(z46.d, false);
                    long j14 = p65Var7.T;
                    int i20 = (int) (j14 ^ (j14 >>> 32));
                    i89 i89VarL12 = p65Var7.l();
                    r28 r28VarR12 = gx1.R(p65Var7, r28VarD7);
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var6);
                    } else {
                        p65Var7.m0();
                    }
                    tp7.B(p65Var7, cuVar17, zk7VarC12);
                    tp7.B(p65Var7, cuVar18, i89VarL12);
                    ka1.z(i20, p65Var7, cuVar19, p65Var7, fnVar5);
                    tp7.B(p65Var7, cuVar20, r28VarR12);
                    if (iIntValue12 > 0) {
                        p65Var7.Y(1406278907);
                        tp7.c(0.0f, 6, 6, 0L, p65Var7, w2g.G(o28Var6, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z2 = false;
                    } else {
                        z2 = false;
                        p65Var7.Y(1402152218);
                    }
                    p65Var7.p(z2);
                    il7.k(dr9Var2, (stc) obj6, (md3) obj5, null, null, p65Var7, 0, 24);
                    b09.H(p65Var7, true, true, z2);
                }
                break;
            case 7:
                xr6 xr6Var7 = (xr6) obj;
                int iIntValue14 = ((Number) obj2).intValue();
                x12 x12Var8 = (x12) obj3;
                int iIntValue15 = ((Number) obj4).intValue();
                ima imaVar = (ima) obj6;
                int i21 = (iIntValue15 & 6) == 0 ? iIntValue15 | (((p65) x12Var8).f(xr6Var7) ? 4 : 2) : iIntValue15;
                if ((iIntValue15 & 48) == 0) {
                    i21 |= ((p65) x12Var8).d(iIntValue14) ? 32 : 16;
                }
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(i21 & 1, (i21 & 147) != 146)) {
                    p65Var8.S();
                } else {
                    PublicationData publicationData = (PublicationData) ((List) obj7).get(iIntValue14);
                    p65Var8.Y(118247357);
                    jp7 jp7Var4 = (jp7) p65Var8.j(kt7.a);
                    o28 o28Var7 = o28.b;
                    r28 r28VarJ5 = ka1.j(jp7Var4, o28Var7, 3, 1.0f);
                    zk7 zk7VarC13 = dy0.c(z46.h, false);
                    long j15 = p65Var8.T;
                    int i22 = (int) (j15 ^ (j15 >>> 32));
                    i89 i89VarL13 = p65Var8.l();
                    r28 r28VarR13 = gx1.R(p65Var8, r28VarJ5);
                    r12.W.getClass();
                    ot2 ot2Var7 = q12.b;
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var7);
                    } else {
                        p65Var8.m0();
                    }
                    cu cuVar21 = q12.f;
                    tp7.B(p65Var8, cuVar21, zk7VarC13);
                    cu cuVar22 = q12.e;
                    tp7.B(p65Var8, cuVar22, i89VarL13);
                    Integer numValueOf6 = Integer.valueOf(i22);
                    cu cuVar23 = q12.g;
                    tp7.B(p65Var8, cuVar23, numValueOf6);
                    fn fnVar6 = q12.h;
                    tp7.y(p65Var8, fnVar6);
                    cu cuVar24 = q12.d;
                    tp7.B(p65Var8, cuVar24, r28VarR13);
                    r28 r28VarD8 = jfc.d(jfc.o(o28Var7, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC14 = dy0.c(z46.d, false);
                    long j16 = p65Var8.T;
                    int i23 = (int) (j16 ^ (j16 >>> 32));
                    i89 i89VarL14 = p65Var8.l();
                    r28 r28VarR14 = gx1.R(p65Var8, r28VarD8);
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var7);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, cuVar21, zk7VarC14);
                    tp7.B(p65Var8, cuVar22, i89VarL14);
                    ka1.z(i23, p65Var8, cuVar23, p65Var8, fnVar6);
                    tp7.B(p65Var8, cuVar24, r28VarR14);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var8, 0);
                    long j17 = p65Var8.T;
                    int i24 = (int) (j17 ^ (j17 >>> 32));
                    i89 i89VarL15 = p65Var8.l();
                    r28 r28VarR15 = gx1.R(p65Var8, o28Var7);
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var7);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, cuVar21, wv1VarA);
                    tp7.B(p65Var8, cuVar22, i89VarL15);
                    ka1.z(i24, p65Var8, cuVar23, p65Var8, fnVar6);
                    tp7.B(p65Var8, cuVar24, r28VarR15);
                    if (imaVar.a || iIntValue14 > 0) {
                        p65Var8.Y(203325760);
                        vp7.b(0.0f, 6, 6, 0L, p65Var8, w2g.G(o28Var7, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                    } else {
                        p65Var8.Y(193636803);
                    }
                    p65Var8.p(false);
                    c.b(publicationData, imaVar.c, imaVar.d, (x45) obj5, null, !imaVar.e || publicationData.getHasSubmission(), p65Var8, 0);
                    ho2.N(p65Var8, true, true, true, false);
                }
                break;
            case 8:
                bw6 bw6Var = (bw6) obj;
                int iIntValue16 = ((Number) obj2).intValue();
                x12 x12Var9 = (x12) obj3;
                int iIntValue17 = ((Number) obj4).intValue();
                b3e b3eVar = (b3e) obj6;
                int i25 = (iIntValue17 & 6) == 0 ? iIntValue17 | (((p65) x12Var9).f(bw6Var) ? 4 : 2) : iIntValue17;
                if ((iIntValue17 & 48) == 0) {
                    i25 |= ((p65) x12Var9).d(iIntValue16) ? 32 : 16;
                }
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(i25 & 1, (i25 & 147) != 146)) {
                    p65Var9.S();
                } else {
                    UnsplashPhoto unsplashPhoto = (UnsplashPhoto) ((List) obj7).get(iIntValue16);
                    p65Var9.Y(2123002064);
                    r28 r28VarN = bgf.N(o28Var, "unsplash_photo_" + unsplashPhoto);
                    boolean zF = p65Var9.f(b3eVar) | p65Var9.f(unsplashPhoto);
                    Object objM = p65Var9.M();
                    if (zF || objM == w12.a) {
                        objM = new dwd(b3eVar, 1, unsplashPhoto);
                        p65Var9.j0(objM);
                    }
                    d3e.d(unsplashPhoto, hlg.r(r28VarN, false, null, null, (m45) objM, 15), (gx5) obj5, p65Var9, 0);
                    p65Var9.p(false);
                }
                break;
            case 9:
                break;
            case 10:
                break;
            case 11:
                xr6 xr6Var8 = (xr6) obj;
                int iIntValue18 = ((Number) obj2).intValue();
                x12 x12Var10 = (x12) obj3;
                int iIntValue19 = ((Number) obj4).intValue();
                int i26 = (iIntValue19 & 6) == 0 ? iIntValue19 | (((p65) x12Var10).f(xr6Var8) ? 4 : 2) : iIntValue19;
                if ((iIntValue19 & 48) == 0) {
                    i26 |= ((p65) x12Var10).d(iIntValue18) ? 32 : 16;
                }
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(i26 & 1, (i26 & 147) != 146)) {
                    p65Var10.S();
                } else {
                    dr9 dr9Var3 = (dr9) ((List) obj7).get(iIntValue18);
                    p65Var10.Y(1817379155);
                    jp7 jp7Var5 = (jp7) p65Var10.j(kt7.a);
                    o28 o28Var8 = o28.b;
                    r28 r28VarJ6 = ka1.j(jp7Var5, o28Var8, 3, 1.0f);
                    zk7 zk7VarC15 = dy0.c(z46.h, false);
                    long j18 = p65Var10.T;
                    int i27 = (int) (j18 ^ (j18 >>> 32));
                    i89 i89VarL16 = p65Var10.l();
                    r28 r28VarR16 = gx1.R(p65Var10, r28VarJ6);
                    r12.W.getClass();
                    ot2 ot2Var8 = q12.b;
                    p65Var10.c0();
                    if (p65Var10.S) {
                        p65Var10.k(ot2Var8);
                    } else {
                        p65Var10.m0();
                    }
                    cu cuVar25 = q12.f;
                    tp7.B(p65Var10, cuVar25, zk7VarC15);
                    cu cuVar26 = q12.e;
                    tp7.B(p65Var10, cuVar26, i89VarL16);
                    Integer numValueOf7 = Integer.valueOf(i27);
                    cu cuVar27 = q12.g;
                    tp7.B(p65Var10, cuVar27, numValueOf7);
                    fn fnVar7 = q12.h;
                    tp7.y(p65Var10, fnVar7);
                    cu cuVar28 = q12.d;
                    tp7.B(p65Var10, cuVar28, r28VarR16);
                    r28 r28VarD9 = jfc.d(jfc.o(o28Var8, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC16 = dy0.c(z46.d, false);
                    long j19 = p65Var10.T;
                    int i28 = (int) (j19 ^ (j19 >>> 32));
                    i89 i89VarL17 = p65Var10.l();
                    r28 r28VarR17 = gx1.R(p65Var10, r28VarD9);
                    p65Var10.c0();
                    if (p65Var10.S) {
                        p65Var10.k(ot2Var8);
                    } else {
                        p65Var10.m0();
                    }
                    tp7.B(p65Var10, cuVar25, zk7VarC16);
                    tp7.B(p65Var10, cuVar26, i89VarL17);
                    ka1.z(i28, p65Var10, cuVar27, p65Var10, fnVar7);
                    tp7.B(p65Var10, cuVar28, r28VarR17);
                    if (iIntValue18 > 0) {
                        p65Var10.Y(-592425540);
                        tp7.c(0.0f, 0, 7, 0L, p65Var10, null);
                        z3 = false;
                    } else {
                        z3 = false;
                        p65Var10.Y(-610295676);
                    }
                    p65Var10.p(z3);
                    il7.k(dr9Var3, (stc) obj6, (md3) obj5, bgf.N(o28Var8, "you_posts_post_".concat(dr9Var3.a)), null, p65Var10, 0, 16);
                    b09.H(p65Var10, true, true, false);
                }
                break;
            default:
                xr6 xr6Var9 = (xr6) obj;
                int iIntValue20 = ((Number) obj2).intValue();
                x12 x12Var11 = (x12) obj3;
                int iIntValue21 = ((Number) obj4).intValue();
                int i29 = (iIntValue21 & 6) == 0 ? iIntValue21 | (((p65) x12Var11).f(xr6Var9) ? 4 : 2) : iIntValue21;
                if ((iIntValue21 & 48) == 0) {
                    i29 |= ((p65) x12Var11).d(iIntValue20) ? 32 : 16;
                }
                p65 p65Var11 = (p65) x12Var11;
                if (!p65Var11.P(i29 & 1, (i29 & 147) != 146)) {
                    p65Var11.S();
                } else {
                    dr9 dr9Var4 = (dr9) ((ArrayList) obj7).get(iIntValue20);
                    p65Var11.Y(-378940493);
                    r28 r28VarX2 = ho2.x((jp7) p65Var11.j(kt7.a), km4.k(xr6Var9), 3, 1.0f);
                    zk7 zk7VarC17 = dy0.c(z46.h, false);
                    long j20 = p65Var11.T;
                    int i30 = (int) (j20 ^ (j20 >>> 32));
                    i89 i89VarL18 = p65Var11.l();
                    r28 r28VarR18 = gx1.R(p65Var11, r28VarX2);
                    r12.W.getClass();
                    ot2 ot2Var9 = q12.b;
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var9);
                    } else {
                        p65Var11.m0();
                    }
                    cu cuVar29 = q12.f;
                    tp7.B(p65Var11, cuVar29, zk7VarC17);
                    cu cuVar30 = q12.e;
                    tp7.B(p65Var11, cuVar30, i89VarL18);
                    Integer numValueOf8 = Integer.valueOf(i30);
                    cu cuVar31 = q12.g;
                    tp7.B(p65Var11, cuVar31, numValueOf8);
                    fn fnVar8 = q12.h;
                    tp7.y(p65Var11, fnVar8);
                    cu cuVar32 = q12.d;
                    tp7.B(p65Var11, cuVar32, r28VarR18);
                    o28 o28Var9 = o28.b;
                    r28 r28VarD10 = jfc.d(jfc.o(o28Var9, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC18 = dy0.c(z46.d, false);
                    long j21 = p65Var11.T;
                    int i31 = (int) (j21 ^ (j21 >>> 32));
                    i89 i89VarL19 = p65Var11.l();
                    r28 r28VarR19 = gx1.R(p65Var11, r28VarD10);
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var9);
                    } else {
                        p65Var11.m0();
                    }
                    tp7.B(p65Var11, cuVar29, zk7VarC18);
                    tp7.B(p65Var11, cuVar30, i89VarL19);
                    ka1.z(i31, p65Var11, cuVar31, p65Var11, fnVar8);
                    tp7.B(p65Var11, cuVar32, r28VarR19);
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var11, 0);
                    long j22 = p65Var11.T;
                    int i32 = (int) (j22 ^ (j22 >>> 32));
                    i89 i89VarL20 = p65Var11.l();
                    r28 r28VarR20 = gx1.R(p65Var11, o28Var9);
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var9);
                    } else {
                        p65Var11.m0();
                    }
                    tp7.B(p65Var11, cuVar29, wv1VarA2);
                    tp7.B(p65Var11, cuVar30, i89VarL20);
                    ka1.z(i32, p65Var11, cuVar31, p65Var11, fnVar8);
                    tp7.B(p65Var11, cuVar32, r28VarR20);
                    if (iIntValue20 > 0) {
                        p65Var11.Y(-20424450);
                        tp7.c(0.0f, 6, 6, 0L, p65Var11, w2g.G(o28Var9, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                        z4 = false;
                    } else {
                        z4 = false;
                        p65Var11.Y(-50434403);
                    }
                    p65Var11.p(z4);
                    il7.k(dr9Var4, (stc) obj6, (sh9) obj5, null, null, p65Var11, 0, 24);
                    ho2.N(p65Var11, true, true, true, z4);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ o37(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
