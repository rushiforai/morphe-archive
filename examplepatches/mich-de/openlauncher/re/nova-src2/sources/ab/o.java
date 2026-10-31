package ab;

import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.Advanceable;
import android.widget.GridView;
import android.widget.RemoteViews;
import com.android.launcher3.dragndrop.DragLayer;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.android.launcher3.widget.LocalColorExtractor;
import com.android.launcher3.widget.custom.CustomAppWidgetProviderInfo;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.y2;
import java.util.ArrayList;
import kl.q0;
import o9.g3;
import o9.n1;
import ya.k0;
import ya.l0;

/* loaded from: classes2.dex */
public class o extends b implements za.i, View.OnLongClickListener {
    public static final SparseBooleanArray C = new SparseBooleanArray();
    public final Rect A;
    public boolean B;
    public final Rect n;
    public final o9.a0 o;

    /* renamed from: p, reason: collision with root package name */
    public final NovaLauncher f739p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f740q;

    /* renamed from: r, reason: collision with root package name */
    public final LocalColorExtractor f741r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f742s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f743t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f744u;

    /* renamed from: v, reason: collision with root package name */
    public n f745v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f746w;

    /* renamed from: x, reason: collision with root package name */
    public int f747x;

    /* renamed from: y, reason: collision with root package name */
    public int f748y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f749z;

    public o(Context context) {
        super(context);
        this.n = new Rect();
        this.f746w = false;
        this.f747x = 0;
        this.f748y = 0;
        this.f749z = false;
        this.A = new Rect();
        this.B = false;
        new ArrayList();
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) o9.k.Y(context);
        this.f739p = novaLauncher;
        o9.a0 a0Var = new o9.a0(this, this, rz.a.f86497a);
        this.o = a0Var;
        a0Var.f79752j = false;
        setAccessibilityDelegate(novaLauncher.f80004e0);
        setBackgroundResource(2131232453);
        if (g3.f79851f && l0.d(novaLauncher, 2130969385)) {
            setOnLightBackground(true);
        }
        this.f741r = LocalColorExtractor.a(getContext());
    }

    public static boolean w(ViewGroup viewGroup) {
        if (viewGroup instanceof AdapterView) {
            Adapter adapter = ((AdapterView) viewGroup).getAdapter();
            int numColumns = viewGroup instanceof GridView ? ((GridView) viewGroup).getNumColumns() : 0;
            if (numColumns == 0) {
                return true;
            }
            if (adapter != null && adapter.getCount() > numColumns) {
                return true;
            }
        } else {
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                View childAt = viewGroup.getChildAt(i5);
                if ((childAt instanceof ViewGroup) && w((ViewGroup) childAt)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void A() {
        ga.g gVar;
        if (isAttachedToWindow() && (gVar = (ga.g) getTag()) != null) {
            n1 n1Var = (n1) o9.k.Y(getContext());
            n1Var.T0(this, gVar, false);
            AppWidgetHostView appWidgetHostViewO0 = n1Var.O0(gVar);
            if (appWidgetHostViewO0 != null) {
                n1Var.O.d(appWidgetHostViewO0, gVar);
                n1Var.O.requestLayout();
            }
        }
    }

    public final void B() {
        if (this.f744u) {
            long jUptimeMillis = SystemClock.uptimeMillis();
            long jIndexOfKey = (C.indexOfKey(getAppWidgetId()) * 250) + (20000 - (jUptimeMillis % 20000)) + jUptimeMillis;
            Handler handler = getHandler();
            if (handler != null) {
                handler.postAtTime(this.f745v, jIndexOfKey);
            }
        }
    }

    public final void C(int i5, int i11, int i12, int i13) {
        super.setPadding(i5, i11, i12, i13);
    }

    @Override // za.i
    public final void a() {
        o9.a0 a0Var = this.o;
        if (a0Var.f79747e || a0Var.f79749g) {
            return;
        }
        a0Var.a();
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        try {
            super.addView(view, i5, layoutParams);
        } catch (SecurityException e3) {
            mc0.d.b(e3);
            post(new n(this, 0));
        }
    }

    @Override // android.view.View
    public final void cancelLongPress() {
        super.cancelLongPress();
        this.o.a();
    }

    @Override // android.appwidget.AppWidgetHostView, android.view.ViewGroup, android.view.View
    public void dispatchDraw(Canvas canvas) {
        try {
            super.dispatchDraw(canvas);
        } catch (RuntimeException unused) {
            post(new n(this, 0));
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        this.o.b(motionEvent);
        try {
            return super.dispatchTouchEvent(motionEvent);
        } catch (Exception e3) {
            mc0.d.f76206a.p(e3, "Handling widget dispatchTouchEvent Exception", new Object[0]);
            u();
            return true;
        }
    }

    @Override // android.appwidget.AppWidgetHostView
    public final AppWidgetProviderInfo getAppWidgetInfo() {
        AppWidgetProviderInfo appWidgetInfo = super.getAppWidgetInfo();
        if (appWidgetInfo == null || (appWidgetInfo instanceof LauncherAppWidgetProviderInfo)) {
            return appWidgetInfo;
        }
        throw new IllegalStateException("Launcher widget must have LauncherAppWidgetProviderInfo");
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f743t = true;
        v();
        this.f741r.getClass();
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.f740q) {
            n1 n1Var = (n1) o9.k.Y(getContext());
            if (n1Var.getResources().getConfiguration().orientation == n1Var.N.orientation) {
                this.f740q = false;
                A();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f743t = false;
        v();
        this.f741r.getClass();
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(getClass().getName());
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0070  */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        ComponentName componentName;
        if (motionEvent.getAction() == 0) {
            AppWidgetProviderInfo appWidgetInfo = getAppWidgetInfo();
            NovaLauncher novaLauncher = this.f739p;
            if (appWidgetInfo != null && (componentName = appWidgetInfo.provider) != null) {
                novaLauncher.f45663n1 = componentName.getPackageName();
            }
            DragLayer dragLayer = novaLauncher.P;
            if (this.f742s) {
                dragLayer.requestDisallowInterceptTouchEvent(true);
            }
            dragLayer.f98444k = this;
        } else {
            int action = motionEvent.getAction();
            String packageName = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (action != 1) {
                if (getAppWidgetInfo() != null && getAppWidgetInfo().provider != null) {
                    packageName = getAppWidgetInfo().provider.getPackageName();
                }
                if ("name.pilgr.appdialer.pro".equals(packageName)) {
                    Context context = getContext();
                    q0 q0Var = n1.C0;
                    for (k0 k0Var : ((NovaLauncher) o9.k.Y(context)).P.f98442i) {
                        k0Var.H();
                    }
                }
            } else if (!"name.pilgr.appdialer".equals((getAppWidgetInfo() == null || getAppWidgetInfo().provider == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : getAppWidgetInfo().provider.getPackageName())) {
            }
        }
        o9.a0 a0Var = this.o;
        return a0Var.f79747e || a0Var.f79749g;
    }

    @Override // ab.b, android.appwidget.AppWidgetHostView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        this.f742s = w(this);
        if (this.f746w || !(getTag() instanceof ga.g)) {
            return;
        }
        ga.g gVar = (ga.g) getTag();
        this.n.set(i5, i11, i12, i13);
        int i14 = gVar.f57292d;
        this.f741r.getClass();
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        if (this.f742s) {
            this.f739p.P.requestDisallowInterceptTouchEvent(false);
        }
        view.performLongClick();
        return true;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (!this.f746w || this.f747x <= 0 || this.f748y <= 0 || getChildCount() != 1) {
            return;
        }
        measureChild(getChildAt(0), View.MeasureSpec.getSize(this.f747x), View.MeasureSpec.getSize(this.f748y));
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        this.o.b(motionEvent);
        return true;
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        z();
    }

    @Override // ab.q
    public final boolean q() {
        if (getTag() instanceof ga.e) {
            ga.e eVar = (ga.e) getTag();
            n30.b bVar = eVar.f57295g;
            n30.b bVar2 = n30.b.f77779c;
            if (bVar == bVar2 && eVar.f57296h == bVar2) {
                return true;
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        super.requestDisallowInterceptTouchEvent(z11);
        cancelLongPress();
    }

    @Override // android.appwidget.AppWidgetHostView
    public final void setAppWidget(int i5, AppWidgetProviderInfo appWidgetProviderInfo) {
        this.f749z = true;
        super.setAppWidget(i5, appWidgetProviderInfo);
        this.f749z = false;
        if (appWidgetProviderInfo instanceof CustomAppWidgetProviderInfo) {
            this.f683l = 0.0f;
            getContext().getApplicationContext().getPackageManager();
            setContentDescription(g3.w(((AppWidgetProviderInfo) ((CustomAppWidgetProviderInfo) appWidgetProviderInfo)).label));
        }
    }

    @Override // android.appwidget.AppWidgetHostView
    public final void setColorResources(SparseIntArray sparseIntArray) {
        if (sparseIntArray == null) {
            resetColorResources();
        } else {
            super.setColorResources(sparseIntArray);
        }
    }

    @Override // android.view.View
    public final void setPadding(int i5, int i11, int i12, int i13) {
        if (!this.f749z || this.B) {
            return;
        }
        this.A.set(i5, i11, i12, i13);
        super.setPadding(i5, i11, i12, i13);
        this.B = true;
    }

    @Override // android.appwidget.AppWidgetHostView
    public void updateAppWidget(RemoteViews remoteViews) {
        if (SystemClock.uptimeMillis() < 0) {
            return;
        }
        if (remoteViews == null || remoteViews.getLayoutId() == 0) {
            super.updateAppWidget(remoteViews);
        } else {
            try {
                super.updateAppWidget(remoteViews);
            } catch (Exception e3) {
                mc0.d.b(e3);
                u();
            }
        }
        v();
        n1 n1Var = (n1) o9.k.Y(getContext());
        this.f740q = !(n1Var.getResources().getConfiguration().orientation == n1Var.N.orientation);
    }

    @Override // android.appwidget.AppWidgetHostView
    public void updateAppWidgetSize(Bundle bundle, int i5, int i11, int i12, int i13) {
        if (bundle == null) {
            bundle = new Bundle();
        }
        float f11 = getResources().getDisplayMetrics().density;
        int paddingRight = (int) ((getPaddingRight() + getPaddingLeft()) / f11);
        int paddingBottom = (int) ((getPaddingBottom() + getPaddingTop()) / f11);
        int i14 = i5 - paddingRight;
        int i15 = i11 - paddingBottom;
        int i16 = i12 - paddingRight;
        int i17 = i13 - paddingBottom;
        int iIntValue = ((Integer) y2.f51877a.E1().l()).intValue();
        Bundle appWidgetOptions = AppWidgetManager.getInstance(getContext()).getAppWidgetOptions(getAppWidgetId());
        if (i14 == appWidgetOptions.getInt("appWidgetMinWidth") && i15 == appWidgetOptions.getInt("appWidgetMinHeight") && i16 == appWidgetOptions.getInt("appWidgetMaxWidth") && i17 == appWidgetOptions.getInt("appWidgetMaxHeight") && iIntValue == appWidgetOptions.getInt("com.teslacoilsw.launcher.appWidgetCornerRadius")) {
            return;
        }
        bundle.putInt("appWidgetMinWidth", i14);
        bundle.putInt("appWidgetMinHeight", i15);
        bundle.putInt("appWidgetMaxWidth", i16);
        bundle.putInt("appWidgetMaxHeight", i17);
        bundle.putInt("com.teslacoilsw.launcher.appWidgetCornerRadius", iIntValue);
        updateAppWidgetOptions(bundle);
    }

    public final void v() {
        boolean z11;
        Advanceable advanceableX = x();
        if (advanceableX != null) {
            advanceableX.fyiWillBeAdvancedByHostKThx();
            z11 = true;
        } else {
            z11 = false;
        }
        int appWidgetId = getAppWidgetId();
        SparseBooleanArray sparseBooleanArray = C;
        if (z11 != (sparseBooleanArray.indexOfKey(appWidgetId) >= 0)) {
            if (z11) {
                sparseBooleanArray.put(getAppWidgetId(), true);
            } else {
                sparseBooleanArray.delete(getAppWidgetId());
            }
            z();
        }
    }

    public final Advanceable x() {
        AppWidgetProviderInfo appWidgetInfo;
        int i5;
        try {
            appWidgetInfo = getAppWidgetInfo();
        } catch (IllegalStateException e3) {
            Boolean bool = NovaApplication.f45635g;
            fg.a.T(e3);
            appWidgetInfo = null;
        }
        if (appWidgetInfo == null || (i5 = appWidgetInfo.autoAdvanceViewId) == -1 || !this.f743t) {
            return null;
        }
        KeyEvent.Callback callbackFindViewById = findViewById(i5);
        if (callbackFindViewById instanceof Advanceable) {
            return (Advanceable) callbackFindViewById;
        }
        return null;
    }

    public final void y() {
        if (this.f746w) {
            this.f741r.getClass();
        }
    }

    public final void z() {
        Handler handler = getHandler();
        boolean z11 = getWindowVisibility() == 0 && handler != null && C.indexOfKey(getAppWidgetId()) >= 0;
        if (z11 != this.f744u) {
            this.f744u = z11;
            if (this.f745v == null) {
                this.f745v = new n(this, 1);
            }
            handler.removeCallbacks(this.f745v);
            B();
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View view) {
        try {
            super.addView(view);
        } catch (RuntimeException unused) {
            post(new n(this, 0));
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5) {
        try {
            super.addView(view, i5);
        } catch (RuntimeException unused) {
            post(new n(this, 0));
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, int i11) {
        try {
            super.addView(view, i5, i11);
        } catch (RuntimeException unused) {
            post(new n(this, 0));
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void addView(View view, ViewGroup.LayoutParams layoutParams) {
        try {
            super.addView(view, layoutParams);
        } catch (RuntimeException unused) {
            post(new n(this, 0));
        }
    }
}
