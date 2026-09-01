package defpackage;

import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Movie;
import android.net.ConnectivityManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.View;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.InputMethodManager;
import androidx.navigation.fragment.NavHostFragment;
import com.medium.android.admin.flags.FlagsFragment;
import com.medium.android.catalogs.listscatalogselector.ListsCatalogSelectorDialogFragment;
import com.medium.android.core.models.CurrentUserEntity;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.followers.FollowersFragment;
import com.medium.android.following.FollowingFragment;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.android.postpage.membershipinfo.MembershipInfoBottomSheetFragment;
import com.medium.android.susi.ui.loginCode.LoginCodeBottomSheetDialogFragment;
import com.medium.android.susi.ui.magicLink.MagicLinkBottomSheetDialogFragment;
import com.medium.android.susi.ui.magicLinkConfirmation.MagicLinkConfirmationFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class em4 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ em4(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        e35 e35Var;
        int largeMemoryClass;
        Serializable serializable;
        int i = this.a;
        int i2 = 4;
        boolean z = true;
        c1e c1eVar = c1e.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F((FlagsFragment) obj), "bundle_info", FlagsFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (FlagsFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 1:
                xv4 xv4Var = (xv4) obj;
                return new SourceParameter(xv4Var.l, xv4Var.e.m(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4, 8191, null);
            case 2:
                Parcelable parcelable2 = (Parcelable) ht2.r0(dm2.F((FollowersFragment) obj), "bundle_info", FollowersFragment.BundleInfo.class);
                if (parcelable2 != null) {
                    return (FollowersFragment.BundleInfo) parcelable2;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 3:
                Parcelable parcelable3 = (Parcelable) ht2.r0(dm2.F((FollowingFragment) obj), "bundle_info", FollowingFragment.BundleInfo.class);
                if (parcelable3 != null) {
                    return (FollowingFragment.BundleInfo) parcelable3;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 4:
                f35 f35Var = (f35) obj;
                Context context = f35Var.a;
                String str = f35Var.b;
                if (str == null || !f35Var.d) {
                    e35Var = new e35(context, f35Var.b, new zm7(16), f35Var.c, f35Var.e);
                } else {
                    File noBackupFilesDir = context.getNoBackupFilesDir();
                    noBackupFilesDir.getClass();
                    e35Var = new e35(context, new File(noBackupFilesDir, str).getAbsolutePath(), new zm7(16), f35Var.c, f35Var.e);
                }
                e35Var.setWriteAheadLoggingEnabled(f35Var.g);
                return e35Var;
            case 5:
                cd5 cd5Var = (cd5) obj;
                yx5 yx5Var = cd5Var.a;
                ew8 ew8Var = cd5Var.b;
                yx5 yx5VarI = r40.I(yx5Var, true);
                try {
                    Movie movieDecodeStream = Movie.decodeStream(yx5VarI.v0().D0());
                    xz5.F(yx5VarI, null);
                    if (movieDecodeStream == null || movieDecodeStream.width() <= 0 || movieDecodeStream.height() <= 0) {
                        ygf.f("Failed to decode GIF.");
                        return null;
                    }
                    v48 v48Var = new v48(movieDecodeStream, (movieDecodeStream.isOpaque() && ((Boolean) k40.c0(ew8Var, wx5.g)).booleanValue()) ? Bitmap.Config.RGB_565 : u36.n(wx5.a(ew8Var)) ? Bitmap.Config.ARGB_8888 : (Bitmap.Config) k40.c0(ew8Var, wx5.b), ew8Var.c);
                    q84 q84Var = guc.j;
                    if (((Number) k40.c0(ew8Var, q84Var)).intValue() != -2) {
                        int iIntValue = ((Number) k40.c0(ew8Var, q84Var)).intValue();
                        if (iIntValue < -1) {
                            ywb.g(b09.w(iIntValue, "Invalid repeatCount: "));
                            return null;
                        }
                        v48Var.q = iIntValue;
                    }
                    m45 m45Var = (m45) k40.c0(ew8Var, guc.l);
                    m45 m45Var2 = (m45) k40.c0(ew8Var, guc.m);
                    if (m45Var != null || m45Var2 != null) {
                        v48Var.e.add(new mpe(m45Var, m45Var2));
                    }
                    if (k40.c0(ew8Var, guc.k) != null) {
                        rd6.m();
                        return null;
                    }
                    v48Var.r = null;
                    v48Var.s = r99.UNCHANGED;
                    v48Var.t = false;
                    v48Var.invalidateSelf();
                    return new gw2(dm2.y(v48Var), false);
                } catch (Throwable th) {
                    try {
                        throw th;
                    } catch (Throwable th2) {
                        xz5.F(yx5VarI, th);
                        throw th2;
                    }
                }
            case 6:
                HomeFragment homeFragment = (HomeFragment) obj;
                Bundle bundle = homeFragment.f;
                fy3 fy3Var = fy3.a;
                if (bundle == null) {
                    Bundle bundle2 = new Bundle();
                    bundle2.putParcelable("bundle_info", new HomeFragment.BundleInfo(""));
                    homeFragment.V(bundle2);
                    IllegalStateException illegalStateException = new IllegalStateException("Arguments are null in HomeFragment");
                    wld.a.e(illegalStateException, "HomeFragment: arguments were null; applied default bundle_info", new Object[0]);
                    hy2 hy2Var = g01.y;
                    if (hy2Var != null) {
                        hy2Var.a("HomeFragment: arguments were null; applied default bundle_info", illegalStateException, fy3Var);
                    }
                }
                Parcelable parcelable4 = (Parcelable) ht2.r0(dm2.F(homeFragment), "bundle_info", Parcelable.class);
                if (!(parcelable4 instanceof HomeFragment.BundleInfo)) {
                    Bundle bundle3 = new Bundle();
                    bundle3.putParcelable("bundle_info", new HomeFragment.BundleInfo(""));
                    homeFragment.V(bundle3);
                    IllegalStateException illegalStateException2 = new IllegalStateException("bundle_info is missing or not HomeFragment.BundleInfo (value=" + parcelable4 + ")");
                    wld.a.e(illegalStateException2, "HomeFragment: bundle_info missing or wrong type; applied default", new Object[0]);
                    hy2 hy2Var2 = g01.y;
                    if (hy2Var2 != null) {
                        hy2Var2.a("HomeFragment: bundle_info missing or wrong type; applied default", illegalStateException2, fy3Var);
                    }
                }
                Parcelable parcelable5 = (Parcelable) ht2.r0(dm2.F(homeFragment), "bundle_info", HomeFragment.BundleInfo.class);
                if (parcelable5 != null) {
                    return (HomeFragment.BundleInfo) parcelable5;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 7:
                qs5 qs5Var = (qs5) obj;
                qs5Var.getClass();
                try {
                    qs5Var.w.I(2, 0, false);
                    break;
                } catch (IOException e) {
                    b14 b14Var = b14.PROTOCOL_ERROR;
                    qs5Var.f(b14Var, b14Var, e);
                }
                return c1eVar;
            case 8:
                ImageCarouselActivity imageCarouselActivity = (ImageCarouselActivity) obj;
                vm2 vm2Var = imageCarouselActivity.p;
                if (vm2Var == null) {
                    g76.g0("vmFactory");
                    throw null;
                }
                String str2 = imageCarouselActivity.s;
                if (str2 != null) {
                    return new rw5(str2, (gn9) vm2Var.a.a.u.get());
                }
                g76.g0("postId");
                throw null;
            case 9:
                Context context2 = (Context) ((n0c) obj).b;
                double d = 0.2d;
                try {
                    Object systemService = context2.getSystemService((Class<Object>) ActivityManager.class);
                    systemService.getClass();
                    if (((ActivityManager) systemService).isLowRamDevice()) {
                        d = 0.15d;
                    }
                } catch (Exception unused) {
                }
                if (0.0d > d || d > 1.0d) {
                    ay0.e("percent must be in the range [0.0, 1.0].");
                    return null;
                }
                ad adVar = new ad(14, (byte) 0);
                try {
                    Object systemService2 = context2.getSystemService((Class<Object>) ActivityManager.class);
                    systemService2.getClass();
                    ActivityManager activityManager = (ActivityManager) systemService2;
                    largeMemoryClass = (context2.getApplicationInfo().flags & 1048576) != 0 ? activityManager.getLargeMemoryClass() : activityManager.getMemoryClass();
                    break;
                } catch (Exception unused2) {
                    largeMemoryClass = 256;
                }
                return new pva(new f33((long) (d * ((long) largeMemoryClass) * 1048576), adVar), adVar);
            case 10:
                return Float.valueOf(tr7.s(((sb2) obj).Q()));
            case 11:
                Object systemService3 = ((View) ((s26) obj).b).getContext().getSystemService("input_method");
                systemService3.getClass();
                return (InputMethodManager) systemService3;
            case 12:
                elb elbVar = ((v76) obj).a;
                if (elbVar.k() && !elbVar.o()) {
                    z = false;
                }
                return Boolean.valueOf(z);
            case 13:
                return (u31) ((hf6) obj).a.invoke();
            case 14:
                pt6 pt6Var = ((st6) obj).j;
                if (pt6Var != null) {
                    wgf.y(pt6Var);
                }
                return c1eVar;
            case 15:
                return new BaseInputConnection(((lx6) obj).a, false);
            case 16:
                ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment = (ListsCatalogSelectorDialogFragment) obj;
                Bundle bundleR = listsCatalogSelectorDialogFragment.R();
                if (Build.VERSION.SDK_INT >= 34) {
                    serializable = v4.l(bundleR);
                } else {
                    serializable = bundleR.getSerializable("catalog_item_type");
                    if (!CatalogItemType.class.isInstance(serializable)) {
                        serializable = null;
                    }
                }
                if (serializable == null) {
                    ay0.e("Required 'catalog_item_type' is null.");
                    return null;
                }
                CatalogItemType catalogItemType = (CatalogItemType) serializable;
                if (t37.a[catalogItemType.ordinal()] != 1) {
                    ik4.m("Unhandled catalog item type ", catalogItemType);
                    return null;
                }
                String string = bundleR.getString("item_id");
                if (string == null) {
                    ay0.e("Required value was null.");
                    return null;
                }
                ud1 ud1Var = new ud1(string);
                kn2 kn2Var = listsCatalogSelectorDialogFragment.I0;
                if (kn2Var == null) {
                    g76.g0("vmFactory");
                    throw null;
                }
                String strV = vv2.V("referrer_source", bundleR);
                eo2 eo2Var = kn2Var.a;
                ko2 ko2Var = eo2Var.b;
                fo2 fo2Var = (fo2) eo2Var.e;
                zk2 zk2Var = (zk2) ko2Var.r.get();
                qi1 qi1Var = (qi1) ko2Var.t.get();
                ko2 ko2Var2 = fo2Var.b;
                return new x47(ud1Var, strV, zk2Var, qi1Var, new me4((qi1) ko2Var2.t.get()), new pe4(fo2Var.c.d()), new gg5((qi1) ko2Var2.t.get(), ko2Var2.n()), new n53((qi1) ko2Var2.t.get(), ko2Var2.n(), 0), new nz9((qi1) ko2Var2.t.get(), ko2Var2.n()), ko2Var.q(), (pu7) ko2Var.w.get(), ko2Var.n());
            case 17:
                Parcelable parcelable6 = (Parcelable) ht2.r0(dm2.F((LoginCodeBottomSheetDialogFragment) obj), "bundle_info", LoginCodeBottomSheetDialogFragment.BundleInfo.class);
                if (parcelable6 != null) {
                    return (LoginCodeBottomSheetDialogFragment.BundleInfo) parcelable6;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 18:
                Parcelable parcelable7 = (Parcelable) ht2.r0(dm2.F((MagicLinkBottomSheetDialogFragment) obj), "bundle_info", MagicLinkBottomSheetDialogFragment.BundleInfo.class);
                if (parcelable7 != null) {
                    return (MagicLinkBottomSheetDialogFragment.BundleInfo) parcelable7;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 19:
                Parcelable parcelable8 = (Parcelable) ht2.r0(dm2.F((MagicLinkConfirmationFragment) obj), "bundle_info", MagicLinkConfirmationFragment.BundleInfo.class);
                if (parcelable8 != null) {
                    return (MagicLinkConfirmationFragment.BundleInfo) parcelable8;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 20:
                yi7 yi7Var = (yi7) obj;
                if (yi7Var.s.g() <= yi7Var.t.g()) {
                    return null;
                }
                ((ti7) yi7Var.y.getValue()).getClass();
                return Float.valueOf(yi7Var.I0() + r1.g());
            case 21:
                return (ConnectivityManager) ((Context) ((hx4) obj).b).getSystemService(ConnectivityManager.class);
            case 22:
                return (Float) obj;
            case 23:
                x38 x38Var = ((vr7) obj).i;
                x38Var.getClass();
                return x38Var.a(CurrentUserEntity.class, yoe.a, null);
            case 24:
                Parcelable parcelable9 = (Parcelable) ht2.r0(dm2.F((MembershipInfoBottomSheetFragment) obj), "bundle_info", MembershipInfoBottomSheetFragment.BundleInfo.class);
                if (parcelable9 != null) {
                    return (MembershipInfoBottomSheetFragment.BundleInfo) parcelable9;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 25:
                ((j18) obj).e.invoke();
                return c1eVar;
            case 26:
                return Boolean.valueOf(((v88) obj).a);
            case 27:
                da8 da8Var = ((ba8) obj).h;
                if (!da8Var.i) {
                    ygf.f("You cannot access the NavBackStackEntry's SavedStateHandle until it is added to the NavController's back stack (i.e., the Lifecycle of the NavBackStackEntry reaches the CREATED state).");
                    return null;
                }
                if (da8Var.j.d != vx6.DESTROYED) {
                    return ((ca8) z46.c(da8Var.a, (uue) da8Var.m.getValue(), 4).n0(n1b.a.b(ca8.class))).b;
                }
                ygf.f("You cannot access the NavBackStackEntry's SavedStateHandle after the NavBackStackEntry is destroyed.");
                return null;
            case 28:
                NavHostFragment navHostFragment = (NavHostFragment) obj;
                Context contextI = navHostFragment.i();
                if (contextI == null) {
                    ygf.f("NavController cannot be created before the fragment is attached");
                    return null;
                }
                db8 db8Var = new db8(contextI);
                db8Var.i(navHostFragment);
                db8Var.j(navHostFragment.getViewModelStore());
                ka8 ka8Var = db8Var.b;
                tc8 tc8Var = ka8Var.s;
                Context contextS = navHostFragment.S();
                f25 f25VarH = navHostFragment.h();
                f25VarH.getClass();
                tc8Var.a(new jb3(contextS, f25VarH));
                tc8 tc8Var2 = ka8Var.s;
                Context contextS2 = navHostFragment.S();
                f25 f25VarH2 = navHostFragment.h();
                f25VarH2.getClass();
                int i3 = navHostFragment.w;
                if (i3 == 0 || i3 == -1) {
                    i3 = R.id.nav_host_fragment_container;
                }
                tc8Var2.a(new k25(contextS2, f25VarH2, i3));
                Bundle bundleA = navHostFragment.S.b.a("android-support-nav:fragment:navControllerState");
                if (bundleA != null) {
                    db8Var.g(bundleA);
                }
                navHostFragment.S.b.c("android-support-nav:fragment:navControllerState", new ny1(i2, db8Var));
                Bundle bundleA2 = navHostFragment.S.b.a("android-support-nav:fragment:graphId");
                if (bundleA2 != null) {
                    navHostFragment.o0 = bundleA2.getInt("android-support-nav:fragment:graphId");
                }
                navHostFragment.S.b.c("android-support-nav:fragment:graphId", new ny1(5, navHostFragment));
                int i4 = navHostFragment.o0;
                w5d w5dVar = db8Var.h;
                if (i4 != 0) {
                    ka8Var.s(((mb8) w5dVar.getValue()).b(i4), null);
                } else {
                    Bundle bundle4 = navHostFragment.f;
                    int i5 = bundle4 != null ? bundle4.getInt("android-support-nav:fragment:graphId") : 0;
                    Bundle bundle5 = bundle4 != null ? bundle4.getBundle("android-support-nav:fragment:startDestinationArgs") : null;
                    if (i5 != 0) {
                        ka8Var.s(((mb8) w5dVar.getValue()).b(i5), bundle5);
                    }
                }
                return db8Var;
            default:
                return (gva) ((kva) obj).a.e.getValue();
        }
    }
}
