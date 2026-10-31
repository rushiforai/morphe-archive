package fa;

import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.os.UserHandle;
import android.util.Pair;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import java.util.List;
import o9.t1;

/* loaded from: classes2.dex */
public final class w extends ga.e {

    /* renamed from: r, reason: collision with root package name */
    public final Intent f54518r;

    /* renamed from: s, reason: collision with root package name */
    public final ShortcutInfo f54519s;

    /* renamed from: t, reason: collision with root package name */
    public final AppWidgetProviderInfo f54520t;

    public w(String str, UserHandle userHandle) {
        this.f57290b = 0;
        this.f54518r = new Intent().setPackage(str);
        this.o = userHandle;
    }

    @Override // ga.e
    public final Intent d() {
        return this.f54518r;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof w) {
            w wVar = (w) obj;
            AppWidgetProviderInfo appWidgetProviderInfo = wVar.f54520t;
            ShortcutInfo shortcutInfo = wVar.f54519s;
            boolean zEquals = this.o.equals(wVar.o);
            boolean z11 = this.f57290b == wVar.f57290b;
            boolean zEquals2 = this.f54518r.toUri(0).equals(wVar.f54518r.toUri(0));
            ShortcutInfo shortcutInfo2 = this.f54519s;
            boolean z12 = shortcutInfo2 != null ? shortcutInfo != null && shortcutInfo2.getId().equals(shortcutInfo.getId()) && shortcutInfo2.getPackage().equals(shortcutInfo.getPackage()) : shortcutInfo == null;
            AppWidgetProviderInfo appWidgetProviderInfo2 = this.f54520t;
            boolean z13 = appWidgetProviderInfo2 != null ? !(appWidgetProviderInfo == null || !appWidgetProviderInfo2.provider.equals(appWidgetProviderInfo.provider)) : appWidgetProviderInfo == null;
            if (zEquals && z11 && zEquals2 && z12 && z13) {
                return true;
            }
        }
        return false;
    }

    public final Pair f0(Context context) {
        LauncherActivityInfo launcherActivityInfo;
        int i5 = this.f57290b;
        Intent intent = this.f54518r;
        if (i5 == 0) {
            String str = intent.getPackage();
            List<LauncherActivityInfo> activityList = ((LauncherApps) context.getSystemService(LauncherApps.class)).getActivityList(str, this.o);
            ga.j jVar = new ga.j();
            jVar.o = this.o;
            jVar.f57290b = 0;
            boolean zIsEmpty = activityList.isEmpty();
            if (zIsEmpty) {
                jVar.f57322x = ga.a.N0(new ComponentName(str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)).setPackage(str);
                jVar.A |= 2;
                launcherActivityInfo = null;
            } else {
                launcherActivityInfo = activityList.get(0);
                jVar.f57322x = ga.a.N0(launcherActivityInfo.getComponentName());
            }
            ((t1) t1.f80131h.h(context)).f80135d.s(jVar, new aa.r(launcherActivityInfo, 1), zIsEmpty, false);
            return Pair.create(jVar, null);
        }
        if (i5 != 4) {
            if (i5 != 6) {
                return null;
            }
            ShortcutInfo shortcutInfo = this.f54519s;
            ga.j jVar2 = new ga.j(context, shortcutInfo);
            t1.c(context).f80135d.n(jVar2, shortcutInfo);
            return Pair.create(jVar2, shortcutInfo);
        }
        AppWidgetProviderInfo appWidgetProviderInfo = this.f54520t;
        LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfoE = LauncherAppWidgetProviderInfo.e(context, appWidgetProviderInfo);
        ga.g gVar = new ga.g(((AppWidgetProviderInfo) launcherAppWidgetProviderInfoE).provider, intent.getIntExtra("appWidgetId", 0));
        o9.z0 z0Var = (o9.z0) o9.z0.f80267w.h(context);
        float f11 = launcherAppWidgetProviderInfoE.f21315c;
        n30.b bVar = n30.b.f77778b;
        gVar.f57297i = fg.a.l(f11);
        gVar.f57298j = fg.a.l(launcherAppWidgetProviderInfoE.f21316d);
        gVar.f57295g = fg.a.l(Math.min(launcherAppWidgetProviderInfoE.f21313a, z0Var.f80269b));
        gVar.f57296h = fg.a.l(Math.min(launcherAppWidgetProviderInfoE.f21314b, z0Var.f80268a));
        gVar.o = this.o;
        return Pair.create(gVar, appWidgetProviderInfo);
    }

    public w(ShortcutInfo shortcutInfo) {
        this.f57290b = 6;
        this.f54518r = ShortcutKey.e(shortcutInfo);
        this.o = shortcutInfo.getUserHandle();
        this.f54519s = shortcutInfo;
    }

    public w(int i5, AppWidgetProviderInfo appWidgetProviderInfo) {
        this.f57290b = 4;
        this.f54518r = new Intent().setComponent(appWidgetProviderInfo.provider).putExtra("appWidgetId", i5);
        this.o = appWidgetProviderInfo.getProfile();
        this.f54520t = appWidgetProviderInfo;
    }
}
