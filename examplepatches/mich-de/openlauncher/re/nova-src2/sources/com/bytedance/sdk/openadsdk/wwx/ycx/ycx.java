package com.bytedance.sdk.openadsdk.wwx.ycx;

import android.content.Context;
import android.text.TextUtils;
import android.webkit.ConsoleMessage;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.ycx.syc;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.core.kgy;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.widget.ea;
import com.bytedance.sdk.openadsdk.core.widget.jc;
import com.bytedance.sdk.openadsdk.core.widget.ycx.lud;
import com.bytedance.sdk.openadsdk.dj.uh;
import com.bytedance.sdk.openadsdk.ry.ul;
import com.bytedance.sdk.openadsdk.utils.htf;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.wwx.fby;
import com.bytedance.sdk.openadsdk.wwx.ul;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final int f27382dj;

    /* renamed from: dv, reason: collision with root package name */
    private long f27383dv;

    /* renamed from: dy, reason: collision with root package name */
    private AtomicBoolean f27384dy;

    /* renamed from: ea, reason: collision with root package name */
    private ul f27385ea;
    private String fby;

    /* renamed from: hf, reason: collision with root package name */
    private InterfaceC0113ycx f27386hf;
    private zb htf;

    /* renamed from: jc, reason: collision with root package name */
    private fby f27387jc;

    /* renamed from: jw, reason: collision with root package name */
    private final String f27388jw;

    /* renamed from: lt, reason: collision with root package name */
    private ea f27389lt;
    private final FrameLayout lud;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f27390ok;
    private StringBuilder oty;
    private jc pmi;

    /* renamed from: ry, reason: collision with root package name */
    private volatile boolean f27391ry;
    private final tn sya;
    private int syc;
    private boolean thx;

    /* renamed from: tn, reason: collision with root package name */
    private int f27392tn;

    /* renamed from: uh, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.sya.ycx f27393uh;

    /* renamed from: ul, reason: collision with root package name */
    private kgy f27394ul;
    private AtomicBoolean wie;
    private int wwx;
    private volatile boolean xkz;
    protected com.bytedance.sdk.component.jw.fby ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f27395zb;

    /* renamed from: com.bytedance.sdk.openadsdk.wwx.ycx.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0113ycx {
        void ycx(int i5);
    }

    public interface zb {
        void ycx();
    }

    public ycx(Context context, tn tnVar, int i5, boolean z11, FrameLayout frameLayout) {
        this(context, tnVar, i5, z11, frameLayout, false);
    }

    public ycx(Context context, tn tnVar, int i5, boolean z11, FrameLayout frameLayout, boolean z12) {
        this(context, tnVar, i5, z11, frameLayout, z12, 0);
    }

    private void fby() {
        lud ludVar = new lud(pmi.ycx(), this.f27394ul, this.sya.m147if(), null, true) { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.5
            @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.lud, android.webkit.WebViewClient
            public void onPageFinished(WebView webView, String str) throws JSONException {
                super.onPageFinished(webView, str);
                if (ycx.this.f27387jc != null) {
                    ycx.this.f27387jc.jw(str);
                }
                if (ycx.this.f27390ok) {
                    ycx.this.ycx(0, 0);
                    com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), ycx.this.sya, ycx.this.fby, "py_loading_success");
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.lud, android.webkit.WebViewClient
            public void onReceivedError(WebView webView, int i5, String str, String str2) {
                super.onReceivedError(webView, i5, str, str2);
                ycx.this.f27390ok = false;
                if (ycx.this.f27387jc != null) {
                    ycx.this.f27387jc.lt(com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(ycx.this.sya));
                    ycx.this.f27387jc.ycx(i5, str, str2);
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.lud, android.webkit.WebViewClient
            public void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
                super.onReceivedHttpError(webView, webResourceRequest, webResourceResponse);
                if (webResourceRequest.isForMainFrame()) {
                    ycx.this.f27390ok = false;
                    if (ycx.this.f27387jc != null) {
                        ycx.this.f27387jc.lt(com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(ycx.this.sya));
                        ycx.this.f27387jc.ycx(webResourceRequest.isForMainFrame(), webResourceRequest.getUrl().toString(), webResourceResponse.getStatusCode());
                    }
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.lud, android.webkit.WebViewClient
            public WebResourceResponse shouldInterceptRequest(WebView webView, String str) {
                try {
                    if (ycx.this.sya.ci() != null && !TextUtils.isEmpty(ycx.this.sya.ci().f22191i)) {
                        if (ycx.this.f27387jc != null) {
                            ycx.this.f27387jc.jc(str);
                        }
                        String strOk = av.ok(ycx.this.sya);
                        WebResourceResponse webResourceResponseYcx = com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(ycx.this.sya.ci().f22191i, strOk, str);
                        if (webResourceResponseYcx == null) {
                            return super.shouldInterceptRequest(webView, str);
                        }
                        if (ycx.this.f27387jc != null) {
                            ycx.this.f27387jc.ea(str);
                        }
                        return webResourceResponseYcx;
                    }
                    return super.shouldInterceptRequest(webView, str);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSybA4=", "SOYigA+4QMmUT8VeiQG0Gl7/OJAQqA==", 423);
                    return super.shouldInterceptRequest(webView, str);
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.lud, android.webkit.WebViewClient
            public void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
                super.onReceivedError(webView, webResourceRequest, webResourceError);
                if (webResourceRequest.isForMainFrame()) {
                    ycx.this.f27390ok = false;
                    if (ycx.this.f27387jc == null || webResourceError == null) {
                        return;
                    }
                    ycx.this.f27387jc.lt(com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(ycx.this.sya));
                    ycx.this.f27387jc.ycx(webResourceError.getErrorCode(), String.valueOf(webResourceError.getDescription()), String.valueOf(webResourceRequest.getUrl()));
                }
            }
        };
        ludVar.ycx(this.sya);
        this.ycx.setWebViewClient(ludVar);
        this.ycx.setWebChromeClient(new com.bytedance.sdk.openadsdk.core.widget.ycx.dj(this.f27394ul) { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.6
            @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.dj, android.webkit.WebChromeClient
            public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
                return super.onConsoleMessage(consoleMessage);
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.dj, android.webkit.WebChromeClient
            public void onProgressChanged(WebView webView, int i5) {
                super.onProgressChanged(webView, i5);
                if (ycx.this.f27389lt == null || ycx.this.f27389lt.getVisibility() != 0) {
                    return;
                }
                ycx.this.f27389lt.setProgress(i5);
            }
        });
        com.bytedance.sdk.component.jw.ul.ycx(this.f27395zb).ycx(false).zb(false).ycx(this.ycx.getWebView());
        com.bytedance.sdk.component.jw.fby fbyVar = this.ycx;
        fbyVar.setUserAgentString(htf.ycx(fbyVar.getWebView(), BuildConfig.VERSION_CODE));
        this.ycx.setMixedContentMode(0);
    }

    private void sya(boolean z11) {
        syc sycVarSya;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("cid", this.sya.m147if());
            jSONObject.put("log_extra", this.sya.pks());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSy", "UuAkgTOwaN6BSNtYvB21L1Lg", Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE);
        }
        if (com.bytedance.sdk.openadsdk.core.jc.zb().wie()) {
            com.bytedance.sdk.openadsdk.wwx.ul.ycx(new ul.ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.1
            });
        }
        fby fbyVarYcx = fby.ycx(pmi.ycx(), this.ycx.getWebView(), new com.bytedance.sdk.openadsdk.wwx.sya() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.2
            @Override // com.bytedance.sdk.openadsdk.wwx.sya
            public void ycx(String str, JSONObject jSONObject2) {
                if (ycx.this.f27394ul != null) {
                    ycx.this.f27394ul.ycx(str, jSONObject2);
                }
            }
        }, new com.bytedance.sdk.openadsdk.wwx.ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.3
            @Override // com.bytedance.sdk.openadsdk.wwx.ycx
            public void sya() {
                if (ycx.this.f27394ul.dy() != null) {
                    ycx.this.f27394ul.dy().ycx(true);
                }
            }

            @Override // com.bytedance.sdk.openadsdk.wwx.ycx
            public com.bytedance.sdk.openadsdk.wwx.dj ycx() {
                String strFby = com.bytedance.sdk.openadsdk.common.sya.fby();
                strFby.getClass();
                switch (strFby) {
                    case "2g":
                        return com.bytedance.sdk.openadsdk.wwx.dj.TYPE_2G;
                    case "3g":
                        return com.bytedance.sdk.openadsdk.wwx.dj.TYPE_3G;
                    case "4g":
                        return com.bytedance.sdk.openadsdk.wwx.dj.TYPE_4G;
                    case "5g":
                        return com.bytedance.sdk.openadsdk.wwx.dj.TYPE_5G;
                    case "wifi":
                        return com.bytedance.sdk.openadsdk.wwx.dj.TYPE_WIFI;
                    default:
                        return com.bytedance.sdk.openadsdk.wwx.dj.TYPE_UNKNOWN;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.wwx.ycx
            public void zb() {
                ycx.this.f27394ul.lt(true);
                if (ycx.this.f27385ea != null) {
                    ycx.this.f27385ea.ycx();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.wwx.ycx
            public void ycx(final JSONObject jSONObject2) {
                if (jSONObject2 == null) {
                    jSONObject2 = new JSONObject();
                }
                com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), ycx.this.sya, ycx.this.fby, "playable_track", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.3.1
                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject sya() {
                        return jSONObject2;
                    }

                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject ycx() throws JSONException {
                        try {
                            JSONObject jSONObject3 = new JSONObject();
                            jSONObject3.put("is_new_playable", 1);
                            if (!ycx.this.sya.fh()) {
                                return jSONObject3;
                            }
                            jSONObject3.put("is_pre_render", 1);
                            return jSONObject3;
                        } catch (JSONException e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSybAiqfA==", "XOs5pQK7Q9SPRPNcmBA=", Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE);
                            com.bytedance.sdk.component.utils.htf.sya("PlayableManager", e3.getMessage());
                            return null;
                        }
                    }
                });
            }

            @Override // com.bytedance.sdk.openadsdk.wwx.ycx
            public void ycx(int i5, String str) throws JSONException {
                ycx.this.f27390ok = false;
                if (i5 == 2 || i5 == 3 || i5 == 4) {
                    ycx.this.ycx(2, i5);
                } else if (i5 == 5) {
                    ycx.this.ycx(3, i5);
                } else {
                    ycx.this.ycx(1, 0);
                }
            }
        });
        this.f27387jc = fbyVarYcx;
        fbyVarYcx.ul(this.f27388jw).lud(com.bytedance.sdk.openadsdk.common.sya.ycx(pmi.ycx())).zb(com.bytedance.sdk.openadsdk.common.sya.ul()).ycx(com.bytedance.sdk.openadsdk.common.sya.ycx()).dj(com.bytedance.sdk.openadsdk.common.sya.lt()).sya(jSONObject).sya(av.jc(this.sya)).dj(true).ycx(z11).sya(false).ycx(av.wie(this.sya)).zb(av.wie(this.sya)).ycx("sdkEdition", com.bytedance.sdk.openadsdk.common.sya.sya()).lud(av.lt(this.sya)).lt(this.fby);
        this.f27387jc.ycx(com.bytedance.sdk.openadsdk.wwx.lud.zb(this.f27395zb));
        Set<String> setEa = this.f27387jc.ea();
        final WeakReference weakReference = new WeakReference(this.f27387jc);
        for (String str : setEa) {
            if (!"subscribe_app_ad".equals(str) && !"adInfo".equals(str) && !"webview_time_track".equals(str) && !"download_app_ad".equals(str) && (sycVarSya = this.f27394ul.sya()) != null) {
                sycVarSya.ycx(str, new com.bytedance.sdk.component.ycx.dj<JSONObject, JSONObject>() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.4
                    @Override // com.bytedance.sdk.component.ycx.dj
                    public JSONObject ycx(String str2, JSONObject jSONObject2, com.bytedance.sdk.component.ycx.lud ludVar) {
                        try {
                            fby fbyVar = (fby) weakReference.get();
                            if (fbyVar == null) {
                                return null;
                            }
                            return fbyVar.dj(ycx(), jSONObject2);
                        } catch (Throwable th3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSybA8=", "UuA7mgi5", 377);
                            return null;
                        }
                    }
                });
            }
        }
    }

    public void dj() {
        fby fbyVar = this.f27387jc;
        if (fbyVar != null) {
            fbyVar.ifb();
        }
        com.bytedance.sdk.component.jw.fby fbyVar2 = this.ycx;
        if (fbyVar2 != null) {
            fbyVar2.dy();
        }
        kgy kgyVar = this.f27394ul;
        if (kgyVar != null) {
            kgyVar.xkz();
        }
        this.f27383dv = System.currentTimeMillis();
        this.oty = new StringBuilder();
        try {
            for (StackTraceElement stackTraceElement : Thread.currentThread().getStackTrace()) {
                StringBuilder sb2 = this.oty;
                sb2.append(stackTraceElement);
                sb2.append("\n");
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSy", "VOAJkBCoe8iZ", 756);
            com.bytedance.sdk.component.utils.htf.ycx("PlayableManager", "onDestroy() error", th2);
        }
        this.ycx = null;
    }

    public boolean lt() {
        kgy kgyVar = this.f27394ul;
        if (kgyVar != null) {
            return kgyVar.ul();
        }
        return false;
    }

    public boolean lud() {
        return this.f27391ry;
    }

    public kgy ul() {
        return this.f27394ul;
    }

    public void zb() throws JSONException {
        fby fbyVar;
        if (!this.f27384dy.get() || (fbyVar = this.f27387jc) == null) {
            return;
        }
        fbyVar.sya(true);
    }

    public ycx(Context context, tn tnVar, int i5, boolean z11, FrameLayout frameLayout, boolean z12, int i11) throws JSONException {
        this.f27390ok = true;
        this.f27384dy = new AtomicBoolean(false);
        this.wie = new AtomicBoolean(false);
        this.f27392tn = 0;
        this.f27383dv = 0L;
        this.f27395zb = context;
        this.sya = tnVar;
        this.wwx = i11;
        if (tnVar != null && tnVar.dj() != null && tnVar.dj().lud() != null) {
            this.f27392tn = tnVar.dj().lud().size();
        }
        this.f27382dj = i5;
        String strSya = oby.sya(tnVar.qn().getDurationSlotType());
        this.fby = strSya;
        int iYcx = oby.ycx(strSya);
        this.thx = z12;
        if (z12) {
            this.fby = oby.zb(iYcx);
        }
        this.f27388jw = av.ok(tnVar);
        this.lud = frameLayout;
        ycx(frameLayout);
        ycx(iYcx);
        sya(z11);
        fby();
    }

    public void ycx(InterfaceC0113ycx interfaceC0113ycx) {
        this.f27386hf = interfaceC0113ycx;
    }

    private void ycx(FrameLayout frameLayout) {
        com.bytedance.sdk.component.jw.fby fbyVar = new com.bytedance.sdk.component.jw.fby(this.f27395zb, true, fby.sya.PLAYABLE);
        this.ycx = fbyVar;
        fbyVar.lt();
        this.ycx.setLayerType(2, null);
        this.ycx.setVisibility(4);
        this.ycx.setBackgroundColor(-16777216);
        this.ycx.setEnabled(true);
        this.ycx.setTag(this.fby);
        this.ycx.setMaterialMeta(this.sya.gmd());
        this.ycx.setLandingPage(true);
        frameLayout.addView(this.ycx, new FrameLayout.LayoutParams(-1, -1));
        jc jcVar = new jc(this.f27395zb);
        this.pmi = jcVar;
        jcVar.ycx(this.sya, this.fby, this.f27393uh, this.thx);
        frameLayout.addView(this.pmi, new FrameLayout.LayoutParams(-1, -1));
        if (this.sya.px()) {
            ea eaVar = new ea(this.f27395zb);
            this.f27389lt = eaVar;
            eaVar.zb();
            frameLayout.addView(this.f27389lt, new FrameLayout.LayoutParams(-1, -1));
        }
    }

    public void zb(boolean z11) {
        com.bytedance.sdk.openadsdk.wwx.fby fbyVar = this.f27387jc;
        if (fbyVar != null) {
            fbyVar.lud(z11);
        }
    }

    private void ycx(int i5) throws JSONException {
        HashMap map = new HashMap();
        map.put("click_scence", 3);
        this.f27394ul = new kgy(this.f27395zb);
        String strWbt = this.sya.wbt();
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("isMultiAd", this.sya.xym());
            jSONObject.put("currentIndex", this.wwx);
            jSONObject.put("totalAdCount", this.f27392tn);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSy", "UuAkgTeISMmEWNhUiD6iIl7tOQ==", 196);
        }
        this.f27394ul.zb(this.ycx).ycx(this.sya).ycx(com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(this.sya, true, jSONObject)).sya(this.sya.m147if()).dj(this.sya.pks()).zb(i5).lud(strWbt).ycx(this.ycx).zb(this.fby).ycx(map).ycx(new uh(3, this.fby, this.sya));
    }

    public void sya() throws JSONException {
        com.bytedance.sdk.openadsdk.wwx.fby fbyVar;
        if (!this.f27384dy.get() || (fbyVar = this.f27387jc) == null) {
            return;
        }
        fbyVar.sya(false);
    }

    public void ycx(boolean z11, com.bytedance.sdk.openadsdk.ry.ul ulVar) {
        this.f27385ea = ulVar;
        this.f27387jc.zb(z11);
        com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().zb(this.sya);
        this.ycx.a_(this.f27388jw);
        com.bytedance.sdk.openadsdk.wwx.fby fbyVar = this.f27387jc;
        if (fbyVar != null) {
            fbyVar.lt(com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(this.sya));
            this.f27387jc.fby(this.f27388jw);
        }
    }

    public void ycx() throws JSONException {
        ea eaVar;
        final boolean z11 = true;
        if (this.f27384dy.getAndSet(true)) {
            return;
        }
        FrameLayout frameLayout = this.lud;
        if (frameLayout != null) {
            frameLayout.setVisibility(0);
        }
        if (!this.xkz && (eaVar = this.f27389lt) != null) {
            eaVar.zb(this.sya, this.f27382dj);
            com.bytedance.sdk.openadsdk.wwx.fby fbyVar = this.f27387jc;
            if (fbyVar != null) {
                fbyVar.rmf();
            }
        } else {
            this.f27387jc.sya(true);
            kgy kgyVar = this.f27394ul;
            if (kgyVar != null && kgyVar.dy() != null) {
                this.f27394ul.dy().lud();
            }
            InterfaceC0113ycx interfaceC0113ycx = this.f27386hf;
            if (interfaceC0113ycx != null) {
                interfaceC0113ycx.ycx(this.syc);
            }
            z11 = false;
        }
        if (this.f27387jc != null) {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), this.sya, this.fby, "playable_track", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.7
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        jSONObject.put("playable_event", "start_show_plb");
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSybAw=", "XOs5tAeZcdOSS/NcmBA=", 571);
                        return jSONObject;
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject ycx() {
                    try {
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("webview_state", ycx.this.f27387jc.oby());
                        jSONObject.put("has_loading", z11);
                        jSONObject.put("is_new_playable", 1);
                        return jSONObject;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSybAw=", "XOs5pQK7Q9SPRPNcmBA=", 584);
                        return null;
                    }
                }
            });
            this.f27387jc.lt(com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(this.sya));
        }
        com.bytedance.sdk.component.jw.fby fbyVar2 = this.ycx;
        if (fbyVar2 != null) {
            fbyVar2.setVisibility(0);
        } else {
            com.bytedance.sdk.openadsdk.dy.dj.ycx("plb_npe_crash", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.8
                @Override // com.bytedance.sdk.openadsdk.dy.zb
                public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("crash_ts", System.currentTimeMillis());
                    if (ycx.this.oty != null) {
                        jSONObject.put("destroy_stack_trace", ycx.this.oty.toString());
                    }
                    jSONObject.put("destroy_ts", ycx.this.f27383dv);
                    return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("plb_npe_crash").zb(jSONObject.toString());
                }
            });
        }
    }

    public void ycx(final int i5, final int i11) throws JSONException {
        InterfaceC0113ycx interfaceC0113ycx;
        com.bytedance.sdk.openadsdk.wwx.fby fbyVar;
        zb zbVar;
        if (this.xkz) {
            return;
        }
        this.xkz = true;
        this.syc = i5;
        if (i5 == 2) {
            this.f27391ry = true;
            this.f27387jc.ycx(3);
        } else if (i5 == 1) {
            this.f27391ry = true;
            this.f27387jc.ycx(2);
        } else if (i5 == 3) {
            this.f27391ry = true;
            this.f27387jc.ycx(4);
        } else if (i5 == 0) {
            this.f27387jc.ycx(1);
        }
        if (this.f27391ry && (zbVar = this.htf) != null) {
            zbVar.ycx();
        }
        if (this.f27384dy.get() && (fbyVar = this.f27387jc) != null) {
            fbyVar.sya(true);
        }
        kgy kgyVar = this.f27394ul;
        if (kgyVar != null && kgyVar.dy() != null) {
            this.f27394ul.dy().lud();
        }
        if (!this.f27391ry && (interfaceC0113ycx = this.f27386hf) != null) {
            interfaceC0113ycx.ycx(i5);
        }
        ea eaVar = this.f27389lt;
        if (eaVar != null) {
            eaVar.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.9
                @Override // java.lang.Runnable
                public void run() {
                    if (ycx.this.f27391ry) {
                        ycx.this.pmi.setVisibility(0);
                        if (ycx.this.f27386hf != null) {
                            ycx.this.f27386hf.ycx(i5);
                        }
                        ycx.this.ycx(true);
                    }
                    ycx.this.f27387jc.ul(ycx.this.f27391ry);
                    ycx.this.f27389lt.sya();
                    if (ycx.this.f27384dy.get()) {
                        com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), ycx.this.sya, ycx.this.fby, "playable_track", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.ycx.ycx.9.1
                            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                            public JSONObject sya() {
                                JSONObject jSONObject = new JSONObject();
                                try {
                                    jSONObject.put("playable_event", "remove_loading_page");
                                    return jSONObject;
                                } catch (Throwable th2) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSybAKqfA==", "XOs5tAeZcdOSS/NcmBA=", 680);
                                    return jSONObject;
                                }
                            }

                            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                            public JSONObject ycx() {
                                try {
                                    JSONObject jSONObject = new JSONObject();
                                    jSONObject.put("remove_loading_page_type", i5);
                                    jSONObject.put("remove_loading_page_reason", i11);
                                    jSONObject.put("playable_url", ycx.this.f27388jw);
                                    jSONObject.put("duration", ycx.this.f27389lt.getDisplayDuration());
                                    jSONObject.put("is_new_playable", 1);
                                    return jSONObject;
                                } catch (Throwable th2) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQTbFoyYFN0k8=", "a+IsjAK+ZcKtS9lcixSybAKqfA==", "XOs5pQK7Q9SPRPNcmBA=", 698);
                                    return null;
                                }
                            }
                        });
                    }
                }
            });
        }
    }

    public void ycx(boolean z11) {
        com.bytedance.sdk.openadsdk.wwx.fby fbyVar = this.f27387jc;
        if (fbyVar != null) {
            fbyVar.ycx(z11);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar) {
        this.f27393uh = ycxVar;
        ea eaVar = this.f27389lt;
        if (eaVar != null && eaVar.getDownloadButton() != null) {
            com.bytedance.sdk.openadsdk.core.lt.fby downloadButton = this.f27389lt.getDownloadButton();
            downloadButton.setOnClickListener(ycxVar);
            downloadButton.setOnTouchListener(ycxVar);
        }
        jc jcVar = this.pmi;
        if (jcVar != null) {
            jcVar.setClickListener(ycxVar);
        }
    }

    public void ycx(zb zbVar) {
        this.htf = zbVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar) {
        kgy kgyVar = this.f27394ul;
        if (kgyVar != null) {
            kgyVar.ycx(zbVar);
        }
    }
}
