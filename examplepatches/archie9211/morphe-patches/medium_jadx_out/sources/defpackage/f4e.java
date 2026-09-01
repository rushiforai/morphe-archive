package defpackage;

import android.speech.tts.Voice;
import com.medium.android.admin.userdismissableflags.UserDismissableFlagsFragment;
import com.medium.android.audio.voiceselector.VoiceSelectionFragment;
import com.medium.android.catalogs.updateCatalog.UpdateCatalogBottomSheetDialogFragment;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.profile.ui.view.UserProfileFragment;
import com.medium.android.yourlibrary.YourLibraryFragment;
import com.medium.reader.R;
import defpackage.c1e;
import defpackage.guc;
import defpackage.o28;
import defpackage.p65;
import defpackage.vj3;
import defpackage.vq6;
import defpackage.w2g;
import defpackage.x12;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class f4e implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ f4e(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = 27;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        int i3 = 1;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                UpdateCatalogBottomSheetDialogFragment updateCatalogBottomSheetDialogFragment = (UpdateCatalogBottomSheetDialogFragment) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    wue wueVarA = e67.a(p65Var);
                    if (wueVarA == null) {
                        ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                        return null;
                    }
                    jt7.a(false, pxf.E(677701160, new l6c((h5e) to7.z(n1b.a.b(h5e.class), wueVarA, null, wueVarA instanceof pi5 ? ((pi5) wueVarA).getDefaultViewModelCreationExtras() : og2.b, p65Var), 22, updateCatalogBottomSheetDialogFragment), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                UserDismissableFlagsFragment userDismissableFlagsFragment = (UserDismissableFlagsFragment) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    vpc vpcVarS = ((MainActivity) userDismissableFlagsFragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    jt7.a(false, pxf.E(105855347, new l6c(userDismissableFlagsFragment, 24, lv8.k(56.0f, vpcVarS, p65Var2, 0)), p65Var2), p65Var2, 48, 1);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                lae laeVar = (lae) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    g01.I(laeVar, null, p65Var3, 0);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                UserProfileFragment userProfileFragment = (UserProfileFragment) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    jt7.a(false, pxf.E(153168794, new l6c(userProfileFragment, i2, guc.z(((MainActivity) userProfileFragment.Q()).s(), p65Var4, 0)), p65Var4), p65Var4, 48, 1);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                ihe iheVar = (ihe) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    r28 r28VarD = jfc.d(o28.b, 1.0f);
                    boolean zF = p65Var5.f(iheVar);
                    Object objM = p65Var5.M();
                    if (zF || objM == uobVar) {
                        objM = new doc(i2, iheVar);
                        p65Var5.j0(objM);
                    }
                    r28 r28VarR = hlg.r(r28VarD, false, null, null, (m45) objM, 15);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var5.T;
                    int i4 = (int) ((j >>> 32) ^ j);
                    i89 i89VarL = p65Var5.l();
                    r28 r28VarR2 = gx1.R(p65Var5, r28VarR);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, q12.f, zk7VarC);
                    tp7.B(p65Var5, q12.e, i89VarL);
                    tp7.B(p65Var5, q12.g, Integer.valueOf(i4));
                    tp7.y(p65Var5, q12.h);
                    tp7.B(p65Var5, q12.d, r28VarR2);
                    p65Var5.Y(1317272990);
                    kx kxVar = new kx();
                    kxVar.d(vo7.R(p65Var5, R.string.user_profile_activity_feed_tooltip));
                    kxVar.d("\n\n");
                    p65Var5.Y(1317279958);
                    int iH = kxVar.h(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439));
                    try {
                        kxVar.d(vo7.R(p65Var5, R.string.user_profile_activity_feed_tooltip_action));
                        kxVar.f(iH);
                        p65Var5.p(false);
                        mx mxVarI = kxVar.i();
                        p65Var5.p(false);
                        jjd.c(mxVarI, null, 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, null, p65Var5, 0, 0, 524286);
                        p65Var5.p(true);
                    } catch (Throwable th) {
                        kxVar.f(iH);
                        throw th;
                    }
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                ume umeVar = (ume) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    String strR = vo7.R(p65Var6, R.string.stats_title);
                    boolean zF2 = p65Var6.f(umeVar);
                    Object objM2 = p65Var6.M();
                    if (zF2 || objM2 == uobVar) {
                        k8e k8eVar = new k8e(0, umeVar, ume.class, "onBackPressed", "onBackPressed()V", 0, 19);
                        p65Var6.j0(k8eVar);
                        objM2 = k8eVar;
                    }
                    qk7.g(null, strR, (m45) ((qh6) objM2), null, null, null, 0L, 0L, null, p65Var6, 0, 505);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                VoiceSelectionFragment voiceSelectionFragment = (VoiceSelectionFragment) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    wue wueVarA2 = e67.a(p65Var7);
                    if (wueVarA2 == null) {
                        ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                        return null;
                    }
                    jt7.a(false, pxf.E(2146114997, new xre((wwe) to7.z(n1b.a.b(wwe.class), wueVarA2, null, wueVarA2 instanceof pi5 ? ((pi5) wueVarA2).getDefaultViewModelCreationExtras() : og2.b, p65Var7), i3, voiceSelectionFragment), p65Var7), p65Var7, 48, 1);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                wwe wweVar = (wwe) obj3;
                Voice voice = (Voice) obj;
                String str = (String) obj2;
                voice.getClass();
                str.getClass();
                wweVar.getClass();
                y23 y23Var = (y23) wweVar.b;
                y23Var.getClass();
                vx0.c0(y23Var.e, null, null, new ku2(y23Var, voice, str, null, 5), 3);
                return c1eVar;
            case 8:
                return new k46(((long) ((wd) obj3).a(0, (int) (((s46) obj).a >> 32), (ip6) obj2)) << 32);
            case 9:
                return new k46(((long) ((zq0) obj3).a(0, (int) (((s46) obj).a & 4294967295L))) & 4294967295L);
            case 10:
                return new k46(((xd) obj3).a(0L, ((s46) obj).a, (ip6) obj2));
            default:
                final YourLibraryFragment yourLibraryFragment = (YourLibraryFragment) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    final l78 l78VarZ = guc.z(((MainActivity) yourLibraryFragment.Q()).s(), p65Var8, 0);
                    Object objM3 = p65Var8.M();
                    if (objM3 == uobVar) {
                        objM3 = new sef(yourLibraryFragment);
                        p65Var8.j0(objM3);
                    }
                    final sef sefVar = (sef) objM3;
                    jt7.a(false, pxf.E(421542644, new b55() { // from class: com.medium.android.yourlibrary.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj4, Object obj5) {
                            YourLibraryFragment yourLibraryFragment2 = yourLibraryFragment;
                            vq6 vq6Var = yourLibraryFragment2.u0;
                            x12 x12Var9 = (x12) obj4;
                            int iIntValue9 = ((Integer) obj5).intValue();
                            p65 p65Var9 = (p65) x12Var9;
                            if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                                guc.q(((YourLibraryFragment.BundleInfo) vq6Var.getValue()).getPreselectedTab(), ((YourLibraryFragment.BundleInfo) vq6Var.getValue()).getDigestId(), sefVar, ((YourLibraryFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), yourLibraryFragment2.v0, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) l78VarZ.getValue()).a, 7), null, p65Var9, 384);
                            } else {
                                p65Var9.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var8), p65Var8, 48, 1);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
        }
    }
}
