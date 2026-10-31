package com.bytedance.sdk.openadsdk.wwx;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewTreeObserver;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby {
    private long aeu;

    /* renamed from: ag, reason: collision with root package name */
    private String f27298ag;

    /* renamed from: aq, reason: collision with root package name */
    private ycx f27299aq;

    /* renamed from: av, reason: collision with root package name */
    private long f27300av;
    private String bah;
    private int bba;

    /* renamed from: bh, reason: collision with root package name */
    private int f27301bh;
    private int bhi;
    private Context bjp;

    /* renamed from: ci, reason: collision with root package name */
    private int f27302ci;

    /* renamed from: cu, reason: collision with root package name */
    private String f27303cu;
    private String dc;
    private String dfk;

    /* renamed from: dj, reason: collision with root package name */
    public final String f27304dj;
    private int dqs;
    private int duz;

    /* renamed from: dv, reason: collision with root package name */
    private boolean f27305dv;

    /* renamed from: dw, reason: collision with root package name */
    private int f27306dw;
    private long dwi;

    /* renamed from: dy, reason: collision with root package name */
    private boolean f27307dy;

    /* renamed from: ea, reason: collision with root package name */
    private Runnable f27308ea;
    private final Handler fby;
    private int ff;

    /* renamed from: gi, reason: collision with root package name */
    private boolean f27309gi;
    private JSONObject giw;

    /* renamed from: hf, reason: collision with root package name */
    private long f27310hf;
    private boolean hfd;
    private int hpv;
    private String htf;
    private ViewTreeObserver.OnGlobalLayoutListener hti;

    /* renamed from: if, reason: not valid java name */
    private String f7if;
    private long ifb;

    /* renamed from: iq, reason: collision with root package name */
    private int f27311iq;

    /* renamed from: jc, reason: collision with root package name */
    private Runnable f27312jc;

    /* renamed from: jp, reason: collision with root package name */
    private String f27313jp;

    /* renamed from: jw, reason: collision with root package name */
    private Runnable f27314jw;
    private long kgy;

    /* renamed from: kh, reason: collision with root package name */
    private int f27315kh;

    /* renamed from: ko, reason: collision with root package name */
    private String f27316ko;

    /* renamed from: kt, reason: collision with root package name */
    private JSONObject f27317kt;
    private int liq;

    /* renamed from: lt, reason: collision with root package name */
    private final String f27318lt;
    public final String lud;

    /* renamed from: lv, reason: collision with root package name */
    private boolean f27319lv;

    /* renamed from: mp, reason: collision with root package name */
    private int f27320mp;
    private int mue;

    /* renamed from: nc, reason: collision with root package name */
    private float f27321nc;
    private String nji;

    /* renamed from: nq, reason: collision with root package name */
    private boolean f27322nq;
    private sya nzi;
    private String oby;

    /* renamed from: ok, reason: collision with root package name */
    private final Handler f27323ok;
    private String oty;

    /* renamed from: pg, reason: collision with root package name */
    private float f27324pg;

    /* renamed from: pk, reason: collision with root package name */
    private volatile boolean f27325pk;
    private volatile boolean pks;
    private boolean pmi;

    /* renamed from: py, reason: collision with root package name */
    private String f27326py;
    private boolean pyn;
    private String qn;

    /* renamed from: qt, reason: collision with root package name */
    private String f27327qt;

    /* renamed from: rl, reason: collision with root package name */
    private boolean f27328rl;
    private long rmf;
    private long rmy;
    private String row;

    /* renamed from: rt, reason: collision with root package name */
    private boolean f27329rt;

    /* renamed from: ry, reason: collision with root package name */
    private Runnable f27330ry;
    private String rzo;

    /* renamed from: sg, reason: collision with root package name */
    private int f27331sg;
    private boolean sjd;
    private boolean skm;

    /* renamed from: sp, reason: collision with root package name */
    private int f27332sp;
    private boolean spv;
    public final String sya;
    private zb syc;
    private String sz;

    /* renamed from: te, reason: collision with root package name */
    private JSONObject f27333te;
    private String thx;

    /* renamed from: tn, reason: collision with root package name */
    private boolean f27334tn;
    private int tpg;
    private long tru;

    /* renamed from: tx, reason: collision with root package name */
    private lt f27335tx;

    /* renamed from: uf, reason: collision with root package name */
    private int f27336uf;
    private com.bytedance.sdk.openadsdk.wwx.ycx ufy;

    /* renamed from: uh, reason: collision with root package name */
    private Set<String> f27337uh;

    /* renamed from: ui, reason: collision with root package name */
    private int f27338ui;
    private JSONObject ujb;

    /* renamed from: ul, reason: collision with root package name */
    private final String f27339ul;

    /* renamed from: ur, reason: collision with root package name */
    private long f27340ur;

    /* renamed from: uu, reason: collision with root package name */
    private WebView f27341uu;

    /* renamed from: uz, reason: collision with root package name */
    private String f27342uz;
    private float vbt;
    private int vy;
    private Map<String, String> vyl;
    private boolean wie;

    /* renamed from: wk, reason: collision with root package name */
    private int f27343wk;

    /* renamed from: wr, reason: collision with root package name */
    private long f27344wr;
    private boolean wwx;

    /* renamed from: xf, reason: collision with root package name */
    private WeakReference<View> f27345xf;
    private boolean xh;
    private Runnable xkz;
    private int xym;

    /* renamed from: xz, reason: collision with root package name */
    private long f27346xz;
    public final String ycx;

    /* renamed from: yi, reason: collision with root package name */
    private int f27347yi;

    /* renamed from: yl, reason: collision with root package name */
    private boolean f27348yl;

    /* renamed from: yw, reason: collision with root package name */
    private int f27349yw;
    private int yyc;
    private long yzp;

    /* renamed from: zb, reason: collision with root package name */
    public final String f27350zb;

    /* renamed from: zk, reason: collision with root package name */
    private int f27351zk;
    private List<JSONObject> znc;

    /* renamed from: zr, reason: collision with root package name */
    private int f27352zr;

    public enum ycx {
        LAND_PAGE,
        FEED,
        OTHER,
        FEED_AWEME
    }

    private fby(Context context, WebView webView, sya syaVar, com.bytedance.sdk.openadsdk.wwx.ycx ycxVar, ycx ycxVar2) {
        this.f27318lt = "playable_stuck_check_ping";
        this.f27339ul = "playable_apply_media_permission_callback";
        this.fby = new Handler(Looper.getMainLooper());
        this.f27323ok = new Handler(Looper.getMainLooper());
        this.f27307dy = true;
        this.wie = true;
        this.pmi = true;
        this.ycx = "PL_sdk_playable_global_viewable";
        this.f27350zb = "PL_sdk_page_screen_blank";
        this.sya = "PL_sdk_playable_destroy_analyze_summary";
        this.f27304dj = "PL_sdk_playable_hardware_dialog_cancel";
        this.lud = "PL_sdk_playable_hardware_dialog_setting";
        this.f27337uh = new HashSet(Arrays.asList("adInfo", "appInfo", "subscribe_app_ad", "download_app_ad"));
        this.htf = null;
        this.thx = "embeded_ad";
        this.wwx = true;
        this.f27334tn = true;
        this.f27305dv = false;
        this.oty = b.f42142b;
        this.f27310hf = 10L;
        this.tru = 10L;
        this.bhi = Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE;
        this.f27300av = 0L;
        this.rmf = 0L;
        this.aeu = -1L;
        this.f27346xz = -1L;
        this.rmy = -1L;
        this.kgy = -1L;
        this.ifb = -1L;
        this.yzp = -1L;
        this.dwi = -1L;
        this.oby = b.f42142b;
        this.nji = b.f42142b;
        this.dc = b.f42142b;
        this.sz = b.f42142b;
        this.f27347yi = 0;
        this.xym = 0;
        this.f27328rl = false;
        this.f27352zr = 0;
        this.bba = -1;
        this.f27320mp = 0;
        this.f27336uf = 0;
        this.duz = 0;
        this.f27342uz = null;
        this.f27319lv = false;
        this.f27338ui = 0;
        this.hpv = 0;
        this.f27311iq = 0;
        this.dqs = 0;
        this.f27340ur = 0L;
        this.f27344wr = 0L;
        this.f27331sg = -2;
        this.f27301bh = 0;
        this.f27343wk = 0;
        this.f27351zk = 0;
        this.ujb = new JSONObject();
        this.vyl = new HashMap();
        this.f27317kt = new JSONObject();
        this.f27327qt = b.f42142b;
        this.f27321nc = 0.0f;
        this.vbt = 0.0f;
        this.hfd = false;
        this.xh = false;
        this.f27348yl = false;
        this.znc = new ArrayList();
        this.sjd = true;
        this.pks = true;
        this.f27325pk = true;
        this.hti = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                try {
                    View view = (View) fby.this.f27345xf.get();
                    if (view == null) {
                        return;
                    }
                    fby.this.zb(view);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR/keQ==", "VOAKmQy+aMusS85SmQU=", 280);
                    ul.ycx("PlayablePlugin", "onSizeChanged error", th2);
                }
            }
        };
        this.f27306dw = -1;
        this.f27331sg = 0;
        this.f27299aq = ycxVar2;
        this.f27341uu = webView;
        jw.ycx(webView);
        ycx(webView);
        ycx(context, syaVar, ycxVar);
    }

    private void dc() {
        String str;
        if (this.f27317kt == null || (str = this.row) == null || str.contains("/cid_")) {
            return;
        }
        String strOptString = this.f27317kt.optString("cid");
        if (TextUtils.isEmpty(strOptString)) {
            return;
        }
        String host = Uri.parse(this.row).getHost();
        if (TextUtils.isEmpty(host)) {
            this.row = c0.r(new StringBuilder(), this.row, "/cid_", strOptString);
        } else {
            this.row = this.row.replace(host, u4.m(host, "/cid_", strOptString));
        }
    }

    private void nji() {
        this.syc = new zb(this, this.bhi);
        this.f27314jw = new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.5
            @Override // java.lang.Runnable
            public void run() {
                if (fby.this.wwx) {
                    fby.this.wwx = false;
                    fby.this.fby.removeCallbacks(fby.this.f27312jc);
                    fby.this.ycx(2, "ContainerLoadTimeOut");
                }
            }
        };
        this.f27312jc = new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.6
            @Override // java.lang.Runnable
            public void run() {
                if (fby.this.wwx) {
                    fby.this.wwx = false;
                    fby.this.pks = false;
                    fby.this.fby.removeCallbacks(fby.this.f27314jw);
                    fby.this.ycx(3, "JSSDKLoadTimeOut");
                }
            }
        };
        this.f27330ry = new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.7
            @Override // java.lang.Runnable
            public void run() {
                if (fby.this.f27341uu != null) {
                    fby.this.f27341uu.evaluateJavascript("javascript:typeof playable_callJS === 'function' && playable_callJS()", new ValueCallback<String>() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.7.1
                        @Override // android.webkit.ValueCallback
                        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
                        public void onReceiveValue(String str) {
                            if (fby.this.syc != null) {
                                fby.this.syc.ycx(System.currentTimeMillis());
                            }
                        }
                    });
                }
                if (fby.this.f27323ok != null) {
                    fby.this.f27323ok.postDelayed(this, 500L);
                }
            }
        };
        this.xkz = new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.8
            @Override // java.lang.Runnable
            public void run() {
                fby.this.ycx("playable_stuck_check_ping", new JSONObject());
                if (fby.this.f27323ok != null) {
                    fby.this.f27323ok.postDelayed(this, 500L);
                }
            }
        };
        this.f27308ea = new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.9
            @Override // java.lang.Runnable
            public void run() {
                if (fby.this.f27344wr <= 0) {
                    fby.this.zb(1, "Clicking on the hot zone causes the program to freeze.");
                } else {
                    if (fby.this.f27344wr - fby.this.f27340ur > fby.this.bhi) {
                        fby.this.zb(1, "Clicking on the hot zone causes the program to freeze.");
                        return;
                    }
                    fby.this.xz();
                    fby.this.f27340ur = 0L;
                    fby.this.f27344wr = 0L;
                }
            }
        };
    }

    public static /* synthetic */ int ok(fby fbyVar) {
        int i5 = fbyVar.f27347yi;
        fbyVar.f27347yi = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int ry(fby fbyVar) {
        int i5 = fbyVar.xym;
        fbyVar.xym = i5 + 1;
        return i5;
    }

    private void sz() {
        Runnable runnable;
        Runnable runnable2;
        this.syc.ycx(System.currentTimeMillis());
        Handler handler = this.f27323ok;
        if (handler != null) {
            int i5 = this.f27331sg;
            if (i5 == 0 && (runnable2 = this.f27330ry) != null) {
                handler.post(runnable2);
            } else if ((i5 == 1 || i5 == 2) && (runnable = this.xkz) != null) {
                handler.post(runnable);
            }
            this.syc.ycx(500);
        }
    }

    public void aeu() {
        this.f27325pk = false;
        this.fby.removeCallbacks(this.f27312jc);
        try {
            JSONObject jSONObject = new JSONObject();
            if (this.rmy > 0) {
                jSONObject.put("playable_jssdk_load_success_duration", System.currentTimeMillis() - this.rmy);
            } else {
                jSONObject.put("playable_jssdk_load_success_duration", 0L);
            }
            sya("PL_sdk_jssdk_load_success", jSONObject);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Uf0BmgK4T86OQ8RV", 2163);
        }
    }

    public void av() {
        zb zbVar;
        this.f27344wr = System.currentTimeMillis();
        int i5 = this.f27331sg;
        if ((i5 == 1 || i5 == 2) && (zbVar = this.syc) != null) {
            zbVar.ycx(System.currentTimeMillis());
        }
    }

    public void bhi() {
        try {
            JSONObject jSONObject = new JSONObject();
            if (this.ifb > 0) {
                jSONObject.put("playable_material_first_frame_show_duration", System.currentTimeMillis() - this.ifb);
            } else {
                jSONObject.put("playable_material_first_frame_show_duration", 0L);
            }
            if (this.rmy > 0) {
                jSONObject.put("playable_material_first_frame_load_duration", System.currentTimeMillis() - this.rmy);
            } else {
                jSONObject.put("playable_material_first_frame_load_duration", 0L);
            }
            sya("PL_sdk_material_first_frame_show", jSONObject);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Xec/hheae8aNT+RVgwY=", 1755);
        }
    }

    public void dv() {
        this.bba = 2;
    }

    public String dwi() {
        return "function playable_callJS(){return \"Android call the JS method is callJS\";}";
    }

    public String dy() {
        com.bytedance.sdk.openadsdk.wwx.ycx ycxVar;
        if (TextUtils.isEmpty(this.dc) && (ycxVar = this.ufy) != null) {
            this.dc = ycxVar.ycx().toString();
        }
        return this.dc;
    }

    public void hf() {
        if (this.ufy != null) {
            ycx ycxVar = ycx.LAND_PAGE;
        }
    }

    public JSONObject htf() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("devicePixelRatio", this.f27324pg);
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("width", this.f27302ci);
            jSONObject2.put("height", this.f27332sp);
            jSONObject.put("screen", jSONObject2);
            JSONObject jSONObject3 = new JSONObject();
            jSONObject3.put("x", this.liq);
            jSONObject3.put("y", this.tpg);
            jSONObject3.put("width", this.vy);
            jSONObject3.put("height", this.f27349yw);
            jSONObject.put("webview", jSONObject3);
            JSONObject jSONObject4 = new JSONObject();
            jSONObject4.put("x", this.yyc);
            jSONObject4.put("y", this.ff);
            jSONObject4.put("width", this.mue);
            jSONObject4.put("height", this.f27315kh);
            jSONObject.put("visible", jSONObject4);
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "XOs5owq5ftePWMM=", 1571);
            ul.ycx("PlayablePlugin", "getViewport error", th2);
            return jSONObject;
        }
    }

    public void ifb() {
        if (this.f27348yl) {
            return;
        }
        this.f27348yl = true;
        this.rmf = 0L;
        this.wie = true;
        kgy();
        try {
            View view = this.f27345xf.get();
            if (view != null) {
                view.getViewTreeObserver().removeOnGlobalLayoutListener(this.hti);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "WOIolBE=", 2637);
        }
        try {
            this.f27335tx.zb();
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "WOIolBE=", 2642);
        }
        try {
            zb zbVar = this.syc;
            if (zbVar != null) {
                zbVar.ycx();
                this.syc = null;
            }
            Handler handler = this.f27323ok;
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
            }
        } catch (Throwable th4) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "WOIolBE=", 2652);
            th4.toString();
        }
        try {
            if (!TextUtils.isEmpty(this.row)) {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("playable_all_times", this.f27347yi);
                jSONObject.put("playable_hit_times", this.xym);
                int i5 = this.f27347yi;
                if (i5 > 0) {
                    jSONObject.put("playable_hit_ratio", this.xym / (i5 * 1.0d));
                } else {
                    jSONObject.put("playable_hit_ratio", 0);
                }
                sya("PL_sdk_preload_times", jSONObject);
            }
        } catch (Throwable th5) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "WOIolBE=", 2669);
        }
        try {
            if (!TextUtils.isEmpty(this.row)) {
                if (this.aeu != -1) {
                    this.f27300av += System.currentTimeMillis() - this.aeu;
                    this.aeu = -1L;
                }
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("playable_user_play_duration", this.f27300av);
                sya("PL_sdk_user_play_duration", jSONObject2);
            }
        } catch (Throwable th6) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "WOIolBE=", 2686);
        }
        this.pks = false;
        this.f27325pk = false;
        this.fby.removeCallbacks(this.f27314jw);
        this.fby.removeCallbacks(this.f27312jc);
        this.fby.removeCallbacksAndMessages(null);
    }

    public void kgy() {
        this.f27343wk = 0;
        this.f27351zk = 0;
        this.f27324pg = 0.0f;
        this.f27302ci = 0;
        this.f27332sp = 0;
        this.tpg = 0;
        this.liq = 0;
        this.vy = 0;
        this.f27349yw = 0;
        this.ff = 0;
        this.yyc = 0;
        this.mue = 0;
        this.f27315kh = 0;
    }

    public int oby() {
        return this.f27306dw;
    }

    public void oty() {
        this.f27319lv = true;
    }

    public JSONObject pmi() {
        if (this.ujb.isNull("width")) {
            View view = this.f27345xf.get();
            if (view == null) {
                return this.ujb;
            }
            zb(view);
        }
        return this.ujb;
    }

    public void rmf() {
        int i5;
        int i11 = this.f27331sg;
        if (i11 == 0 || i11 == 1 || i11 == 2) {
            if (this.pks) {
                this.fby.postDelayed(this.f27314jw, this.f27310hf * 1000);
            }
            if ((this.f27325pk && ok(this.row)) || (i5 = this.f27331sg) == 1 || i5 == 2) {
                this.fby.postDelayed(this.f27312jc, this.tru * 1000);
            }
        }
    }

    public void rmy() {
        try {
            zb zbVar = this.syc;
            if (zbVar != null) {
                zbVar.ycx();
            }
            Handler handler = this.f27323ok;
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SPoihSCuaNSIad9Yjxo=", 2525);
            th2.toString();
        }
    }

    public JSONObject syc() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("scene_type", this.f27299aq.ordinal());
            jSONObject.put("safe_area_top_height", this.f27321nc);
            jSONObject.put("safe_area_bottom_height", this.vbt);
            jSONObject.put("playable_enter_from", this.f27336uf);
            jSONObject.put("playable_retry_count", this.f27320mp);
            jSONObject.put("playable_card_session", this.oby);
            jSONObject.put("playable_video_session", this.nji);
            jSONObject.put("playable_network_type", dy());
            jSONObject.put("aweme_id", this.sz);
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "S+IsjAK+ZcKpRNFS", 1027);
            ul.ycx("PlayablePlugin", "playableInfo error", th2);
            return new JSONObject();
        }
    }

    public void thx() {
        com.bytedance.sdk.openadsdk.wwx.ycx ycxVar = this.ufy;
        if (ycxVar != null) {
            ycxVar.zb();
        }
    }

    public void tn() {
        try {
            JSONObject jSONObject = new JSONObject();
            if (this.ifb > 0) {
                jSONObject.put("playable_material_interactable_duration", System.currentTimeMillis() - this.ifb);
            } else {
                jSONObject.put("playable_material_interactable_duration", 0L);
            }
            if (this.rmy > 0) {
                long jCurrentTimeMillis = System.currentTimeMillis() - this.rmy;
                this.dwi = jCurrentTimeMillis;
                jSONObject.put("playable_material_interactable_load_duration", jCurrentTimeMillis);
            } else {
                jSONObject.put("playable_material_interactable_load_duration", 0L);
            }
            sya("PL_sdk_material_interactable", jSONObject);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "V+EskS69YMmzSdJTiQ==", 1623);
        }
    }

    public void tru() {
        if (this.ufy != null) {
            ycx ycxVar = ycx.LAND_PAGE;
        }
    }

    public JSONObject uh() {
        return this.f27317kt;
    }

    public com.bytedance.sdk.openadsdk.wwx.ycx wie() {
        return this.ufy;
    }

    public void wwx() {
        com.bytedance.sdk.openadsdk.wwx.ycx ycxVar = this.ufy;
        if (ycxVar != null) {
            ycxVar.sya();
        }
    }

    public JSONObject xkz() {
        boolean zYcx;
        boolean zYcx2;
        try {
            boolean z11 = true;
            if (Build.VERSION.SDK_INT >= 33) {
                zYcx = lud.ycx(this.bjp, "android.permission.READ_MEDIA_IMAGES");
                zYcx2 = true;
            } else {
                zYcx = lud.ycx(this.bjp, "android.permission.READ_EXTERNAL_STORAGE");
                zYcx2 = lud.ycx(this.bjp, "android.permission.WRITE_EXTERNAL_STORAGE");
            }
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("isHasRead", zYcx);
            jSONObject.put("isHasWrite", zYcx2);
            if (!zYcx || !zYcx2) {
                z11 = false;
            }
            jSONObject.put("result", z11);
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "XOs5sBuobNWOS9tumB6yKVzr", 971);
            ul.ycx("PlayablePlugin", "getCameraPermission error", th2);
            return new JSONObject();
        }
    }

    public void xz() {
        if (this.f27334tn) {
            this.yzp = System.currentTimeMillis();
            if (this.f27299aq == ycx.FEED_AWEME) {
                if (this.skm && this.f27301bh == 3) {
                    zb zbVar = this.syc;
                    if (zbVar != null && zbVar.zb()) {
                        sz();
                        return;
                    } else {
                        if (this.syc == null) {
                            this.syc = new zb(this, this.bhi);
                            sz();
                            return;
                        }
                        return;
                    }
                }
                return;
            }
            if (this.skm && this.f27301bh == 2) {
                zb zbVar2 = this.syc;
                if (zbVar2 != null && zbVar2.zb()) {
                    sz();
                } else if (this.syc == null) {
                    this.syc = new zb(this, this.bhi);
                    sz();
                }
            }
        }
    }

    public int yzp() {
        return (this.f27346xz == -1 || !this.skm) ? 1 : 2;
    }

    private boolean ok(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.contains("/union-fe/playable/") || str.contains("/union-fe-sg/playable/") || str.contains("/union-fe-i18n/playable/");
    }

    public String dj() {
        return this.f27326py;
    }

    public Set<String> ea() {
        return this.f27335tx.ycx();
    }

    public boolean fby() {
        return this.pyn;
    }

    public JSONObject jc() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("send_click", this.f27322nq);
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "XOs5pQ+9cMaCRtJ+gBijI2j6LIEWrw==", 903);
            ul.ycx("PlayablePlugin", "getPlayableClickStatus error", th2);
            return new JSONObject();
        }
    }

    public boolean jw() {
        return this.skm;
    }

    public String lt() {
        return this.dfk;
    }

    public String lud() {
        return this.qn;
    }

    public JSONObject ry() {
        try {
            boolean zYcx = lud.ycx(this.bjp, "android.permission.CAMERA");
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("result", zYcx);
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "XOs5tgKxbNWBetJPgRizO1LhIw==", 949);
            ul.ycx("PlayablePlugin", "getCameraPermission error", th2);
            return new JSONObject();
        }
    }

    public JSONObject sya() {
        return this.f27333te;
    }

    public String ul() {
        return this.f27303cu;
    }

    public fby dj(String str) {
        this.dfk = str;
        return this;
    }

    public void ea(String str) {
        this.fby.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.3
            @Override // java.lang.Runnable
            public void run() {
                fby.ry(fby.this);
            }
        });
    }

    public JSONObject fby(JSONObject jSONObject) {
        if (jSONObject == null) {
            return new JSONObject();
        }
        int iOptInt = jSONObject.optInt(TTConst.TRACK_TYPE, 0);
        JSONObject jSONObject2 = new JSONObject();
        try {
            if (iOptInt == 1) {
                jSONObject2.put("result", lud.zb(this.bjp, "android.permission.RECORD_AUDIO"));
                return jSONObject2;
            }
            if (iOptInt == 2) {
                jSONObject2.put("result", lud.zb(this.bjp, "android.permission.CAMERA"));
                return jSONObject2;
            }
            if (iOptInt != 3) {
                return jSONObject2;
            }
            jSONObject2.put("result", lud.ycx(this.bjp));
            return jSONObject2;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "S+IsjAK+ZcKwT8VQhQKzIVTgCJsCvmXC", 1859);
            return jSONObject2;
        }
    }

    public void jw(String str) {
        WebView webView;
        boolean z11 = this.f27301bh == -1;
        this.f27301bh = 2;
        if (!z11) {
            this.f27313jp = str;
            JSONObject jSONObject = new JSONObject();
            try {
                long jCurrentTimeMillis = System.currentTimeMillis();
                this.kgy = jCurrentTimeMillis;
                long j11 = this.rmy;
                jSONObject.put("playable_html_load_start_duration", j11 != -1 ? jCurrentTimeMillis - j11 : 0L);
                jSONObject.put("playable_has_show", yzp());
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoXNWMZthciDepJlL9JQ==", 2070);
                ul.ycx("PlayablePlugin", "reportUrlLoadFinish error", th2);
            }
            sya("PL_sdk_html_load_finish", jSONObject);
        }
        this.pks = false;
        this.fby.removeCallbacks(this.f27314jw);
        try {
            if (this.f27331sg == 0) {
                if (this.f27307dy && (webView = this.f27341uu) != null) {
                    this.f27307dy = false;
                    webView.evaluateJavascript(dwi(), new ValueCallback<String>() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.11
                        @Override // android.webkit.ValueCallback
                        public /* bridge */ /* synthetic */ void onReceiveValue(String str2) {
                        }
                    });
                }
                xz();
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoXNWMZthciDepJlL9JQ==", 2091);
            ul.ycx("PlayablePlugin", "crashMonitor error", th3);
        }
    }

    public fby lt(String str) {
        this.thx = str;
        return this;
    }

    public fby lud(String str) {
        this.f27303cu = str;
        return this;
    }

    public JSONObject ok() {
        try {
            boolean zYcx = lud.ycx(this.bjp, "android.permission.RECORD_AUDIO");
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("result", zYcx);
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "XOs5pwa/ZtWEa8JZhR6QLUnjJIYQtWbJ", 936);
            ul.ycx("PlayablePlugin", "getCameraPermission error", th2);
            return new JSONObject();
        }
    }

    public fby sya(String str) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("playable_style", str);
            this.f27333te = jSONObject;
            return this;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5pQ+9cMaCRtJumAisLQ==", 634);
            ul.ycx("PlayablePlugin", "setPlayableStyle error", th2);
            return this;
        }
    }

    public fby ul(String str) {
        int iIndexOf;
        String strDecode;
        this.f27327qt = str;
        try {
            Uri uri = Uri.parse(str);
            String scheme = uri.getScheme();
            if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)) {
                String host = uri.getHost();
                if (!"webview".equalsIgnoreCase(host) && (host == null || !host.contains("webview"))) {
                    if ("lynxview".equalsIgnoreCase(host) || (host != null && host.contains("lynxview"))) {
                        if (this.f27331sg == -1) {
                            zb(2);
                        } else {
                            zb(1);
                        }
                    }
                } else {
                    zb(0);
                    String queryParameter = uri.getQueryParameter(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
                    if (!TextUtils.isEmpty(queryParameter) && (strDecode = Uri.decode(queryParameter)) != null) {
                        int iIndexOf2 = strDecode.indexOf("?");
                        str = iIndexOf2 != -1 ? strDecode.substring(0, iIndexOf2) : strDecode;
                    }
                }
            } else {
                zb(0);
                if (str != null && (iIndexOf = str.indexOf("?")) != -1) {
                    str = str.substring(0, iIndexOf);
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5oBGw", 1320);
        }
        this.row = str;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(View view) {
        if (view == null) {
            return;
        }
        try {
            if (this.f27343wk == view.getWidth() && this.f27351zk == view.getHeight()) {
                return;
            }
            this.f27343wk = view.getWidth();
            this.f27351zk = view.getHeight();
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("width", this.f27343wk);
            jSONObject.put("height", this.f27351zk);
            ycx(n.f39153g, jSONObject);
            this.ujb = jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses+kBeKYMKXbtZJjTuzJ1XMNKMKuX4=", 596);
            ul.ycx("PlayablePlugin", "resetViewDataJsonByView error", th2);
        }
    }

    public fby dj(boolean z11) {
        this.f27322nq = z11;
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("send_click", this.f27322nq);
            ycx("change_playable_click", jSONObject);
            return this;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5pQ+9cMaCRtJ+gBijIw==", 892);
            ul.ycx("PlayablePlugin", "setPlayableClick error", th2);
            return this;
        }
    }

    public void lt(JSONObject jSONObject) {
        zb(2, jSONObject != null ? jSONObject.optString("error_msg", "The material directly invokes the exception pocket mask on the client") : "The material directly invokes the exception pocket mask on the client");
    }

    public void lud(JSONObject jSONObject) {
        this.giw = jSONObject;
        this.duz++;
        rmy();
        this.fby.removeCallbacks(this.f27308ea);
        if (this.f27334tn) {
            this.yzp = System.currentTimeMillis();
            this.f27340ur = System.currentTimeMillis();
            this.f27344wr = 0L;
            int i5 = this.f27331sg;
            if (i5 == 0) {
                WebView webView = this.f27341uu;
                if (webView != null) {
                    webView.evaluateJavascript("javascript:typeof playable_callJS === 'function' && playable_callJS()", new ValueCallback<String>() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.10
                        @Override // android.webkit.ValueCallback
                        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
                        public void onReceiveValue(String str) {
                            fby.this.f27344wr = System.currentTimeMillis();
                        }
                    });
                }
            } else if (i5 == 1 || i5 == 2) {
                ycx("playable_stuck_check_ping", new JSONObject());
            }
            this.fby.postDelayed(this.f27308ea, this.bhi);
        }
    }

    private void ycx(Context context, sya syaVar, com.bytedance.sdk.openadsdk.wwx.ycx ycxVar) {
        this.htf = UUID.randomUUID().toString();
        this.bjp = context;
        this.ufy = ycxVar;
        this.nzi = syaVar;
        jc.ycx(ycxVar);
        this.f27335tx = new lt(this);
        nji();
        if (this.f27341uu == null) {
            this.f27306dw = 4;
            this.fby.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.4
                @Override // java.lang.Runnable
                public void run() {
                    fby.this.ycx(5, "webview is null");
                }
            });
        }
    }

    public void jc(String str) {
        this.fby.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.2
            @Override // java.lang.Runnable
            public void run() {
                fby.ok(fby.this);
            }
        });
    }

    public void lt(boolean z11) {
        this.f27309gi = z11;
    }

    public fby sya(boolean z11) throws JSONException {
        if (this.f27306dw != -1 && this.skm != z11) {
            this.skm = z11;
            JSONObject jSONObject = new JSONObject();
            try {
                if (!this.skm) {
                    jSONObject.put("playable_background_show_type", this.hpv);
                }
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5owq5fsaCRtI=", 818);
            }
            sya(this.skm ? "PL_sdk_viewable_true" : "PL_sdk_viewable_false", jSONObject);
            if (this.f27346xz == -1 && this.skm) {
                this.f27346xz = System.currentTimeMillis();
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jSONObject2.put("render_type", this.f27306dw == 1 ? 1 : 2);
                    int i5 = this.f27306dw;
                    if (i5 != -1) {
                        jSONObject2.put("webview_state", i5);
                    }
                } catch (JSONException e11) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5owq5fsaCRtI=", 835);
                }
                sya("PL_sdk_page_show", jSONObject2);
            }
            if (this.f27346xz != -1 && !this.skm && !this.hfd) {
                this.hfd = true;
            }
            if (this.skm) {
                this.aeu = System.currentTimeMillis();
            } else if (this.aeu != -1) {
                this.f27300av += System.currentTimeMillis() - this.aeu;
                this.aeu = -1L;
            }
            try {
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("viewStatus", this.skm);
                ycx("viewableChange", jSONObject3);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5owq5fsaCRtI=", 871);
                ul.ycx("PlayablePlugin", "setViewable error", th2);
            }
            if (this.skm) {
                xz();
            } else {
                rmy();
            }
        }
        return this;
    }

    public void dj(JSONObject jSONObject) {
        if (jSONObject != null) {
            this.f27342uz = jSONObject.optString("section");
        }
    }

    private String dj(String str, String str2) {
        String str3 = String.format("rubeex://playable-minigamelite?id=%1s&schema=%2s", str, Uri.encode(str2));
        this.row = str3;
        return str3;
    }

    public void fby(String str) {
        this.f27301bh = 1;
        JSONObject jSONObject = new JSONObject();
        try {
            long jCurrentTimeMillis = System.currentTimeMillis();
            this.rmy = jCurrentTimeMillis;
            long j11 = this.f27346xz;
            jSONObject.put("playable_page_show_duration", j11 != -1 ? jCurrentTimeMillis - j11 : 0L);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoXNWMZthciCK0KUn6", 1948);
            ul.ycx("PlayablePlugin", "reportUrlLoadStart error", th2);
        }
        sya("PL_sdk_html_load_start", jSONObject);
        this.pks = true;
        this.f27325pk = true;
        if (this.sjd) {
            rmf();
            this.pks = false;
            this.f27325pk = false;
        }
        if (this.wie) {
            try {
                StringBuffer stringBuffer = new StringBuffer();
                StringBuffer stringBuffer2 = new StringBuffer();
                StringBuffer stringBuffer3 = new StringBuffer();
                if (lud.ycx(this.bjp, lud.f27366ok)) {
                    stringBuffer.append("Microphone_");
                    stringBuffer2.append("1");
                    if (lud.zb(this.bjp, "android.permission.RECORD_AUDIO")) {
                        stringBuffer3.append("1");
                    } else {
                        stringBuffer3.append("0");
                    }
                } else {
                    stringBuffer2.append("0");
                    stringBuffer3.append("0");
                }
                if (lud.ycx(this.bjp, lud.f27362ea)) {
                    stringBuffer.append("Magetometer_");
                    stringBuffer2.append("1");
                    stringBuffer3.append("1");
                } else {
                    stringBuffer2.append("0");
                    stringBuffer3.append("0");
                }
                if (lud.ycx(this.bjp, lud.f27363jc)) {
                    stringBuffer.append("Accelerometer_");
                    stringBuffer2.append("1");
                    stringBuffer3.append("1");
                } else {
                    stringBuffer2.append("0");
                    stringBuffer3.append("0");
                }
                if (lud.ycx(this.bjp, lud.f27364jw)) {
                    stringBuffer.append("Gyro_");
                    stringBuffer2.append("1");
                    stringBuffer3.append("1");
                } else {
                    stringBuffer2.append("0");
                    stringBuffer3.append("0");
                }
                if (lud.ycx(this.bjp, lud.fby)) {
                    stringBuffer.append("Camera_");
                    stringBuffer2.append("1");
                    if (lud.zb(this.bjp, "android.permission.CAMERA")) {
                        stringBuffer3.append("1");
                    } else {
                        stringBuffer3.append("0");
                    }
                } else {
                    stringBuffer2.append("0");
                    stringBuffer3.append("0");
                }
                if (lud.ycx(this.bjp, lud.f27367ul)) {
                    stringBuffer.append("Photo");
                    stringBuffer2.append("1");
                    if (lud.ycx(this.bjp)) {
                        stringBuffer3.append("1");
                    } else {
                        stringBuffer3.append("0");
                    }
                } else {
                    stringBuffer2.append("0");
                    stringBuffer3.append("0");
                }
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("playable_available_hardware_name", stringBuffer.toString());
                jSONObject2.put("playable_available_hardware_code", stringBuffer2.toString());
                jSONObject2.put("playable_available_hardware_auth_code", stringBuffer3.toString());
                sya("PL_sdk_hardware_detect", jSONObject2);
                this.wie = false;
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoXNWMZthciCK0KUn6", 2033);
                ul.ycx("PlayablePlugin", "Hardware detect error", th3);
            }
        }
    }

    public JSONObject dj(String str, JSONObject jSONObject) {
        if (ul.ycx() && jSONObject != null) {
            jSONObject.toString();
        }
        JSONObject jSONObjectYcx = this.f27335tx.ycx(str, jSONObject);
        if (ul.ycx() && jSONObjectYcx != null) {
            jSONObjectYcx.toString();
        }
        return jSONObjectYcx;
    }

    public Map<String, String> zb() {
        return this.vyl;
    }

    public void ycx(View view) {
        if (view == null) {
            return;
        }
        try {
            this.f27345xf = new WeakReference<>(view);
            zb(view);
            view.getViewTreeObserver().addOnGlobalLayoutListener(this.hti);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5owq5fuGPWORenhSlJmjnN5A=", 576);
            ul.ycx("PlayablePlugin", "setViewForScreenSize error", th2);
        }
    }

    public fby zb(String str) {
        this.f27326py = str;
        return this;
    }

    public fby zb(boolean z11) {
        this.spv = z11;
        return this;
    }

    private void lud(String str, JSONObject jSONObject) throws JSONException {
        try {
            int i5 = this.f27331sg;
            if (i5 == 0) {
                if (this.f27299aq != ycx.LAND_PAGE && !ok(this.row)) {
                    dc();
                }
                jSONObject.put("playable_url", this.row);
            } else if (i5 == 3 || i5 == 4) {
                jSONObject.put("playable_url", dj(this.f7if, this.f27316ko));
            } else if (i5 == 1 || i5 == 2) {
                jSONObject.put("playable_url", sya(this.bah, this.rzo));
            }
            jSONObject.put("playable_render_type", this.f27331sg);
            if (this.ufy != null) {
                if (this.f27331sg == 0 && (this.f27299aq != ycx.LAND_PAGE || ok(this.row))) {
                    this.ufy.ycx(jSONObject);
                } else if (this.f27331sg != 0) {
                    this.ufy.ycx(jSONObject);
                }
            }
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoQ/Szbvx4mhSuPA==", 2328);
        }
    }

    public fby zb(long j11) {
        if (j11 <= 0) {
            this.tru = 10L;
            return this;
        }
        this.tru = j11;
        return this;
    }

    public void zb(JSONObject jSONObject) {
        if (this.ufy != null) {
            try {
                jSONObject.optBoolean("isPrevent", false);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "S/wogwayffOPX9RVqQelJk8=", 1007);
            }
        }
    }

    public Context ycx() {
        return this.bjp;
    }

    public fby ycx(String str, String str2) {
        this.vyl.put(str, str2);
        return this;
    }

    public fby ycx(String str) {
        this.qn = str;
        return this;
    }

    public void zb(String str, String str2) {
        Bitmap bitmapYcx;
        if (TextUtils.isEmpty(str2) || (bitmapYcx = lud.ycx(str2)) == null) {
            return;
        }
        MediaStore.Images.Media.insertImage(this.bjp.getContentResolver(), bitmapYcx, str, b.f42142b);
    }

    public fby ycx(boolean z11) {
        this.pyn = z11;
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("endcard_mute", this.pyn);
            ycx("volumeChange", jSONObject);
            return this;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "SOs5vBCRfNOF", 672);
            ul.ycx("PlayablePlugin", "setIsMute error", th2);
            return this;
        }
    }

    public void jw(JSONObject jSONObject) {
        if (jSONObject != null) {
            boolean zOptBoolean = jSONObject.optBoolean("success", true);
            if (zOptBoolean) {
                this.f27301bh = 3;
                xz();
            } else {
                this.f27301bh = -2;
            }
            if (zOptBoolean || !this.wwx) {
                return;
            }
            this.wwx = false;
            this.pks = false;
            this.f27325pk = false;
            this.fby.removeCallbacks(this.f27314jw);
            this.fby.removeCallbacks(this.f27312jc);
            ycx(4, "CaseRenderFail");
        }
    }

    public JSONObject ul(JSONObject jSONObject) {
        if (jSONObject == null) {
            return new JSONObject();
        }
        int iOptInt = jSONObject.optInt(TTConst.TRACK_TYPE, 0);
        JSONObject jSONObject2 = new JSONObject();
        if (iOptInt == 1) {
            return ok();
        }
        if (iOptInt != 2) {
            return iOptInt != 3 ? jSONObject2 : xkz();
        }
        return ry();
    }

    public fby zb(int i5) {
        this.f27331sg = i5;
        return this;
    }

    public void zb(int i5, String str) {
        this.bba = i5;
        if (this.giw == null) {
            this.giw = new JSONObject();
        }
        try {
            this.giw.put("playable_stuck_type", i5);
            this.giw.put("playable_stuck_reason", str);
            if (this.yzp > 0) {
                this.giw.put("playable_stuck_duration", System.currentTimeMillis() - this.yzp);
            } else {
                this.giw.put("playable_stuck_duration", 0L);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoWcaHT+RJmRKr", 2233);
        }
        sya("PL_sdk_page_stuck", this.giw);
        rmy();
        if (this.ufy == null || i5 != 2) {
            return;
        }
        this.giw = new JSONObject();
    }

    public fby ycx(long j11) {
        if (j11 <= 0) {
            this.f27310hf = 10L;
            return this;
        }
        this.f27310hf = j11;
        return this;
    }

    public fby lud(boolean z11) {
        this.sjd = z11;
        return this;
    }

    public void ul(boolean z11) {
        this.f27329rt = z11;
    }

    public void ycx(int i5) {
        this.f27306dw = i5;
    }

    public void ycx(JSONObject jSONObject) {
        com.bytedance.sdk.openadsdk.wwx.ycx ycxVar = this.ufy;
        if (ycxVar == null || ycxVar.zb(jSONObject) || jSONObject == null) {
            return;
        }
        String strOptString = jSONObject.optString("resource_base64");
        if (TextUtils.isEmpty(strOptString)) {
            return;
        }
        int iOptInt = jSONObject.optInt("resource_type", -1);
        String strOptString2 = jSONObject.optString("resource_name", "playable_media");
        if (iOptInt == 1) {
            zb(strOptString2, strOptString);
        }
    }

    public void ycx(String str, JSONObject jSONObject) {
        if (this.f27329rt) {
            if (!ul.ycx() || jSONObject == null) {
                return;
            }
            jSONObject.toString();
            return;
        }
        if (ul.ycx() && jSONObject != null) {
            jSONObject.toString();
        }
        sya syaVar = this.nzi;
        if (syaVar != null) {
            syaVar.ycx(str, jSONObject);
        }
    }

    public fby sya(JSONObject jSONObject) {
        this.f27317kt = jSONObject;
        return this;
    }

    public void zb(String str, JSONObject jSONObject) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        lud(str, jSONObject);
    }

    private void sya(int i5, String str) {
        com.bytedance.sdk.openadsdk.wwx.ycx ycxVar = this.ufy;
        if (ycxVar != null) {
            ycxVar.ycx(i5, str);
        }
    }

    private String sya(String str, String str2) {
        String queryParameter;
        String queryParameter2;
        if (TextUtils.isEmpty(this.f27298ag) && !TextUtils.isEmpty(this.f27327qt)) {
            Uri uri = Uri.parse(this.f27327qt);
            String host = uri.getHost();
            if (!"lynxview".equalsIgnoreCase(host) && (host == null || !host.contains("lynxview"))) {
                queryParameter = b.f42142b;
                queryParameter2 = b.f42142b;
            } else {
                queryParameter = uri.getQueryParameter("surl");
                queryParameter2 = uri.getQueryParameter("playable_hash");
            }
            Uri.Builder builderAppendQueryParameter = new Uri.Builder().scheme(uri.getScheme()).authority(host).appendQueryParameter("surl", queryParameter);
            if (!TextUtils.isEmpty(queryParameter2)) {
                builderAppendQueryParameter.appendQueryParameter("playable_hash", queryParameter2);
            }
            this.f27298ag = builderAppendQueryParameter.toString();
        }
        return this.f27298ag;
    }

    public fby ycx(float f11) {
        this.f27324pg = f11;
        return this;
    }

    public void ycx(int i5, String str) {
        rmy();
        sya(i5, str);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("playable_code", i5);
            jSONObject.put("playable_msg", str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoTsuPSNZRqhCpJF8=", 2211);
            ul.ycx("PlayablePlugin", "reportRenderFatal error", th2);
        }
        sya("PL_sdk_global_faild", jSONObject);
    }

    public void sya(String str, JSONObject jSONObject) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        try {
            if (!this.f27328rl && this.xym > 0) {
                this.f27328rl = true;
            }
            if ("PL_sdk_html_load_start".equals(str) || "PL_sdk_html_load_finish".equals(str) || "PL_sdk_html_load_error".equals(str)) {
                jSONObject.put("usecache", this.f27309gi ? 1 : 0);
            }
            jSONObject.put("playable_event", str);
            jSONObject.put("playable_ts", System.currentTimeMillis());
            jSONObject.put("playable_viewable", this.skm);
            jSONObject.put("playable_session_id", this.htf);
            int i5 = this.f27331sg;
            if (i5 == 0) {
                if (this.f27299aq != ycx.LAND_PAGE && !ok(this.row)) {
                    dc();
                }
                jSONObject.put("playable_url", this.row);
            } else if (i5 == 3 || i5 == 4) {
                jSONObject.put("playable_url", dj(this.f7if, this.f27316ko));
            } else if (i5 == 1 || i5 == 2) {
                jSONObject.put("playable_url", sya(this.bah, this.rzo));
            }
            jSONObject.put("playable_full_url", this.f27327qt);
            jSONObject.put("playable_replay_count", this.f27352zr);
            jSONObject.put("playable_is_prerender", this.spv);
            jSONObject.put("playable_is_preload", this.f27328rl);
            jSONObject.put("playable_render_type", this.f27331sg);
            jSONObject.put("playable_scenes_type", this.f27299aq.ordinal());
            boolean zIsEmpty = TextUtils.isEmpty(this.bah);
            String str2 = b.f42142b;
            jSONObject.put("playable_gecko_key", zIsEmpty ? b.f42142b : this.bah);
            if (!TextUtils.isEmpty(this.rzo)) {
                str2 = this.rzo;
            }
            jSONObject.put("playable_gecko_channel", str2);
            jSONObject.put("playable_sdk_version", "6.6.0");
            jSONObject.put("playable_minigamelite_id", this.f7if);
            jSONObject.put("playable_minigamelite_schema", this.f27316ko);
            jSONObject.put("playable_is_debug", this.xh);
            jSONObject.put("playable_retry_count", this.f27320mp);
            jSONObject.put("playable_enter_from", this.f27336uf);
            jSONObject.put("playable_sequence", this.duz);
            jSONObject.put("playable_current_section", this.f27342uz);
            jSONObject.put("is_playable_finish", this.f27319lv);
            jSONObject.put("playable_card_session", this.oby);
            jSONObject.put("playable_video_session", this.nji);
            jSONObject.put("playable_network_type", dy());
            jSONObject.put("playable_lynx_version", this.oty);
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("adExtraData", jSONObject);
            jSONObject2.put("tag", this.thx);
            jSONObject2.put("nt", 4);
            jSONObject2.put("category", "umeng");
            jSONObject2.put("is_ad_event", "1");
            jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_REFER, "playable");
            jSONObject2.put("value", this.f27317kt.opt("cid"));
            jSONObject2.put("log_extra", this.f27317kt.opt("log_extra"));
            int i11 = this.f27331sg;
            if (i11 != -1 && i11 != -2) {
                if (this.ufy != null) {
                    List<JSONObject> list = this.znc;
                    if (list != null && !list.isEmpty()) {
                        Iterator<JSONObject> it = this.znc.iterator();
                        while (it.hasNext()) {
                            JSONObject jSONObjectOptJSONObject = it.next().optJSONObject("adExtraData");
                            if (jSONObjectOptJSONObject != null) {
                                jSONObjectOptJSONObject.put("playable_render_type", this.f27331sg);
                                jSONObjectOptJSONObject.put("playable_url", this.row);
                            }
                            this.ufy.ycx(jSONObjectOptJSONObject);
                        }
                        this.znc.clear();
                    }
                    if (this.f27331sg == 0 && (this.f27299aq != ycx.LAND_PAGE || ok(this.row))) {
                        this.ufy.ycx(jSONObject);
                        return;
                    } else {
                        if (this.f27331sg != 0) {
                            this.ufy.ycx(jSONObject);
                            return;
                        }
                        return;
                    }
                }
                return;
            }
            if (this.znc == null) {
                this.znc = new ArrayList();
            }
            this.znc.add(jSONObject2);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "Ses9mhGoTNGFRMM=", 2441);
            ul.ycx("PlayablePlugin", "reportEvent error", th2);
        }
    }

    public void ycx(int i5, String str, String str2) {
        this.f27301bh = -1;
        this.f27313jp = str2;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("playable_code", i5);
            jSONObject.put("playable_msg", str);
            jSONObject.put("playable_fail_url", str2);
            jSONObject.put("playable_has_show", yzp());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "VOAakAGObMSFQ8FYiDSyOlT8", 2706);
            ul.ycx("PlayablePlugin", "onWebReceivedError error", th2);
        }
        sya("PL_sdk_html_load_error", jSONObject);
        if (this.wwx) {
            this.wwx = false;
            this.pks = false;
            this.f27325pk = false;
            this.fby.removeCallbacks(this.f27314jw);
            this.fby.removeCallbacks(this.f27312jc);
            ycx(1, "ContainerLoadFail");
        }
    }

    public void ycx(boolean z11, String str, int i5) {
        if (z11) {
            this.f27301bh = -1;
            this.f27313jp = str;
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("playable_code", i5);
                jSONObject.put("playable_msg", "url load error");
                jSONObject.put("playable_fail_url", str);
                jSONObject.put("playable_has_show", yzp());
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR8=", "VOAakAGObMSFQ8FYiDm0PEvLP4cMrg==", 2781);
                ul.ycx("PlayablePlugin", "onWebReceivedHttpError error", th2);
            }
            sya("PL_sdk_html_load_error", jSONObject);
            if (this.wwx) {
                this.wwx = false;
                this.pks = false;
                this.f27325pk = false;
                this.fby.removeCallbacks(this.f27314jw);
                this.fby.removeCallbacks(this.f27312jc);
                ycx(1, "ContainerLoadFail");
            }
        }
    }

    private fby(Context context, int i5, sya syaVar, com.bytedance.sdk.openadsdk.wwx.ycx ycxVar) {
        this.f27318lt = "playable_stuck_check_ping";
        this.f27339ul = "playable_apply_media_permission_callback";
        this.fby = new Handler(Looper.getMainLooper());
        this.f27323ok = new Handler(Looper.getMainLooper());
        this.f27307dy = true;
        this.wie = true;
        this.pmi = true;
        this.ycx = "PL_sdk_playable_global_viewable";
        this.f27350zb = "PL_sdk_page_screen_blank";
        this.sya = "PL_sdk_playable_destroy_analyze_summary";
        this.f27304dj = "PL_sdk_playable_hardware_dialog_cancel";
        this.lud = "PL_sdk_playable_hardware_dialog_setting";
        this.f27337uh = new HashSet(Arrays.asList("adInfo", "appInfo", "subscribe_app_ad", "download_app_ad"));
        this.htf = null;
        this.thx = "embeded_ad";
        this.wwx = true;
        this.f27334tn = true;
        this.f27305dv = false;
        this.oty = b.f42142b;
        this.f27310hf = 10L;
        this.tru = 10L;
        this.bhi = Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE;
        this.f27300av = 0L;
        this.rmf = 0L;
        this.aeu = -1L;
        this.f27346xz = -1L;
        this.rmy = -1L;
        this.kgy = -1L;
        this.ifb = -1L;
        this.yzp = -1L;
        this.dwi = -1L;
        this.oby = b.f42142b;
        this.nji = b.f42142b;
        this.dc = b.f42142b;
        this.sz = b.f42142b;
        this.f27347yi = 0;
        this.xym = 0;
        this.f27328rl = false;
        this.f27352zr = 0;
        this.bba = -1;
        this.f27320mp = 0;
        this.f27336uf = 0;
        this.duz = 0;
        this.f27342uz = null;
        this.f27319lv = false;
        this.f27338ui = 0;
        this.hpv = 0;
        this.f27311iq = 0;
        this.dqs = 0;
        this.f27340ur = 0L;
        this.f27344wr = 0L;
        this.f27331sg = -2;
        this.f27301bh = 0;
        this.f27343wk = 0;
        this.f27351zk = 0;
        this.ujb = new JSONObject();
        this.vyl = new HashMap();
        this.f27317kt = new JSONObject();
        this.f27327qt = b.f42142b;
        this.f27321nc = 0.0f;
        this.vbt = 0.0f;
        this.hfd = false;
        this.xh = false;
        this.f27348yl = false;
        this.znc = new ArrayList();
        this.sjd = true;
        this.pks = true;
        this.f27325pk = true;
        this.hti = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.bytedance.sdk.openadsdk.wwx.fby.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                try {
                    View view = (View) fby.this.f27345xf.get();
                    if (view == null) {
                        return;
                    }
                    fby.this.zb(view);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKwRsJahR/keQ==", "VOAKmQy+aMusS85SmQU=", 280);
                    ul.ycx("PlayablePlugin", "onSizeChanged error", th2);
                }
            }
        };
        this.f27306dw = -1;
        this.f27331sg = i5;
        this.f27299aq = ycx.LAND_PAGE;
        ycx(context, syaVar, ycxVar);
    }

    public static fby ycx(Context context, WebView webView, sya syaVar, com.bytedance.sdk.openadsdk.wwx.ycx ycxVar) {
        if (syaVar == null || ycxVar == null) {
            return null;
        }
        if (webView == null) {
            return new fby(context, 0, syaVar, ycxVar);
        }
        return new fby(context, webView, syaVar, ycxVar, ycx.LAND_PAGE);
    }
}
