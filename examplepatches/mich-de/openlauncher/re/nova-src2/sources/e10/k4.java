package e10;

import android.content.ComponentName;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase;

/* loaded from: classes4.dex */
public final /* synthetic */ class k4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ SettingsActivityLegacy f51629a;

    public /* synthetic */ k4(SettingsActivityLegacy settingsActivityLegacy) {
        this.f51629a = settingsActivityLegacy;
    }

    public final void a() {
        ComponentName componentName = SettingsActivityLegacy.A;
        SettingsActivityLegacy settingsActivityLegacy = this.f51629a;
        androidx.fragment.app.h0 h0VarE = settingsActivityLegacy.getSupportFragmentManager().E("SETTINGS_FRAGMENT");
        settingsActivityLegacy.e0(h0VarE instanceof NovaSettingsFragmentBase ? (NovaSettingsFragmentBase) h0VarE : null);
    }
}
