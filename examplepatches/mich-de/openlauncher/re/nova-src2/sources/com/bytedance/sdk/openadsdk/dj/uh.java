package com.bytedance.sdk.openadsdk.dj;

import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.moloco.sdk.internal.services.init.i;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class uh implements com.bytedance.sdk.openadsdk.dj.dj.lud {

    /* renamed from: dj, reason: collision with root package name */
    private Boolean f26670dj;
    private JSONArray fby;

    /* renamed from: lt, reason: collision with root package name */
    private JSONObject f26671lt;
    private AtomicBoolean lud;
    private Boolean sya;

    /* renamed from: ul, reason: collision with root package name */
    private JSONArray f26672ul;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private tn f26673zb;

    public uh(int i5, String str, tn tnVar) throws JSONException {
        this.ycx = "embeded_ad";
        Boolean bool = Boolean.FALSE;
        this.sya = bool;
        this.f26670dj = bool;
        this.lud = new AtomicBoolean(false);
        this.ycx = str;
        this.f26673zb = tnVar;
        this.f26671lt = new JSONObject();
        this.f26672ul = new JSONArray();
        this.fby = new JSONArray();
        ycx(this.f26671lt, "webview_source", Integer.valueOf(i5));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean dy() {
        return this.f26670dj.booleanValue() || this.sya.booleanValue();
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lud
    public void ea() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.10
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                if (uh.this.dy()) {
                    if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(uh.this.f26673zb) && uh.this.lud.get()) {
                        return;
                    }
                    if (uh.this.f26672ul != null && uh.this.f26672ul.length() != 0) {
                        try {
                            uh.this.f26671lt.put("native_switchBackgroundAndForeground", uh.this.f26672ul);
                        } catch (Exception e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIx+/dQ==", "Sfsj", 379);
                        }
                    }
                    if (uh.this.fby != null && uh.this.fby.length() != 0) {
                        try {
                            uh.this.f26671lt.put("intercept_source", uh.this.fby);
                        } catch (Exception e11) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIx+/dQ==", "Sfsj", 385);
                        }
                    }
                    JSONObject jSONObject = new JSONObject();
                    try {
                        jSONObject.put("webview_time_track", uh.this.f26671lt);
                    } catch (JSONException e12) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIx+/dQ==", "Sfsj", 391);
                        htf.ycx("WebviewTimeTrack", "trySendTrackInfo json error", e12);
                    }
                    if (com.bytedance.sdk.openadsdk.core.jc.zb().wie() && uh.this.f26671lt != null) {
                        JSONObject unused = uh.this.f26671lt;
                    }
                    uh.this.lud.set(true);
                    sya.zb(uh.this.f26673zb, uh.this.ycx, "webview_time_track", jSONObject);
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.sya
    public void fby() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.3
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, TTConst.TRACK_TYPE, "native_enterBackground");
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26672ul, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lud
    public void jc() {
        this.sya = Boolean.TRUE;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.sya
    public void jw() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.4
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, TTConst.TRACK_TYPE, "native_enterForeground");
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26672ul, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.zb
    public void ok() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.14
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "native_render_end", jSONObject);
                long jCurrentTimeMillis2 = System.currentTimeMillis();
                JSONObject jSONObject2 = new JSONObject();
                uh.this.ycx(jSONObject2, "ts", Long.valueOf(jCurrentTimeMillis2));
                uh uhVar2 = uh.this;
                uhVar2.ycx(uhVar2.f26671lt, "render_success", jSONObject2);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.zb
    public void ry() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.15
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "no_native_render", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.dj
    public void syc() {
        try {
            com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.17
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    JSONObject jSONObject = new JSONObject();
                    uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                    uh uhVar = uh.this;
                    uhVar.ycx(uhVar.f26671lt, "render_did_finish", jSONObject);
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIw==", "VOAfkA24bNWkQ9N7hR+pO1M=", 527);
            th2.getMessage();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.dj
    public void xkz() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.16
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "render_failed", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void dj() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.28
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "webview_load_start", (Object) jSONObject, false);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.sya
    public void lt() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.31
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "native_endcard_show", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void lud() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.29
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "webview_load_success", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.sya
    public void sya() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.27
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "native_render_end", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.sya
    public void ul() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.2
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "native_endcard_close", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.dj
    public void zb() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.12
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "render_success", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void dj(final String str) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.18
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, str, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void lt(final String str) {
        try {
            com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.21
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    JSONObject jSONObject = new JSONObject();
                    uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                    uh uhVar = uh.this;
                    uhVar.ycx(uhVar.f26671lt, str, jSONObject);
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIw==", "VOAYsgayW8KOTtJPvwSjK179Pg==", 592);
            th2.getMessage();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void lud(final String str) {
        try {
            com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.20
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    JSONObject jSONObject = new JSONObject();
                    uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                    uh uhVar = uh.this;
                    uhVar.ycx(uhVar.f26671lt, str, jSONObject);
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIw==", "VOAYsgayW8KOTtJPqQelJk8=", 575);
            th2.getMessage();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void sya(final String str) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.11
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, str, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void ul(final String str) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.24
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, str, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void zb(final String str, final long j11, final long j12, final int i5) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.6
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                if (TextUtils.isEmpty(str) || j12 < j11) {
                    return;
                }
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "start_ts", Long.valueOf(j11));
                uh.this.ycx(jSONObject, "end_ts", Long.valueOf(j12));
                uh.this.ycx(jSONObject, "intercept_type", Integer.valueOf(i5));
                uh.this.ycx(jSONObject, TTConst.TRACK_TYPE, "intercept_js");
                uh.this.ycx(jSONObject, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
                uh.this.ycx(jSONObject, "duration", Long.valueOf(j12 - j11));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.fby, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void sya(final int i5, final String str) {
        try {
            com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.22
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    JSONObject jSONObject = new JSONObject();
                    uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                    uh.this.ycx(jSONObject, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, Integer.valueOf(i5));
                    uh uhVar = uh.this;
                    uhVar.ycx(uhVar.f26671lt, str, jSONObject);
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIw==", "VOAYsgayW8KOTtJPqQOyJ0k=", 610);
            th2.getMessage();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void zb(final String str) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.8
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                if (TextUtils.isEmpty(str)) {
                    return;
                }
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, "jsb", str);
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "webview_jsb_end", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.dj
    public void ycx() {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.1
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh uhVar = uh.this;
                uhVar.ycx(jSONObject, "render_sequence", Integer.valueOf(uhVar.f26673zb.tx()));
                if (uh.this.f26673zb != null) {
                    if (uh.this.f26673zb.jp() != null) {
                        if (uh.this.f26673zb.jp().ok()) {
                            uh.this.ycx(jSONObject, "webview_count", Integer.valueOf(com.bytedance.sdk.component.adexpress.lud.lud.ycx().dj()));
                            uh.this.ycx(jSONObject, "available_cache_count", Integer.valueOf(com.bytedance.sdk.component.adexpress.lud.lud.ycx().dj()));
                        } else {
                            uh.this.ycx(jSONObject, "webview_count", Integer.valueOf(com.bytedance.sdk.component.adexpress.lud.lud.ycx().sya()));
                            uh.this.ycx(jSONObject, "available_cache_count", Integer.valueOf(com.bytedance.sdk.component.adexpress.lud.lud.ycx().sya()));
                        }
                    } else if (uh.this.f26673zb.nc() != null) {
                        uh.this.ycx(jSONObject, "webview_count", Integer.valueOf(com.bytedance.sdk.component.adexpress.lud.lud.ycx().dj()));
                        uh.this.ycx(jSONObject, "available_cache_count", Integer.valueOf(com.bytedance.sdk.component.adexpress.lud.lud.ycx().dj()));
                    }
                }
                uh uhVar2 = uh.this;
                uhVar2.ycx(uhVar2.f26671lt, "render_start", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void zb(final JSONObject jSONObject) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.9
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                JSONObject jSONObject2;
                if (uh.this.f26671lt == null || (jSONObject2 = jSONObject) == null) {
                    return;
                }
                Iterator<String> itKeys = jSONObject2.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    uh uhVar = uh.this;
                    uhVar.ycx(uhVar.f26671lt, next, jSONObject.opt(next));
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.dj
    public void ycx(final int i5, final String str) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.23
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, Integer.valueOf(i5));
                String str2 = str;
                if (str2 != null) {
                    uh.this.ycx(jSONObject, "reason", str2);
                }
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "render_error", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void zb(final int i5, final String str) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.13
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, Integer.valueOf(i5));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, str, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.zb
    public void ycx(final int i5) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.26
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, "backup_type", Integer.valueOf(i5));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "native_render_start", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void ycx(final JSONObject jSONObject) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.30
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                JSONObject jSONObject2 = jSONObject;
                if (jSONObject2 == null) {
                    jSONObject2 = new JSONObject();
                }
                uh.this.ycx(jSONObject2, "ts", Long.valueOf(System.currentTimeMillis()));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "webview_load_error", jSONObject2);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void ycx(final String str, final long j11, final long j12, final int i5) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.5
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                if (TextUtils.isEmpty(str) || j12 < j11) {
                    return;
                }
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "start_ts", Long.valueOf(j11));
                uh.this.ycx(jSONObject, "end_ts", Long.valueOf(j12));
                uh.this.ycx(jSONObject, "intercept_type", Integer.valueOf(i5));
                uh.this.ycx(jSONObject, TTConst.TRACK_TYPE, "intercept_html");
                uh.this.ycx(jSONObject, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
                uh.this.ycx(jSONObject, "duration", Long.valueOf(j12 - j11));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.fby, jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void ycx(final String str) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.7
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                if (TextUtils.isEmpty(str)) {
                    return;
                }
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, "jsb", str);
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "webview_jsb_start", jSONObject);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lud
    public void ycx(boolean z11) {
        this.f26670dj = Boolean.valueOf(z11);
    }

    public uh() {
        this.ycx = "embeded_ad";
        Boolean bool = Boolean.FALSE;
        this.sya = bool;
        this.f26670dj = bool;
        this.lud = new AtomicBoolean(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(JSONObject jSONObject, String str, Object obj, boolean z11) throws JSONException {
        if (jSONObject == null || TextUtils.isEmpty(str)) {
            return;
        }
        if (!z11) {
            try {
                if (jSONObject.has(str)) {
                    return;
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIw==", "S/s5vA26ZvOPYMRSgj6iIl7tOQ==", 425);
                return;
            }
        }
        jSONObject.put(str, obj);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(JSONObject jSONObject, String str, Object obj) throws JSONException {
        ycx(jSONObject, str, obj, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(JSONArray jSONArray, Object obj) {
        if (jSONArray == null || jSONArray.length() >= 10) {
            return;
        }
        try {
            jSONArray.put(obj);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIw==", "S/s5vA26ZvOPYMRSgjCyOlr3", 442);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.ycx
    public void ycx(final String str, final boolean z11) {
        try {
            com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.19
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    JSONObject jSONObject = new JSONObject();
                    uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                    uh.this.ycx(jSONObject, "isReuse", Integer.valueOf(z11 ? 1 : 0));
                    uh uhVar = uh.this;
                    uhVar.ycx(uhVar.f26671lt, str, jSONObject);
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "bOsvgwq5fvOJR9JpnhCjIw==", "VOAYsgayW8KOTtJPvwWhOk8=", 558);
            th2.getMessage();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dj.dj.lt
    public void ycx(final int i5, final int i11) {
        com.bytedance.sdk.component.utils.jw.ycx().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.uh.25
            @Override // java.lang.Runnable
            public void run() throws JSONException {
                long jCurrentTimeMillis = System.currentTimeMillis();
                JSONObject jSONObject = new JSONObject();
                uh.this.ycx(jSONObject, "ts", Long.valueOf(jCurrentTimeMillis));
                uh.this.ycx(jSONObject, "isWebViewCache", Integer.valueOf(i5));
                if (uh.this.f26673zb != null) {
                    if (uh.this.f26673zb.ag()) {
                        uh.this.ycx(jSONObject, "engine_version", "v3");
                    } else {
                        uh.this.ycx(jSONObject, "engine_version", i.f38066a);
                    }
                }
                uh.this.ycx(jSONObject, "webview_reuse_count", Integer.valueOf(i11));
                uh uhVar = uh.this;
                uhVar.ycx(uhVar.f26671lt, "before_webview_request", jSONObject);
            }
        });
    }
}
