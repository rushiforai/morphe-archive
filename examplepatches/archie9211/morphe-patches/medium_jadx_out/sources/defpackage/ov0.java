package defpackage;

import android.content.Context;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.profile.ui.view.e;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ov0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ ov0(int i, x45 x45Var, r28 r28Var, String str, boolean z) {
        this.a = 8;
        this.d = str;
        this.b = z;
        this.c = r28Var;
        this.e = x45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        long j;
        long j2;
        boolean z;
        int i = this.a;
        o28 o28Var = o28.b;
        boolean z2 = this.b;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.d;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                lv0 lv0Var = (lv0) obj5;
                String str = (String) obj4;
                zw7 zw7Var = (zw7) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                ar0 ar0Var = z46.f;
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    int i2 = qv0.b[lv0Var.ordinal()];
                    if (i2 == 1 || i2 == 2 || i2 == 3 || i2 == 4) {
                        p65Var.Y(1369705815);
                        c09 c09VarJ = vn7.J(lv0Var.getIcon(z2), 0, p65Var);
                        String strR = vo7.R(p65Var, lv0Var.getText());
                        if (z2) {
                            p65Var.Y(1369994239);
                            j = ((zo7) p65Var.j(kt7.b)).n;
                            p65Var.p(false);
                        } else {
                            p65Var.Y(1370131197);
                            j = ((zo7) p65Var.j(kt7.b)).o;
                            p65Var.p(false);
                        }
                        qv5.b(c09VarJ, strR, null, j, p65Var, 8, 4);
                        p65Var.p(false);
                    } else {
                        if (i2 != 5) {
                            throw ho2.L(p65Var, 598368656, false);
                        }
                        p65Var.Y(1370521146);
                        zk7 zk7VarC = dy0.c(z46.h, false);
                        long j3 = p65Var.T;
                        int i3 = (int) (j3 ^ (j3 >>> 32));
                        i89 i89VarL = p65Var.l();
                        r28 r28VarR = gx1.R(p65Var, o28Var);
                        r12.W.getClass();
                        ot2 ot2Var = q12.b;
                        p65Var.c0();
                        if (p65Var.S) {
                            p65Var.k(ot2Var);
                        } else {
                            p65Var.m0();
                        }
                        tp7.B(p65Var, q12.f, zk7VarC);
                        tp7.B(p65Var, q12.e, i89VarL);
                        tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                        tp7.y(p65Var, q12.h);
                        tp7.B(p65Var, q12.d, r28VarR);
                        amb ambVar = bmb.a;
                        r28 r28VarY = r40.y(o28Var, ambVar);
                        if (z2) {
                            p65Var.Y(1182285886);
                            j2 = ((zo7) p65Var.j(kt7.b)).n;
                            p65Var.p(false);
                        } else {
                            p65Var.Y(1182287025);
                            p65Var.p(false);
                            j2 = uu1.g;
                        }
                        r28 r28VarL = jfc.l(bo.B(r28VarY, 1.0f, j2, ambVar), 28.0f);
                        if (((Boolean) p65Var.j(l36.a)).booleanValue()) {
                            p65Var.Y(-2002870571);
                            w2g.e(vn7.J(R.drawable.avatar_sample, 0, p65Var), null, r28VarL, null, null, 0.0f, null, p65Var, 56, 120);
                            p65Var.p(false);
                        } else {
                            p65Var.Y(-2003530592);
                            nx5 nx5Var = new nx5((Context) p65Var.j(eo.b));
                            nx5Var.c = str != null ? new ax5(str) : null;
                            hlg.W(nx5Var);
                            ur7.a(nx5Var.a(), null, r28VarL, null, v82.b, 0.0f, null, 0, p65Var, 1572912, 1976);
                            p65Var.p(false);
                        }
                        int i4 = zw7Var == null ? -1 : qv0.a[zw7Var.ordinal()];
                        if (i4 != -1) {
                            iy0 iy0Var = iy0.a;
                            if (i4 == 1) {
                                p65Var.Y(-2002335976);
                                w2g.e(vn7.J(R.drawable.ic_member_16_with_stroke, 0, p65Var), vo7.R(p65Var, R.string.cd_member), guc.S(iy0Var.a(o28Var, ar0Var), 4.0f, -4.0f), null, null, 0.0f, null, p65Var, 8, 120);
                                z = false;
                                p65Var.p(false);
                            } else if (i4 != 2) {
                                if (i4 != 3) {
                                    throw ho2.L(p65Var, 1182332692, false);
                                }
                                z = false;
                                p65Var.Y(1182393162);
                                p65Var.p(false);
                            } else {
                                p65Var.Y(-2001466922);
                                w2g.e(vn7.J(R.drawable.ic_premium_16_with_stroke, 0, p65Var), vo7.R(p65Var, R.string.cd_premium), guc.S(iy0Var.a(o28Var, ar0Var), 4.0f, -4.0f), null, null, 0.0f, null, p65Var, 8, 120);
                                z = false;
                                p65Var.p(false);
                            }
                            p65Var.p(true);
                            p65Var.p(z);
                        } else {
                            z = false;
                            p65Var.Y(1182393162);
                            p65Var.p(false);
                            p65Var.p(true);
                            p65Var.p(z);
                        }
                    }
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                l78 l78Var = (l78) obj5;
                fy2 fy2Var = (fy2) obj4;
                mz1 mz1Var = (mz1) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    k40.c(w72.a.a(Float.valueOf(uu1.c(((uu1) l78Var.getValue()).a))), pxf.E(1808091765, new jc0(fy2Var, z2, mz1Var), p65Var2), p65Var2, 56);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                ((Integer) obj2).getClass();
                lk7.a((if8) obj5, (my6) obj4, (r28) obj3, this.b, (x12) obj, tr7.y(1));
                return c1eVar;
            case 3:
                ((Integer) obj2).getClass();
                vn7.e((ina) obj5, this.b, (nla) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 4:
                ((Integer) obj2).getClass();
                qb8.e((oj8) obj5, this.b, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 5:
                ((Integer) obj2).getClass();
                qb8.b((nj8) obj5, this.b, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 6:
                ((Integer) obj2).getClass();
                ok7.d((uid) obj5, (x45) obj4, this.b, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 7:
                ((Integer) obj2).getClass();
                ep7.a((sfb) obj5, this.b, (veb) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 8:
                ((Integer) obj2).getClass();
                dm2.s(tr7.y(385), (x12) obj, (x45) obj3, (r28) obj5, (String) obj4, this.b);
                return c1eVar;
            case 9:
                ((Integer) obj2).getClass();
                wo7.d((Integer) obj5, (r28) obj4, this.b, (m45) obj3, (x12) obj, tr7.y(49));
                return c1eVar;
            case 10:
                xm1 xm1Var = (xm1) obj5;
                ojc ojcVar = (ojc) obj4;
                Integer num = (Integer) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                    return c1eVar;
                }
                r28 r28VarT = jfc.t(o28Var, null, 3);
                omb ombVarA = nmb.a(qb8.a, z46.n, p65Var3, 48);
                long j4 = p65Var3.T;
                int i5 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL2 = p65Var3.l();
                r28 r28VarR2 = gx1.R(p65Var3, r28VarT);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var2);
                } else {
                    p65Var3.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var3, cuVar, ombVarA);
                cu cuVar2 = q12.e;
                tp7.B(p65Var3, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var3, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var3, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var3, cuVar4, r28VarR2);
                sgg.h(xm1Var, rm1.M, new njc(ojcVar), w2g.G(jfc.o(jfc.c(o28Var, 1.0f), 48.0f, 0.0f, 0.0f, 0.0f, 14), 6.0f, 0.0f, 12.0f, 0.0f, 10), 0L, false, null, p65Var3, 3120, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                sn3 sn3Var = kt7.b;
                r28 r28VarA0 = flb.a0(o28Var, ap7.b(((zo7) p65Var3.j(sn3Var)).a, p65Var3, 1), rv8.r);
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
                long j5 = p65Var3.T;
                int i6 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL3 = p65Var3.l();
                r28 r28VarR3 = gx1.R(p65Var3, r28VarA0);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar, wv1VarA);
                tp7.B(p65Var3, cuVar2, i89VarL3);
                ka1.z(i6, p65Var3, cuVar3, p65Var3, fnVar);
                tp7.B(p65Var3, cuVar4, r28VarR3);
                hp7.t(p65Var3, jfc.e(o28Var, 12.0f));
                tp7.e(0.0f, 6, 4, ((zo7) p65Var3.j(sn3Var)).z, p65Var3, jfc.e(o28Var, 16.0f));
                hp7.t(p65Var3, jfc.e(o28Var, 12.0f));
                p65Var3.p(true);
                boolean z3 = !z2;
                boolean zF = p65Var3.f(ojcVar);
                Object objM = p65Var3.M();
                if (zF || objM == w12.a) {
                    objM = new j5c(0, ojcVar, ojc.class, "onResponseButtonClicked", "onResponseButtonClicked()V", 0, 21);
                    p65Var3.j0(objM);
                }
                wo7.d(num, w2g.E(jfc.o(jfc.c(o28Var, 1.0f), 48.0f, 0.0f, 0.0f, 0.0f, 14), 12.0f, 0.0f, 2), z3, (m45) ((qh6) objM), p65Var3, 48);
                p65Var3.p(true);
                return c1eVar;
            default:
                ((Integer) obj2).getClass();
                e.i((nje) obj5, (ihe) obj4, this.b, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
        }
    }

    public /* synthetic */ ov0(int i, Object obj, Object obj2, Object obj3, boolean z) {
        this.a = i;
        this.c = obj;
        this.b = z;
        this.d = obj2;
        this.e = obj3;
    }

    public /* synthetic */ ov0(l78 l78Var, fy2 fy2Var, boolean z, mz1 mz1Var) {
        this.a = 1;
        this.c = l78Var;
        this.d = fy2Var;
        this.b = z;
        this.e = mz1Var;
    }

    public /* synthetic */ ov0(if8 if8Var, my6 my6Var, r28 r28Var, boolean z, int i) {
        this.a = 2;
        this.c = if8Var;
        this.d = my6Var;
        this.e = r28Var;
        this.b = z;
    }

    public /* synthetic */ ov0(Object obj, Object obj2, boolean z, Object obj3, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.b = z;
        this.e = obj3;
    }

    public /* synthetic */ ov0(Object obj, boolean z, Object obj2, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.b = z;
        this.d = obj2;
        this.e = r28Var;
    }
}
