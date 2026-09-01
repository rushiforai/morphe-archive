package defpackage;

import android.content.Context;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class dg5 {
    public static final float a = 4.0f + 2.0f;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r15v23 */
    /* JADX WARN: Type inference failed for: r15v7 */
    /* JADX WARN: Type inference failed for: r15v8, types: [boolean] */
    public static final void a(final lt1 lt1Var, cs1 cs1Var, r28 r28Var, long j, x12 x12Var, final int i, final int i2) {
        r28 r28Var2;
        int i3;
        cs1 cs1Var2;
        final long j2;
        final r28 r28Var3;
        p65 p65Var;
        long j3;
        int i4;
        vv2 vv2Var;
        long j4;
        Object obj;
        o28 o28Var;
        int i5;
        r28 r28Var4;
        int i6;
        nr5 nr5Var;
        boolean z;
        p65 p65Var2;
        ?? r15;
        p65 p65Var3;
        boolean z2;
        boolean z3;
        boolean z4 = lt1Var.e;
        vv2 vv2Var2 = lt1Var.g;
        cs1Var.getClass();
        p65 p65Var4 = (p65) x12Var;
        p65Var4.a0(1596131881);
        int i7 = i | (p65Var4.f(lt1Var) ? 4 : 2) | (p65Var4.f(cs1Var) ? 32 : 16);
        int i8 = i2 & 4;
        if (i8 != 0) {
            i3 = i7 | 384;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i3 = i7 | (p65Var4.f(r28Var2) ? 256 : 128);
        }
        int i9 = i3 | 1024;
        if (p65Var4.P(i9 & 1, (i9 & 1171) != 1170)) {
            p65Var4.U();
            int i10 = i & 1;
            o28 o28Var2 = o28.b;
            if (i10 == 0 || p65Var4.z()) {
                if (i8 != 0) {
                    r28Var2 = o28Var2;
                }
                j3 = ((zo7) p65Var4.j(kt7.b)).a;
                i4 = i9 & (-7169);
            } else {
                p65Var4.S();
                i4 = i9 & (-7169);
                j3 = j;
            }
            int i11 = i4;
            r28 r28Var5 = r28Var2;
            p65Var4.q();
            cs1Var.y(lt1Var.a, lt1Var.i);
            amb ambVarA = bmb.a(4.0f);
            r28 r28VarY = r40.y(flb.a0(r28Var5, uu1.g, ambVarA), ambVarA);
            int i12 = i11 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i13 = i11 & 14;
            boolean z5 = (i13 == 4) | (i12 == 32);
            Object objM = p65Var4.M();
            Object obj2 = w12.a;
            if (z5 || objM == obj2) {
                objM = new qr1(cs1Var, lt1Var, 5);
                p65Var4.j0(objM);
            }
            r28 r28VarB = bo.B(jfc.m(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 236.0f, 296.0f), 1.0f, ((zo7) p65Var4.j(kt7.b)).z, bmb.a(4.0f));
            nr5 nr5Var2 = rv8.r;
            r28 r28VarA0 = flb.a0(r28VarB, j3, nr5Var2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var4, 0);
            long j5 = p65Var4.T;
            int i14 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL = p65Var4.l();
            r28 r28VarR = gx1.R(p65Var4, r28VarA0);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var4.c0();
            if (p65Var4.S) {
                p65Var4.k(m45Var);
            } else {
                p65Var4.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var4, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var4, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i14);
            cu cuVar3 = q12.g;
            tp7.B(p65Var4, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var4, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var4, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(o28Var2, 1.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j6 = p65Var4.T;
            int i15 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL2 = p65Var4.l();
            r28 r28VarR2 = gx1.R(p65Var4, r28VarD);
            p65Var4.c0();
            long j7 = j3;
            if (p65Var4.S) {
                p65Var4.k(m45Var);
            } else {
                p65Var4.m0();
            }
            tp7.B(p65Var4, cuVar, zk7VarC);
            tp7.B(p65Var4, cuVar2, i89VarL2);
            ka1.z(i15, p65Var4, cuVar3, p65Var4, fnVar);
            tp7.B(p65Var4, cuVar4, r28VarR2);
            if (lt1Var.c != null) {
                p65Var4.Y(-374292404);
                nx5 nx5Var = new nx5((Context) p65Var4.j(eo.b));
                nx5Var.c = new sw5(lt1Var.c, null, null, null, 38);
                vv2Var = vv2Var2;
                j4 = j7;
                obj = obj2;
                o28Var = o28Var2;
                i5 = i13;
                r28Var4 = r28Var5;
                i6 = i12;
                nr5Var = nr5Var2;
                z = false;
                ur7.a(nx5Var.a(), null, jfc.e(jfc.d(o28Var2, 1.0f), 40.0f), null, v82.a, 0.0f, null, 0, p65Var4, 1573296, 1976);
                p65Var2 = p65Var4;
            } else {
                vv2Var = vv2Var2;
                j4 = j7;
                obj = obj2;
                o28Var = o28Var2;
                i5 = i13;
                r28Var4 = r28Var5;
                i6 = i12;
                nr5Var = nr5Var2;
                z = false;
                p65Var4.Y(-377769891);
                p65Var2 = p65Var4;
            }
            p65Var2.p(z);
            String str = lt1Var.b;
            if (str == null) {
                str = null;
            }
            hl0 hl0Var = hl0.L;
            p65 p65Var5 = p65Var2;
            hp7.o(str, hl0Var, bgf.N(w2g.C(flb.a0(r40.y(jfc.l(w2g.G(o28Var, 22.0f, 22.0f, 0.0f, 0.0f, 12), hl0Var.m114getSizeD9Ej5fM() + 4.0f), bmb.a(a)), j4, nr5Var), 2.0f), "avatar"), null, null, 0.0f, 0, null, null, p65Var5, 48, 2040);
            p65Var5.p(true);
            o28 o28Var3 = o28Var;
            jjd.b(lt1Var.d, bgf.N(w2g.G(o28Var, 24.0f, 12.0f, 24.0f, 0.0f, 8), "publication_name"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var5.j(jt7.c)).j, p65Var5, 48, 24960, 110588);
            Long l = lt1Var.h;
            long jLongValue = l != null ? l.longValue() : 0L;
            p65Var5.Y(1352692598);
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            if (z4) {
                p65Var5.Y(-1012360032);
                sb.append(vo7.R(p65Var5, R.string.common_publication));
                r15 = 0;
            } else {
                r15 = 0;
                p65Var5.Y(-1017715437);
            }
            p65Var5.p(r15);
            if (!z4 || jLongValue <= 0) {
                p65Var5.Y(-1017715437);
            } else {
                p65Var5.Y(-1012208287);
                sb.append(vo7.R(p65Var5, R.string.common_interpunct));
            }
            p65Var5.p(r15);
            if (jLongValue > 0) {
                p65Var5.Y(-1012082148);
                int i16 = (int) jLongValue;
                String strG = dq1.g(Long.valueOf(jLongValue));
                Object[] objArr = new Object[1];
                objArr[r15] = strG;
                sb.append(vo7.D(R.plurals.n_followers, i16, objArr, p65Var5));
            } else {
                p65Var5.Y(-1017715437);
            }
            p65Var5.p(r15);
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            int size = arrayListV.size();
            for (int i17 = 0; i17 < size; i17 = lv8.i(sb, (jx) arrayListV.get(i17), arrayList, i17, 1)) {
            }
            mx mxVar = new mx(string, arrayList);
            p65Var5.p(false);
            d8a d8aVar = jt7.c;
            mkd mkdVar = ((bu7) p65Var5.j(d8aVar)).n;
            d8a d8aVar2 = kt7.b;
            long j8 = j4;
            jjd.c(mxVar, bgf.N(w2g.G(o28Var3, 24.0f, 4.0f, 24.0f, 0.0f, 8), "publication_label_and_followers_count"), 0L, 0L, 0L, null, 0L, 2, false, 1, 0, null, null, mkd.a(mkdVar, ((zo7) p65Var5.j(d8aVar2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var5, 48, 24960, 241660);
            p65 p65Var6 = p65Var5;
            if (lt1Var.f != null) {
                p65Var6.Y(-1015060659);
                jjd.b(lt1Var.f, bgf.N(w2g.F(o28Var3, 24.0f, 12.0f, 24.0f, 12.0f), "publication_bio"), 0L, 0L, 0L, null, null, 0L, 2, false, 3, 0, null, mkd.a(((bu7) p65Var6.j(d8aVar)).n, ((zo7) p65Var6.j(d8aVar2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var6, 48, 24960, 110588);
                p65 p65Var7 = p65Var6;
                p65Var7.p(false);
                p65Var3 = p65Var7;
            } else {
                km4.F(24.0f, -1014621916, p65Var6, p65Var6, o28Var3);
                p65Var6.p(false);
                p65Var3 = p65Var6;
            }
            hp7.t(p65Var3, new sq6(1.0f, true));
            r28 r28VarD2 = jfc.d(w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 24.0f, 2), 1.0f);
            vv2 vv2Var3 = vv2Var;
            if (vv2Var3 instanceof jt1) {
                p65Var3.Y(-1014242600);
                l78 l78VarX = guc.x(((jt1) vv2Var3).u, bt4.NOT_FOLLOWING, p65Var3, 48);
                int i18 = cg5.a[((bt4) l78VarX.getValue()).ordinal()];
                if (i18 == 1 || i18 == 2) {
                    p65Var3.Y(1352764052);
                    boolean z6 = ((bt4) l78VarX.getValue()) == bt4.FOLLOWING;
                    tw8 tw8Var = tw8.S;
                    int i19 = i6;
                    int i20 = i5;
                    boolean z7 = (i20 == 4) | (i19 == 32);
                    Object objM2 = p65Var3.M();
                    Object obj3 = obj;
                    if (z7 || objM2 == obj3) {
                        cs1Var2 = cs1Var;
                        objM2 = new qr1(cs1Var2, lt1Var, 6);
                        p65Var3.j0(objM2);
                    } else {
                        cs1Var2 = cs1Var;
                    }
                    m45 m45Var2 = (m45) objM2;
                    boolean z8 = (i19 == 32) | (i20 == 4);
                    Object objM3 = p65Var3.M();
                    if (z8 || objM3 == obj3) {
                        objM3 = new qr1(cs1Var2, lt1Var, 7);
                        p65Var3.j0(objM3);
                    }
                    pr7.f(z6, tw8Var, m45Var2, (m45) objM3, bgf.N(r28VarD2, "follow_button"), false, p65Var3, 24624, 32);
                    z3 = false;
                    p65Var3.p(false);
                } else {
                    if (i18 != 3 && i18 != 4) {
                        throw ho2.L(p65Var3, 1352759927, false);
                    }
                    z3 = false;
                    p65Var3.Y(1352797109);
                    hp7.t(p65Var3, r28VarD2);
                    p65Var3.p(false);
                    cs1Var2 = cs1Var;
                }
                p65Var3.p(z3);
            } else {
                cs1Var2 = cs1Var;
                int i21 = i6;
                int i22 = i5;
                Object obj4 = obj;
                if (!(vv2Var3 instanceof kt1)) {
                    throw ho2.L(p65Var3, 1352754604, false);
                }
                p65Var3.Y(-1012816941);
                l78 l78VarX2 = guc.x(((kt1) vv2Var3).u, d88.NOT_MUTED, p65Var3, 48);
                int i23 = cg5.b[((d88) l78VarX2.getValue()).ordinal()];
                if (i23 == 1 || i23 == 2) {
                    p65Var3.Y(1352809365);
                    boolean z9 = ((d88) l78VarX2.getValue()) == d88.MUTED;
                    xn7 xn7Var = xn7.S;
                    boolean z10 = (i21 == 32) | (i22 == 4);
                    Object objM4 = p65Var3.M();
                    if (z10 || objM4 == obj4) {
                        objM4 = new qr1(cs1Var2, lt1Var, 8);
                        p65Var3.j0(objM4);
                    }
                    m45 m45Var3 = (m45) objM4;
                    boolean z11 = (i21 == 32) | (i22 == 4);
                    Object objM5 = p65Var3.M();
                    if (z11 || objM5 == obj4) {
                        objM5 = new qr1(cs1Var2, lt1Var, 9);
                        p65Var3.j0(objM5);
                    }
                    ok7.c(z9, xn7Var, m45Var3, (m45) objM5, r28VarD2, false, p65Var3, 24624);
                    z2 = false;
                    p65Var3.p(false);
                } else {
                    if (i23 != 3 && i23 != 4) {
                        throw ho2.L(p65Var3, 1352805668, false);
                    }
                    z2 = false;
                    p65Var3.Y(1352839285);
                    hp7.t(p65Var3, r28VarD2);
                    p65Var3.p(false);
                }
                p65Var3.p(z2);
            }
            p65Var3.p(true);
            r28Var3 = r28Var4;
            j2 = j8;
            p65Var = p65Var3;
        } else {
            cs1Var2 = cs1Var;
            p65Var4.S();
            j2 = j;
            r28Var3 = r28Var2;
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final cs1 cs1Var3 = cs1Var2;
            mwaVarS.d = new b55(cs1Var3, r28Var3, j2, i, i2) { // from class: bg5
                public final /* synthetic */ cs1 b;
                public final /* synthetic */ r28 c;
                public final /* synthetic */ long d;
                public final /* synthetic */ int e;

                {
                    this.e = i2;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj5, Object obj6) {
                    ((Integer) obj6).getClass();
                    int iY = tr7.y(1);
                    dg5.a(this.a, this.b, this.c, this.d, (x12) obj5, iY, this.e);
                    return c1e.a;
                }
            };
        }
    }
}
