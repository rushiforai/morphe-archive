package ga;

import ab.o;
import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Intent;
import android.os.Build;
import android.os.Process;
import android.util.SparseIntArray;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import kotlin.UInt;
import o9.g3;
import o9.n1;
import p6.p0;

/* loaded from: classes2.dex */
public final class g extends e {
    public int A;

    /* renamed from: r, reason: collision with root package name */
    public int f57310r;

    /* renamed from: s, reason: collision with root package name */
    public ComponentName f57311s;

    /* renamed from: t, reason: collision with root package name */
    public int f57312t;

    /* renamed from: u, reason: collision with root package name */
    public int f57313u;

    /* renamed from: v, reason: collision with root package name */
    public Intent f57314v;

    /* renamed from: w, reason: collision with root package name */
    public int f57315w;

    /* renamed from: x, reason: collision with root package name */
    public h f57316x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f57317y;

    /* renamed from: z, reason: collision with root package name */
    public int f57318z;

    public g(ComponentName componentName, int i5) {
        this.f57313u = -1;
        this.f57318z = -1;
        this.A = 0;
        this.f57310r = i5;
        this.f57311s = componentName;
        if (r0()) {
            this.f57290b = 5;
        } else {
            this.f57290b = 4;
        }
        n30.b bVar = n30.b.f77778b;
        this.f57295g = bVar;
        this.f57296h = bVar;
        this.o = Process.myUserHandle();
        this.f57312t = 0;
    }

    @Override // ga.e
    public final void C(ya.b bVar) {
        super.C(bVar);
        Integer numValueOf = Integer.valueOf(this.f57310r);
        ContentValues contentValues = bVar.f97103a;
        contentValues.put("appWidgetId", numValueOf);
        contentValues.put("appWidgetProvider", this.f57311s.flattenToString());
        contentValues.put("restored", Integer.valueOf(this.f57312t));
        contentValues.put("options", Integer.valueOf(this.f57315w));
        bVar.c(this.f57314v);
        contentValues.put("appWidgetSource", Integer.valueOf(this.f57318z));
        bVar.h(Integer.valueOf(this.A), "customIconSource");
    }

    public final boolean C0() {
        int i5 = this.f57312t;
        return (i5 & 1) == 0 || (i5 & 16) == 16;
    }

    public final void K0(n1 n1Var, AppWidgetHostView appWidgetHostView) {
        int i5;
        if (x7.f.I(this.f57303q.f68417a, 1) || p0.k(this.f57311s)) {
            if (appWidgetHostView instanceof o) {
                ((o) appWidgetHostView).C(0, 0, 0, 0);
            } else {
                appWidgetHostView.setPadding(0, 0, 0, 0);
            }
        }
        if (Build.VERSION.SDK_INT >= 31 && (i5 = this.A) != 0) {
            tz.o oVar = tz.o.f90164b;
            UInt.Companion companion = UInt.f71696b;
            appWidgetHostView.setColorResources((SparseIntArray) ul.b.g0(x7.f.z(i5), n1Var).f80413c);
        }
        if (this.f57317y) {
            return;
        }
        gb.a.f(appWidgetHostView, n1Var, this.f57295g, this.f57296h);
        this.f57317y = true;
    }

    @Override // ga.e
    public final String b() {
        return super.b() + " providerName=" + this.f57311s + " appWidgetId=" + this.f57310r;
    }

    public final boolean f0() {
        return (this.f57315w & 1) != 0;
    }

    @Override // ga.e
    public final ComponentName i() {
        return this.f57311s;
    }

    public final boolean p0(int i5) {
        return (this.f57312t & i5) == i5;
    }

    public final boolean r0() {
        return this.f57310r <= -100;
    }

    public g(int i5, ComponentName componentName, LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo, AppWidgetHostView appWidgetHostView) {
        this(componentName, i5);
        if (((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).configure != null) {
            int i11 = launcherAppWidgetProviderInfo.i() & 1;
        }
        boolean z11 = g3.f79853h;
        if (z11 && ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).configure != null && (launcherAppWidgetProviderInfo.i() & 1) != 0) {
            int i12 = launcherAppWidgetProviderInfo.i() & 4;
        }
        if (z11) {
            int unused = ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).previewLayout;
        }
        if (((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).minResizeWidth <= 0) {
            int i13 = ((AppWidgetProviderInfo) launcherAppWidgetProviderInfo).minResizeHeight;
        }
        if (appWidgetHostView instanceof o) {
            ((o) appWidgetHostView).getClipToOutline();
        }
    }

    public g() {
        this.f57310r = -1;
        this.f57313u = -1;
        this.f57318z = -1;
        this.A = 0;
        this.f57290b = 4;
    }
}
