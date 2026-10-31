package e10;

import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.teslacoilsw.launcher.preferences.IconLayoutSettingsActivity;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import com.teslacoilsw.launcher.widget.FontFamilyToolbar;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements View.OnApplyWindowInsetsListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51597a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m.m f51598b;

    public /* synthetic */ j(m.m mVar, int i5) {
        this.f51597a = i5;
        this.f51598b = mVar;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        int i5 = this.f51597a;
        m.m mVar = this.f51598b;
        switch (i5) {
            case 0:
                int i11 = AdaptiveIconSettingsActivity.C;
                ((v9.a) ((AdaptiveIconSettingsActivity) mVar).Z()).f92221a.h(new Rect(windowInsets.getSystemWindowInsetLeft(), windowInsets.getSystemWindowInsetTop(), windowInsets.getSystemWindowInsetRight(), windowInsets.getSystemWindowInsetBottom()));
                return windowInsets.consumeSystemWindowInsets();
            case 1:
                int i12 = IconLayoutSettingsActivity.B;
                ((v9.c) ((IconLayoutSettingsActivity) mVar).Z()).f92279a.h(new Rect(windowInsets.getSystemWindowInsetLeft(), windowInsets.getSystemWindowInsetTop(), windowInsets.getSystemWindowInsetRight(), windowInsets.getSystemWindowInsetBottom()));
                return windowInsets.consumeSystemWindowInsets();
            default:
                SettingsActivityLegacy settingsActivityLegacy = (SettingsActivityLegacy) mVar;
                v9.d dVar = settingsActivityLegacy.f45976t;
                Rect rect = settingsActivityLegacy.f45980x;
                if (dVar == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                ViewGroup.LayoutParams layoutParams = ((FontFamilyToolbar) dVar.f92299d).getLayoutParams();
                Intrinsics.e(layoutParams, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
                ((ViewGroup.MarginLayoutParams) layoutParams).topMargin = windowInsets.getSystemWindowInsetTop();
                if (Build.VERSION.SDK_INT >= 30) {
                    rect.set(windowInsets.getStableInsetLeft(), windowInsets.getStableInsetTop(), windowInsets.getStableInsetRight(), windowInsets.getStableInsetBottom());
                } else {
                    rect.set(windowInsets.getSystemWindowInsetLeft(), windowInsets.getSystemWindowInsetTop(), windowInsets.getSystemWindowInsetRight(), windowInsets.getSystemWindowInsetBottom());
                }
                settingsActivityLegacy.a0();
                return windowInsets.consumeSystemWindowInsets();
        }
    }
}
