package com.bytedance.sdk.openadsdk.dj;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.webkit.JavascriptInterface;
import android.webkit.WebBackForwardList;
import android.webkit.WebView;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.widget.ycx.lt;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry {
    private static final int[] sya = {10, 30, 50, 75, 100};
    private long aeu;

    /* renamed from: av, reason: collision with root package name */
    private long f26565av;
    private volatile long bba;
    private long bhi;
    private volatile long dc;

    /* renamed from: dj, reason: collision with root package name */
    private int f26566dj;
    private volatile boolean dqs;
    private final AtomicBoolean duz;

    /* renamed from: dv, reason: collision with root package name */
    private int f26567dv;
    private com.bytedance.sdk.openadsdk.dj.dj.lud dwi;

    /* renamed from: dy, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.widget.ycx.lt f26568dy;

    /* renamed from: ea, reason: collision with root package name */
    private int f26569ea;
    private final AtomicBoolean fby;
    private final AtomicBoolean giw;

    /* renamed from: hf, reason: collision with root package name */
    private String f26570hf;
    private String hpv;
    private boolean htf;
    private WeakReference<WebView> ifb;

    /* renamed from: iq, reason: collision with root package name */
    private boolean f26571iq;

    /* renamed from: jc, reason: collision with root package name */
    private final AtomicBoolean f26572jc;

    /* renamed from: jw, reason: collision with root package name */
    private final AtomicBoolean f26573jw;
    private final int[] kgy;

    /* renamed from: lt, reason: collision with root package name */
    private int f26574lt;
    private long lud;

    /* renamed from: lv, reason: collision with root package name */
    private long f26575lv;

    /* renamed from: mp, reason: collision with root package name */
    private volatile long f26576mp;
    private ok nji;
    private boolean oby;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f26577ok;
    private final tn oty;
    private com.bytedance.sdk.openadsdk.wwx.fby pmi;

    /* renamed from: rl, reason: collision with root package name */
    private volatile int f26578rl;
    private long rmf;
    private final boolean rmy;

    /* renamed from: ry, reason: collision with root package name */
    private String f26579ry;
    private final Context syc;
    private final AtomicInteger sz;
    private int thx;

    /* renamed from: tn, reason: collision with root package name */
    private long f26580tn;
    private long tru;

    /* renamed from: uf, reason: collision with root package name */
    private volatile long f26581uf;

    /* renamed from: uh, reason: collision with root package name */
    private jw f26582uh;

    /* renamed from: ui, reason: collision with root package name */
    private final AtomicBoolean f26583ui;

    /* renamed from: ul, reason: collision with root package name */
    private final AtomicBoolean f26584ul;

    /* renamed from: ur, reason: collision with root package name */
    private final AtomicBoolean f26585ur;

    /* renamed from: uz, reason: collision with root package name */
    private String f26586uz;
    private boolean wie;

    /* renamed from: wr, reason: collision with root package name */
    private volatile boolean f26587wr;
    private long wwx;
    private String xkz;
    private final AtomicBoolean xym;

    /* renamed from: xz, reason: collision with root package name */
    private boolean f26588xz;
    public lt.ycx ycx;

    /* renamed from: yi, reason: collision with root package name */
    private final AtomicInteger f26589yi;
    private boolean yzp;

    /* renamed from: zb, reason: collision with root package name */
    AtomicBoolean f26590zb;

    /* renamed from: zr, reason: collision with root package name */
    private int f26591zr;

    public static class ycx {
        private final int[] ycx;

        public ycx(int[] iArr) {
            this.ycx = iArr;
        }

        @JavascriptInterface
        public String getUrl() {
            return b.f42142b;
        }

        @JavascriptInterface
        public void readPercent(String str) {
            int iIntValue;
            try {
                iIntValue = Float.valueOf(str).intValue();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxbkAkjHI4EGrm/Gg08=", "SesskTO5e8SFRMM=", 785);
            }
            if (iIntValue > 100) {
                iIntValue = 100;
            } else if (iIntValue < 0) {
                iIntValue = 0;
            }
            int[] iArr = this.ycx;
            if (iArr == null || iArr.length <= 0) {
                return;
            }
            iArr[0] = iIntValue;
        }
    }

    public ry(tn tnVar, WebView webView, ok okVar, int i5) {
        this(tnVar, webView);
        this.nji = okVar;
        this.f26591zr = i5;
    }

    private int ea() {
        WeakReference<WebView> weakReference = this.ifb;
        WebView webView = weakReference != null ? weakReference.get() : null;
        if (webView != null) {
            try {
                WebBackForwardList webBackForwardListCopyBackForwardList = webView.copyBackForwardList();
                if (webBackForwardListCopyBackForwardList != null) {
                    return webBackForwardListCopyBackForwardList.getCurrentIndex() == 0 ? 1 : 0;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "Uv0LnBGvffeBTdI=", 936);
            }
        }
        return 0;
    }

    private boolean jc() {
        tn tnVar;
        return this.oby && (tnVar = this.oty) != null && tnVar.ifb();
    }

    public void dj() {
        if (jc()) {
            this.bba = SystemClock.elapsedRealtime();
            sya.ycx(this.oty, this.f26586uz);
        }
    }

    public void fby() {
        if (("landingpage".equals(this.f26570hf) || "landingpage_endcard".equals(this.f26570hf) || "landingpage_split_screen".equals(this.f26570hf) || "landingpage_direct".equals(this.f26570hf) || "aggregate_page".equals(this.f26570hf) || "landingpage_split_ceiling".equals(this.f26570hf)) && this.f26574lt == 2) {
            if (this.bhi > 0 || !sya()) {
                long jCurrentTimeMillis = System.currentTimeMillis() - Math.max(this.tru, this.bhi);
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("load_status", this.f26574lt);
                    jSONObject.put("max_scroll_percent", this.kgy[0]);
                    jSONObject.put("jump_times", this.sz.getAndSet(0));
                    jSONObject.put("click_times", this.f26589yi.getAndSet(0));
                    jSONObject.putOpt("render_type", "h5");
                    jSONObject.putOpt("render_type_2", 0);
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAegQys", 620);
                }
                this.f26572jc.set(true);
                if (!ul("stay_page")) {
                    ycx("stay_page", jSONObject, Math.min(jCurrentTimeMillis, TTAdConstant.AD_MAX_EVENT_TIME));
                }
                com.bytedance.sdk.openadsdk.lt.zb.ycx().ycx("landingPause", this.oty, this.hpv);
            }
        }
    }

    public void jw() {
        if (this.giw.getAndSet(true)) {
            return;
        }
        ycx("web_prerender_page_show", new JSONObject());
    }

    public void lt() {
        if (jc() && this.f26576mp > 0 && this.f26581uf > 0 && !this.duz.getAndSet(true)) {
            sya.zb(this.f26581uf - this.f26576mp, this.oty, this.f26586uz, (String) null);
        }
    }

    public void lud() {
        if (jc()) {
            this.f26576mp = SystemClock.elapsedRealtime();
            lt();
        }
    }

    public boolean sya() {
        return this.oby;
    }

    public void ul() {
        if (this.aeu == 0) {
            this.aeu = System.currentTimeMillis();
        }
        this.tru = System.currentTimeMillis();
        if ("landingpage".equals(this.f26570hf) || "landingpage_endcard".equals(this.f26570hf) || "landingpage_split_screen".equals(this.f26570hf) || "landingpage_direct".equals(this.f26570hf) || "aggregate_page".equals(this.f26570hf)) {
            if (this.f26583ui.compareAndSet(false, true)) {
                com.bytedance.sdk.openadsdk.lt.zb.ycx().ycx("landingStart", this.oty, this.hpv);
            } else {
                com.bytedance.sdk.openadsdk.lt.zb.ycx().ycx("landingContinue", this.oty, this.hpv);
            }
        }
        if ("landingpage".equals(this.f26570hf) || "landingpage_endcard".equals(this.f26570hf) || "landingpage_split_screen".equals(this.f26570hf) || "landingpage_direct".equals(this.f26570hf) || "aggregate_page".equals(this.f26570hf) || "landingpage_split_ceiling".equals(this.f26570hf)) {
            ycx(true, SystemClock.elapsedRealtime());
        }
    }

    public com.bytedance.sdk.openadsdk.dj.dj.lud zb() {
        return this.dwi;
    }

    public void sya(boolean z11) {
        this.oby = z11;
    }

    public ry zb(boolean z11) {
        this.yzp = z11;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject jw(String str) {
        try {
            JSONObject jSONObject = new JSONObject();
            if ("load_start".equals(str) || "load_finish".equals(str) || "progress_load_finish".equals(str)) {
                jSONObject.put("is_reused", this.f26571iq ? 1 : 0);
            }
            if (this.thx == 1) {
                jSONObject.put("is_pre_render", 1);
            }
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "WfskmQeMaMCqWdhTqBC0KQ==", 1245);
            return null;
        }
    }

    public void sya(String str) throws JSONException {
        if (!this.yzp || this.oty == null) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.putOpt("render_type", "h5");
            jSONObject.putOpt("render_type_2", 0);
            int i5 = this.f26591zr;
            if (i5 >= 0) {
                jSONObject.putOpt("preload_status", Integer.valueOf(i5));
            }
            if (TextUtils.isEmpty(str)) {
                str = this.oty.kh();
            }
            jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "SesekA24RciBTuRJjQO0", 1020);
        }
        ycx("load_start", jSONObject);
    }

    public void zb(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.f26586uz = str;
    }

    public ry(tn tnVar, WebView webView) {
        this(tnVar, webView, false);
    }

    private String lt(String str) {
        return "javascript:".concat(String.valueOf(str));
    }

    public void dj(boolean z11) {
        WeakReference<WebView> weakReference = this.ifb;
        WebView webView = weakReference != null ? weakReference.get() : null;
        if (webView != null) {
            try {
                webView.removeJavascriptInterface("JS_LANDING_PAGE_LOG_OBJ");
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAJkBCoe8iZ", 667);
                htf.ycx("LandingPageLog", "removeJavascriptInterface exception", e3);
            }
        }
        if (this.fby.compareAndSet(false, true)) {
            ycx(z11, "1");
            if (this.yzp) {
                sya.ycx(this.oty, this.f26570hf, System.currentTimeMillis() - this.aeu, this.f26591zr, ea());
            }
        } else if (this.f26574lt == 2 && !this.f26572jc.get()) {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("load_status", this.f26574lt);
                jSONObject.put("max_scroll_percent", this.kgy[0]);
                jSONObject.put("jump_times", this.sz.getAndSet(0));
                jSONObject.put("click_times", this.f26589yi.getAndSet(0));
                jSONObject.putOpt("render_type", "h5");
                jSONObject.putOpt("render_type_2", 0);
            } catch (JSONException e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAJkBCoe8iZ", 686);
            }
            if (!ul("stay_page")) {
                ycx("stay_page", jSONObject, 0L);
            }
        }
        if ("landingpage".equals(this.f26570hf) || "landingpage_endcard".equals(this.f26570hf) || "landingpage_split_screen".equals(this.f26570hf) || "landingpage_direct".equals(this.f26570hf) || "aggregate_page".equals(this.f26570hf) || "landingpage_split_ceiling".equals(this.f26570hf)) {
            com.bytedance.sdk.openadsdk.lt.zb.ycx().ycx("landingFinish", this.oty, this.hpv);
        }
        this.nji = null;
        this.pmi = null;
        this.f26568dy = null;
        this.f26582uh = null;
        this.ycx = null;
        WeakReference<WebView> weakReference2 = this.ifb;
        if (weakReference2 != null) {
            weakReference2.clear();
            this.ifb = null;
        }
    }

    public void lud(boolean z11) {
        this.f26571iq = z11;
    }

    public ry(tn tnVar, WebView webView, boolean z11) {
        this.f26566dj = 0;
        this.lud = -1L;
        this.f26574lt = 1;
        this.f26584ul = new AtomicBoolean(false);
        this.fby = new AtomicBoolean(false);
        this.f26573jw = new AtomicBoolean(false);
        this.f26572jc = new AtomicBoolean(false);
        this.f26569ea = -1;
        this.htf = false;
        this.thx = 0;
        this.f26590zb = new AtomicBoolean(false);
        this.f26570hf = "landingpage";
        this.tru = 0L;
        this.bhi = 0L;
        this.f26565av = 0L;
        this.rmf = 0L;
        this.aeu = 0L;
        this.f26588xz = false;
        this.rmy = false;
        int[] iArr = {0};
        this.kgy = iArr;
        this.yzp = false;
        this.oby = false;
        this.dc = 0L;
        this.sz = new AtomicInteger(0);
        this.f26589yi = new AtomicInteger(0);
        this.xym = new AtomicBoolean(false);
        this.f26578rl = 0;
        this.f26591zr = -1;
        this.duz = new AtomicBoolean(false);
        this.f26583ui = new AtomicBoolean(false);
        this.f26571iq = false;
        this.dqs = false;
        this.f26585ur = new AtomicBoolean(false);
        this.f26587wr = false;
        this.giw = new AtomicBoolean(false);
        Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        this.syc = contextYcx;
        this.oty = tnVar;
        if (webView == null) {
            return;
        }
        this.htf = z11;
        WeakReference<WebView> weakReference = new WeakReference<>(webView);
        this.ifb = weakReference;
        WebView webView2 = weakReference.get();
        if (webView2 == null) {
            return;
        }
        if (tnVar != null && tnVar.vy()) {
            com.bytedance.sdk.openadsdk.core.widget.ycx.lt ltVar = new com.bytedance.sdk.openadsdk.core.widget.ycx.lt(webView2, tnVar, contextYcx, this.htf);
            this.f26568dy = ltVar;
            this.ycx = ltVar.sya();
        }
        if (tnVar != null && tnVar.yw() && com.bytedance.sdk.openadsdk.core.settings.ea.zb().tn()) {
            this.f26582uh = new jw(tnVar, webView, this.htf);
        }
        if (webView instanceof com.bytedance.sdk.component.jw.lt) {
            this.f26575lv = ((com.bytedance.sdk.component.jw.lt) webView2).ycx;
        } else {
            this.f26575lv = System.currentTimeMillis();
        }
        try {
            webView2.addJavascriptInterface(new ycx(iArr), "JS_LANDING_PAGE_LOG_OBJ");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "B+cjnBfi", Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE);
            htf.ycx("LandingPageLog", "addJavascriptInterface exception", e3);
        }
        if (tnVar != null && tnVar.pu() != null) {
            this.lud = tnVar.pu().optLong("page_id", -1L);
        }
        this.hpv = String.valueOf(SystemClock.elapsedRealtime());
    }

    private void zb(String str, String str2, long j11) {
        if (jc() || !this.f26573jw.compareAndSet(false, true)) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            if (str.length() > 200) {
                int iIndexOf = str.indexOf(38, 200);
                int i5 = 300;
                if (iIndexOf == -1 || iIndexOf > 300) {
                    iIndexOf = str.indexOf(63);
                }
                if (iIndexOf != -1 && iIndexOf <= 300) {
                    i5 = iIndexOf;
                }
                str = str.substring(0, i5);
            }
            jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
            jSONObject.put(TTConst.TRACK_TYPE, str2);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "SOsjkS+zaMOwWNhanhSzO33nI5wQtA==", 376);
        }
        ycx("load_finish_progress", jSONObject, j11);
    }

    public void lt(boolean z11) {
        this.f26587wr = z11;
    }

    public void lud(String str) throws JSONException {
        fby(str);
    }

    public tn ycx() {
        return this.oty;
    }

    public void ycx(boolean z11) {
        if (z11) {
            this.thx = 1;
        }
    }

    public void ycx(ok okVar) {
        this.nji = okVar;
    }

    public void ycx(long j11) {
        this.bhi = j11;
    }

    public void ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.widget.ycx.lt ltVar = this.f26568dy;
        if (ltVar != null) {
            ltVar.ycx(str);
        }
        jw jwVar = this.f26582uh;
        if (jwVar != null) {
            jwVar.sya(str);
        }
        this.f26570hf = str;
    }

    private boolean ul(String str) {
        if (this.dqs) {
            return "load_finish".equals(str) || "stay_page".equals(str);
        }
        return false;
    }

    public void zb(WebView webView, String str, boolean z11) {
        jw jwVar = this.f26582uh;
        if (jwVar == null || !z11) {
            return;
        }
        jwVar.ycx(webView, str);
    }

    public void ycx(int i5) {
        this.f26591zr = i5;
    }

    public void ul(boolean z11) {
        this.dqs = z11;
    }

    public void ycx(com.bytedance.sdk.openadsdk.dj.dj.lud ludVar) {
        this.dwi = ludVar;
    }

    public void zb(int i5) {
        com.bytedance.sdk.openadsdk.core.widget.ycx.lt ltVar = this.f26568dy;
        if (ltVar == null || !this.wie) {
            return;
        }
        ltVar.ycx(i5);
    }

    public void ycx(com.bytedance.sdk.openadsdk.wwx.fby fbyVar) {
        this.pmi = fbyVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject zb(long j11) {
        JSONObject jSONObject = new JSONObject();
        if (j11 > 0) {
            try {
                jSONObject.put("duration", j11);
                return jSONObject;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "WfskmQeZcdOqWdhT", 1207);
            }
        }
        return jSONObject;
    }

    public void ycx(WebView webView, int i5) throws JSONException {
        if (webView == null || this.f26587wr) {
            return;
        }
        if (this.dc == 0) {
            this.dc = SystemClock.elapsedRealtime();
        }
        if (this.f26565av == 0 && i5 > 0) {
            this.f26565av = System.currentTimeMillis();
        } else if (this.rmf == 0 && i5 == 100) {
            this.rmf = System.currentTimeMillis();
        }
        if (this.f26566dj != sya.length && ("landingpage".equals(this.f26570hf) || "landingpage_endcard".equals(this.f26570hf) || "landingpage_split_screen".equals(this.f26570hf) || "landingpage_direct".equals(this.f26570hf) || "aggregate_page".equals(this.f26570hf))) {
            int i11 = this.f26566dj;
            while (true) {
                int[] iArr = sya;
                if (i11 >= iArr.length || i5 < iArr[this.f26566dj]) {
                    break;
                }
                int i12 = i11 + 1;
                this.f26566dj = i12;
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, webView.getUrl());
                    long j11 = this.lud;
                    if (j11 != -1) {
                        jSONObject.put("page_id", j11);
                    }
                    jSONObject.putOpt("render_type", "h5");
                    jSONObject.putOpt("render_type_2", 0);
                    jSONObject.put("pct", iArr[i11]);
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAakAGMe8iHWNJOnw==", 346);
                }
                ycx("progress_load_finish", jSONObject);
                i11 = i12;
            }
        }
        if (i5 == 100) {
            ycx(false, SystemClock.elapsedRealtime());
            zb(webView.getUrl(), "progress", Math.min(this.rmf - this.f26565av, TTAdConstant.AD_MAX_EVENT_TIME));
        }
    }

    private void fby(String str) throws JSONException {
        if (this.yzp && this.oty != null && this.f26585ur.compareAndSet(false, true)) {
            final JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("error_code", this.f26569ea);
                jSONObject.put("error_msg", this.f26579ry);
                jSONObject.put("error_url", this.xkz);
                int i5 = this.f26591zr;
                if (i5 >= 0) {
                    jSONObject.put("preload_status", i5);
                }
                jSONObject.put("first_page", ea());
                jSONObject.putOpt("render_type", "h5");
                jSONObject.putOpt("render_type_2", 0);
                if (TextUtils.isEmpty(str)) {
                    str = this.oty.kh();
                }
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
                jSONObject.put("preload_h5_type", this.oty.oby());
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "SOsjkTOubPWFRNNYnj2vKV/IJJsKr2Hilk/ZSQ==", 1147);
            }
            com.bytedance.sdk.openadsdk.wwx.fby fbyVar = this.pmi;
            final int iYzp = fbyVar != null ? fbyVar.yzp() : -1;
            sya.ycx(System.currentTimeMillis(), this.oty, this.f26570hf, "load_finish", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.ry.6
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject sya() {
                    return ry.this.ycx(jSONObject, "load_finish", iYzp);
                }

                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject ycx() {
                    try {
                        JSONObject jSONObjectJw = ry.this.jw("load_finish");
                        jSONObjectJw.put("is_retransmit", 1);
                        return jSONObjectJw;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxbkfg==", "XOs5pQK7Q9SPRPNcmBA=", 1169);
                        return null;
                    }
                }
            });
            this.fby.set(true);
        }
    }

    public void dj(String str) throws JSONException {
        if (!this.yzp || this.oty == null) {
            return;
        }
        int i5 = 0;
        while (true) {
            int[] iArr = sya;
            if (i5 >= iArr.length) {
                return;
            }
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.putOpt("render_type", "h5");
                jSONObject.putOpt("render_type_2", 0);
                int i11 = this.f26591zr;
                if (i11 >= 0) {
                    jSONObject.putOpt("preload_status", Integer.valueOf(i11));
                }
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, TextUtils.isEmpty(str) ? this.oty.kh() : str);
                jSONObject.put("pct", iArr[i5]);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "SesekA24WdWPTcVYnwKMJ1rqC5wNtXrP", 1046);
            }
            ycx("progress_load_finish", jSONObject);
            i5++;
        }
    }

    public void ycx(WebView webView, String str, Bitmap bitmap, boolean z11, int i5) throws JSONException {
        if (this.f26587wr) {
            return;
        }
        this.wie = z11;
        this.f26567dv++;
        com.bytedance.sdk.openadsdk.core.widget.ycx.lt ltVar = this.f26568dy;
        if (ltVar != null && z11) {
            ltVar.zb(str);
            this.f26568dy.zb();
        }
        jw jwVar = this.f26582uh;
        if (jwVar != null && z11) {
            jwVar.ycx(str, i5);
        }
        WeakReference<WebView> weakReference = this.ifb;
        WebView webView2 = weakReference != null ? weakReference.get() : null;
        if (webView2 != null) {
            try {
                WebBackForwardList webBackForwardListCopyBackForwardList = webView2.copyBackForwardList();
                if (webBackForwardListCopyBackForwardList != null && webBackForwardListCopyBackForwardList.getCurrentIndex() > this.f26578rl) {
                    this.sz.incrementAndGet();
                }
                this.f26578rl = webBackForwardListCopyBackForwardList.getCurrentIndex();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAakAGPfcaSXtJZ", TTAdConstant.DOWNLOAD_URL_CODE);
                htf.ycx("LandingPageLog", "copyBackForwardList exception", e3);
            }
        }
        if (this.dc == 0) {
            this.dc = SystemClock.elapsedRealtime();
        }
        com.bytedance.sdk.openadsdk.dj.dj.lud ludVar = this.dwi;
        if (ludVar != null) {
            ludVar.dj();
        }
        if (jc() || !this.f26584ul.compareAndSet(false, true)) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.putOpt("render_type", "h5");
            jSONObject.putOpt("render_type_2", 0);
            int i11 = this.f26591zr;
            if (i11 >= 0) {
                jSONObject.putOpt("preload_status", Integer.valueOf(i11));
            }
        } catch (Exception e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAakAGPfcaSXtJZ", 426);
        }
        ycx("load_start", jSONObject);
    }

    public void ycx(WebView webView, String str, boolean z11) throws JSONException {
        if (this.f26587wr) {
            return;
        }
        ycx(false, SystemClock.elapsedRealtime());
        com.bytedance.sdk.openadsdk.core.widget.ycx.lt ltVar = this.f26568dy;
        if (ltVar != null && z11) {
            ltVar.ycx();
        }
        com.bytedance.sdk.openadsdk.dj.dj.lud ludVar = this.dwi;
        if (ludVar != null) {
            ludVar.lud();
        }
        jw jwVar = this.f26582uh;
        if (jwVar != null && z11) {
            jwVar.ycx(str);
        }
        if (webView != null && !this.f26588xz && this.yzp) {
            this.f26588xz = true;
            com.bytedance.sdk.component.utils.xkz.ycx(webView, "javascript:\nfunction sendScroll(){\n   var totalH = document.body.scrollHeight || document.documentElement.scrollHeight;\n   var clientH = window.innerHeight || document.documentElement.clientHeight;\n   var scrollH = document.body.scrollTop || document.documentElement.scrollTop;\n   var validH = scrollH + clientH;\n   var result = (validH/totalH*100).toFixed(2);\n   console.log('LandingPageLogscroll status: (' + scrollH + '+' + clientH + ')/' + totalH + '=' + result);\n   window.JS_LANDING_PAGE_LOG_OBJ.readPercent(result);\n}\nsendScroll();\nwindow.addEventListener('scroll', function(e){\n    sendScroll();\n});");
        }
        if (this.fby.compareAndSet(false, true)) {
            if (this.f26574lt != 3) {
                this.f26574lt = 2;
            }
            this.tru = System.currentTimeMillis();
            boolean z12 = this.f26574lt == 2;
            int iEa = ea();
            if (z12) {
                long j11 = this.rmf - this.f26565av;
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("error_code", this.f26569ea);
                    jSONObject.put("error_msg", this.f26579ry);
                    jSONObject.put("error_url", this.xkz);
                    int i5 = this.f26591zr;
                    if (i5 >= 0) {
                        jSONObject.put("preload_status", i5);
                    }
                    jSONObject.put("first_page", iEa);
                    jSONObject.putOpt("render_type", "h5");
                    jSONObject.putOpt("render_type_2", 0);
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, this.oty.kh());
                    jSONObject.put("preload_h5_type", this.oty.oby());
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAakAGaYMmJWd9YiA==", 494);
                }
                ycx(z11, "0");
                long jMin = Math.min(j11, TTAdConstant.AD_MAX_EVENT_TIME);
                if (jc()) {
                    this.f26581uf = SystemClock.elapsedRealtime();
                    lt();
                    sya.ycx(this.oty, this.f26586uz, this.f26581uf - this.bba);
                } else {
                    if (!ul("load_finish") && !this.f26585ur.get()) {
                        ycx("load_finish", jSONObject, jMin);
                    }
                    zb(str, "load_finish", jMin);
                }
                ok okVar = this.nji;
                this.nji = null;
                if (okVar != null) {
                    okVar.ycx(iEa);
                    return;
                }
                return;
            }
            ycx(z11, "2");
            if (jc()) {
                sya.ycx(this.oty, this.f26586uz, SystemClock.elapsedRealtime() - this.bba, this.f26569ea, this.f26579ry, this.xkz);
                return;
            }
            JSONObject jSONObject2 = new JSONObject();
            try {
                jSONObject2.put("error_code", this.f26569ea);
                jSONObject2.put("error_msg", this.f26579ry);
                jSONObject2.put("error_url", this.xkz);
                jSONObject2.put("first_page", iEa);
                int i11 = this.f26591zr;
                if (i11 >= 0) {
                    jSONObject2.put("preload_status", i11);
                }
                jSONObject2.putOpt("render_type", "h5");
                jSONObject2.putOpt("render_type_2", 0);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, this.oty.kh());
                jSONObject2.put("preload_h5_type", this.oty.oby());
            } catch (Exception e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAakAGaYMmJWd9YiA==", 536);
            }
            ycx("load_fail", jSONObject2);
            if (this.f26577ok) {
                jSONObject2.remove("render_type");
                jSONObject2.remove("render_type_2");
                ycx("load_fail_main", jSONObject2);
            }
        }
    }

    public void ycx(WebView webView, int i5, String str, String str2, String str3, boolean z11) {
        com.bytedance.sdk.openadsdk.dj.dj.lud ludVar = this.dwi;
        if (ludVar != null) {
            ludVar.ycx((JSONObject) null);
        }
        if ((str3 == null || !str3.startsWith("image")) && this.f26574lt != 2) {
            this.f26574lt = 3;
        }
        this.f26569ea = i5;
        this.f26579ry = str;
        this.xkz = str2;
        this.f26577ok = z11;
    }

    public void ycx(com.bytedance.sdk.component.jw.fby fbyVar) {
        int iGiw;
        Bitmap bitmapYcx;
        tn tnVar;
        if ((!"landingpage".equals(this.f26570hf) && !"landingpage_endcard".equals(this.f26570hf) && !"landingpage_split_screen".equals(this.f26570hf) && !"landingpage_direct".equals(this.f26570hf) && !"aggregate_page".equals(this.f26570hf)) || (iGiw = com.bytedance.sdk.openadsdk.core.pmi.dj().giw()) == 0 || new Random().nextInt(100) + 1 > iGiw || fbyVar == null || fbyVar.getWebView() == null || fbyVar.getVisibility() != 0 || (bitmapYcx = dc.ycx(fbyVar)) == null || (tnVar = this.oty) == null) {
            return;
        }
        dc.ycx(tnVar, this.f26570hf, "landing_page_blank", bitmapYcx, fbyVar.getUrl(), this.lud);
    }

    private void ycx(String str, JSONObject jSONObject) {
        ycx(str, jSONObject, -1L);
    }

    private void ycx(final String str, final JSONObject jSONObject, final long j11) {
        if (!this.yzp || this.oty == null || TextUtils.isEmpty(str)) {
            return;
        }
        com.bytedance.sdk.openadsdk.wwx.fby fbyVar = this.pmi;
        final int iYzp = fbyVar != null ? fbyVar.yzp() : -1;
        sya.ycx(System.currentTimeMillis(), this.oty, this.f26570hf, str, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.ry.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject sya() {
                return ry.this.ycx(jSONObject, str, iYzp);
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                return ry.this.jw(str);
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                return ry.this.zb(j11);
            }
        });
    }

    public void ycx(MotionEvent motionEvent) {
        com.bytedance.sdk.openadsdk.core.widget.ycx.lt ltVar = this.f26568dy;
        if (ltVar != null && this.wie) {
            ltVar.ycx(motionEvent);
        }
        int actionMasked = motionEvent.getActionMasked();
        if (this.dc != 0) {
            if (actionMasked == 1 || actionMasked == 3) {
                this.f26589yi.incrementAndGet();
                this.f26589yi.get();
                if (this.xym.getAndSet(true)) {
                    return;
                }
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, this.oty.kh());
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "VOAZmha/YQ==", 813);
                }
                ycx("click_time", jSONObject, Math.max(SystemClock.elapsedRealtime() - this.dc, 0L));
            }
        }
    }

    public void ycx(String str, boolean z11) {
        com.bytedance.sdk.openadsdk.core.widget.ycx.lt ltVar = this.f26568dy;
        if (ltVar != null && z11) {
            ltVar.sya(str);
        }
        jw jwVar = this.f26582uh;
        if (jwVar == null || !z11) {
            return;
        }
        jwVar.zb(str);
    }

    private void ycx(boolean z11, final String str) {
        if (z11) {
            final int iEa = ea();
            sya.ycx(new com.bytedance.sdk.component.fby.zb.sya("sendPrefLog") { // from class: com.bytedance.sdk.openadsdk.dj.ry.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        com.bytedance.sdk.openadsdk.core.settings.lt ltVarXz = com.bytedance.sdk.openadsdk.core.pmi.dj().xz();
                        boolean zYcx = ry.this.ycx(ltVarXz, str);
                        if (zYcx) {
                            if (!TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.settings.lt.f26119zb)) {
                                ry.this.ycx(iEa, str);
                                return;
                            }
                            if (TextUtils.isEmpty(ltVarXz.sya) || !zYcx) {
                                return;
                            }
                            String str2 = ltVarXz.sya;
                            com.bytedance.sdk.component.ul.zb.zb zbVarSya = com.bytedance.sdk.openadsdk.htf.zb.zb().sya().sya();
                            zbVarSya.sya(str2);
                            HashMap map = new HashMap();
                            map.put("content-type", "application/json; charset=utf-8");
                            zbVarSya.dj(map);
                            zbVarSya.ycx(9);
                            zbVarSya.zb("sendPrefLog");
                            zbVarSya.zb(new com.bytedance.sdk.component.ul.ycx.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.ry.2.1
                                @Override // com.bytedance.sdk.component.ul.ycx.ycx
                                public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, IOException iOException) {
                                }

                                @Override // com.bytedance.sdk.component.ul.ycx.ycx
                                public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, com.bytedance.sdk.component.ul.zb zbVar) {
                                    try {
                                        com.bytedance.sdk.openadsdk.core.settings.lt.f26119zb = zbVar.dj();
                                        AnonymousClass2 anonymousClass2 = AnonymousClass2.this;
                                        ry.this.ycx(iEa, str);
                                    } catch (Exception e3) {
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxbkeh+/", "VOAfkBCsZsmTTw==", 868);
                                        htf.ycx("LandingPageLog", "TTWebViewClient : onPageFinished", e3);
                                    }
                                }
                            });
                        }
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxbkeg==", "Sfsj", 878);
                        htf.sya(th2.getMessage(), new Object[0]);
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(int i5, String str) {
        try {
            if (TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.settings.lt.f26119zb)) {
                return;
            }
            JSONObject jSONObject = new JSONObject();
            StringBuilder sb2 = new StringBuilder(com.bytedance.sdk.openadsdk.core.settings.lt.f26119zb);
            jSONObject.putOpt("cid", ycx().m147if());
            jSONObject.putOpt("ad_id", ycx().m147if());
            jSONObject.put("log_extra", ycx().pks());
            oby.ycx(sb2, "\"/** adInfo **/\"", jSONObject.toString());
            oby.ycx(sb2, "\"/** first_page **/\"", String.valueOf(i5));
            oby.ycx(sb2, "\"/** ix_to_externalurl **/\"", this.lud != -1 ? "1" : "0");
            oby.ycx(sb2, "\"/** preload_status **/\"", this.f26591zr == 2 ? "2" : "0");
            oby.ycx(sb2, "\"/** scene_state **/\"", str);
            oby.ycx(sb2, "\"/** web_init_time **/\"", String.valueOf(this.f26575lv));
            oby.ycx(sb2, "\"/** channel_name **/\"", "\"" + ycx().dw() + "\"");
            oby.ycx(sb2, "\"/** session_id **/\"", "\"" + UUID.randomUUID().toString() + "\"");
            oby.ycx(sb2, "\"/** web_url **/\"", "\"" + ycx().kh() + "\"");
            String string = sb2.toString();
            if (TextUtils.isEmpty(string)) {
                return;
            }
            final String strLt = lt(string);
            WeakReference<WebView> weakReference = this.ifb;
            final WebView webView = weakReference != null ? weakReference.get() : null;
            if (TextUtils.isEmpty(strLt) || webView == null) {
                return;
            }
            yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.ry.3
                @Override // java.lang.Runnable
                public void run() {
                    com.bytedance.sdk.component.utils.xkz.ycx(webView, strLt);
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "X+EBmgK4SsiNR9hTpgI=", 921);
            htf.sya(th2.getMessage(), new Object[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean ycx(com.bytedance.sdk.openadsdk.core.settings.lt ltVar, String str) {
        str.getClass();
        switch (str) {
            case "0":
                return ltVar.f26120dj;
            case "1":
                return ltVar.lud;
            case "2":
                return ltVar.f26121lt;
            default:
                return false;
        }
    }

    public void ycx(boolean z11, long j11) {
        if (z11) {
            this.wwx = j11;
        } else {
            this.f26580tn = j11;
        }
        if (this.wwx <= 0 || this.f26580tn <= 0 || !this.wie || !this.f26590zb.compareAndSet(false, true)) {
            return;
        }
        ycx(this.oty, this.f26570hf, this.f26580tn - this.wwx, this.thx, this.f26571iq);
    }

    public static void ycx(final tn tnVar, final String str, final long j11, final int i5, final boolean z11) {
        sya.ycx(System.currentTimeMillis(), tnVar, str, "lp_feeling_duration", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.ry.4
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("meta_pre_render", tnVar.mtm() ? 1 : 0);
                    jSONObject.put("is_pre_render", i5);
                    com.bytedance.sdk.openadsdk.core.model.uh uhVarTru = tnVar.tru();
                    if (uhVarTru == null) {
                        uhVarTru = new com.bytedance.sdk.openadsdk.core.model.uh();
                    }
                    jSONObject.put("pre_render_status", uhVarTru.sya());
                    jSONObject.put("pre_render_use_gecko", uhVarTru.zb());
                    jSONObject.put("pre_render_add_type", uhVarTru.ycx());
                    jSONObject.put("is_reused", z11 ? 1 : 0);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxbkfA==", "XOs5pQK7Q9SPRPNcmBA=", 997);
                    return jSONObject;
                }
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxbkfA==", "XOs5sBuoQ9SPRA==", 975);
                    return jSONObject;
                }
            }
        });
    }

    public void ycx(String str, long j11) throws JSONException {
        if (!this.yzp || this.oty == null) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("error_code", this.f26569ea);
            jSONObject.put("error_msg", this.f26579ry);
            jSONObject.put("error_url", this.xkz);
            int i5 = this.f26591zr;
            if (i5 >= 0) {
                jSONObject.put("preload_status", i5);
            }
            jSONObject.put("first_page", ea());
            jSONObject.putOpt("render_type", "h5");
            jSONObject.putOpt("render_type_2", 0);
            if (TextUtils.isEmpty(str)) {
                str = this.oty.kh();
            }
            jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
            jSONObject.put("preload_h5_type", this.oty.oby());
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "SesekA24RciBTvFUghizIA==", 1076);
        }
        ycx("load_finish", jSONObject, Math.min(j11, TTAdConstant.AD_MAX_EVENT_TIME));
    }

    public void ycx(final String str, final String str2, final long j11) {
        if (!this.yzp || this.oty == null) {
            return;
        }
        sya.ycx(System.currentTimeMillis(), this.oty, this.f26570hf, "lp_redirect_duration", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.ry.5
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    boolean zIsEmpty = TextUtils.isEmpty(str);
                    String str3 = b.f42142b;
                    jSONObject.put("first_url", zIsEmpty ? b.f42142b : str);
                    if (!TextUtils.isEmpty(str2)) {
                        str3 = str2;
                    }
                    jSONObject.put("current_url", str3);
                    jSONObject.put("time_since_last_touch", j11);
                    return jSONObject;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxbkfQ==", "XOs5pQK7Q9SPRPNcmBA=", 1107);
                    return jSONObject;
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject ycx(JSONObject jSONObject, String str, int i5) throws JSONException {
        if (jSONObject != null) {
            try {
                boolean zZb = av.zb(this.oty);
                jSONObject.put("is_playable", zZb ? 1 : 0);
                jSONObject.put("usecache", com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(this.oty) ? 1 : 0);
                if (zZb && ("load_finish".equals(str) || "load_fail".equals(str))) {
                    jSONObject.put("playable_has_show", i5);
                }
                if ("stay_page".equals(str)) {
                    jSONObject.put("first_page", this.f26567dv > 1 ? 0 : 1);
                    return jSONObject;
                }
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "d+8jkQqybveBTdJxgxY=", "WfskmQedbeKYXsVcqBC0KQ==", 1227);
            }
        }
        return jSONObject;
    }
}
