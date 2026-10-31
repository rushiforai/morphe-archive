package e10;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.view.View;
import android.widget.Toast;
import com.android.launcher3.secondarydisplay.SecondaryDragLayer;
import com.teslacoilsw.launcher.EditShortcutFloatingView;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.preferences.fragments.SettingsIntegrations;
import com.teslacoilsw.launcher.preferences.fragments.SettingsNova;
import com.teslacoilsw.launcher.preferences.fragments.SettingsSearchBar;
import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class k implements View.OnLongClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51618a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f51619b;

    public /* synthetic */ k(Object obj, int i5) {
        this.f51618a = i5;
        this.f51619b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0106  */
    @Override // android.view.View.OnLongClickListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onLongClick(View view) throws Resources.NotFoundException {
        int i5 = this.f51618a;
        Continuation continuation = null;
        Object obj = this.f51619b;
        switch (i5) {
            case 0:
                AdaptiveIconSettingsActivity adaptiveIconSettingsActivity = (AdaptiveIconSettingsActivity) obj;
                int i11 = AdaptiveIconSettingsActivity.C;
                fz.d.Companion.getClass();
                List list = fz.d.E;
                fz.d dVar = (fz.d) b70.g.h1(list);
                for (int size = list.size() - 1; -1 < size; size--) {
                    fz.d dVar2 = adaptiveIconSettingsActivity.f45949y;
                    if (dVar2 == null) {
                        Intrinsics.m("currentShape");
                        throw null;
                    }
                    fz.d.Companion.getClass();
                    List list2 = fz.d.E;
                    if (dVar2.equals(list2.get(size))) {
                        if (Intrinsics.b(dVar, fz.d.D)) {
                            fz.d.Companion.getClass();
                            dVar = fz.d.f56190k;
                        }
                        ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setTag(dVar);
                        Toast.makeText(adaptiveIconSettingsActivity.getApplicationContext(), dVar.f56207d, 0).show();
                        ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setCompoundDrawables(null, dVar.a(adaptiveIconSettingsActivity), null, null);
                        ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setChecked(true);
                        ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setVisibility(0);
                        adaptiveIconSettingsActivity.f45949y = dVar;
                        adaptiveIconSettingsActivity.f45944t.clear();
                        adaptiveIconSettingsActivity.g0();
                        return true;
                    }
                    dVar = (fz.d) list2.get(size);
                }
                if (Intrinsics.b(dVar, fz.d.D)) {
                }
                ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setTag(dVar);
                Toast.makeText(adaptiveIconSettingsActivity.getApplicationContext(), dVar.f56207d, 0).show();
                ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setCompoundDrawables(null, dVar.a(adaptiveIconSettingsActivity), null, null);
                ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setChecked(true);
                ((v9.a) adaptiveIconSettingsActivity.Z()).f92239u.setVisibility(0);
                adaptiveIconSettingsActivity.f45949y = dVar;
                adaptiveIconSettingsActivity.f45944t.clear();
                adaptiveIconSettingsActivity.g0();
                return true;
            case 1:
                ComponentName componentName = SettingsActivityLegacy.A;
                ((SettingsActivityLegacy) obj).b0(!a3.f51435a.f51545a.getBoolean("experimental_mode", false));
                return true;
            case 2:
                return ((FancyPrefView) obj).f46012t.callOnClick();
            case 3:
                SettingsIntegrations settingsIntegrations = (SettingsIntegrations) obj;
                Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.fromParts("package", "com.teslacoilsw.launcherclientproxy", null));
                intent.setFlags(276856832);
                try {
                    settingsIntegrations.startActivity(intent);
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
                return true;
            case 4:
                h6.x xVarE = h6.g1.e((SettingsNova) obj);
                Context context = mx.g0.f77088a;
                t70.m0.t(xVarE, mx.g0.g().f56215x, null, new b.x1(2, continuation, 23), 2);
                return true;
            case 5:
                SettingsSearchBar settingsSearchBar = (SettingsSearchBar) obj;
                try {
                    Intent intent2 = new Intent("android.settings.VOICE_INPUT_SETTINGS");
                    intent2.addFlags(268468224);
                    settingsSearchBar.startActivity(intent2);
                    return true;
                } catch (Exception e11) {
                    e11.printStackTrace();
                    return false;
                }
            case 6:
                int i12 = EditShortcutFloatingView.f45599v;
                y2.f51877a.getClass();
                y2.c0().i(Boolean.valueOf(!((Boolean) y2.c0().l()).booleanValue()));
                ((EditShortcutFloatingView) obj).W().f92484g.setVisibility(((Boolean) y2.c0().l()).booleanValue() ? 0 : 8);
                return true;
            default:
                return SecondaryDragLayer.o((SecondaryDragLayer) obj, view);
        }
    }
}
