package com.android.launcher3.widget;

import ab.m;
import ab.w;
import android.appwidget.AppWidgetProviderInfo;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.launcher3.util.PendingRequestArgs;
import com.teslacoilsw.launcher.NovaLauncher;
import ga.e;
import ga.g;
import mc0.d;
import o9.n1;

/* loaded from: classes2.dex */
public class WidgetAddFlowHandler implements Parcelable {
    public static final Parcelable.Creator<WidgetAddFlowHandler> CREATOR = new w(0);

    /* renamed from: a, reason: collision with root package name */
    public final AppWidgetProviderInfo f21318a;

    public WidgetAddFlowHandler(AppWidgetProviderInfo appWidgetProviderInfo) {
        this.f21318a = appWidgetProviderInfo;
        NovaLauncher novaLauncher = NovaLauncher.f45649u1;
        if (novaLauncher != null) {
            d.f76206a.b("WidgetAddFlowHandler " + novaLauncher.O.f21000i0, new Object[0]);
        }
    }

    public final LauncherAppWidgetProviderInfo a(n1 n1Var) {
        return LauncherAppWidgetProviderInfo.e(n1Var, this.f21318a);
    }

    public boolean b() {
        int i5 = Build.VERSION.SDK_INT;
        AppWidgetProviderInfo appWidgetProviderInfo = this.f21318a;
        int i11 = i5 >= 28 ? appWidgetProviderInfo.widgetFeatures : 0;
        return (appWidgetProviderInfo.configure == null || ((i11 & 4) != 0 && (i11 & 1) != 0)) ? false : true;
    }

    public final void d(n1 n1Var, int i5, e eVar, int i11) {
        d.f76206a.b("WidgetAddFlowHandler.startBindFlow " + n1Var.O.f21000i0, new Object[0]);
        n1Var.f80010k0 = PendingRequestArgs.p0(i5, this, eVar);
        n1Var.S.getClass();
        m.e(n1Var, i5, this.f21318a, i11);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean e(n1 n1Var, int i5, e eVar, int i11) {
        d.f76206a.b("WidgetAddFlowHandler.startConfigActivity2 " + n1Var.O.f21000i0, new Object[0]);
        if (!b()) {
            return false;
        }
        n1Var.f80010k0 = PendingRequestArgs.p0(i5, this, eVar);
        n1Var.S.f(n1Var, i5, i11);
        return true;
    }

    public final boolean f(n1 n1Var, g gVar) {
        return e(n1Var, gVar.f57310r, gVar, 13);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        this.f21318a.writeToParcel(parcel, i5);
    }

    public WidgetAddFlowHandler(Parcel parcel) {
        this.f21318a = (AppWidgetProviderInfo) AppWidgetProviderInfo.CREATOR.createFromParcel(parcel);
        NovaLauncher novaLauncher = NovaLauncher.f45649u1;
        if (novaLauncher != null) {
            d.f76206a.b("WidgetAddFlowHandler(parcel) " + novaLauncher.O.f21000i0, new Object[0]);
        }
    }
}
