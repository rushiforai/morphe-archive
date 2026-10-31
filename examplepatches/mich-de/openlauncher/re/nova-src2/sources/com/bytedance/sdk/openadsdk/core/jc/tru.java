package com.bytedance.sdk.openadsdk.core.jc;

import android.content.Context;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.utils.bhi;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.kgy;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.ifb;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class tru extends com.bytedance.sdk.component.adexpress.lud.ycx {

    /* renamed from: hf, reason: collision with root package name */
    private static Integer f25492hf;

    /* renamed from: dv, reason: collision with root package name */
    private final com.bytedance.sdk.component.fby.zb.sya f25493dv;

    /* renamed from: dy, reason: collision with root package name */
    protected ea f25494dy;

    /* renamed from: ea, reason: collision with root package name */
    protected String f25495ea;
    private String fby;
    private final Map<String, com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya> htf;

    /* renamed from: jc, reason: collision with root package name */
    protected Context f25496jc;

    /* renamed from: jw, reason: collision with root package name */
    private final AtomicBoolean f25497jw;

    /* renamed from: ok, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.core.model.tn f25498ok;
    private final Runnable oty;
    com.bytedance.sdk.openadsdk.utils.ycx pmi;

    /* renamed from: ry, reason: collision with root package name */
    protected JSONObject f25499ry;
    protected kgy syc;
    private com.bytedance.sdk.component.adexpress.zb.ul thx;

    /* renamed from: tn, reason: collision with root package name */
    private volatile int f25500tn;

    /* renamed from: uh, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.dj.ry f25501uh;
    protected com.bytedance.sdk.openadsdk.core.syc.dj.zb wie;
    private tn.ycx wwx;
    protected com.bytedance.sdk.openadsdk.dj.dj.lud xkz;

    public tru(Context context, com.bytedance.sdk.component.adexpress.zb.ry ryVar, com.bytedance.sdk.openadsdk.dj.dj.lud ludVar, com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        super(context, ryVar);
        this.f25497jw = new AtomicBoolean(false);
        this.htf = Collections.synchronizedMap(new HashMap());
        this.f25500tn = 0;
        this.f25493dv = new com.bytedance.sdk.component.fby.zb.sya("webviewrender_template") { // from class: com.bytedance.sdk.openadsdk.core.jc.tru.1
            @Override // java.lang.Runnable
            public void run() {
                if (((com.bytedance.sdk.component.adexpress.lud.ycx) tru.this).f23651ul.get()) {
                    return;
                }
                tru truVar = tru.this;
                truVar.f25499ry = truVar.xkz().sya();
                tru truVar2 = tru.this;
                truVar2.ycx(truVar2.f25499ry);
                tru truVar3 = tru.this;
                ea eaVar = truVar3.f25494dy;
                if (eaVar != null) {
                    eaVar.ycx(truVar3.f25499ry);
                }
                tru.this.htf();
                if (tru.this.f25500tn == 0) {
                    tru.this.dy();
                }
                com.bytedance.sdk.openadsdk.core.syc.sya().post(tru.this.oty);
            }
        };
        this.oty = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.tru.2
            @Override // java.lang.Runnable
            public void run() {
                if (((com.bytedance.sdk.component.adexpress.lud.ycx) tru.this).f23651ul.get() || tru.this.thx == null) {
                    return;
                }
                tru.this.pmi();
                tru.this.wie();
            }
        };
        if (this.lud == null) {
            return;
        }
        this.f25496jc = context;
        this.f25495ea = ryVar.dj();
        this.f25498ok = tnVar;
        this.xkz = ludVar;
        dy();
    }

    public static boolean bhi() {
        return hf() == 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dy() {
        if (this.lud.getWebView() != null && yzp.lt()) {
            thx();
        } else {
            this.f25500tn = 1;
            yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.tru.3
                @Override // java.lang.Runnable
                public void run() {
                    tru.this.thx();
                }
            });
        }
    }

    public static int hf() {
        if (f25492hf == null) {
            int i5 = 2;
            int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("webview_ads_refresh", 2);
            if (iYcx >= 0 && iYcx <= 2) {
                i5 = iYcx;
            }
            f25492hf = Integer.valueOf(i5);
        }
        return f25492hf.intValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void htf() {
        if (this.f25497jw.get() || this.f25499ry == null || !syc.ycx(this.f25498ok) || this.sya || !this.f25497jw.compareAndSet(false, true)) {
            return;
        }
        syc.ycx(this.f25498ok, this.f25499ry);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void thx() {
        com.bytedance.sdk.component.jw.fby fbyVar = this.lud;
        if (fbyVar == null || fbyVar.getWebView() == null || this.f25500tn == 2) {
            return;
        }
        String strYcx = ycx(this.f25498ok);
        this.fby = strYcx;
        ycx(ifb.ycx(strYcx));
        tn();
        kgy kgyVar = new kgy(this.f25496jc);
        this.syc = kgyVar;
        kgyVar.ul(true);
        syc();
        this.f25500tn = 2;
    }

    public static boolean tru() {
        return hf() == 2;
    }

    public ea dv() {
        return this.f25494dy;
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void ea() throws JSONException {
        super.ea();
        if (this.syc == null) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("expressShow", true);
            this.syc.ycx("expressShow", jSONObject);
            this.syc.sya(true);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "bOsvowq5fvWFRNNYng==", "VeE5nAWlSMOzQthK", 388);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void jc() {
        kgy kgyVar = this.syc;
        if (kgyVar == null) {
            return;
        }
        kgyVar.ycx("expressWebviewRecycle", (JSONObject) null);
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void ok() {
        super.ok();
        com.bytedance.sdk.openadsdk.utils.ycx ycxVarLud = com.bytedance.sdk.openadsdk.core.dy.ycx().lud();
        this.pmi = ycxVarLud;
        ycxVarLud.ycx(this);
    }

    public kgy oty() {
        return this.syc;
    }

    public void pmi() {
        kgy kgyVar;
        com.bytedance.sdk.component.jw.fby fbyVar = this.lud;
        if (fbyVar == null || fbyVar.getWebView() == null || (kgyVar = this.syc) == null) {
            return;
        }
        kgyVar.zb(this.lud).jw(this.lud.getScene() == fby.sya.ADS_V3).ycx(this.f25498ok).sya(this.f25498ok.m147if()).dj(this.f25498ok.pks()).zb(oby.ycx(this.f25495ea)).lud(this.f25498ok.wbt()).ycx(this).ycx(this.f25499ry).ycx(this.lud).ycx(this.xkz);
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void ry() {
        super.ry();
        com.bytedance.sdk.openadsdk.utils.ycx ycxVar = this.pmi;
        if (ycxVar != null) {
            ycxVar.zb(this);
        }
    }

    public void syc() {
        com.bytedance.sdk.component.jw.fby fbyVar = this.lud;
        if (fbyVar == null || fbyVar.getWebView() == null) {
            return;
        }
        this.lud.setBackgroundColor(0);
        this.lud.setBackgroundResource(17170445);
        ycx(this.lud);
        if (dj() != null) {
            this.f25501uh = new com.bytedance.sdk.openadsdk.dj.ry(this.f25498ok, dj().getWebView()).zb(false);
        }
        this.f25501uh.ycx(this.xkz);
        ea eaVar = new ea(this.f25496jc, this.syc, this.f25498ok, this.f25501uh, xkz());
        this.f25494dy = eaVar;
        JSONObject jSONObject = this.f25499ry;
        if (jSONObject != null) {
            eaVar.ycx(jSONObject);
        }
        this.lud.setWebViewClient(this.f25494dy);
        this.lud.setWebChromeClient(new com.bytedance.sdk.openadsdk.core.widget.ycx.dj(this.syc, this.f25501uh));
        wwx();
    }

    public void tn() {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f25498ok;
        if (tnVar == null || tnVar.jp() == null) {
            return;
        }
        this.wwx = this.f25498ok.jp();
    }

    public void uh() {
    }

    public void wie() {
        com.bytedance.sdk.component.adexpress.zb.ul ulVar = this.thx;
        if (ulVar != null) {
            super.ycx(ulVar);
        }
    }

    public void wwx() {
        com.bytedance.sdk.component.adexpress.lud.lud.ycx().ycx(this.lud, this.syc);
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public com.bytedance.sdk.component.jw.fby dj() {
        return this.lud;
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void fby() {
        if (this.f23651ul.get()) {
            return;
        }
        super.fby();
        kgy kgyVar = this.syc;
        if (kgyVar != null) {
            kgyVar.dj();
            this.syc.xkz();
            this.syc = null;
        }
        com.bytedance.sdk.openadsdk.dj.ry ryVar = this.f25501uh;
        if (ryVar != null) {
            ryVar.dj(false);
        }
        com.bytedance.sdk.openadsdk.core.syc.sya().removeCallbacks(this.oty);
        this.htf.clear();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void jw() {
        if (dj() == null) {
            return;
        }
        try {
            dj().getWebView().resumeTimers();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "bOsvowq5fvWFRNNYng==", "VOAfkBCpZMI=", 371);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void lt() {
        com.bytedance.sdk.component.jw.fby fbyVar = this.lud;
        if (fbyVar != null && fbyVar.getScene() == fby.sya.ADS_V3 && bhi()) {
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.WebViewRender", "refreshWebView: refresh webview by console log ");
            this.lud.a_("javascript:console.log('init engine');");
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx, com.bytedance.sdk.component.adexpress.zb.dj
    public int sya() {
        return this.f25498ok.tx();
    }

    public void zb(int i5) {
        if (this.syc == null) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("zoom_type", i5);
            this.syc.ycx("expressAdViewWillZoom", jSONObject);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "bOsvowq5fvWFRNNYng==", "VeE5nAWlXs6MRu1Sgxw=", TTAdConstant.DOWNLOAD_URL_CODE);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.WebViewRender", e3.getMessage());
        }
    }

    private void sya(boolean z11) throws JSONException {
        if (this.syc == null || this.lud == null) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("adVisible", z11);
            this.syc.ycx("expressAdShow", jSONObject);
            this.syc.zb(z11);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "bOsvowq5fvWFRNNYng==", "SOsjkSakedWFWcR8iCKoJ0w=", 451);
        }
    }

    public static String ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        return com.bytedance.sdk.component.adexpress.ycx.zb.zb.dj((tnVar == null || !tnVar.ag()) ? null : "v3");
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx, com.bytedance.sdk.component.adexpress.zb.dj
    public void ycx(com.bytedance.sdk.component.adexpress.zb.ul ulVar) {
        this.thx = ulVar;
        yzp.sya((Runnable) this.f25493dv);
    }

    private void ycx(com.bytedance.sdk.component.jw.fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        try {
            if (!bhi.zb()) {
                fbyVar.setDisplayZoomControls(false);
                com.bytedance.sdk.component.jw.ul.ycx(this.f25496jc).ycx(false).ycx(fbyVar.getWebView());
                fbyVar.setVerticalScrollBarEnabled(false);
                fbyVar.setHorizontalScrollBarEnabled(false);
                fbyVar.xkz();
                fbyVar.setMixedContentMode(0);
                fbyVar.setJavaScriptEnabled(true);
                fbyVar.setJavaScriptCanOpenWindowsAutomatically(true);
                fbyVar.setDomStorageEnabled(true);
                fbyVar.setDatabaseEnabled(true);
                fbyVar.setAllowFileAccess(false);
                fbyVar.setSupportZoom(true);
                fbyVar.setBuiltInZoomControls(true);
                fbyVar.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NARROW_COLUMNS);
                fbyVar.setUseWideViewPort(true);
                fbyVar.setCacheMode(-1);
            }
            fbyVar.setUserAgentString(com.bytedance.sdk.openadsdk.utils.htf.ycx(fbyVar.getWebView(), BuildConfig.VERSION_CODE));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "bOsvowq5fvWFRNNYng==", "UuAkgTS5a/GJT8BuiQW0IVXp", Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.WebViewRender", e3.toString());
        }
    }

    public static boolean zb(String str) {
        return "banner_call".equals(str) || "banner_ad".equals(str) || "slide_banner_ad".equals(str) || "banner_ad_landingpage".equals(str);
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx
    public void ycx(int i5) {
        if (i5 == this.f23648lt) {
            return;
        }
        this.f23648lt = i5;
        sya(i5 == 0);
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.ycx, com.bytedance.sdk.component.adexpress.zb.ea
    public void ycx(com.bytedance.sdk.component.adexpress.zb.xkz xkzVar) {
        super.ycx(xkzVar);
        if (this.f23644dj) {
            com.bytedance.sdk.component.utils.jw.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.tru.4
                @Override // java.lang.Runnable
                public void run() {
                    WebView webView = ((com.bytedance.sdk.component.adexpress.lud.ycx) tru.this).lud.getWebView();
                    if (webView != null) {
                        webView.resumeTimers();
                    }
                }
            }, 2000L);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar) {
        this.wie = zbVar;
        kgy kgyVar = this.syc;
        if (kgyVar != null) {
            kgyVar.ycx(zbVar);
        }
    }
}
