package io.sentry.android.core.internal.util;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.view.Choreographer;
import android.view.FrameMetrics;
import android.view.Window;
import fa.l0;
import io.sentry.android.core.a0;
import io.sentry.g3;
import java.lang.Thread;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class o implements Application.ActivityLifecycleCallbacks {
    public static final long n = TimeUnit.SECONDS.toNanos(1);
    public static final long o = TimeUnit.MILLISECONDS.toNanos(700);

    /* renamed from: p, reason: collision with root package name */
    public static final /* synthetic */ int f66971p = 0;

    /* renamed from: a, reason: collision with root package name */
    public final a0 f66972a;

    /* renamed from: b, reason: collision with root package name */
    public final CopyOnWriteArraySet f66973b;

    /* renamed from: c, reason: collision with root package name */
    public final io.sentry.android.core.j f66974c;

    /* renamed from: d, reason: collision with root package name */
    public final Handler f66975d;

    /* renamed from: e, reason: collision with root package name */
    public WeakReference f66976e;

    /* renamed from: f, reason: collision with root package name */
    public final ConcurrentHashMap f66977f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f66978g;

    /* renamed from: h, reason: collision with root package name */
    public final b6.e f66979h;

    /* renamed from: i, reason: collision with root package name */
    public final m f66980i;

    /* renamed from: j, reason: collision with root package name */
    public Choreographer f66981j;

    /* renamed from: k, reason: collision with root package name */
    public final Field f66982k;

    /* renamed from: l, reason: collision with root package name */
    public long f66983l;

    /* renamed from: m, reason: collision with root package name */
    public long f66984m;

    /* JADX WARN: Type inference failed for: r4v5, types: [io.sentry.android.core.internal.util.m] */
    public o(Context context, final io.sentry.android.core.j jVar, final a0 a0Var) throws NoSuchFieldException, SecurityException {
        b6.e eVar = new b6.e(10);
        this.f66973b = new CopyOnWriteArraySet();
        this.f66977f = new ConcurrentHashMap();
        this.f66978g = false;
        this.f66983l = 0L;
        this.f66984m = 0L;
        Context applicationContext = context.getApplicationContext();
        context = applicationContext != null ? applicationContext : context;
        this.f66974c = jVar;
        this.f66972a = a0Var;
        this.f66979h = eVar;
        if (context instanceof Application) {
            this.f66978g = true;
            HandlerThread handlerThread = new HandlerThread("io.sentry.android.core.internal.util.SentryFrameMetricsCollector");
            handlerThread.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: io.sentry.android.core.internal.util.l
                @Override // java.lang.Thread.UncaughtExceptionHandler
                public final void uncaughtException(Thread thread, Throwable th2) {
                    jVar.e(g3.ERROR, "Error during frames measurements.", th2);
                }
            });
            handlerThread.start();
            this.f66975d = new Handler(handlerThread.getLooper());
            ((Application) context).registerActivityLifecycleCallbacks(this);
            new Handler(Looper.getMainLooper()).post(new l0(19, this, jVar));
            try {
                Field declaredField = Choreographer.class.getDeclaredField("mLastFrameTimeNanos");
                this.f66982k = declaredField;
                declaredField.setAccessible(true);
            } catch (NoSuchFieldException e3) {
                jVar.e(g3.ERROR, "Unable to get the frame timestamp from the choreographer: ", e3);
            }
            this.f66980i = new Window.OnFrameMetricsAvailableListener(a0Var) { // from class: io.sentry.android.core.internal.util.m
                @Override // android.view.Window.OnFrameMetricsAvailableListener
                public final void onFrameMetricsAvailable(Window window, FrameMetrics frameMetrics, int i5) {
                    long jNanoTime = System.nanoTime();
                    float refreshRate = Build.VERSION.SDK_INT >= 30 ? window.getContext().getDisplay().getRefreshRate() : window.getWindowManager().getDefaultDisplay().getRefreshRate();
                    float f11 = o.n;
                    long metric = frameMetrics.getMetric(5) + frameMetrics.getMetric(4) + frameMetrics.getMetric(3) + frameMetrics.getMetric(2) + frameMetrics.getMetric(1) + frameMetrics.getMetric(0);
                    long jMax = Math.max(0L, metric - ((long) (f11 / refreshRate)));
                    o oVar = this.f66970a;
                    oVar.f66972a.getClass();
                    long metric2 = frameMetrics.getMetric(10);
                    if (metric2 < 0) {
                        metric2 = jNanoTime - metric;
                    }
                    long jMax2 = Math.max(metric2, oVar.f66984m);
                    if (jMax2 == oVar.f66983l) {
                        return;
                    }
                    oVar.f66983l = jMax2;
                    oVar.f66984m = jMax2 + metric;
                    boolean z11 = metric > ((long) (f11 / (refreshRate - 1.0f)));
                    boolean z12 = z11 && metric > o.o;
                    Iterator it = oVar.f66977f.values().iterator();
                    while (it.hasNext()) {
                        long j11 = metric;
                        long j12 = jMax;
                        long j13 = jMax2;
                        ((n) it.next()).c(j13, oVar.f66984m, j11, j12, z11, z12, refreshRate);
                        oVar = oVar;
                        jMax2 = j13;
                        jMax = j12;
                        metric = j11;
                    }
                }
            };
        }
    }

    public final void a(String str) {
        if (this.f66978g) {
            ConcurrentHashMap concurrentHashMap = this.f66977f;
            if (str != null) {
                concurrentHashMap.remove(str);
            }
            WeakReference weakReference = this.f66976e;
            Window window = weakReference != null ? (Window) weakReference.get() : null;
            if (window == null || !concurrentHashMap.isEmpty()) {
                return;
            }
            b(window);
        }
    }

    public final void b(Window window) {
        CopyOnWriteArraySet copyOnWriteArraySet = this.f66973b;
        if (copyOnWriteArraySet.contains(window)) {
            this.f66972a.getClass();
            try {
                b6.e eVar = this.f66979h;
                m mVar = this.f66980i;
                eVar.getClass();
                window.removeOnFrameMetricsAvailableListener(mVar);
            } catch (Exception e3) {
                this.f66974c.e(g3.ERROR, "Failed to remove frameMetricsAvailableListener", e3);
            }
            copyOnWriteArraySet.remove(window);
        }
    }

    public final void c() {
        WeakReference weakReference = this.f66976e;
        Window window = weakReference != null ? (Window) weakReference.get() : null;
        if (window == null || !this.f66978g) {
            return;
        }
        CopyOnWriteArraySet copyOnWriteArraySet = this.f66973b;
        if (copyOnWriteArraySet.contains(window) || this.f66977f.isEmpty()) {
            return;
        }
        this.f66972a.getClass();
        Handler handler = this.f66975d;
        if (handler != null) {
            copyOnWriteArraySet.add(window);
            this.f66979h.getClass();
            window.addOnFrameMetricsAvailableListener(this.f66980i, handler);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        Window window = activity.getWindow();
        WeakReference weakReference = this.f66976e;
        if (weakReference == null || weakReference.get() != window) {
            this.f66976e = new WeakReference(window);
            c();
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        b(activity.getWindow());
        WeakReference weakReference = this.f66976e;
        if (weakReference == null || weakReference.get() != activity.getWindow()) {
            return;
        }
        this.f66976e = null;
    }
}
