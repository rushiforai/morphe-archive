package com.bytedance.sdk.openadsdk.core.xkz;

import android.text.TextUtils;
import com.amplitude.android.migration.DatabaseConstants;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.c;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.xkz.zb.sya;
import com.bytedance.sdk.openadsdk.core.xkz.zb.ycx;
import com.bytedance.sdk.openadsdk.core.xkz.zb.zb;
import com.facebook.ads.AdSDKNotificationListener;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dy, reason: collision with root package name */
    private long f26411dy;
    private boolean htf;
    private boolean pmi;
    private boolean syc;
    private String thx;

    /* renamed from: uh, reason: collision with root package name */
    private boolean f26418uh;
    private tn wie;
    private String wwx;

    /* renamed from: ry, reason: collision with root package name */
    private final AtomicBoolean f26417ry = new AtomicBoolean(false);
    private final AtomicBoolean xkz = new AtomicBoolean(false);
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> ycx = new ArrayList();

    /* renamed from: zb, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26420zb = new ArrayList();
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> sya = new ArrayList();

    /* renamed from: dj, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26410dj = new ArrayList();
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> lud = new ArrayList();

    /* renamed from: lt, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26415lt = new ArrayList();

    /* renamed from: ul, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26419ul = new ArrayList();
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> fby = new ArrayList();

    /* renamed from: jw, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26414jw = new ArrayList();

    /* renamed from: jc, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26413jc = new ArrayList();

    /* renamed from: ea, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.zb> f26412ea = new ArrayList();

    /* renamed from: ok, reason: collision with root package name */
    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.ycx> f26416ok = new ArrayList();

    public void dj(long j11) {
        if (!ycx(j11, this.lud, null, new sya.zb(this.syc ? "video_progress" : "complete", this.wie, 1.0f)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_complete", (JSONObject) null);
    }

    public void ea(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.f26414jw.addAll(list);
    }

    public void fby(long j11) {
        if (!ycx(j11, this.f26414jw, null, this.syc ? null : new sya.zb("mute", this.wie, j11)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_mute", (JSONObject) null);
    }

    public void jc(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.ycx.addAll(list);
    }

    public void jw(long j11) {
        if (!ycx(j11, this.f26413jc, null, this.syc ? null : new sya.zb("unmute", this.wie, j11)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_unmute", (JSONObject) null);
    }

    public void lt(long j11) {
        if (!ycx(j11, this.f26419ul, null, this.syc ? null : new sya.zb("skip", this.wie)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_skip", (JSONObject) null);
    }

    public void lud(long j11) {
        if (this.xkz.compareAndSet(false, true)) {
            ycx(j11, this.f26415lt, (com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx) null);
        }
    }

    public void ok(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.f26413jc.addAll(list);
    }

    public void sya(long j11) {
        if (!ycx(j11, this.f26410dj, null, this.syc ? null : new sya.zb("resume", this.wie, j11)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_resume", (JSONObject) null);
    }

    public void ul(long j11) {
        if (!ycx(j11, this.fby, null, new sya.zb(this.syc ? TTEDPEventConstants.EDP_EVENT_NAME_CLICK : "clickTracking", this.wie)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_video_click", (JSONObject) null);
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx ycxVar) {
        if (!ycx(-1L, this.ycx, ycxVar, this.syc ? null : new sya.zb("error", this.wie, 0.0f)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_error", (JSONObject) null);
    }

    public void zb(long j11) {
        if (!ycx(j11, this.sya, null, this.syc ? null : new sya.zb("pause", this.wie, j11)) || this.syc) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_pause", (JSONObject) null);
    }

    public void lud(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.f26415lt.addAll(list);
    }

    public void dj(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.lud.addAll(list);
    }

    public void fby(List<com.bytedance.sdk.openadsdk.core.xkz.zb.zb> list) {
        this.f26412ea.addAll(list);
        Collections.sort(this.f26412ea);
    }

    public void jw(List<com.bytedance.sdk.openadsdk.core.xkz.zb.ycx> list) {
        this.f26416ok.addAll(list);
        Collections.sort(this.f26416ok);
    }

    public void lt(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.f26419ul.addAll(list);
    }

    public void sya(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.f26410dj.addAll(list);
    }

    public void ul(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.fby.addAll(list);
    }

    public void ycx(long j11) {
        if (this.f26417ry.compareAndSet(false, true)) {
            if (!ycx(j11, this.f26420zb, null, new sya.zb(this.syc ? "show_impression" : AdSDKNotificationListener.IMPRESSION_EVENT, this.wie)) || this.syc) {
                return;
            }
            com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_impression", (JSONObject) null);
        }
    }

    public void zb(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.sya.addAll(list);
    }

    public void ycx(long j11, long j12, lt ltVar) {
        sya.zb zbVar;
        if (System.currentTimeMillis() - this.f26411dy >= 1000 && j11 >= 0 && j12 > 0) {
            this.f26411dy = System.currentTimeMillis();
            float f11 = j11 / j12;
            List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> listYcx = ycx(j11, f11);
            float f12 = 0.25f;
            if (f11 >= 0.25f && !this.pmi) {
                ycx("firstQuartile");
                this.pmi = true;
                if (ltVar != null) {
                    ycx(ltVar, 6);
                }
                if (!this.syc) {
                    zbVar = new sya.zb("firstQuartile", this.wie, 0.25f);
                    f11 = f12;
                }
                f11 = f12;
                zbVar = null;
            } else {
                f12 = 0.5f;
                if (f11 >= 0.5f && !this.f26418uh) {
                    ycx("midpoint");
                    this.f26418uh = true;
                    if (ltVar != null) {
                        ycx(ltVar, 7);
                    }
                    if (!this.syc) {
                        zbVar = new sya.zb("midpoint", this.wie, 0.5f);
                        f11 = f12;
                    }
                    f11 = f12;
                    zbVar = null;
                } else {
                    f12 = 0.75f;
                    if (f11 >= 0.75f && !this.htf) {
                        ycx("thirdQuartile");
                        this.htf = true;
                        if (ltVar != null) {
                            ycx(ltVar, 8);
                        }
                        if (!this.syc) {
                            zbVar = new sya.zb("thirdQuartile", this.wie, 0.75f);
                            f11 = f12;
                        }
                        f11 = f12;
                    }
                    zbVar = null;
                }
            }
            if (f11 < 0.03f) {
                f11 = 0.0f;
            }
            if (!this.syc && !listYcx.isEmpty()) {
                com.bytedance.sdk.openadsdk.core.xkz.zb.sya syaVar = listYcx.get(0);
                if ((syaVar instanceof com.bytedance.sdk.openadsdk.core.xkz.zb.ycx) && ((com.bytedance.sdk.openadsdk.core.xkz.zb.ycx) syaVar).ycx() == 0) {
                    com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_start", (JSONObject) null);
                    zbVar = new sya.zb("start", this.wie, f11);
                }
            }
            if (listYcx.isEmpty()) {
                return;
            }
            if (zbVar == null) {
                zbVar = new sya.zb("video_progress", this.wie, f11);
            }
            ycx(j11, listYcx, null, zbVar);
        }
    }

    public void ycx(int i5, long j11, long j12) {
        if (System.currentTimeMillis() - this.f26411dy < 1000) {
            return;
        }
        this.f26411dy = System.currentTimeMillis();
        float f11 = j11 / j12;
        List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> listYcx = ycx(j11, f11);
        sya.zb zbVar = null;
        if (i5 != 6) {
            if (i5 == 7) {
                ycx("midpoint");
                this.f26418uh = true;
                f11 = 0.5f;
                if (!this.syc) {
                    zbVar = new sya.zb("midpoint", this.wie, 0.5f);
                }
            } else if (i5 != 8) {
                if (i5 == 15 && (listYcx.get(0) instanceof com.bytedance.sdk.openadsdk.core.xkz.zb.ycx)) {
                    com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_start", (JSONObject) null);
                    zbVar = new sya.zb("start", this.wie, f11);
                }
            } else {
                ycx("thirdQuartile");
                this.htf = true;
                f11 = 0.75f;
                if (!this.syc) {
                    zbVar = new sya.zb("thirdQuartile", this.wie, 0.75f);
                }
            }
        } else if (!this.pmi) {
            ycx("firstQuartile");
            this.pmi = true;
            f11 = 0.25f;
            if (!this.syc) {
                zbVar = new sya.zb("firstQuartile", this.wie, 0.25f);
            }
        }
        if (listYcx.isEmpty()) {
            return;
        }
        if (zbVar == null) {
            zbVar = new sya.zb("video_progress", this.wie, f11);
        }
        ycx(j11, listYcx, null, zbVar);
    }

    private void ycx(final lt ltVar, final int i5) {
        com.bytedance.sdk.component.utils.jw.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.dj.1
            @Override // java.lang.Runnable
            public void run() {
                lt ltVar2 = ltVar;
                if (ltVar2 != null) {
                    ltVar2.ycx(i5);
                }
            }
        });
    }

    private void ycx(String str) {
        try {
            if (this.syc) {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put(DatabaseConstants.EVENT_FIELD, str);
                com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "vast_play_track", jSONObject);
            } else if ("firstQuartile".equals(str)) {
                com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_first_quartile", (JSONObject) null);
            } else if ("midpoint".equals(str)) {
                com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_midpoint", (JSONObject) null);
            } else if ("thirdQuartile".equals(str)) {
                com.bytedance.sdk.openadsdk.dj.sya.zb(this.wie, this.thx, "track_third_quartile", (JSONObject) null);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becpkAyIe8aDQdJPnw==", "Ses9mhGoT9WBScNUgx+hJA==", 323);
        }
    }

    private boolean ycx(long j11, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list, com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx ycxVar, sya.zb zbVar) {
        c cVarCi;
        tn tnVar = this.wie;
        String str = null;
        if (tnVar != null && (cVarCi = tnVar.ci()) != null) {
            str = cVarCi.f22189g;
        }
        return com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(this.wie, list, ycxVar, j11, str, zbVar, ycx());
    }

    private String ycx() {
        if (this.wwx == null) {
            this.wwx = UUID.randomUUID().toString();
        }
        return this.wwx;
    }

    private boolean ycx(long j11, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list, com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx ycxVar) {
        return ycx(j11, list, ycxVar, null);
    }

    public List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> ycx(long j11, float f11) {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < this.f26412ea.size(); i5++) {
            com.bytedance.sdk.openadsdk.core.xkz.zb.zb zbVar = this.f26412ea.get(i5);
            if (zbVar.ycx(f11)) {
                arrayList.add(zbVar);
            }
        }
        for (int i11 = 0; i11 < this.f26416ok.size(); i11++) {
            com.bytedance.sdk.openadsdk.core.xkz.zb.ycx ycxVar = this.f26416ok.get(i11);
            if (ycxVar.ycx(j11)) {
                arrayList.add(ycxVar);
            }
        }
        return arrayList;
    }

    public void ycx(List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) {
        this.f26420zb.addAll(list);
    }

    public void ycx(JSONObject jSONObject) {
        jc(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("errorTrackers")));
        ycx(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("impressionTrackers")));
        zb(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("pauseTrackers"), true));
        sya(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("resumeTrackers"), true));
        dj(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("completeTrackers")));
        lud(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("closeTrackers")));
        lt(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("skipTrackers")));
        ul(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("clickTrackers")));
        ea(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("muteTrackers"), true));
        ok(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(jSONObject.optJSONArray("unMuteTrackers"), true));
        fby(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.zb(jSONObject.optJSONArray("fractionalTrackers")));
        jw(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.sya(jSONObject.optJSONArray("absoluteTrackers")));
    }

    public void ycx(tn tnVar) {
        this.wie = tnVar;
        this.thx = tnVar.lud();
        this.syc = tnVar.wnd();
    }

    public void ycx(String str, long j11) {
        if (TextUtils.isEmpty(str) || j11 < 0) {
            return;
        }
        jw(Collections.singletonList(new ycx.C0093ycx(str, j11).ycx()));
    }

    public void ycx(String str, float f11) {
        if (TextUtils.isEmpty(str) || f11 < 0.0f) {
            return;
        }
        fby(Collections.singletonList(new zb.ycx(str, f11).ycx()));
    }

    public void ycx(dj djVar) {
        jc(djVar.ycx);
        ycx(djVar.f26420zb);
        zb(djVar.sya);
        sya(djVar.f26410dj);
        dj(djVar.lud);
        lud(djVar.f26415lt);
        lt(djVar.f26419ul);
        ul(djVar.fby);
        ea(djVar.f26414jw);
        ok(djVar.f26413jc);
        fby(djVar.f26412ea);
        jw(djVar.f26416ok);
    }
}
