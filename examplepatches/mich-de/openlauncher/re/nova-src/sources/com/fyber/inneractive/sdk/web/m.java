package com.fyber.inneractive.sdk.web;

import android.graphics.Rect;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.webkit.WebView;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public class m extends WebView {

    /* renamed from: a, reason: collision with root package name */
    public boolean f31353a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f31354b;

    /* renamed from: c, reason: collision with root package name */
    public l f31355c;

    /* renamed from: d, reason: collision with root package name */
    public y0 f31356d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.util.g1 f31357e;

    /* renamed from: f, reason: collision with root package name */
    public int f31358f;

    /* renamed from: g, reason: collision with root package name */
    public int f31359g;

    public m() {
        super(IAConfigManager.Q.f27762v.a());
        this.f31353a = false;
        this.f31357e = new com.fyber.inneractive.sdk.util.g1();
    }

    public final void a(String str) {
        IAlog.a("injecting JS: %s", str);
        if (str != null) {
            try {
                loadUrl("javascript:".concat(str));
            } catch (Throwable th2) {
                IAlog.a("Failed to inject JS", th2, new Object[0]);
            }
        }
    }

    public final void b() {
        IAlog.e("updateVisibility called - is = %s hwf = %s atw = %swinToken - %s app token - %s", Boolean.valueOf(isShown()), Boolean.valueOf(hasWindowFocus()), Boolean.valueOf(this.f31353a), getWindowToken(), getApplicationWindowToken());
        if (getWindowToken() != getApplicationWindowToken()) {
            a(getWindowVisibility() != 8 && isShown() && this.f31353a);
            return;
        }
        boolean z11 = isShown() && this.f31353a;
        if (IAConfigManager.Q.f27761u.f27936b.a(false, "ignore_w_f")) {
            z = z11;
        } else if (!z11 || !hasWindowFocus()) {
            z = false;
        }
        a(z);
    }

    @Override // android.webkit.WebView
    public void destroy() {
        try {
            super.destroy();
        } catch (Throwable unused) {
        }
        this.f31355c = null;
    }

    public int getHeightDp() {
        return this.f31359g;
    }

    public boolean getIsVisible() {
        return this.f31354b;
    }

    public com.fyber.inneractive.sdk.util.g1 getLastClickedLocation() {
        return this.f31357e;
    }

    public int getWidthDp() {
        return this.f31358f;
    }

    @Override // android.webkit.WebView, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f31353a) {
            return;
        }
        this.f31353a = true;
        l lVar = this.f31355c;
        if (lVar != null) {
            lVar.b();
        }
        a();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f31354b = false;
        if (this.f31353a) {
            this.f31353a = false;
            l lVar = this.f31355c;
            if (lVar != null) {
                lVar.c();
            }
            a();
        }
    }

    @Override // android.webkit.WebView, android.view.View
    public final void onFocusChanged(boolean z11, int i5, Rect rect) {
        super.onFocusChanged(z11, i5, rect);
        a();
    }

    @Override // android.webkit.WebView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getActionMasked() == 1 && motionEvent.getEventTime() - motionEvent.getDownTime() >= ViewConfiguration.getLongPressTimeout()) {
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            dispatchTouchEvent(MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 0, x11, y11, 0));
            dispatchTouchEvent(MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 1, x11, y11, 0));
        }
        y0 y0Var = this.f31356d;
        if (y0Var != null) {
            y0Var.onTouch(this, motionEvent);
        }
        if (motionEvent.getAction() == 0) {
            com.fyber.inneractive.sdk.util.g1 g1Var = this.f31357e;
            float x12 = motionEvent.getX();
            float y12 = motionEvent.getY();
            g1Var.f31187a = x12;
            g1Var.f31188b = y12;
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.webkit.WebView, android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        a();
    }

    @Override // android.webkit.WebView, android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        IAlog.e("onWindowFocusChanged with: %s", Boolean.valueOf(z11));
        a();
    }

    @Override // android.webkit.WebView, android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        if (i5 == 8) {
            a(false);
        } else {
            a();
        }
    }

    public void setHeightDp(int i5) {
        this.f31359g = i5;
    }

    public void setListener(l lVar) {
        this.f31355c = lVar;
    }

    public void setTapListener(x0 x0Var) {
        this.f31356d = new y0(x0Var, IAConfigManager.Q.f27762v.a());
    }

    public void setWidthDp(int i5) {
        this.f31358f = i5;
    }

    public final void a(boolean z11) {
        if (z11) {
            ViewGroup viewGroup = (ViewGroup) getParent();
            if (viewGroup != null) {
                Rect rect = new Rect();
                viewGroup.getHitRect(rect);
                if (!getLocalVisibleRect(rect) && getWindowToken() == getApplicationWindowToken()) {
                    IAlog.e("updateVisibility - Cannot find local visible rect. Scrolled out?", new Object[0]);
                    z11 = false;
                }
            } else {
                IAlog.e("updateVisibility - No parent available", new Object[0]);
            }
        }
        if (this.f31354b != z11) {
            this.f31354b = z11;
            l lVar = this.f31355c;
            if (lVar != null) {
                lVar.a(z11);
            }
        }
    }

    public final void a() {
        if (IAConfigManager.Q.f27761u.f27936b.a(false, "update_v_mth")) {
            com.fyber.inneractive.sdk.util.r.f31216b.post(new k(this));
        } else {
            b();
        }
    }
}
