package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import com.adobe.internal.xmp.XMPException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.models.BillingPeriod;
import gen.model.MediumMembershipType;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qo7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static Thread d;
    public static final /* synthetic */ int e = 0;

    public static final void A(db8 db8Var, Bundle bundle) {
        vob vobVarA;
        db8Var.getClass();
        va8 va8VarG = db8Var.b.g();
        Integer numValueOf = va8VarG != null ? Integer.valueOf(va8VarG.b.c) : null;
        Integer num = (numValueOf == null || numValueOf.intValue() != 0) ? numValueOf : null;
        if (num == null) {
            ay0.e("Current destination id is null");
            return;
        }
        bundle.putInt("navController:destination_id", num.intValue());
        ba8 ba8VarB = db8Var.b();
        if (ba8VarB == null || (vobVarA = ba8VarB.a()) == null) {
            return;
        }
        vobVarA.d("navController:destination_result", bundle);
    }

    public static Set B(Object obj) {
        Set setSingleton = Collections.singleton(obj);
        setSingleton.getClass();
        return setSingleton;
    }

    public static final adb C(adb adbVar) {
        adbVar.getClass();
        ycb ycbVarM = adbVar.m();
        fdb fdbVar = adbVar.g;
        ycbVarM.g = new r1e(fdbVar.m(), fdbVar.f());
        return ycbVarM.a();
    }

    public static final MediumMembershipType D(zw7 zw7Var, BillingPeriod billingPeriod, String str) {
        String strConcat;
        zw7Var.getClass();
        billingPeriod.getClass();
        int i = nw7.b[zw7Var.ordinal()];
        if (i == 1) {
            int i2 = nw7.a[billingPeriod.ordinal()];
            if (i2 == 1) {
                return MediumMembershipType.MEDIUM_MONTHLY;
            }
            if (i2 == 2) {
                return MediumMembershipType.MEDIUM_YEARLY;
            }
            ygf.a();
            return null;
        }
        if (i == 2) {
            int i3 = nw7.a[billingPeriod.ordinal()];
            if (i3 == 1) {
                return MediumMembershipType.PREMIUM_MEDIUM_MONTHLY;
            }
            if (i3 == 2) {
                return MediumMembershipType.PREMIUM_MEDIUM_YEARLY;
            }
            ygf.a();
            return null;
        }
        if (i != 3) {
            ygf.a();
            return null;
        }
        if (str != null) {
            strConcat = "Unsupported membership type for plan: ".concat(str);
        } else {
            strConcat = "Unsupported membership type: " + zw7Var;
        }
        lg8.i(strConcat);
        return null;
    }

    public static int E(int i, int i2) {
        if (i2 < 0) {
            ay0.e("cannot store more than Integer.MAX_VALUE elements");
            return 0;
        }
        if (i2 <= i) {
            return i;
        }
        int iHighestOneBit = i + (i >> 1) + 1;
        if (iHighestOneBit < i2) {
            iHighestOneBit = Integer.highestOneBit(i2 - 1) << 1;
        }
        if (iHighestOneBit < 0) {
            return Integer.MAX_VALUE;
        }
        return iHighestOneBit;
    }

    public static int F(int i, int i2) {
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
        switch (i5g.a[roundingMode.ordinal()]) {
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

    public static final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1680713758);
        if (p65Var.P(i & 1, i != 0)) {
            b(w2g.C(jfc.d(o28.b, 1.0f), 24.0f), 0L, null, 0.0f, null, false, k50.b, p65Var, 1572870, 62);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x012d  */
    /* JADX WARN: Removed duplicated region for block: B:61:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(final defpackage.r28 r25, long r26, defpackage.cu0 r28, float r29, defpackage.m45 r30, boolean r31, defpackage.mz1 r32, defpackage.x12 r33, final int r34, final int r35) {
        /*
            Method dump skipped, instruction units count: 313
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qo7.b(r28, long, cu0, float, m45, boolean, mz1, x12, int, int):void");
    }

    public static final void c(op9 op9Var, yrb yrbVar, fp9 fp9Var, gp9 gp9Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        Object bo9Var;
        fp9 fp9Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1004460541);
        int i2 = i | (p65Var2.f(op9Var) ? 4 : 2) | (p65Var2.f(yrbVar) ? 32 : 16) | (p65Var2.f(fp9Var) ? 256 : 128) | (p65Var2.f(gp9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            boolean z = (op9Var instanceof lp9) && ((lp9) op9Var).b;
            boolean z2 = (i2 & 896) == 256;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                bo9Var = new bo9(0, fp9Var, fp9.class, "onRefresh", "onRefresh()V", 0, 7);
                fp9Var2 = fp9Var;
                p65Var2.j0(bo9Var);
            } else {
                fp9Var2 = fp9Var;
                bo9Var = objM;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) bo9Var), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(509155089, new ep9(yrbVar, op9Var, fp9Var2, gp9Var), p65Var2), p65Var, (i2 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(op9Var, yrbVar, fp9Var, gp9Var, r28Var, i, 8);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:138:0x05be  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x05c1  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x05ca  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x05cc  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x05dd  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x05ee  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x05f1  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x05ff  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x0632  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x0704  */
    /* JADX WARN: Removed duplicated region for block: B:187:0x0718  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x07ea  */
    /* JADX WARN: Removed duplicated region for block: B:214:0x0822  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x0826  */
    /* JADX WARN: Removed duplicated region for block: B:218:0x086a  */
    /* JADX WARN: Removed duplicated region for block: B:219:0x086e  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x0883  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x0888  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x088c  */
    /* JADX WARN: Removed duplicated region for block: B:227:0x088e  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x089e  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x08c5  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x08ce  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(final defpackage.lp9 r56, final defpackage.fp9 r57, defpackage.gp9 r58, defpackage.x12 r59, int r60) {
        /*
            Method dump skipped, instruction units count: 2299
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qo7.d(lp9, fp9, gp9, x12, int):void");
    }

    public static final void e(mp9 mp9Var, fp9 fp9Var, x12 x12Var, int i) {
        p65 p65Var;
        int i2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1645700555);
        int i3 = (p65Var2.f(mp9Var) ? 4 : 2) | i | (p65Var2.f(fp9Var) ? 32 : 16);
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var2.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            b24 b24Var = mp9Var.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new bo9(0, fp9Var, fp9.class, "onRefresh", "onRefresh()V", 0, 8);
                p65Var2.j0(objM);
            }
            m45 m45Var = (m45) ((qh6) objM);
            i2 = 18;
            iq7.a(b24Var, null, null, null, null, null, m45Var, null, p65Var2, 0, 190);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            i2 = 18;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(mp9Var, fp9Var, i, i2);
        }
    }

    public static final void f(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1033230765);
        if (p65Var.P(i & 1, i != 0)) {
            sn3 sn3Var = kt7.a;
            jp7 jp7Var = (jp7) p65Var.j(sn3Var);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            il7.l(stc.M, null, 0L, null, p65Var, 6, 14);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarJ2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            ur7.i(0, 0L, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sw8(i, 4);
        }
    }

    public static final void g(op9 op9Var, yrb yrbVar, fp9 fp9Var, gp9 gp9Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        float f;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1760270384);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(op9Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(yrbVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= (i & 512) == 0 ? p65Var.f(fp9Var) : p65Var.h(fp9Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(gp9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            yrbVar.getClass();
            if (yrbVar.a.g() == 0) {
                f = 0.0f;
            } else {
                jy8 jy8Var = o00.a;
                f = 4.0f;
            }
            upc upcVarA = zu.a(f, null, "Scroll elevation", p65Var, 384, 10);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new hb8(29);
                p65Var.j0(objM);
            }
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "post_stats_screen"), pxf.E(-1166063444, new sn8(fp9Var, 19, upcVarA), p65Var), null, null, null, 0, 0L, 0L, null, pxf.E(-224455615, new ep9(op9Var, yrbVar, fp9Var, gp9Var), p65Var), p65Var, 805306416, 508);
            p65Var = p65Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(op9Var, yrbVar, fp9Var, gp9Var, r28Var, i, 11);
        }
    }

    public static final void h(String str, String str2, ap9 ap9Var, r28 r28Var, wp9 wp9Var, x12 x12Var, int i) {
        wp9 wp9Var2;
        wp9 wp9Var3;
        int i2;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1930514214);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(ap9Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new bb0(str, str2, 7);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    wp9Var3 = (wp9) to7.z(n1b.a.b(wp9.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i3 & (-57345);
                }
            } else {
                p65Var.S();
                i2 = i3 & (-57345);
                wp9Var3 = wp9Var;
            }
            p65Var.q();
            g((op9) guc.z(wp9Var3.m, p65Var, 0).getValue(), wgf.K(p65Var), new fp9(ap9Var, wp9Var3), new gp9(ap9Var), r28Var, p65Var, (i2 << 3) & 57344);
            wp9Var2 = wp9Var3;
        } else {
            p65Var.S();
            wp9Var2 = wp9Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) ap9Var, r28Var, (que) wp9Var2, i, 7);
        }
    }

    public static void i(String str) throws XMPException {
        if (str.length() != 0) {
            return;
        }
        ywb.e(4, "Empty property name");
    }

    public static void j(String str) throws XMPException {
        if (str == null || str.length() == 0) {
            ywb.e(4, "Empty schema namespace URI");
        }
    }

    public static p1c k(p1c p1cVar) {
        dh7 dh7Var = p1cVar.a;
        dh7Var.b();
        return dh7Var.i > 0 ? p1cVar : p1c.b;
    }

    public static ff5 l(String str, w3 w3Var, String str2) {
        String str3;
        String str4 = ff5.j;
        int i = 1;
        ff5 ff5VarH0 = xz5.h0(w3Var, String.format(Locale.US, "%s/app_indexing", Arrays.copyOf(new Object[]{str2}, 1)), null, null);
        Bundle bundle = ff5VarH0.d;
        if (bundle == null) {
            bundle = new Bundle();
        }
        bundle.putString("tree", str);
        Context contextA = f94.a();
        try {
            str3 = contextA.getPackageManager().getPackageInfo(contextA.getPackageName(), 0).versionName;
            str3.getClass();
        } catch (PackageManager.NameNotFoundException unused) {
            str3 = "";
        }
        bundle.putString("app_version", str3);
        bundle.putString("platform", "android");
        bundle.putString("request_type", "app_indexing");
        bundle.putString("device_session_id", fq1.a());
        ff5VarH0.d = bundle;
        ff5VarH0.j(new s40(i));
        return ff5VarH0;
    }

    public static final String m(String str, f67 f67Var) {
        if (str.length() <= 0) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        char cCharAt = str.charAt(0);
        sb.append((Object) (Character.isLowerCase(cCharAt) ? kyd.j0(cCharAt, f67Var.a) : String.valueOf(cCharAt)));
        sb.append(str.substring(1));
        return sb.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:151:0x0272  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.p9f n(java.lang.String r15) throws com.adobe.internal.xmp.XMPException {
        /*
            Method dump skipped, instruction units count: 638
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qo7.n(java.lang.String):p9f");
    }

    public static Collection o(ev7 ev7Var, p83 p83Var, int i) {
        if ((i & 1) != 0) {
            p83Var = p83.m;
        }
        ev7.a.getClass();
        return ev7Var.e(p83Var, h06.x);
    }

    public static o1b p(List list) {
        Iterator it2 = list.iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
        return o1b.ALLOW;
    }

    public static HashSet q(Object... objArr) {
        HashSet hashSet = new HashSet(ei7.P(objArr.length));
        k80.L0(objArr, hashSet);
        return hashSet;
    }

    public static final boolean r(Bundle bundle, Bundle bundle2) {
        if (bundle.size() != bundle2.size()) {
            return false;
        }
        Set<String> setKeySet = bundle.keySet();
        Set<String> setKeySet2 = bundle2.keySet();
        setKeySet2.getClass();
        if (!setKeySet.containsAll(setKeySet2)) {
            return false;
        }
        Set<String> setKeySet3 = bundle.keySet();
        setKeySet3.getClass();
        for (String str : setKeySet3) {
            Object obj = bundle.get(str);
            Object obj2 = bundle2.get(str);
            if ((obj instanceof Bundle) && (obj2 instanceof Bundle)) {
                if (!r((Bundle) obj, (Bundle) obj2)) {
                    return false;
                }
            } else if (!g76.L(obj, obj2)) {
                return false;
            }
        }
        return true;
    }

    public static LinkedHashSet s(Set set, Object obj) {
        set.getClass();
        LinkedHashSet linkedHashSet = new LinkedHashSet(ei7.P(set.size()));
        boolean z = false;
        for (Object obj2 : set) {
            boolean z2 = true;
            if (!z && g76.L(obj2, obj)) {
                z = true;
                z2 = false;
            }
            if (z2) {
                linkedHashSet.add(obj2);
            }
        }
        return linkedHashSet;
    }

    public static Set t(Set set, Iterable iterable) {
        set.getClass();
        Collection<?> collectionM1 = iterable instanceof Collection ? (Collection) iterable : bu1.m1(iterable);
        if (collectionM1.isEmpty()) {
            return bu1.q1(set);
        }
        if (!(collectionM1 instanceof Set)) {
            LinkedHashSet linkedHashSet = new LinkedHashSet(set);
            linkedHashSet.removeAll(collectionM1);
            return linkedHashSet;
        }
        LinkedHashSet linkedHashSet2 = new LinkedHashSet();
        for (Object obj : set) {
            if (!((Set) collectionM1).contains(obj)) {
                linkedHashSet2.add(obj);
            }
        }
        return linkedHashSet2;
    }

    public static k49 u(Object obj) {
        return new k49(obj, xsa.h);
    }

    public static LinkedHashSet v(Set set, Iterable iterable) {
        set.getClass();
        iterable.getClass();
        Integer numValueOf = iterable instanceof Collection ? Integer.valueOf(((Collection) iterable).size()) : null;
        LinkedHashSet linkedHashSet = new LinkedHashSet(ei7.P(numValueOf != null ? set.size() + numValueOf.intValue() : set.size() * 2));
        linkedHashSet.addAll(set);
        bu1.n0(iterable, linkedHashSet);
        return linkedHashSet;
    }

    public static LinkedHashSet w(Set set, Object obj) {
        set.getClass();
        LinkedHashSet linkedHashSet = new LinkedHashSet(ei7.P(set.size() + 1));
        linkedHashSet.addAll(set);
        linkedHashSet.add(obj);
        return linkedHashSet;
    }

    public static final oob x(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(1967007413);
        Object[] objArr = new Object[0];
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = new lg9(18);
            p65Var.j0(objM);
        }
        oob oobVar = (oob) hp7.F(objArr, oob.e, (m45) objM, p65Var, 384);
        oobVar.c = (qob) p65Var.j(sob.a);
        p65Var.p(false);
        return oobVar;
    }

    public static final l78 y(Object obj, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = u(obj);
            p65Var.j0(objM);
        }
        l78 l78Var = (l78) objM;
        l78Var.setValue(obj);
        return l78Var;
    }

    public static boolean z(db8 db8Var, int i) {
        db8Var.getClass();
        ka8 ka8Var = db8Var.b;
        va8 va8VarG = ka8Var.g();
        if (va8VarG == null || va8VarG.b.c != i) {
            return true;
        }
        return ka8Var.m(i, true);
    }
}
