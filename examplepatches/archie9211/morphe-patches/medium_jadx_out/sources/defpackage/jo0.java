package defpackage;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.animation.TimeInterpolator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.LinearInterpolator;
import com.google.android.material.behavior.SwipeDismissBehavior;
import com.google.android.material.snackbar.SnackbarContentLayout;
import com.medium.reader.R;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jo0 {
    public final int a;
    public final int b;
    public final int c;
    public final TimeInterpolator d;
    public final TimeInterpolator e;
    public final TimeInterpolator f;
    public final ViewGroup g;
    public final Context h;
    public final io0 i;
    public final SnackbarContentLayout j;
    public int k;
    public final eo0 l;
    public int m;
    public int n;
    public int o;
    public int p;
    public int q;
    public boolean r;
    public final AccessibilityManager s;
    public final go0 t = new go0(this);
    public static final u94 u = yw.b;
    public static final LinearInterpolator v = yw.a;
    public static final u94 w = yw.d;
    public static final int[] y = {R.attr.snackbarStyle};
    public static final String z = jo0.class.getSimpleName();
    public static final Handler x = new Handler(Looper.getMainLooper(), new do0());

    public jo0(Context context, ViewGroup viewGroup, View view, SnackbarContentLayout snackbarContentLayout) {
        int i = 0;
        this.l = new eo0(this, i);
        if (view == null) {
            ay0.e("Transient bottom bar must have non-null content");
            throw null;
        }
        if (snackbarContentLayout == null) {
            ay0.e("Transient bottom bar must have non-null callback");
            throw null;
        }
        this.g = viewGroup;
        this.j = snackbarContentLayout;
        this.h = context;
        kng.j(context, kng.u, "Theme.AppCompat");
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(y);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, -1);
        typedArrayObtainStyledAttributes.recycle();
        io0 io0Var = (io0) layoutInflaterFrom.inflate(resourceId != -1 ? R.layout.mtrl_layout_snackbar : R.layout.design_layout_snackbar, viewGroup, false);
        this.i = io0Var;
        io0Var.setBaseTransientBottomBar(this);
        if (view instanceof SnackbarContentLayout) {
            SnackbarContentLayout snackbarContentLayout2 = (SnackbarContentLayout) view;
            float actionTextColorAlpha = io0Var.getActionTextColorAlpha();
            if (actionTextColorAlpha != 1.0f) {
                snackbarContentLayout2.b.setTextColor(hlg.G(actionTextColorAlpha, hlg.C(snackbarContentLayout2, R.attr.colorSurface), snackbarContentLayout2.b.getCurrentTextColor()));
            }
            snackbarContentLayout2.setMaxInlineActionWidth(io0Var.getMaxInlineActionWidth());
        }
        io0Var.addView(view);
        io0Var.setAccessibilityLiveRegion(1);
        io0Var.setImportantForAccessibility(1);
        io0Var.setFitsSystemWindows(true);
        zg7 zg7Var = new zg7(14, this);
        WeakHashMap weakHashMap = ute.a;
        mte.c(io0Var, zg7Var);
        ute.o(io0Var, new fo0(i, this));
        this.s = (AccessibilityManager) context.getSystemService("accessibility");
        this.c = sgg.W(context, R.attr.motionDurationLong2, 250);
        this.a = sgg.W(context, R.attr.motionDurationLong2, 150);
        this.b = sgg.W(context, R.attr.motionDurationMedium1, 75);
        this.d = hk7.F(context, v);
        this.f = hk7.F(context, w);
        this.e = hk7.F(context, u);
    }

    public final void a(int i) {
        o2b o2bVarK = o2b.k();
        go0 go0Var = this.t;
        synchronized (o2bVarK.b) {
            try {
                if (o2bVarK.x(go0Var)) {
                    o2bVarK.f((zhc) o2bVarK.d, i);
                } else {
                    zhc zhcVar = (zhc) o2bVarK.e;
                    if (zhcVar != null && zhcVar.a.get() == go0Var) {
                        o2bVarK.f((zhc) o2bVarK.e, i);
                    }
                }
            } finally {
            }
        }
    }

    public final void b() {
        WindowInsets rootWindowInsets;
        if (Build.VERSION.SDK_INT < 29 || (rootWindowInsets = this.i.getRootWindowInsets()) == null) {
            return;
        }
        this.p = rootWindowInsets.getMandatorySystemGestureInsets().bottom;
        f();
    }

    public final void c() {
        o2b o2bVarK = o2b.k();
        go0 go0Var = this.t;
        synchronized (o2bVarK.b) {
            try {
                if (o2bVarK.x(go0Var)) {
                    o2bVarK.d = null;
                    if (((zhc) o2bVarK.e) != null) {
                        o2bVarK.J();
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        ViewParent parent = this.i.getParent();
        if (parent instanceof ViewGroup) {
            ((ViewGroup) parent).removeView(this.i);
        }
    }

    public final void d() {
        o2b o2bVarK = o2b.k();
        go0 go0Var = this.t;
        synchronized (o2bVarK.b) {
            try {
                if (o2bVarK.x(go0Var)) {
                    o2bVarK.I((zhc) o2bVarK.d);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void e() {
        List<AccessibilityServiceInfo> enabledAccessibilityServiceList;
        boolean z2 = true;
        AccessibilityManager accessibilityManager = this.s;
        if (accessibilityManager != null && ((enabledAccessibilityServiceList = accessibilityManager.getEnabledAccessibilityServiceList(1)) == null || !enabledAccessibilityServiceList.isEmpty())) {
            z2 = false;
        }
        io0 io0Var = this.i;
        if (z2) {
            io0Var.post(new eo0(this, 2));
            return;
        }
        if (io0Var.getParent() != null) {
            io0Var.setVisibility(0);
        }
        d();
    }

    public final void f() {
        io0 io0Var = this.i;
        ViewGroup.LayoutParams layoutParams = io0Var.getLayoutParams();
        boolean z2 = layoutParams instanceof ViewGroup.MarginLayoutParams;
        String str = z;
        if (!z2) {
            Log.w(str, "Unable to update margins because layout params are not MarginLayoutParams");
            return;
        }
        if (io0Var.j == null) {
            Log.w(str, "Unable to update margins because original view margins are not set");
            return;
        }
        if (io0Var.getParent() == null) {
            return;
        }
        int i = this.m;
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        Rect rect = io0Var.j;
        int i2 = rect.bottom + i;
        int i3 = rect.left + this.n;
        int i4 = rect.right + this.o;
        int i5 = rect.top;
        boolean z3 = (marginLayoutParams.bottomMargin == i2 && marginLayoutParams.leftMargin == i3 && marginLayoutParams.rightMargin == i4 && marginLayoutParams.topMargin == i5) ? false : true;
        if (z3) {
            marginLayoutParams.bottomMargin = i2;
            marginLayoutParams.leftMargin = i3;
            marginLayoutParams.rightMargin = i4;
            marginLayoutParams.topMargin = i5;
            io0Var.requestLayout();
        }
        if ((z3 || this.q != this.p) && Build.VERSION.SDK_INT >= 29 && this.p > 0) {
            ViewGroup.LayoutParams layoutParams2 = io0Var.getLayoutParams();
            if ((layoutParams2 instanceof ga2) && (((ga2) layoutParams2).a instanceof SwipeDismissBehavior)) {
                eo0 eo0Var = this.l;
                io0Var.removeCallbacks(eo0Var);
                io0Var.post(eo0Var);
            }
        }
    }
}
