package com.bytedance.sdk.component.jw;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.MutableContextWrapper;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.utils.bhi;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes2.dex */
public class lt extends WebView {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f23802dj;
    private lud fby;

    /* renamed from: lt, reason: collision with root package name */
    private int f23803lt;
    private boolean lud;
    private boolean sya;

    /* renamed from: ul, reason: collision with root package name */
    private sya f23804ul;
    public long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final HashSet<String> f23805zb;

    public lt(Context context, AttributeSet attributeSet) {
        super(ycx(context), attributeSet);
        this.f23805zb = new HashSet<>();
        this.ycx = System.currentTimeMillis();
        lud();
    }

    private void lud() {
        if (bhi.zb()) {
            return;
        }
        WebSettings settings = getSettings();
        settings.setSupportZoom(false);
        settings.setDisplayZoomControls(false);
        settings.setBuiltInZoomControls(false);
        settings.setSupportMultipleWindows(false);
        settings.setAllowFileAccess(false);
        settings.setSavePassword(false);
        setWebViewClient(new fby.ycx());
    }

    private static Context ycx(Context context) {
        return (bhi.ycx() && !(context instanceof MutableContextWrapper)) ? new MutableContextWrapper(context) : context;
    }

    @Override // android.webkit.WebView
    public void addJavascriptInterface(Object obj, String str) {
        toString();
        if (this.sya || this.lud) {
            return;
        }
        super.addJavascriptInterface(obj, str);
        this.f23805zb.add(str);
    }

    @Override // android.webkit.WebView
    public void clearCache(boolean z11) {
        if (this.sya || this.lud) {
            return;
        }
        super.clearCache(z11);
    }

    @Override // android.webkit.WebView
    public void destroy() {
        toString();
        if (this.sya) {
            return;
        }
        zb();
        this.sya = true;
        ViewParent parent = getParent();
        if (parent instanceof ViewGroup) {
            ((ViewGroup) parent).removeView(this);
        }
        super.destroy();
    }

    public boolean dj() {
        return this.lud;
    }

    @Override // android.webkit.WebView
    public void evaluateJavascript(String str, ValueCallback<String> valueCallback) {
        if (!this.sya && !this.lud) {
            super.evaluateJavascript(str, valueCallback);
        } else if (valueCallback != null) {
            valueCallback.onReceiveValue(b.f42142b);
        }
    }

    public int getReuseCount() {
        return this.f23803lt;
    }

    @Override // android.webkit.WebView
    public void goBack() {
        if (this.sya || this.lud) {
            return;
        }
        super.goBack();
    }

    @Override // android.webkit.WebView
    public void goBackOrForward(int i5) {
        if (this.sya || this.lud) {
            return;
        }
        super.goBackOrForward(i5);
    }

    @Override // android.webkit.WebView
    public void goForward() {
        if (this.sya || this.lud) {
            return;
        }
        super.goForward();
    }

    @Override // android.webkit.WebView
    public void loadDataWithBaseURL(String str, String str2, String str3, String str4, String str5) {
        if (this.sya || this.lud) {
            return;
        }
        super.loadDataWithBaseURL(str, str2, str3, str4, str5);
    }

    @Override // android.webkit.WebView
    public void loadUrl(String str) {
        if (this.sya || this.lud) {
            return;
        }
        try {
            super.loadUrl(str);
        } catch (Exception | IncompatibleClassChangeError | NoClassDefFoundError e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "a+8jkg+5XsKCfN5Ymw==", "V+EskTauZQ==", 197);
        }
    }

    @Override // android.webkit.WebView, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        toString();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        toString();
        if (this.f23802dj) {
            destroy();
        }
    }

    @Override // android.webkit.WebView, android.view.View
    public void onDraw(Canvas canvas) {
        if (this.sya || this.lud) {
            return;
        }
        super.onDraw(canvas);
    }

    @Override // android.webkit.WebView, android.widget.AbsoluteLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        if (this.sya || this.lud) {
            setMeasuredDimension(0, 0);
        } else {
            super.onMeasure(i5, i11);
        }
    }

    @Override // android.webkit.WebView
    public void onPause() {
        if (this.sya || this.lud) {
            return;
        }
        try {
            super.onPause();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "a+8jkg+5XsKCfN5Ymw==", "VOAdlBavbA==", 113);
        }
    }

    @Override // android.webkit.WebView
    public void onResume() {
        if (this.sya || this.lud) {
            return;
        }
        try {
            super.onResume();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "a+8jkg+5XsKCfN5Ymw==", "VOAfkBCpZMI=", Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
    }

    @Override // android.webkit.WebView, android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        lud ludVar = this.fby;
        return (ludVar == null || !ludVar.zb(motionEvent)) ? super.onTouchEvent(motionEvent) : this.fby.ycx(motionEvent);
    }

    @Override // android.webkit.WebView
    public void pauseTimers() {
        if (this.sya || this.lud) {
            return;
        }
        super.pauseTimers();
    }

    @Override // android.webkit.WebView
    public void reload() {
        if (this.sya || this.lud) {
            return;
        }
        super.reload();
    }

    @Override // android.webkit.WebView
    public void removeJavascriptInterface(String str) {
        if (this.sya || this.lud) {
            return;
        }
        super.removeJavascriptInterface(str);
        this.f23805zb.remove(str);
    }

    @Override // android.webkit.WebView
    public void resumeTimers() {
        if (this.sya || this.lud) {
            return;
        }
        super.resumeTimers();
    }

    public void setDestroyOnDetached(boolean z11) {
        this.f23802dj = z11;
    }

    @Override // android.view.View
    @SuppressLint({"ClickableViewAccessibility"})
    public void setOnTouchListener(View.OnTouchListener onTouchListener) {
        sya syaVar = this.f23804ul;
        if (syaVar == null) {
            super.setOnTouchListener(onTouchListener);
        } else {
            syaVar.ycx(onTouchListener);
            super.setOnTouchListener(this.f23804ul);
        }
    }

    public void setRecycled(boolean z11) {
        if (this.lud != z11 && !z11) {
            this.f23803lt++;
        }
        this.lud = z11;
    }

    public void setTouchListenerProxy(sya syaVar) {
        this.f23804ul = syaVar;
    }

    public void setWebEventProxy(lud ludVar) {
        this.fby = ludVar;
    }

    @Override // android.webkit.WebView
    public void stopLoading() {
        if (this.sya || this.lud) {
            return;
        }
        try {
            super.stopLoading();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "a+8jkg+5XsKCfN5Ymw==", "SPoihS+zaMOJRNA=", 139);
        }
    }

    public void sya() {
        if (this.sya) {
            return;
        }
        setOnClickListener(null);
        setOnTouchListener(null);
        setOnScrollChangeListener(null);
        setDownloadListener(null);
    }

    public void zb() {
        if (this.sya) {
            return;
        }
        setOnClickListener(null);
        setOnTouchListener(null);
        setOnScrollChangeListener(null);
        setDownloadListener(null);
        Iterator<String> it = this.f23805zb.iterator();
        while (it.hasNext()) {
            super.removeJavascriptInterface(it.next());
        }
        this.f23805zb.clear();
    }

    @Override // android.webkit.WebView
    public void loadUrl(String str, Map<String, String> map) {
        if (this.sya || this.lud) {
            return;
        }
        try {
            super.loadUrl(str, map);
        } catch (Exception | IncompatibleClassChangeError | NoClassDefFoundError e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "a+8jkg+5XsKCfN5Ymw==", "V+EskTauZQ==", Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE);
        }
    }

    public boolean ycx() {
        return this.sya;
    }

    public lt(Context context, AttributeSet attributeSet, int i5) {
        super(ycx(context), attributeSet, i5);
        this.f23805zb = new HashSet<>();
        this.ycx = System.currentTimeMillis();
        lud();
    }
}
