package com.bytedance.sdk.openadsdk.core;

import android.app.Activity;
import android.content.Context;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity;
import com.bytedance.sdk.openadsdk.core.model.dy;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.dj.ycx;
import com.bytedance.sdk.openadsdk.utils.DeviceUtils;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.google.ads.mediation.fyber.FyberMediationAdapter;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.ref.WeakReference;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class kgy implements com.bytedance.sdk.component.adexpress.lud.zb, tru.ycx, com.bytedance.sdk.openadsdk.ea.zb {

    /* renamed from: jw, reason: collision with root package name */
    private static final Map<String, Boolean> f25540jw;
    private HashMap<String, ea> aeu;

    /* renamed from: av, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ry.ea f25541av;
    private Context bba;
    private com.bytedance.sdk.openadsdk.ry.sya bhi;
    private String dc;
    private tru dqs;
    private com.bytedance.sdk.openadsdk.component.reward.sya.lt duz;

    /* renamed from: dv, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ry.ycx f25543dv;
    private com.bytedance.sdk.component.ycx.syc dwi;

    /* renamed from: dy, reason: collision with root package name */
    private int f25544dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f25545ea;
    private com.bytedance.sdk.openadsdk.core.widget.lt fby;
    private lud giw;

    /* renamed from: hf, reason: collision with root package name */
    private JSONObject f25546hf;
    private com.bytedance.sdk.openadsdk.component.reward.sya.ycx.sya hpv;
    private com.bytedance.sdk.component.adexpress.zb.ea htf;
    private boolean ifb;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ea.sya f25548jc;
    private WeakReference<com.bytedance.sdk.component.jw.fby> lud;

    /* renamed from: lv, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.component.reward.sya.jw f25550lv;

    /* renamed from: mp, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.syc.dj.zb f25551mp;
    private com.bytedance.sdk.openadsdk.ry.zb nji;
    private zb oby;

    /* renamed from: ok, reason: collision with root package name */
    private WeakReference<View> f25552ok;
    private com.bytedance.sdk.openadsdk.ry.lud oty;
    private com.bytedance.sdk.openadsdk.core.model.tn pmi;

    /* renamed from: rl, reason: collision with root package name */
    private boolean f25553rl;

    /* renamed from: ry, reason: collision with root package name */
    private String f25554ry;
    private String syc;
    private com.bytedance.sdk.openadsdk.core.jc.dy thx;

    /* renamed from: tn, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ea.dj f25555tn;
    private com.bytedance.sdk.openadsdk.core.sya.dj tru;

    /* renamed from: uf, reason: collision with root package name */
    private Activity f25556uf;

    /* renamed from: uh, reason: collision with root package name */
    private JSONObject f25557uh;

    /* renamed from: ui, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.component.reward.sya.dj f25558ui;

    /* renamed from: ul, reason: collision with root package name */
    private String f25559ul;

    /* renamed from: ur, reason: collision with root package name */
    private ycx f25560ur;

    /* renamed from: uz, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.component.reward.sya.ycx f25561uz;

    /* renamed from: wr, reason: collision with root package name */
    private dj f25562wr;
    private JSONObject wwx;
    private int xkz;
    private com.bytedance.sdk.openadsdk.ry.fby xym;
    protected Map<String, Object> ycx;

    /* renamed from: yi, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.widget.ycx.zb f25564yi;
    private com.bytedance.sdk.openadsdk.dj.dj.lud yzp;

    /* renamed from: zr, reason: collision with root package name */
    private boolean f25566zr;
    private boolean wie = true;
    private boolean rmf = true;

    /* renamed from: xz, reason: collision with root package name */
    private boolean f25563xz = false;
    private boolean rmy = false;
    private boolean kgy = false;

    /* renamed from: zb, reason: collision with root package name */
    boolean f25565zb = false;
    boolean sya = false;

    /* renamed from: dj, reason: collision with root package name */
    boolean f25542dj = false;
    private boolean sz = false;

    /* renamed from: iq, reason: collision with root package name */
    private AtomicBoolean f25547iq = new AtomicBoolean(false);

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.sdk.component.utils.tru f25549lt = new com.bytedance.sdk.component.utils.tru(Looper.getMainLooper(), this);

    public static class dj implements Runnable {
        private final com.bytedance.sdk.openadsdk.core.jc.dy ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final JSONObject f25575zb;

        public dj(com.bytedance.sdk.openadsdk.core.jc.dy dyVar, JSONObject jSONObject) {
            this.ycx = dyVar;
            this.f25575zb = jSONObject;
        }

        @Override // java.lang.Runnable
        public void run() {
            kgy.zb(this.ycx, this.f25575zb);
        }
    }

    public interface lud {
        void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar);
    }

    public static class sya {

        /* renamed from: dj, reason: collision with root package name */
        public JSONObject f25576dj;
        public int lud;
        public String sya;
        public String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public String f25577zb;
    }

    public interface ycx {
        void ycx();
    }

    public interface zb {
        void ycx();
    }

    static {
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        f25540jw = concurrentHashMap;
        Boolean bool = Boolean.TRUE;
        concurrentHashMap.put("log_event", bool);
        concurrentHashMap.put("private", bool);
        concurrentHashMap.put("dispatch_message", bool);
        concurrentHashMap.put("custom_event", bool);
        concurrentHashMap.put("log_event_v3", bool);
    }

    public kgy(Context context) {
        this.bba = context;
    }

    private JSONObject aeu() {
        return zb(this.pmi);
    }

    private void av() {
        com.bytedance.sdk.openadsdk.ry.ea eaVar = this.f25541av;
        if (eaVar == null) {
            return;
        }
        eaVar.zb();
    }

    private void bhi() {
        com.bytedance.sdk.openadsdk.ry.ea eaVar = this.f25541av;
        if (eaVar == null) {
            return;
        }
        eaVar.ycx();
    }

    private WebView dv() {
        com.bytedance.sdk.component.jw.fby fbyVar;
        WeakReference<com.bytedance.sdk.component.jw.fby> weakReference = this.lud;
        if (weakReference == null || (fbyVar = weakReference.get()) == null) {
            return null;
        }
        return fbyVar.getWebView();
    }

    private void dy(JSONObject jSONObject) throws Exception {
        if (TextUtils.isEmpty(com.bytedance.sdk.openadsdk.core.model.av.jc(this.pmi))) {
            return;
        }
        jSONObject.put("playable_style", com.bytedance.sdk.openadsdk.core.model.av.jc(this.pmi));
    }

    private static List<String> hf() {
        return Arrays.asList("appInfo", "adInfo", "getTemplateInfo", "getTeMaiAds");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void htf(JSONObject jSONObject) {
        if (this.thx == null || jSONObject == null) {
            return;
        }
        try {
            this.thx.ycx(jSONObject.optInt("stateType", -1));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5Ss+BRNBYuhikLVTdOZQXuQ==", 1544);
        }
    }

    private JSONObject oty() {
        try {
            WeakReference<View> weakReference = this.f25552ok;
            if (weakReference == null) {
                return null;
            }
            View view = weakReference.get();
            com.bytedance.sdk.component.jw.fby fbyVar = this.lud.get();
            if (view != null && fbyVar != null) {
                int[] iArrZb = dc.zb(view);
                int[] iArrZb2 = dc.zb((View) fbyVar);
                if (iArrZb != null && iArrZb2 != null) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("x", dc.sya(pmi.ycx(), iArrZb[0] - iArrZb2[0]));
                    jSONObject.put("y", dc.sya(pmi.ycx(), iArrZb[1] - iArrZb2[1]));
                    jSONObject.put("w", dc.sya(pmi.ycx(), view.getWidth()));
                    jSONObject.put("h", dc.sya(pmi.ycx(), view.getHeight()));
                    jSONObject.put("isExist", true);
                    return jSONObject;
                }
            }
            return null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "XOs5tg+zesKiX8NJgx+JJl3h", 462);
            return null;
        }
    }

    private void pmi(JSONObject jSONObject) {
        com.bytedance.sdk.openadsdk.ry.sya syaVar = this.bhi;
        if (syaVar == null || jSONObject == null) {
            return;
        }
        syaVar.ycx(jSONObject.optBoolean("isRenderSuc", false), jSONObject.optInt(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1), jSONObject.optString("msg", b.f42142b));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void rmf() {
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            dyVar.ycx();
        }
    }

    private void rmy() {
        if (this.f25548jc == null) {
            this.f25548jc = com.bytedance.sdk.openadsdk.ea.ycx.ycx(this, this.pmi);
        }
    }

    private void syc(JSONObject jSONObject) throws Exception {
        ycx(jSONObject, this.pmi);
    }

    private boolean thx(JSONObject jSONObject) throws JSONException {
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null && jSONObject != null) {
            double dSya = dyVar.sya();
            double dDj = this.thx.dj();
            int iLud = this.thx.lud();
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.TopLayoutHelper", "current:", Double.valueOf(dSya), "state", Integer.valueOf(iLud), "countdownTime", Double.valueOf(dDj));
            try {
                jSONObject.put("currentTime", dSya / 1000.0d);
                if (dDj > 0.0d) {
                    jSONObject.put("countDownTime", dDj / 1000.0d);
                }
                jSONObject.put("state", iLud);
                return true;
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5TsKUacJPnhSuPG3nKZAMj33GlE8=", 1570);
            }
        }
        return false;
    }

    private boolean tn(JSONObject jSONObject) {
        return jSONObject.has("borderRadiusTopLeft") && jSONObject.has("borderRadiusBottomLeft") && jSONObject.has("borderRadiusTopRight") && jSONObject.has("borderRadiusBottomRight");
    }

    private Context tru() {
        WeakReference<com.bytedance.sdk.component.jw.fby> weakReference = this.lud;
        Activity activityYcx = (weakReference == null || weakReference.get() == null) ? null : com.bytedance.sdk.component.utils.zb.ycx(this.lud.get());
        return activityYcx == null ? this.bba : activityYcx;
    }

    private void uh(JSONObject jSONObject) {
        if (this.bba == null || TextUtils.isEmpty(pmi.dj().dc())) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.model.tn tnVarYcx = ycx(this.pmi, jSONObject);
        lud ludVar = this.giw;
        if (ludVar != null) {
            ludVar.ycx(tnVarYcx);
        } else if (com.bytedance.sdk.openadsdk.utils.zb.lud() && pmi.dj().av()) {
            IABLandingPageActivity.ycx(this.bba, tnVarYcx, this.dc);
        } else {
            TTWebsiteActivity.ycx(this.bba, tnVarYcx, this.dc);
        }
    }

    private void wie(JSONObject jSONObject) {
        com.bytedance.sdk.openadsdk.dj.dj.lud ludVar;
        if (jSONObject == null || (ludVar = this.yzp) == null) {
            return;
        }
        ludVar.zb(jSONObject);
    }

    private void wwx(JSONObject jSONObject) {
        double dOptDouble;
        double dOptDouble2;
        boolean z11;
        int i5;
        double d5;
        double d11;
        Objects.toString(jSONObject);
        if (this.htf == null || jSONObject == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.dj.lud ludVar = this.yzp;
        if (ludVar != null) {
            ludVar.syc();
        }
        com.bytedance.sdk.component.adexpress.zb.xkz xkzVar = new com.bytedance.sdk.component.adexpress.zb.xkz();
        xkzVar.ycx(1);
        try {
            boolean zOptBoolean = jSONObject.optBoolean("isRenderSuc");
            String strOptString = jSONObject.optString("engineType");
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("AdSize");
            if (jSONObjectOptJSONObject != null) {
                dOptDouble = jSONObjectOptJSONObject.optDouble("width");
                dOptDouble2 = jSONObjectOptJSONObject.optDouble("height");
            } else {
                dOptDouble = 0.0d;
                dOptDouble2 = 0.0d;
            }
            JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("videoInfo");
            if (jSONObjectOptJSONObject2 != null) {
                try {
                    double dOptDouble3 = jSONObjectOptJSONObject2.optDouble("x");
                    z11 = zOptBoolean;
                    i5 = 101;
                    double dOptDouble4 = jSONObjectOptJSONObject2.optDouble("y");
                    d5 = dOptDouble2;
                    double dOptDouble5 = jSONObjectOptJSONObject2.optDouble("width");
                    double dOptDouble6 = jSONObjectOptJSONObject2.optDouble("height");
                    if (tn(jSONObjectOptJSONObject2)) {
                        d11 = dOptDouble;
                        xkzVar.ycx((float) jSONObjectOptJSONObject2.optDouble("borderRadiusTopLeft"));
                        xkzVar.zb((float) jSONObjectOptJSONObject2.optDouble("borderRadiusTopRight"));
                        xkzVar.sya((float) jSONObjectOptJSONObject2.optDouble("borderRadiusBottomLeft"));
                        xkzVar.dj((float) jSONObjectOptJSONObject2.optDouble("borderRadiusBottomRight"));
                    } else {
                        d11 = dOptDouble;
                    }
                    xkzVar.sya(dOptDouble3);
                    xkzVar.dj(dOptDouble4);
                    xkzVar.lud(dOptDouble5);
                    xkzVar.lt(dOptDouble6);
                } catch (Exception e3) {
                    e = e3;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5W8KOTtJP", 1761);
                    xkzVar.zb(101);
                    xkzVar.ycx(jw.ycx(101));
                    this.htf.ycx(xkzVar);
                    return;
                }
            } else {
                z11 = zOptBoolean;
                d11 = dOptDouble;
                d5 = dOptDouble2;
                i5 = 101;
            }
            boolean zOptBoolean2 = jSONObject.optBoolean("is1NScene", false);
            this.f25547iq.set(zOptBoolean2);
            String strOptString2 = jSONObject.optString("msg", jw.ycx(i5));
            int iOptInt = jSONObject.optInt(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, i5);
            xkzVar.zb(z11);
            xkzVar.ycx(d11);
            xkzVar.zb(d5);
            xkzVar.ycx(strOptString2);
            xkzVar.zb(iOptInt);
            xkzVar.zb(strOptString);
            xkzVar.ycx(zOptBoolean2);
            this.htf.ycx(xkzVar);
        } catch (Exception e11) {
            e = e11;
        }
    }

    private boolean xz() {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.pmi;
        if (tnVar == null || tnVar.kdr() == null || com.bytedance.sdk.openadsdk.core.model.av.zb(this.pmi) || this.f25563xz || this.pmi.kdr().optInt("parent_type") != 2) {
            return false;
        }
        int iAn = this.pmi.an();
        if (iAn != 8 && iAn != 7) {
            return false;
        }
        this.f25563xz = true;
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String adInfo() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            syc(jSONObject);
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "WuoEmwWz", 1097);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String appInfo() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            zb(jSONObject);
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "Wv49vA26Zg==", 1112);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String changeVideoState(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            final JSONObject jSONObject2 = new JSONObject(str);
            com.bytedance.sdk.openadsdk.utils.yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.kgy.3
                @Override // java.lang.Runnable
                public void run() {
                    kgy.this.htf(jSONObject2);
                }
            });
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "WOYsmwS5X86ET9humBC0LQ==", 1231);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String clickEvent(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            final JSONObject jSONObject2 = new JSONObject(str);
            com.bytedance.sdk.openadsdk.utils.yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.kgy.4
                @Override // java.lang.Runnable
                public void run() {
                    kgy.this.ul(jSONObject2);
                }
            });
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "WOIklgiZf8KOXg==", 1254);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String dynamicTrack(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            dv(new JSONObject(str));
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "X/cjlA61avOSS9RW", 1210);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    public boolean ea() {
        return this.sz;
    }

    public void fby() {
        com.bytedance.sdk.openadsdk.ry.sya syaVar;
        if (this.f25566zr && (syaVar = this.bhi) != null) {
            syaVar.ycx();
            return;
        }
        Context context = this.bba;
        if ((context instanceof Activity) && com.bytedance.sdk.openadsdk.utils.dv.ycx((Activity) context)) {
            ((Activity) this.bba).finish();
        }
        Activity activity = this.f25556uf;
        if (activity == null || activity.isFinishing()) {
            return;
        }
        this.f25556uf.finish();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String getCurrentVideoState() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            thx(jSONObject);
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "XOs5thaue8KOXuFUiBSvG0/vOZA=", 1291);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String getData(String str) throws JSONException {
        if (TextUtils.isEmpty(str)) {
            return this.wwx.toString();
        }
        try {
            JSONObject jSONObjectYcx = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(this.wwx, new JSONObject(str));
            if (jSONObjectYcx == null) {
                ycx(this.wwx, 1, "Success");
                return this.wwx.toString();
            }
            ycx(jSONObjectYcx, 1, "Success");
            return jSONObjectYcx.toString();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "XOs5sQKoaA==", 1375);
            ycx(this.wwx, 0, e3.getMessage());
            return this.wwx.toString();
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String getTemplateInfo() {
        try {
            return lud(true);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "XOs5oQaxecuBXtJ0ghev", 1125);
            return b.f42142b;
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String initRenderFinish() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jw();
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "UuAkgTG5Z8OFWPFUghizIA==", 1310);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    public void jc() {
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            dyVar.zb();
        }
    }

    public void jw() {
        com.bytedance.sdk.openadsdk.utils.yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.kgy.6
            @Override // java.lang.Runnable
            public void run() {
                if (kgy.this.f25564yi != null) {
                    kgy.this.f25564yi.ycx();
                }
            }
        });
    }

    public boolean lt() {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.pmi;
        return tnVar != null && tnVar.uu();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String muteVideo(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            JSONObject jSONObject2 = new JSONObject(str);
            dj djVar = this.f25562wr;
            if (djVar != null) {
                com.bytedance.sdk.openadsdk.utils.yzp.zb(djVar);
            }
            dj djVar2 = new dj(this.thx, jSONObject2);
            this.f25562wr = djVar2;
            com.bytedance.sdk.openadsdk.utils.yzp.ycx(djVar2);
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "Vvs5kDW1bcKP", 1196);
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.AndroidObject", "muteVideo: ", e3);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    public boolean ok() {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.pmi;
        return tnVar != null && tnVar.pg() == 1;
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String renderDidFinish(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            wwx(new JSONObject(str));
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SesjkQauTc6EbN5ThQKo", 1175);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    public void ry() {
        xz();
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String skipVideo() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            com.bytedance.sdk.openadsdk.utils.yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.kgy.5
                @Override // java.lang.Runnable
                public void run() {
                    kgy.this.rmf();
                }
            });
            ycx(jSONObject, 1, "Success");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOUkhTW1bcKP", 1276);
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    public boolean ul() {
        return this.f25565zb;
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    @JavascriptInterface
    public String videoFrameChanged(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (this.xym == null) {
            ycx(jSONObject, 1, "Success");
            return jSONObject.toString();
        }
        try {
            lud(new JSONObject(str));
            ycx(jSONObject, 1, "Success");
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "TecpkAyae8aNT/RVjR+nLV8=", 1420);
            ycx(jSONObject, 0, th2.getMessage());
        }
        return jSONObject.toString();
    }

    public void xkz() {
        com.bytedance.sdk.openadsdk.ea.sya syaVar = this.f25548jc;
        if (syaVar != null) {
            syaVar.ycx();
        }
        dj djVar = this.f25562wr;
        if (djVar != null) {
            com.bytedance.sdk.openadsdk.utils.yzp.zb(djVar);
            this.f25562wr = null;
        }
        dj();
        this.bba = null;
        this.f25551mp = null;
        this.giw = null;
    }

    private void hf(JSONObject jSONObject) {
        WebView webViewDv;
        if (jSONObject == null || (webViewDv = dv()) == null) {
            return;
        }
        com.bytedance.sdk.component.utils.xkz.ycx(webViewDv, "javascript:ToutiaoJSBridge._handleMessageFromToutiao(" + jSONObject + ")");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean jw(String str) {
        if (!TextUtils.isEmpty(str) && "click_other".equals(str)) {
            return ok();
        }
        return true;
    }

    public void dj() {
        com.bytedance.sdk.component.ycx.syc sycVar = this.dwi;
        if (sycVar == null) {
            return;
        }
        sycVar.ycx();
        this.dwi = null;
    }

    public JSONObject ea(JSONObject jSONObject) throws JSONException {
        List<com.bytedance.sdk.openadsdk.core.model.tn> listUz;
        JSONObject jSONObject2 = new JSONObject();
        try {
            JSONArray jSONArray = new JSONArray();
            com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar = this.f25551mp;
            if (zbVar != null && (listUz = zbVar.uz()) != null) {
                for (int i5 = 0; i5 < listUz.size(); i5++) {
                    jSONArray.put(sya(listUz.get(i5)));
                }
            }
            jSONObject2.put("creatives", jSONArray);
            return jSONObject2;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5TsKUb9lZjxCyLH/3I5QOtWrkkk/WSYUHpTs=", 2468);
            return jSONObject2;
        }
    }

    public void lt(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        int iOptInt = jSONObject.optInt("zoom_type", 1);
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("videoInfo");
        com.bytedance.sdk.component.adexpress.zb.xkz xkzVar = new com.bytedance.sdk.component.adexpress.zb.xkz();
        if (jSONObjectOptJSONObject != null) {
            double dOptDouble = jSONObjectOptJSONObject.optDouble("x");
            double dOptDouble2 = jSONObjectOptJSONObject.optDouble("y");
            double dOptDouble3 = jSONObjectOptJSONObject.optDouble("width");
            double dOptDouble4 = jSONObjectOptJSONObject.optDouble("height");
            xkzVar.sya(dOptDouble);
            xkzVar.dj(dOptDouble2);
            xkzVar.lud(dOptDouble3);
            xkzVar.lt(dOptDouble4);
        }
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            dyVar.ycx(iOptInt, xkzVar);
        }
    }

    public com.bytedance.sdk.openadsdk.core.model.tn lud() {
        return this.pmi;
    }

    public void ry(JSONObject jSONObject) {
        int iOptInt = jSONObject.optInt("status");
        tru truVar = this.dqs;
        if (truVar != null) {
            if (iOptInt == 1) {
                truVar.r_();
            } else if (iOptInt == 2) {
                truVar.s_();
            }
        }
    }

    public com.bytedance.sdk.component.ycx.syc sya() {
        return this.dwi;
    }

    public void syc() {
        ycx ycxVar = this.f25560ur;
        if (ycxVar != null) {
            ycxVar.ycx();
        }
    }

    public void ul(JSONObject jSONObject) {
        double d5;
        double dOptDouble;
        double d11;
        double d12;
        double d13;
        JSONObject jSONObjectOptJSONObject;
        if (jSONObject == null) {
            return;
        }
        com.bytedance.sdk.component.utils.htf.ycx("TTAD.AndroidObject", "trigger Class1 method1");
        try {
            String strOptString = jSONObject.optString("adId");
            int iOptInt = jSONObject.optInt("areaType", 1);
            String strOptString2 = jSONObject.optString("clickAreaType");
            JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("clickInfo");
            int iOptInt2 = 0;
            double d14 = 0.0d;
            if (jSONObjectOptJSONObject2 != null) {
                double dOptDouble2 = jSONObjectOptJSONObject2.optDouble("down_x", 0.0d);
                dOptDouble = jSONObjectOptJSONObject2.optDouble("down_y", 0.0d);
                double dOptDouble3 = jSONObjectOptJSONObject2.optDouble("up_x", 0.0d);
                double dOptDouble4 = jSONObjectOptJSONObject2.optDouble("up_y", 0.0d);
                double dOptDouble5 = jSONObjectOptJSONObject2.optDouble("down_time", 0.0d);
                double dOptDouble6 = jSONObjectOptJSONObject2.optDouble("up_time", 0.0d);
                jSONObjectOptJSONObject = jSONObjectOptJSONObject2.optJSONObject("rectInfo");
                iOptInt2 = jSONObjectOptJSONObject2.optInt("duration", 0);
                d13 = dOptDouble6;
                d14 = dOptDouble2;
                d5 = dOptDouble3;
                d11 = dOptDouble4;
                d12 = dOptDouble5;
            } else {
                d5 = 0.0d;
                dOptDouble = 0.0d;
                d11 = 0.0d;
                d12 = 0.0d;
                d13 = 0.0d;
                jSONObjectOptJSONObject = null;
            }
            com.bytedance.sdk.openadsdk.core.model.dy dyVarYcx = new dy.ycx().dj((float) d14).sya((float) dOptDouble).zb((float) d5).ycx((float) d11).zb((long) d12).ycx((long) d13).ycx(strOptString2).ycx((SparseArray<sya.ycx>) null).ycx(true).dj(iOptInt2).zb(iOptInt).ycx(jSONObjectOptJSONObject).ycx(jSONObject.optInt("clickAreaCategory", -1)).zb(jSONObjectOptJSONObject2).zb(jSONObject.optString("dislike_source")).ycx();
            com.bytedance.sdk.component.adexpress.zb.ea eaVar = this.htf;
            if (eaVar != null) {
                eaVar.ycx(null, iOptInt, dyVarYcx);
            }
            ycx(strOptString, iOptInt, dyVarYcx);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5SsuJSdx4mhSuPA==", 1698);
            com.bytedance.sdk.component.adexpress.zb.ea eaVar2 = this.htf;
            if (eaVar2 != null) {
                eaVar2.ycx(null, -1, null);
            }
        }
    }

    private void jc(String str) {
        int iIndexOf;
        if (str != null && str.startsWith("bytedance://")) {
            try {
                if (str.equals("bytedance://dispatch_message/")) {
                    WebView webViewDv = dv();
                    if (webViewDv != null) {
                        com.bytedance.sdk.component.utils.xkz.ycx(webViewDv, "javascript:ToutiaoJSBridge._fetchQueue()");
                        return;
                    }
                    return;
                }
                if (str.startsWith("bytedance://private/setresult/") && (iIndexOf = str.indexOf(38, 30)) > 0) {
                    String strSubstring = str.substring(30, iIndexOf);
                    String strSubstring2 = str.substring(iIndexOf + 1);
                    if (!strSubstring.equals("SCENE_FETCHQUEUE") || strSubstring2.length() <= 0) {
                        return;
                    }
                    fby(strSubstring2);
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "WOYolgiee86ETdJujxmlJVo=", 2290);
            }
        }
    }

    public com.bytedance.sdk.openadsdk.core.syc.dj.zb dy() {
        return this.f25551mp;
    }

    public kgy lud(String str) {
        this.syc = str;
        return this;
    }

    public void ok(JSONObject jSONObject) {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj;
        if (jSONObject == null) {
            return;
        }
        int iOptInt = jSONObject.optInt(TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX);
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.pmi;
        if (tnVar == null || (ycxVarDj = tnVar.dj()) == null) {
            return;
        }
        List<com.bytedance.sdk.openadsdk.core.model.tn> listLud = ycxVarDj.lud();
        if (iOptInt < 0 || iOptInt >= listLud.size()) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = listLud.get(iOptInt);
        tnVar2.hpv(iOptInt);
        ycx(tnVar2, this.dc, false);
        com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar = this.f25551mp;
        if (zbVar != null) {
            zbVar.ui();
        }
        com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar = this.f25561uz;
        if (ycxVar != null) {
            ycxVar.ycx();
        }
    }

    public void pmi() {
        tru truVar = this.dqs;
        if (truVar != null) {
            truVar.p_();
        }
    }

    public kgy sya(boolean z11) {
        this.kgy = z11;
        return this;
    }

    public void wie() {
        tru truVar = this.dqs;
        if (truVar != null) {
            truVar.o_();
        }
    }

    private void dv(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            Uri uri = Uri.parse(jSONObject.optString("trackData"));
            if ("bytedance".equals(uri.getScheme().toLowerCase())) {
                com.bytedance.sdk.openadsdk.utils.htf.ycx(uri, this);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5e+OZRNZQhRKUOlrtJg==", 1795);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject tru(JSONObject jSONObject) throws JSONException {
        if (this.ycx != null) {
            if (jSONObject == null) {
                jSONObject = new JSONObject();
            }
            try {
                JSONObject jSONObject2 = new JSONObject();
                String strOptString = jSONObject.optString("ad_extra_data", null);
                if (strOptString != null) {
                    jSONObject2 = new JSONObject(strOptString);
                }
                for (Map.Entry<String, Object> entry : this.ycx.entrySet()) {
                    jSONObject2.put(entry.getKey(), entry.getValue());
                }
                jSONObject.put("ad_extra_data", jSONObject2.toString());
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "XOs5tgyyf8KSXvJFmAOh", 2236);
                com.bytedance.sdk.component.utils.htf.sya(e3.toString(), new Object[0]);
            }
        }
        return jSONObject;
    }

    public String lud(boolean z11) throws JSONException {
        if (this.wwx == null) {
            JSONObject jSONObject = new JSONObject();
            if (z11) {
                ycx(jSONObject, 1, "Success");
            }
            return jSONObject.toString();
        }
        try {
            zb("getTemplateInfo", true);
            this.wwx.put("setting", aeu());
            com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.pmi;
            if (tnVar != null && tnVar.eai() != null) {
                this.wwx.put("dynamic_configs", this.pmi.eai());
            }
            com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = this.pmi;
            if (tnVar2 != null) {
                this.wwx.put("extension", tnVar2.gug());
            }
            zb("getTemplateInfo", false);
            if (z11) {
                ycx(this.wwx, 1, "Success");
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5XcKNWttcmBSJJl3h", 1156);
            if (z11) {
                ycx(this.wwx, 0, e3.getMessage());
            }
        }
        return this.wwx.toString();
    }

    public kgy sya(String str) {
        this.f25545ea = str;
        return this;
    }

    public kgy zb(String str) {
        this.f25559ul = str;
        return this;
    }

    public kgy dj(String str) {
        this.f25554ry = str;
        return this;
    }

    public void htf() {
        tru truVar = this.dqs;
        if (truVar != null) {
            truVar.t_();
        }
    }

    public JSONObject jw(JSONObject jSONObject) {
        JSONObject jSONObject2 = new JSONObject();
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            try {
                jSONObject2.put("state", dyVar.zb(jSONObject) ? 1 : 0);
                return jSONObject2;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "VP4omzOwaN6BSNtYoBCuLFLgKqUCu2w=", 2431);
            }
        }
        return jSONObject2;
    }

    public void sya(JSONObject jSONObject) {
        uh.ycx(tru(), this.bba instanceof Activity, jSONObject, ycx(this.pmi, jSONObject), this.dc, this.xkz, dv(), this.fby);
    }

    public void tn() {
        com.bytedance.sdk.openadsdk.component.reward.sya.dj djVar = this.f25558ui;
        if (djVar != null) {
            djVar.ycx();
        }
    }

    public com.bytedance.sdk.openadsdk.ry.zb zb() {
        return this.nji;
    }

    public void dj(boolean z11) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("visible", z11);
            ycx("adPageChange", jSONObject);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOsjkSK4WcaHT/RVjR+nLQ==", 1004);
            e3.getMessage();
        }
    }

    public kgy zb(com.bytedance.sdk.component.jw.fby fbyVar) {
        this.lud = new WeakReference<>(fbyVar);
        return this;
    }

    private void fby(String str) {
        try {
            JSONArray jSONArray = new JSONArray(new String(Base64.decode(str, 2)));
            int length = jSONArray.length();
            for (int i5 = 0; i5 < length; i5++) {
                sya syaVar = new sya();
                try {
                    JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                    if (jSONObjectOptJSONObject != null) {
                        syaVar.ycx = jSONObjectOptJSONObject.optString("__msg_type", null);
                        syaVar.f25577zb = jSONObjectOptJSONObject.optString("__callback_id", null);
                        syaVar.sya = jSONObjectOptJSONObject.optString("func");
                        syaVar.f25576dj = jSONObjectOptJSONObject.optJSONObject("params");
                        syaVar.lud = jSONObjectOptJSONObject.optInt("JSSDK");
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "S+8/hgaResCxX9JIiQ==", 2080);
                }
                if (!TextUtils.isEmpty(syaVar.ycx) && !TextUtils.isEmpty(syaVar.sya)) {
                    Message messageObtainMessage = this.f25549lt.obtainMessage(11);
                    messageObtainMessage.obj = syaVar;
                    this.f25549lt.sendMessage(messageObtainMessage);
                }
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "S+8/hgaResCxX9JIiQ==", 2089);
        }
    }

    public kgy zb(boolean z11) {
        this.rmy = z11;
        return this;
    }

    public void ycx(zb zbVar) {
        this.oby = zbVar;
    }

    public kgy zb(int i5) {
        this.xkz = i5;
        return this;
    }

    public static void zb(JSONObject jSONObject) throws Exception {
        JSONArray jSONArray = new JSONArray();
        Iterator<String> it = hf().iterator();
        while (it.hasNext()) {
            jSONArray.put(it.next());
        }
        jSONObject.put("appName", com.bytedance.sdk.openadsdk.common.sya.ycx());
        jSONObject.put("innerAppName", com.bytedance.sdk.openadsdk.common.sya.ul());
        jSONObject.put("aid", com.bytedance.sdk.openadsdk.common.sya.zb());
        jSONObject.put("sdkEdition", com.bytedance.sdk.openadsdk.common.sya.sya());
        jSONObject.put("formatSdkEdition", com.bytedance.sdk.openadsdk.common.sya.dj());
        jSONObject.put("fullSdkEdition", com.bytedance.sdk.openadsdk.common.sya.lud());
        jSONObject.put("appVersion", com.bytedance.sdk.openadsdk.common.sya.lt());
        jSONObject.put("netType", com.bytedance.sdk.openadsdk.common.sya.fby());
        jSONObject.put("supportList", jSONArray);
        jSONObject.put("deviceId", com.bytedance.sdk.openadsdk.common.sya.ycx(pmi.ycx()));
        Object obj = Build.VERSION.RELEASE;
        jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, obj);
        if (DeviceUtils.zb(pmi.ycx())) {
            jSONObject.put("device_platform", "Android_Pad");
        } else {
            jSONObject.put("device_platform", AndroidContextPlugin.PLATFORM);
        }
        jSONObject.put("device_type", obj);
    }

    public JSONObject uh() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            tru truVar = this.dqs;
            if (truVar == null) {
                return jSONObject;
            }
            jSONObject.put("leftTime", truVar.q_());
            return jSONObject;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "XOs5thaue8KOXvRSmR+0LFT5I6YXvX3Skw==", 2595);
            return jSONObject;
        }
    }

    public void ycx() {
        zb zbVar = this.oby;
        if (zbVar != null) {
            zbVar.ycx();
        }
    }

    public kgy jw(boolean z11) {
        this.ifb = z11;
        return this;
    }

    public void thx() {
        com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar = this.f25551mp;
        if (zbVar != null) {
            zbVar.rmf();
        }
    }

    public void xkz(final JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        final com.bytedance.sdk.openadsdk.core.model.tn tnVarYcx = ycx(this.pmi, jSONObject);
        com.bytedance.sdk.openadsdk.dj.sya.ycx(new com.bytedance.sdk.component.fby.zb.sya("sendLogV3") { // from class: com.bytedance.sdk.openadsdk.core.kgy.2
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                com.bytedance.sdk.openadsdk.core.model.tn tnVar;
                JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("extJson");
                if (jSONObjectOptJSONObject != null && jSONObjectOptJSONObject.has("category") && jSONObjectOptJSONObject.has("tag") && jSONObjectOptJSONObject.has("label")) {
                    String strOptString = jSONObjectOptJSONObject.optString("category");
                    String strOptString2 = jSONObjectOptJSONObject.optString("tag");
                    String strOptString3 = jSONObjectOptJSONObject.optString("label");
                    long jOptLong = jSONObject.optLong("value");
                    long jOptLong2 = jSONObject.optLong("extValue");
                    try {
                        jSONObjectOptJSONObject.put("ua_policy", kgy.this.f25544dy);
                        String strOptString4 = jSONObjectOptJSONObject.optString("ad_extra_data");
                        JSONObject jSONObject2 = TextUtils.isEmpty(strOptString4) ? new JSONObject() : new JSONObject(strOptString4);
                        String strOptString5 = jSONObject2.optString("pag_json_data");
                        JSONObject jSONObject3 = TextUtils.isEmpty(strOptString5) ? new JSONObject() : new JSONObject(strOptString5);
                        if (com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.zb()) {
                            jSONObject3.putOpt("_l_s_t", Integer.valueOf(com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx()));
                        }
                        jSONObject2.putOpt("pag_json_data", jSONObject3.toString());
                        jSONObjectOptJSONObject.putOpt("ad_extra_data", jSONObject2.toString());
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0bAq+", "Sfsj", 2700);
                    }
                    if (!TextUtils.isEmpty(ry.ycx(pmi.ycx())) && TextUtils.equals(strOptString3, TTEDPEventConstants.EDP_EVENT_NAME_CLICK) && (tnVar = tnVarYcx) != null) {
                        com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx(com.bytedance.sdk.openadsdk.oty.ycx.ycx(tnVar.hfd(), true), 2, tnVarYcx.m147if());
                    }
                    ycx.C0097ycx c0097ycxSya = new ycx.C0097ycx(System.currentTimeMillis(), tnVarYcx).dj(strOptString).zb(strOptString2).sya(strOptString3);
                    com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = tnVarYcx;
                    String strAc = b.f42142b;
                    ycx.C0097ycx c0097ycxYcx = c0097ycxSya.ycx(tnVar2 == null ? b.f42142b : tnVar2.ko());
                    com.bytedance.sdk.openadsdk.core.model.tn tnVar3 = tnVarYcx;
                    ycx.C0097ycx c0097ycxLud = c0097ycxYcx.ycx(tnVar3 == null ? null : tnVar3.qgr()).lud(String.valueOf(jOptLong));
                    com.bytedance.sdk.openadsdk.core.model.tn tnVar4 = tnVarYcx;
                    ycx.C0097ycx c0097ycxFby = c0097ycxLud.fby(tnVar4 == null ? b.f42142b : tnVar4.zr());
                    com.bytedance.sdk.openadsdk.core.model.tn tnVar5 = tnVarYcx;
                    if (tnVar5 != null) {
                        strAc = tnVar5.ac();
                    }
                    c0097ycxFby.ul(strAc).lt(String.valueOf(jOptLong2)).ycx(jSONObjectOptJSONObject).ycx((com.bytedance.sdk.openadsdk.dj.zb.ycx) null);
                }
            }
        });
    }

    private void sya(String str, JSONObject jSONObject) throws JSONException {
        try {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("__msg_type", DatabaseConstants.EVENT_FIELD);
            jSONObject2.put("__event_id", str);
            if (jSONObject != null) {
                jSONObject2.put("__params", jSONObject);
            }
            hf(jSONObject2);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOsjkSaqbMmUZ8Ra", 2054);
        }
    }

    public void dj(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        int iOptInt = jSONObject.optInt("time");
        String strOptString = jSONObject.optString("flag");
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            dyVar.ycx(iOptInt, strOptString);
        }
    }

    public void ea(boolean z11) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("viewStatus", z11 ? 1 : 0);
            ycx("viewableChange", jSONObject);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOsjkSmPX86FXfRVjR+nLQ==", 2810);
        }
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.core.widget.ycx.zb zbVar) {
        this.f25564yi = zbVar;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.core.widget.lt ltVar) {
        this.fby = ltVar;
        return this;
    }

    private void oty(JSONObject jSONObject) {
        if (jSONObject == null || this.f25555tn == null) {
            return;
        }
        try {
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("temaiProductIds");
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                this.f25555tn.ycx(true, jSONArrayOptJSONArray);
            } else {
                this.f25555tn.ycx(false, null);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5XcKJR9ZUvAOvLE7tObwHrw==", 1811);
            this.f25555tn.ycx(false, null);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.ry.zb zbVar) {
        this.nji = zbVar;
    }

    public kgy ycx(boolean z11) {
        this.sya = z11;
        return this;
    }

    public void dj(int i5) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("netType", i5);
            ycx("netTypeChange", jSONObject);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOsjkS25feSIS9laiSW5OF4=", 2784);
        }
    }

    public void lt(String str) {
        this.dc = str;
    }

    public kgy ycx(com.bytedance.sdk.component.jw.fby fbyVar) {
        WebView webView;
        if (fbyVar == null || (webView = fbyVar.getWebView()) == null) {
            return this;
        }
        try {
            this.dwi = com.bytedance.sdk.component.ycx.syc.ycx(webView).ycx(this.sya ? new com.bytedance.sdk.openadsdk.ok.zb() : this.ifb ? new com.bytedance.sdk.openadsdk.ok.sya() : new com.bytedance.sdk.openadsdk.ok.ycx()).ycx("ToutiaoJSBridge").ycx(new com.bytedance.sdk.component.ycx.jc() { // from class: com.bytedance.sdk.openadsdk.core.kgy.1
                @Override // com.bytedance.sdk.component.ycx.jc
                public <T> T ycx(String str, Type type) {
                    return null;
                }

                @Override // com.bytedance.sdk.component.ycx.jc
                public <T> String ycx(T t6) {
                    return null;
                }
            }).ycx(jc.zb().wie()).zb(true).ycx();
            if (com.bytedance.sdk.openadsdk.dv.lud.fby()) {
                com.bytedance.sdk.openadsdk.ok.ycx.jc.ycx(this.dwi, this);
                com.bytedance.sdk.openadsdk.ok.ycx.ok.ycx(this.dwi, this);
                com.bytedance.sdk.openadsdk.ok.ycx.dv.ycx(this.dwi, fbyVar, this, this.pmi);
            } else {
                com.bytedance.sdk.openadsdk.ok.ycx.jw.ycx(this.dwi, this);
                com.bytedance.sdk.openadsdk.ok.ycx.ea.ycx(this.dwi, this);
                com.bytedance.sdk.openadsdk.ok.ycx.tn.ycx(this.dwi, fbyVar, this, this.pmi);
            }
            com.bytedance.sdk.openadsdk.ok.ycx.ycx.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.zb.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.sya.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.fby.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.ry.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.pmi.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.syc.ycx(this.dwi, fbyVar);
            com.bytedance.sdk.openadsdk.ok.ycx.lt.ycx(this.dwi, this.wwx);
            com.bytedance.sdk.openadsdk.ok.ycx.dj.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.wie.ycx(this.dwi, this, this.pmi);
            com.bytedance.sdk.openadsdk.ok.ycx.uh.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.htf.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.xkz.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.wwx.ycx(this.dwi, this.pmi);
            com.bytedance.sdk.openadsdk.ok.ycx.dy.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.thx.ycx(this.dwi, this, this.pmi);
            com.bytedance.sdk.openadsdk.ok.ycx.lud.ycx(this.dwi, this);
            com.bytedance.sdk.openadsdk.ok.ycx.ul.ycx(this.dwi, this);
            return this;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "Tv0ovxC+Ow==", 349);
            return this;
        }
    }

    public JSONObject jc(JSONObject jSONObject) {
        JSONObject jSONObject2 = new JSONObject();
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            try {
                jSONObject2.put("state", dyVar.ycx(jSONObject) ? 1 : 0);
                return jSONObject2;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5WteFT9NyniWpJV78", 2446);
            }
        }
        return jSONObject2;
    }

    public void lt(boolean z11) {
        this.f25565zb = z11;
    }

    public void sya(int i5) {
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            dyVar.zb(i5);
        }
    }

    public void lud(JSONObject jSONObject) {
        if (jSONObject == null || this.xym == null) {
            return;
        }
        com.bytedance.sdk.component.adexpress.zb.xkz xkzVar = new com.bytedance.sdk.component.adexpress.zb.xkz();
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("videoInfo");
        if (jSONObjectOptJSONObject != null) {
            double dOptDouble = jSONObjectOptJSONObject.optDouble("x");
            double dOptDouble2 = jSONObjectOptJSONObject.optDouble("y");
            double dOptDouble3 = jSONObjectOptJSONObject.optDouble("width");
            double dOptDouble4 = jSONObjectOptJSONObject.optDouble("height");
            if (tn(jSONObjectOptJSONObject)) {
                xkzVar.ycx((float) jSONObjectOptJSONObject.optDouble("borderRadiusTopLeft"));
                xkzVar.zb((float) jSONObjectOptJSONObject.optDouble("borderRadiusTopRight"));
                xkzVar.sya((float) jSONObjectOptJSONObject.optDouble("borderRadiusBottomLeft"));
                xkzVar.dj((float) jSONObjectOptJSONObject.optDouble("borderRadiusBottomRight"));
            }
            xkzVar.sya(dOptDouble);
            xkzVar.dj(dOptDouble2);
            xkzVar.lud(dOptDouble3);
            xkzVar.lt(dOptDouble4);
        }
        com.bytedance.sdk.openadsdk.ry.fby fbyVar = this.xym;
        if (fbyVar != null) {
            fbyVar.ycx(xkzVar);
        }
    }

    private JSONObject sya(com.bytedance.sdk.openadsdk.core.model.tn tnVar) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("is_ad_event", "1");
        jSONObject2.put("cid", tnVar.zr());
        jSONObject2.put("req_id", tnVar.ac());
        jSONObject2.put("ad_id", tnVar.m147if());
        jSONObject2.put("log_extra", tnVar.pks());
        jSONObject2.put("isRTL", com.bytedance.sdk.openadsdk.core.settings.ea.zb().uu());
        jSONObject.put("ad_info", jSONObject2);
        jSONObject.put("endcard_creative", tnVar.bba());
        jSONObject.put("dynamic_creative", tnVar.te());
        jSONObject.put("title", tnVar.spv());
        com.bytedance.sdk.openadsdk.core.model.tn.ycx(tnVar, jSONObject);
        com.bytedance.sdk.openadsdk.core.model.tn.zb(tnVar, jSONObject);
        jSONObject.put(Plan.AMP_PLAN_SOURCE, tnVar.sp());
        jSONObject.put("button_text", tnVar.rzo());
        com.bytedance.sdk.openadsdk.core.model.ry ryVarSjd = tnVar.sjd();
        if (ryVarSjd != null) {
            jSONObject.put("deeplink_url", ryVarSjd.ycx());
        }
        jSONObject.put("app_name", tnVar.tpg());
        jSONObject.put("has_show", tnVar.yi() ? 1 : 0);
        jSONObject.put("has_click", tnVar.mqm() ? 1 : 0);
        return jSONObject;
    }

    public void jc(boolean z11) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("endcard_mute", z11);
            ycx("volumeChange", jSONObject);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOsjkSmPX8iMX9pYrxmhJlzr", 2772);
        }
    }

    public void fby(boolean z11) {
        this.f25566zr = z11;
    }

    public void fby(JSONObject jSONObject) throws JSONException {
        boolean z11 = false;
        com.bytedance.sdk.openadsdk.core.model.tn tnVarYcx = com.bytedance.sdk.openadsdk.core.zb.ycx(jSONObject, (AdSlot) null, (com.bytedance.sdk.openadsdk.core.model.tru) null, (com.bytedance.sdk.openadsdk.core.model.ycx) null, 0);
        if (tnVarYcx != null) {
            boolean zFby = com.bytedance.sdk.openadsdk.core.model.htf.fby(this.pmi);
            String strZb = zFby ? com.bytedance.sdk.openadsdk.utils.oby.zb(this.xkz) : this.dc;
            if (!com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVarYcx) && !zFby) {
                z11 = true;
            }
            ycx(tnVarYcx, strZb, z11);
        }
    }

    private void zb(String str, boolean z11) {
        if (this.yzp == null || TextUtils.isEmpty(str)) {
            return;
        }
        if (z11) {
            this.yzp.ycx(str);
        } else {
            this.yzp.zb(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zb(com.bytedance.sdk.openadsdk.core.jc.dy dyVar, JSONObject jSONObject) {
        if (dyVar == null || jSONObject == null) {
            return;
        }
        try {
            dyVar.ycx(jSONObject.optBoolean("mute", false), !jSONObject.has("mute") ? "jsb_def" : "jsb_web");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5RNKUT+FUiBSv", 1532);
        }
    }

    public static JSONObject zb(com.bytedance.sdk.openadsdk.core.model.tn tnVar) throws JSONException {
        int iKsy;
        boolean zPmi;
        JSONObject jSONObject = new JSONObject();
        if (pmi.dj() == null) {
            return jSONObject;
        }
        int i5 = 0;
        if (tnVar != null) {
            try {
                iKsy = tnVar.ksy();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "S+8/hgaKYMOFReRYmAWpJlw=", 1641);
                return jSONObject;
            }
        } else {
            iKsy = 0;
        }
        int iAn = tnVar != null ? tnVar.an() : 0;
        int iJxj = tnVar != null ? tnVar.jxj() : 0;
        int iJvd = tnVar != null ? tnVar.jvd() : 0;
        boolean zLt = pmi.dj().lt(String.valueOf(iKsy));
        int iXkz = pmi.dj().xkz(String.valueOf(iKsy));
        boolean z11 = iXkz == 1;
        if (iAn != 7 && iAn != 8) {
            zPmi = pmi.dj().sya(String.valueOf(iKsy));
        } else {
            zPmi = pmi.dj().pmi(String.valueOf(iKsy));
        }
        jSONObject.put("voice_control", zPmi);
        jSONObject.put("rv_skip_time", iJxj);
        jSONObject.put("fv_skip_show", zLt);
        jSONObject.put("iv_skip_time", iJvd);
        jSONObject.put("show_dislike", tnVar != null && tnVar.kfb());
        jSONObject.put("video_adaptation", tnVar != null ? tnVar.wk() : 0);
        jSONObject.put("splash_image_count_down_time", pmi.dj().dv(String.valueOf(iKsy)));
        if (tnVar != null && tnVar.eai() != null) {
            jSONObject.put("dynamic_configs", tnVar.eai());
        }
        if (com.bytedance.sdk.openadsdk.core.model.htf.sya(tnVar)) {
            jSONObject.put("skip_change_to_close", true);
        } else {
            jSONObject.put("skip_change_to_close", z11);
        }
        if (tnVar != null && tnVar.xym()) {
            i5 = 1;
        }
        jSONObject.put("bar_render_platform", i5);
        jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, Build.VERSION.RELEASE);
        jSONObject.put("endcard_close_time", pmi.dj().ycx(iKsy));
        jSONObject.put("video_skip_result", iXkz);
        jSONObject.put("if_show_win", pmi.dj().jw(String.valueOf(iKsy)));
        jSONObject.put("origin_rv_skip_time", pmi.dj().ea(String.valueOf(iKsy)));
        jSONObject.put("origin_iv_skip_time", pmi.dj().htf(String.valueOf(iKsy)));
        jSONObject.put("sdk_video_encode_type", !com.bytedance.sdk.openadsdk.dj.lud.ycx.ycx.ycx(tnVar) ? 1 : 0);
        return jSONObject;
    }

    public void lud(int i5) {
        com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar;
        if (i5 == 0 || i5 != 1 || (ycxVar = this.f25561uz) == null) {
            return;
        }
        ycxVar.ycx();
    }

    public void ul(boolean z11) {
        this.f25553rl = z11;
    }

    public void ul(String str) {
        com.bytedance.sdk.openadsdk.component.reward.sya.ycx.sya syaVar = this.hpv;
        if (syaVar != null) {
            syaVar.ycx(str);
        }
    }

    public void wwx() {
        try {
            ycx("requestHeartBeat", new JSONObject());
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "Ses8gAavfe+FS8VJjhShPA==", 2894);
            Log.e("TTAD.AndroidObject", b.f42142b, e3);
        }
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.dj.dj.lud ludVar) {
        this.yzp = ludVar;
        return this;
    }

    public kgy ycx(View view) {
        this.f25552ok = new WeakReference<>(view);
        return this;
    }

    public kgy ycx(int i5) {
        this.f25544dy = i5;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        this.pmi = tnVar;
        if (tnVar != null) {
            this.f25557uh = tnVar.kdr();
        }
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.ry.sya syaVar) {
        this.bhi = syaVar;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.ry.ea eaVar) {
        this.f25541av = eaVar;
        return this;
    }

    public kgy ycx(Map<String, Object> map) {
        this.ycx = map;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.component.adexpress.zb.ea eaVar) {
        this.htf = eaVar;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.core.jc.dy dyVar) {
        this.thx = dyVar;
        return this;
    }

    public kgy ycx(JSONObject jSONObject) {
        this.wwx = jSONObject;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.ry.ycx ycxVar) {
        this.f25543dv = ycxVar;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.ry.lud ludVar) {
        this.oty = ludVar;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.ry.fby fbyVar) {
        this.xym = fbyVar;
        return this;
    }

    public static void ycx(JSONObject jSONObject, com.bytedance.sdk.openadsdk.core.model.tn tnVar) throws Exception {
        String strM147if = tnVar.m147if();
        if (!TextUtils.isEmpty(strM147if)) {
            jSONObject.put("cid", strM147if);
        }
        String strPks = tnVar.pks();
        if (!TextUtils.isEmpty(strPks)) {
            jSONObject.put("log_extra", strPks);
        }
        String strWbt = tnVar.wbt();
        if (!TextUtils.isEmpty(strWbt)) {
            jSONObject.put("download_url", strWbt);
        }
        String strXym = pmi.dj().xym();
        if (TextUtils.isEmpty(strXym)) {
            strXym = "TX";
        }
        jSONObject.put("dc", strXym);
        jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, ry.zb());
        jSONObject.put("isRTL", com.bytedance.sdk.openadsdk.core.settings.ea.zb().uu());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(String str, JSONObject jSONObject) throws JSONException {
        try {
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("__msg_type", "callback");
            jSONObject2.put("__callback_id", str);
            if (jSONObject != null) {
                jSONObject2.put("__params", jSONObject);
            }
            hf(jSONObject2);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOsjkSC9ZcuCS9RWoQKn", 2021);
        }
    }

    public void zb(final Uri uri) {
        try {
            String host = uri.getHost();
            if (!"log_event".equals(host) && !"custom_event".equals(host) && !"log_event_v3".equals(host)) {
                if (!"private".equals(host) && !"dispatch_message".equals(host)) {
                    return;
                }
                jc(uri.toString());
                return;
            }
            com.bytedance.sdk.openadsdk.dj.sya.ycx(new com.bytedance.sdk.component.fby.zb.sya("log_event_handleUri") { // from class: com.bytedance.sdk.openadsdk.core.kgy.10
                /* JADX WARN: Removed duplicated region for block: B:31:0x009b  */
                /* JADX WARN: Removed duplicated region for block: B:42:0x00d1 A[Catch: Exception -> 0x010c, TRY_LEAVE, TryCatch #0 {Exception -> 0x010c, blocks: (B:39:0x00bc, B:40:0x00cb, B:42:0x00d1, B:56:0x0108, B:59:0x010e), top: B:65:0x00bc }] */
                /* JADX WARN: Removed duplicated region for block: B:65:0x00bc A[EXC_TOP_SPLITTER, SYNTHETIC] */
                @Override // java.lang.Runnable
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                */
                public void run() throws JSONException, NumberFormatException {
                    String strYcx;
                    String str;
                    String queryParameter;
                    String str2 = "extra";
                    String queryParameter2 = uri.getQueryParameter("category");
                    String queryParameter3 = uri.getQueryParameter("tag");
                    kgy.this.dc = queryParameter3;
                    String queryParameter4 = uri.getQueryParameter("label");
                    if (kgy.this.jw(queryParameter4)) {
                        long j11 = 0;
                        try {
                            queryParameter = uri.getQueryParameter("value");
                        } catch (Exception e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0bAI=", "Sfsj", 2137);
                        }
                        long j12 = !TextUtils.isEmpty(queryParameter) ? Long.parseLong(queryParameter) : 0L;
                        try {
                            String queryParameter5 = uri.getQueryParameter("ext_value");
                            if (!TextUtils.isEmpty(queryParameter5)) {
                                j11 = Long.parseLong(queryParameter5);
                            }
                        } catch (Exception e11) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0bAI=", "Sfsj", 2145);
                        }
                        JSONObject jSONObject = null;
                        try {
                            String queryParameter6 = uri.getQueryParameter("extra");
                            if (!TextUtils.isEmpty(queryParameter6)) {
                                JSONObject jSONObject2 = new JSONObject(queryParameter6);
                                try {
                                    jSONObject2.putOpt("ua_policy", Integer.valueOf(kgy.this.f25544dy));
                                    jSONObject = jSONObject2;
                                } catch (Throwable th2) {
                                    th = th2;
                                    jSONObject = jSONObject2;
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0bAI=", "Sfsj", 2155);
                                    if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(queryParameter4)) {
                                    }
                                    if ("landing_perf_error".equals(queryParameter4)) {
                                        try {
                                            jSONObject = new JSONObject();
                                            while (r7.hasNext()) {
                                            }
                                            strYcx = kgy.this.f25559ul;
                                        } catch (Exception e12) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0bAI=", "Sfsj", 2177);
                                            return;
                                        }
                                    }
                                    com.bytedance.sdk.openadsdk.dj.sya.ycx(kgy.this.pmi, queryParameter2, strYcx, queryParameter4, j12, j11, jSONObject, com.bytedance.sdk.openadsdk.core.model.htf.fby(kgy.this.pmi));
                                }
                            }
                        } catch (Throwable th3) {
                            th = th3;
                        }
                        if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(queryParameter4)) {
                            jSONObject = kgy.this.tru(jSONObject);
                        }
                        if (!"landing_perf_error".equals(queryParameter4) || "landing_perf_stats".equals(queryParameter4)) {
                            jSONObject = new JSONObject();
                            for (String str3 : uri.getQueryParameterNames()) {
                                try {
                                    if (str2.equals(str3)) {
                                        str = str2;
                                        try {
                                            jSONObject.put("ad_extra_data", new JSONObject(uri.getQueryParameter(str3)).optString("ad_extra_data"));
                                        } catch (Exception e13) {
                                            e = e13;
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0bAI=", "Sfsj", 2172);
                                            str2 = str;
                                        }
                                    } else {
                                        str = str2;
                                        jSONObject.put(str3, uri.getQueryParameter(str3));
                                    }
                                } catch (Exception e14) {
                                    e = e14;
                                    str = str2;
                                }
                                str2 = str;
                            }
                            strYcx = kgy.this.f25559ul;
                        } else {
                            strYcx = kgy.this.ycx(queryParameter3, queryParameter4);
                        }
                        com.bytedance.sdk.openadsdk.dj.sya.ycx(kgy.this.pmi, queryParameter2, strYcx, queryParameter4, j12, j11, jSONObject, com.bytedance.sdk.openadsdk.core.model.htf.fby(kgy.this.pmi));
                    }
                }
            });
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5XNWJ", 2191);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:217:0x0374 A[PHI: r4
      0x0374: PHI (r4v3 org.json.JSONObject) = 
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v4 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
      (r4v0 org.json.JSONObject)
     binds: [B:145:0x01f3, B:275:0x04a1, B:274:0x0492, B:271:0x047f, B:270:0x047a, B:269:0x0473, B:267:0x046c, B:268:0x046e, B:265:0x045f, B:264:0x0458, B:263:0x0453, B:261:0x043b, B:262:0x043d, B:259:0x0432, B:258:0x042b, B:256:0x0428, B:254:0x041c, B:252:0x0415, B:253:0x0417, B:243:0x03f6, B:240:0x03e5, B:238:0x03dd, B:239:0x03df, B:235:0x03d4, B:233:0x03c1, B:229:0x03a9, B:231:0x03b3, B:232:0x03b5, B:223:0x0389, B:227:0x039b, B:218:0x0378, B:216:0x0372, B:205:0x033b, B:204:0x0335, B:198:0x031c, B:197:0x0314, B:196:0x030e, B:194:0x0308, B:195:0x030a, B:192:0x02ff, B:191:0x02fa, B:190:0x02f5, B:155:0x0213, B:157:0x021b, B:159:0x0223, B:161:0x022b, B:163:0x0233, B:189:0x02e0, B:153:0x020c, B:151:0x0205, B:152:0x0207] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:236:0x03d6 A[PHI: r0
      0x03d6: PHI (r0v92 org.json.JSONObject) = (r0v84 org.json.JSONObject), (r0v93 org.json.JSONObject) binds: [B:256:0x0428, B:235:0x03d4] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public JSONObject ycx(sya syaVar, int i5) throws Exception {
        char c11;
        JSONObject jSONObjectOty;
        Context context;
        int i11;
        JSONObject jSONObject;
        com.bytedance.sdk.openadsdk.core.model.tn tnVar;
        if (!ActionCategory.CALL.equals(syaVar.ycx)) {
            return null;
        }
        jc.zb().wie();
        JSONObject jSONObject2 = new JSONObject();
        String str = syaVar.sya;
        str.getClass();
        int iOptInt = 0;
        switch (str.hashCode()) {
            case -2036781162:
                if (!str.equals("subscribe_app_ad")) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case -1423303823:
                if (str.equals("adInfo")) {
                    c11 = 1;
                    break;
                }
                break;
            case -1330994877:
                if (str.equals("pauseWebView")) {
                    c11 = 2;
                    break;
                }
                break;
            case -1169135450:
                if (str.equals("changeVideoState")) {
                    c11 = 3;
                    break;
                }
                break;
            case -1023873614:
                if (str.equals("openAdLandPageLinks")) {
                    c11 = 4;
                    break;
                }
                break;
            case -844321441:
                if (str.equals("webview_time_track")) {
                    c11 = 5;
                    break;
                }
                break;
            case -800853518:
                if (str.equals("clickEvent")) {
                    c11 = 6;
                    break;
                }
                break;
            case -794273169:
                if (str.equals("appInfo")) {
                    c11 = 7;
                    break;
                }
                break;
            case -715147645:
                if (str.equals("getScreenSize")) {
                    c11 = '\b';
                    break;
                }
                break;
            case -511324706:
                if (str.equals("openPrivacy")) {
                    c11 = '\t';
                    break;
                }
                break;
            case -278382602:
                if (str.equals("send_temai_product_ids")) {
                    c11 = '\n';
                    break;
                }
                break;
            case -173752734:
                if (str.equals("getTeMaiAds")) {
                    c11 = 11;
                    break;
                }
                break;
            case 27837080:
                if (str.equals("download_app_ad")) {
                    c11 = '\f';
                    break;
                }
                break;
            case 94756344:
                if (str.equals(n.f39150d)) {
                    c11 = '\r';
                    break;
                }
                break;
            case 105049135:
                if (str.equals("unsubscribe_app_ad")) {
                    c11 = 14;
                    break;
                }
                break;
            case 399543522:
                if (str.equals("getCloseButtonInfo")) {
                    c11 = 15;
                    break;
                }
                break;
            case 402955465:
                if (str.equals("isViewable")) {
                    c11 = 16;
                    break;
                }
                break;
            case 425443791:
                if (str.equals("getNativeSiteCustomData")) {
                    c11 = 17;
                    break;
                }
                break;
            case 442647767:
                if (str.equals("sendReward")) {
                    c11 = 18;
                    break;
                }
                break;
            case 571273292:
                if (str.equals("dynamicTrack")) {
                    c11 = 19;
                    break;
                }
                break;
            case 650209982:
                if (str.equals("getTemplateInfo")) {
                    c11 = 20;
                    break;
                }
                break;
            case 672928467:
                if (str.equals("cancel_download_app_ad")) {
                    c11 = 21;
                    break;
                }
                break;
            case 711635577:
                if (str.equals("getCurrentVideoState")) {
                    c11 = 22;
                    break;
                }
                break;
            case 885131792:
                if (str.equals("getVolume")) {
                    c11 = 23;
                    break;
                }
                break;
            case 1107374321:
                if (str.equals("pauseWebViewTimers")) {
                    c11 = 24;
                    break;
                }
                break;
            case 1151744482:
                if (str.equals(FyberMediationAdapter.KEY_MUTE_VIDEO)) {
                    c11 = 25;
                    break;
                }
                break;
            case 1237100796:
                if (str.equals("renderDidFinish")) {
                    c11 = 26;
                    break;
                }
                break;
            case 1532142616:
                if (str.equals("removeLoading")) {
                    c11 = 27;
                    break;
                }
                break;
            case 1634511418:
                if (str.equals("endcard_load")) {
                    c11 = 28;
                    break;
                }
                break;
            case 1713585602:
                if (str.equals("getNetworkData")) {
                    c11 = 29;
                    break;
                }
                break;
            case 1731806400:
                if (str.equals("playable_style")) {
                    c11 = 30;
                    break;
                }
                break;
            case 1979895452:
                if (str.equals("sendLog")) {
                    c11 = 31;
                    break;
                }
                break;
            case 2086000188:
                if (str.equals("skipVideo")) {
                    c11 = ' ';
                    break;
                }
                break;
            case 2105008900:
                if (str.equals("landscape_click")) {
                    c11 = '!';
                    break;
                }
                break;
        }
        long jOptLong = 0;
        switch (c11) {
            case 0:
                rmy();
                com.bytedance.sdk.openadsdk.dj.sya.zb(this.pmi, this.dc, 0, (JSONObject) null);
                Context context2 = this.bba;
                if (context2 != null) {
                    this.f25548jc.ycx(context2, syaVar.f25576dj, this.f25554ry, this.xkz, this.wie);
                } else {
                    com.bytedance.sdk.openadsdk.dj.sya.zb(this.pmi, this.dc, -1, (JSONObject) null);
                }
                i11 = i5;
                break;
            case 1:
                syc(jSONObject2);
                i11 = i5;
                break;
            case 2:
                bhi();
                i11 = i5;
                break;
            case 3:
                htf(syaVar.f25576dj);
                i11 = i5;
                break;
            case 4:
                JSONObject jSONObject3 = syaVar.f25576dj;
                if (ycx(jSONObject3, jSONObject2)) {
                    sya(jSONObject3);
                }
                i11 = i5;
                break;
            case 5:
                wie(syaVar.f25576dj);
                i11 = i5;
                break;
            case 6:
                ul(syaVar.f25576dj);
                i11 = i5;
                break;
            case 7:
                zb(jSONObject2);
                i11 = i5;
                break;
            case '\b':
                com.bytedance.sdk.openadsdk.ry.ycx ycxVar = this.f25543dv;
                if (ycxVar != null) {
                    int iZb = ycxVar.zb();
                    int iYcx = this.f25543dv.ycx();
                    jSONObject2.put("width", iZb);
                    jSONObject2.put("height", iYcx);
                }
                i11 = i5;
                break;
            case '\t':
                uh(syaVar.f25576dj);
                i11 = i5;
                break;
            case '\n':
                oty(syaVar.f25576dj);
                i11 = i5;
                break;
            case 11:
                jSONObjectOty = this.f25546hf;
                if (jSONObjectOty == null) {
                    i11 = i5;
                    break;
                } else {
                    i11 = i5;
                    jSONObject2 = jSONObjectOty;
                    break;
                }
            case '\f':
                this.sz = true;
                com.bytedance.sdk.openadsdk.dj.sya.zb(this.pmi, this.dc, 1, (JSONObject) null);
                com.bytedance.sdk.openadsdk.core.sya.dj djVar = this.tru;
                if (djVar != null) {
                    djVar.lud(this.rmf);
                } else {
                    com.bytedance.sdk.openadsdk.ea.sya syaVar2 = this.f25548jc;
                    if (syaVar2 != null && (context = this.bba) != null) {
                        syaVar2.ycx(context, syaVar.f25576dj, this.dc);
                        com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar = this.f25551mp;
                        if (zbVar != null) {
                            zbVar.ui();
                        }
                        com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar2 = this.f25561uz;
                        if (ycxVar2 != null) {
                            ycxVar2.ycx();
                        }
                    } else {
                        com.bytedance.sdk.openadsdk.dj.sya.zb(this.pmi, this.dc, -2, (JSONObject) null);
                    }
                }
                i11 = i5;
                break;
            case '\r':
                fby();
                i11 = i5;
                break;
            case 14:
                com.bytedance.sdk.openadsdk.ea.sya syaVar3 = this.f25548jc;
                if (syaVar3 != null) {
                    syaVar3.ycx(syaVar.f25576dj);
                }
                i11 = i5;
                break;
            case 15:
                jSONObjectOty = oty();
                if (jSONObjectOty != null) {
                }
                break;
            case 16:
                jSONObject2.put("viewStatus", this.rmy ? 1 : 0);
                jSONObject2.put("adFirstShow", this.kgy ? 1 : 0);
                i11 = i5;
                break;
            case 17:
                com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = this.pmi;
                if (tnVar2 != null && !TextUtils.isEmpty(tnVar2.vyl())) {
                    jSONObject2.put("data", this.pmi.vyl());
                }
                i11 = i5;
                break;
            case 18:
                this.f25565zb = true;
                com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar2 = this.f25551mp;
                if (zbVar2 != null) {
                    zbVar2.kgy();
                }
                if (this.duz != null) {
                    JSONObject jSONObject4 = syaVar.f25576dj;
                    if (jSONObject4 != null) {
                        jOptLong = jSONObject4.optLong("play_start_ts");
                        iOptInt = jSONObject4.optInt("user_watched_time");
                    }
                    this.duz.ycx(jOptLong, iOptInt, ycx(this.pmi, jSONObject4));
                }
                i11 = i5;
                break;
            case 19:
                dv(syaVar.f25576dj);
                i11 = i5;
                break;
            case 20:
                JSONObject jSONObject5 = this.wwx;
                if (jSONObject5 != null) {
                    jSONObject5.put("setting", aeu());
                    com.bytedance.sdk.openadsdk.core.model.tn tnVar3 = this.pmi;
                    if (tnVar3 != null && tnVar3.eai() != null) {
                        this.wwx.put("dynamic_configs", this.pmi.eai());
                    }
                    com.bytedance.sdk.openadsdk.core.model.tn tnVar4 = this.pmi;
                    if (tnVar4 != null) {
                        this.wwx.put("extension", tnVar4.gug());
                    }
                }
                jSONObject2 = this.wwx;
                i11 = i5;
                break;
            case 22:
                thx(jSONObject2);
                i11 = i5;
                break;
            case 23:
                AudioManager audioManager = (AudioManager) pmi.ycx().getSystemService("audio");
                jSONObject2.put("endcard_mute", (audioManager != null ? audioManager.getStreamVolume(3) : -1) <= 0);
                i11 = i5;
                break;
            case 24:
                av();
                i11 = i5;
                break;
            case 25:
                zb(this.thx, syaVar.f25576dj);
                i11 = i5;
                break;
            case 26:
                wwx(syaVar.f25576dj);
                i11 = i5;
                break;
            case 27:
                com.bytedance.sdk.openadsdk.ry.lud ludVar = this.oty;
                if (ludVar != null) {
                    ludVar.ycx();
                }
                i11 = i5;
                break;
            case 28:
                pmi(syaVar.f25576dj);
                i11 = i5;
                break;
            case 29:
                ycx(syaVar, jSONObject2);
                i11 = i5;
                break;
            case 30:
                dy(jSONObject2);
                i11 = i5;
                break;
            case 31:
                JSONObject jSONObject6 = syaVar.f25576dj;
                if (jSONObject6 != null && (jSONObject = jSONObject6.getJSONObject("extJson")) != null && jSONObject.has("category") && jSONObject.has("tag") && jSONObject.has("label")) {
                    String strOptString = jSONObject.optString("category");
                    String strOptString2 = jSONObject.optString("tag");
                    String strOptString3 = jSONObject.optString("label");
                    long jOptLong2 = jSONObject6.optLong("value");
                    long jOptLong3 = jSONObject6.optLong("extValue");
                    try {
                        jSONObject.putOpt("ua_policy", Integer.valueOf(this.f25544dy));
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "S/wilgaveu2TZ8Ra", 696);
                    }
                    if (TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(strOptString3)) {
                        jSONObject = tru(jSONObject);
                    }
                    if ("insight_log".equals(strOptString3) && (tnVar = this.pmi) != null && tnVar.hz()) {
                        jSONObject.putOpt("page_visible", Integer.valueOf(this.pmi.jdn()));
                        jSONObject.putOpt("time_to_leave", Long.valueOf(this.pmi.zpw() > 0 ? SystemClock.elapsedRealtime() - this.pmi.zpw() : -1L));
                        jSONObject.putOpt("time_to_click", Long.valueOf(this.pmi.jf() > 0 ? SystemClock.elapsedRealtime() - this.pmi.jf() : -1L));
                    }
                    if (!com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(this.pmi)) {
                        strOptString2 = ycx(strOptString2, strOptString3);
                    }
                    boolean zFby = com.bytedance.sdk.openadsdk.core.model.htf.fby(this.pmi);
                    ycx(jSONObject, zFby, strOptString3);
                    com.bytedance.sdk.openadsdk.dj.sya.ycx(this.pmi, strOptString, strOptString2, strOptString3, jOptLong2, jOptLong3, jSONObject, zFby);
                }
                i11 = i5;
                break;
            case ' ':
                rmf();
                i11 = i5;
                break;
            case '!':
                Context context3 = this.bba;
                if (context3 instanceof com.bytedance.sdk.openadsdk.core.syc.dj.zb) {
                    ((com.bytedance.sdk.openadsdk.core.syc.dj.zb) context3).ui();
                }
                com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar3 = this.f25561uz;
                if (ycxVar3 != null) {
                    ycxVar3.ycx();
                }
                i11 = i5;
                break;
        }
        if (i11 == 1 && !TextUtils.isEmpty(syaVar.f25577zb)) {
            zb(syaVar.f25577zb, jSONObject2);
            if (jc.zb().wie()) {
                Objects.toString(jSONObject2);
            }
        }
        return jSONObject2;
    }

    private void ycx(JSONObject jSONObject, boolean z11, String str) {
        com.bytedance.sdk.openadsdk.core.widget.lt ltVar;
        if (z11) {
            try {
                String strOptString = jSONObject.optString("ad_extra_data");
                if (TextUtils.isEmpty(strOptString) || new JSONObject(strOptString).optInt("agg_request_type", -1) != 1 || !TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str) || (ltVar = this.fby) == null) {
                    return;
                }
                ltVar.ycx();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "WO8hmSK7buSMQ9RWoBizPF7gKIc=", 940);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.AndroidObject", "callAggClickListener faile", th2);
            }
        }
    }

    private boolean ycx(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        String strOptString;
        int iOptInt;
        String strOptString2;
        if (jSONObject != null) {
            iOptInt = jSONObject.optInt("landingStyle");
            strOptString = jSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            strOptString2 = jSONObject.optString("fallback_url");
        } else {
            strOptString = null;
            iOptInt = -1;
            strOptString2 = null;
        }
        if (iOptInt == 1) {
            if (!com.bytedance.sdk.component.utils.pmi.ycx(strOptString)) {
                try {
                    jSONObject2.put("invalid_url", 1);
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5XNWM", 958);
                    com.bytedance.sdk.component.utils.htf.ycx("TTAD.AndroidObject", "handleUrl, EX1->: ", e3);
                }
                return false;
            }
            return true;
        }
        if (iOptInt == 2) {
            try {
                if (TextUtils.isEmpty(strOptString) && TextUtils.isEmpty(strOptString2)) {
                    jSONObject2.put("empty_url", 1);
                    return false;
                }
                if (!com.bytedance.sdk.component.utils.pmi.ycx(strOptString2)) {
                    jSONObject2.put("invalid_url", 1);
                    return false;
                }
            } catch (JSONException e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5XNWM", 972);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.AndroidObject", "handleUrl, EX2->: ", e11);
            }
        }
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.lud.zb
    public String ycx(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (TextUtils.isEmpty(str)) {
            ycx(jSONObject, 0, "data is empty");
            return jSONObject.toString();
        }
        try {
            dj(new JSONObject(str));
            ycx(jSONObject, 1, "Success");
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "Ses8gAavffeBX8RYuhikLVQ=", 1342);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.AndroidObject", "requestPauseVideo json exception");
            ycx(jSONObject, 0, e3.getMessage());
        }
        return jSONObject.toString();
    }

    private void ycx(JSONObject jSONObject, int i5, String str) throws JSONException {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("__code", i5);
            jSONObject.put("__msg", str);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "TPwshTG5etKMXuBUmBmQKUnvIIY=", 1398);
        }
    }

    public void ycx(final sya syaVar, final JSONObject jSONObject) {
        if (syaVar == null) {
            return;
        }
        try {
            ycx(syaVar.f25576dj, new com.bytedance.sdk.openadsdk.ry.dj() { // from class: com.bytedance.sdk.openadsdk.core.kgy.7
                @Override // com.bytedance.sdk.openadsdk.ry.dj
                public void ycx(boolean z11, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) throws JSONException {
                    if (!z11) {
                        kgy.this.zb(syaVar.f25577zb, jSONObject);
                        return;
                    }
                    try {
                        jSONObject.put("creatives", kgy.ycx(ycxVar));
                        kgy.this.zb(syaVar.f25577zb, jSONObject);
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0bA0=", "VOAMkS+zaMOFTg==", 1845);
                    }
                }
            });
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5TsKUZNJJmx6yI3/vOZQ=", 1852);
        }
    }

    private boolean ycx(String str, int i5, com.bytedance.sdk.openadsdk.core.model.dy dyVar) {
        HashMap<String, ea> map;
        if (TextUtils.isEmpty(str) || (map = this.aeu) == null || map.get(str) == null) {
            return false;
        }
        throw null;
    }

    public void ycx(JSONObject jSONObject, final com.bytedance.sdk.openadsdk.ry.dj djVar) throws JSONException {
        JSONObject jSONObjectOptJSONObject;
        if (djVar == null) {
            return;
        }
        try {
            final com.bytedance.sdk.openadsdk.ry.dj djVar2 = new com.bytedance.sdk.openadsdk.ry.dj() { // from class: com.bytedance.sdk.openadsdk.core.kgy.8
                @Override // com.bytedance.sdk.openadsdk.ry.dj
                public void ycx(final boolean z11, final com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
                    com.bytedance.sdk.openadsdk.utils.yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.kgy.8.1
                        @Override // java.lang.Runnable
                        public void run() {
                            djVar.ycx(z11, ycxVar);
                        }
                    });
                }
            };
            if (this.pmi != null && !TextUtils.isEmpty(this.f25554ry)) {
                int iAn = this.pmi.an();
                AdSlot adSlotQn = this.pmi.qn();
                com.bytedance.sdk.openadsdk.core.model.tru truVar = new com.bytedance.sdk.openadsdk.core.model.tru();
                truVar.f25846lt = true;
                if (this.pmi.jp() != null || this.pmi.nc() != null) {
                    truVar.f25845jw = 2;
                }
                JSONObject jSONObject2 = this.f25557uh;
                if (jSONObject2 == null) {
                    jSONObject2 = new JSONObject();
                }
                if (jSONObject != null && jSONObject.has("session_params") && (jSONObjectOptJSONObject = jSONObject.optJSONObject("session_params")) != null) {
                    Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        jSONObject2.put(next, jSONObjectOptJSONObject.opt(next));
                    }
                }
                truVar.f25849ul = jSONObject2;
                if (jSONObject != null && jSONObject.has("common_params")) {
                    if (truVar.fby == null) {
                        truVar.fby = new JSONObject();
                    }
                    JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("common_params");
                    if (jSONObjectOptJSONObject2 != null) {
                        Iterator<String> itKeys2 = jSONObjectOptJSONObject2.keys();
                        while (itKeys2.hasNext()) {
                            String next2 = itKeys2.next();
                            truVar.fby.put(next2, jSONObjectOptJSONObject2.opt(next2));
                        }
                    }
                }
                pmi.sya().ycx(adSlotQn, truVar, iAn, new wwx() { // from class: com.bytedance.sdk.openadsdk.core.kgy.9
                    @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.tn.ycx
                    public void ycx(int i5, String str) {
                        djVar2.ycx(false, null);
                    }

                    @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.tn.ycx
                    public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, com.bytedance.sdk.openadsdk.core.model.sya syaVar) {
                        kgy.this.ycx(ycxVar, syaVar, djVar2);
                    }
                });
                return;
            }
            djVar2.ycx(false, null);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "X+EKkBedbdSmWNhQohS0P1T8Jg==", 1949);
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.AndroidObject", "get ads error", e3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, com.bytedance.sdk.openadsdk.core.model.sya syaVar, com.bytedance.sdk.openadsdk.ry.dj djVar) {
        if (ycxVar.lud() != null && !ycxVar.lud().isEmpty()) {
            com.bytedance.sdk.openadsdk.core.model.tn tnVar = ycxVar.lud().get(0);
            if (tnVar != null) {
                this.f25557uh = tnVar.kdr();
            }
            djVar.ycx(true, ycxVar);
            return;
        }
        djVar.ycx(false, null);
        syaVar.ycx(-3);
        syaVar.sya(7);
        com.bytedance.sdk.openadsdk.core.model.sya.ycx(syaVar);
    }

    public static JSONArray ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        com.bytedance.sdk.openadsdk.core.model.tn tnVarUl;
        if (ycxVar == null || !ycxVar.lt() || (tnVarUl = ycxVar.ul()) == null || TextUtils.isEmpty(tnVarUl.ybg())) {
            return null;
        }
        try {
            return new JSONObject(tnVarUl.ybg()).optJSONArray("creatives");
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "WOEjgwaufeqFXtZxhQK0HFTEHrotnXvVgVM=", 1977);
            return null;
        }
    }

    public boolean ycx(Uri uri) {
        if (uri == null) {
            return false;
        }
        try {
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "WO8jvQKybcuFf8VU", 2110);
        }
        if ("bytedance".equals(uri.getScheme())) {
            return f25540jw.containsKey(uri.getHost());
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String ycx(String str, String str2) {
        if (com.bytedance.sdk.openadsdk.core.model.htf.fby(this.pmi)) {
            if ("show".equals(str2)) {
                return com.bytedance.sdk.openadsdk.utils.oby.ycx(this.xkz);
            }
            return "aggregate_page";
        }
        if (com.bytedance.sdk.openadsdk.core.model.av.lud(this.pmi)) {
            return this.f25559ul;
        }
        if (this.bhi != null) {
            return com.bytedance.sdk.openadsdk.utils.oby.ycx(this.xkz);
        }
        return this.htf == null ? com.bytedance.sdk.openadsdk.utils.oby.zb(this.xkz) : str;
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        if (message != null && message.what == 11) {
            Object obj = message.obj;
            if (obj instanceof sya) {
                try {
                    ycx((sya) obj, 1);
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "U+8jkQ+5RNSH", 2335);
                }
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.ea.zb
    public void ycx(String str, JSONObject jSONObject) {
        Objects.toString(jSONObject);
        sya(str, jSONObject);
    }

    private void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, String str, boolean z11) {
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.sya.ycx(pmi.ycx(), tnVar, str, this.xkz);
        ycxVar.ycx(com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(pmi.ycx(), str));
        if (!z11) {
            ycxVar.ycx(false);
        }
        if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar)) {
            ycxVar.zb(!this.f25547iq.get());
        }
        ycxVar.ycx((View) null);
    }

    public void ycx(JSONObject jSONObject, String str) {
        com.bytedance.sdk.openadsdk.core.jc.dy dyVar = this.thx;
        if (dyVar != null) {
            dyVar.ycx(str, jSONObject);
            return;
        }
        com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar = this.f25551mp;
        if (zbVar != null) {
            zbVar.ycx(str, jSONObject);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar) {
        this.f25551mp = zbVar;
    }

    public void ycx(tru truVar) {
        this.dqs = truVar;
    }

    public void ycx(ycx ycxVar) {
        this.f25560ur = ycxVar;
    }

    public com.bytedance.sdk.openadsdk.core.model.tn ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, JSONObject jSONObject) {
        int iOptInt;
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj;
        List<com.bytedance.sdk.openadsdk.core.model.tn> listLud;
        return (tnVar == null || jSONObject == null || !com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar) || (iOptInt = jSONObject.optInt("materialPosition")) <= 0 || (ycxVarDj = tnVar.dj()) == null || (listLud = ycxVarDj.lud()) == null || iOptInt >= listLud.size()) ? tnVar : listLud.get(iOptInt);
    }

    public void ycx(int i5, int i11) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("width", i5);
            jSONObject.put("height", i11);
            ycx(n.f39153g, jSONObject);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "SOsjkSmPX86FXeVYnxi6LQ==", 2762);
            Log.e("TTAD.AndroidObject", b.f42142b, e3);
        }
    }

    public void ycx(String str, int i5, int i11) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("sessionID", str);
            jSONObject.put("status", i5);
            jSONObject.put("errorCode", i11);
            ycx("landingPageLoadStatus", jSONObject);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "b9oMmweuZs6EZdVXiRK0", "V+8jkQqybveBTdJxgxCkG0/vOYAQ", 2798);
        }
    }

    public kgy ycx(Activity activity) {
        this.f25556uf = activity;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.component.reward.sya.lt ltVar) {
        this.duz = ltVar;
        return this;
    }

    public kgy ycx(com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar) {
        this.f25561uz = ycxVar;
        return this;
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.ycx.sya syaVar) {
        this.hpv = syaVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.ycx.dj djVar) {
        com.bytedance.sdk.openadsdk.component.reward.sya.ycx.sya syaVar = this.hpv;
        if (syaVar != null) {
            syaVar.ycx(djVar);
        }
    }

    public void ycx(String str, boolean z11) {
        com.bytedance.sdk.openadsdk.component.reward.sya.ycx.sya syaVar = this.hpv;
        if (syaVar != null) {
            syaVar.ycx(str, z11);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.jw jwVar) {
        this.f25550lv = jwVar;
    }

    public void ycx(int i5, JSONObject jSONObject) {
        com.bytedance.sdk.openadsdk.component.reward.sya.jw jwVar = this.f25550lv;
        if (jwVar != null) {
            jwVar.ycx(i5, jSONObject);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.dj djVar) {
        this.f25558ui = djVar;
    }

    public void ycx(lud ludVar) {
        this.giw = ludVar;
    }
}
