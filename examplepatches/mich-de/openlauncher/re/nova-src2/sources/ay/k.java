package ay;

import ads_mobile_sdk.et0;
import ads_mobile_sdk.pu;
import ads_mobile_sdk.rr1;
import ads_mobile_sdk.z03;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.view.View;
import android.widget.EditText;
import androidx.fragment.app.m0;
import com.google.android.material.datepicker.MaterialDatePicker;
import com.instabridge.ai.profile.ProfileAccountSection;
import com.moloco.sdk.internal.w;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.C2995b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.u;
import com.teslacoilsw.launcher.novamobile.NovaMobileActivity;
import com.teslacoilsw.launcher.preferences.ContactSupportActivity;
import com.teslacoilsw.launcher.preferences.FolderWindowSettings;
import com.teslacoilsw.launcher.preferences.IconLayoutSettingsActivity;
import com.teslacoilsw.launcher.preferences.NovaSettingsSearchActivity;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefDrawerAnimDialog;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefExpanderView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefLicenseView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancySettingsFragment;
import com.teslacoilsw.launcher.preferences.fragments.SettingsNightMode;
import com.vungle.ads.NativeAd;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class k implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15755a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15756b;

    public /* synthetic */ k(Object obj, int i5) {
        this.f15755a = i5;
        this.f15756b = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        int i5 = this.f15755a;
        Object obj = this.f15756b;
        switch (i5) {
            case 0:
                ((s) obj).f15770b.c();
                return;
            case 1:
                ((et0) obj).a(pu.f8385b);
                return;
            case 2:
                ((z03) obj).f12363g.set(true);
                return;
            case 3:
                rr1 this$0 = (rr1) obj;
                Intrinsics.g(this$0, "this$0");
                this$0.a(true);
                return;
            case 4:
                ((MaterialDatePicker) obj).o();
                throw null;
            case 5:
                ProfileAccountSection._init_$lambda$0((ProfileAccountSection) obj, view);
                return;
            case 6:
                w.a((w) obj, view);
                return;
            case 7:
                C2995b.a((C2995b) obj, view);
                return;
            case 8:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.q.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.q) obj, view);
                return;
            case 9:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.s.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.s) obj, view);
                return;
            case 10:
                u.a((u) obj, view);
                return;
            case 11:
                NativeAd.a((NativeAd) obj, view);
                return;
            case 12:
                List list = NovaMobileActivity.f45911x;
                ((NovaMobileActivity) obj).finish();
                return;
            case 13:
                int i11 = ContactSupportActivity.f45951t;
                ((ContactSupportActivity) obj).onBackPressed();
                return;
            case 14:
                m0 m0VarRequireActivity = ((FolderWindowSettings) obj).requireActivity();
                Intrinsics.e(m0VarRequireActivity, "null cannot be cast to non-null type com.teslacoilsw.launcher.preferences.BaseSettingsActivity");
                SettingsNightMode settingsNightMode = new SettingsNightMode();
                Bundle bundle = new Bundle();
                Bundle bundle2 = new Bundle();
                bundle2.putInt("targetPref", 2131428437);
                Unit unit = Unit.f71706a;
                bundle.putBundle("intentArgs", bundle2);
                ((e10.s) m0VarRequireActivity).Z(settingsNightMode, bundle, true);
                return;
            case 15:
                int i12 = IconLayoutSettingsActivity.B;
                ((IconLayoutSettingsActivity) obj).onBackPressed();
                return;
            case 16:
                int i13 = NovaSettingsSearchActivity.f45964u;
                ((EditText) obj).setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                return;
            case 17:
                ComponentName componentName = SettingsActivityLegacy.A;
                ((SettingsActivityLegacy) obj).onBackPressed();
                return;
            case 18:
                FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) obj;
                if (fancyPrefCheckableView.L && fancyPrefCheckableView.isChecked()) {
                    return;
                }
                fancyPrefCheckableView.x(Boolean.valueOf(!((Boolean) fancyPrefCheckableView.r()).booleanValue()));
                return;
            case 19:
                ((f10.d) obj).L();
                return;
            case 20:
                int i14 = FancyPrefDrawerAnimDialog.f45989h0;
                ((FancyPrefDrawerAnimDialog) obj).S();
                return;
            case 21:
                ((FancyPrefExpanderView) obj).a(!r3.f45997b);
                return;
            case 22:
                FancyPrefLicenseView fancyPrefLicenseView = (FancyPrefLicenseView) obj;
                int i15 = FancyPrefLicenseView.M;
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(fancyPrefLicenseView.L));
                intent.addFlags(268435456);
                fancyPrefLicenseView.getContext().startActivity(intent);
                return;
            case 23:
                int i16 = FancyPrefSpinnerView.f46003e0;
                ((FancyPrefSpinnerView) obj).L();
                return;
            case 24:
                FancyPrefView fancyPrefView = (FancyPrefView) obj;
                d9.f fVar = new d9.f(fancyPrefView.f46008p);
                fVar.e(fancyPrefView.D);
                d9.j jVar = new d9.j(fVar);
                int i17 = f10.d.R;
                ex.i.P(jVar);
                jVar.show();
                return;
            case 25:
                ((f10.q) obj).onBackPressed();
                return;
            case 26:
                m0 activity = ((FancySettingsFragment) obj).getActivity();
                if (activity != null) {
                    activity.onBackPressed();
                    return;
                }
                return;
            case 27:
                ((fb.c) obj).f54582b.setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                return;
            case 28:
                fk.d dVar = (fk.d) obj;
                EditText editText = dVar.f55175i;
                if (editText == null) {
                    return;
                }
                Editable text = editText.getText();
                if (text != null) {
                    text.clear();
                }
                dVar.p();
                return;
            default:
                ((fk.i) obj).t();
                return;
        }
    }
}
