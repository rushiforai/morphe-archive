package com.bytedance.sdk.openadsdk.utils;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.view.View;
import android.view.Window;
import com.bytedance.sdk.openadsdk.ApmHelper;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx implements Application.ActivityLifecycleCallbacks {
    public static long sya = 0;
    public static boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    public static long f27251zb;
    private final lud fby;

    /* renamed from: jw, reason: collision with root package name */
    private final lud f27256jw;
    private volatile WeakReference<Activity> xkz;

    /* renamed from: dj, reason: collision with root package name */
    private final AtomicBoolean f27252dj = new AtomicBoolean(false);
    private final RunnableC0112ycx lud = new RunnableC0112ycx();

    /* renamed from: lt, reason: collision with root package name */
    private final ul f27257lt = new ul();

    /* renamed from: ul, reason: collision with root package name */
    private final lt f27260ul = new lt();

    /* renamed from: jc, reason: collision with root package name */
    private int f27255jc = 0;

    /* renamed from: ea, reason: collision with root package name */
    private volatile CopyOnWriteArrayList<WeakReference<com.bytedance.sdk.component.adexpress.ycx>> f27254ea = new CopyOnWriteArrayList<>();

    /* renamed from: ok, reason: collision with root package name */
    private HandlerThread f27258ok = null;

    /* renamed from: ry, reason: collision with root package name */
    private Handler f27259ry = null;
    private final LinkedList<Activity> syc = new LinkedList<>();

    /* renamed from: dy, reason: collision with root package name */
    private volatile CopyOnWriteArrayList<WeakReference<zb>> f27253dy = new CopyOnWriteArrayList<>();

    public static class dj extends lud {
        private dj() {
            super();
        }

        @Override // com.bytedance.sdk.openadsdk.utils.ycx.lud, java.lang.Runnable
        public void run() {
            super.run();
            com.bytedance.sdk.openadsdk.utils.lud.ycx();
        }
    }

    public class fby implements Runnable {

        /* renamed from: dj, reason: collision with root package name */
        private boolean f27262dj;
        private long sya;

        /* renamed from: zb, reason: collision with root package name */
        private long f27263zb;

        public fby(long j11, long j12, boolean z11) {
            this.f27263zb = j11;
            this.sya = j12;
            this.f27262dj = z11;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.f27262dj) {
                com.bytedance.sdk.openadsdk.dy.dj.ycx().ycx(this.f27263zb / 1000, this.sya / 1000);
            }
        }
    }

    public class lt implements Runnable {
        public lt() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (ApmHelper.isIsInit()) {
                Handler handlerZb = com.bytedance.sdk.openadsdk.core.syc.zb();
                Message messageObtain = Message.obtain(handlerZb, ycx.this.lud);
                messageObtain.what = 1001;
                handlerZb.sendMessageDelayed(messageObtain, 30000L);
            }
        }
    }

    public static class lud implements Runnable {
        private lud() {
        }

        @Override // java.lang.Runnable
        public void run() {
            com.bytedance.sdk.openadsdk.dj.ycx.jc jcVarDfk = com.bytedance.sdk.openadsdk.core.settings.ea.zb().dfk();
            if (jcVarDfk == null || jcVarDfk.ycx() || !com.bytedance.sdk.component.utils.pmi.fby(com.bytedance.sdk.openadsdk.core.pmi.ycx())) {
                return;
            }
            com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.core.ry.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()));
        }
    }

    public static class sya extends lud {
        private sya() {
            super();
        }

        @Override // com.bytedance.sdk.openadsdk.utils.ycx.lud, java.lang.Runnable
        public void run() {
            super.run();
            com.bytedance.sdk.openadsdk.lt.zb.ycx().zb();
            com.bytedance.sdk.openadsdk.utils.lud.zb();
            com.bytedance.sdk.openadsdk.component.ul.ycx.ycx(3);
        }
    }

    public class ul implements Runnable {
        public ul() {
        }

        @Override // java.lang.Runnable
        public void run() {
            com.bytedance.sdk.openadsdk.core.syc.zb().removeMessages(1001);
            com.bytedance.sdk.openadsdk.core.pmi.ycx();
        }
    }

    /* renamed from: com.bytedance.sdk.openadsdk.utils.ycx$ycx, reason: collision with other inner class name */
    public static class RunnableC0112ycx implements Runnable {
        @Override // java.lang.Runnable
        public void run() {
            yzp.zb(new com.bytedance.sdk.component.fby.zb.sya("reportPvFromBackGround") { // from class: com.bytedance.sdk.openadsdk.utils.ycx.ycx.1
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    ApmHelper.reportPvFromBackGround();
                }
            });
        }
    }

    public interface zb {
        void ycx();

        void zb();
    }

    public ycx() {
        this.fby = new sya();
        this.f27256jw = new dj();
        sya();
    }

    private void sya() {
        this.f27258ok = com.bytedance.sdk.component.utils.fby.ycx("lifecycle", 10);
        this.f27259ry = new Handler(this.f27258ok.getLooper());
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
        this.syc.addFirst(activity);
        com.bytedance.sdk.openadsdk.core.widget.lud.ycx(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
        com.bytedance.sdk.openadsdk.core.widget.lud.zb(activity);
        if (this.f27254ea != null && this.f27254ea.size() > 0) {
            Iterator<WeakReference<com.bytedance.sdk.component.adexpress.ycx>> it = this.f27254ea.iterator();
            while (it.hasNext()) {
                WeakReference<com.bytedance.sdk.component.adexpress.ycx> next = it.next();
                if (next != null && next.get() != null) {
                    try {
                        next.get().ycx(activity);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eu05nBW1fd6sQ9FYjwijJF7CJIYXuWfCkg==", "VOAMlhe1f86UU/NYnwWyJ0LrKQ==", 386);
                    }
                }
            }
        }
        if (this.xkz != null && this.xkz.get() == activity) {
            this.xkz = null;
        }
        this.syc.remove(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        int i5 = this.f27255jc - 1;
        this.f27255jc = i5;
        if (i5 < 0) {
            this.f27255jc = 0;
        }
        if (ApmHelper.isIsInit()) {
            ycx(this.f27260ul);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        ycx(this.f27257lt);
        if (!ycx) {
            f27251zb = System.currentTimeMillis();
            ycx = true;
        }
        this.xkz = new WeakReference<>(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(final Activity activity) {
        Window window;
        try {
            if (dc.zb() && (window = activity.getWindow()) != null) {
                final View decorView = window.getDecorView();
                if (!decorView.isAttachedToWindow()) {
                    decorView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.bytedance.sdk.openadsdk.utils.ycx.1
                        @Override // android.view.View.OnAttachStateChangeListener
                        public void onViewAttachedToWindow(View view) {
                            decorView.removeOnAttachStateChangeListener(this);
                            if (dc.lud(activity)) {
                                dc.ycx(true);
                            }
                        }

                        @Override // android.view.View.OnAttachStateChangeListener
                        public void onViewDetachedFromWindow(View view) {
                            decorView.removeOnAttachStateChangeListener(this);
                        }
                    });
                } else if (dc.lud(activity)) {
                    dc.ycx(true);
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eu05nBW1fd6sQ9FYjwijJF7CJIYXuWfCkg==", "VOAMlhe1f86UU+RJjQO0LV8=", Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE);
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.ActivityLifecycle", th2);
        }
        this.f27255jc++;
        if (this.f27252dj.get()) {
            this.f27259ry.removeCallbacks(this.f27256jw);
            this.f27259ry.removeCallbacks(this.fby);
            ycx(this.f27256jw);
            if (this.f27253dy != null) {
                Iterator<WeakReference<zb>> it = this.f27253dy.iterator();
                while (it.hasNext()) {
                    WeakReference<zb> next = it.next();
                    if (next != null && next.get() != null) {
                        next.get().ycx();
                    }
                }
            }
        }
        this.f27252dj.set(false);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        if (this.f27255jc <= 0) {
            this.f27252dj.set(true);
        }
        if (ycx()) {
            ycx = false;
            com.bytedance.sdk.openadsdk.core.syc.f26177zb.set(false);
            sya = System.currentTimeMillis();
            this.f27259ry.removeCallbacks(this.f27256jw);
            this.f27259ry.removeCallbacks(this.fby);
            ycx(this.fby);
            if (this.f27253dy != null) {
                Iterator<WeakReference<zb>> it = this.f27253dy.iterator();
                while (it.hasNext()) {
                    WeakReference<zb> next = it.next();
                    if (next != null && next.get() != null) {
                        next.get().zb();
                    }
                }
            }
        }
        ycx(new fby(f27251zb, sya, ycx()));
    }

    public boolean zb(zb zbVar) {
        boolean z11 = false;
        if (zbVar == null) {
            return false;
        }
        ArrayList arrayList = new ArrayList();
        Iterator<WeakReference<zb>> it = this.f27253dy.iterator();
        while (it.hasNext()) {
            WeakReference<zb> next = it.next();
            zb zbVar2 = next != null ? next.get() : null;
            if (zbVar2 == null || zbVar2 == zbVar) {
                arrayList.add(next);
                if (zbVar2 == zbVar) {
                    z11 = true;
                }
            }
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            WeakReference weakReference = (WeakReference) it2.next();
            Objects.toString(weakReference.get());
            zbVar.toString();
            this.f27253dy.remove(weakReference);
        }
        this.f27253dy.size();
        return z11;
    }

    private void ycx(Runnable runnable) {
        if (!this.f27258ok.isAlive()) {
            sya();
        }
        this.f27259ry.postDelayed(runnable, 1000L);
    }

    public boolean sya(com.bytedance.sdk.component.adexpress.ycx ycxVar) {
        boolean z11 = false;
        if (ycxVar == null) {
            return false;
        }
        ArrayList arrayList = new ArrayList();
        Iterator<WeakReference<com.bytedance.sdk.component.adexpress.ycx>> it = this.f27254ea.iterator();
        while (it.hasNext()) {
            WeakReference<com.bytedance.sdk.component.adexpress.ycx> next = it.next();
            com.bytedance.sdk.component.adexpress.ycx ycxVar2 = next != null ? next.get() : null;
            if (ycxVar2 == null || ycxVar2 == ycxVar) {
                arrayList.add(next);
                if (ycxVar2 == ycxVar) {
                    z11 = true;
                }
            }
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            this.f27254ea.remove((WeakReference) it2.next());
        }
        return z11;
    }

    public void ycx(zb zbVar) {
        this.f27253dy.add(new WeakReference<>(zbVar));
        this.f27253dy.size();
        Objects.toString(zbVar);
    }

    public void ycx(com.bytedance.sdk.component.adexpress.ycx ycxVar) {
        this.f27254ea.add(new WeakReference<>(ycxVar));
    }

    public boolean zb(com.bytedance.sdk.component.adexpress.ycx ycxVar) {
        return this.f27254ea.remove(new WeakReference(ycxVar));
    }

    public boolean ycx() {
        return this.f27252dj.get();
    }

    public boolean ycx(boolean z11) {
        Window window;
        if (this.xkz != null) {
            try {
                Activity activity = this.xkz.get();
                if (activity != null && (window = activity.getWindow()) != null) {
                    return window.getDecorView().hasWindowFocus();
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eu05nBW1fd6sQ9FYjwijJF7CJIYXuWfCkg==", "U+8+ogqybciXbNhemQI=", 424);
                return z11;
            }
        }
        return z11;
    }

    public Activity zb() {
        if (this.syc.isEmpty()) {
            return null;
        }
        return this.syc.getFirst();
    }
}
