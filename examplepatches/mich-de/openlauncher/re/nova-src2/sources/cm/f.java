package cm;

import a5.a0;
import a5.a1;
import a5.h2;
import ads_mobile_sdk.vo1;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.view.ViewStructure;
import android.widget.Toast;
import aosp.android.icu.impl.CalendarAstronomer;
import b5.q;
import c4.f0;
import com.facebook.ads.MediaView;
import com.facebook.ads.MediaViewListener;
import com.google.android.gms.common.api.ApiMetadata;
import com.google.android.gms.common.api.ComplianceOptions;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.identitycredentials.GetCredentialRequest;
import com.google.android.gms.wallet.IsReadyToPayRequest;
import com.google.android.gms.wallet.PaymentCardRecognitionIntentRequest;
import com.google.android.gms.wallet.PaymentDataRequest;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.appbar.CollapsingToolbarLayout;
import com.google.android.material.behavior.SwipeDismissBehavior;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.crypto.tink.shaded.protobuf.b0;
import com.google.crypto.tink.shaded.protobuf.x0;
import com.teslacoilsw.launcher.popup.SimplePopupView;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.teslacoilsw.launcher.preferences.fancyprefs.color.ColorPickerBottomSheet;
import com.teslacoilsw.launcher.preferences.fancyprefs.color.ColorSwatchRadioButton;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;
import com.vungle.ads.internal.protos.Sdk;
import e10.y2;
import eb0.m;
import gf.u0;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Optional;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.SesameFrontend;
import ninja.sesame.lib.bridge.v1_1.LookFeelKeys;
import o9.l0;
import ps.e0;
import x80.p0;
import y3.n;

/* loaded from: classes3.dex */
public final class f implements x9.h, a0, j30.e, m, q, f0, rg.l, fi.g, l30.c, c60.a, fc.f, MediaViewListener, u0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20115a;

    /* renamed from: b, reason: collision with root package name */
    public Object f20116b;

    public /* synthetic */ f(Object obj, int i5) {
        this.f20115a = i5;
        this.f20116b = obj;
    }

    public static f N(ViewStructure viewStructure) {
        return new f(viewStructure, 17);
    }

    public static f y(com.google.crypto.tink.shaded.protobuf.m mVar) {
        f fVar = mVar.f34632g;
        return fVar != null ? fVar : new f(mVar);
    }

    public Bundle A() {
        return ((ViewStructure) this.f20116b).getExtras();
    }

    public Pattern B(String str) {
        Object obj;
        f fVar = (f) this.f20116b;
        synchronized (fVar) {
            obj = ((d60.a) fVar.f20116b).get(str);
        }
        Pattern pattern = (Pattern) obj;
        if (pattern != null) {
            return pattern;
        }
        Pattern patternCompile = Pattern.compile(str);
        f fVar2 = (f) this.f20116b;
        synchronized (fVar2) {
            ((d60.a) fVar2.f20116b).put(str, patternCompile);
        }
        return patternCompile;
    }

    public boolean C(CharSequence charSequence, c60.f fVar) {
        String str = fVar.f19800b;
        if (str.length() != 0) {
            Matcher matcher = ((f) this.f20116b).B(str).matcher(charSequence);
            return matcher.lookingAt() && matcher.matches();
        }
        return false;
    }

    public void D(CharSequence charSequence, gz.e eVar, String str, String str2) {
        gz.j jVar;
        AdaptiveIconSettingsActivity adaptiveIconSettingsActivity = (AdaptiveIconSettingsActivity) this.f20116b;
        gz.e eVar2 = gz.e.f58645c;
        if (eVar == eVar2 && Intrinsics.b(str2, "play_find_more")) {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse("market://search?q=icon+theme"));
            intent.setPackage("com.android.vending");
            try {
                adaptiveIconSettingsActivity.startActivity(intent);
                return;
            } catch (Exception unused) {
                Toast.makeText(adaptiveIconSettingsActivity.getApplicationContext(), 2132017222, 0).show();
                return;
            }
        }
        String strF0 = r70.j.F0(charSequence.toString(), ":", " ", false);
        if (strF0.length() == 0 || (eVar == eVar2 && str2 == null)) {
            gz.j.Companion.getClass();
            jVar = gz.j.f58651g;
        } else {
            jVar = new gz.j(strF0, eVar, str, false, str2);
        }
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        y2.F0().i(jVar);
        gz.j.Companion.getClass();
        if (!Intrinsics.b(jVar, gz.j.f58651g)) {
            o10.b.a("icon_pack_applied", adaptiveIconSettingsActivity);
        }
        Context applicationContext = adaptiveIconSettingsActivity.getApplicationContext();
        String str3 = jVar.f58654c;
        y2Var.getClass();
        if (y2.s1()) {
            y2Var.getClass();
            if (((Boolean) y2.t1().l()).booleanValue() && oy.c.f81123a) {
                Bundle bundle = new Bundle();
                bundle.putString(LookFeelKeys.ICON_PACK_PKG, str3);
                SesameFrontend.setLookFeelPreferences(bundle);
            }
        } else {
            SesameFrontend.init(applicationContext, new nx.l(str3, applicationContext, false));
        }
        adaptiveIconSettingsActivity.h0();
        AdaptiveIconSettingsActivity.c0();
    }

    public void E(Object obj) {
        ((h) this.f20116b).m(obj);
    }

    public void F(String str) {
        ((ViewStructure) this.f20116b).setClassName(str);
    }

    public void G(String str) {
        ((ViewStructure) this.f20116b).setContentDescription(str);
    }

    public void H(int i5, int i11, int i12, int i13) {
        ((ViewStructure) this.f20116b).setDimens(i5, i11, 0, 0, i12, i13);
    }

    public void I(Exception exc) {
        ((h) this.f20116b).n(exc);
    }

    public void J(int i5, String str) {
        ((ViewStructure) this.f20116b).setId(i5, null, null, str);
    }

    public void K(CharSequence charSequence) {
        ((ViewStructure) this.f20116b).setText(charSequence);
    }

    public void L(float f11) {
        ((ViewStructure) this.f20116b).setTextStyle(f11, 0, 0, 0);
    }

    public ViewStructure M() {
        return (ViewStructure) this.f20116b;
    }

    public void O(int i5, com.google.crypto.tink.shaded.protobuf.i iVar) {
        ((com.google.crypto.tink.shaded.protobuf.m) this.f20116b).r0(i5, iVar);
    }

    public void P(int i5) {
        ((com.google.crypto.tink.shaded.protobuf.m) this.f20116b).z0(i5, 4);
    }

    public void Q(int i5, int i11) {
        ((com.google.crypto.tink.shaded.protobuf.m) this.f20116b).s0(i5, i11);
    }

    public void R(int i5, long j11) {
        ((com.google.crypto.tink.shaded.protobuf.m) this.f20116b).u0(i5, j11);
    }

    public void S(int i5, Object obj, x0 x0Var) {
        com.google.crypto.tink.shaded.protobuf.m mVar = (com.google.crypto.tink.shaded.protobuf.m) this.f20116b;
        mVar.z0(i5, 3);
        x0Var.f((com.google.crypto.tink.shaded.protobuf.a) obj, mVar.f34632g);
        mVar.z0(i5, 4);
    }

    public void T(int i5, long j11) {
        ((com.google.crypto.tink.shaded.protobuf.m) this.f20116b).C0(i5, j11);
    }

    public void U(int i5, Object obj, x0 x0Var) {
        com.google.crypto.tink.shaded.protobuf.a aVar = (com.google.crypto.tink.shaded.protobuf.a) obj;
        com.google.crypto.tink.shaded.protobuf.m mVar = (com.google.crypto.tink.shaded.protobuf.m) this.f20116b;
        mVar.z0(i5, 2);
        mVar.B0(aVar.a(x0Var));
        x0Var.f(aVar, this);
    }

    public void V(int i5) {
        ((com.google.crypto.tink.shaded.protobuf.m) this.f20116b).z0(i5, 3);
    }

    @Override // l30.c
    public void a(DumbRadioGrid dumbRadioGrid, int i5) {
        if (i5 != -1) {
            ColorPickerBottomSheet colorPickerBottomSheet = (ColorPickerBottomSheet) this.f20116b;
            View viewFindViewById = dumbRadioGrid.findViewById(i5);
            if (viewFindViewById == null || !(viewFindViewById instanceof ColorSwatchRadioButton)) {
                throw new IllegalStateException("Trying to getColorFromViewId for a viewId that does not exist or is not a ColorSwatchRadioButton");
            }
            colorPickerBottomSheet.q(((ColorSwatchRadioButton) viewFindViewById).f46046a.f56840c);
        }
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        switch (this.f20115a) {
            case 19:
                GetCredentialRequest getCredentialRequest = (GetCredentialRequest) this.f20116b;
                fh.f fVar = new fh.f((fi.j) obj2);
                fh.d dVar = (fh.d) ((fh.e) obj).getService();
                ApiMetadata apiMetadata = new ApiMetadata(new ComplianceOptions(-1, -1, 0, true), false);
                apiMetadata.f31798h = false;
                fh.b bVar = (fh.b) dVar;
                Parcel parcelObtain = Parcel.obtain();
                parcelObtain.writeInterfaceToken("com.google.android.gms.identitycredentials.internal.IIdentityCredentialService");
                parcelObtain.writeStrongBinder(fVar);
                nh.a.b(parcelObtain, getCredentialRequest);
                nh.a.b(parcelObtain, apiMetadata);
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    bVar.f55130a.transact(1, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                    return;
                } finally {
                    parcelObtain.recycle();
                    parcelObtain2.recycle();
                }
            case 26:
                th.d dVar2 = (th.d) obj;
                IsReadyToPayRequest isReadyToPayRequest = (IsReadyToPayRequest) this.f20116b;
                dVar2.getClass();
                th.c cVar = new th.c(0, (fi.j) obj2);
                try {
                    th.a aVar = (th.a) dVar2.getService();
                    Bundle bundleB = dVar2.b();
                    Parcel parcelObtain3 = Parcel.obtain();
                    parcelObtain3.writeInterfaceToken(aVar.f32954c);
                    e0.G(parcelObtain3, isReadyToPayRequest);
                    e0.G(parcelObtain3, bundleB);
                    e0.H(parcelObtain3, cVar);
                    aVar.Z(parcelObtain3, 14);
                    return;
                } catch (RemoteException e3) {
                    Log.e("WalletClientImpl", "RemoteException during isReadyToPay", e3);
                    Bundle bundle = Bundle.EMPTY;
                    u90.b.c0(Status.f31808l, Boolean.FALSE, cVar.f89183b);
                    return;
                }
            case 27:
                th.d dVar3 = (th.d) obj;
                PaymentDataRequest paymentDataRequest = (PaymentDataRequest) this.f20116b;
                Bundle bundleB2 = dVar3.b();
                bundleB2.putBoolean("com.google.android.gms.wallet.EXTRA_USING_AUTO_RESOLVABLE_RESULT", true);
                th.c cVar2 = new th.c(2, (fi.j) obj2);
                try {
                    th.a aVar2 = (th.a) dVar3.getService();
                    Parcel parcelObtain4 = Parcel.obtain();
                    parcelObtain4.writeInterfaceToken(aVar2.f32954c);
                    e0.G(parcelObtain4, paymentDataRequest);
                    e0.G(parcelObtain4, bundleB2);
                    e0.H(parcelObtain4, cVar2);
                    aVar2.Z(parcelObtain4, 19);
                    return;
                } catch (RemoteException e11) {
                    Log.e("WalletClientImpl", "RemoteException getting payment data", e11);
                    Bundle bundle2 = Bundle.EMPTY;
                    gi.a.a(Status.f31808l, null, cVar2.f89183b);
                    return;
                }
            default:
                th.d dVar4 = (th.d) obj;
                PaymentCardRecognitionIntentRequest paymentCardRecognitionIntentRequest = (PaymentCardRecognitionIntentRequest) this.f20116b;
                Bundle bundleB3 = dVar4.b();
                th.c cVar3 = new th.c(1, (fi.j) obj2);
                try {
                    th.a aVar3 = (th.a) dVar4.getService();
                    Parcel parcelObtain5 = Parcel.obtain();
                    parcelObtain5.writeInterfaceToken(aVar3.f32954c);
                    e0.G(parcelObtain5, paymentCardRecognitionIntentRequest);
                    e0.G(parcelObtain5, bundleB3);
                    e0.H(parcelObtain5, cVar3);
                    aVar3.Z(parcelObtain5, 24);
                    return;
                } catch (RemoteException e12) {
                    Log.e("WalletClientImpl", "RemoteException during getPaymentCardRecognitionIntent", e12);
                    return;
                }
        }
    }

    @Override // x9.h
    public void b(l0 l0Var) {
        l0Var.f79954f.setElevation(0.0f);
    }

    @Override // gf.u0
    public boolean c() {
        for (u0 u0Var : (u0[]) this.f20116b) {
            if (u0Var.c()) {
                return true;
            }
        }
        return false;
    }

    @Override // eb0.m
    public Object convert(Object obj) {
        return Optional.ofNullable(((m) this.f20116b).convert((p0) obj));
    }

    @Override // gf.u0
    public long d() {
        long jMin = Long.MAX_VALUE;
        for (u0 u0Var : (u0[]) this.f20116b) {
            long jD = u0Var.d();
            if (jD != Long.MIN_VALUE) {
                jMin = Math.min(jMin, jD);
            }
        }
        if (jMin == Long.MAX_VALUE) {
            return Long.MIN_VALUE;
        }
        return jMin;
    }

    @Override // x9.h
    public void f(l0 l0Var, boolean z11) {
        SimplePopupView simplePopupView = (SimplePopupView) this.f20116b;
        if (z11) {
            int i5 = SimplePopupView.R;
            simplePopupView.U();
            return;
        }
        View view = simplePopupView.O;
        if (view != null) {
            view.setVisibility(0);
        } else {
            Intrinsics.m("anchor");
            throw null;
        }
    }

    @Override // x9.h
    public boolean g(double d5) {
        return d5 > ((double) ((SimplePopupView) this.f20116b).P);
    }

    @Override // b5.q
    public boolean j(View view) {
        SwipeDismissBehavior swipeDismissBehavior = (SwipeDismissBehavior) this.f20116b;
        if (!swipeDismissBehavior.w(view)) {
            return false;
        }
        WeakHashMap weakHashMap = a1.f250a;
        boolean z11 = view.getLayoutDirection() == 1;
        int i5 = swipeDismissBehavior.f34078d;
        view.offsetLeftAndRight((!(i5 == 0 && z11) && (i5 != 1 || z11)) ? view.getWidth() : -view.getWidth());
        view.setAlpha(0.0f);
        return true;
    }

    @Override // c60.a
    public InputStream k(String str) {
        try {
            return ((AssetManager) this.f20116b).open(str.substring(1));
        } catch (IOException unused) {
            return null;
        }
    }

    @Override // gf.u0
    public boolean n(long j11) {
        boolean zN;
        boolean z11 = false;
        do {
            long jD = d();
            if (jD == Long.MIN_VALUE) {
                return z11;
            }
            zN = false;
            for (u0 u0Var : (u0[]) this.f20116b) {
                long jD2 = u0Var.d();
                boolean z12 = jD2 != Long.MIN_VALUE && jD2 <= j11;
                if (jD2 == jD || z12) {
                    zN |= u0Var.n(j11);
                }
            }
            z11 |= zN;
        } while (zN);
        return z11;
    }

    @Override // fc.f
    public void o(ArrayList arrayList, boolean z11) {
        fc.i iVar = ((gc.b) this.f20116b).f57330c;
        arrayList.size();
        if (z11) {
            synchronized (((gc.b) this.f20116b).f57328a) {
                ((gc.b) this.f20116b).f57328a.removeAll(arrayList);
            }
        }
    }

    @Override // j30.e
    public void onCancel() {
        ((j30.c) this.f20116b).f68882b = true;
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onComplete(MediaView mediaView) {
        vo1 vo1Var = ((gd.e) this.f20116b).f57368p;
        if (vo1Var != null) {
            vo1Var.onVideoComplete();
        }
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onEnterFullscreen(MediaView mediaView) {
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onExitFullscreen(MediaView mediaView) {
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onFullscreenBackground(MediaView mediaView) {
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onFullscreenForeground(MediaView mediaView) {
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onPause(MediaView mediaView) {
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onPlay(MediaView mediaView) {
    }

    @Override // fi.g
    public /* bridge */ /* synthetic */ void onSuccess(Object obj) {
        ((fi.h) this.f20116b).onCanceled();
    }

    @Override // com.facebook.ads.MediaViewListener
    public void onVolumeChange(MediaView mediaView, float f11) {
    }

    @Override // c4.f0
    public long s(y3.l lVar, long j11, n nVar, long j12) {
        long j13 = ((y3.k) ((Function0) this.f20116b).invoke()).f96605a;
        return (jk.b.p(lVar.f96607a + ((int) (j13 >> 32)), (int) (j12 >> 32), (int) (j11 >> 32), nVar == n.f96612a) << 32) | (jk.b.p(lVar.f96608b + ((int) (j13 & 4294967295L)), (int) (j12 & 4294967295L), (int) (j11 & 4294967295L), true) & 4294967295L);
    }

    @Override // gf.u0
    public long t() {
        long jMin = Long.MAX_VALUE;
        for (u0 u0Var : (u0[]) this.f20116b) {
            long jT = u0Var.t();
            if (jT != Long.MIN_VALUE) {
                jMin = Math.min(jMin, jT);
            }
        }
        if (jMin == Long.MAX_VALUE) {
            return Long.MIN_VALUE;
        }
        return jMin;
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        h2 h2Var2;
        switch (this.f20115a) {
            case 6:
                AppBarLayout appBarLayout = (AppBarLayout) this.f20116b;
                WeakHashMap weakHashMap = a1.f250a;
                h2Var2 = appBarLayout.getFitsSystemWindows() ? h2Var : null;
                if (!Objects.equals(appBarLayout.f34010g, h2Var2)) {
                    appBarLayout.f34010g = h2Var2;
                    appBarLayout.setWillNotDraw(!(appBarLayout.f34022u != null && appBarLayout.f() > 0));
                    appBarLayout.requestLayout();
                }
                return h2Var;
            case 7:
                CollapsingToolbarLayout collapsingToolbarLayout = (CollapsingToolbarLayout) this.f20116b;
                WeakHashMap weakHashMap2 = a1.f250a;
                h2Var2 = collapsingToolbarLayout.getFitsSystemWindows() ? h2Var : null;
                if (!Objects.equals(collapsingToolbarLayout.f34058z, h2Var2)) {
                    collapsingToolbarLayout.f34058z = h2Var2;
                    collapsingToolbarLayout.requestLayout();
                }
                return h2Var.f296a.c();
            default:
                gj.d dVar = (gj.d) this.f20116b;
                gj.c cVar = dVar.f57700m;
                if (cVar != null) {
                    dVar.f57693f.W.remove(cVar);
                }
                gj.c cVar2 = new gj.c(dVar.f57696i, h2Var);
                dVar.f57700m = cVar2;
                cVar2.e(dVar.getWindow());
                BottomSheetBehavior bottomSheetBehavior = dVar.f57693f;
                gj.c cVar3 = dVar.f57700m;
                ArrayList arrayList = bottomSheetBehavior.W;
                if (!arrayList.contains(cVar3)) {
                    arrayList.add(cVar3);
                }
                return h2Var;
        }
    }

    @Override // gf.u0
    public void v(long j11) {
        for (u0 u0Var : (u0[]) this.f20116b) {
            u0Var.v(j11);
        }
    }

    public void w(int i5, boolean z11) {
        e30.j jVar = (e30.j) this.f20116b;
        if (z11) {
            jVar.c(i5);
        } else {
            jVar.getClass();
        }
    }

    public double x() {
        return ((CalendarAstronomer) this.f20116b).c();
    }

    public Function1 z() {
        return (Function1) this.f20116b;
    }

    public f(fi.n nVar, fi.h hVar) {
        this.f20115a = 20;
        this.f20116b = hVar;
    }

    public f(com.google.crypto.tink.shaded.protobuf.m mVar) {
        this.f20115a = 1;
        b0.a(mVar, "output");
        this.f20116b = mVar;
        mVar.f34632g = this;
    }

    public f(int i5) {
        this.f20115a = i5;
        switch (i5) {
            case 4:
                break;
            case 5:
                f fVar = new f(4);
                fVar.f20116b = new d60.a(fVar, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE);
                this.f20116b = fVar;
                break;
            case 18:
                this.f20116b = new e30.j(7);
                break;
            default:
                this.f20116b = new f(5);
                break;
        }
    }
}
