package com.android.launcher3.model;

import aa.d0;
import android.appwidget.AppWidgetProviderInfo;
import android.content.pm.PackageManager;
import com.android.launcher3.util.ComponentKey;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import ja.f;
import o9.g3;
import o9.z0;
import x9.x;

/* loaded from: classes.dex */
public class WidgetItem extends ComponentKey {

    /* renamed from: d, reason: collision with root package name */
    public final LauncherAppWidgetProviderInfo f21171d;

    /* renamed from: e, reason: collision with root package name */
    public final f f21172e;

    /* renamed from: f, reason: collision with root package name */
    public final String f21173f;

    /* renamed from: g, reason: collision with root package name */
    public final int f21174g;

    /* renamed from: h, reason: collision with root package name */
    public final int f21175h;

    public WidgetItem(LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo, z0 z0Var, d0 d0Var) {
        super(((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).provider, launcherAppWidgetProviderInfo.getProfile());
        this.f21173f = d0Var.v(launcherAppWidgetProviderInfo);
        this.f21171d = launcherAppWidgetProviderInfo;
        this.f21172e = null;
        this.f21174g = Math.min(launcherAppWidgetProviderInfo.f21313a, z0Var.f80269b);
        this.f21175h = Math.min(launcherAppWidgetProviderInfo.f21314b, z0Var.f80268a);
    }

    public WidgetItem(f fVar, d0 d0Var, PackageManager packageManager) throws Throwable {
        String strW;
        super(fVar.f69290a, fVar.f69291b);
        if (!(fVar instanceof x)) {
            strW = d0Var.v(fVar);
        } else {
            strW = g3.w(fVar.a(packageManager));
        }
        this.f21173f = strW;
        this.f21171d = null;
        this.f21172e = fVar;
        this.f21175h = 1;
        this.f21174g = 1;
    }
}
