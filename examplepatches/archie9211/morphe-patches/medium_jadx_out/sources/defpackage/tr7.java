package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.view.View;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class tr7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;

    public static hqe A(int i, String str) {
        return new hqe(new k36(0, 0, 0, 0), str);
    }

    public static int B(int i, int i2) {
        if (i2 < 0) {
            ay0.e("cannot store more than Integer.MAX_VALUE elements");
            return 0;
        }
        if (i2 <= i) {
            return i;
        }
        int i3 = i + (i >> 1) + 1;
        if (i3 < i2) {
            int iHighestOneBit = Integer.highestOneBit(i2 - 1);
            i3 = iHighestOneBit + iHighestOneBit;
        }
        if (i3 < 0) {
            return Integer.MAX_VALUE;
        }
        return i3;
    }

    public static byte[] C(String str) {
        byte[] bArr = new byte[19];
        for (int i = 0; i < 19; i++) {
            int i2 = i + i;
            int iDigit = Character.digit(str.charAt(i2), 16);
            int iDigit2 = Character.digit(str.charAt(i2 + 1), 16);
            if (iDigit == -1 || iDigit2 == -1) {
                ay0.e("input is not hexadecimal");
                return null;
            }
            bArr[i] = (byte) ((iDigit * 16) + iDigit2);
        }
        return bArr;
    }

    public static int D(int i, int i2) {
        RoundingMode roundingMode = RoundingMode.CEILING;
        roundingMode.getClass();
        if (i2 == 0) {
            throw new ArithmeticException("/ by zero");
        }
        int i3 = i / i2;
        int i4 = i - (i2 * i3);
        if (i4 == 0) {
            return i3;
        }
        int i5 = ((i ^ i2) >> 31) | 1;
        switch (bjg.a[roundingMode.ordinal()]) {
            case 1:
                throw new ArithmeticException("mode was UNNECESSARY, but rounding was necessary");
            case 2:
                return i3;
            case 3:
                if (i5 >= 0) {
                    return i3;
                }
                break;
            case 4:
                break;
            case 5:
                if (i5 <= 0) {
                    return i3;
                }
                break;
            case 6:
            case 7:
            case 8:
                int iAbs = Math.abs(i4);
                int iAbs2 = iAbs - (Math.abs(i2) - iAbs);
                if (iAbs2 == 0) {
                    RoundingMode roundingMode2 = RoundingMode.HALF_UP;
                    RoundingMode roundingMode3 = RoundingMode.HALF_EVEN;
                    return i3;
                }
                if (iAbs2 <= 0) {
                    return i3;
                }
                break;
            default:
                ywb.d();
                return 0;
        }
        return i3 + i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x01c1  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x01d3  */
    /* JADX WARN: Removed duplicated region for block: B:53:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final defpackage.nwb r32, final defpackage.m45 r33, defpackage.r28 r34, long r35, int r37, int r38, int r39, defpackage.x12 r40, final int r41, final int r42) {
        /*
            Method dump skipped, instruction units count: 479
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tr7.a(nwb, m45, r28, long, int, int, int, x12, int, int):void");
    }

    public static final void b(int i, int i2, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i3;
        long j2;
        r28 r28Var3;
        r28 r28Var4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1071981250);
        int i4 = i2 & 1;
        if (i4 != 0) {
            i3 = i | 6;
            r28Var2 = r28Var;
        } else if ((i & 6) == 0) {
            r28Var2 = r28Var;
            i3 = i | (p65Var.f(r28Var2) ? 4 : 2);
        } else {
            r28Var2 = r28Var;
            i3 = i;
        }
        if ((i & 48) == 0) {
            if ((i2 & 2) == 0) {
                j2 = j;
                int i5 = p65Var.e(j2) ? 32 : 16;
                i3 |= i5;
            } else {
                j2 = j;
            }
            i3 |= i5;
        } else {
            j2 = j;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                r28Var4 = i4 != 0 ? o28.b : r28Var2;
                if ((i2 & 2) != 0) {
                    j2 = ((zo7) p65Var.j(kt7.b)).c;
                }
            } else {
                p65Var.S();
                r28Var4 = r28Var2;
            }
            p65Var.q();
            dy0.a(flb.a0(jfc.e(jfc.d(r28Var4, 1.0f), 40.0f), j2, bmb.a(24.0f)), p65Var, 0);
            r28Var3 = r28Var4;
        } else {
            p65Var.S();
            r28Var3 = r28Var2;
        }
        long j3 = j2;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pv2(r28Var3, j3, i, i2, 1);
        }
    }

    public static final void c(t38 t38Var, x12 x12Var, int i) {
        boolean z;
        String strQ;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-904168083);
        int i2 = (p65Var.f(t38Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            long j = ((zo7) p65Var.j(kt7.b)).c;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), flb.a0(o28Var, j, nr5Var), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strW = t38Var.a;
            if (strW == null) {
                strW = km4.w(p65Var, 1358497670, R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(1358496988);
                p65Var.p(false);
            }
            String strW2 = t38Var.c;
            if (strW2 == null) {
                strW2 = km4.w(p65Var, 1358500876, R.string.common_unknown_collection, p65Var, false);
            } else {
                p65Var.Y(1358500070);
                p65Var.p(false);
            }
            if (t38Var.b) {
                p65Var.Y(-836042138);
                strQ = vo7.Q(R.string.more_from_author_and_collection_author_and_collection, new Object[]{strW, strW2}, p65Var);
                p65Var.p(false);
                z = true;
            } else {
                p65Var.Y(-835908187);
                z = true;
                strQ = vo7.Q(R.string.more_from_author_and_collection_author, new Object[]{strW}, p65Var);
                p65Var.p(false);
            }
            boolean z2 = z;
            jjd.b(strQ, w2g.F(jfc.d(o28Var, 1.0f), 24.0f, 64.0f, 24.0f, 8.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).i, p65Var, 0, 0, 131068);
            p65Var = p65Var;
            p65Var.p(z2);
            p65Var.p(z2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v08(i, 3, t38Var);
        }
    }

    public static final void d(int i, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-808355763);
        int i2 = i | 6;
        if ((i & 48) == 0) {
            i2 |= p65Var.e(j) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            int i3 = i & 1;
            o28 o28Var = o28.b;
            if (i3 == 0 || p65Var.z()) {
                r28Var2 = o28Var;
            } else {
                p65Var.S();
                r28Var2 = r28Var;
            }
            p65Var.q();
            r28 r28VarE = w2g.E(jfc.r(jfc.d(r28Var2, 1.0f), 3), 0.0f, 18.0f, 1);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarE);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarG = w2g.G(o28Var, 18.0f, 0.0f, 0.0f, 0.0f, 14);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarE2 = jfc.e(jfc.p(o28Var, 48.0f), 48.0f);
            amb ambVar = bmb.a;
            dy0.a(flb.a0(r28VarE2, j, ambVar), p65Var, 0);
            dy0.a(flb.a0(iy0.a.a(jfc.e(jfc.p(o28Var, 22.0f), 22.0f), z46.l), j, ambVar), p65Var, 0);
            p65Var.p(true);
            r28 r28VarG2 = w2g.G(new sq6(1.0f, true), 8.0f, 0.0f, 18.0f, 0.0f, 10);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarG2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 1.0f), 14.0f), j, bmb.a(2.0f)), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.p(w2g.G(o28Var, 0.0f, 6.0f, 0.0f, 0.0f, 13), 56.0f), 13.0f), j, bmb.a(2.0f)), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j, i, 9);
        }
    }

    public static final void e(String str, x45 x45Var, x12 x12Var, int i) {
        str.getClass();
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1375850188);
        int i2 = (p65Var.f(str) ? 4 : 2) | i | (p65Var.h(x45Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarD = o28.b;
            r28 r28VarA0 = flb.a0(jfc.d(r28VarD, 1.0f), ((zo7) p65Var.j(kt7.b)).c, rv8.r);
            sn3 sn3Var = kt7.a;
            r28 r28VarX = ho2.x((jp7) p65Var.j(sn3Var), r28VarA0, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
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
            r28 r28VarD2 = jfc.d(jfc.o(r28VarD, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            ip7 ip7Var = ip7.COMPACT;
            ((jp7) p65Var.j(sn3Var)).getClass();
            if (ip7Var == jp7.a(p65Var)) {
                r28VarD = jfc.d(r28VarD, 1.0f);
            }
            r28 r28VarF = w2g.F(r28VarD, 24.0f, 40.0f, 24.0f, 40.0f);
            String strR = vo7.R(p65Var, R.string.see_more_recommendations);
            xn7 xn7Var = xn7.M;
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new g4b(3, x45Var, str);
                p65Var.j0(objM);
            }
            fo7.j((m45) objM, strR, xn7Var, r28VarF, false, null, p65Var, 384, 48);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new f4b(i, x45Var, str);
        }
    }

    public static final void f(r28 r28Var, mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1854833411);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = id.k;
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H(6, mz1Var, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(r28Var, mz1Var, i);
        }
    }

    public static final void g(int i, int i2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-453014044);
        int i4 = i2 & 1;
        if (i4 != 0) {
            i3 = i | 6;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i3 = (p65Var.f(r28Var2) ? 4 : 2) | i;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28Var3 = i4 != 0 ? o28Var : r28Var2;
            r28 r28VarD = jfc.d(r28Var3, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarL = jfc.l(w2g.G(o28Var, 24.0f, 12.0f, 0.0f, 12.0f, 4), hl0.XS.m114getSizeD9Ej5fM());
            sn3 sn3Var = kt7.b;
            dy0.a(flb.a0(r28VarL, ((zo7) p65Var.j(sn3Var)).c, bmb.a), p65Var, 0);
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            sn3 sn3Var2 = jt7.c;
            ok7.s(0.0f, 48, 12, 0L, p65Var, w2g.G(o28Var, 16.0f, 18.0f, 16.0f, 0.0f, 8), ((bu7) p65Var.j(sn3Var2)).j);
            ok7.s(0.0f, 48, 12, 0L, p65Var, w2g.G(o28Var, 16.0f, 6.0f, 16.0f, 0.0f, 8), ((bu7) p65Var.j(sn3Var2)).m);
            ok7.s(0.0f, 48, 12, 0L, p65Var, w2g.G(o28Var, 16.0f, 0.0f, 16.0f, 0.0f, 10), ((bu7) p65Var.j(sn3Var2)).m);
            ok7.s(0.0f, 48, 12, 0L, p65Var, w2g.G(o28Var, 16.0f, 0.0f, 16.0f, 12.0f, 2), ((bu7) p65Var.j(sn3Var2)).m);
            p65Var.p(true);
            dy0.a(flb.a0(jfc.m(w2g.G(o28Var, 0.0f, 18.0f, 24.0f, 0.0f, 9), 90.0f, 32.0f), ((zo7) p65Var.j(sn3Var)).c, bmb.a(16.0f)), p65Var, 0);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var2, i, i2, 22);
        }
    }

    public static final void h(ugd ugdVar, Context context, final boolean z, final String str, final long j) {
        if (bkd.c(j) || str.length() == 0) {
            return;
        }
        PackageManager packageManager = context.getPackageManager();
        final Context context2 = context;
        List list = (List) g01.p.invoke(context2);
        if (list.isEmpty()) {
            return;
        }
        x68 x68Var = ugdVar.a;
        x68 x68Var2 = ugdVar.a;
        jhd jhdVar = jhd.b;
        x68Var.a(jhdVar);
        int size = list.size();
        int i = 0;
        while (i < size) {
            final ResolveInfo resolveInfo = (ResolveInfo) list.get(i);
            x68Var2.a(new fhd(new f2a(i), resolveInfo.loadLabel(packageManager).toString(), 0, new x45() { // from class: g2a
                @Override // defpackage.x45
                public final Object invoke(Object obj) {
                    g01.q.s(context2, resolveInfo, Boolean.valueOf(z), str, new bkd(j));
                    ((khd) obj).close();
                    return c1e.a;
                }
            }));
            i++;
            context2 = context;
        }
        x68Var2.a(jhdVar);
    }

    public static final Object i(float f, float f2, float f3, ww wwVar, b55 b55Var, p4d p4dVar) {
        hud hudVar = d46.i;
        Float f4 = new Float(f);
        Float f5 = new Float(f2);
        Float f6 = new Float(f3);
        x45 x45Var = hudVar.a;
        dx dxVarC = (dx) x45Var.invoke(f6);
        if (dxVarC == null) {
            dxVarC = ((dx) x45Var.invoke(f4)).c();
        }
        dx dxVar = dxVarC;
        Object objJ = j(new xw(hudVar, f4, dxVar, 56), new sfd(wwVar, hudVar, f4, f5, dxVar), Long.MIN_VALUE, new zzb(10, b55Var), p4dVar);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objJ != tb2Var) {
            objJ = c1eVar;
        }
        return objJ == tb2Var ? objJ : c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0107 A[Catch: CancellationException -> 0x003b, TryCatch #3 {CancellationException -> 0x003b, blocks: (B:14:0x0036, B:46:0x00f2, B:48:0x0107, B:50:0x0125, B:51:0x012a), top: B:72:0x0036 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x013e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object j(defpackage.xw r24, defpackage.nw r25, long r26, final defpackage.x45 r28, defpackage.p92 r29) {
        /*
            Method dump skipped, instruction units count: 356
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tr7.j(xw, nw, long, x45, p92):java.lang.Object");
    }

    public static /* synthetic */ Object k(float f, float f2, ww wwVar, b55 b55Var, p4d p4dVar, int i) {
        if ((i & 8) != 0) {
            wwVar = f76.P(0.0f, 0.0f, null, 7);
        }
        return i(f, f2, 0.0f, wwVar, b55Var, p4dVar);
    }

    public static final Object l(xw xwVar, xv2 xv2Var, boolean z, x45 x45Var, p92 p92Var) {
        Object objJ = j(xwVar, new wv2(xv2Var, xwVar.a, xwVar.b.getValue(), xwVar.c), z ? xwVar.d : Long.MIN_VALUE, x45Var, p92Var);
        return objJ == tb2.COROUTINE_SUSPENDED ? objJ : c1e.a;
    }

    public static final Object m(xw xwVar, Float f, ww wwVar, boolean z, x45 x45Var, p92 p92Var) {
        Object objJ = j(xwVar, new sfd(wwVar, xwVar.a, xwVar.b.getValue(), f, xwVar.c), z ? xwVar.d : Long.MIN_VALUE, x45Var, p92Var);
        return objJ == tb2.COROUTINE_SUSPENDED ? objJ : c1e.a;
    }

    public static /* synthetic */ Object n(xw xwVar, Float f, ww wwVar, boolean z, x45 x45Var, p92 p92Var, int i) {
        if ((i & 2) != 0) {
            wwVar = f76.P(0.0f, 0.0f, null, 7);
        }
        ww wwVar2 = wwVar;
        if ((i & 4) != 0) {
            z = false;
        }
        boolean z2 = z;
        if ((i & 8) != 0) {
            x45Var = new d3d(2);
        }
        return m(xwVar, f, wwVar2, z2, x45Var, p92Var);
    }

    public static f5f o(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        View view = (View) p65Var.j(eo.f);
        f5f f5fVarT = t(view);
        boolean zH = p65Var.h(f5fVarT) | p65Var.h(view);
        Object objM = p65Var.M();
        if (zH || objM == w12.a) {
            objM = new vrd(f5fVarT, 17, view);
            p65Var.j0(objM);
        }
        kyd.h(f5fVarT, (x45) objM, p65Var);
        return f5fVarT;
    }

    public static final blb p(Context context, Class cls, String str) {
        if (muc.b0(str)) {
            ay0.e("Cannot build a database with null or empty name. If you are trying to create an in memory database, use Room.inMemoryDatabaseBuilder");
            return null;
        }
        if (!str.equals(":memory:")) {
            return new blb(context, cls, str);
        }
        ay0.e("Cannot build a database with the special name ':memory:'. If you are trying to create an in memory database, use Room.inMemoryDatabaseBuilder");
        return null;
    }

    public static final void q(vw vwVar, long j, float f, nw nwVar, xw xwVar, x45 x45Var) {
        long jC = f == 0.0f ? nwVar.c() : (long) ((j - vwVar.c) / f);
        vwVar.g = j;
        vwVar.e.setValue(nwVar.g(jC));
        vwVar.f = nwVar.e(jC);
        if (nwVar.f(jC)) {
            vwVar.h = vwVar.g;
            vwVar.i.setValue(Boolean.FALSE);
        }
        z(vwVar, xwVar);
        x45Var.invoke(vwVar);
    }

    public static String r(d21 d21Var) {
        StringBuilder sb = new StringBuilder(d21Var.size());
        for (int i = 0; i < d21Var.size(); i++) {
            byte bD = d21Var.d(i);
            if (bD == 34) {
                sb.append("\\\"");
            } else if (bD == 39) {
                sb.append("\\'");
            } else if (bD != 92) {
                switch (bD) {
                    case 7:
                        sb.append("\\a");
                        break;
                    case 8:
                        sb.append("\\b");
                        break;
                    case 9:
                        sb.append("\\t");
                        break;
                    case 10:
                        sb.append("\\n");
                        break;
                    case 11:
                        sb.append("\\v");
                        break;
                    case 12:
                        sb.append("\\f");
                        break;
                    case 13:
                        sb.append("\\r");
                        break;
                    default:
                        if (bD < 32 || bD > 126) {
                            sb.append('\\');
                            sb.append((char) (((bD >>> 6) & 3) + 48));
                            sb.append((char) (((bD >>> 3) & 7) + 48));
                            sb.append((char) ((bD & 7) + 48));
                        } else {
                            sb.append((char) bD);
                        }
                        break;
                }
            } else {
                sb.append("\\\\");
            }
        }
        return sb.toString();
    }

    public static final float s(ib2 ib2Var) {
        a48 a48Var = (a48) ib2Var.o0(wz7.f);
        float fU = a48Var != null ? a48Var.U() : 1.0f;
        if (fU >= 0.0f) {
            return fU;
        }
        zx9.b("negative scale factor");
        return fU;
    }

    public static f5f t(View view) {
        f5f f5fVar;
        WeakHashMap weakHashMap = f5f.w;
        synchronized (weakHashMap) {
            try {
                Object f5fVar2 = weakHashMap.get(view);
                if (f5fVar2 == null) {
                    f5fVar2 = new f5f(view);
                    weakHashMap.put(view, f5fVar2);
                }
                f5fVar = (f5f) f5fVar2;
            } catch (Throwable th) {
                throw th;
            }
        }
        return f5fVar;
    }

    public static final int u(int i, int i2) {
        return (i >> i2) & 31;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:112:0x0299  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x0367  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x036f  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x0380  */
    /* JADX WARN: Removed duplicated region for block: B:180:0x0386  */
    /* JADX WARN: Removed duplicated region for block: B:191:0x03c8  */
    /* JADX WARN: Removed duplicated region for block: B:237:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0171 A[PHI: r6 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29
      0x0171: PHI (r6v12 no) = (r6v11 no), (r6v13 no) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r20v6 boolean) = (r20v5 boolean), (r20v7 boolean) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r21v7 nnd) = (r21v6 nnd), (r21v8 nnd) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r22v5 mx) = (r22v4 mx), (r22v6 mx) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r23v5 jp) = (r23v4 jp), (r23v6 jp) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r24v6 z82) = (r24v5 z82), (r24v7 z82) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r25v6 java.lang.Boolean) = (r25v5 java.lang.Boolean), (r25v7 java.lang.Boolean) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r26v8 vkb) = (r26v7 vkb), (r26v9 vkb) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r27v6 boolean) = (r27v5 boolean), (r27v7 boolean) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r28v6 boolean) = (r28v5 boolean), (r28v7 boolean) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]
      0x0171: PHI (r29v6 java.lang.Integer) = (r29v5 java.lang.Integer), (r29v7 java.lang.Integer) binds: [B:8:0x004b, B:64:0x016f] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void v(android.view.ViewStructure r38, defpackage.aq6 r39, android.view.autofill.AutofillId r40, java.lang.String r41, defpackage.cxa r42) {
        /*
            Method dump skipped, instruction units count: 994
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tr7.v(android.view.ViewStructure, aq6, android.view.autofill.AutofillId, java.lang.String, cxa):void");
    }

    public static final Collection w(Collection collection, x45 x45Var) {
        collection.getClass();
        if (collection.size() <= 1) {
            return collection;
        }
        LinkedList linkedList = new LinkedList(collection);
        zgc zgcVar = new zgc();
        while (!linkedList.isEmpty()) {
            Object objX0 = bu1.x0(linkedList);
            zgc zgcVar2 = new zgc();
            ArrayList arrayListG = cx8.g(objX0, linkedList, x45Var, new z(25, zgcVar2));
            if (arrayListG.size() == 1 && zgcVar2.isEmpty()) {
                Object objZ0 = bu1.Z0(arrayListG);
                objZ0.getClass();
                zgcVar.add(objZ0);
            } else {
                Object objS = cx8.s(arrayListG, x45Var);
                c41 c41Var = (c41) x45Var.invoke(objS);
                for (Object obj : arrayListG) {
                    obj.getClass();
                    if (!cx8.k(c41Var, (c41) x45Var.invoke(obj))) {
                        zgcVar2.add(obj);
                    }
                }
                if (!zgcVar2.isEmpty()) {
                    zgcVar.addAll(zgcVar2);
                }
                zgcVar.add(objS);
            }
        }
        return zgcVar;
    }

    public static final int y(int i) {
        int i2 = 306783378 & i;
        int i3 = 613566756 & i;
        return (i & (-920350135)) | (i3 >> 1) | i2 | ((i2 << 1) & i3);
    }

    public static final void z(vw vwVar, xw xwVar) {
        xwVar.b.setValue(vwVar.e.getValue());
        dx dxVar = xwVar.c;
        dx dxVar2 = vwVar.f;
        int iB = dxVar.b();
        for (int i = 0; i < iB; i++) {
            dxVar.e(i, dxVar2.a(i));
        }
        xwVar.e = vwVar.h;
        xwVar.d = vwVar.g;
        xwVar.f = ((Boolean) vwVar.i.getValue()).booleanValue();
    }

    public abstract hkb x(xvd xvdVar, qn6 qn6Var);
}
