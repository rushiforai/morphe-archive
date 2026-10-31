package fk;

import ab.x;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.method.PasswordTransformationMethod;
import android.view.View;
import android.widget.EditText;
import androidx.appcompat.widget.SwitchCompat;
import com.android.launcher3.AppWidgetResizeFrame;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.android.launcher3.secondarydisplay.SecondaryDisplayLauncher;
import com.android.launcher3.util.PendingRequestArgs;
import com.google.android.gms.internal.consent_sdk.k0;
import com.instabridge.ai.consent.ConsentSettingsView;
import com.stripe.android.paymentsheet.ui.PrimaryButton;
import com.teslacoilsw.launcher.ChooseActionIntentActivity;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.launcher3.allapps.NovaSlidingTabStrip;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.teslacoilsw.launcher.preferences.IconLayoutSettingsActivity;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefIntentView;
import com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragment;
import com.teslacoilsw.launcher.preferences.fragments.SettingsDesktop;
import com.teslacoilsw.launcher.preferences.fragments.SettingsDock;
import com.teslacoilsw.launcher.preferences.fragments.SettingsFolder;
import com.teslacoilsw.launcher.preferences.fragments.SettingsGestures;
import com.teslacoilsw.launcher.preferences.fragments.SettingsLookFeel;
import com.teslacoilsw.launcher.preferences.widget.LinkImageView;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.teslacoilsw.launcher.theme.ThemeListFragment;
import com.vungle.ads.internal.o1;
import fe.a0;
import fe.l1;
import hv.s2;
import k30.h0;
import kl.q0;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import mx.c0;
import mx.g0;
import o9.n1;
import pp.b0;
import v9.d0;

/* loaded from: classes3.dex */
public final /* synthetic */ class t implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55265a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f55266b;

    public /* synthetic */ t(Object obj, int i5) {
        this.f55265a = i5;
        this.f55266b = obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x015e  */
    @Override // android.view.View.OnClickListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onClick(View view) throws Exception {
        int i5 = this.f55265a;
        Intent intentD = null;
        Object obj = this.f55266b;
        switch (i5) {
            case 0:
                u uVar = (u) obj;
                EditText editText = uVar.f55268f;
                if (editText == null) {
                    return;
                }
                int selectionEnd = editText.getSelectionEnd();
                EditText editText2 = uVar.f55268f;
                if (editText2 == null || !(editText2.getTransformationMethod() instanceof PasswordTransformationMethod)) {
                    uVar.f55268f.setTransformationMethod(PasswordTransformationMethod.getInstance());
                } else {
                    uVar.f55268f.setTransformationMethod(null);
                }
                if (selectionEnd >= 0) {
                    uVar.f55268f.setSelection(selectionEnd);
                }
                uVar.p();
                return;
            case 1:
                ((NovaSettingsFragment) obj).requireActivity().onBackPressed();
                return;
            case 2:
                ((Function1) obj).invoke(view);
                return;
            case 3:
                SettingsDesktop settingsDesktop = (SettingsDesktop) obj;
                Intent intent = new Intent(settingsDesktop.getActivity(), (Class<?>) IconLayoutSettingsActivity.class);
                intent.putExtra("category", "DESKTOP");
                settingsDesktop.startActivity(intent);
                return;
            case 4:
                SettingsDock settingsDock = (SettingsDock) obj;
                Intent intent2 = new Intent(settingsDock.getActivity(), (Class<?>) IconLayoutSettingsActivity.class);
                intent2.putExtra("category", "DOCK");
                settingsDock.startActivity(intent2);
                return;
            case 5:
                SettingsFolder settingsFolder = (SettingsFolder) obj;
                Intent intent3 = new Intent(settingsFolder.getActivity(), (Class<?>) IconLayoutSettingsActivity.class);
                intent3.putExtra("category", "FOLDER");
                settingsFolder.startActivity(intent3);
                return;
            case 6:
                SettingsGestures settingsGestures = (SettingsGestures) obj;
                boolean z11 = SettingsGestures.f46097k;
                Intrinsics.e(view, "null cannot be cast to non-null type com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefIntentView");
                FancyPrefIntentView fancyPrefIntentView = (FancyPrefIntentView) view;
                settingsGestures.f46100i = fancyPrefIntentView.getId();
                Intent intent4 = new Intent(settingsGestures.getActivity(), (Class<?>) ChooseActionIntentActivity.class);
                intent4.putExtra("android.intent.extra.TITLE", fancyPrefIntentView.q());
                settingsGestures.startActivityForResult(intent4, 1);
                return;
            case 7:
                ((d0) obj).f92305b.callOnClick();
                return;
            case 8:
                ((h0) obj).f();
                return;
            case 9:
                SettingsLookFeel settingsLookFeel = (SettingsLookFeel) obj;
                settingsLookFeel.startActivity(new Intent(settingsLookFeel.requireContext(), (Class<?>) AdaptiveIconSettingsActivity.class));
                return;
            case 10:
                Dialog dialog = (Dialog) ((Ref.ObjectRef) obj).f71863a;
                if (dialog != null) {
                    dialog.dismiss();
                    return;
                }
                return;
            case 11:
                int i11 = PrimaryButton.f44986m;
                ((s2) obj).f60583c.invoke();
                return;
            case 12:
                LinkImageView linkImageView = (LinkImageView) obj;
                String str = linkImageView.f46136a;
                Uri uri = str != null ? Uri.parse(str) : null;
                if (uri != null) {
                    Intent intent5 = new Intent("android.intent.action.VIEW", uri);
                    intent5.addFlags(268435456);
                    linkImageView.getContext().startActivity(intent5);
                    return;
                }
                return;
            case 13:
                int i12 = ConsentSettingsView.o;
                ((SwitchCompat) obj).toggle();
                return;
            case 14:
                ((w20.l) obj).c();
                return;
            case 15:
                PopupContainerWithArrow popupContainerWithArrow = (PopupContainerWithArrow) obj;
                int i13 = PopupContainerWithArrow.f21226g0;
                ((za.d) popupContainerWithArrow.n).Q().onClick(view);
                popupContainerWithArrow.K(true);
                return;
            case 16:
                int i14 = NovaSlidingTabStrip.f45815j;
                ((l30.e) obj).show();
                return;
            case 17:
                Context context = (Context) obj;
                try {
                    context.startActivity(c0.DATE.b());
                    return;
                } catch (Exception unused) {
                    k0.w(context, 2132017222, 0).show();
                    return;
                }
            case 18:
                ((l30.s) obj).K(true);
                return;
            case 19:
                Context context2 = ((x) obj).getContext();
                q0 q0Var = n1.C0;
                ((NovaLauncher) o9.k.Y(context2)).startSearch(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false, null, true);
                return;
            case 20:
                com.vungle.ads.internal.ui.view.k.a((o1) obj, view);
                return;
            case 21:
                com.vungle.ads.internal.ui.view.m.a((com.vungle.ads.internal.ui.view.m) obj, view);
                return;
            case 22:
                AppWidgetResizeFrame appWidgetResizeFrame = (AppWidgetResizeFrame) obj;
                NovaLauncher novaLauncher = appWidgetResizeFrame.f20841c;
                novaLauncher.f80010k0 = PendingRequestArgs.p0(appWidgetResizeFrame.f20847i.getAppWidgetId(), null, (ga.e) appWidgetResizeFrame.f20847i.getTag());
                novaLauncher.S.f(novaLauncher, appWidgetResizeFrame.f20847i.getAppWidgetId(), 13);
                return;
            case 23:
                SecondaryDisplayLauncher secondaryDisplayLauncher = (SecondaryDisplayLauncher) obj;
                int i15 = SecondaryDisplayLauncher.O;
                secondaryDisplayLauncher.getClass();
                if (view.getWindowToken() == null) {
                    return;
                }
                Object tag = view.getTag();
                if (tag instanceof ga.e) {
                    ga.e eVar = (ga.e) tag;
                    if (eVar instanceof ga.f) {
                        ga.f fVar = (ga.f) eVar;
                        if ((fVar.f57305s & 1024) != 0) {
                            ComponentName componentNameI = fVar.i();
                            if (componentNameI != null) {
                                Context applicationContext = secondaryDisplayLauncher.getApplicationContext();
                                applicationContext.getPackageManager();
                                intentD = new Intent("android.intent.action.VIEW").setData(new Uri.Builder().scheme("market").authority("details").appendQueryParameter("id", componentNameI.getPackageName()).build()).putExtra("android.intent.extra.REFERRER", new Uri.Builder().scheme("android-app").authority(applicationContext.getPackageName()).build());
                            }
                        } else {
                            intentD = eVar.d();
                        }
                    }
                    if (intentD == null) {
                        throw new IllegalArgumentException("Input must have a valid intent");
                    }
                    secondaryDisplayLauncher.q0(view, intentD, eVar);
                    return;
                }
                return;
            case 24:
                AppSearchResultsView appSearchResultsView = (AppSearchResultsView) obj;
                b3.h0 h0Var = AppSearchResultsView.f46177o0;
                Context context3 = g0.f77088a;
                g0.i().d(appSearchResultsView.s(new Pair(b0.f82689b, 0)));
                appSearchResultsView.f46214z = false;
                ua.g.f90762b.onClick(view);
                return;
            case 25:
                int i16 = ThemeListFragment.f46327m;
                ((ThemeListFragment) obj).getActivity().onBackPressed();
                return;
            case 26:
                ((uf.m) obj).getClass();
                return;
            case 27:
                uf.m mVar = ((uf.f) obj).f91128d;
                l1 l1Var = mVar.f91151b0;
                if (l1Var == null) {
                    return;
                }
                tf.h hVarV = ((a0) l1Var).V();
                l1 l1Var2 = mVar.f91151b0;
                int i17 = wf.v.f94376a;
                hVarV.getClass();
                tf.g gVar = new tf.g(hVarV);
                gVar.a(1);
                gVar.e(1);
                ((a0) l1Var2).k0(new tf.h(gVar));
                mVar.f91158f.f91139b[1] = mVar.getResources().getString(2132017852);
                mVar.f91168k.dismiss();
                return;
            case 28:
                uf.i iVar = (uf.i) obj;
                uf.m mVar2 = iVar.f91137e;
                int adapterPosition = iVar.getAdapterPosition();
                View view2 = mVar2.f91182x;
                if (adapterPosition == 0) {
                    uf.h hVar = mVar2.f91160g;
                    view2.getClass();
                    mVar2.b(hVar, view2);
                    return;
                } else {
                    if (adapterPosition != 1) {
                        mVar2.f91168k.dismiss();
                        return;
                    }
                    uf.f fVar2 = mVar2.f91164i;
                    view2.getClass();
                    mVar2.b(fVar2, view2);
                    return;
                }
            default:
                uf.m mVar3 = ((uf.f) obj).f91128d;
                l1 l1Var3 = mVar3.f91151b0;
                if (l1Var3 != null) {
                    tf.h hVarV2 = ((a0) l1Var3).V();
                    l1 l1Var4 = mVar3.f91151b0;
                    hVarV2.getClass();
                    tf.g gVar2 = new tf.g(hVarV2);
                    gVar2.a(3);
                    gVar2.f89147u = -3;
                    ((a0) l1Var4).k0(new tf.h(gVar2));
                    mVar3.f91168k.dismiss();
                    return;
                }
                return;
        }
    }
}
