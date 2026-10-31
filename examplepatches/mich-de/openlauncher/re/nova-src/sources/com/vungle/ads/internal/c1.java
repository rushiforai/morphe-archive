package com.vungle.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c1 {

    /* renamed from: a, reason: collision with root package name */
    public final Map f46753a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f46754b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f46755c;

    /* renamed from: d, reason: collision with root package name */
    public final ViewTreeObserver.OnPreDrawListener f46756d;

    /* renamed from: e, reason: collision with root package name */
    public WeakReference f46757e;

    /* renamed from: f, reason: collision with root package name */
    public final b1 f46758f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f46759g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f46760h;

    public c1(Context context, WeakHashMap trackedViews, Handler visibilityHandler) {
        Intrinsics.g(context, "context");
        Intrinsics.g(trackedViews, "trackedViews");
        Intrinsics.g(visibilityHandler, "visibilityHandler");
        this.f46753a = trackedViews;
        this.f46754b = visibilityHandler;
        this.f46755c = new Rect();
        this.f46758f = new b1(this);
        this.f46756d = new c40.d(this, 0);
        this.f46757e = new WeakReference(null);
        this.f46760h = a(context, (View) null);
    }

    public static final boolean a(c1 c1Var, View view, int i5) {
        c1Var.getClass();
        if (view != null && view.getVisibility() == 0 && view.getParent() != null) {
            ViewParent parent = view.getParent();
            while (parent instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) parent;
                if (viewGroup.getVisibility() != 0) {
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.c("ImpressionTracker", "Parent visibility is not visible: " + parent);
                    return false;
                }
                parent = viewGroup.getParent();
            }
            if (view.getGlobalVisibleRect(c1Var.f46755c)) {
                long jHeight = c1Var.f46755c.height() * c1Var.f46755c.width();
                long height = view.getHeight() * view.getWidth();
                if (height > 0 && 100 * jHeight >= i5 * height) {
                    return true;
                }
            }
        }
        return false;
    }

    public static final void d(c1 c1Var) {
        if (c1Var.f46759g) {
            return;
        }
        c1Var.f46759g = true;
        c1Var.f46754b.postDelayed(c1Var.f46758f, 100L);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public c1(Context context) {
        this(context, new WeakHashMap(10), new Handler(Looper.getMainLooper()));
        Intrinsics.g(context, "context");
    }

    public final boolean a(Context context, View view) {
        Window window;
        View decorView;
        ViewTreeObserver viewTreeObserver = (ViewTreeObserver) this.f46757e.get();
        if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
            return true;
        }
        View viewFindViewById = null;
        if ((context instanceof Activity) && (window = ((Activity) context).getWindow()) != null && (decorView = window.getDecorView()) != null) {
            viewFindViewById = decorView.findViewById(16908290);
        }
        if (viewFindViewById == null && view != null) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            if (!view.isAttachedToWindow()) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.c("c1", "Trying to call View#rootView() on an unattached View.");
            }
            View rootView = view.getRootView();
            if (rootView != null) {
                viewFindViewById = rootView.findViewById(16908290);
            }
            if (viewFindViewById == null) {
                viewFindViewById = rootView;
            }
        }
        if (viewFindViewById == null) {
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("c1", "Unable to set ViewTreeObserver due to no available root view.");
            return false;
        }
        ViewTreeObserver viewTreeObserver2 = viewFindViewById.getViewTreeObserver();
        if (!viewTreeObserver2.isAlive()) {
            boolean z13 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("c1", "The root view tree observer was not alive");
            return false;
        }
        this.f46757e = new WeakReference(viewTreeObserver2);
        viewTreeObserver2.addOnPreDrawListener(this.f46756d);
        return true;
    }

    public final void a(View view, z0 z0Var) {
        Intrinsics.g(view, "view");
        this.f46760h = a(view.getContext(), view);
        a1 a1Var = (a1) this.f46753a.get(view);
        if (a1Var == null) {
            a1Var = new a1();
            this.f46753a.put(view, a1Var);
            if (!this.f46759g) {
                this.f46759g = true;
                this.f46754b.postDelayed(this.f46758f, 100L);
            }
        }
        a1Var.c();
        a1Var.a(z0Var);
    }

    public final void a(View view) {
        Intrinsics.g(view, "view");
        this.f46753a.remove(view);
    }

    public final void a() {
        this.f46753a.clear();
        this.f46754b.removeMessages(0);
        this.f46759g = false;
        ViewTreeObserver viewTreeObserver = (ViewTreeObserver) this.f46757e.get();
        if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
            viewTreeObserver.removeOnPreDrawListener(this.f46756d);
        }
        this.f46757e.clear();
    }

    public static final boolean a(c1 this$0) {
        Intrinsics.g(this$0, "this$0");
        if (!this$0.f46759g) {
            this$0.f46759g = true;
            this$0.f46754b.postDelayed(this$0.f46758f, 100L);
        }
        return true;
    }
}
