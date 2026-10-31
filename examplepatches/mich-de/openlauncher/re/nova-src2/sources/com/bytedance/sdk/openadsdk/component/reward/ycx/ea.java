package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.annotation.SuppressLint;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2;
import com.bytedance.sdk.openadsdk.component.reward.ycx.lud;
import com.bytedance.sdk.openadsdk.core.model.ok;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.core.sya.ycx;
import com.bytedance.sdk.openadsdk.oty.zb.lud;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.vungle.ads.internal.protos.Sdk;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea {
    private final com.bytedance.sdk.openadsdk.core.sya.lud sya;
    private final zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.sya.zb f25061zb;

    public ea(zb zbVar) {
        this.ycx = zbVar;
        this.sya = ycx(zbVar, zbVar.f25203zb);
        this.f25061zb = new com.bytedance.sdk.openadsdk.core.sya.zb(zbVar.yzp, zbVar.f25203zb, zbVar.lud, zbVar.f25173dj ? 7 : 5) { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ea.1
            @Override // com.bytedance.sdk.openadsdk.core.sya.zb, com.bytedance.sdk.openadsdk.core.sya.sya
            public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
                try {
                    ea.this.ycx(view, f11, f12, f13, f14, sparseArray, this.bhi, this.f26153hf, this.tru);
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXuD0Q==", "VOAOmQq/Yg==", 68);
                    com.bytedance.sdk.component.utils.htf.sya("TTAD.RFReportManager", "onClickReport error :" + e3.getMessage());
                }
                com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(ea.this.ycx.f25203zb, 9);
                ea.this.ycx.thx.sz();
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject fby() {
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar;
        zb zbVar = this.ycx;
        if (!zbVar.f25188sg || (fbyVar = zbVar.f25196uu) == null) {
            return null;
        }
        try {
            return com.bytedance.sdk.openadsdk.dj.sya.ycx(fbyVar.f24554ea + 1);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXs=", "XOs5pQK7Q9SPRPNcmBA=", 143);
            return null;
        }
    }

    private JSONObject jc() {
        JSONObject jSONObject;
        Throwable th2;
        try {
            long jTn = this.ycx.thx.tn();
            int iDv = this.ycx.thx.dv();
            jSONObject = new JSONObject();
            try {
                jSONObject.put("duration", jTn);
                jSONObject.put("percent", iDv);
                return jSONObject;
            } catch (Throwable th3) {
                th2 = th3;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXs=", "XOs5tAeZcdOSS/NcmBA=", 517);
                return jSONObject;
            }
        } catch (Throwable th4) {
            jSONObject = null;
            th2 = th4;
        }
    }

    private boolean jw() {
        tn tnVar = this.ycx.f25203zb;
        return tnVar != null && tnVar.pg() == 1;
    }

    private boolean ul() {
        zb zbVar = this.ycx;
        if (zbVar == null) {
            return true;
        }
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
        boolean z11 = fbyVar != null && fbyVar.nji().oty();
        zb zbVar2 = this.ycx;
        boolean z12 = zbVar2.xym;
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar2 = zbVar2.f25196uu;
        return z11 && !z12 && (fbyVar2 != null && !fbyVar2.duz());
    }

    public com.bytedance.sdk.openadsdk.core.sya.zb dj() {
        return this.f25061zb;
    }

    public void lt() {
        JSONObject jSONObject = new JSONObject();
        if (this.ycx.f25180jw.get()) {
            try {
                jSONObject.put("endcard_content", this.ycx.rmf.sya() ? 1 : this.ycx.aeu.dj() ? 3 : this.ycx.rmf.dj() ? 2 : 0);
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXs=", "SOsjkSK4bciOadtSnxSFJl/NLIcHmX/Cjl4=", 385);
            }
        } else {
            try {
                jSONObject.put("endCardNotShow", 1);
            } catch (JSONException e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXs=", "SOsjkSK4bciOadtSnxSFJl/NLIcHmX/Cjl4=", 393);
            }
        }
        zb zbVar = this.ycx;
        com.bytedance.sdk.openadsdk.dj.sya.zb(zbVar.f25203zb, zbVar.lud, "click_close", jSONObject);
    }

    public com.bytedance.sdk.openadsdk.core.sya.lud lud() {
        return this.sya;
    }

    @SuppressLint({"ClickableViewAccessibility"})
    public com.bytedance.sdk.openadsdk.core.sya.lud sya() {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        this.sya.zb(this.ycx.yzp.findViewById(16908290));
        if (this.ycx.wwx.sya() != null) {
            this.sya.ycx(this.ycx.wwx.sya());
        }
        this.ycx.f25189tn.ycx(this.sya);
        this.sya.ycx(new ycx.InterfaceC0083ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ea.3
            @Override // com.bytedance.sdk.openadsdk.core.sya.ycx.InterfaceC0083ycx
            public long getVideoProgress() {
                return ea.this.ycx.thx.ry();
            }
        });
        com.bytedance.sdk.openadsdk.component.reward.view.ea eaVar = this.ycx.kgy;
        com.bytedance.sdk.openadsdk.core.sya.lud ludVar = this.sya;
        eaVar.ycx(ludVar, ludVar, this.f25061zb);
        this.ycx.rmy.ycx(this.sya);
        if (com.bytedance.sdk.openadsdk.core.model.htf.ry(this.ycx.f25203zb) && (syaVar = this.ycx.f25201xz.ycx) != null && syaVar.getITopLayout() != null) {
            dc.ycx(this.ycx.f25201xz.ycx.getITopLayout(), (View.OnClickListener) this.f25061zb, "LandPage#TopLayoutEmptyClick");
        }
        return this.sya;
    }

    public void zb() {
        if (ul()) {
            return;
        }
        tn tnVar = this.ycx.f25203zb;
        if (tnVar == null || !tnVar.yi()) {
            JSONObject jSONObject = new JSONObject();
            boolean z11 = false;
            int iEa = -1;
            try {
                if (this.ycx.f25203zb.lt()) {
                    zb zbVar = this.ycx;
                    if (zbVar.f25174dv != null && zbVar.f25203zb.aq() == 2) {
                        jSONObject.put("dynamic_show_type", this.ycx.f25174dv.ea());
                        this.ycx.f25174dv.ycx(jSONObject);
                        iEa = this.ycx.f25174dv.ea();
                        z11 = true;
                    }
                }
                View viewFindViewById = this.ycx.yzp.findViewById(16908290);
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("width", viewFindViewById.getWidth());
                jSONObject2.put("height", viewFindViewById.getHeight());
                jSONObject2.put("alpha", viewFindViewById.getAlpha());
                jSONObject.put("root_view", jSONObject2.toString());
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXs=", "Ses9mhGoWs+PXeBViR+CIVXqG5wHuWbmhA==", Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFReportManager", "reportShowWhenBindVideoAd error", th2);
            }
            ycx(jSONObject, fby(), z11, iEa, false);
        }
    }

    public void ycx() {
        tn tnVar;
        if (ul() || (tnVar = this.ycx.f25203zb) == null || tnVar.yi()) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObjectFby = fby();
        boolean z11 = false;
        int iEa = -1;
        try {
            if (this.ycx.sya()) {
                if (jSONObjectFby == null) {
                    jSONObjectFby = new JSONObject();
                }
                int iYcx = this.ycx.ycx();
                if (1001 == iYcx) {
                    jSONObject.put("dynamic_show_type", iYcx + this.ycx.zb());
                } else {
                    jSONObject.put("dynamic_show_type", iYcx);
                }
            } else if (this.ycx.f25203zb.lt()) {
                zb zbVar = this.ycx;
                if (zbVar.f25174dv != null && zbVar.f25203zb.aq() == 2) {
                    jSONObject.put("dynamic_show_type", this.ycx.f25174dv.ea());
                    this.ycx.f25174dv.ycx(jSONObject);
                    iEa = this.ycx.f25174dv.ea();
                    z11 = true;
                }
            }
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXs=", "Ses9mhGoWs+PXQ==", Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            Log.e("TTAD.RFReportManager", "Inject render fail info to pagJsonData failed", e3);
        }
        ycx(jSONObject, jSONObjectFby, z11, iEa, true);
    }

    public void sya(boolean z11) {
        zb zbVar = this.ycx;
        if (zbVar != null && z11 && zbVar.f25203zb.mqm() && !this.ycx.f25203zb.bhi()) {
            this.ycx.f25203zb.ul(true);
            zb zbVar2 = this.ycx;
            tn tnVar = zbVar2.f25203zb;
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, zbVar2.lud, tnVar.wqq());
        }
    }

    public void zb(boolean z11) {
        tn tnVar;
        zb zbVar = this.ycx;
        if (zbVar == null) {
            return;
        }
        if (!z11 && zbVar.f25193ui > 0 && (tnVar = zbVar.f25203zb) != null && tnVar.yi()) {
            String strValueOf = String.valueOf(SystemClock.elapsedRealtime() - this.ycx.f25193ui);
            zb zbVar2 = this.ycx;
            com.bytedance.sdk.openadsdk.dj.sya.ycx(strValueOf, zbVar2.f25203zb, zbVar2.lud, zbVar2.thx.lud());
            this.ycx.f25193ui = 0L;
        } else {
            this.ycx.f25193ui = SystemClock.elapsedRealtime();
        }
        com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.ycx.f25203zb, z11 ? 4 : 8);
        com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(this.ycx.f25203zb, z11 ? 4 : 8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(JSONObject jSONObject, JSONObject jSONObject2, boolean z11, int i5, boolean z12) {
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
        int i11;
        zb zbVar = this.ycx;
        tn tnVar = zbVar.f25203zb;
        if (zbVar.hpv && (i11 = zbVar.f25178iq) == 5) {
            tnVar.xkz(i11);
        }
        com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, this.ycx.lud, jSONObject, jSONObject2);
        this.ycx.dwi.jc();
        if (!z11) {
            i5 = -1;
        }
        lud.ycx ycxVar = new lud.ycx(i5);
        ycx(ycxVar);
        com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.ycx.yzp.findViewById(16908290), tnVar, ycxVar);
        com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(tnVar);
        if (!z12 || (djVarQye = tnVar.qye()) == null) {
            return;
        }
        djVarQye.ycx().ycx(0L);
    }

    private void zb(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, int i5, int i11, int i12) {
        tn tnVar;
        if (!jw() || (tnVar = this.ycx.f25203zb) == null || view == null) {
            return;
        }
        boolean z11 = com.bytedance.sdk.openadsdk.core.model.htf.ry(tnVar) && (view instanceof TopLayoutDislike2) && this.ycx.f25201xz.ycx.getITopLayout() == view;
        int id2 = view.getId();
        if (z11 || id2 == com.bytedance.sdk.openadsdk.utils.wie.f27236ul || id2 == com.bytedance.sdk.openadsdk.utils.wie.f27208lt || id2 == com.bytedance.sdk.openadsdk.utils.wie.lud || id2 == com.bytedance.sdk.openadsdk.utils.wie.f27190dj || id2 == com.bytedance.sdk.openadsdk.utils.wie.xkz || id2 == com.bytedance.sdk.openadsdk.utils.wie.vbt || id2 == com.bytedance.sdk.openadsdk.utils.wie.pmi || id2 == 520093705 || id2 == com.bytedance.sdk.openadsdk.utils.wie.f27227ry || id2 == 520093707 || id2 == com.bytedance.sdk.openadsdk.utils.wie.f27204jw) {
            int iEa = dc.ea(com.bytedance.sdk.openadsdk.core.pmi.ycx());
            com.bytedance.sdk.openadsdk.core.model.ok okVarYcx = new ok.ycx().lt(f11).lud(f12).dj(f13).sya(f14).zb(System.currentTimeMillis()).ycx(0L).ycx(dc.ycx(this.ycx.kgy.ok())).zb(dc.sya(this.ycx.kgy.ok())).dj(i11).lud(i12).lt(i5).ycx(sparseArray).zb(com.bytedance.sdk.openadsdk.core.jc.zb().ycx() ? 1 : 2).sya(iEa).ycx(dc.jw(com.bytedance.sdk.openadsdk.core.pmi.ycx())).zb(dc.jc(com.bytedance.sdk.openadsdk.core.pmi.ycx())).ycx();
            HashMap map = new HashMap();
            map.put("duration", Long.valueOf(this.ycx.thx.ry()));
            zb zbVar = this.ycx;
            String str = zbVar.lud;
            if (z11) {
                str = "landingpage_endcard";
            }
            com.bytedance.sdk.openadsdk.dj.sya.ycx("click_other", zbVar.f25203zb, okVarYcx, str, true, (Map<String, Object>) map, -1);
        }
    }

    public void ycx(final Map<String, Object> map) {
        if (ul()) {
            return;
        }
        tn tnVar = this.ycx.f25203zb;
        if (tnVar == null || !tnVar.yi()) {
            final View viewFindViewById = this.ycx.yzp.findViewById(16908290);
            if (viewFindViewById == null) {
                viewFindViewById = this.ycx.yzp.getWindow().getDecorView();
            }
            int width = viewFindViewById.getWidth();
            int height = viewFindViewById.getHeight();
            Runnable runnable = new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ea.2
                @Override // java.lang.Runnable
                public void run() {
                    boolean z11;
                    int iEa;
                    Map map2;
                    zb unused = ea.this.ycx;
                    JSONObject jSONObject = null;
                    try {
                        jSONObject = map != null ? new JSONObject(map) : new JSONObject();
                        JSONObject jSONObject2 = new JSONObject();
                        jSONObject2.put("width", viewFindViewById.getWidth());
                        jSONObject2.put("height", viewFindViewById.getHeight());
                        jSONObject2.put("alpha", viewFindViewById.getAlpha());
                        jSONObject.put("root_view", jSONObject2.toString());
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRuVYnB6yPHbvI5QEuXuD0g==", "Sfsj", 257);
                        com.bytedance.sdk.component.utils.htf.ycx("TTAD.RFReportManager", "run: ", th2);
                    }
                    JSONObject jSONObject3 = jSONObject;
                    if (ea.this.ycx.f25174dv == null || (map2 = map) == null || !map2.containsKey("dynamic_show_type")) {
                        z11 = false;
                        iEa = -1;
                    } else {
                        iEa = ea.this.ycx.f25174dv.ea();
                        z11 = true;
                    }
                    int i5 = iEa;
                    boolean z12 = z11;
                    ea eaVar = ea.this;
                    eaVar.ycx(jSONObject3, eaVar.fby(), z12, i5, false);
                }
            };
            Thread.currentThread().getName();
            if (width > 0 && height > 0) {
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    runnable.run();
                    return;
                } else {
                    viewFindViewById.post(runnable);
                    return;
                }
            }
            viewFindViewById.post(runnable);
        }
    }

    private void ycx(lud.ycx ycxVar) {
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar;
        zb zbVar = this.ycx;
        if (!zbVar.f25188sg || (fbyVar = zbVar.f25196uu) == null) {
            return;
        }
        ycxVar.f26957zb = fbyVar.f24554ea;
    }

    public void ycx(boolean z11) {
        tn tnVar = this.ycx.f25203zb;
        if (tnVar == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.dy.ycx.dj djVarLud = com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx(z11 ? 7 : 8).sya(String.valueOf(tnVar.ksy())).lud(this.ycx.f25203zb.ac());
        djVarLud.zb(this.ycx.rmf.pmi()).lt(this.ycx.rmf.uh());
        djVarLud.ul(this.ycx.f25203zb.pks()).dj(this.ycx.f25203zb.m147if());
        com.bytedance.sdk.openadsdk.dy.dj.ycx().zb(djVarLud);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, int i5, int i11, int i12) {
        if (view == null) {
            return;
        }
        if (view.getId() == com.bytedance.sdk.openadsdk.utils.wie.f27236ul) {
            ycx("click_play_star_level", (JSONObject) null);
        } else if (view.getId() != com.bytedance.sdk.openadsdk.utils.wie.f27208lt && view.getId() != com.bytedance.sdk.openadsdk.utils.wie.f27204jw) {
            if (view.getId() == com.bytedance.sdk.openadsdk.utils.wie.lud) {
                ycx("click_play_source", (JSONObject) null);
            } else if (view.getId() == com.bytedance.sdk.openadsdk.utils.wie.f27190dj) {
                ycx("click_play_logo", (JSONObject) null);
            } else if (view.getId() != com.bytedance.sdk.openadsdk.utils.wie.xkz && view.getId() != com.bytedance.sdk.openadsdk.utils.wie.vbt && view.getId() != com.bytedance.sdk.openadsdk.utils.wie.pmi) {
                if (view.getId() == 520093705) {
                    ycx("click_start_play", jc());
                } else if (view.getId() == com.bytedance.sdk.openadsdk.utils.wie.f27227ry) {
                    ycx("click_video", jc());
                } else if (view.getId() == 520093707 || view.getId() == com.bytedance.sdk.openadsdk.utils.wie.f27202jc) {
                    ycx("fallback_endcard_click", jc());
                }
            } else {
                ycx("click_start_play_bar", jc());
            }
        } else {
            ycx("click_play_star_nums", (JSONObject) null);
        }
        zb(view, f11, f12, f13, f14, sparseArray, i5, i11, i12);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str, JSONObject jSONObject) {
        zb zbVar = this.ycx;
        tn tnVar = zbVar.f25203zb;
        String str2 = zbVar.lud;
        if (!zbVar.f25173dj) {
            jSONObject = null;
        }
        com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str2, str, jSONObject);
    }

    public com.bytedance.sdk.openadsdk.core.sya.lud ycx(final zb zbVar, final tn tnVar) {
        return new com.bytedance.sdk.openadsdk.core.sya.lud(zbVar.yzp, tnVar, zbVar.lud, zbVar.f25173dj ? 7 : 5) { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ea.4
            @Override // com.bytedance.sdk.openadsdk.core.sya.lud
            public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, int i5, int i11, int i12, boolean z11) {
                if (tnVar.wnd() && view != null) {
                    Object tag = view.getTag(570425345);
                    if (tag instanceof String) {
                        ycx((String) tag);
                    }
                }
                HashMap map = new HashMap();
                map.put("duration", Long.valueOf(zbVar.thx.ry()));
                if (zbVar.f25180jw.get()) {
                    map.put("click_scence", 2);
                } else {
                    map.put("click_scence", 1);
                }
                com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
                if (fbyVar != null) {
                    fbyVar.ycx(map, f11, f12);
                }
                ycx(map);
                zbVar.dwi.rmy();
                zbVar.wwx.ycx(view, f11, f12, f13, f14, sparseArray, i5, i11, i12, new lud.ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ea.4.1
                    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.lud.ycx
                    public void ycx(String str, JSONObject jSONObject) {
                        ea.this.ycx(str, jSONObject);
                    }

                    @Override // com.bytedance.sdk.openadsdk.component.reward.ycx.lud.ycx
                    public void ycx(View view2, float f15, float f16, float f17, float f18, SparseArray<sya.ycx> sparseArray2, int i13, int i14, int i15) {
                        ea.this.ycx(view2, f15, f16, f17, f18, sparseArray2, i13, i14, i15);
                    }
                });
                com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(tnVar, 9);
                zbVar.thx.sz();
            }
        };
    }
}
