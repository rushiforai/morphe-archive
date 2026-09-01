package defpackage;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.admin.userdismissableflags.UserDismissableFlagsFragment;
import com.medium.android.catalogs.updateCatalog.UpdateCatalogBottomSheetDialogFragment;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.postpublishing.ui.TopicData;
import com.medium.android.profile.ui.view.UserProfileFragment;
import com.medium.android.profile.ui.view.e;
import com.medium.android.unsplash.data.UnsplashPhoto;
import com.medium.android.unsplash.ui.UnsplashPickerFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class l6c implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ l6c(r28 r28Var, mz1 mz1Var, int i) {
        this.a = 2;
        this.c = r28Var;
        this.b = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws Exception {
        int i = this.a;
        bkd bkdVar = null;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                bo.s((c5c) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 1:
                mz1 mz1Var = (mz1) obj4;
                mz1 mz1Var2 = (mz1) obj3;
                lvc lvcVar = (lvc) obj;
                f72 f72Var = (f72) obj2;
                lvcVar.getClass();
                long jA = f72.a(f72Var.a, 0, 0, 0, 0, 14);
                rya ryaVar = new rya();
                ryaVar.a = ((tk7) bu1.x0(lvcVar.x(mz1Var, 1))).s(jA);
                rya ryaVar2 = new rya();
                t99 t99VarS = ((tk7) bu1.x0(lvcVar.x(mz1Var2, 2))).s(jA);
                ryaVar2.a = t99VarS;
                int i2 = ((t99) ryaVar.a).a;
                int i3 = t99VarS.a;
                int i4 = i2 + i3;
                long j = f72Var.a;
                if (i4 > f72.h(j)) {
                    int iH = f72.h(j) / 2;
                    long j2 = f72Var.a;
                    if (i3 < iH) {
                        int iH2 = f72.h(j) - i3;
                        int iJ = f72.j(j2);
                        ryaVar.a = ((tk7) bu1.x0(lvcVar.x(mz1Var, 3))).s(f72.a(j2, iJ > iH2 ? iH2 : iJ, iH2, 0, 0, 12));
                    } else if (i2 < f72.h(j) / 2) {
                        int iH3 = f72.h(j) - i2;
                        int iJ2 = f72.j(j2);
                        ryaVar2.a = ((tk7) bu1.x0(lvcVar.x(mz1Var2, 4))).s(f72.a(j2, iJ2 > iH3 ? iH3 : iJ2, iH3, 0, 0, 12));
                    } else {
                        int iH4 = f72.h(j) / 2;
                        int iJ3 = f72.j(j2);
                        long jA2 = f72.a(j2, iJ3 > iH4 ? iH4 : iJ3, iH4, 0, 0, 12);
                        ryaVar.a = ((tk7) bu1.x0(lvcVar.x(mz1Var, 3))).s(jA2);
                        ryaVar2.a = ((tk7) bu1.x0(lvcVar.x(mz1Var2, 4))).s(jA2);
                    }
                }
                return lvcVar.q0(iq7.v(((t99) ryaVar.a).a + ((t99) ryaVar2.a).a, f72.j(j), f72.h(j)), iq7.v(Math.max(((t99) ryaVar.a).b, ((t99) ryaVar2.a).b), f72.i(j), f72.g(j)), fy3.a, new pda(ryaVar, 15, ryaVar2));
            case 2:
                ((Integer) obj2).getClass();
                tr7.f((r28) obj3, (mz1) obj4, (x12) obj, tr7.y(49));
                return c1eVar;
            case 3:
                c55 c55Var = (c55) obj4;
                jhc jhcVar = (jhc) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jhcVar.getClass();
                    c55Var.f(jhcVar, p65Var, 0);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 4:
                ((Integer) obj2).getClass();
                aoc.b((az5) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 5:
                ((Integer) obj2).getClass();
                aoc.a((yc9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 6:
                ((Integer) obj2).getClass();
                g76.F((gxc) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 7:
                lyc lycVar = (lyc) obj4;
                hu7 hu7Var = (hu7) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    r28 r28VarD = jfc.d(o28Var, 1.0f);
                    omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
                    long j3 = p65Var2.T;
                    int i5 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, ombVarA);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR);
                    String strR = vo7.R(p65Var2, R.string.common_terms_of_service);
                    xn7 xn7Var = xn7.S;
                    r28 r28VarN = bgf.N(o28Var, "legal_terms_of_service");
                    boolean zF = p65Var2.f(lycVar) | p65Var2.f(hu7Var);
                    Object objM = p65Var2.M();
                    uob uobVar = w12.a;
                    if (zF || objM == uobVar) {
                        objM = new ayc(lycVar, hu7Var, 0);
                        p65Var2.j0(objM);
                    }
                    fo7.k(3456, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var2, (m45) objM, xn7Var, r28VarN, strR, false, false);
                    String strR2 = vo7.R(p65Var2, R.string.common_privacy_policy);
                    r28 r28VarN2 = bgf.N(o28Var, "legal_privacy_policy");
                    boolean zF2 = p65Var2.f(lycVar) | p65Var2.f(hu7Var);
                    Object objM2 = p65Var2.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new ayc(lycVar, hu7Var, 1);
                        p65Var2.j0(objM2);
                    }
                    fo7.k(3456, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var2, (m45) objM2, xn7Var, r28VarN2, strR2, false, false);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 8:
                ((Integer) obj2).getClass();
                op8.E((e4d) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 9:
                ((Integer) obj2).getClass();
                qk7.l((i8d) obj4, (x45) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 10:
                ((Integer) obj2).getClass();
                guc.f((ncd) obj4, (lbd) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 11:
                ((Integer) obj2).getClass();
                guc.h((rcd) obj4, (lbd) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 12:
                ((Integer) obj2).getClass();
                guc.i((ocd) obj4, (lbd) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 13:
                ((Integer) obj2).getClass();
                ((ep6) obj4).d((Drawable) obj3, (x12) obj, tr7.y(49));
                return c1eVar;
            case 14:
                lid lidVar = (lid) obj4;
                sb2 sb2Var = (sb2) obj3;
                ugd ugdVar = (ugd) obj;
                Context context = (Context) obj2;
                boolean zH = lidVar.h();
                mx mxVarK = lidVar.k();
                String str = mxVarK != null ? mxVarK.b : null;
                bkd bkdVar2 = lidVar.v;
                if (bkdVar2 != null) {
                    long j4 = bkdVar2.a;
                    yqa yqaVar = lidVar.b;
                    int i6 = (int) (j4 >> 32);
                    yqaVar.a(i6);
                    int i7 = (int) (j4 & 4294967295L);
                    yqaVar.a(i7);
                    bkdVar = new bkd(lk7.q(i6, i7));
                }
                qa9 qa9Var = lidVar.i;
                pi9 pi9Var = new pi9(lidVar, sb2Var, context, 17);
                sn3 sn3Var = wa9.a;
                if (Build.VERSION.SDK_INT < 28 || str == null || bkdVar == null || qa9Var == null || !(qa9Var instanceof va9)) {
                    pi9Var.invoke(ugdVar);
                    if (str != null && bkdVar != null) {
                        tr7.h(ugdVar, context, zH, str, bkdVar.a);
                    }
                } else {
                    String str2 = str;
                    ((va9) qa9Var).a(ugdVar, str2, bkdVar.a, pi9Var);
                    tr7.h(ugdVar, context, zH, str2, bkdVar.a);
                }
                return c1eVar;
            case 15:
                DarkMode darkMode = (DarkMode) obj4;
                x45 x45Var = (x45) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
                    long j5 = p65Var3.T;
                    int i8 = (int) ((j5 >>> 32) ^ j5);
                    i89 i89VarL2 = p65Var3.l();
                    r28 r28VarR2 = gx1.R(p65Var3, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, wv1VarA);
                    tp7.B(p65Var3, q12.e, i89VarL2);
                    tp7.B(p65Var3, q12.g, Integer.valueOf(i8));
                    tp7.y(p65Var3, q12.h);
                    tp7.B(p65Var3, q12.d, r28VarR2);
                    fo7.g(darkMode, DarkMode.FOLLOW_SYSTEM, x45Var, null, p65Var3, 48);
                    fo7.g(darkMode, DarkMode.LIGHT, x45Var, null, p65Var3, 48);
                    fo7.g(darkMode, DarkMode.DARK, x45Var, null, p65Var3, 48);
                    p65Var3.p(true);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 16:
                ((Integer) obj2).getClass();
                fp7.b((TopicData) obj4, (eb8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 17:
                ((Integer) obj2).getClass();
                kp7.j((spd) obj4, (fv9) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 18:
                ((Integer) obj2).getClass();
                kp7.i((dpd) obj4, (fv9) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 19:
                UnsplashPickerFragment unsplashPickerFragment = (UnsplashPickerFragment) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    String referrerSource = ((UnsplashPickerFragment.BundleInfo) unsplashPickerFragment.u0.getValue()).getReferrerSource();
                    gx5 gx5Var = unsplashPickerFragment.v0;
                    if (gx5Var == null) {
                        g76.g0("imageLoader");
                        throw null;
                    }
                    d3e.g(referrerSource, gx5Var, new qlb(unsplashPickerFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar.getValue()).a, 7), null, p65Var4, 0);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 20:
                UnsplashPhoto unsplashPhoto = (UnsplashPhoto) obj4;
                gx5 gx5Var2 = (gx5) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    nx5 nx5Var = new nx5((Context) p65Var5.j(eo.b));
                    nx5Var.c = unsplashPhoto;
                    nx5Var.r = dqb.FIT;
                    tx5.a(nx5Var, true);
                    gx1.d(nx5Var.a(), unsplashPhoto.getDescription(), gx5Var2, op8.K(unsplashPhoto.getHeight() / unsplashPhoto.getWidth(), bgf.N(jfc.d(o28Var, 1.0f), "photo"), false), z46.h, v82.b, 0.0f, null, 0, p65Var5, 14155776, 0, 3888);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 21:
                ((Integer) obj2).getClass();
                d3e.c((pw6) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 22:
                h5e h5eVar = (h5e) obj4;
                UpdateCatalogBottomSheetDialogFragment updateCatalogBottomSheetDialogFragment = (UpdateCatalogBottomSheetDialogFragment) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    t40.y(h5eVar.r, h5eVar.n, h5eVar.p, new g4e(updateCatalogBottomSheetDialogFragment, h5eVar), null, p65Var6, 0);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 23:
                ((Integer) obj2).getClass();
                vx0.z((hae) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 24:
                UserDismissableFlagsFragment userDismissableFlagsFragment = (UserDismissableFlagsFragment) obj4;
                upc upcVar2 = (upc) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    g01.G(new qlb(userDismissableFlagsFragment), ((UserDismissableFlagsFragment.BundleInfo) userDismissableFlagsFragment.u0.getValue()).getReferrerSource(), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar2.getValue()).a, 7), null, p65Var7, 0);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 25:
                ((Integer) obj2).getClass();
                g01.I((lae) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 26:
                ((Integer) obj2).getClass();
                g01.E((oae) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 27:
                UserProfileFragment userProfileFragment = (UserProfileFragment) obj4;
                vq6 vq6Var = userProfileFragment.w0;
                upc upcVar3 = (upc) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    e.h(((UserProfileFragment.BundleInfo) vq6Var.getValue()).getUserProfileReference(), ((UserProfileFragment.BundleInfo) vq6Var.getValue()).getSelectedTab(), ((UserProfileFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), new pge(userProfileFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar3.getValue()).a, 7), null, p65Var8, 0);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 28:
                ((Integer) obj2).getClass();
                yo7.m((vne) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            default:
                ((Integer) obj2).getClass();
                gp7.e((zne) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
        }
    }

    public /* synthetic */ l6c(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public /* synthetic */ l6c(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
    }
}
