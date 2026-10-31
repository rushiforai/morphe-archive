package ab;

import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.os.Bundle;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.android.launcher3.widget.WidgetAddFlowHandler;
import o9.t2;

/* loaded from: classes2.dex */
public class s extends t2 {

    /* renamed from: s, reason: collision with root package name */
    public final LauncherAppWidgetProviderInfo f760s;

    /* renamed from: t, reason: collision with root package name */
    public AppWidgetHostView f761t;

    /* renamed from: u, reason: collision with root package name */
    public Bundle f762u = null;

    /* renamed from: v, reason: collision with root package name */
    public final int f763v;

    public s(LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo, int i5) {
        if (launcherAppWidgetProviderInfo.m()) {
            this.f57290b = 5;
        } else {
            this.f57290b = 4;
        }
        this.f760s = launcherAppWidgetProviderInfo;
        this.o = launcherAppWidgetProviderInfo.getProfile();
        this.f80139r = ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).provider;
        float f11 = launcherAppWidgetProviderInfo.f21313a;
        n30.b bVar = n30.b.f77778b;
        this.f57295g = fg.a.l(f11);
        this.f57296h = fg.a.l(launcherAppWidgetProviderInfo.f21314b);
        this.f57297i = fg.a.l(launcherAppWidgetProviderInfo.f21315c);
        this.f57298j = fg.a.l(launcherAppWidgetProviderInfo.f21316d);
        this.f57291c = i5;
        this.f763v = i5;
    }

    public final Bundle f0(o9.k kVar) {
        return gb.a.c(kVar, this.f57295g, this.f57296h, AppWidgetHostView.getDefaultPaddingForWidget(kVar, this.f80139r, null));
    }

    public WidgetAddFlowHandler p0() {
        return new WidgetAddFlowHandler(this.f760s);
    }
}
