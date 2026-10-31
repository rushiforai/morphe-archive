package com.bytedance.adsdk.ugeno.zb.zb;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.View;
import android.view.ViewTreeObserver;

/* loaded from: classes2.dex */
public final class sya {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.zb.zb.ycx f22763dj;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f22767jw;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f22768lt;
    private View lud;
    private lud sya;
    private Application syc;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f22771ul;
    private final Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private zb f22772zb;
    private boolean fby = true;

    /* renamed from: jc, reason: collision with root package name */
    private final Rect f22766jc = new Rect();

    /* renamed from: ea, reason: collision with root package name */
    private final View.OnLayoutChangeListener f22765ea = new View.OnLayoutChangeListener() { // from class: com.bytedance.adsdk.ugeno.zb.zb.sya.1
        @Override // android.view.View.OnLayoutChangeListener
        public void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
            if (sya.this.f22763dj != null) {
                sya.this.f22763dj.setBounds(0, 0, i12 - i5, i13 - i11);
            }
            sya.this.fby();
        }
    };

    /* renamed from: ok, reason: collision with root package name */
    private final ViewTreeObserver.OnScrollChangedListener f22769ok = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.bytedance.adsdk.ugeno.zb.zb.sya.2
        @Override // android.view.ViewTreeObserver.OnScrollChangedListener
        public void onScrollChanged() {
            sya.this.fby();
        }
    };

    /* renamed from: ry, reason: collision with root package name */
    private final ViewTreeObserver.OnWindowFocusChangeListener f22770ry = new ViewTreeObserver.OnWindowFocusChangeListener() { // from class: com.bytedance.adsdk.ugeno.zb.zb.sya.3
        @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
        public void onWindowFocusChanged(boolean z11) {
            sya.this.fby();
        }
    };
    private final View.OnAttachStateChangeListener xkz = new View.OnAttachStateChangeListener() { // from class: com.bytedance.adsdk.ugeno.zb.zb.sya.4
        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewAttachedToWindow(View view) {
            sya.this.lud();
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewDetachedFromWindow(View view) {
            sya.this.lt();
        }
    };

    /* renamed from: dy, reason: collision with root package name */
    private final Application.ActivityLifecycleCallbacks f22764dy = new ycx() { // from class: com.bytedance.adsdk.ugeno.zb.zb.sya.5
        @Override // com.bytedance.adsdk.ugeno.zb.zb.sya.ycx, android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
            if (activity == sya.this.dy()) {
                sya.this.fby = false;
                sya.this.fby();
            }
        }

        @Override // com.bytedance.adsdk.ugeno.zb.zb.sya.ycx, android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
            if (activity == sya.this.dy()) {
                sya.this.fby = true;
                sya.this.fby();
            }
        }
    };

    public static abstract class ycx implements Application.ActivityLifecycleCallbacks {
        private ycx() {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
        }
    }

    public sya(Context context) {
        this.ycx = context != null ? context.getApplicationContext() : null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Activity dy() {
        View view = this.lud;
        if (view == null) {
            return null;
        }
        return ycx(view.getContext());
    }

    private void ea() {
        View view = this.lud;
        if (view == null || !this.f22767jw) {
            return;
        }
        view.removeOnLayoutChangeListener(this.f22765ea);
        this.lud.removeOnAttachStateChangeListener(this.xkz);
        this.f22767jw = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fby() {
        ycx(ul());
    }

    private void jc() {
        View view = this.lud;
        if (view == null || this.f22767jw) {
            return;
        }
        view.addOnLayoutChangeListener(this.f22765ea);
        this.lud.addOnAttachStateChangeListener(this.xkz);
        this.f22767jw = true;
    }

    private void jw() {
        zb zbVar = this.f22772zb;
        if (zbVar == null) {
            return;
        }
        if (this.sya == null) {
            this.sya = new lud(zbVar);
        }
        View view = this.lud;
        if (view != null) {
            this.sya.ycx(view.getWidth(), this.lud.getHeight());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lt() {
        View view = this.lud;
        if (view == null) {
            this.f22768lt = false;
            this.f22771ul = false;
            pmi();
            this.f22767jw = false;
            return;
        }
        if (this.f22768lt) {
            this.f22768lt = false;
            ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
            if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
                viewTreeObserver.removeOnScrollChangedListener(this.f22769ok);
                ViewTreeObserver.OnWindowFocusChangeListener onWindowFocusChangeListener = this.f22770ry;
                if (onWindowFocusChangeListener != null) {
                    viewTreeObserver.removeOnWindowFocusChangeListener(onWindowFocusChangeListener);
                }
            }
            ycx(false);
            ry();
        }
        ea();
        pmi();
    }

    private void ok() {
        if (this.lud == null || this.f22772zb == null || !syc()) {
            return;
        }
        jw();
        if (this.f22763dj == null) {
            this.f22763dj = new com.bytedance.adsdk.ugeno.zb.zb.ycx(this.sya);
        }
        int width = this.lud.getWidth();
        int height = this.lud.getHeight();
        if (width > 0 && height > 0) {
            this.f22763dj.setBounds(0, 0, width, height);
        }
        this.lud.getOverlay().add(this.f22763dj);
    }

    private void pmi() {
        Application application = this.syc;
        if (application != null) {
            application.unregisterActivityLifecycleCallbacks(this.f22764dy);
            this.syc = null;
        }
    }

    private void ry() {
        if (this.lud == null || this.f22763dj == null || !syc()) {
            return;
        }
        this.lud.getOverlay().remove(this.f22763dj);
    }

    private static boolean syc() {
        return true;
    }

    private boolean ul() {
        View view;
        return this.f22768lt && (view = this.lud) != null && this.fby && view.getVisibility() == 0 && this.lud.getWindowVisibility() == 0 && this.lud.getWidth() > 0 && this.lud.getHeight() > 0 && this.lud.getAlpha() > 0.0f && this.lud.getGlobalVisibleRect(this.f22766jc) && this.f22766jc.width() > 1 && this.f22766jc.height() > 1;
    }

    private void wie() {
        Activity activityDy;
        Application application;
        if (this.syc != null || (activityDy = dy()) == null || (application = activityDy.getApplication()) == null) {
            return;
        }
        this.syc = application;
        application.registerActivityLifecycleCallbacks(this.f22764dy);
    }

    private void xkz() {
        com.bytedance.adsdk.ugeno.zb.zb.ycx ycxVar = this.f22763dj;
        if (ycxVar != null) {
            ycxVar.zb();
        }
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.lt();
            this.sya = null;
        }
        this.f22763dj = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lud() {
        if (this.f22768lt || this.lud == null || this.f22772zb == null || !syc()) {
            return;
        }
        jc();
        this.f22768lt = true;
        ok();
        ViewTreeObserver viewTreeObserver = this.lud.getViewTreeObserver();
        if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
            viewTreeObserver.addOnScrollChangedListener(this.f22769ok);
            ViewTreeObserver.OnWindowFocusChangeListener onWindowFocusChangeListener = this.f22770ry;
            if (onWindowFocusChangeListener != null) {
                viewTreeObserver.addOnWindowFocusChangeListener(onWindowFocusChangeListener);
            }
        }
        wie();
        fby();
    }

    public void dj() {
        lt();
    }

    public void sya() {
        lud();
    }

    public void zb() {
        lt();
        this.lud = null;
        xkz();
    }

    public void ycx(String str) {
        zb zbVarYcx = zb.ycx(this.ycx, str);
        if (zbVarYcx != null && zbVarYcx.sya()) {
            if (this.f22772zb == zbVarYcx) {
                return;
            }
            ry();
            xkz();
            this.f22772zb = zbVarYcx;
            if (!this.f22768lt || this.lud == null) {
                return;
            }
            ok();
            boolean z11 = this.f22771ul;
            this.f22771ul = false;
            ycx(z11 || ul());
            return;
        }
        if (this.f22772zb != null) {
            ry();
            xkz();
            this.f22772zb = null;
        }
    }

    public boolean ycx() {
        return this.f22772zb != null;
    }

    public void ycx(View view) {
        if (this.lud == view) {
            return;
        }
        zb();
        this.lud = view;
        if (view == null || this.f22772zb == null || !syc()) {
            return;
        }
        jc();
        if (this.lud.getWindowToken() != null) {
            lud();
        }
    }

    private void ycx(boolean z11) {
        if (this.f22771ul == z11) {
            return;
        }
        this.f22771ul = z11;
        if (z11) {
            jw();
            lud ludVar = this.sya;
            if (ludVar != null) {
                ludVar.dj();
            }
            com.bytedance.adsdk.ugeno.zb.zb.ycx ycxVar = this.f22763dj;
            if (ycxVar != null) {
                ycxVar.ycx();
                return;
            }
            return;
        }
        com.bytedance.adsdk.ugeno.zb.zb.ycx ycxVar2 = this.f22763dj;
        if (ycxVar2 != null) {
            ycxVar2.zb();
        }
        lud ludVar2 = this.sya;
        if (ludVar2 != null) {
            ludVar2.lud();
        }
    }

    private static Activity ycx(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                return (Activity) context;
            }
            Context baseContext = ((ContextWrapper) context).getBaseContext();
            if (baseContext == context) {
                return null;
            }
            context = baseContext;
        }
        return null;
    }
}
