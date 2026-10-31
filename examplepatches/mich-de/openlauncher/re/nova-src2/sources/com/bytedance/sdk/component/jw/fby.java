package com.bytedance.sdk.component.jw;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.MutableContextWrapper;
import android.graphics.Paint;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.DownloadListener;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.AbsListView;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ScrollView;
import androidx.room.o;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.jw.ycx;
import com.bytedance.sdk.component.utils.bhi;
import com.bytedance.sdk.component.utils.dv;
import com.bytedance.sdk.component.utils.tn;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby extends FrameLayout {
    private int aeu;

    /* renamed from: av, reason: collision with root package name */
    private float f23772av;
    private float bhi;
    private long dc;

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.jw.zb.ycx f23773dj;

    /* renamed from: dv, reason: collision with root package name */
    private boolean f23774dv;
    private AtomicBoolean dwi;

    /* renamed from: dy, reason: collision with root package name */
    private ycx.InterfaceC0038ycx f23775dy;

    /* renamed from: ea, reason: collision with root package name */
    private long f23776ea;
    private float fby;

    /* renamed from: hf, reason: collision with root package name */
    private sya f23777hf;
    private boolean htf;
    private Context ifb;

    /* renamed from: jc, reason: collision with root package name */
    private long f23778jc;

    /* renamed from: jw, reason: collision with root package name */
    private float f23779jw;
    private AttributeSet kgy;

    /* renamed from: lt, reason: collision with root package name */
    private JSONObject f23780lt;
    private String lud;
    private dj nji;
    private AtomicBoolean oby;

    /* renamed from: ok, reason: collision with root package name */
    private long f23781ok;
    private WebViewClient oty;
    private List<String> pmi;
    private float rmf;
    private dv rmy;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f23782ry;
    public int sya;
    private View syc;
    private long sz;
    private boolean thx;

    /* renamed from: tn, reason: collision with root package name */
    private boolean f23783tn;
    private lud tru;

    /* renamed from: uh, reason: collision with root package name */
    private com.bytedance.sdk.component.jw.dj f23784uh;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f23785ul;
    private com.bytedance.sdk.component.jw.ycx wie;
    private boolean wwx;
    private volatile WebView xkz;

    /* renamed from: xz, reason: collision with root package name */
    private zb f23786xz;
    public int ycx;
    private AtomicBoolean yzp;

    /* renamed from: zb, reason: collision with root package name */
    public int f23787zb;

    public interface dj {
    }

    public enum sya {
        ADS("ads"),
        ADS_V3("ads_v3"),
        ADS_V4("ads_v4"),
        ENDCARD("endcard"),
        USER_AGENT("ua"),
        PLAYABLE("playable"),
        DSP("dsp"),
        PRIVACY("privacy"),
        VAST_ENDCARD("vast_endcard"),
        EASY_PLAYABLE("easy_playable"),
        LANDING_PAGE("landing_page"),
        LANDING_PAGE_CEILING("landing_page_ceiling"),
        LANDING_PAGE_WITH_VIDEO("landing_page_with_video"),
        LANDING_PAGE_DIRECT("landing_page_direct"),
        LANDING_PAGE_PRE_RENDER("landing_page_pre_render");


        /* renamed from: dy, reason: collision with root package name */
        public final String f23797dy;

        sya(String str) {
            this.f23797dy = str;
        }
    }

    public static class ycx extends WebViewClient {
        @Override // android.webkit.WebViewClient
        public boolean onRenderProcessGone(WebView webView, final RenderProcessGoneDetail renderProcessGoneDetail) {
            final WebView webView2;
            if ((webView instanceof lt) && bhi.ycx()) {
                final String originalUrl = webView.getOriginalUrl();
                final String url = webView.getUrl();
                webView2 = webView;
                tn.ycx("webview_render_exception", new tn.ycx() { // from class: com.bytedance.sdk.component.jw.fby.ycx.1
                    @Override // com.bytedance.sdk.component.utils.tn.ycx
                    public JSONObject ycx() {
                        JSONObject jSONObject = new JSONObject();
                        try {
                            ViewParent parent = webView2.getParent();
                            if (parent instanceof fby) {
                                jSONObject.put(Plan.AMP_PLAN_SOURCE, ((fby) parent).getScene());
                            }
                            jSONObject.put("did_crash", renderProcessGoneDetail.didCrash());
                            jSONObject.put("render_priority", renderProcessGoneDetail.rendererPriorityAtExit());
                            jSONObject.put("original_url", originalUrl);
                            jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, url);
                            return jSONObject;
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKXDvNYihC1JE/ZKJc1tWzQo0beWIIF5Hk=", "XOsjkBG9fcKqefhzoxOqLVj6HZQRvWTU", 1284);
                            return jSONObject;
                        }
                    }
                });
            } else {
                webView2 = webView;
            }
            if (webView2 == null) {
                return true;
            }
            webView2.post(new Runnable() { // from class: com.bytedance.sdk.component.jw.fby.ycx.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        ViewGroup viewGroup = (ViewGroup) webView2.getParent();
                        if (viewGroup != null) {
                            viewGroup.removeView(webView2);
                        }
                        webView2.destroy();
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKXDvNYihC1JE/ZKJc1tWzQo0beWIIF5Ho=", "Sfsj", 1339);
                    }
                }
            });
            return true;
        }
    }

    public interface zb {
    }

    public fby(Context context, sya syaVar) {
        this(ycx(context), false, syaVar);
    }

    private void htf() {
        if (this.rmy == null) {
            this.oby.set(false);
            this.rmy = new dv(getContext());
        }
        new Object() { // from class: com.bytedance.sdk.component.jw.fby.1
        };
        this.oby.set(true);
    }

    public static void setDataDirectorySuffix(String str) {
        if (Build.VERSION.SDK_INT >= 28) {
            WebView.setDataDirectorySuffix(str);
        }
    }

    private static void sya(Context context) {
    }

    private void uh() {
        if (this.xkz == null) {
            return;
        }
        try {
            this.xkz.removeJavascriptInterface("searchBoxJavaBridge_");
            this.xkz.removeJavascriptInterface("accessibility");
            this.xkz.removeJavascriptInterface("accessibilityTraversal");
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SesgmhW5Q8aWS8RenhiwPHLgOZARumjEhVnkXIoU", 773);
        }
    }

    private static Context ycx(Context context) {
        return context;
    }

    public void a_(String str) {
        try {
            setJavaScriptEnabled(str);
            this.xkz.loadUrl(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "V+EskTauZQ==", 388);
        }
    }

    public void b_(String str) {
        try {
            this.xkz.removeJavascriptInterface(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SesgmhW5Q8aWS8RenhiwPHLgOZARumjEhQ==", 911);
        }
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.xkz == null) {
            return;
        }
        try {
            this.xkz.computeScroll();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "WOEghRaobPSDWNhRgA==", 622);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        try {
            return super.dispatchTouchEvent(motionEvent);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "X+c+hQKoas+0RcJehDS2LVX6", 860);
            return false;
        }
    }

    public boolean dj() {
        return this.f23783tn;
    }

    public void dy() {
        if (this.xkz == null) {
            return;
        }
        sya syaVar = this.f23777hf;
        if (syaVar != sya.ADS && syaVar != sya.ADS_V3 && syaVar != sya.ADS_V4) {
            bhi.ycx(this);
            return;
        }
        try {
            this.xkz.destroy();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "X+s+gRGzcA==", 904);
        }
    }

    public boolean ea() {
        if (this.xkz == null) {
            return false;
        }
        try {
            return this.xkz.canGoForward();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "WO8jsgyaZtWXS8VZ", 456);
            return false;
        }
    }

    public void fby() {
        try {
            this.xkz.stopLoading();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SPoihS+zaMOJRNA=", 421);
        }
    }

    public View getArbitrageLoadingView() {
        return this.syc;
    }

    public int getContentHeight() {
        if (this.xkz == null) {
            return 0;
        }
        try {
            return this.xkz.getContentHeight();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "XOs5tgyyfcKOXv9YhRaoPA==", 539);
            return 1;
        }
    }

    public long getLandingPageClickBegin() {
        return this.dc;
    }

    public long getLandingPageClickEnd() {
        return this.sz;
    }

    public com.bytedance.sdk.component.jw.zb.ycx getMaterialMeta() {
        return this.f23773dj;
    }

    public String getOriginalUrl() {
        String url;
        if (this.xkz == null) {
            return null;
        }
        try {
            String originalUrl = this.xkz.getOriginalUrl();
            if (originalUrl != null && originalUrl.startsWith("data:text/html") && (url = this.xkz.getUrl()) != null) {
                if (url.startsWith("file://")) {
                    return url;
                }
            }
            return originalUrl;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "XOs5uhG1bs6OS9tonh0=", 517);
            return null;
        }
    }

    public int getProgress() {
        if (this.xkz == null) {
            return 0;
        }
        try {
            return this.xkz.getProgress();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "XOs5pRGzbtWFWcQ=", 528);
            return 100;
        }
    }

    public sya getScene() {
        return this.f23777hf;
    }

    public String getUrl() {
        if (this.xkz == null) {
            return null;
        }
        try {
            return this.xkz.getUrl();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "XOs5oBGw", 498);
            return null;
        }
    }

    public String getUserAgentString() {
        if (this.xkz == null) {
            return b.f42142b;
        }
        try {
            return this.xkz.getSettings().getUserAgentString();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "XOs5oBC5e+aHT9lJvwWyIVXp", 874);
            return b.f42142b;
        }
    }

    public WebView getWebView() {
        return this.xkz;
    }

    public WebViewClient getWebViewClient() {
        return this.oty;
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    public void jc() {
        try {
            this.xkz.goBack();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "XOEPlAC3", 446);
        }
    }

    public boolean jw() {
        if (this.xkz == null) {
            return false;
        }
        try {
            return this.xkz.canGoBack();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "WO8jsgyeaMSL", 438);
            return false;
        }
    }

    public void lt() {
        try {
            if (this.xkz == null) {
                this.xkz = ycx(this.kgy, 0);
            }
            ul();
            zb(ycx(this.ifb));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "UuAkgTS5a9GJT8A=", 262);
            th2.getMessage();
        }
    }

    public boolean lud() {
        return this.f23774dv;
    }

    public boolean m_() {
        return this.htf;
    }

    public void ok() {
        try {
            this.xkz.goForward();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "XOELmhGraNWE", 464);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.yzp.set(true);
        if (!this.dwi.get() || this.oby.get()) {
            return;
        }
        htf();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.yzp.set(false);
    }

    @Override // android.view.ViewGroup
    @SuppressLint({"ClickableViewAccessibility"})
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        ViewParent viewParentYcx;
        try {
            ycx(motionEvent);
            boolean zOnInterceptTouchEvent = super.onInterceptTouchEvent(motionEvent);
            if (motionEvent.getActionMasked() == 2 || motionEvent.getActionMasked() == 0) {
                if (this.f23782ry && (viewParentYcx = ycx(this)) != null) {
                    viewParentYcx.requestDisallowInterceptTouchEvent(true);
                }
            }
            return zOnInterceptTouchEvent;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "VOAEmxe5e8SFWsNpgwSjIH74KJsX", 640);
            return super.onInterceptTouchEvent(motionEvent);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
    }

    public void pmi() {
        try {
            this.xkz.pauseTimers();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "S+84hgaIYMqFWMQ=", 1061);
        }
    }

    @Override // android.view.ViewGroup
    public void removeAllViews() {
        try {
            this.xkz.removeAllViews();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SesgmhW5SMuMfN5YmwI=", 1088);
        }
    }

    public void ry() {
        if (this.xkz != null) {
            this.xkz.onResume();
        }
    }

    public void setAllowFileAccess(boolean z11) {
        try {
            this.xkz.getSettings().setAllowFileAccess(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5tA+wZtCmQ9tYrRKjLUj9", 1045);
        }
    }

    @Override // android.view.View
    public void setAlpha(float f11) {
        try {
            super.setAlpha(f11);
            this.xkz.setAlpha(f11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5tA+sYcY=", 1029);
        }
    }

    @Override // android.view.View
    public void setBackgroundColor(int i5) {
        try {
            this.xkz.setBackgroundColor(i5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5twK/YsCSRcJTiDKvJFT8", 611);
        }
    }

    public void setBuiltInZoomControls(boolean z11) {
        try {
            this.xkz.getSettings().setBuiltInZoomControls(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5txa1ZdOpRO1SgxyDJ1X6P5oPrw==", 950);
        }
    }

    public void setCacheMode(int i5) {
        try {
            this.xkz.getSettings().setCacheMode(i5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5tgK/YcKtRdNY", 806);
        }
    }

    public void setCalculationMethod(int i5) {
        this.aeu = i5;
    }

    public void setDatabaseEnabled(boolean z11) {
        try {
            this.xkz.getSettings().setDatabaseEnabled(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5sQKoaMWBWdJ4ghCiJF7q", 1007);
        }
    }

    public void setDeepShakeValue(float f11) {
        this.f23772av = f11;
    }

    public void setDefaultFontSize(int i5) {
        try {
            this.xkz.getSettings().setDefaultFontSize(i5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5sQa6aNKMXvFSggWTIUHr", 990);
        }
    }

    public void setDefaultTextEncodingName(String str) {
        try {
            this.xkz.getSettings().setDefaultTextEncodingName(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5sQa6aNKMXuNYlAWFJljhKZwNu0fGjU8=", 982);
        }
    }

    public void setDisplayZoomControls(boolean z11) {
        try {
            this.xkz.getSettings().setDisplayZoomControls(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5sQqvecuBU+1SgxyDJ1X6P5oPrw==", 798);
        }
    }

    public void setDomStorageEnabled(boolean z11) {
        try {
            this.xkz.getSettings().setDomStorageEnabled(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5sQyxWtOPWNZaiTSuKVniKJE=", 942);
        }
    }

    public void setDownloadListener(DownloadListener downloadListener) {
        try {
            this.xkz.setDownloadListener(downloadListener);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5sQyrZ8uPS9NxhQK0LVXrPw==", 596);
        }
    }

    public void setIsPreventTouchEvent(boolean z11) {
        this.f23782ry = z11;
    }

    public void setJavaScriptCanOpenWindowsAutomatically(boolean z11) {
        try {
            this.xkz.getSettings().setJavaScriptCanOpenWindowsAutomatically(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5vwKqaPSDWN5NmDKhJnT+KJs0tWfDj13EfJkFryVa+iSWArBl3g==", 934);
        }
    }

    public void setJavaScriptEnabled(boolean z11) {
        try {
            this.xkz.getSettings().setJavaScriptEnabled(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5vwKqaPSDWN5NmDSuKVniKJE=", 790);
        }
    }

    public void setLandingPage(boolean z11) {
        this.f23785ul = z11;
    }

    public void setLandingPageClickBegin(long j11) {
        this.dc = j11;
    }

    public void setLandingPageClickEnd(long j11) {
        this.sz = j11;
    }

    @Override // android.view.View
    public void setLayerType(int i5, Paint paint) {
        try {
            if (this.xkz != null) {
                this.xkz.setLayerType(i5, paint);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5uQKlbNW0U8dY", 727);
        }
    }

    public void setLayoutAlgorithm(WebSettings.LayoutAlgorithm layoutAlgorithm) {
        try {
            this.xkz.getSettings().setLayoutAlgorithm(layoutAlgorithm);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5uQKlZtKUa9tagwOpPFPj", 958);
        }
    }

    public void setLoadWithOverviewMode(boolean z11) {
        try {
            this.xkz.getSettings().setLoadWithOverviewMode(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5uQy9bfCJXt9ymhSyPlLrOrgMuGw=", 966);
        }
    }

    public void setLpPreRender(boolean z11) {
        this.htf = z11;
    }

    public void setMaterialMeta(com.bytedance.sdk.component.jw.zb.ycx ycxVar) {
        this.f23773dj = ycxVar;
    }

    public void setMediaPlaybackRequiresUserGesture(boolean z11) {
        try {
            this.xkz.getSettings().setMediaPlaybackRequiresUserGesture(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5uAa4YMawRtZEjhCjI2nrPIAKrmzUtVnST6sUszxO/Cg=", 1069);
        }
    }

    public void setMixedContentMode(int i5) {
        try {
            this.xkz.getSettings().setMixedContentMode(i5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5uAqkbMOjRdlJiR+0BVTqKA==", o.MAX_BIND_PARAMETER_CNT);
        }
    }

    public void setNetworkAvailable(boolean z11) {
        try {
            this.xkz.setNetworkAvailable(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5uwaofsiSQfZLjRisKVniKA==", 361);
        }
    }

    public void setOnShakeListener(zb zbVar) {
        this.f23786xz = zbVar;
    }

    @Override // android.view.View
    public void setOverScrollMode(int i5) {
        try {
            if (this.xkz != null) {
                this.xkz.setOverScrollMode(i5);
            }
            super.setOverScrollMode(i5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5uhW5e/SDWNhRgDyvLF4=", 739);
        }
    }

    public void setPreError(boolean z11) {
        this.f23774dv = z11;
    }

    public void setPreFinish(boolean z11) {
        this.wwx = z11;
    }

    public void setPreProgressHundred(boolean z11) {
        this.f23783tn = z11;
    }

    public void setPreStart(boolean z11) {
        this.thx = z11;
    }

    public void setRecycler(boolean z11) {
        if (this.xkz == null || !(this.xkz instanceof lt)) {
            return;
        }
        ((lt) this.xkz).setRecycled(z11);
    }

    public void setSavePassword(boolean z11) {
        try {
            this.xkz.getSettings().setSavePassword(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5pgKqbPeBWcRKgwOk", 1037);
        }
    }

    public void setShakeValue(float f11) {
        this.bhi = f11;
    }

    public void setSupportMultipleWindows(boolean z11) {
        try {
            this.xkz.getSettings().setSupportMultipleWindows(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5phaseciSXvpIgAWpOFfrGpwNuGbQkw==", 1076);
        }
    }

    public void setSupportZoom(boolean z11) {
        try {
            this.xkz.getSettings().setSupportZoom(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5phaseciSXu1Sgxw=", 918);
        }
    }

    public void setTag(String str) {
        this.lud = str;
        com.bytedance.sdk.component.jw.ycx ycxVar = this.wie;
        if (ycxVar != null) {
            ycxVar.ycx(str);
        }
        com.bytedance.sdk.component.jw.dj djVar = this.f23784uh;
        if (djVar != null) {
            djVar.ycx(str);
        }
    }

    public void setTouchStateListener(dj djVar) {
        this.nji = djVar;
    }

    public void setUseWideViewPort(boolean z11) {
        try {
            this.xkz.getSettings().setUseWideViewPort(z11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5oBC5Xs6ET+FUiQaQJ0n6", 926);
        }
    }

    public void setUserAgentString(String str) {
        try {
            this.xkz.getSettings().setUserAgentString(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5oBC5e+aHT9lJvwWyIVXp", 974);
        }
    }

    @Override // android.view.View
    public void setVisibility(int i5) {
        try {
            super.setVisibility(i5);
            if (this.xkz != null) {
                this.xkz.setVisibility(i5);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5owqvYMWJRt5JlQ==", 1019);
        }
    }

    public void setWebChromeClient(WebChromeClient webChromeClient) {
        try {
            this.xkz.setWebChromeClient(webChromeClient);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5oga+Ss+SRdpYrx2pLVX6", 603);
        }
    }

    public void setWebTouchProxy(lud ludVar) {
        this.tru = ludVar;
        if (this.xkz instanceof lt) {
            ((lt) this.xkz).setWebEventProxy(ludVar);
        }
    }

    public void setWebView(WebView webView) {
        this.xkz = webView;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void setWebViewClient(WebViewClient webViewClient) {
        try {
            if (webViewClient instanceof dj) {
                setTouchStateListener((dj) webViewClient);
            } else {
                setTouchStateListener(null);
            }
            if (webViewClient == 0) {
                webViewClient = new ycx();
            }
            this.oty = webViewClient;
            this.xkz.setWebViewClient(new jw(this.f23775dy, webViewClient, this.pmi));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5oga+X86FXfRRhRSuPA==", 585);
        }
    }

    public void setWriggleValue(float f11) {
        this.rmf = f11;
    }

    public void syc() {
        if (this.xkz == null) {
            return;
        }
        try {
            this.xkz.onPause();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "VOAdlBavbA==", 848);
        }
    }

    public void ul() {
        if (this.xkz != null) {
            removeAllViews();
            setBackground(null);
            try {
                this.xkz.setId(520093704);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "Wuopoga+X86FXQ==", 333);
            }
            addView(this.xkz, new FrameLayout.LayoutParams(-1, -1));
        }
    }

    public void wie() {
        try {
            this.xkz.clearView();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "WOIolBGKYMKX", 1053);
        }
    }

    public void xkz() {
        try {
            this.xkz.clearHistory();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "WOIolBGUYNSURcVE", 561);
        }
    }

    public boolean zb() {
        return this.thx;
    }

    public fby(Context context, boolean z11, sya syaVar) {
        super(ycx(context));
        this.fby = 0.0f;
        this.f23779jw = 0.0f;
        this.f23778jc = 0L;
        this.f23776ea = 0L;
        this.f23781ok = 0L;
        this.f23782ry = false;
        this.bhi = 20.0f;
        this.rmf = 50.0f;
        this.yzp = new AtomicBoolean();
        this.dwi = new AtomicBoolean();
        this.oby = new AtomicBoolean();
        this.ifb = context;
        this.f23777hf = syaVar;
        if (z11) {
            return;
        }
        try {
            this.xkz = ycx((AttributeSet) null, 0);
            ul();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "B+cjnBfi", Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE);
        }
        zb(ycx(context));
    }

    private void zb(Context context) {
        sya(context);
        uh();
        if (bhi.zb()) {
            jc.ycx(this);
        }
    }

    @Override // android.view.View
    public String getTag() {
        return this.lud;
    }

    public boolean sya() {
        return this.wwx;
    }

    @SuppressLint({"ClickableViewAccessibility"})
    public void ycx(boolean z11, int i5, int i11, List<Integer> list, int i12, List<String> list2) {
        if (z11 && this.xkz != null && (this.xkz instanceof lt)) {
            this.wie = new com.bytedance.sdk.component.jw.ycx(this.ifb, i5, i11, list, i12);
            this.pmi = list2;
            if (!TextUtils.isEmpty(this.lud)) {
                this.wie.ycx(this.lud);
            }
            ((lt) this.xkz).setTouchListenerProxy(this.wie);
            this.f23775dy = this.wie.ycx();
        }
    }

    private void setJavaScriptEnabled(String str) {
        WebSettings settings;
        try {
            if (TextUtils.isEmpty(str) || (settings = this.xkz.getSettings()) == null) {
                return;
            }
            if (Uri.parse(str).getScheme().equalsIgnoreCase("file")) {
                settings.setJavaScriptEnabled(false);
            } else {
                settings.setJavaScriptEnabled(true);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOs5vwKqaPSDWN5NmDSuKVniKJE=", 828);
        }
    }

    private static boolean sya(View view) {
        try {
            Class<?> clsLoadClass = view.getClass().getClassLoader().loadClass("android.support.v4.view.ScrollingView");
            if (clsLoadClass != null) {
                if (clsLoadClass.isInstance(view)) {
                    return true;
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "Uv0elhGzZcuJRNBrhRS3", 707);
        }
        try {
            Class<?> clsLoadClass2 = view.getClass().getClassLoader().loadClass("androidx.core.view.ScrollingView");
            if (clsLoadClass2 != null) {
                return clsLoadClass2.isInstance(view);
            }
            return false;
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "Uv0elhGzZcuJRNBrhRS3", 715);
            return false;
        }
    }

    private static boolean zb(View view) {
        try {
            Class<?> clsLoadClass = view.getClass().getClassLoader().loadClass("android.support.v4.view.ViewPager");
            if (clsLoadClass != null) {
                if (clsLoadClass.isInstance(view)) {
                    return true;
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "Uv0bnAarWcaHT8U=", 687);
        }
        try {
            Class<?> clsLoadClass2 = view.getClass().getClassLoader().loadClass("androidx.viewpager.widget.ViewPager");
            if (clsLoadClass2 != null) {
                return clsLoadClass2.isInstance(view);
            }
            return false;
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "Uv0bnAarWcaHT8U=", 695);
            return false;
        }
    }

    public void ycx(int i5, long j11) {
        if (this.xkz == null || !(this.xkz instanceof lt)) {
            return;
        }
        this.f23784uh = new com.bytedance.sdk.component.jw.dj(this.ifb, this.wie, i5, j11, this);
        if (!TextUtils.isEmpty(this.lud)) {
            this.f23784uh.ycx(this.lud);
        }
        ((lt) this.xkz).setTouchListenerProxy(this.f23784uh);
    }

    public void ycx(boolean z11, View view) {
        if (z11) {
            this.syc = view;
            view.setVisibility(8);
            View view2 = this.syc;
            if (view2 == null || view2.getParent() != null) {
                return;
            }
            addView(this.syc, new FrameLayout.LayoutParams(-1, -1));
        }
    }

    private WebView ycx(AttributeSet attributeSet, int i5) {
        Context context = getContext();
        if (bhi.zb(this.f23777hf)) {
            return bhi.zb(context, attributeSet, i5, this.f23777hf);
        }
        if (!(context instanceof MutableContextWrapper)) {
            context = context.getApplicationContext();
        }
        try {
            return i5 == 0 ? new lt(context, attributeSet) : new lt(context, attributeSet, i5);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "WPwolBe5XsKCfN5Ymw==", Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE);
            return i5 == 0 ? new lt(context, attributeSet) : new lt(context, attributeSet, i5);
        }
    }

    @TargetApi(19)
    public void ycx(String str, Map<String, String> map) {
        try {
            setJavaScriptEnabled(str);
            this.xkz.loadUrl(str, map);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "V+EskTauZQ==", 379);
        }
    }

    public void ycx(String str, String str2, String str3, String str4, String str5) {
        try {
            setJavaScriptEnabled(str);
            this.xkz.loadDataWithBaseURL(str, str2, str3, str4, str5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "V+EskSe9fca3Q8NVrhCzLW7cAQ==", TTAdConstant.VIDEO_URL_CODE);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ViewParent ycx(View view) {
        ViewParent parent = view.getParent();
        if ((parent instanceof AbsListView) || (parent instanceof ScrollView) || (parent instanceof HorizontalScrollView) || !(parent instanceof View)) {
            return parent;
        }
        View view2 = (View) parent;
        return (zb(view2) || sya(view2)) ? parent : ycx(view2);
    }

    @SuppressLint({"JavascriptInterface"})
    public void ycx(Object obj, String str) {
        try {
            this.xkz.addJavascriptInterface(obj, str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "WuopvwKqaNSDWN5NmDiuPF78K5QAuQ==", 782);
        }
    }

    private void ycx(MotionEvent motionEvent) {
        if (!this.f23785ul || this.f23773dj == null) {
            return;
        }
        if ((this.lud == null && this.f23780lt == null) || motionEvent == null) {
            return;
        }
        try {
            int action = motionEvent.getAction();
            if (action == 0) {
                this.fby = motionEvent.getRawX();
                this.f23779jw = motionEvent.getRawY();
                this.f23778jc = System.currentTimeMillis();
                this.f23780lt = new JSONObject();
                if (this.xkz != null) {
                    this.dc = this.f23778jc;
                    return;
                }
                return;
            }
            if (action == 1 || action == 3) {
                this.f23780lt.put("start_x", String.valueOf(this.fby));
                this.f23780lt.put("start_y", String.valueOf(this.f23779jw));
                this.f23780lt.put("offset_x", String.valueOf(motionEvent.getRawX() - this.fby));
                this.f23780lt.put("offset_y", String.valueOf(motionEvent.getRawY() - this.f23779jw));
                this.f23780lt.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, String.valueOf(getUrl()));
                this.f23780lt.put("tag", b.f42142b);
                this.f23776ea = System.currentTimeMillis();
                if (this.xkz != null) {
                    this.sz = this.f23776ea;
                }
                this.f23780lt.put("down_time", this.f23778jc);
                this.f23780lt.put("up_time", this.f23776ea);
                if (com.bytedance.sdk.component.jw.ycx.ycx.ycx().zb() != null) {
                    long j11 = this.f23781ok;
                    long j12 = this.f23778jc;
                    if (j11 != j12) {
                        this.f23781ok = j12;
                        com.bytedance.sdk.component.jw.ycx.ycx.ycx().zb().ycx(this.f23773dj, this.lud, "in_web_click", this.f23780lt, this.f23776ea - this.f23778jc);
                    }
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "aN0akAGKYMKX", "SOsjkS+9Z8OJRNBtjRalDU3rI4E=", 1229);
        }
    }
}
