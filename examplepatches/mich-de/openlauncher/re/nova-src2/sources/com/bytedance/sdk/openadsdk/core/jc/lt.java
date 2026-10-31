package com.bytedance.sdk.openadsdk.core.jc;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAd;
import com.bytedance.sdk.openadsdk.core.jc.sya;
import com.bytedance.sdk.openadsdk.core.yzp;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.iab.omid.library.bytedance2.adsession.FriendlyObstructionPurpose;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt extends com.bytedance.sdk.component.jw.fby implements sya.InterfaceC0065sya {

    /* renamed from: dj, reason: collision with root package name */
    protected boolean f25411dj;

    /* renamed from: dy, reason: collision with root package name */
    private long f25412dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f25413ea;
    private hf fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.model.tn f25414jc;

    /* renamed from: jw, reason: collision with root package name */
    private sya f25415jw;

    /* renamed from: lt, reason: collision with root package name */
    AtomicBoolean f25416lt;
    protected boolean lud;

    /* renamed from: ok, reason: collision with root package name */
    private int f25417ok;

    /* renamed from: ry, reason: collision with root package name */
    private List<String> f25418ry;
    private int syc;

    /* renamed from: ul, reason: collision with root package name */
    AtomicBoolean f25419ul;
    private zb xkz;

    public static class ycx extends fby.ycx {
        public static final Set<String> ycx = new HashSet<String>() { // from class: com.bytedance.sdk.openadsdk.core.jc.lt.ycx.1
            {
                add(".jpeg");
                add(".png");
                add(".bmp");
                add(".gif");
                add(".jpg");
                add(".webp");
            }
        };

        /* renamed from: zb, reason: collision with root package name */
        sya.InterfaceC0065sya f25421zb;

        public ycx(sya.InterfaceC0065sya interfaceC0065sya) {
            this.f25421zb = interfaceC0065sya;
        }

        private void ycx(String str) {
            int iLastIndexOf;
            sya.InterfaceC0065sya interfaceC0065sya;
            if (!TextUtils.isEmpty(str) && (iLastIndexOf = str.lastIndexOf(".")) > 0) {
                if (!ycx.contains(str.substring(iLastIndexOf).toLowerCase()) || (interfaceC0065sya = this.f25421zb) == null) {
                    return;
                }
                interfaceC0065sya.zb(str);
            }
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView webView, String str) {
            super.onPageFinished(webView, str);
            sya.InterfaceC0065sya interfaceC0065sya = this.f25421zb;
            if (interfaceC0065sya != null) {
                interfaceC0065sya.ycx();
            }
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, int i5, String str, String str2) {
            super.onReceivedError(webView, i5, str, str2);
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
            super.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
            if (webResourceRequest == null || webResourceResponse == null || webResourceRequest.getUrl() == null) {
                return;
            }
            if (webResourceRequest.isForMainFrame()) {
                ycx(webResourceRequest.getUrl().toString(), webResourceResponse.getStatusCode(), b.f42142b);
            }
            ycx(webResourceRequest.getUrl().toString());
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            this.f25421zb.ycx(str);
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
            super.onReceivedError(webView, webResourceRequest, webResourceError);
            if (webResourceRequest == null || webResourceRequest.getUrl() == null) {
                return;
            }
            ycx(webResourceRequest.getUrl().toString());
        }

        private void ycx(String str, int i5, String str2) {
            sya.InterfaceC0065sya interfaceC0065sya = this.f25421zb;
            if (interfaceC0065sya != null) {
                interfaceC0065sya.ycx(106, i5);
            }
        }
    }

    public interface zb {
        View ycx();

        void ycx(int i5, int i11);

        void ycx(View view, int i5);

        void zb();
    }

    public lt(Context context) {
        super(context, fby.sya.DSP);
        this.f25411dj = false;
        this.lud = false;
        this.f25416lt = new AtomicBoolean(false);
        this.f25419ul = new AtomicBoolean(false);
        this.f25417ok = 0;
    }

    private void thx() {
        if (this.f25418ry == null) {
            com.bytedance.sdk.openadsdk.dj.sya.zb(this.f25414jc, this.f25413ea, "dsp_html_success_url", (JSONObject) null);
        } else {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(new com.bytedance.sdk.component.fby.zb.sya("dsp_html_error_url") { // from class: com.bytedance.sdk.openadsdk.core.jc.lt.3
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    try {
                        if (lt.this.f25418ry != null && lt.this.f25419ul.compareAndSet(false, true)) {
                            JSONObject jSONObject = new JSONObject();
                            JSONArray jSONArray = new JSONArray();
                            Iterator it = lt.this.f25418ry.iterator();
                            while (it.hasNext()) {
                                jSONArray.put((String) it.next());
                            }
                            jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, jSONArray);
                            com.bytedance.sdk.openadsdk.dj.sya.zb(lt.this.f25414jc, lt.this.f25413ea, "dsp_html_error_url", jSONObject);
                            lt.this.f25418ry = null;
                        }
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "f/09vRexZfCFSOFUiQbkew==", "Sfsj", PerAppFeatureCatalog.MAX_TOOLS);
                    }
                }
            });
        }
    }

    @Override // com.bytedance.sdk.component.jw.fby
    public void dy() {
        this.f25415jw.zb();
        super.dy();
    }

    public void htf() {
        this.f25416lt.set(false);
        String strRc = this.f25414jc.rc();
        if (TextUtils.isEmpty(strRc)) {
            return;
        }
        String strYcx = com.bytedance.sdk.openadsdk.core.xkz.lud.ycx(strRc);
        String str = TextUtils.isEmpty(strYcx) ? strRc : strYcx;
        this.f25417ok = 0;
        ycx(null, str, "text/html", "UTF-8", null);
        this.f25412dy = SystemClock.elapsedRealtime();
    }

    @Override // com.bytedance.sdk.component.jw.fby, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f25411dj) {
            this.f25415jw.ycx(getWebView());
        }
    }

    @Override // com.bytedance.sdk.component.jw.fby, android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        this.f25415jw.ycx();
        super.onDetachedFromWindow();
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("rate", this.syc / 100.0f);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "f/09vRexZfCFSOFUiQY=", "VOAJkBe9as+FTvFPgxyXIVXqIoI=", 191);
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.f25414jc, this.f25413ea, "load_rate", jSONObject);
    }

    @Override // android.view.View
    public void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        boolean z11 = i5 == 0;
        this.lud = z11;
        this.f25415jw.ycx(z11);
    }

    public void uh() {
        zb zbVar = this.xkz;
        if (zbVar != null) {
            zbVar.zb();
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("render_duration", SystemClock.elapsedRealtime() - this.f25412dy);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "f/09vRexZfCFSOFUiQY=", "SesjkQauWtKDSdJOnw==", 259);
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.f25414jc, this.f25413ea, "render_html_success", jSONObject);
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.sya.InterfaceC0065sya
    public void zb(String str) {
        if (this.f25418ry == null) {
            this.f25418ry = new ArrayList();
        }
        this.f25418ry.add(str);
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, zb zbVar, String str) {
        this.xkz = zbVar;
        this.f25414jc = tnVar;
        this.f25413ea = str;
        this.f25415jw = new sya();
        this.fby = new hf(getContext());
        setWebViewClient(new ycx(this));
        setWebChromeClient(new WebChromeClient() { // from class: com.bytedance.sdk.openadsdk.core.jc.lt.1
            @Override // android.webkit.WebChromeClient
            public void onProgressChanged(WebView webView, int i5) {
                lt.this.syc = i5;
                super.onProgressChanged(webView, i5);
                if (i5 >= 100) {
                    lt.this.ycx();
                }
            }
        });
        com.bytedance.sdk.component.utils.jw.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.lt.2
            @Override // java.lang.Runnable
            @SuppressLint({"ClickableViewAccessibility"})
            public void run() {
                WebView webView = lt.this.getWebView();
                if (webView != null) {
                    webView.setOnTouchListener(new View.OnTouchListener() { // from class: com.bytedance.sdk.openadsdk.core.jc.lt.2.1
                        @Override // android.view.View.OnTouchListener
                        public boolean onTouch(View view, MotionEvent motionEvent) {
                            lt.this.fby.onTouchEvent(motionEvent);
                            return false;
                        }
                    });
                }
            }
        });
    }

    public static class sya {
        protected int ycx = 0;

        /* renamed from: zb, reason: collision with root package name */
        private com.bytedance.sdk.openadsdk.core.xkz.lt f25420zb = com.bytedance.sdk.openadsdk.core.xkz.lt.ycx();

        public void ycx(WebView webView) {
            if (webView != null && this.ycx == 0) {
                if (this.f25420zb == null) {
                    this.f25420zb = com.bytedance.sdk.openadsdk.core.xkz.lt.ycx();
                }
                this.f25420zb.ycx(webView);
                this.f25420zb.zb();
                this.ycx = 1;
            }
        }

        public void zb() {
            ycx();
        }

        public void ycx(boolean z11) {
            com.bytedance.sdk.openadsdk.core.xkz.lt ltVar;
            if (this.ycx == 1 && z11 && (ltVar = this.f25420zb) != null) {
                ltVar.sya();
                this.ycx = 3;
            }
        }

        public void ycx(View view, FriendlyObstructionPurpose friendlyObstructionPurpose) {
            com.bytedance.sdk.openadsdk.core.xkz.lt ltVar = this.f25420zb;
            if (ltVar != null) {
                ltVar.ycx(view, friendlyObstructionPurpose);
            }
        }

        public void ycx() {
            com.bytedance.sdk.openadsdk.core.xkz.lt ltVar;
            int i5 = this.ycx;
            if (i5 != 0 && i5 != 4 && (ltVar = this.f25420zb) != null) {
                ltVar.dj();
            }
            this.ycx = 4;
            this.f25420zb = null;
        }
    }

    public void ycx(View view, FriendlyObstructionPurpose friendlyObstructionPurpose) {
        this.f25415jw.ycx(view, friendlyObstructionPurpose);
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.sya.InterfaceC0065sya
    public void ycx(String str) {
        boolean zYcx;
        if (TextUtils.isEmpty(str) || this.f25414jc == null || !this.fby.zb()) {
            return;
        }
        int iYcx = oby.ycx(this.f25413ea);
        View viewYcx = null;
        if (!com.bytedance.sdk.component.utils.pmi.ycx(str) && (this.f25414jc.sjd() == null || TextUtils.isEmpty(this.f25414jc.sjd().ycx()))) {
            com.bytedance.sdk.openadsdk.core.model.ry ryVar = new com.bytedance.sdk.openadsdk.core.model.ry();
            ryVar.ycx(str);
            this.f25414jc.ycx(ryVar);
            str = null;
        }
        this.f25414jc.dj(true);
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f25414jc;
        if (tnVar == null || tnVar.sjd() == null || TextUtils.isEmpty(this.f25414jc.sjd().ycx())) {
            zYcx = false;
        } else {
            zYcx = yzp.ycx(getContext(), this.f25414jc, iYcx, this.f25413ea, true, (Map<String, Object>) null);
            if (!zYcx && !TextUtils.isEmpty(this.f25414jc.sjd().zb())) {
                str = this.f25414jc.sjd().zb();
                com.bytedance.sdk.openadsdk.dj.sya.ycx(this.f25414jc, this.f25413ea, "open_fallback_url", (Map<String, Object>) null);
            }
        }
        String str2 = str;
        if (!zYcx) {
            if (TextUtils.isEmpty(str2)) {
                return;
            } else {
                yzp.ycx(getContext(), this.f25414jc, iYcx, (PAGNativeAd) null, (com.bytedance.sdk.openadsdk.core.dj.ycx) null, this.f25413ea, true, str2);
            }
        }
        if (this.fby != null) {
            zb zbVar = this.xkz;
            if (zbVar != null) {
                viewYcx = zbVar.ycx();
                this.xkz.ycx(this, 2);
            }
            com.bytedance.sdk.openadsdk.core.model.ok okVarYcx = this.fby.ycx(getContext(), viewYcx);
            HashMap map = new HashMap();
            map.put("click_scence", 1);
            com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, this.f25414jc, okVarYcx, this.f25413ea, true, (Map<String, Object>) map, this.fby.zb() ? 1 : 2);
        }
        hf hfVar = this.fby;
        if (hfVar != null) {
            hfVar.ycx();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.sya.InterfaceC0065sya
    public void ycx(int i5, int i11) {
        zb zbVar = this.xkz;
        if (zbVar != null) {
            zbVar.ycx(i5, i11);
        }
        this.f25417ok = i11;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("error_code", i11);
            jSONObject.put("render_duration", SystemClock.elapsedRealtime() - this.f25412dy);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "f/09vRexZfCFSOFUiQY=", "SesjkQauT8aJRg==", 274);
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.f25414jc, this.f25413ea, "render_html_fail", jSONObject);
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.sya.InterfaceC0065sya
    public void ycx() {
        if (this.f25416lt.compareAndSet(false, true)) {
            this.f25411dj = true;
            this.f25415jw.ycx(getWebView());
            this.f25415jw.ycx(this.lud);
            uh();
            thx();
        }
    }
}
