package com.bytedance.sdk.openadsdk.lt;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.fby;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dy.dj;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.bytedance.sdk.openadsdk.utils.kgy;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    private static volatile zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ConcurrentHashMap<String, com.bytedance.sdk.openadsdk.wie.ycx> f26880zb = new ConcurrentHashMap<>();
    private com.bytedance.sdk.openadsdk.wie.ycx sya = null;

    /* renamed from: dj, reason: collision with root package name */
    private volatile boolean f26875dj = false;
    private volatile HandlerThread lud = null;

    /* renamed from: lt, reason: collision with root package name */
    private volatile Handler f26878lt = null;

    /* renamed from: ul, reason: collision with root package name */
    private String f26879ul = b.f42142b;
    private int fby = 0;

    /* renamed from: jw, reason: collision with root package name */
    private volatile long f26877jw = 0;

    /* renamed from: jc, reason: collision with root package name */
    private final Runnable f26876jc = new Runnable() { // from class: com.bytedance.sdk.openadsdk.lt.zb.6
        @Override // java.lang.Runnable
        public void run() {
            try {
                JSONObject jSONObject = new JSONObject();
                JSONObject jSONObject2 = new JSONObject();
                try {
                    if (ycx.ycx().lud()) {
                        Set<String> setKeySet = zb.this.f26880zb.keySet();
                        if (setKeySet.size() > zb.this.fby) {
                            zb.this.fby = setKeySet.size();
                        }
                        HashSet hashSet = new HashSet(5);
                        ArrayList arrayList = new ArrayList(setKeySet.size());
                        arrayList.addAll(zb.this.f26880zb.values());
                        Collections.sort(arrayList);
                        for (int i5 = 0; i5 < arrayList.size() && i5 < 5; i5++) {
                            hashSet.add(((com.bytedance.sdk.openadsdk.wie.ycx) arrayList.get(i5)).zb());
                        }
                        try {
                            for (String str : setKeySet) {
                                com.bytedance.sdk.openadsdk.wie.ycx ycxVar = (com.bytedance.sdk.openadsdk.wie.ycx) zb.this.f26880zb.get(str);
                                if (ycxVar != null) {
                                    JSONObject jSONObjectYcx = ycxVar.ycx(jSONObject2);
                                    if (hashSet.contains(str)) {
                                        jSONObject.put(str, jSONObjectYcx);
                                    }
                                }
                            }
                            jSONObject.put("common", jSONObject2);
                        } catch (JSONException e3) {
                            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGri2R", "Sfsj", Sdk.SDKError.Reason.AD_EXPIRED_VALUE);
                            htf.sya(e3.getMessage(), new Object[0]);
                        }
                    } else {
                        try {
                            if (zb.this.sya != null) {
                                jSONObject.put("common", zb.this.sya.ycx(jSONObject2));
                            }
                        } catch (JSONException e11) {
                            sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGri2R", "Sfsj", Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE);
                            htf.sya(e11.getMessage(), new Object[0]);
                        }
                    }
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGri2R", "Sfsj", Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE);
                    htf.sya(th2.getMessage(), new Object[0]);
                }
                zb.this.f26879ul = jSONObject.toString();
                zb zbVar = zb.this;
                zbVar.ycx(zbVar.f26876jc, ycx.ycx().dj());
            } catch (OutOfMemoryError e12) {
                sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGri2R", "Sfsj", Sdk.SDKError.Reason.BLACK_SCREEN_DETECTION_ERROR_VALUE);
                htf.sya(e12.getMessage(), new Object[0]);
            }
        }
    };

    private zb() {
    }

    private void lud() {
        if (this.f26875dj) {
            return;
        }
        this.f26875dj = true;
        ycx(this.f26876jc, ycx.ycx().dj());
    }

    private void dj() {
        final long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (jElapsedRealtime - this.f26877jw > h.f42227c) {
            dj.ycx("track_feature_result", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.lt.zb.1
                @Override // com.bytedance.sdk.openadsdk.dy.zb
                public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                    zb.this.f26877jw = jElapsedRealtime;
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("msg", String.valueOf(zb.this.fby));
                    return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("track_feature_result").zb(jSONObject.toString());
                }
            });
        }
    }

    private Handler sya() {
        if (this.lud == null || !this.lud.isAlive()) {
            synchronized (syc.class) {
                try {
                    if (this.lud == null || !this.lud.isAlive()) {
                        this.lud = fby.ycx("pag_feature", -1);
                        this.f26878lt = new Handler(this.lud.getLooper());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } else if (this.f26878lt == null) {
            synchronized (syc.class) {
                try {
                    if (this.f26878lt == null) {
                        this.f26878lt = new Handler(this.lud.getLooper());
                    }
                } finally {
                }
            }
        }
        return this.f26878lt;
    }

    public void zb() {
        try {
            if (ycx.ycx().sya()) {
                ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.lt.zb.7
                    @Override // java.lang.Runnable
                    public void run() {
                        if (!ycx.ycx().lud()) {
                            if (zb.this.sya != null) {
                                zb.this.sya.ycx();
                            }
                        } else {
                            Iterator it = zb.this.f26880zb.keySet().iterator();
                            while (it.hasNext()) {
                                com.bytedance.sdk.openadsdk.wie.ycx ycxVar = (com.bytedance.sdk.openadsdk.wie.ycx) zb.this.f26880zb.get((String) it.next());
                                if (ycxVar != null) {
                                    ycxVar.ycx();
                                }
                            }
                        }
                    }
                });
            }
        } catch (OutOfMemoryError e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGrg==", "VOAMhROeaMSLTcVSmR+k", 356);
            htf.sya(e3.getMessage(), new Object[0]);
        }
    }

    private void ycx(Runnable runnable) {
        if (kgy.ycx || runnable == null) {
            return;
        }
        try {
            sya().post(runnable);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGrg==", "U+8jkQ+5WciTXg==", 90);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(Runnable runnable, long j11) {
        if (kgy.ycx || runnable == null) {
            return;
        }
        try {
            sya().postDelayed(runnable, j11);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGrg==", "U+8jkQ+5WciTXvNYgBC5", 103);
        }
    }

    public static zb ycx() {
        if (ycx == null) {
            synchronized (com.bytedance.sdk.openadsdk.core.sya.class) {
                try {
                    if (ycx == null) {
                        ycx = new zb();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public void ycx(JSONObject jSONObject) {
        if (ycx.ycx().sya()) {
            try {
                jSONObject.put("feature_data", this.f26879ul);
                dj();
            } catch (JSONException e3) {
                sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGrg==", "WuoptgKwatKMS8NYvhSzPVf6", Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE);
                htf.sya(e3.getMessage(), new Object[0]);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str, String str2, String str3) {
        try {
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && ycx.ycx().sya()) {
                lud();
                if (ycx.ycx().lud()) {
                    com.bytedance.sdk.openadsdk.wie.ycx ycxVar = this.f26880zb.get(str2);
                    if (ycxVar == null) {
                        ycxVar = new com.bytedance.sdk.openadsdk.wie.ycx(str2);
                    }
                    ycxVar.ycx(str, str3);
                    this.f26880zb.put(str2, ycxVar);
                    return;
                }
                if (this.sya == null) {
                    this.sya = new com.bytedance.sdk.openadsdk.wie.ycx(str2);
                }
                this.sya.ycx(str, str3);
            }
        } catch (OutOfMemoryError e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4oUoTxO/Cg=", "fessgRaubOSBScJRjQWlBVrgLJIGrg==", "X+ssmSW5aNOVWNJ4mhSuPA==", 176);
            htf.sya(e3.getMessage(), new Object[0]);
        }
    }

    public void ycx(final String str, final String str2, final String str3, String str4) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || !ycx.ycx().sya()) {
            return;
        }
        if (!"show".equals(str) && !TTEDPEventConstants.EDP_EVENT_NAME_CLICK.equals(str) && !"dislike".equals(str)) {
            if (ycx.ycx().pmi()) {
                if (TextUtils.isEmpty(str4)) {
                    return;
                }
                if (!"rewarded_video".equals(str4) && !"fullscreen_interstitial_ad".equals(str4) && !"open_ad".equals(str4)) {
                    return;
                }
            }
            if ("feed_play".equals(str) || "feed_pause".equals(str) || "feed_continue".equals(str) || "feed_over".equals(str) || "feed_break".equals(str) || "play_error".equals(str)) {
                ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.lt.zb.3
                    @Override // java.lang.Runnable
                    public void run() {
                        zb.this.ycx(str, str2, str3);
                    }
                });
                return;
            }
            return;
        }
        ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.lt.zb.2
            @Override // java.lang.Runnable
            public void run() {
                zb.this.ycx(str, str2, str3);
            }
        });
    }

    public void ycx(final String str, final tn tnVar) {
        if (!TextUtils.isEmpty(str) && ycx.ycx().sya() && tn.lud(tnVar)) {
            if (!ycx.ycx().pmi() || tnVar.tz() == 8 || tnVar.tz() == 7 || tnVar.tz() == 3) {
                if ("videoPercent30".equals(str) || "videoForceBreak".equals(str)) {
                    ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.lt.zb.4
                        @Override // java.lang.Runnable
                        public void run() {
                            String strZr = tnVar.zr();
                            String strAc = tnVar.ac();
                            if (TextUtils.isEmpty(strZr)) {
                                return;
                            }
                            zb.this.ycx(str, strZr, strAc);
                        }
                    });
                }
            }
        }
    }

    public void ycx(final String str, final tn tnVar, final String str2) {
        if (TextUtils.isEmpty(str) || !ycx.ycx().sya()) {
            return;
        }
        if ("landingStart".equals(str) || "landingFinish".equals(str) || "landingContinue".equals(str) || "landingPause".equals(str)) {
            ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.lt.zb.5
                @Override // java.lang.Runnable
                public void run() {
                    tn tnVar2 = tnVar;
                    if (tnVar2 == null || TextUtils.isEmpty(tnVar2.zr())) {
                        return;
                    }
                    zb.this.ycx(str, tnVar.zr(), tnVar.ac() + str2);
                }
            });
        }
    }
}
