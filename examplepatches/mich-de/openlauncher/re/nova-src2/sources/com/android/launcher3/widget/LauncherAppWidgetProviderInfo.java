package com.android.launcher3.widget;

import aa.c;
import aa.j;
import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.UserHandle;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import bh.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fz.d0;
import o9.g3;
import o9.t1;
import o9.z0;

/* loaded from: classes.dex */
public class LauncherAppWidgetProviderInfo extends AppWidgetProviderInfo implements j {

    /* renamed from: a, reason: collision with root package name */
    public int f21313a;

    /* renamed from: b, reason: collision with root package name */
    public int f21314b;

    /* renamed from: c, reason: collision with root package name */
    public int f21315c;

    /* renamed from: d, reason: collision with root package name */
    public int f21316d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f21317e;

    public static LauncherAppWidgetProviderInfo e(Context context, AppWidgetProviderInfo appWidgetProviderInfo) {
        LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo;
        if (appWidgetProviderInfo instanceof LauncherAppWidgetProviderInfo) {
            launcherAppWidgetProviderInfo = (LauncherAppWidgetProviderInfo) appWidgetProviderInfo;
        } else {
            Parcel parcelObtain = Parcel.obtain();
            appWidgetProviderInfo.writeToParcel(parcelObtain, 0);
            parcelObtain.setDataPosition(0);
            launcherAppWidgetProviderInfo = new LauncherAppWidgetProviderInfo(parcelObtain);
            parcelObtain.recycle();
        }
        launcherAppWidgetProviderInfo.l(context, t1.a(context));
        return launcherAppWidgetProviderInfo;
    }

    @Override // aa.j
    public final Drawable b(d0 d0Var) throws PackageManager.NameNotFoundException {
        String packageName = ((AppWidgetProviderInfo) this).provider.getPackageName();
        int i5 = ((AppWidgetProviderInfo) this).icon;
        d0Var.getClass();
        try {
            Resources resourcesForApplication = d0Var.f557c.getResourcesForApplication(packageName);
            if (resourcesForApplication != null && i5 != 0) {
                try {
                    return resourcesForApplication.getDrawableForDensity(i5, d0Var.f560f);
                } catch (Resources.NotFoundException unused) {
                }
            }
            int i11 = d0Var.f560f;
            boolean z11 = c.f541k;
            return Resources.getSystem().getDrawableForDensity(17301651, i11);
        } catch (PackageManager.NameNotFoundException unused2) {
            int i12 = d0Var.f560f;
            boolean z12 = c.f541k;
            return Resources.getSystem().getDrawableForDensity(17301651, i12);
        }
    }

    @Override // aa.j
    public final ComponentName d() {
        return ((AppWidgetProviderInfo) this).provider;
    }

    @Override // aa.j
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public String a(PackageManager packageManager) {
        return super.loadLabel(packageManager).replaceAll("\\s*\\d\\s*[x×*]\\s*\\d\\s*", b.f42142b);
    }

    @Override // aa.j
    public final UserHandle getUser() {
        return getProfile();
    }

    public final int i() {
        if (this.f21315c == Integer.MAX_VALUE && this.f21316d == Integer.MAX_VALUE) {
            return 2;
        }
        if (g3.f79850e) {
            return ((AppWidgetProviderInfo) this).widgetFeatures;
        }
        return 0;
    }

    public void l(Context context, z0 z0Var) {
        int i5 = z0Var.f80269b;
        int i11 = z0Var.f80268a;
        float fM = g.M(context, 80);
        Rect defaultPaddingForWidget = AppWidgetHostView.getDefaultPaddingForWidget(context, ((AppWidgetProviderInfo) this).provider, null);
        int iMax = Math.max(1, (int) Math.ceil(((((AppWidgetProviderInfo) this).minWidth + defaultPaddingForWidget.left) + defaultPaddingForWidget.right) / fM));
        int iMax2 = Math.max(1, (int) Math.ceil(((((AppWidgetProviderInfo) this).minHeight + defaultPaddingForWidget.top) + defaultPaddingForWidget.bottom) / fM));
        int iMax3 = Math.max(1, (int) Math.ceil(((((AppWidgetProviderInfo) this).minResizeWidth + defaultPaddingForWidget.left) + defaultPaddingForWidget.right) / fM));
        int iMax4 = Math.max(1, (int) Math.ceil(((((AppWidgetProviderInfo) this).minResizeHeight + defaultPaddingForWidget.top) + defaultPaddingForWidget.bottom) / fM));
        if (g3.f79853h) {
            int iMax5 = Math.max(i5, iMax3);
            int iMax6 = Math.max(i11, iMax4);
            if (((AppWidgetProviderInfo) this).targetCellWidth >= iMax3 && ((AppWidgetProviderInfo) this).targetCellWidth <= iMax5 && ((AppWidgetProviderInfo) this).targetCellHeight >= iMax4 && ((AppWidgetProviderInfo) this).targetCellHeight <= iMax6) {
                iMax = ((AppWidgetProviderInfo) this).targetCellWidth;
                iMax2 = ((AppWidgetProviderInfo) this).targetCellHeight;
            }
        }
        this.f21315c = Math.min(iMax, iMax3);
        this.f21316d = Math.min(iMax2, iMax4);
        if (iMax3 > z0Var.f80269b || iMax4 > z0Var.f80268a) {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getRealMetrics(displayMetrics);
            boolean z11 = !m() && ((AppWidgetProviderInfo) this).minWidth <= displayMetrics.widthPixels && ((AppWidgetProviderInfo) this).minHeight <= displayMetrics.heightPixels;
            boolean z12 = ("com.android.calendar".equals(((AppWidgetProviderInfo) this).provider.getPackageName()) || "com.samsung.android.app.notes".equals(((AppWidgetProviderInfo) this).provider.getPackageName()) || "com.samsung.android.calendar".equals(((AppWidgetProviderInfo) this).provider.getPackageName())) && "samsung".equalsIgnoreCase(Build.BRAND);
            if (z11 || z12) {
                iMax3 = Math.min(iMax3, z0Var.f80269b);
                iMax4 = Math.min(iMax4, z0Var.f80268a);
            }
        }
        this.f21317e = Math.min(iMax, iMax3) <= z0Var.f80269b && Math.min(iMax2, iMax4) <= z0Var.f80268a;
        this.f21313a = Math.min(iMax, z0Var.f80269b);
        this.f21314b = Math.min(iMax2, z0Var.f80268a);
    }

    public final boolean m() {
        return ((AppWidgetProviderInfo) this).provider.getClassName().startsWith("#custom-widget-");
    }

    public Drawable p(Context context, int i5) {
        return loadPreviewImage(context, i5);
    }
}
