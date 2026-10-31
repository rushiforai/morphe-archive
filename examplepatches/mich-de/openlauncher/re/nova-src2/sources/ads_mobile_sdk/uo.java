package ads_mobile_sdk;

import a60.d;
import ab.e0;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowMetrics;
import b.ba;
import b.d0;
import b.l7;
import b.o2;
import java.lang.ref.WeakReference;
import java.util.Set;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;

/* loaded from: classes.dex */
public abstract class uo implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener, b.db, l7 {

    /* renamed from: p, reason: collision with root package name */
    public static final long f10413p;

    /* renamed from: a, reason: collision with root package name */
    public final Context f10414a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f10415b;

    /* renamed from: c, reason: collision with root package name */
    public final c3.b f10416c;

    /* renamed from: d, reason: collision with root package name */
    public final dj0 f10417d;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f10418f;

    /* renamed from: g, reason: collision with root package name */
    public final qw2 f10419g;

    /* renamed from: h, reason: collision with root package name */
    public final g0 f10420h;

    /* renamed from: i, reason: collision with root package name */
    public View f10421i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f10422j;

    /* renamed from: k, reason: collision with root package name */
    public WeakReference f10423k;

    /* renamed from: l, reason: collision with root package name */
    public int f10424l;

    /* renamed from: m, reason: collision with root package name */
    public long f10425m;
    public Boolean n;
    public qo o;

    static {
        Duration.Companion companion = Duration.f72038b;
        f10413p = DurationKt.g(200, DurationUnit.f72045d);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public uo(Context context, t70.j0 j0Var, ba baVar, dj0 dj0Var, o2 o2Var, jr0 jr0Var, qw2 requestType, g0 g0Var, z1 adConfiguration) {
        Intrinsics.g(context, "context");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        this.f10414a = context;
        this.f10415b = j0Var;
        this.f10416c = (c3.b) baVar;
        this.f10417d = dj0Var;
        this.f10418f = jr0Var;
        this.f10419g = requestType;
        this.f10420h = g0Var;
        this.f10422j = dj0Var.a(requestType, adConfiguration);
        this.f10423k = new WeakReference(null);
        this.f10424l = -1;
        Duration.f72038b.getClass();
        this.f10425m = 0L;
    }

    public final void a(Activity activity, int i5) {
        Window window;
        View viewPeekDecorView;
        View view = this.f10421i;
        if (view == null || (window = activity.getWindow()) == null || (viewPeekDecorView = window.peekDecorView()) == null || !Intrinsics.b(view.getRootView(), viewPeekDecorView.getRootView())) {
            return;
        }
        this.f10424l = i5;
    }

    public final void b(so3 so3Var) throws Throwable {
        Continuation continuation = null;
        m0.u(EmptyCoroutineContext.f71803a, new b00.e(this, so3Var, continuation, 15));
        so3 so3Var2 = so3.f9624c;
        t70.j0 j0Var = this.f10415b;
        if (so3Var == so3Var2) {
            m0.t(j0Var, null, null, new d(this, continuation, 16), 3);
        } else {
            m0.t(j0Var, null, null, new a60.a(this, continuation, 21), 3);
        }
    }

    public final void b$1() {
        ViewTreeObserver viewTreeObserver = (ViewTreeObserver) this.f10423k.get();
        if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
            try {
                viewTreeObserver.removeOnGlobalLayoutListener(this);
                viewTreeObserver.removeOnScrollChangedListener(this);
            } catch (IllegalStateException unused) {
            }
        }
        this.f10423k = new WeakReference(null);
        if (this.f10418f.H0()) {
            this.f10420h.a((l7) this);
        }
    }

    @Override // b.db
    public final Object d(long j11, SuspendLambda suspendLambda) throws Throwable {
        if (this.f10418f.H0()) {
            return Unit.f71706a;
        }
        b(so3.f9625d);
        return Unit.f71706a;
    }

    @Override // b.l7
    public final void onActivityCreated(Activity activity, Bundle bundle) throws Throwable {
        if (this.f10418f.H0()) {
            a(activity, 0);
            b(so3.f9625d);
        }
    }

    @Override // b.l7
    public final void onActivityDestroyed(Activity activity) throws Throwable {
        if (this.f10418f.H0()) {
            b(so3.f9625d);
        }
    }

    @Override // b.l7
    public final void onActivityPaused(Activity activity) throws Throwable {
        if (this.f10418f.H0()) {
            a(activity, 4);
            b(so3.f9625d);
        }
    }

    @Override // b.l7
    public final void onActivityResumed(Activity activity) throws Throwable {
        if (this.f10418f.H0()) {
            a(activity, 0);
            b(so3.f9625d);
        }
    }

    @Override // b.l7
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) throws Throwable {
        if (this.f10418f.H0()) {
            b(so3.f9625d);
        }
    }

    @Override // b.l7
    public final void onActivityStarted(Activity activity) throws Throwable {
        if (this.f10418f.H0()) {
            a(activity, 0);
            b(so3.f9625d);
        }
    }

    @Override // b.l7
    public final void onActivityStopped(Activity activity) throws Throwable {
        if (this.f10418f.H0()) {
            a(activity, 4);
            b(so3.f9625d);
        }
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() throws Throwable {
        b(so3.f9622a);
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public final void onScrollChanged() throws Throwable {
        b(so3.f9624c);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) throws Throwable {
        Intrinsics.g(view, "view");
        this.f10424l = -1;
        ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
        if (viewTreeObserver.isAlive()) {
            this.f10423k = new WeakReference(viewTreeObserver);
            try {
                viewTreeObserver.addOnGlobalLayoutListener(this);
                viewTreeObserver.addOnScrollChangedListener(this);
            } catch (IllegalStateException unused) {
            }
        }
        if (this.f10418f.H0()) {
            g0 g0Var = this.f10420h;
            g0Var.getClass();
            synchronized (g0Var) {
                g0Var.f3594i.add(new WeakReference(this));
            }
        }
        b(so3.f9623b);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) throws Throwable {
        Intrinsics.g(view, "view");
        this.f10424l = -1;
        b(so3.f9623b);
        b$1();
    }

    @Override // b.db
    public final Object b(long j11, SuspendLambda suspendLambda) throws Throwable {
        if (this.f10418f.H0()) {
            return Unit.f71706a;
        }
        b(so3.f9625d);
        return Unit.f71706a;
    }

    public final void a(View targetView) throws Throwable {
        Intrinsics.g(targetView, "targetView");
        targetView.addOnAttachStateChangeListener(this);
        WeakReference weakReference = new WeakReference(this);
        g0 g0Var = this.f10420h;
        qo qoVar = new qo(weakReference, g0Var);
        this.o = qoVar;
        Set setU = e0.U(qoVar);
        synchronized (g0Var) {
            g0Var.f3593h.addAll(setU);
        }
        if (targetView.isAttachedToWindow()) {
            ViewTreeObserver viewTreeObserver = targetView.getViewTreeObserver();
            if (viewTreeObserver.isAlive()) {
                this.f10423k = new WeakReference(viewTreeObserver);
                try {
                    viewTreeObserver.addOnGlobalLayoutListener(this);
                    viewTreeObserver.addOnScrollChangedListener(this);
                } catch (IllegalStateException unused) {
                }
            }
            if (this.f10418f.H0()) {
                g0 g0Var2 = this.f10420h;
                synchronized (g0Var2) {
                    g0Var2.f3594i.add(new WeakReference(this));
                }
                return;
            }
            return;
        }
        b(so3.f9623b);
    }

    /* JADX WARN: Type inference failed for: r0v18, types: [b.ba, c3.b] */
    public static final Object a(uo uoVar, so3 so3Var, SuspendLambda suspendLambda) {
        Context context;
        Context context2;
        Context context3;
        Context context4;
        Resources resources;
        jr0 jr0Var = uoVar.f10418f;
        dj0 dj0Var = uoVar.f10417d;
        Rect rect = new Rect();
        int[] iArr = new int[2];
        boolean z11 = true;
        try {
            View view = uoVar.f10421i;
            if (view != null) {
                view.getLocationOnScreen(iArr);
            }
            int i5 = iArr[0];
            rect.left = i5;
            rect.top = iArr[1];
            View view2 = uoVar.f10421i;
            if (view2 != null) {
                rect.right = i5 + view2.getWidth();
                rect.bottom = rect.top + view2.getHeight();
            }
        } catch (Exception e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Failed to get view location: " + e3.getMessage(), null);
        }
        Rect rect2 = new Rect();
        WindowManager windowManagerB = dj0Var.b(uoVar.f10414a);
        if (Build.VERSION.SDK_INT >= 30) {
            WindowMetrics currentWindowMetrics = windowManagerB.getCurrentWindowMetrics();
            Intrinsics.f(currentWindowMetrics, "getCurrentWindowMetrics(...)");
            rect2.right = currentWindowMetrics.getBounds().width();
            rect2.bottom = currentWindowMetrics.getBounds().height();
        } else {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            windowManagerB.getDefaultDisplay().getMetrics(displayMetrics);
            rect2.right = displayMetrics.widthPixels;
            rect2.bottom = displayMetrics.heightPixels;
        }
        Rect rect3 = new Rect();
        View view3 = uoVar.f10421i;
        DisplayMetrics displayMetrics2 = (view3 == null || (resources = view3.getResources()) == null) ? null : resources.getDisplayMetrics();
        if (displayMetrics2 == null) {
            displayMetrics2 = new DisplayMetrics();
        }
        rect3.right = displayMetrics2.widthPixels + 1;
        rect3.bottom = displayMetrics2.heightPixels + 1;
        Rect rect4 = new Rect();
        View view4 = uoVar.f10421i;
        boolean globalVisibleRect = view4 != null ? view4.getGlobalVisibleRect(rect4) : false;
        Rect rect5 = new Rect();
        View view5 = uoVar.f10421i;
        boolean localVisibleRect = view5 != null ? view5.getLocalVisibleRect(rect5) : false;
        Rect rect6 = new Rect();
        View view6 = uoVar.f10421i;
        if (view6 != null) {
            view6.getHitRect(rect6);
        }
        View view7 = uoVar.f10421i;
        int windowVisibility = view7 != null ? view7.getWindowVisibility() : 8;
        int i11 = uoVar.f10424l;
        if (i11 == -1) {
            i11 = windowVisibility;
        }
        View view8 = uoVar.f10421i;
        boolean zA = view8 != null ? dj0Var.a(view8, uoVar.f10422j) : false;
        boolean z12 = uoVar.f10419g == qw2.f8867l && !Rect.intersects(rect, rect3);
        if (!jr0Var.H0() ? !zA || z12 : !zA || ((uoVar.f10424l != -1 && i11 != 0) || z12)) {
            z11 = false;
        }
        int i12 = jr0Var.H0() ? i11 : windowVisibility;
        View view9 = uoVar.f10421i;
        Rect rect7 = (view9 == null || (context4 = view9.getContext()) == null) ? new Rect() : d0.f(context4, rect);
        View view10 = uoVar.f10421i;
        boolean zIsAttachedToWindow = view10 != null ? view10.isAttachedToWindow() : false;
        View view11 = uoVar.f10421i;
        Rect rect8 = (view11 == null || (context3 = view11.getContext()) == null) ? new Rect() : d0.f(context3, rect2);
        View view12 = uoVar.f10421i;
        Rect rect9 = (view12 == null || (context2 = view12.getContext()) == null) ? new Rect() : d0.f(context2, rect4);
        View view13 = uoVar.f10421i;
        boolean z13 = z11;
        qo3 qo3Var = new qo3(so3Var, z13, i12, rect7, zIsAttachedToWindow, rect8, rect9, globalVisibleRect, (view13 == null || (context = view13.getContext()) == null) ? new Rect() : d0.f(context, rect5), localVisibleRect, rect6);
        Duration.Companion companion = Duration.f72038b;
        long jH = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
        if (so3Var == so3.f9624c && Boolean.valueOf(z13).equals(uoVar.n) && Duration.c(jH, Duration.m(uoVar.f10425m, f10413p)) < 0) {
            return Unit.f71706a;
        }
        uoVar.n = Boolean.valueOf(z13);
        uoVar.f10425m = jH;
        Object objC = uoVar.f10416c.c(qo3Var, suspendLambda);
        return objC == CoroutineSingletons.f71806a ? objC : Unit.f71706a;
    }
}
