package defpackage;

import android.R;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Shader;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Patterns;
import android.view.inputmethod.ExtractedText;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusRawInfoMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.proto.event.GiveTipPresented;
import gen.model.SourceParameter;
import java.io.IOException;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class yi2 implements uy3 {
    public static final /* synthetic */ int F = 0;
    public static final /* synthetic */ int G = 0;
    public static final /* synthetic */ int H = 0;
    public static final /* synthetic */ int I = 0;
    public static dm2 a;
    public static final mz1 n;
    public static final mz1 o;
    public static final mz1 p;
    public static final mz1 q;
    public static final mz1 t;
    public static final mz1 u;
    public static final mz1 v;
    public static final mz1 w;
    public static final mz1 x;
    public static final mz1 y;
    public static final zw b = new zw(Float.POSITIVE_INFINITY);
    public static final ax c = new ax(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);
    public static final bx d = new bx(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);
    public static final cx e = new cx(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);
    public static final zw f = new zw(Float.NEGATIVE_INFINITY);
    public static final ax g = new ax(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);
    public static final bx h = new bx(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);
    public static final cx i = new cx(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);
    public static final mz1 j = new mz1(new e02(20), false, -1160446762);
    public static final mz1 k = new mz1(new e02(21), false, -634466593);
    public static final mz1 l = new mz1(new a02(27), false, 1090678577);
    public static final mz1 m = new mz1(new n02(6), false, -380991831);
    public static final mz1 r = new mz1(new m02(12), false, 1286517675);
    public static final mz1 s = new mz1(new m02(13), false, -984950070);
    public static final b70 z = new b70(1);
    public static final bx3 A = new bx3(1);
    public static final int[] B = {R.attr.theme, com.medium.reader.R.attr.theme};
    public static final int[] C = {com.medium.reader.R.attr.materialThemeOverlay};
    public static final vb6 D = new vb6(2);
    public static final String[] E = {"GmsCore_OpenSSL", "AndroidOpenSSL", "Conscrypt"};

    static {
        int i2 = 9;
        n = new mz1(new n02(i2), false, 1142770791);
        int i3 = 11;
        o = new mz1(new m02(i3), false, -1638089150);
        int i4 = 10;
        p = new mz1(new n02(i4), false, -1823736238);
        q = new mz1(new n02(i3), false, -2071704432);
        int i5 = 7;
        t = new mz1(new n02(i5), false, 2078232113);
        int i6 = 8;
        u = new mz1(new n02(i6), false, 1830263919);
        v = new mz1(new m02(i5), false, 893518730);
        w = new mz1(new m02(i6), false, 996835056);
        x = new mz1(new m02(i2), false, 42472523);
        y = new mz1(new m02(i4), false, -1304245485);
    }

    public static final void A(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1927246191);
        boolean z2 = false;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarN = bgf.N(m40.V(r28Var, p65Var, 6), "loading_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-383916999);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, z2);
                long j3 = p65Var.T;
                int i4 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
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
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i4);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, z2);
                long j4 = p65Var.T;
                int i5 = (int) (j4 ^ (j4 >>> c2));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                il7.l(stc.M, null, 0L, null, p65Var, 6, 14);
                iR = wgd.r(p65Var, true, true, iR, 1);
                z2 = false;
                c2 = ' ';
            }
            p65Var.p(z2);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 13);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v18, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r2v20 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r5v9, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    public static final void B(bme bmeVar, gle gleVar, r28 r28Var, x12 x12Var, int i2) {
        ?? r5;
        boolean z2;
        ?? r2;
        String strQ;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1121472089);
        int i3 = i2 | (p65Var.f(bmeVar) ? 4 : 2) | (p65Var.f(gleVar) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "empty_state"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            if (bmeVar.a) {
                z2 = false;
                strQ = km4.w(p65Var, -769359811, com.medium.reader.R.string.user_activity_empty_reposts_current_user, p65Var, false);
                r2 = 1;
            } else {
                z2 = false;
                p65Var.Y(-769262192);
                String strW = bmeVar.b;
                if (strW == null) {
                    strW = km4.w(p65Var, -579000264, com.medium.reader.R.string.common_unknown_user, p65Var, false);
                } else {
                    p65Var.Y(-579000822);
                    p65Var.p(false);
                }
                r2 = 1;
                strQ = vo7.Q(com.medium.reader.R.string.user_activity_empty_reposts_other_user, new Object[]{strW}, p65Var);
                p65Var.p(false);
            }
            boolean z3 = z2;
            jjd.b(strQ, iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 130044);
            ?? r52 = p65Var;
            r52.p(r2);
            r52.p(r2);
            ?? r7 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? r2 : z3;
            Object objM = r52.M();
            if (r7 != 0 || objM == w12.a) {
                objM = new ele(gleVar, null, r2);
                r52.j0(objM);
            }
            kyd.k(r52, (b55) objM, c1e.a);
            r5 = r52;
        } else {
            p65 p65Var2 = p65Var;
            p65Var2.S();
            r5 = p65Var2;
        }
        mwa mwaVarS = r5.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 26, bmeVar, gleVar, r28Var);
        }
    }

    public static final void C(nr8 nr8Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        nr8Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1789011383);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(nr8Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            WeakHashMap weakHashMap = f5f.w;
            zy6 zy6Var = new zy6(new y0e(tr7.o(p65Var).f, tr7.o(p65Var).b), ur7.h | 16);
            ((jp7) p65Var.j(kt7.a)).getClass();
            boolean z2 = jp7.a(p65Var) == ip7.COMPACT;
            r28 r28VarP0 = op8.p0(flb.a0(jfc.c, nr8Var.b, rv8.r), zy6Var);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarP0);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(com.medium.reader.R.drawable.ic_onboarding_starter_pack_scribble, 0, p65Var);
            bs0 bs0Var = new bs0(5, uu1.b(nr8Var.d, nr8Var.c));
            o28 o28Var = o28.b;
            w2g.e(c09VarJ, null, z2 ? jfc.d(o28Var, 1.0f) : iy0.a.a(jfc.d(o28Var, 1.0f), z46.h), null, v82.d, 0.0f, bs0Var, p65Var, 24632, 40);
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(nr8Var, r28Var, i2, 3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x01eb  */
    /* JADX WARN: Removed duplicated region for block: B:103:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0104  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x017a  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01c2  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01df  */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void D(defpackage.roc r28, defpackage.loc r29, defpackage.koc r30, defpackage.nr8 r31, defpackage.r28 r32, defpackage.nhc r33, defpackage.x12 r34, int r35, int r36) {
        /*
            Method dump skipped, instruction units count: 507
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yi2.D(roc, loc, koc, nr8, r28, nhc, x12, int, int):void");
    }

    public static final void E(String str, String str2, eoc eocVar, r28 r28Var, uoc uocVar, x12 x12Var, int i2) {
        r28 r28Var2;
        uoc uocVar2;
        int i3;
        uoc uocVar3;
        r28 r28Var3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(131383950);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(eocVar) ? 256 : 128) | 11264;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z2 = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new bb0(str, str2, 17);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-57345);
                    uocVar3 = (uoc) to7.z(n1b.a.b(uoc.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                r28Var3 = r28Var;
                uocVar3 = uocVar;
            }
            p65Var.q();
            nr8 nr8Var = uocVar3.p;
            l78 l78VarZ = guc.z(uocVar3.y, p65Var, 0);
            l78 l78VarZ2 = guc.z(uocVar3.v, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            boolean zF = p65Var.f(uocVar3) | ((i3 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new koc(eocVar, uocVar3);
                p65Var.j0(objM2);
            }
            D((roc) l78VarZ.getValue(), (loc) l78VarZ2.getValue(), (koc) objM2, nr8Var, r28Var3, nhcVarF, p65Var, 24576, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(uocVar3);
            Object objM3 = p65Var.M();
            n92 n92Var = null;
            if (zH || objM3 == uobVar) {
                objM3 = new obb(uocVar3, n92Var, 8);
                p65Var.j0(objM3);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(uocVar3) | p65Var.f(nhcVarF) | p65Var.h(resources);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                mw9 mw9Var = new mw9(uocVar3, nhcVarF, resources, n92Var, 29);
                p65Var.j0(mw9Var);
                objM4 = mw9Var;
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
            r28Var2 = r28Var3;
            uocVar2 = uocVar3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            uocVar2 = uocVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) eocVar, r28Var2, (que) uocVar2, i2, 27);
        }
    }

    public static final void F(int i2, x12 x12Var, m45 m45Var, r28 r28Var) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-764833784);
        int i3 = (p65Var.h(m45Var) ? 4 : 2) | i2 | 48;
        int i4 = 6;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            long j2 = xo7.i;
            zy6 zy6VarB = rod.b(p65Var);
            long j3 = uu1.g;
            r28Var2 = o28.b;
            qk7.f(rv8.n, r28Var2, m45Var, null, null, null, j2, j3, zy6VarB, p65Var, 12582966 | ((i3 << 6) & 896), 56);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(m45Var, r28Var2, i2, i4);
        }
    }

    public static final void G(te0 te0Var, cv9 cv9Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-36881966);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(te0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(cv9Var) ? 32 : 16;
        }
        int i4 = 0;
        if (!p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.S();
        } else {
            if (te0Var.c == null) {
                ay0.e("Required value was null.");
                return;
            }
            o28 o28Var = o28.b;
            r28 r28VarL = jfc.l(w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 4.0f, 6), 38.0f);
            amb ambVar = bmb.a;
            r28 r28VarY = r40.y(r28VarL, ambVar);
            sn3 sn3Var = kt7.b;
            r28 r28VarB = bo.B(r28VarY, 1.0f, ((zo7) p65Var.j(sn3Var)).d, ambVar);
            boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new pe0(cv9Var, te0Var, i4);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(hlg.r(r28VarB, false, null, null, (m45) objM, 15), "cta_tip_author");
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i5 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            qv5.b(vn7.J(com.medium.reader.R.drawable.ic_tip_24, 0, p65Var), vo7.R(p65Var, com.medium.reader.R.string.author_footer_tip_content_description), iy0.a.a(o28Var, ar0Var), ((zo7) p65Var.j(sn3Var)).n, p65Var, 8, 0);
            p65Var.p(true);
            String str = te0Var.b;
            String str2 = te0Var.a.a;
            SourceParameter sourceParameter = te0Var.d;
            str.getClass();
            sw9 sw9Var = cv9Var.a;
            if (!sw9Var.V0) {
                sw9Var.V0 = true;
                ty2 ty2Var = sw9Var.m;
                String str3 = sw9Var.d;
                String strU = gp7.u(sourceParameter);
                String str4 = sw9Var.D0;
                ty2Var.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(ty2Var.a, new GiveTipPresented(null, str, str2, null, 9, null), str3, strU, false, null, str4, 24);
            }
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qe0(te0Var, cv9Var, i2, i4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void H(defpackage.cme r24, defpackage.nhc r25, defpackage.kv6 r26, defpackage.gle r27, defpackage.k8b r28, defpackage.sh9 r29, defpackage.r28 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 324
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yi2.H(cme, nhc, kv6, gle, k8b, sh9, r28, x12, int, int):void");
    }

    public static final void I(String str, String str2, bo4 bo4Var, dle dleVar, r28 r28Var, ime imeVar, x12 x12Var, int i2) {
        ime imeVar2;
        ime imeVar3;
        int i3;
        ime imeVar4;
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1010220717);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.h(bo4Var) ? 256 : 128) | (p65Var.f(dleVar) ? 2048 : 1024) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z2 = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new bb0(str, str2, 29);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    imeVar3 = (ime) to7.z(n1b.a.b(ime.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-458753);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                imeVar3 = imeVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(imeVar3.q, p65Var, 0);
            l78 l78VarZ2 = guc.z(imeVar3.o, p65Var, 0);
            Context context = (Context) p65Var.j(eo.b);
            nhc nhcVarF = mk7.F(p65Var);
            kv6 kv6VarA = pv6.a(p65Var);
            int i6 = i3 & 7168;
            boolean zF = (i6 == 2048) | p65Var.f(imeVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new gle(dleVar, imeVar3);
                p65Var.j0(objM2);
            }
            gle gleVar = (gle) objM2;
            boolean zF2 = (i6 == 2048) | p65Var.f(imeVar3);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new ile(dleVar, context, imeVar3);
                p65Var.j0(objM3);
            }
            ile ileVar = (ile) objM3;
            boolean zF3 = (i6 == 2048) | p65Var.f(imeVar3);
            Object objM4 = p65Var.M();
            if (zF3 || objM4 == uobVar) {
                objM4 = new hle(dleVar, imeVar3);
                p65Var.j0(objM4);
            }
            hle hleVar = (hle) objM4;
            int i7 = 1;
            H((cme) l78VarZ.getValue(), nhcVarF, kv6VarA, gleVar, ileVar, hleVar, r28Var, p65Var, 1572864, 0);
            ple pleVar = (ple) l78VarZ2.getValue();
            n92 n92Var = null;
            if (pleVar instanceof mle) {
                p65Var.Y(-635406994);
                w2g.c(((mle) pleVar).a, new ip5(imeVar3, dleVar, i7), null, p65Var, 0);
                p65Var.p(false);
            } else if (pleVar instanceof ole) {
                p65Var.Y(-634452814);
                vp7.g(((ole) pleVar).a, new gh9(2, imeVar3), null, p65Var, 0);
                p65Var.p(false);
            } else if (pleVar instanceof nle) {
                p65Var.Y(-633869890);
                wgf.c(((nle) pleVar).a, new fle(imeVar3), null, p65Var, 0);
                p65Var.p(false);
            } else {
                if (pleVar != null) {
                    throw ho2.L(p65Var, -159046676, false);
                }
                p65Var.Y(-158978761);
                p65Var.p(false);
            }
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(imeVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(hleVar) | p65Var.f(ileVar);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                ime imeVar5 = imeVar3;
                kyc kycVar = new kyc(imeVar5, nhcVarF, resources, hleVar, ileVar, (n92) null, 9);
                imeVar4 = imeVar5;
                p65Var.j0(kycVar);
                objM5 = kycVar;
            } else {
                imeVar4 = imeVar3;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM5, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.h(imeVar4) | p65Var.f(kv6VarA);
            Object objM6 = p65Var.M();
            if (zH2 || objM6 == uobVar) {
                p65Var = p65Var;
                j5d j5dVar = new j5d(bo4Var, imeVar4, kv6VarA, n92Var, 18);
                p65Var.j0(j5dVar);
                objM6 = j5dVar;
            } else {
                p65Var = p65Var;
            }
            kyd.k(p65Var, (b55) objM6, c1eVar);
            imeVar2 = imeVar4;
        } else {
            p65Var.S();
            imeVar2 = imeVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(i2, 2, r28Var, (que) imeVar2, (Object) str2, (Object) bo4Var, (Object) dleVar, str);
        }
    }

    public static final y05 J(y05 y05Var, String str) {
        return y05Var.a(n98.e(str));
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0037 A[Catch: all -> 0x002d, TryCatch #1 {, blocks: (B:4:0x0003, B:6:0x0007, B:8:0x000d, B:10:0x0011, B:15:0x0019, B:17:0x0025, B:22:0x0030, B:23:0x0037, B:25:0x003b, B:26:0x0042), top: B:32:0x0003, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x003b A[Catch: all -> 0x002d, TryCatch #1 {, blocks: (B:4:0x0003, B:6:0x0007, B:8:0x000d, B:10:0x0011, B:15:0x0019, B:17:0x0025, B:22:0x0030, B:23:0x0037, B:25:0x003b, B:26:0x0042), top: B:32:0x0003, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.dm2 K(android.content.Context r3, defpackage.ti2 r4) {
        /*
            java.lang.Class<yi2> r0 = defpackage.yi2.class
            monitor-enter(r0)
            dm2 r1 = defpackage.yi2.a     // Catch: java.lang.Throwable -> L2d
            if (r1 != 0) goto L37
            int r1 = android.os.Build.VERSION.SDK_INT     // Catch: java.lang.Throwable -> L2d
            r2 = 30
            if (r1 < r2) goto L37
            ti2 r1 = defpackage.ti2.CRONET_SOURCE_PLATFORM     // Catch: java.lang.Throwable -> L2d
            if (r4 == r1) goto L18
            ti2 r1 = defpackage.ti2.CRONET_SOURCE_PLAY_SERVICES     // Catch: java.lang.Throwable -> L2d
            if (r4 != r1) goto L16
            goto L18
        L16:
            r4 = 0
            goto L19
        L18:
            r4 = 1
        L19:
            android.os.Bundle r3 = defpackage.vv2.J(r3)     // Catch: java.lang.Throwable -> L2d
            java.lang.String r1 = "android.net.http.EnableTelemetry"
            boolean r3 = r3.getBoolean(r1, r4)     // Catch: java.lang.Throwable -> L2d
            if (r3 == 0) goto L37
            aj2 r3 = new aj2     // Catch: java.lang.Throwable -> L2d java.lang.Exception -> L2f
            r3.<init>()     // Catch: java.lang.Throwable -> L2d java.lang.Exception -> L2f
            defpackage.yi2.a = r3     // Catch: java.lang.Throwable -> L2d java.lang.Exception -> L2f
            goto L37
        L2d:
            r3 = move-exception
            goto L44
        L2f:
            r3 = move-exception
            java.lang.String r4 = "yi2"
            java.lang.String r1 = "Exception creating an instance of CronetLoggerImpl"
            android.util.Log.e(r4, r1, r3)     // Catch: java.lang.Throwable -> L2d
        L37:
            dm2 r3 = defpackage.yi2.a     // Catch: java.lang.Throwable -> L2d
            if (r3 != 0) goto L42
            tg8 r3 = new tg8     // Catch: java.lang.Throwable -> L2d
            r3.<init>()     // Catch: java.lang.Throwable -> L2d
            defpackage.yi2.a = r3     // Catch: java.lang.Throwable -> L2d
        L42:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L2d
            return r3
        L44:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L2d
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yi2.K(android.content.Context, ti2):dm2");
    }

    public static final wg6 L(xzb xzbVar) {
        xzbVar.getClass();
        if (xzbVar instanceof e92) {
            return null;
        }
        if (xzbVar instanceof yzb) {
            return L(((yzb) xzbVar).a);
        }
        return null;
    }

    public static final ArrayList M(rg6 rg6Var) {
        List parameters = rg6Var.getParameters();
        ArrayList arrayList = new ArrayList();
        for (Object obj : parameters) {
            if (((ri6) obj).c == oi6.VALUE) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static final boolean N(x12 x12Var) {
        return (((Configuration) ((p65) x12Var).j(eo.a)).uiMode & 48) == 32;
    }

    public static int O(int i2, int i3, int i4) throws IOException {
        if ((i3 & 8) != 0) {
            i2--;
        }
        if (i4 <= i2) {
            return i2 - i4;
        }
        ik4.g(ev6.v("PROTOCOL_ERROR padding ", i4, i2, " > remaining length "));
        return 0;
    }

    public static jrg P(jrg jrgVar, jrg jrgVar2) {
        zg7 zg7Var = new zg7(17);
        wfd wfdVar = new wfd((ujf) zg7Var.b);
        mt mtVar = new mt(wfdVar, new AtomicBoolean(false), zg7Var, 2);
        b70 b70Var = z;
        jrgVar.g(b70Var, mtVar);
        jrgVar2.g(b70Var, mtVar);
        return wfdVar.a;
    }

    public static final Object Q(nhc nhcVar, Resources resources, n92 n92Var) {
        String string = resources.getString(com.medium.reader.R.string.action_unavailable_list_while_offline_reading);
        string.getClass();
        Object objC = nhc.c(nhcVar, string, null, bhc.Long, n92Var, 6);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : c1e.a;
    }

    public static final Shader.TileMode R(int i2) {
        return i2 == 0 ? Shader.TileMode.CLAMP : i2 == 1 ? Shader.TileMode.REPEAT : i2 == 2 ? Shader.TileMode.MIRROR : i2 == 3 ? Build.VERSION.SDK_INT >= 31 ? io.j() : Shader.TileMode.CLAMP : Shader.TileMode.CLAMP;
    }

    public static final ExtractedText S(uid uidVar) {
        ExtractedText extractedText = new ExtractedText();
        String str = uidVar.a.b;
        extractedText.text = str;
        extractedText.startOffset = 0;
        extractedText.partialEndOffset = str.length();
        extractedText.partialStartOffset = -1;
        long j2 = uidVar.b;
        extractedText.selectionStart = bkd.f(j2);
        extractedText.selectionEnd = bkd.e(j2);
        extractedText.flags = !muc.R(uidVar.a.b, '\n') ? 1 : 0;
        return extractedText;
    }

    public static final long T(long j2, long j3) {
        int iD;
        int iF = bkd.f(j2);
        int iE = bkd.e(j2);
        if ((bkd.f(j3) < bkd.e(j2)) && (bkd.f(j2) < bkd.e(j3))) {
            if ((bkd.f(j3) <= bkd.f(j2)) && (bkd.e(j2) <= bkd.e(j3))) {
                iF = bkd.f(j3);
                iE = iF;
            } else {
                if ((bkd.f(j2) <= bkd.f(j3)) && (bkd.e(j3) <= bkd.e(j2))) {
                    iD = bkd.d(j3);
                } else {
                    int iF2 = bkd.f(j3);
                    if (iF >= bkd.e(j3) || iF2 > iF) {
                        iE = bkd.f(j3);
                    } else {
                        iF = bkd.f(j3);
                        iD = bkd.d(j3);
                    }
                }
                iE -= iD;
            }
        } else if (iE > bkd.f(j3)) {
            iF -= bkd.d(j3);
            iD = bkd.d(j3);
            iE -= iD;
        }
        return lk7.q(iF, iE);
    }

    public static Context U(Context context, AttributeSet attributeSet, int i2, int i3, int[] iArr) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C, i2, i3);
        int[] iArr2 = {typedArrayObtainStyledAttributes.getResourceId(0, 0)};
        typedArrayObtainStyledAttributes.recycle();
        int i4 = iArr2[0];
        boolean z2 = (context instanceof l92) && ((l92) context).a == i4;
        if (i4 == 0 || z2) {
            return context;
        }
        l92 l92Var = new l92(context, i4);
        int length = iArr.length;
        int[] iArr3 = new int[length];
        if (iArr.length > 0) {
            TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, iArr, i2, i3);
            for (int i5 = 0; i5 < iArr.length; i5++) {
                iArr3[i5] = typedArrayObtainStyledAttributes2.getResourceId(i5, 0);
            }
            typedArrayObtainStyledAttributes2.recycle();
        }
        for (int i6 = 0; i6 < length; i6++) {
            int i7 = iArr3[i6];
            if (i7 != 0) {
                l92Var.getTheme().applyStyle(i7, true);
            }
        }
        TypedArray typedArrayObtainStyledAttributes3 = context.obtainStyledAttributes(attributeSet, B);
        int resourceId = typedArrayObtainStyledAttributes3.getResourceId(0, 0);
        int resourceId2 = typedArrayObtainStyledAttributes3.getResourceId(1, 0);
        typedArrayObtainStyledAttributes3.recycle();
        if (resourceId == 0) {
            resourceId = resourceId2;
        }
        if (resourceId != 0) {
            l92Var.getTheme().applyStyle(resourceId, true);
        }
        return l92Var;
    }

    public static final Bundle V(String str, boolean z2, boolean z3) {
        Bundle bundle = new Bundle();
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_SERVER_CLIENT_ID", str);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_NONCE", null);
        bundle.putBoolean("com.google.android.libraries.identity.googleid.BUNDLE_KEY_FILTER_BY_AUTHORIZED_ACCOUNTS", z2);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_LINKED_SERVICE_ID", null);
        bundle.putStringArrayList("com.google.android.libraries.identity.googleid.BUNDLE_KEY_ID_TOKEN_DEPOSITION_SCOPES", null);
        bundle.putBoolean("com.google.android.libraries.identity.googleid.BUNDLE_KEY_REQUEST_VERIFIED_PHONE_NUMBER", false);
        bundle.putBoolean("com.google.android.libraries.identity.googleid.BUNDLE_KEY_AUTO_SELECT_ENABLED", z3);
        bundle.putString("com.google.android.libraries.identity.googleid.BUNDLE_KEY_HOSTED_DOMAIN_FILTER", null);
        return bundle;
    }

    public static Provider W() {
        for (int i2 = 0; i2 < 3; i2++) {
            Provider provider = Security.getProvider(E[i2]);
            if (provider != null) {
                return provider;
            }
        }
        return null;
    }

    public static final void a(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(698941718);
        int i3 = i2 | (p65Var.h(m45Var) ? 4 : 2) | (p65Var.h(m45Var2) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.r(jfc.d(o28Var, 1.0f), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 438.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarF = w2g.F(jfc.d(o28Var, 1.0f), 24.0f, 8.0f, 24.0f, 20.0f);
            omb ombVarA = nmb.a(new h70(10.0f, true, new z10(21)), z46.m, p65Var, 6);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            b(com.medium.reader.R.string.onboarding_starter_pack_detail_not_for_me, m45Var, bgf.N(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), "not_for_me_button"), p65Var, (i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            b(com.medium.reader.R.string.onboarding_starter_pack_detail_follow, m45Var2, bgf.N(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), "follow_button"), p65Var, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            b09.H(p65Var, true, true, true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y47(m45Var, m45Var2, r28Var2, i2, 2);
        }
    }

    public static final void b(final int i2, m45 m45Var, r28 r28Var, x12 x12Var, int i3) {
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1589704435);
        if ((i3 & 6) == 0) {
            i4 = (p65Var.d(i2) ? 4 : 2) | i3;
        } else {
            i4 = i3;
        }
        if ((i3 & 48) == 0) {
            i4 |= p65Var.h(m45Var) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            amb ambVarA = bmb.a(24.0f);
            long j2 = xo7.i;
            cu0 cu0VarB = k40.b(1.0f, j2);
            jy8 jy8Var = h11.a;
            int i5 = i4 >> 3;
            f76.s(m45Var, r28Var, false, ambVarA, h11.d(uu1.g, j2, 0L, 0L, p65Var, 12), cu0VarB, new jy8(20.0f, 9.0f, 20.0f, 9.0f), pxf.E(-222436645, new c55() { // from class: hoc
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    ((pmb) obj).getClass();
                    p65 p65Var2 = (p65) x12Var2;
                    if (p65Var2.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                        jjd.b(vo7.R(p65Var2, i2), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, ((uu1) p65Var2.j(c82.a)).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 131070);
                    } else {
                        p65Var2.S();
                    }
                    return c1e.a;
                }
            }, p65Var), p65Var, (i5 & 14) | 817889280 | (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), OlympusRawInfoMakernoteDirectory.TagWbRbLevelsEveningSunlight);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pp3(i2, m45Var, r28Var, i3);
        }
    }

    public static final void c(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1984063274);
        int i3 = i2 | (p65Var.e(j2) ? 4 : 2) | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.r(jfc.d(o28Var, 1.0f), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 438.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarF = w2g.F(jfc.d(o28Var, 1.0f), 24.0f, 8.0f, 24.0f, 20.0f);
            omb ombVarA = nmb.a(new h70(10.0f, true, new z10(21)), z46.m, p65Var, 6);
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            r28 r28VarY = r40.y(jfc.e(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 44.0f), bmb.a(24.0f));
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarY, j2, nr5Var), p65Var, 0);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            dy0.a(flb.a0(r40.y(jfc.e(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 44.0f), bmb.a(24.0f)), j2, nr5Var), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(j2, r28Var2, i2, 18);
        }
    }

    public static final void e(String str, int i2, zm7 zm7Var, r28 r28Var, eg egVar, x12 x12Var, int i3) {
        eg egVar2;
        int i4;
        eg egVar3;
        eg egVar4;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1122205482);
        int i5 = 2;
        int i6 = i3 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i2) ? 32 : 16) | (p65Var.f(zm7Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i6 & 1, (i6 & 9363) != 9362)) {
            p65Var.U();
            int i7 = i3 & 1;
            uob uobVar = w12.a;
            if (i7 == 0 || p65Var.z()) {
                boolean z2 = ((i6 & 14) == 4) | ((i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new ne(str, i2, i5);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    eg egVar5 = (eg) to7.z(n1b.a.b(eg.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i4 = i6 & (-57345);
                    egVar3 = egVar5;
                }
            } else {
                p65Var.S();
                i4 = i6 & (-57345);
                egVar3 = egVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(egVar3.o, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i8 = i4 & 896;
            boolean zF = (i8 == 256) | p65Var.f(egVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new uf(egVar3, zm7Var);
                p65Var.j0(objM2);
            }
            uf ufVar = (uf) objM2;
            boolean zF2 = p65Var.f(egVar3) | (i8 == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new tf(egVar3, zm7Var);
                p65Var.j0(objM3);
            }
            d((bg) l78VarZ.getValue(), nhcVarF, (tf) objM3, ufVar, r28Var, p65Var, (i4 << 3) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(egVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(ufVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                egVar4 = egVar3;
                ra raVar = new ra(egVar4, nhcVarF, resources, ufVar, null, 7);
                p65Var.j0(raVar);
                objM4 = raVar;
            } else {
                egVar4 = egVar3;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            egVar2 = egVar4;
        } else {
            p65Var.S();
            egVar2 = egVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(str, i2, zm7Var, r28Var, egVar2, i3, 3);
        }
    }

    public static final void f(zf zfVar, tf tfVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object x8Var;
        float f2;
        zf zfVar2 = zfVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1071960363);
        int i3 = i2 | (p65Var.f(zfVar2) ? 4 : 2) | (p65Var.f(tfVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            zfVar2 = zfVar;
            b24 b24Var = zfVar2.a;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                x8Var = new x8(0, tfVar, tf.class, "refresh", "refresh()V", 0, 29);
                p65Var.j0(x8Var);
            } else {
                x8Var = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) x8Var), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 10, zfVar2, tfVar, r28Var);
        }
    }

    public static final void g(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1545344525);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        int i4 = 3;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(942947788);
            for (int i8 = 0; i8 < 8; i8++) {
                tr7.g(0, 1, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, i4);
        }
    }

    public static ou h(float f2) {
        return new ou(Float.valueOf(f2), d46.i, Float.valueOf(0.01f), 8);
    }

    public static final void i(te0 te0Var, cv9 cv9Var, x12 x12Var, int i2) {
        int i3;
        boolean z2;
        se0 se0Var = te0Var.a;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1844467538);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(te0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(cv9Var) ? 32 : 16;
        }
        int i5 = i3;
        int i6 = 3;
        if (p65Var.P(i5 & 1, (i5 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 20.0f, 0.0f, 24.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.o, p65Var, 48);
            long j2 = p65Var.T;
            int i7 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i7));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String str = se0Var.c;
            int i8 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i9 = i5 & 14;
            boolean z3 = (i8 == 32) | (i9 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                objM = new pe0(cv9Var, te0Var, i6);
                p65Var.j0(objM);
            }
            n(str, (m45) objM, null, p65Var, 0);
            hp7.t(p65Var, new sq6(1.0f, true));
            if (se0Var.i) {
                p65Var.Y(-942143884);
                r28 r28VarN = bgf.N(o28Var, "cta_edit_profile");
                String strR = vo7.R(p65Var, com.medium.reader.R.string.author_footer_edit_profile);
                xn7 xn7Var = xn7.M;
                boolean z4 = (i8 == 32) | (i9 == 4);
                Object objM2 = p65Var.M();
                if (z4 || objM2 == uobVar) {
                    objM2 = new pe0(cv9Var, te0Var, i4);
                    p65Var.j0(objM2);
                }
                fo7.i((m45) objM2, strR, xn7Var, r28VarN, false, p65Var, 3456, 16);
                p65Var.p(false);
            } else {
                p65Var.Y(-945722524);
                wu4 wu4Var = (wu4) guc.x(te0Var.e, null, p65Var, 48).getValue();
                if (wu4Var != null) {
                    p65Var.Y(-945540926);
                    z2 = false;
                    n01.x(wu4Var, it4.M, new zm7(5, cv9Var), null, null, null, null, 0L, p65Var, 48, 248);
                } else {
                    z2 = false;
                    p65Var.Y(-949769264);
                }
                p65Var.p(z2);
                if (te0Var.c != null) {
                    p65Var.Y(-942313206);
                    G(te0Var, cv9Var, p65Var, i5 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                } else {
                    p65Var.Y(-949769264);
                }
                p65Var.p(z2);
                p65Var.p(z2);
            }
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qe0(te0Var, cv9Var, i2, 3);
        }
    }

    public static final void j(String str, SourceParameter sourceParameter, cv9 cv9Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1421767352);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(sourceParameter) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(cv9Var) ? 256 : 128;
        }
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            StringBuilder sb = new StringBuilder(16);
            ArrayList arrayListV = wgd.v();
            new ArrayList();
            sb.append(str);
            Matcher matcher = Patterns.WEB_URL.matcher(str);
            while (matcher.find()) {
                arrayListV.add(new jx(new b07("web_url", new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14), new re0(Uri.parse(matcher.group()), cv9Var, sourceParameter, i4)), matcher.start(), matcher.end(), 8));
            }
            String string = sb.toString();
            ArrayList arrayList = new ArrayList(arrayListV.size());
            int size = arrayListV.size();
            while (i4 < size) {
                i4 = lv8.i(sb, (jx) arrayListV.get(i4), arrayList, i4, 1);
            }
            p65Var = p65Var2;
            jjd.c(new mx(string, arrayList), w2g.G(o28.b, 24.0f, 14.0f, 24.0f, 0.0f, 8), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var2.j(jt7.c)).m, p65Var, 48, 0, 262140);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 5, str, sourceParameter, cv9Var);
        }
    }

    public static final void k(te0 te0Var, cv9 cv9Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1509407930);
        int i3 = i2 | (p65Var.f(te0Var) ? 4 : 2) | (p65Var.f(cv9Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new nx(7);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), wxb.a(o28Var, false, (x45) objM), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            l(te0Var, cv9Var, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 29, te0Var, cv9Var, r28Var2);
        }
    }

    public static final void l(te0 te0Var, cv9 cv9Var, x12 x12Var, int i2) {
        int i3;
        SourceParameter sourceParameter = te0Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1584017864);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(te0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(cv9Var) ? 32 : 16;
        }
        int i4 = i3;
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            r28 r28VarD = jfc.d(o28.b, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i7 = i4 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
            i(te0Var, cv9Var, p65Var, i7);
            se0 se0Var = te0Var.a;
            String str = se0Var.g;
            m(se0Var.b, se0Var.a, se0Var.d, sourceParameter, cv9Var, p65Var, (i4 << 9) & 57344);
            if (se0Var.e != null) {
                p65Var.Y(1255874285);
                x(te0Var, cv9Var, p65Var, i7);
            } else {
                p65Var.Y(1252940724);
            }
            p65Var.p(false);
            if (str == null || muc.b0(str)) {
                p65Var.Y(1252940724);
            } else {
                p65Var.Y(1256057216);
                j(str, sourceParameter, cv9Var, p65Var, (i4 << 3) & 896);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qe0(te0Var, cv9Var, i2, i5);
        }
    }

    public static final void m(String str, String str2, boolean z2, SourceParameter sourceParameter, cv9 cv9Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(94148338);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(str2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.g(z2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(sourceParameter) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(cv9Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 16.0f, 24.0f, 0.0f, 8);
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
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
            String strR = vo7.R(p65Var, com.medium.reader.R.string.author_footer_written_by);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).j, p65Var, 0, 0, 131070);
            r28 r28VarY = r40.y(new sq6(1.0f, false), bmb.a(4.0f));
            boolean z3 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((57344 & i3) == 16384) | ((i3 & 7168) == 2048);
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new le0(cv9Var, str2, sourceParameter, 2);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 4.0f, 2.0f, 4.0f, 2.0f), "cta_author_name");
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strW = null;
            if (str != null && !muc.b0(str)) {
                strW = str;
            }
            if (strW == null) {
                strW = km4.w(p65Var, -1884890570, com.medium.reader.R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(-1884891686);
                p65Var.p(false);
            }
            jjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(sn3Var)).j, p65Var, 0, 24960, 110590);
            p65Var = p65Var;
            if (z2) {
                p65Var.Y(1698222373);
                w2g.e(vn7.J(com.medium.reader.R.drawable.ic_book_author, 0, p65Var), vo7.R(p65Var, com.medium.reader.R.string.book_author), w2g.G(o28Var, 2.0f, 0.0f, 0.0f, 0.0f, 14), null, null, 0.0f, null, p65Var, 392, 120);
            } else {
                p65Var.Y(1687310776);
            }
            p65Var.p(false);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mq(str, str2, z2, sourceParameter, cv9Var, i2, 1);
        }
    }

    public static final void n(String str, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(359703950);
        int i3 = i2 | (p65Var.f(str != null ? new ax5(str) : null) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            hl0 hl0Var = as7.d;
            float f2 = as7.e;
            o28 o28Var = o28.b;
            d46.a(str, hl0Var, w2g.C(o28Var, f2), null, null, null, null, 0.0f, 0, null, m45Var, p65Var, i3 & 14, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 2040);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qb(str, m45Var, r28Var2, i2, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x01ea  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x01f7  */
    /* JADX WARN: Removed duplicated region for block: B:47:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(java.lang.String r31, defpackage.r28 r32, defpackage.c55 r33, defpackage.x12 r34, int r35, int r36) {
        /*
            Method dump skipped, instruction units count: 517
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yi2.o(java.lang.String, r28, c55, x12, int, int):void");
    }

    public static final void p(int i2, long j2, x12 x12Var, r28 r28Var) {
        long j3;
        r28 r28Var2;
        long j4;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-927560794);
        int i3 = i2 | 22;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                j4 = ((zo7) p65Var.j(kt7.b)).c;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                j4 = j2;
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarV = m40.V(jfc.d(r28Var3, 1.0f), p65Var, 0);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 48);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
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
            dy0.a(flb.a0(jfc.l(w2g.G(o28Var, 24.0f, 12.0f, 0.0f, 12.0f, 4), hl0.XS.m114getSizeD9Ej5fM()), j4, bmb.a(4.0f)), p65Var, 0);
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j6 = p65Var.T;
            int i6 = (int) (j6 ^ (j6 >>> 32));
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
            p65Var.Y(813415870);
            sn3 sn3Var = z22.h;
            m73 m73Var = (m73) p65Var.j(sn3Var);
            sn3 sn3Var2 = jt7.c;
            float fZ = m73Var.z(((bu7) p65Var.j(sn3Var2)).j.b.c);
            p65Var.p(false);
            r28 r28VarD = jfc.d(jfc.e(w2g.G(o28Var, 16.0f, 12.0f, 16.0f, 0.0f, 8), fZ), 1.0f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarD, j4, nr5Var), p65Var, 0);
            p65Var.Y(813428064);
            float fZ2 = ((m73) p65Var.j(sn3Var)).z(((bu7) p65Var.j(sn3Var2)).n.b.c) * 3.0f;
            p65Var.p(false);
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.F(o28Var, 16.0f, 4.0f, 16.0f, 12.0f), fZ2), 1.0f), j4, nr5Var), p65Var, 0);
            p65Var.p(true);
            dy0.a(flb.a0(jfc.m(w2g.G(o28Var, 0.0f, 12.0f, 24.0f, 0.0f, 9), 90.0f, 32.0f), j4, bmb.a(16.0f)), p65Var, 0);
            p65Var.p(true);
            j3 = j4;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            j3 = j2;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j3, i2, 6);
        }
    }

    public static final void q(yf yfVar, tf tfVar, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        uob uobVar;
        tf tfVar2 = tfVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-229101968);
        int i4 = i2 | (p65Var.f(yfVar) ? 4 : 2) | (p65Var.f(tfVar2) ? 32 : 16) | (p65Var.f(obeVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            boolean z2 = yfVar.b;
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i5 == 32;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z3 || objM == uobVar2) {
                i3 = i5;
                uobVar = uobVar2;
                vf vfVar = new vf(0, tfVar, tf.class, "refresh", "refresh()V", 0, 0);
                p65Var.j0(vfVar);
                objM = vfVar;
            } else {
                i3 = i5;
                uobVar = uobVar2;
            }
            er7.d(z2, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(1238822306, new fd3(kv6VarA, (Object) yfVar, (Object) obeVar, (Object) tfVar, 15), p65Var), p65Var, (i4 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z4 = i3 == 32;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                tfVar2 = tfVar;
                objM2 = new z8(tfVar2, null, 4);
                p65Var.j0(objM2);
            } else {
                tfVar2 = tfVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 3, yfVar, tfVar2, obeVar, r28Var);
        }
    }

    public static final void r(final noc nocVar, final koc kocVar, final m45 m45Var, final r28 r28Var, x12 x12Var, final int i2) {
        mwa mwaVarS;
        b55 b55Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-804591008);
        int i3 = i2 | (p65Var.f(nocVar) ? 4 : 2) | (p65Var.f(kocVar) ? 32 : 16) | (p65Var.h(m45Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            th6 th6VarF0 = bo.f0(bu1.h1(3, nocVar.b));
            if (((t0) th6VarF0).isEmpty()) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    final int i4 = 0;
                    b55Var = new b55(nocVar, kocVar, m45Var, r28Var, i2, i4) { // from class: goc
                        public final /* synthetic */ int a;
                        public final /* synthetic */ noc b;
                        public final /* synthetic */ koc c;
                        public final /* synthetic */ m45 d;
                        public final /* synthetic */ r28 e;

                        {
                            this.a = i4;
                        }

                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i5 = this.a;
                            c1e c1eVar = c1e.a;
                            switch (i5) {
                                case 0:
                                    ((Integer) obj2).getClass();
                                    int iY = tr7.y(1);
                                    yi2.r(this.b, this.c, this.d, this.e, (x12) obj, iY);
                                    break;
                                default:
                                    ((Integer) obj2).getClass();
                                    int iY2 = tr7.y(1);
                                    yi2.r(this.b, this.c, this.d, this.e, (x12) obj, iY2);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new c5d();
                p65Var.j0(objM);
            }
            er7.d(nocVar.c, m45Var, r28Var.b(jfc.c), null, 0L, 0L, false, 0.0f, null, null, pxf.E(1243419282, new fd3(nocVar, (c5d) objM, kocVar, th6VarF0, 6), p65Var), p65Var, (i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final int i5 = 1;
            b55Var = new b55(nocVar, kocVar, m45Var, r28Var, i2, i5) { // from class: goc
                public final /* synthetic */ int a;
                public final /* synthetic */ noc b;
                public final /* synthetic */ koc c;
                public final /* synthetic */ m45 d;
                public final /* synthetic */ r28 e;

                {
                    this.a = i5;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i52 = this.a;
                    c1e c1eVar = c1e.a;
                    switch (i52) {
                        case 0:
                            ((Integer) obj2).getClass();
                            int iY = tr7.y(1);
                            yi2.r(this.b, this.c, this.d, this.e, (x12) obj, iY);
                            break;
                        default:
                            ((Integer) obj2).getClass();
                            int iY2 = tr7.y(1);
                            yi2.r(this.b, this.c, this.d, this.e, (x12) obj, iY2);
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    public static final void s(yle yleVar, kv6 kv6Var, gle gleVar, k8b k8bVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i2) {
        gle gleVar2;
        int i3;
        kv6 kv6Var2 = kv6Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1721594425);
        int i4 = i2 | (p65Var.f(yleVar) ? 4 : 2) | (p65Var.f(kv6Var2) ? 32 : 16) | (p65Var.f(gleVar) ? 256 : 128) | (p65Var.f(k8bVar) ? 2048 : 1024) | (p65Var.f(sh9Var) ? 16384 : 8192);
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 48.0f, 7);
            r28 r28VarN = bgf.N(r28Var, "content_state");
            int i5 = i4 & 14;
            boolean z2 = (i5 == 4) | ((i4 & 7168) == 2048) | ((57344 & i4) == 16384);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new pi9(yleVar, k8bVar, sh9Var, 22);
                p65Var.j0(objM);
            }
            int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            k40.t(r28VarN, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, i6 | 384, 504);
            kv6Var2 = kv6Var;
            int i7 = i4 & 896;
            boolean z3 = (i7 == 256) | (i6 == 32);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (z3 || objM2 == uobVar) {
                gleVar2 = gleVar;
                objM2 = new cfd(kv6Var2, gleVar2, n92Var, 14);
                p65Var.j0(objM2);
            } else {
                gleVar2 = gleVar;
            }
            kyd.k(p65Var, (b55) objM2, kv6Var2);
            Boolean boolValueOf = Boolean.valueOf(yleVar.c);
            boolean z4 = (i5 == 4) | (i7 == 256);
            Object objM3 = p65Var.M();
            if (z4 || objM3 == uobVar) {
                i3 = 1;
                objM3 = new iie(gleVar2, yleVar, n92Var, i3);
                p65Var.j0(objM3);
            } else {
                i3 = 1;
            }
            kyd.k(p65Var, (b55) objM3, boolValueOf);
            int i8 = i7 == 256 ? i3 : 0;
            Object objM4 = p65Var.M();
            if (i8 != 0 || objM4 == uobVar) {
                objM4 = new ele(gleVar2, n92Var, 0);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
        } else {
            gleVar2 = gleVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(i2, 1, r28Var, yleVar, kv6Var2, gleVar2, k8bVar, sh9Var);
        }
    }

    public static final void t(ooc oocVar, nr8 nr8Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        ot2 ot2Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-269730049);
        int i3 = i2 | (p65Var2.f(oocVar) ? 4 : 2) | (p65Var2.f(nr8Var) ? 32 : 16) | (p65Var2.h(m45Var) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            ((jp7) p65Var2.j(kt7.a)).getClass();
            ip7 ip7VarA = jp7.a(p65Var2);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = bjc.b(new znc(ip7VarA, 3));
                p65Var2.j0(objM);
            }
            upc upcVar = (upc) objM;
            r28 r28VarN = bgf.N(r28Var.b(jfc.c), "empty_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o(oocVar.a, null, null, p65Var2, 0, 6);
            o28 o28Var = o28.b;
            r28 r28VarC = w2g.C(jfc.d(o28Var, 1.0f).b(new sq6(1.0f, true)), 24.0f);
            float f2 = aoc.b;
            r28 r28VarD = jfc.d(jfc.r(r28VarC, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                ot2Var = ot2Var2;
                p65Var2.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, f2, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var2.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarD2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            r28 r28VarF = jfc.f(o28Var, 0.0f, ((vj3) upcVar.getValue()).a, 1);
            ot2 ot2Var3 = ot2Var;
            r28 r28VarC2 = w2g.C(flb.a0(w2g.G(jfc.c(r28VarF, 1.0f), 0.0f, 0.0f, 0.0f, 32.0f, 7), nr8Var.c, bmb.a(16.0f)), 32.0f);
            yq0 yq0Var = z46.q;
            wv1 wv1VarA2 = uv1.a(new h70(32.0f, false, new f70(1, z46.n)), yq0Var, p65Var2, 54);
            long j5 = p65Var2.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarC2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var3);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA2);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            String strR = vo7.R(p65Var2, com.medium.reader.R.string.onboarding_starter_pack_detail_empty_title);
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var2.j(sn3Var)).F;
            long j6 = xo7.i;
            jjd.b(strR, null, 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(mkdVar, j6, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 130046);
            jjd.b(vo7.R(p65Var2, com.medium.reader.R.string.onboarding_starter_pack_detail_empty_subtitle), null, 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var)).F, j6, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 130046);
            wv1 wv1VarA3 = uv1.a(new h70(12.0f, true, new z10(21)), yq0Var, p65Var2, 54);
            long j7 = p65Var2.T;
            int i8 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL5 = p65Var2.l();
            r28 r28VarR5 = gx1.R(p65Var2, o28Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var3);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA3);
            tp7.B(p65Var2, cuVar2, i89VarL5);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR5);
            r28 r28VarN2 = bgf.N(jfc.d(o28Var, 1.0f), "explore_starter_packs_button");
            amb ambVarA = bmb.a(24.0f);
            jy8 jy8Var = h11.a;
            f76.s(m45Var, r28VarN2, false, ambVarA, h11.d(j6, uu1.d, 0L, 0L, p65Var2, 12), null, new jy8(20.0f, 9.0f, 20.0f, 9.0f), rv8.p, p65Var2, ((i3 >> 6) & 14) | 819462192, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsEveningSunlight);
            p65Var = p65Var2;
            ho2.N(p65Var, true, true, true, true);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 6, oocVar, nr8Var, m45Var, r28Var);
        }
    }

    public static final void u(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-898231506);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            gq7.a(bgf.N(o28Var, "end_of_feed"), null, vo7.R(p65Var, com.medium.reader.R.string.user_activity_end_of_feed_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2042);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var2, i2, 14);
        }
    }

    public static final void v(poc pocVar, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(988997366);
        int i3 = i2 | (p65Var.f(pocVar) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            ip7 ip7VarA = jp7.a(p65Var);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = bjc.b(new znc(ip7VarA, 2));
                p65Var.j0(objM);
            }
            upc upcVar = (upc) objM;
            r28 r28VarC = w2g.C(r28Var.b(jfc.c), 24.0f);
            float f2 = aoc.b;
            r28 r28VarD = jfc.d(jfc.r(r28VarC, 3), 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, f2, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarC2 = w2g.C(flb.a0(w2g.G(jfc.c(jfc.f(o28Var, 0.0f, ((vj3) upcVar.getValue()).a, 1), 1.0f), 0.0f, 0.0f, 0.0f, 32.0f, 7), ((zo7) p65Var.j(kt7.b)).a, bmb.a(16.0f)), 32.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarC2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            iq7.a(pocVar.a, jfc.d(o28Var, 1.0f), null, null, null, null, m45Var, null, p65Var, ((i3 << 15) & 3670016) | 48, 188);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 21, pocVar, m45Var, r28Var);
        }
    }

    public static final void w(zle zleVar, gle gleVar, r28 r28Var, x12 x12Var, int i2) {
        Object k8eVar;
        ar0 ar0Var;
        zle zleVar2 = zleVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1095587399);
        int i3 = i2 | (p65Var.f(zleVar2) ? 4 : 2) | (p65Var.f(gleVar) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "error_state"), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            zleVar2 = zleVar;
            b24 b24Var = zleVar2.a;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                ar0Var = ar0Var2;
                k8eVar = new k8e(0, gleVar, gle.class, "refresh", "refresh()V", 0, 18);
                p65Var.j0(k8eVar);
            } else {
                k8eVar = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), null, null, null, null, (m45) ((qh6) k8eVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 25, zleVar2, gleVar, r28Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r11v16 */
    /* JADX WARN: Type inference failed for: r11v17 */
    /* JADX WARN: Type inference failed for: r11v18 */
    /* JADX WARN: Type inference failed for: r11v23 */
    /* JADX WARN: Type inference failed for: r12v15 */
    /* JADX WARN: Type inference failed for: r12v16 */
    /* JADX WARN: Type inference failed for: r12v27 */
    /* JADX WARN: Type inference failed for: r32v1 */
    /* JADX WARN: Type inference failed for: r32v2 */
    /* JADX WARN: Type inference failed for: r32v3 */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v7 */
    public static final void x(te0 te0Var, cv9 cv9Var, x12 x12Var, int i2) {
        int i3;
        int i4;
        float f2;
        o28 o28Var;
        Long l2;
        uob uobVar;
        boolean z2;
        boolean z3;
        int i5;
        te0 te0Var2 = te0Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1231659963);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(te0Var2) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(cv9Var) ? 32 : 16;
        }
        int i6 = i3;
        int i7 = 1;
        if (p65Var.P(i6 & 1, (i6 & 19) != 18)) {
            o28 o28Var2 = o28.b;
            r28 r28VarG = w2g.G(o28Var2, 20.0f, 8.0f, 24.0f, 0.0f, 8);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i8));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            se0 se0Var = te0Var2.a;
            Long l3 = se0Var.f;
            Long l4 = se0Var.e;
            Long l5 = se0Var.e;
            uob uobVar2 = w12.a;
            if (l5 != null) {
                p65Var.Y(-756188921);
                String strD = vo7.D(com.medium.reader.R.plurals.n_followers, (int) l4.longValue(), new Object[]{dq1.g(l4)}, p65Var);
                r28 r28VarY = r40.y(o28Var2, bmb.a(4.0f));
                ?? r11 = ((i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i6 & 14) == 4);
                Object objM = p65Var.M();
                if (r11 != false || objM == uobVar2) {
                    objM = new pe0(cv9Var, te0Var2, i7);
                    p65Var.j0(objM);
                }
                l2 = l3;
                f2 = 4.0f;
                o28Var = o28Var2;
                uobVar = uobVar2;
                z2 = false;
                jjd.b(strD, bgf.N(w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 4.0f, 2.0f, 4.0f, 2.0f), "cta_followers_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131068);
                p65Var = p65Var;
            } else {
                f2 = 4.0f;
                o28Var = o28Var2;
                l2 = l3;
                uobVar = uobVar2;
                z2 = false;
                p65Var.Y(-767782239);
            }
            p65Var.p(z2);
            if (l2 != null) {
                p65Var.Y(-755215490);
                String strR = vo7.R(p65Var, com.medium.reader.R.string.author_header_author_follow_separator);
                sn3 sn3Var = jt7.c;
                mkd mkdVar = ((bu7) p65Var.j(sn3Var)).m;
                sn3 sn3Var2 = kt7.b;
                p65 p65Var2 = p65Var;
                boolean z4 = z2;
                jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 131070);
                Object[] objArr = new Object[1];
                objArr[z4 ? 1 : 0] = dq1.g(l2);
                String strQ = vo7.Q(com.medium.reader.R.string.following, objArr, p65Var2);
                r28 r28VarY2 = r40.y(o28Var, bmb.a(f2));
                ?? r0 = ((i6 & 14) == 4 ? 1 : z4 ? 1 : 0) | ((i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? 1 : z4 ? 1 : 0);
                Object objM2 = p65Var2.M();
                if (r0 != 0 || objM2 == uobVar) {
                    i5 = 2;
                    te0Var2 = te0Var;
                    objM2 = new pe0(cv9Var, te0Var2, i5);
                    p65Var2.j0(objM2);
                } else {
                    i5 = 2;
                    te0Var2 = te0Var;
                }
                float f3 = f2;
                i4 = i5;
                jjd.b(strQ, bgf.N(w2g.F(hlg.r(r28VarY2, false, null, null, (m45) objM2, 15), f3, 2.0f, f3, 2.0f), "cta_following_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var)).m, ((zo7) p65Var2.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 131068);
                p65Var = p65Var2;
                z3 = z4 ? 1 : 0;
            } else {
                te0Var2 = te0Var;
                z3 = z2;
                i4 = 2;
                p65Var.Y(-767782239);
            }
            p65Var.p(z3);
            p65Var.p(true);
        } else {
            i4 = 2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qe0(te0Var2, cv9Var, i2, i4);
        }
    }

    public static final void y(m45 m45Var, r28 r28Var, gu6 gu6Var, xt6 xt6Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1055276397);
        int i3 = (p65Var.h(m45Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16) | (p65Var.f(gu6Var) ? 256 : 128) | (p65Var.f(xt6Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            qb8.o(pxf.E(-933153643, new fd3(gu6Var, r28Var, xt6Var, qo7.y(m45Var, p65Var), 2), p65Var), p65Var, 6);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(m45Var, r28Var, gu6Var, xt6Var, i2);
        }
    }

    public static final void z(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1286255474);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            sn3 sn3Var = kt7.b;
            long jB = uu1.b(0.4f, ((zo7) p65Var.j(sn3Var)).c);
            long j2 = ((zo7) p65Var.j(sn3Var)).c;
            r28 r28VarN = bgf.N(r28Var.b(jfc.c), "loading_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            float f2 = aoc.b;
            r28 r28VarD2 = jfc.d(jfc.r(r28VarD, 3), 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
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
            r28 r28VarD3 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, f2, 0.0f, 11), 1.0f);
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarE = w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j6 = p65Var.T;
            int i7 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarE);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            ok7.r(180.0f, 48, 4, jB, p65Var, null, ((bu7) p65Var.j(jt7.c)).g);
            p65Var = p65Var;
            hp7.t(p65Var, new sq6(1.0f, true));
            dy0.a(flb.a0(jfc.p(jfc.e(o28Var, 40.0f), 100.0f), jB, bmb.a(24.0f)), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
            r28 r28VarD4 = jfc.d(jfc.r(w2g.C(jfc.d(o28Var, 1.0f).b(new sq6(1.0f, true)), 24.0f), 3), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j7 = p65Var.T;
            int i8 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD4);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            r28 r28VarD5 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, f2, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var2, false);
            long j8 = p65Var.T;
            int i9 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL6 = p65Var.l();
            r28 r28VarR6 = gx1.R(p65Var, r28VarD5);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL6);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR6);
            r28 r28VarA = iy0.a.a(o28Var, ar0Var);
            zk7 zk7VarC5 = dy0.c(ar0Var2, false);
            long j9 = p65Var.T;
            int i10 = (int) (j9 ^ (j9 >>> 32));
            i89 i89VarL7 = p65Var.l();
            r28 r28VarR7 = gx1.R(p65Var, r28VarA);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC5);
            tp7.B(p65Var, cuVar2, i89VarL7);
            ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR7);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new dsb(19);
                p65Var.j0(objM);
            }
            vx0.B(48, 0, j2, p65Var, xz5.W(o28Var, (x45) objM));
            vx0.B(0, 2, j2, p65Var, null);
            b09.H(p65Var, true, true, true);
            c(0, jB, p65Var, null);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 25);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.bg r22, defpackage.nhc r23, defpackage.tf r24, defpackage.obe r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 250
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yi2.d(bg, nhc, tf, obe, r28, x12, int, int):void");
    }
}
