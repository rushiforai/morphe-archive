package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.view.View;
import android.view.ViewParent;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import com.medium.proto.obv.post.BlockLayout;
import com.medium.reader.R;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class bo {
    public static final xq0 a = new xq0(-1.0f);
    public static final xq0 b = new xq0(1.0f);
    public static final wq0 c = new wq0(-1.0f);
    public static final wq0 d = new wq0(1.0f);
    public static final mz1 e = new mz1(new e02(6), false, -1508610773);
    public static final mz1 f = new mz1(new yz1(25), false, -1267486567);
    public static final mz1 g = new mz1(new yz1(26), false, -109954277);
    public static final mz1 h = new mz1(new a02(15), false, 215982560);
    public static final mz1 i = new mz1(new a02(16), false, 794748705);
    public static final mz1 j = new mz1(new j02(24), false, -1421449357);
    public static final mz1 k = new mz1(new u02(14), false, -273161923);
    public static final tk4 l = new tk4(1);
    public static final StackTraceElement[] m = new StackTraceElement[0];

    public static final wua A(xpc xpcVar) {
        return new wua(xpcVar, null);
    }

    public static void A0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.e(i2, ((Long) list.get(i3)).longValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            ((Long) list.get(i5)).getClass();
            i4 += 8;
        }
        htfVar.q(i4);
        while (i3 < list.size()) {
            htfVar.i(((Long) list.get(i3)).longValue());
            i3++;
        }
    }

    public static final r28 B(r28 r28Var, float f2, long j2, m3c m3cVar) {
        return C(r28Var, f2, new dkc(j2), m3cVar);
    }

    public static void B0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                int iIntValue = ((Integer) list.get(i3)).intValue();
                htfVar.s(i2, (iIntValue >> 31) ^ (iIntValue << 1));
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int iV = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            int iIntValue2 = ((Integer) list.get(i4)).intValue();
            iV += htf.v((iIntValue2 >> 31) ^ (iIntValue2 << 1));
        }
        htfVar.q(iV);
        while (i3 < list.size()) {
            int iIntValue3 = ((Integer) list.get(i3)).intValue();
            htfVar.q((iIntValue3 >> 31) ^ (iIntValue3 << 1));
            i3++;
        }
    }

    public static final r28 C(r28 r28Var, float f2, dkc dkcVar, m3c m3cVar) {
        return r28Var.b(new bu0(f2, dkcVar, m3cVar));
    }

    public static void C0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                long jLongValue = ((Long) list.get(i3)).longValue();
                htfVar.m(i2, (jLongValue >> 63) ^ (jLongValue << 1));
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int iT = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            long jLongValue2 = ((Long) list.get(i4)).longValue();
            iT += htf.t((jLongValue2 >> 63) ^ (jLongValue2 << 1));
        }
        htfVar.q(iT);
        while (i3 < list.size()) {
            long jLongValue3 = ((Long) list.get(i3)).longValue();
            htfVar.n((jLongValue3 >> 63) ^ (jLongValue3 << 1));
            i3++;
        }
    }

    public static final void D(ib2 ib2Var, CancellationException cancellationException) {
        va6 va6Var = (va6) ib2Var.o0(cd7.g);
        if (va6Var != null) {
            va6Var.m(cancellationException);
        }
    }

    public static void D0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.s(i2, ((Integer) list.get(i3)).intValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int iV = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            iV += htf.v(((Integer) list.get(i4)).intValue());
        }
        htfVar.q(iV);
        while (i3 < list.size()) {
            htfVar.q(((Integer) list.get(i3)).intValue());
            i3++;
        }
    }

    public static final Object E(va6 va6Var, p4d p4dVar) {
        va6Var.m(null);
        Object objZ0 = va6Var.z0(p4dVar);
        return objZ0 == tb2.COROUTINE_SUSPENDED ? objZ0 : c1e.a;
    }

    public static void E0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.m(i2, ((Long) list.get(i3)).longValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int iT = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            iT += htf.t(((Long) list.get(i4)).longValue());
        }
        htfVar.q(iT);
        while (i3 < list.size()) {
            htfVar.n(((Long) list.get(i3)).longValue());
            i3++;
        }
    }

    public static final void F(xu6 xu6Var, List list, ye1 ye1Var, oe1 oe1Var) {
        list.getClass();
        ye1Var.getClass();
        oe1Var.getClass();
        xu6Var.l0(list.size(), new dy4(new vx5(23), 11, list), new re(list, 23), new mz1(new o37(list, ye1Var, oe1Var, 0), true, 802480018));
    }

    public static final void G(xu6 xu6Var, oe1 oe1Var) {
        oe1Var.getClass();
        ev6.l(xu6Var, 20, new vx5(22), new mz1(new zq(4, oe1Var), true, -257310552), 4);
    }

    public static final opg H(bo4 bo4Var) {
        wj1.V.getClass();
        int i2 = vj1.b;
        if (1 >= i2) {
            i2 = 1;
        }
        int i3 = i2 - 1;
        if (bo4Var instanceof yj1) {
            yj1 yj1Var = (yj1) bo4Var;
            nz0 nz0Var = yj1Var.c;
            bo4 bo4VarI = yj1Var.i();
            if (bo4VarI != null) {
                int i4 = yj1Var.b;
                if (i4 != -3 && i4 != -2 && i4 != 0) {
                    i3 = i4;
                } else if (nz0Var != nz0.SUSPEND || i4 == 0) {
                    i3 = 0;
                }
                return new opg(i3, nz0Var, yj1Var.a, bo4VarI);
            }
        }
        return new opg(i3, nz0.SUSPEND, zx3.a, bo4Var);
    }

    public static final boolean I(View view, View view2) {
        if (view2.equals(view)) {
            return false;
        }
        for (ViewParent parent = view2.getParent(); parent != null; parent = parent.getParent()) {
            if (parent == view) {
                return true;
            }
        }
        return false;
    }

    public static xvd J(boolean z, bo1 bo1Var, rn6 rn6Var, int i2) {
        if ((i2 & 4) != 0) {
            bo1Var = h1c.j;
        }
        bo1 bo1Var2 = bo1Var;
        if ((i2 & 8) != 0) {
            rn6Var = rn6.a;
        }
        return new xvd(z, true, bo1Var2, rn6Var, sn6.a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final Object K(u22 u22Var, d8a d8aVar) {
        if (!((q28) u22Var).a.n) {
            b26.b("Cannot read CompositionLocal because the Modifier node is not currently attached.");
        }
        i89 i89Var = (i89) flb.v0(u22Var).B;
        i89Var.getClass();
        return m40.U(i89Var, d8aVar);
    }

    public static final float L(float[] fArr, int i2, float[] fArr2, int i3) {
        int i4 = i2 * 4;
        return (fArr[i4 + 3] * fArr2[12 + i3]) + (fArr[i4 + 2] * fArr2[8 + i3]) + (fArr[i4 + 1] * fArr2[4 + i3]) + (fArr[i4] * fArr2[i3]);
    }

    public static final boolean M(zxb zxbVar) {
        txb txbVarK = zxbVar.k();
        return !txbVarK.a.c(eyb.j);
    }

    public static final void N(ib2 ib2Var) {
        va6 va6Var = (va6) ib2Var.o0(cd7.g);
        if (va6Var != null && !va6Var.f()) {
            throw va6Var.L();
        }
    }

    public static final long O(float f2, int i2, long j2, boolean z) {
        int iH = ((z || i2 == 2 || i2 == 4 || i2 == 5) && f72.d(j2)) ? f72.h(j2) : Integer.MAX_VALUE;
        if (f72.j(j2) != iH) {
            iH = iq7.v(jq7.g(f2), f72.j(j2), iH);
        }
        return g01.Q(0, iH, 0, f72.g(j2));
    }

    public static final boolean P(zxb zxbVar) {
        Object objG = zxbVar.d.a.g(eyb.K);
        if (objG == null) {
            objG = null;
        }
        nnd nndVar = (nnd) objG;
        f78 f78Var = zxbVar.d.a;
        Object objG2 = f78Var.g(eyb.z);
        if (objG2 == null) {
            objG2 = null;
        }
        vkb vkbVar = (vkb) objG2;
        boolean z = nndVar != null;
        Object objG3 = f78Var.g(eyb.J);
        if (((Boolean) (objG3 != null ? objG3 : null)) == null || (vkbVar != null && vkbVar.a == 4)) {
            return z;
        }
        return true;
    }

    public static final String Q(zxb zxbVar, Resources resources) {
        txb txbVar = zxbVar.d;
        txb txbVar2 = zxbVar.d;
        Object objG = txbVar.a.g(eyb.b);
        String string = null;
        if (objG == null) {
            objG = null;
        }
        f78 f78Var = txbVar2.a;
        Object objG2 = f78Var.g(eyb.K);
        if (objG2 == null) {
            objG2 = null;
        }
        nnd nndVar = (nnd) objG2;
        Object objG3 = f78Var.g(eyb.z);
        if (objG3 == null) {
            objG3 = null;
        }
        vkb vkbVar = (vkb) objG3;
        if (nndVar != null) {
            int i2 = tn.a[nndVar.ordinal()];
            if (i2 != 1) {
                if (i2 != 2) {
                    if (i2 != 3) {
                        ygf.a();
                        return null;
                    }
                    if (objG == null) {
                        objG = resources.getString(R.string.indeterminate);
                    }
                } else if (vkbVar != null && vkbVar.a == 2 && objG == null) {
                    objG = resources.getString(R.string.state_off);
                }
            } else if (vkbVar != null && vkbVar.a == 2 && objG == null) {
                objG = resources.getString(R.string.state_on);
            }
        }
        Object objG4 = f78Var.g(eyb.J);
        if (objG4 == null) {
            objG4 = null;
        }
        Boolean bool = (Boolean) objG4;
        if (bool != null) {
            boolean zBooleanValue = bool.booleanValue();
            if ((vkbVar == null || vkbVar.a != 4) && objG == null) {
                objG = zBooleanValue ? resources.getString(R.string.selected) : resources.getString(R.string.not_selected);
            }
        }
        Object objG5 = f78Var.g(eyb.c);
        if (objG5 == null) {
            objG5 = null;
        }
        k3a k3aVar = (k3a) objG5;
        if (k3aVar != null) {
            if (k3aVar != k3a.c) {
                if (objG == null) {
                    hp1 hp1Var = k3aVar.b;
                    float f2 = hp1Var.b;
                    float f3 = hp1Var.a;
                    float f4 = f2 - f3 == 0.0f ? 0.0f : (k3aVar.a - f3) / (hp1Var.b - f3);
                    if (f4 < 0.0f) {
                        f4 = 0.0f;
                    }
                    if (f4 > 1.0f) {
                        f4 = 1.0f;
                    }
                    objG = resources.getString(R.string.template_percent, Integer.valueOf(f4 == 0.0f ? 0 : f4 == 1.0f ? 100 : iq7.v(Math.round(f4 * 100.0f), 1, 99)));
                }
            } else if (objG == null) {
                objG = resources.getString(R.string.in_progress);
            }
        }
        iyb iybVar = eyb.G;
        if (f78Var.c(iybVar)) {
            f78 f78Var2 = new zxb(zxbVar.a, true, zxbVar.c, txbVar2).k().a;
            Object objG6 = f78Var2.g(eyb.a);
            if (objG6 == null) {
                objG6 = null;
            }
            Collection collection = (Collection) objG6;
            if (collection == null || collection.isEmpty()) {
                Object objG7 = f78Var2.g(eyb.C);
                if (objG7 == null) {
                    objG7 = null;
                }
                Collection collection2 = (Collection) objG7;
                if (collection2 == null || collection2.isEmpty()) {
                    Object objG8 = f78Var2.g(iybVar);
                    if (objG8 == null) {
                        objG8 = null;
                    }
                    CharSequence charSequence = (CharSequence) objG8;
                    if (charSequence == null || charSequence.length() == 0) {
                        string = resources.getString(R.string.state_empty);
                    }
                }
            }
            objG = string;
        }
        return (String) objG;
    }

    public static final mx R(zxb zxbVar) {
        Object objG = zxbVar.d.a.g(eyb.G);
        if (objG == null) {
            objG = null;
        }
        mx mxVar = (mx) objG;
        Object objG2 = zxbVar.d.a.g(eyb.C);
        if (objG2 == null) {
            objG2 = null;
        }
        List list = (List) objG2;
        return mxVar == null ? list != null ? (mx) bu1.z0(list) : null : mxVar;
    }

    public static final va6 S(ib2 ib2Var) {
        va6 va6Var = (va6) ib2Var.o0(cd7.g);
        if (va6Var != null) {
            return va6Var;
        }
        ik4.m("Current context doesn't contain Job in it: ", ib2Var);
        return null;
    }

    public static final co1 T(yv2 yv2Var) {
        yv2 yv2VarH = yv2Var.h();
        if (yv2VarH == null || (yv2Var instanceof wx8)) {
            return null;
        }
        if (!(yv2VarH.h() instanceof wx8)) {
            return T(yv2VarH);
        }
        if (yv2VarH instanceof co1) {
            return (co1) yv2VarH;
        }
        return null;
    }

    public static final yh3 U(va6 va6Var, boolean z, xa6 xa6Var) {
        if (va6Var instanceof db6) {
            return ((db6) va6Var).O(z, xa6Var);
        }
        return va6Var.A0(xa6Var.l(), z, new k0(1, xa6Var, xa6.class, "invoke", "invoke(Ljava/lang/Throwable;)V", 0, 21));
    }

    public static final boolean V(ib2 ib2Var) {
        va6 va6Var = (va6) ib2Var.o0(cd7.g);
        if (va6Var != null) {
            return va6Var.f();
        }
        return true;
    }

    public static boolean W(Context context) {
        context.getClass();
        ((ko2) ((p15) op8.V(p15.class, f76.C(context.getApplicationContext())))).getClass();
        Set set = Collections.EMPTY_SET;
        gq7.l(set.size() <= 1, "Cannot bind the flag @DisableFragmentGetContextFix more than once.", new Object[0]);
        if (set.isEmpty()) {
            return true;
        }
        return ((Boolean) set.iterator().next()).booleanValue();
    }

    public static final boolean X(zxb zxbVar, Resources resources) {
        Object objG = zxbVar.d.a.g(eyb.a);
        if (objG == null) {
            objG = null;
        }
        List list = (List) objG;
        return !kng.H(zxbVar) && (zxbVar.d.c || (zxbVar.p() && ((list != null ? (String) bu1.z0(list) : null) != null || R(zxbVar) != null || Q(zxbVar, resources) != null || P(zxbVar))));
    }

    public static final r28 Y(ht6 ht6Var, rz2 rz2Var, hw8 hw8Var) {
        return new ct6(ht6Var, rz2Var, hw8Var);
    }

    public static final x1 Z(Object... objArr) {
        List listAsList = Arrays.asList(objArr);
        listAsList.getClass();
        return kgc.b.d(listAsList);
    }

    public static final void a(int i2, x12 x12Var, m45 m45Var, r28 r28Var) {
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(158446694);
        int i3 = (p65Var2.h(m45Var) ? 4 : 2) | i2 | 48;
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            amb ambVar = bmb.a;
            c09 c09VarJ = vn7.J(R.drawable.ic_add_12, 0, p65Var2);
            String strR = vo7.R(p65Var2, R.string.your_following_feed_customize_your_following);
            r28Var2 = o28.b;
            r28 r28VarL = jfc.l(r28Var2, 38.0f);
            sn3 sn3Var = kt7.b;
            p65Var = p65Var2;
            qv5.b(c09VarJ, strR, w2g.C(hlg.r(r40.y(B(r28VarL, 1.0f, ((zo7) p65Var2.j(sn3Var)).z, ambVar), ambVar), false, null, new vkb(0), m45Var, 11), 13.0f), ((zo7) p65Var2.j(sn3Var)).n, p65Var, 8, 0);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(m45Var, r28Var2, i2, i4);
        }
    }

    public static final l90 a0(x12 x12Var) {
        return new l90((Resources) ((p65) x12Var).j(eo.c), 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v4 */
    public static final void b(dr9 dr9Var, mkd mkdVar, boolean z, String str, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        o28 o28Var;
        ?? r0;
        p65 p65Var2;
        p65 p65Var3;
        pq9 pq9Var = dr9Var.i;
        p65 p65Var4 = (p65) x12Var;
        p65Var4.a0(-1091729604);
        if ((i2 & 6) == 0) {
            i3 = (p65Var4.f(dr9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var4.f(mkdVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var4.g(z) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var4.f(str) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var4.P(i3 & 1, (i3 & 1171) != 1170)) {
            mkd mkdVarA = mkd.a(mkdVar, ((zo7) p65Var4.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            o28 o28Var2 = o28.b;
            r28 r28VarN = bgf.N(o28Var2, "repost_story_byline");
            omb ombVarA = nmb.a(new h70(4.0f, true, new z10(21)), z46.n, p65Var4, 54);
            long j2 = p65Var4.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var4.l();
            r28 r28VarR = gx1.R(p65Var4, r28VarN);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var4.c0();
            if (p65Var4.S) {
                p65Var4.k(m45Var);
            } else {
                p65Var4.m0();
            }
            tp7.B(p65Var4, q12.f, ombVarA);
            tp7.B(p65Var4, q12.e, i89VarL);
            tp7.B(p65Var4, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var4, q12.h);
            tp7.B(p65Var4, q12.d, r28VarR);
            if (z) {
                p65Var4.Y(-1039401937);
                r0 = 0;
                o28Var = o28Var2;
                d46.a(pq9Var.c, hl0.XXXXS, null, null, null, null, null, 0.0f, 0, null, null, p65Var4, 48, 0, 4092);
                p65Var2 = p65Var4;
            } else {
                o28Var = o28Var2;
                r0 = 0;
                p65Var4.Y(-1048193630);
                p65Var2 = p65Var4;
            }
            p65Var2.p(r0);
            String strW = pq9Var.b;
            if (strW == null) {
                strW = km4.w(p65Var2, 1906140140, R.string.common_unknown_user, p65Var2, r0);
            } else {
                p65Var2.Y(1906139303);
                p65Var2.p(r0);
            }
            p65 p65Var5 = p65Var2;
            jjd.b(strW, bgf.N(new sq6(1.0f, r0), "repost_story_author"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var5, 0, 24960, 110588);
            p65 p65Var6 = p65Var5;
            if (str == null) {
                p65Var6.Y(-1038862507);
                p65Var3 = p65Var6;
            } else {
                p65Var6.Y(-1038862506);
                jjd.b(vo7.R(p65Var6, R.string.common_interpunct_no_space), null, 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkdVarA, p65Var6, 0, 24576, 114686);
                jjd.b(str, bgf.N(o28Var, "repost_story_published_at"), 0L, 0L, 0L, null, null, 0L, 0, false, 1, 0, null, mkdVarA, p65Var6, 48, 24576, 114684);
                p65Var3 = p65Var6;
            }
            p65Var3.p(r0);
            if (dr9Var.e) {
                p65Var3.Y(-1038401691);
                w2g.e(vn7.J(R.drawable.ic_member_16, r0, p65Var3), vo7.R(p65Var3, R.string.cd_member_only), bgf.N(jfc.l(o28Var, 16.0f), "repost_story_member_only"), null, null, 0.0f, null, p65Var3, 392, 120);
            } else {
                p65Var3.Y(-1048193630);
            }
            p65Var3.p(r0);
            p65Var3.p(true);
            p65Var = p65Var3;
        } else {
            p65Var4.S();
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w61(dr9Var, mkdVar, z, str, i2, 0);
        }
    }

    public static final void b0(float[] fArr, float[] fArr2) {
        float fL = L(fArr2, 0, fArr, 0);
        float fL2 = L(fArr2, 0, fArr, 1);
        float fL3 = L(fArr2, 0, fArr, 2);
        float fL4 = L(fArr2, 0, fArr, 3);
        float fL5 = L(fArr2, 1, fArr, 0);
        float fL6 = L(fArr2, 1, fArr, 1);
        float fL7 = L(fArr2, 1, fArr, 2);
        float fL8 = L(fArr2, 1, fArr, 3);
        float fL9 = L(fArr2, 2, fArr, 0);
        float fL10 = L(fArr2, 2, fArr, 1);
        float fL11 = L(fArr2, 2, fArr, 2);
        float fL12 = L(fArr2, 2, fArr, 3);
        float fL13 = L(fArr2, 3, fArr, 0);
        float fL14 = L(fArr2, 3, fArr, 1);
        float fL15 = L(fArr2, 3, fArr, 2);
        float fL16 = L(fArr2, 3, fArr, 3);
        fArr[0] = fL;
        fArr[1] = fL2;
        fArr[2] = fL3;
        fArr[3] = fL4;
        fArr[4] = fL5;
        fArr[5] = fL6;
        fArr[6] = fL7;
        fArr[7] = fL8;
        fArr[8] = fL9;
        fArr[9] = fL10;
        fArr[10] = fL11;
        fArr[11] = fL12;
        fArr[12] = fL13;
        fArr[13] = fL14;
        fArr[14] = fL15;
        fArr[15] = fL16;
    }

    public static final void c(sw5 sw5Var, long j2, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(557062696);
        int i3 = (p65Var.f(sw5Var) ? 4 : 2) | i2 | (p65Var.e(j2) ? 32 : 16);
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            k40.c(u57.a.a(a0(p65Var)), pxf.E(-511701656, new v61(sw5Var, j2, i4), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v61(sw5Var, j2, i2, 2);
        }
    }

    public static final y28 c0(b38 b38Var, y05 y05Var, ng8 ng8Var) {
        ev7 ev7VarL0;
        b38Var.getClass();
        y05Var.getClass();
        ng8Var.getClass();
        z05 z05Var = y05Var.a;
        if (!z05Var.c()) {
            co1 co1VarD = b38Var.X(y05Var.b()).h.d(z05Var.g(), ng8Var);
            y28 y28Var = co1VarD instanceof y28 ? (y28) co1VarD : null;
            if (y28Var != null) {
                return y28Var;
            }
            y28 y28VarC0 = c0(b38Var, y05Var.b(), ng8Var);
            co1 co1VarD2 = (y28VarC0 == null || (ev7VarL0 = y28VarC0.l0()) == null) ? null : ev7VarL0.d(z05Var.g(), ng8Var);
            if (co1VarD2 instanceof y28) {
                return (y28) co1VarD2;
            }
        }
        return null;
    }

    public static final void d(dr9 dr9Var, z61 z61Var, sh9 sh9Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        long jI;
        float f2;
        sn3 sn3Var;
        mkd mkdVarA;
        boolean z;
        int i4;
        mkd mkdVar;
        mkd mkdVar2;
        boolean z2;
        int i5;
        String strS;
        z61Var.getClass();
        sh9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1016708903);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dr9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.d(z61Var.ordinal()) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.g(false) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(sh9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            amb ambVarA = bmb.a(4.0f);
            p65Var.Y(2099696364);
            r28 r28VarB = B(r40.y(bgf.N(jfc.d(r28Var, 1.0f), "card_post"), ambVarA), 1.0f, ((zo7) p65Var.j(kt7.b)).z, ambVarA);
            p65Var.Y(267984727);
            p65Var.p(false);
            p65Var.p(false);
            r28 r28VarC = w2g.C(r28VarB, 12.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i7 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                int i8 = y61.a[z61Var.ordinal()];
                if (i8 == 1) {
                    jI = pwd.i(100.0f, 66.0f);
                } else if (i8 == 2) {
                    jI = pwd.i(133.0f, 88.0f);
                } else {
                    if (i8 != 3) {
                        ygf.a();
                        return;
                    }
                    jI = pwd.i(160.0f, 106.0f);
                }
                objM = new yj3(jI);
                p65Var.j0(objM);
            }
            c(dr9Var.b, ((yj3) objM).a, p65Var, 0);
            boolean z4 = i7 == 32;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                int i9 = y61.a[z61Var.ordinal()];
                if (i9 == 1) {
                    f2 = 10.0f;
                } else {
                    if (i9 != 2 && i9 != 3) {
                        ygf.a();
                        return;
                    }
                    f2 = 16.0f;
                }
                objM2 = new vj3(f2);
                p65Var.j0(objM2);
            }
            float f3 = ((vj3) objM2).a;
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.l(o28Var, f3));
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            int i10 = i3;
            wv1 wv1VarA = uv1.a(new h70(4.0f, true, new z10(21)), z46.p, p65Var, 6);
            long j3 = p65Var.T;
            int i11 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i11, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            int[] iArr = y61.a;
            int i12 = iArr[z61Var.ordinal()];
            if (i12 == 1) {
                p65Var.Y(-1079653237);
                sn3Var = jt7.c;
                mkdVarA = mkd.a(((bu7) p65Var.j(sn3Var)).j, 0L, en7.B(14), null, null, null, 0L, 0L, null, 0, en7.B(18), null, null, 16646141);
                z = false;
                p65Var.p(false);
            } else {
                if (i12 != 2 && i12 != 3) {
                    throw ho2.L(p65Var, -1079655647, false);
                }
                z = false;
                p65Var.Y(-1079648438);
                sn3Var = jt7.c;
                mkdVarA = ((bu7) p65Var.j(sn3Var)).j;
                p65Var.p(false);
            }
            mkd mkdVar3 = mkdVarA;
            int i13 = iArr[z61Var.ordinal()];
            if (i13 != 1) {
                if (i13 != 2) {
                    i4 = 3;
                    if (i13 != 3) {
                        throw ho2.L(p65Var, -1079646189, z);
                    }
                } else {
                    i4 = 3;
                }
                p65Var.Y(-1079640344);
                mkdVar = ((bu7) p65Var.j(sn3Var)).n;
                p65Var.p(z);
            } else {
                i4 = 3;
                p65Var.Y(-1079644087);
                mkdVar = ((bu7) p65Var.j(sn3Var)).o;
                p65Var.p(z);
            }
            mkd mkdVar4 = mkdVar;
            String strW = dr9Var.c;
            if (strW == null) {
                strW = km4.w(p65Var, -1079636945, R.string.common_untitled_story, p65Var, z);
            } else {
                p65Var.Y(-1079637596);
                p65Var.p(z);
            }
            String str = strW;
            int i14 = i4;
            e(str, mkdVar3, dr9Var.d, mkdVar4, p65Var, 0);
            int i15 = iArr[z61Var.ordinal()];
            if (i15 == 1) {
                p65Var.Y(-1079626679);
                mkdVar2 = ((bu7) p65Var.j(sn3Var)).o;
                p65Var.p(false);
            } else {
                if (i15 != 2 && i15 != i14) {
                    throw ho2.L(p65Var, -1079628781, false);
                }
                p65Var.Y(-1079622936);
                mkdVar2 = ((bu7) p65Var.j(sn3Var)).n;
                p65Var.p(false);
            }
            boolean z5 = i7 == 32;
            Object objM3 = p65Var.M();
            if (z5 || objM3 == uobVar) {
                int i16 = iArr[z61Var.ordinal()];
                if (i16 == 1) {
                    z2 = false;
                } else {
                    if (i16 != 2 && i16 != i14) {
                        ygf.a();
                        return;
                    }
                    z2 = true;
                }
                objM3 = Boolean.valueOf(z2);
                p65Var.j0(objM3);
            }
            boolean zBooleanValue = ((Boolean) objM3).booleanValue();
            Long l2 = dr9Var.f;
            n92 n92Var = null;
            if (l2 == null) {
                p65Var.Y(891928375);
                i5 = 0;
                p65Var.p(false);
                strS = null;
            } else {
                i5 = 0;
                p65Var.Y(891928376);
                strS = vo7.S((Context) p65Var.j(eo.b), l2.longValue());
                p65Var.p(false);
            }
            int i17 = i10 & 14;
            b(dr9Var, mkdVar2, zBooleanValue, strS, p65Var, i17);
            p65Var.p(true);
            p65Var.p(true);
            int i18 = ((i10 & 7168) == 2048 ? 1 : i5) | (i17 == 4 ? 1 : i5);
            Object objM4 = p65Var.M();
            if (i18 != 0 || objM4 == uobVar) {
                objM4 = new x61(sh9Var, dr9Var, n92Var, i5);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 9, dr9Var, z61Var, sh9Var, r28Var);
        }
    }

    public static final long d0(float f2, long j2) {
        float fMax = Math.max(0.0f, Float.intBitsToFloat((int) (j2 >> 32)) - f2);
        float fMax2 = Math.max(0.0f, Float.intBitsToFloat((int) (j2 & 4294967295L)) - f2);
        return (((long) Float.floatToRawIntBits(fMax)) << 32) | (((long) Float.floatToRawIntBits(fMax2)) & 4294967295L);
    }

    public static final void e(String str, mkd mkdVar, String str2, mkd mkdVar2, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(583194274);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(mkdVar) ? 32 : 16) | (p65Var.f(str2) ? 256 : 128) | (p65Var.f(mkdVar2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r40.h(jfc.d(o28.b, 1.0f), null, pxf.E(286821772, new fd3(str, mkdVar, str2, mkdVar2, 24), p65Var), p65Var, 3078, 6);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 16, str, mkdVar, str2, mkdVar2);
        }
    }

    public static final wua e0(bo4 bo4Var, sb2 sb2Var, m7c m7cVar, Object obj) {
        opg opgVarH = H(bo4Var);
        xpc xpcVarJ = vv2.j(obj);
        return new wua(xpcVarJ, vx0.b0(sb2Var, (ib2) opgVarH.d, m7cVar.equals(l7c.a) ? wb2.DEFAULT : wb2.UNDISPATCHED, new fl2(m7cVar, (bo4) opgVarH.b, xpcVarJ, obj, (n92) null)));
    }

    public static final void f(ypd ypdVar, mpd mpdVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1830615083);
        int i3 = i2 | (p65Var.f(ypdVar) ? 4 : 2) | (p65Var.f(mpdVar) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.G(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), 0.0f, 0.0f, 0.0f, 32.0f, 7), 3, 1.0f);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            jjd.b(ypdVar.b, bgf.N(o28Var, "category_header_" + ypdVar.a), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).j, p65Var, 0, 0, 131068);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(o28Var, 16.0f));
            int i7 = 21;
            m40.p(null, new h70(12.0f, true, new z10(i7)), new h70(12.0f, true, new z10(i7)), null, 0, 0, pxf.E(929195587, new dyc(ypdVar, 7, mpdVar), p65Var), p65Var, 1573296, 57);
            b09.H(p65Var, true, true, true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 6, ypdVar, mpdVar, r28Var2);
        }
    }

    public static final az5 f0(Iterable iterable) {
        iterable.getClass();
        az5 az5Var = iterable instanceof az5 ? (az5) iterable : null;
        return az5Var == null ? g0(iterable) : az5Var;
    }

    public static final void g(final int i2, int i3, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        final long j3 = j2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-824672475);
        int i4 = i3 | 6;
        if ((i3 & 48) == 0) {
            i4 |= p65Var.e(j3) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= p65Var.d(i2) ? 256 : 128;
        }
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            p65Var.U();
            int i5 = i3 & 1;
            o28 o28Var = o28.b;
            if (i5 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.G(w2g.E(jfc.d(r28Var3, 1.0f), 24.0f, 0.0f, 2), 0.0f, 0.0f, 0.0f, 32.0f, 7), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            int i7 = i4;
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            r28 r28Var4 = r28Var3;
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
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
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j6 = p65Var.T;
            int i9 = (int) (j6 ^ (j6 >>> 32));
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
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            ok7.r(gq7.c(i2).c(48, 260), (i7 << 6) & 7168, 4, j2, p65Var, null, ((bu7) p65Var.j(jt7.c)).j);
            j3 = j2;
            hp7.t(p65Var, jfc.e(o28Var, 16.0f));
            int i10 = 21;
            m40.p(null, new h70(12.0f, true, new z10(i10)), new h70(12.0f, true, new z10(i10)), null, 0, 0, pxf.E(1520393021, new c55() { // from class: kpd
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    ((gq4) obj).getClass();
                    p65 p65Var2 = (p65) x12Var2;
                    if (p65Var2.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                        int iC = gq7.c(i2).c(2, 48);
                        for (int i11 = 0; i11 < iC; i11++) {
                            bo.u(gq7.c(i11).c(48, 86), 0, j3, p65Var2, null);
                        }
                    } else {
                        p65Var2.S();
                    }
                    return c1e.a;
                }
            }, p65Var), p65Var, 1573296, 57);
            p65Var = p65Var;
            b09.H(p65Var, true, true, true);
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pv2(r28Var2, j3, i2, i3, 2);
        }
    }

    public static final x1 g0(Iterable iterable) {
        iterable.getClass();
        x1 x1Var = iterable instanceof x1 ? (x1) iterable : null;
        if (x1Var != null) {
            return x1Var;
        }
        w89 w89Var = iterable instanceof w89 ? (w89) iterable : null;
        x1 x1VarD = w89Var != null ? w89Var.d() : null;
        if (x1VarD != null) {
            return x1VarD;
        }
        kgc kgcVar = kgc.b;
        kgcVar.getClass();
        if (iterable instanceof Collection) {
            return kgcVar.d((Collection) iterable);
        }
        w89 w89VarF = kgcVar.f();
        bu1.n0(iterable, w89VarF);
        return w89VarF.d();
    }

    public static final void h(zpd zpdVar, mpd mpdVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        Object ibdVar;
        mpd mpdVar2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(850113387);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(zpdVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(mpdVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z = zpdVar.b;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                ibdVar = new ibd(0, mpdVar, mpd.class, "refresh", "refresh()V", 0, 8);
                mpdVar2 = mpdVar;
                p65Var2.j0(ibdVar);
            } else {
                mpdVar2 = mpdVar;
                ibdVar = objM;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) ibdVar), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-973050247, new ec(zpdVar, 11, mpdVar2), p65Var2), p65Var, i3 & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 17, zpdVar, mpdVar, r28Var);
        }
    }

    public static final m90 h0(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        return new m90((Resources) p65Var.j(eo.c), (Context) p65Var.j(eo.b));
    }

    public static final void i(final y09 y09Var, BlockLayout blockLayout, boolean z, boolean z2, final a19 a19Var, gx5 gx5Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28VarE;
        cu cuVar;
        ar0 ar0Var;
        fn fnVar;
        r28 r28VarB;
        gx5 gx5VarA;
        uob uobVar;
        x45 pi9Var;
        pi9 pi9Var2;
        ar0 ar0Var2;
        long j2;
        boolean z3;
        r28 r28VarM;
        uob uobVar2;
        int i3;
        uu1 uu1Var;
        boolean z4;
        final a19 a19Var2 = a19Var;
        nr5 nr5Var = rv8.r;
        ar0 ar0Var3 = z46.h;
        a19Var2.getClass();
        gx5Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-135669831);
        int i4 = i2 | (p65Var.f(y09Var) ? 4 : 2) | (p65Var.d(blockLayout == null ? -1 : blockLayout.ordinal()) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | (p65Var.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(a19Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(gx5Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(r28Var) ? 1048576 : 524288);
        if (p65Var.P(i4 & 1, (i4 & 599187) != 599186)) {
            sn3 sn3Var = eo.b;
            Context context = (Context) p65Var.j(sn3Var);
            if (z || blockLayout == BlockLayout.FULL_WIDTH) {
                p65Var.Y(-175032495);
                p65Var.p(false);
                r28VarE = r28Var;
            } else {
                p65Var.Y(-175326530);
                r28VarE = w2g.E(r28Var, ((m73) p65Var.j(z22.h)).N(((Resources) p65Var.j(eo.c)).getDimensionPixelSize(R.dimen.common_paragraph_container_horizontal_padding)), 0.0f, 2);
                p65Var.p(false);
            }
            ar0 ar0Var4 = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var4, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            cu cuVar2 = q12.f;
            tp7.B(p65Var, cuVar2, zk7VarC);
            cu cuVar3 = q12.e;
            tp7.B(p65Var, cuVar3, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar4 = q12.g;
            tp7.B(p65Var, cuVar4, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var, fnVar2);
            cu cuVar5 = q12.d;
            tp7.B(p65Var, cuVar5, r28VarR);
            o28 o28Var = o28.b;
            if (z2) {
                ar0Var = ar0Var3;
                p65Var.Y(-1817935459);
                cuVar = cuVar5;
                fnVar = fnVar2;
                r28VarB = B(o28Var, 4.0f, ((zo7) p65Var.j(kt7.b)).A, nr5Var);
                p65Var.p(false);
            } else {
                cuVar = cuVar5;
                ar0Var = ar0Var3;
                fnVar = fnVar2;
                p65Var.Y(-1817830493);
                p65Var.p(false);
                r28VarB = o28Var;
            }
            int i6 = i4 & 14;
            boolean z5 = i6 == 4;
            Object objM = p65Var.M();
            uob uobVar3 = w12.a;
            if (z5 || objM == uobVar3) {
                objM = bjc.b(new gp3(context, blockLayout, y09Var, z));
                p65Var.j0(objM);
            }
            cfc cfcVarA = ((x19) ((upc) objM).getValue()).a();
            xe3 xe3Var = cfcVarA.b;
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar3) {
                objM2 = qo7.u(null);
                p65Var.j0(objM2);
            }
            l78 l78Var = (l78) objM2;
            nx5 nx5Var = new nx5(context);
            nx5Var.c = y09Var.getData();
            nx5Var.c(cfcVarA);
            boolean z6 = y09Var instanceof v09;
            tx5.a(nx5Var, z6 || (y09Var instanceof w09) || (y09Var instanceof s09) || (y09Var instanceof x09));
            rx5 rx5VarA = nx5Var.a();
            boolean z7 = y09Var instanceof t09;
            if (z7 || (y09Var instanceof w09)) {
                p65Var.Y(357040370);
                p65Var.p(false);
                gx5VarA = gx5Var;
            } else {
                p65Var.Y(357042346);
                gx5VarA = yec.a((Context) p65Var.j(sn3Var));
                p65Var.p(false);
            }
            c09 c09Var = (c09) l78Var.getValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar3) {
                uobVar = uobVar3;
                objM3 = new ws(l78Var, 7);
                p65Var.j0(objM3);
            } else {
                uobVar = uobVar3;
            }
            x45 x45Var = (x45) objM3;
            n90 n90Var = new n90(rx5VarA, (z80) p65Var.j(t57.a), gx5VarA);
            int i7 = ppe.b;
            if (c09Var == null) {
                pi9Var = g90.v;
                pi9Var2 = null;
            } else {
                pi9Var2 = null;
                pi9Var = new pi9(c09Var, pi9Var2, pi9Var2, 24);
            }
            g90 g90VarT = dm2.T(n90Var, pi9Var, x45Var == null ? pi9Var2 : new pi9(pi9Var2, x45Var, pi9Var2, 25), v82.b, p65Var);
            boolean z8 = y09Var instanceof w09;
            if (z8) {
                p65Var.Y(-1816170009);
                String color = ((w09) y09Var).b.getColor();
                if (color != null) {
                    ar0Var2 = ar0Var4;
                    uu1Var = new uu1(op8.j(Color.parseColor(color)));
                } else {
                    ar0Var2 = ar0Var4;
                    uu1Var = null;
                }
                if (uu1Var == null) {
                    p65Var.Y(357058905);
                    j2 = ((zo7) p65Var.j(kt7.b)).b;
                    z4 = false;
                    p65Var.p(false);
                } else {
                    z4 = false;
                    p65Var.Y(357055867);
                    p65Var.p(false);
                    j2 = uu1Var.a;
                }
                p65Var.p(z4);
            } else {
                ar0Var2 = ar0Var4;
                if (z7) {
                    p65Var.Y(-1815978553);
                    String color2 = ((t09) y09Var).b.getColor();
                    uu1 uu1Var2 = color2 != null ? new uu1(op8.j(Color.parseColor(color2))) : null;
                    if (uu1Var2 == null) {
                        p65Var.Y(357065081);
                        j2 = ((zo7) p65Var.j(kt7.b)).b;
                        z3 = false;
                        p65Var.p(false);
                    } else {
                        z3 = false;
                        p65Var.Y(357062043);
                        p65Var.p(false);
                        j2 = uu1Var2.a;
                    }
                    p65Var.p(z3);
                } else {
                    p65Var.Y(357067257);
                    j2 = ((zo7) p65Var.j(kt7.b)).b;
                    p65Var.p(false);
                }
            }
            boolean zEquals = xe3Var.equals(ve3.a);
            xe3 xe3Var2 = cfcVarA.a;
            if (zEquals) {
                float fB0 = vv2.b0(xe3Var2, m73Var);
                r28VarM = jfc.m(r28VarB, fB0, fB0 * 0.75f);
            } else {
                r28VarM = jfc.m(r28VarB, vv2.b0(xe3Var2, m73Var), vv2.b0(xe3Var, m73Var));
            }
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarM);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar2, zk7VarC2);
            tp7.B(p65Var, cuVar3, i89VarL2);
            ka1.z(i8, p65Var, cuVar4, p65Var, fnVar);
            tp7.B(p65Var, cuVar, r28VarR2);
            iy0 iy0Var = iy0.a;
            final int i9 = 0;
            dy0.a(flb.a0(iy0Var.b(o28Var), j2, nr5Var), p65Var, 0);
            w2g.e(g90VarT, null, iy0Var.b(bgf.N(o28Var, "image")), null, null, 0.0f, null, p65Var, 48, 120);
            p65Var = p65Var;
            if ((y09Var instanceof s09) || z7) {
                ar0 ar0Var5 = ar0Var;
                p65Var.Y(-1028814938);
                dy0.a(flb.a0(iy0Var.b(o28Var), uu1.b(0.9f, xo7.i), nr5Var), p65Var, 0);
                c09 c09VarJ = vn7.J(R.drawable.ic_sync_problem_24, 0, p65Var);
                String strR = vo7.R(p65Var, R.string.common_retry);
                long j5 = uu1.d;
                r28 r28VarA = iy0Var.a(bgf.N(o28Var, "retry"), ar0Var5);
                boolean z9 = ((i4 & 57344) == 16384) | (i6 == 4);
                Object objM4 = p65Var.M();
                if (z9) {
                    uobVar2 = uobVar;
                } else {
                    uobVar2 = uobVar;
                    if (objM4 == uobVar2) {
                    }
                    i3 = i6;
                    qv5.b(c09VarJ, strR, hlg.r(r28VarA, false, null, null, (m45) objM4, 15), j5, p65Var, 3080, 0);
                    p65Var.p(false);
                }
                objM4 = new m45() { // from class: hp3
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i10 = i9;
                        c1e c1eVar = c1e.a;
                        y09 y09Var2 = y09Var;
                        a19 a19Var3 = a19Var;
                        switch (i10) {
                            case 0:
                                a19Var3.getClass();
                                a19Var3.a.getListener().x0(y09Var2);
                                break;
                            default:
                                String paragraphName = y09Var2.getParagraphName();
                                a19Var3.getClass();
                                paragraphName.getClass();
                                ParagraphEditImageLayout paragraphEditImageLayout = a19Var3.a;
                                paragraphEditImageLayout.getListener().A(paragraphEditImageLayout, paragraphName);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM4);
                i3 = i6;
                qv5.b(c09VarJ, strR, hlg.r(r28VarA, false, null, null, (m45) objM4, 15), j5, p65Var, 3080, 0);
                p65Var.p(false);
            } else {
                if (z6 || z8 || (y09Var instanceof x09)) {
                    ar0 ar0Var6 = ar0Var;
                    p65Var.Y(-1027878986);
                    r28 r28VarB2 = iy0Var.b(o28Var);
                    sn3 sn3Var2 = kt7.b;
                    dy0.a(flb.a0(r28VarB2, uu1.b(0.6f, ((zo7) p65Var.j(sn3Var2)).c), nr5Var), p65Var, 0);
                    xz5.o(w2g.C(jfc.l(iy0Var.a(bgf.N(o28Var, "loading"), ar0Var6), 24.0f), 2.0f), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 2.0f, ((zo7) p65Var.j(sn3Var2)).d, 0L, 0, p65Var, 384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                    p65Var = p65Var;
                    p65Var.p(false);
                } else if (y09Var instanceof r09) {
                    p65Var.Y(-1027061609);
                    dy0.a(flb.a0(iy0Var.b(o28Var), uu1.b(0.9f, xo7.i), nr5Var), p65Var, 0);
                    qv5.b(vn7.J(R.drawable.ic_sync_problem_24, 0, p65Var), vo7.R(p65Var, R.string.common_oops), iy0Var.a(bgf.N(o28Var, "error"), ar0Var), uu1.d, p65Var, 3080, 0);
                    p65Var.p(false);
                } else {
                    if (!(y09Var instanceof u09)) {
                        throw ho2.L(p65Var, -1418664619, false);
                    }
                    p65Var.Y(-1418582359);
                    p65Var.p(false);
                }
                i3 = i6;
                uobVar2 = uobVar;
            }
            p65Var.p(true);
            if (z2) {
                p65Var.Y(-1812329481);
                c09 c09VarJ2 = vn7.J(R.drawable.ic_close_16, 0, p65Var);
                String strR2 = vo7.R(p65Var, R.string.common_close);
                long j6 = uu1.d;
                r28 r28VarC = w2g.C(flb.a0(iy0Var.a(bgf.N(o28Var, "focus_icon"), z46.f), ((zo7) p65Var.j(kt7.b)).e, nr5Var), 6.0f);
                boolean z10 = ((i4 & 57344) == 16384) | (i3 == 4);
                Object objM5 = p65Var.M();
                if (z10 || objM5 == uobVar2) {
                    a19Var2 = a19Var;
                    final int i10 = 1;
                    objM5 = new m45() { // from class: hp3
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i102 = i10;
                            c1e c1eVar = c1e.a;
                            y09 y09Var2 = y09Var;
                            a19 a19Var3 = a19Var2;
                            switch (i102) {
                                case 0:
                                    a19Var3.getClass();
                                    a19Var3.a.getListener().x0(y09Var2);
                                    break;
                                default:
                                    String paragraphName = y09Var2.getParagraphName();
                                    a19Var3.getClass();
                                    paragraphName.getClass();
                                    ParagraphEditImageLayout paragraphEditImageLayout = a19Var3.a;
                                    paragraphEditImageLayout.getListener().A(paragraphEditImageLayout, paragraphName);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM5);
                } else {
                    a19Var2 = a19Var;
                }
                qv5.b(c09VarJ2, strR2, hlg.r(r28VarC, false, null, null, (m45) objM5, 15), j6, p65Var, 3080, 0);
            } else {
                a19Var2 = a19Var;
                p65Var.Y(-1820328349);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ip3(y09Var, blockLayout, z, z2, a19Var2, gx5Var, r28Var, i2);
        }
    }

    public static void i0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.h(i2, ((Boolean) list.get(i3)).booleanValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            ((Boolean) list.get(i5)).getClass();
            i4++;
        }
        htfVar.q(i4);
        while (i3 < list.size()) {
            htfVar.b(((Boolean) list.get(i3)).booleanValue() ? (byte) 1 : (byte) 0);
            i3++;
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public static void j0(Object obj, Object obj2) {
        ytf ytfVar = (ytf) obj;
        yuf yufVar = ytfVar.zzb;
        yuf yufVar2 = ((ytf) obj2).zzb;
        yuf yufVar3 = yuf.f;
        if (!yufVar3.equals(yufVar2)) {
            if (yufVar3.equals(yufVar)) {
                int i2 = yufVar.a + yufVar2.a;
                int[] iArrCopyOf = Arrays.copyOf(yufVar.b, i2);
                System.arraycopy(yufVar2.b, 0, iArrCopyOf, yufVar.a, yufVar2.a);
                Object[] objArrCopyOf = Arrays.copyOf(yufVar.c, i2);
                System.arraycopy(yufVar2.c, 0, objArrCopyOf, yufVar.a, yufVar2.a);
                yufVar = new yuf(i2, iArrCopyOf, objArrCopyOf, true);
            } else {
                yufVar.getClass();
                if (!yufVar2.equals(yufVar3)) {
                    if (!yufVar.e) {
                        rd6.b();
                        return;
                    }
                    int i3 = yufVar.a + yufVar2.a;
                    yufVar.b(i3);
                    System.arraycopy(yufVar2.b, 0, yufVar.b, yufVar.a, yufVar2.a);
                    System.arraycopy(yufVar2.c, 0, yufVar.c, yufVar.a, yufVar2.a);
                    yufVar.a = i3;
                }
            }
        }
        ytfVar.zzb = yufVar;
    }

    public static final void k(zpd zpdVar, mpd mpdVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        Object ibdVar;
        boolean z;
        o28 o28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1781553023);
        int i3 = i2 | (p65Var.f(zpdVar) ? 4 : 2) | (p65Var.f(mpdVar) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var2 = o28.b;
            r28 r28VarA0 = flb.a0(jfc.d(o28Var2, 1.0f), ((zo7) p65Var.j(kt7.b)).a, rv8.r);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.e(o28Var2, 16.0f));
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                z = true;
                o28Var = o28Var2;
                ibdVar = new ibd(0, mpdVar, mpd.class, "onContinueClicked", "onContinueClicked()V", 0, 10);
                p65Var.j0(ibdVar);
            } else {
                ibdVar = objM;
                z = true;
                o28Var = o28Var2;
            }
            kyd.f((m45) ((qh6) ibdVar), null, zpdVar.c, null, p65Var, 0, 10);
            vv2.b(zpdVar.d != null ? z : false, null, null, null, null, pxf.E(1317906511, new nra(12, zpdVar), p65Var), p65Var, 1572870);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(o28Var, 24.0f));
            p65Var.p(z);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 5, zpdVar, mpdVar, r28Var2);
        }
    }

    public static boolean k0(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static final void l(int i2, long j2, x12 x12Var, r28 r28Var) {
        p65 p65Var;
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(85364447);
        int i3 = i2 | 6;
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.e(j2) ? 32 : 16;
        }
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var2.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var2.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var2.S();
                r28Var3 = r28Var;
            }
            p65Var2.q();
            r28 r28VarA0 = flb.a0(jfc.d(r28Var3, 1.0f), ((zo7) p65Var2.j(kt7.b)).a, rv8.r);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var2, 48);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarA0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            p65Var = p65Var2;
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.e(o28Var, 16.0f));
            kyd.g(i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, j2, p65Var, null);
            hp7.t(p65Var, jfc.e(o28Var, 8.0f));
            ok7.r(200.0f, ((i3 << 6) & 7168) | 432, 0, j2, p65Var, w2g.E(o28Var, 24.0f, 0.0f, 2), ((bu7) p65Var.j(jt7.c)).m);
            hp7.t(p65Var, jfc.e(o28Var, 24.0f));
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j2, i2, 13);
        }
    }

    public static int l0(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iT = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iT += htf.t(((Integer) list.get(i2)).intValue());
        }
        return iT;
    }

    public static final void m(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-53601788);
        int i3 = i2 | (p65Var.d(3) ? 4 : 2) | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 24.0f, 32.0f, 2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(2131231055, 0, p65Var);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, null, ((zo7) p65Var.j(sn3Var)).n, p65Var, 56, 4);
            String strN = y30.n(12.0f, R.string.onboarding_topics_title, p65Var, p65Var, o28Var);
            sn3 sn3Var2 = jt7.c;
            jjd.b(strN, bgf.N(o28Var, "topics_title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).F, p65Var, 48, 0, 130044);
            hp7.t(p65Var, jfc.e(o28Var, 4.0f));
            jjd.b(vo7.Q(R.string.onboarding_topics_subtitle, new Object[]{3}, p65Var), bgf.N(o28Var, "topics_subtitle"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).l, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 130044);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var2, i2, 2);
        }
    }

    public static void m0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.e(i2, Double.doubleToRawLongBits(((Double) list.get(i3)).doubleValue()));
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            ((Double) list.get(i5)).getClass();
            i4 += 8;
        }
        htfVar.q(i4);
        while (i3 < list.size()) {
            htfVar.i(Double.doubleToRawLongBits(((Double) list.get(i3)).doubleValue()));
            i3++;
        }
    }

    public static final void n(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1117002449);
        int i3 = i2 | 6;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j2) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarG = w2g.G(jfc.d(r28Var3, 1.0f), 24.0f, 0.0f, 24.0f, 32.0f, 2);
            yq0 yq0Var = z46.q;
            wv1 wv1VarA = uv1.a(qb8.c, yq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            dy0.a(flb.a0(jfc.m(o28Var, 87.0f, 80.0f), j2, bmb.a), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 12.0f));
            sn3 sn3Var = jt7.c;
            int i6 = ((i3 << 6) & 7168) | 48;
            ok7.r(360.0f, i6, 4, j2, p65Var, null, ((bu7) p65Var.j(sn3Var)).E);
            hp7.t(p65Var, jfc.e(o28Var, 4.0f));
            ok7.r(260.0f, i6, 0, j2, p65Var, new dr5(yq0Var), ((bu7) p65Var.j(sn3Var)).l);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j2, i2, 14);
        }
    }

    public static void n0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.l(i2, ((Integer) list.get(i3)).intValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int iT = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            iT += htf.t(((Integer) list.get(i4)).intValue());
        }
        htfVar.q(iT);
        while (i3 < list.size()) {
            htfVar.k(((Integer) list.get(i3)).intValue());
            i3++;
        }
    }

    public static final void o(final ol5 ol5Var, final ek8 ek8Var, x12 x12Var, int i2) {
        int i3;
        String str = ol5Var.h;
        String strD = ol5Var.f;
        int i4 = ol5Var.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-261938692);
        int i5 = (p65Var.f(ol5Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i5 & 1, (i5 & 19) != 18)) {
            String str2 = ol5Var.d;
            boolean z = ol5Var.a;
            kx kxVarW = ho2.w(p65Var, 1680000047);
            if (i4 == 1) {
                p65Var.Y(608531367);
                p65Var.p(false);
                i3 = 1;
            } else {
                i3 = 1;
                p65Var.Y(608532831);
                int i6 = i4 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i6, new Object[]{strD, Integer.valueOf(i6)}, p65Var);
                p65Var.p(false);
            }
            Object[] objArr = new Object[2];
            objArr[0] = strD;
            objArr[i3] = str;
            String strQ = vo7.Q(R.string.notification_type_highlight_was_piled_onto_rollup, objArr, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, strD, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, strD.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j2 = ol5Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_quote);
                int i7 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i8 = i5 & 14;
                int i9 = (i7 == 32 ? i3 : 0) | (i8 == 4 ? i3 : 0);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i9 != 0 || objM == uobVar) {
                    objM = new m45() { // from class: pl5
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i10 = i;
                            c1e c1eVar = c1e.a;
                            ol5 ol5Var2 = ol5Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i10) {
                                case 0:
                                    ek8Var2.n(ol5Var2.c, ol5Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(ol5Var2.e, ol5Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i10 = (i7 == 32 ? i3 : 0) | (i8 == 4 ? i3 : 0);
                Object objM2 = p65Var.M();
                if (i10 != 0 || objM2 == uobVar) {
                    final int i11 = i3;
                    objM2 = new m45() { // from class: pl5
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i102 = i11;
                            c1e c1eVar = c1e.a;
                            ol5 ol5Var2 = ol5Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i102) {
                                case 0:
                                    ek8Var2.n(ol5Var2.c, ol5Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(ol5Var2.e, ol5Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str2, numValueOf, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(ol5Var, ek8Var, i2, 12);
        }
    }

    public static void o0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.d(i2, ((Integer) list.get(i3)).intValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            ((Integer) list.get(i5)).getClass();
            i4 += 4;
        }
        htfVar.q(i4);
        while (i3 < list.size()) {
            htfVar.c(((Integer) list.get(i3)).intValue());
            i3++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x026d  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x027c  */
    /* JADX WARN: Removed duplicated region for block: B:132:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00e3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void p(final java.lang.String r30, final java.lang.String r31, final long r32, final long r34, defpackage.r28 r36, final com.medium.android.domain.post.models.Highlight r37, boolean r38, int r39, defpackage.x45 r40, defpackage.x12 r41, final int r42, final int r43) {
        /*
            Method dump skipped, instruction units count: 658
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bo.p(java.lang.String, java.lang.String, long, long, r28, com.medium.android.domain.post.models.Highlight, boolean, int, x45, x12, int, int):void");
    }

    public static int p0(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iT = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iT += htf.t(((Integer) list.get(i2)).intValue());
        }
        return iT;
    }

    public static wa6 q() {
        return new wa6(null);
    }

    public static void q0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.e(i2, ((Long) list.get(i3)).longValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            ((Long) list.get(i5)).getClass();
            i4 += 8;
        }
        htfVar.q(i4);
        while (i3 < list.size()) {
            htfVar.i(((Long) list.get(i3)).longValue());
            i3++;
        }
    }

    public static final void r(int i2, long j2, x12 x12Var, r28 r28Var) {
        long j3;
        long j4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-339081315);
        int i3 = (i2 & 6) == 0 ? i2 | (p65Var.f(r28Var) ? 4 : 2) : i2;
        if ((i2 & 48) == 0) {
            i3 |= 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                j4 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                j4 = j2;
            }
            p65Var.q();
            r28 r28VarV = m40.V(bgf.N(r28Var.b(jfc.c), "loading_state"), p65Var, 0);
            rz5 rz5Var = qb8.c;
            wv1 wv1VarA = uv1.a(rz5Var, z46.p, p65Var, 0);
            long j5 = p65Var.T;
            int i4 = (int) (j5 ^ (j5 >>> 32));
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
            r28 r28VarN = bgf.N(jfc.d(o28.b, 1.0f).b(new sq6(1.0f, true)), "topics_content");
            wv1 wv1VarA2 = uv1.a(rz5Var, z46.q, p65Var, 48);
            long j6 = p65Var.T;
            int i5 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            n(0, j4, p65Var, null);
            p65Var.Y(104835332);
            for (int i6 = 0; i6 < 3; i6++) {
                g(i6, 0, j4, p65Var, null);
            }
            p65Var.p(false);
            p65Var.p(true);
            l(0, j4, p65Var, null);
            p65Var.p(true);
            j3 = j4;
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var, j3, i2, 12);
        }
    }

    public static int r0(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iT = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iT += htf.t(((Long) list.get(i2)).longValue());
        }
        return iT;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1, types: [int] */
    /* JADX WARN: Type inference failed for: r5v20 */
    public static final void s(c5c c5cVar, r28 r28Var, x12 x12Var, int i2) {
        ?? r5;
        p65 p65Var;
        fn fnVar;
        cu cuVar;
        cu cuVar2;
        boolean z;
        cu cuVar3;
        ot2 ot2Var;
        p65 p65Var2;
        p65 p65Var3;
        p65 p65Var4;
        p65 p65Var5;
        c5cVar.getClass();
        p65 p65Var6 = (p65) x12Var;
        p65Var6.a0(-1338032752);
        int i3 = i2 | (p65Var6.f(c5cVar) ? 4 : 2) | (p65Var6.f(r28Var) ? 32 : 16);
        int i4 = 0;
        if (p65Var6.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarO = jfc.o(r28Var, 0.0f, 0.0f, 350.0f, 622.0f, 3);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var6.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var6.l();
            r28 r28VarR = gx1.R(p65Var6, r28VarO);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var6.c0();
            if (p65Var6.S) {
                p65Var6.k(ot2Var2);
            } else {
                p65Var6.m0();
            }
            cu cuVar4 = q12.f;
            tp7.B(p65Var6, cuVar4, zk7VarC);
            cu cuVar5 = q12.e;
            tp7.B(p65Var6, cuVar5, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar6 = q12.g;
            tp7.B(p65Var6, cuVar6, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var6, fnVar2);
            cu cuVar7 = q12.d;
            tp7.B(p65Var6, cuVar7, r28VarR);
            sw5 sw5Var = c5cVar.f;
            if (sw5Var == null) {
                p65Var6.Y(1996639625);
            } else {
                p65Var6.Y(1996639626);
                nx5 nx5Var = new nx5((Context) p65Var6.j(eo.b));
                nx5Var.c = sw5Var;
                tx5.b(nx5Var, d46.Q(new ws0()));
                q84 q84Var = wx5.a;
                nx5Var.b().a(wx5.f, Boolean.FALSE);
                k40.c(u57.a.a(a0(p65Var6)), pxf.E(-1474752618, new k6c(i4, nx5Var.a()), p65Var6), p65Var6, 56);
            }
            p65Var6.p(false);
            dy0.a(flb.a0(jfc.c, uu1.b(0.8f, xo7.i), rv8.r), p65Var6, 0);
            o28 o28Var = o28.b;
            r28 r28VarD = w2g.D(jfc.e(jfc.q(o28Var, 0.0f, 350.0f, 1), 622.0f), 24.0f, 32.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var6, 0);
            long j3 = p65Var6.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var6.l();
            r28 r28VarR2 = gx1.R(p65Var6, r28VarD);
            p65Var6.c0();
            if (p65Var6.S) {
                p65Var6.k(ot2Var2);
            } else {
                p65Var6.m0();
            }
            tp7.B(p65Var6, cuVar4, wv1VarA);
            tp7.B(p65Var6, cuVar5, i89VarL2);
            ka1.z(i6, p65Var6, cuVar6, p65Var6, fnVar2);
            tp7.B(p65Var6, cuVar7, r28VarR2);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var6, 48);
            long j4 = p65Var6.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var6.l();
            r28 r28VarR3 = gx1.R(p65Var6, o28Var);
            p65Var6.c0();
            if (p65Var6.S) {
                p65Var6.k(ot2Var2);
            } else {
                p65Var6.m0();
            }
            tp7.B(p65Var6, cuVar4, ombVarA);
            tp7.B(p65Var6, cuVar5, i89VarL3);
            ka1.z(i7, p65Var6, cuVar6, p65Var6, fnVar2);
            tp7.B(p65Var6, cuVar7, r28VarR3);
            String str = c5cVar.d;
            if (str == null) {
                p65Var6.Y(1705289508);
                p65Var6.p(false);
                fnVar = fnVar2;
                z = false;
                cuVar = cuVar6;
                ot2Var = ot2Var2;
                cuVar2 = cuVar4;
                cuVar3 = cuVar7;
                p65Var2 = p65Var6;
            } else {
                p65Var6.Y(1705289509);
                fnVar = fnVar2;
                cuVar = cuVar6;
                cuVar2 = cuVar4;
                z = false;
                cuVar3 = cuVar7;
                ot2Var = ot2Var2;
                d46.a(str, hl0.XS, null, null, null, null, null, 0.0f, 0, null, null, p65Var6, 48, 0, 4092);
                p65 p65Var7 = p65Var6;
                p65Var7.p(false);
                p65Var2 = p65Var7;
            }
            hp7.t(p65Var2, jfc.p(o28Var, 8.0f));
            String str2 = c5cVar.c;
            if (str2 == null) {
                p65Var2.Y(1705568012);
                p65Var3 = p65Var2;
            } else {
                p65Var2.Y(1705568013);
                p65 p65Var8 = p65Var2;
                jjd.b(str2, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, uu1.d, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var8, 0, 0, 131070);
                p65Var3 = p65Var8;
            }
            p65Var3.p(z);
            p65Var3.p(true);
            r28 r28VarE = w2g.E(jfc.d(new sq6(1.0f, true), 1.0f), 0.0f, 32.0f, 1);
            zk7 zk7VarC2 = dy0.c(ar0Var, z);
            long j5 = p65Var3.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var3.l();
            r28 r28VarR4 = gx1.R(p65Var3, r28VarE);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar2, zk7VarC2);
            tp7.B(p65Var3, cuVar5, i89VarL4);
            ka1.z(i8, p65Var3, cuVar, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar3, r28VarR4);
            String str3 = c5cVar.a;
            if (str3 == null) {
                p65Var3.Y(840313955);
                p65Var4 = p65Var3;
            } else {
                p65Var3.Y(840313956);
                p65 p65Var9 = p65Var3;
                jjd.b(str3, null, 0L, 0L, 0L, null, null, 0L, 2, false, 0, 0, null, mkd.a(((bu7) p65Var3.j(jt7.c)).s, uu1.d, 0L, null, null, null, 0L, uu1.b(0.8f, xo7.r), null, 0, 0L, null, null, 16775166), p65Var9, 0, 384, 126974);
                p65Var4 = p65Var9;
            }
            p65Var4.p(z);
            p65Var4.p(true);
            String str4 = c5cVar.b;
            if (str4 == null) {
                p65Var4.Y(197808708);
                p65Var5 = p65Var4;
            } else {
                p65Var4.Y(197808709);
                p65 p65Var10 = p65Var4;
                jjd.b(str4, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var4.j(jt7.c)).n, uu1.d, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var10, 0, 0, 131070);
                p65Var5 = p65Var10;
            }
            p65Var5.p(z);
            hp7.t(p65Var5, jfc.e(o28Var, 8.0f));
            String str5 = c5cVar.e;
            p65Var5.Y(198084516);
            p65 p65Var11 = p65Var5;
            jjd.b(str5, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var5.j(jt7.c)).o, uu1.d, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var11, 0, 0, 131070);
            p65 p65Var12 = p65Var11;
            b09.H(p65Var12, z, true, true);
            r5 = z;
            p65Var = p65Var12;
        } else {
            r5 = 0;
            p65Var6.S();
            p65Var = p65Var6;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(c5cVar, r28Var, i2, r5);
        }
    }

    public static void s0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.d(i2, Float.floatToRawIntBits(((Float) list.get(i3)).floatValue()));
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            ((Float) list.get(i5)).getClass();
            i4 += 4;
        }
        htfVar.q(i4);
        while (i3 < list.size()) {
            htfVar.c(Float.floatToRawIntBits(((Float) list.get(i3)).floatValue()));
            i3++;
        }
    }

    public static final void t(xpd xpdVar, long j2, long j3, mpd mpdVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        boolean zN;
        long j4;
        mpd mpdVar2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-110648874);
        int i3 = i2 | (p65Var2.f(xpdVar) ? 4 : 2) | (p65Var2.e(j2) ? 32 : 16) | (p65Var2.e(j3) ? 256 : 128) | (p65Var2.f(mpdVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576;
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            amb ambVarA = bmb.a(40.0f);
            boolean z = xpdVar.c;
            String str = xpdVar.a;
            if (z) {
                p65Var2.Y(1040624587);
                zN = yi2.N(p65Var2);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-2100374934);
                p65Var2.p(false);
                zN = false;
            }
            if (zN) {
                p65Var2.Y(-2100352113);
                j4 = rz5.A(p65Var2).p;
                p65Var2.p(false);
            } else {
                p65Var2.Y(-2100285680);
                j4 = rz5.A(p65Var2).n;
                p65Var2.p(false);
            }
            long j5 = j4;
            boolean z2 = xpdVar.c;
            long j6 = z2 ? j2 : uu1.g;
            long j7 = z2 ? uu1.g : j3;
            String str2 = xpdVar.b;
            mkd mkdVarA = mkd.a(rz5.D(p65Var2).n, j5, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            o28 o28Var = o28.b;
            r28 r28VarB = B(flb.a0(r40.y(o28Var, ambVarA), j6, ambVarA), 1.0f, j7, ambVarA);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.k(p65Var2);
            }
            m68 m68Var = (m68) objM;
            skb skbVarA = qkb.a(0.0f, 3, j2, false);
            vkb vkbVar = new vkb(2);
            boolean z3 = ((i3 & 7168) == 2048) | ((i3 & 14) == 4);
            Object objM2 = p65Var2.M();
            if (z3 || objM2 == uobVar) {
                mpdVar2 = mpdVar;
                objM2 = new nbb(mpdVar2, 23, xpdVar);
                p65Var2.j0(objM2);
            } else {
                mpdVar2 = mpdVar;
            }
            p65Var = p65Var2;
            jjd.b(str2, bgf.N(gx1.E(w2g.G(w2g.E(hlg.p(r28VarB, m68Var, skbVarA, false, vkbVar, (m45) objM2, 12), 16.0f, 0.0f, 2), 0.0f, 8.0f, 0.0f, 9.0f, 5), new lpd(str, mpdVar2, xpdVar)), "topic_pill_" + str), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var, 0, 0, 131068);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new yb8(xpdVar, j2, j3, mpdVar, r28Var2, i2);
        }
    }

    public static int t0(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iV = 0;
        for (int i2 = 0; i2 < size; i2++) {
            int iIntValue = ((Integer) list.get(i2)).intValue();
            iV += htf.v((iIntValue >> 31) ^ (iIntValue << 1));
        }
        return iV;
    }

    public static final void u(float f2, int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-894117441);
        int i3 = i2 | (p65Var.c(f2) ? 4 : 2) | 48 | (p65Var.e(j2) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            amb ambVarA = bmb.a(40.0f);
            ok7.r(f2, (i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 8, 0L, p65Var, w2g.G(w2g.E(B(flb.a0(r40.y(r28Var3, ambVarA), j2, ambVarA), 1.0f, uu1.g, ambVarA), 16.0f, 0.0f, 2), 0.0f, 8.0f, 0.0f, 9.0f, 5), ((bu7) p65Var.j(jt7.c)).n);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new up7(f2, r28Var2, j2, i2);
        }
    }

    public static void u0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.l(i2, ((Integer) list.get(i3)).intValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int iT = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            iT += htf.t(((Integer) list.get(i4)).intValue());
        }
        htfVar.q(iT);
        while (i3 < list.size()) {
            htfVar.k(((Integer) list.get(i3)).intValue());
            i3++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:80:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void v(defpackage.cqd r27, defpackage.mpd r28, defpackage.r28 r29, defpackage.nhc r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 359
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bo.v(cqd, mpd, r28, nhc, x12, int, int):void");
    }

    public static int v0(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iT = 0;
        for (int i2 = 0; i2 < size; i2++) {
            long jLongValue = ((Long) list.get(i2)).longValue();
            iT += htf.t((jLongValue >> 63) ^ (jLongValue << 1));
        }
        return iT;
    }

    public static final void w(String str, qlb qlbVar, r28 r28Var, fqd fqdVar, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        fqd fqdVar2;
        fqd fqdVar3;
        int i3;
        r28 r28Var3;
        str.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-90283360);
        int i4 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(qlbVar) ? 32 : 16) | 1408;
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var2.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var2.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var2.M();
                if (z || objM == uobVar) {
                    objM = new nmc(str, 5);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    fqdVar3 = (fqd) to7.z(n1b.a.b(fqd.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                    i3 = i4 & (-7169);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var2.S();
                i3 = i4 & (-7169);
                r28Var3 = r28Var;
                fqdVar3 = fqdVar;
            }
            p65Var2.q();
            l78 l78VarZ = guc.z(fqdVar3.r, p65Var2, 0);
            nhc nhcVarF = mk7.F(p65Var2);
            v((cqd) l78VarZ.getValue(), new mpd(qlbVar, fqdVar3), r28Var3, nhcVarF, p65Var2, 384, 0);
            r28 r28Var4 = r28Var3;
            p65Var = p65Var2;
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(fqdVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                fqdVar2 = fqdVar3;
                gbd gbdVar = new gbd(fqdVar2, nhcVarF, resources, qlbVar, null, 4);
                p65Var.j0(gbdVar);
                objM2 = gbdVar;
            } else {
                fqdVar2 = fqdVar3;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var2 = r28Var4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            fqdVar2 = fqdVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 17, r28Var2, (Object) str, (Object) qlbVar, (Object) fqdVar2);
        }
    }

    public static void w0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.m(i2, ((Long) list.get(i3)).longValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int iT = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            iT += htf.t(((Long) list.get(i4)).longValue());
        }
        htfVar.q(iT);
        while (i3 < list.size()) {
            htfVar.n(((Long) list.get(i3)).longValue());
            i3++;
        }
    }

    public static final void x(cqd cqdVar, mpd mpdVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-172406509);
        int i3 = (p65Var.f(cqdVar) ? 4 : 2) | i2 | (p65Var.f(mpdVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.S();
        } else if (cqdVar instanceof bqd) {
            p65Var.Y(1821076299);
            r((i3 >> 6) & 14, 0L, p65Var, r28Var);
            p65Var.p(false);
        } else if (cqdVar instanceof aqd) {
            p65Var.Y(1821078703);
            j((aqd) cqdVar, mpdVar, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        } else {
            if (!(cqdVar instanceof zpd)) {
                throw ho2.L(p65Var, 1821074574, false);
            }
            p65Var.Y(1821084271);
            h((zpd) cqdVar, mpdVar, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 4, cqdVar, mpdVar, r28Var);
        }
    }

    public static int x0(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iV = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iV += htf.v(((Integer) list.get(i2)).intValue());
        }
        return iV;
    }

    public static void y0(int i2, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        htf htfVar = (htf) ujfVar.b;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                htfVar.d(i2, ((Integer) list.get(i3)).intValue());
                i3++;
            }
            return;
        }
        htfVar.r(i2, 2);
        int i4 = 0;
        for (int i5 = 0; i5 < list.size(); i5++) {
            ((Integer) list.get(i5)).getClass();
            i4 += 4;
        }
        htfVar.q(i4);
        while (i3 < list.size()) {
            htfVar.c(((Integer) list.get(i3)).intValue());
            i3++;
        }
    }

    public static final uua z(r6c r6cVar) {
        return new uua(r6cVar, null);
    }

    public static int z0(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iT = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iT += htf.t(((Long) list.get(i2)).longValue());
        }
        return iT;
    }

    public abstract int y(int i2, int i3, ip6 ip6Var);

    public static final void j(aqd aqdVar, mpd mpdVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        ar0 ar0Var;
        Object ibdVar;
        float f2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-391388813);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(aqdVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(mpdVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
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
            int i6 = i3;
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            b24 b24Var = aqdVar.a;
            boolean z = (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                ibdVar = new ibd(0, mpdVar, mpd.class, "refresh", mBTDfueQiGWRV.bRowhNXYb, 0, 9);
                p65Var.j0(ibdVar);
            } else {
                ibdVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) ibdVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 18, aqdVar, mpdVar, r28Var);
        }
    }
}
