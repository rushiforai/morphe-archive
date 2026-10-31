package com.bytedance.sdk.openadsdk.activity.single;

import android.app.Activity;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import com.amplitude.core.events.Identify;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.a;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.pmi;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.activity.single.zb;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.bytedance.sdk.openadsdk.common.dy;
import com.bytedance.sdk.openadsdk.common.xkz;
import com.bytedance.sdk.openadsdk.common.ycx;
import com.bytedance.sdk.openadsdk.component.reward.ok;
import com.bytedance.sdk.openadsdk.core.dv;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.tn;
import com.bytedance.sdk.openadsdk.core.widget.uh;
import com.bytedance.sdk.openadsdk.dj.jc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.tru;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;
import qb.c;

/* loaded from: classes2.dex */
public abstract class fby implements com.bytedance.sdk.openadsdk.core.syc.dj.zb {

    /* renamed from: ea, reason: collision with root package name */
    public int f24554ea;

    /* renamed from: jc, reason: collision with root package name */
    public int f24555jc;

    /* renamed from: jw, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.component.reward.ycx.zb f24556jw;

    /* renamed from: lt, reason: collision with root package name */
    protected tn f24557lt;

    /* renamed from: ok, reason: collision with root package name */
    public boolean f24558ok;
    protected boolean pmi;

    /* renamed from: ry, reason: collision with root package name */
    public boolean f24559ry;
    private uh sya;
    public String syc;

    /* renamed from: uh, reason: collision with root package name */
    protected dy f24560uh;

    /* renamed from: ul, reason: collision with root package name */
    protected final zb f24561ul;
    public boolean wie;
    public String xkz;
    private boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f24562zb;
    protected final AtomicBoolean fby = new AtomicBoolean(false);

    /* renamed from: dy, reason: collision with root package name */
    public boolean f24553dy = false;

    public fby(zb zbVar, tn tnVar, int i5, int i11, boolean z11) {
        this.f24561ul = zbVar;
        this.f24557lt = tnVar;
        this.f24555jc = i5;
        this.f24554ea = i11;
        this.wie = z11;
    }

    private ycx.InterfaceC0054ycx bhi() {
        return new ycx.InterfaceC0054ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.fby.4
            @Override // com.bytedance.sdk.openadsdk.common.ycx.InterfaceC0054ycx
            public void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, View view) {
                fby.this.zb(zbVar);
            }
        };
    }

    private dy fby() {
        return new dy(this.f24556jw) { // from class: com.bytedance.sdk.openadsdk.activity.single.fby.1
            @Override // com.bytedance.sdk.openadsdk.common.dy
            public void sya() {
                fby.this.sz();
            }

            @Override // com.bytedance.sdk.openadsdk.common.dy
            public boolean ycx() {
                return fby.this.f24561ul.ok();
            }

            @Override // com.bytedance.sdk.openadsdk.common.dy
            public boolean zb() {
                return fby.this.f24561ul.ea().getBoolean("reward_verify", false) || fby.this.f24561ul.dy();
            }

            @Override // com.bytedance.sdk.openadsdk.common.dy
            public void ycx(boolean z11) {
                fby.this.f24561ul.zb(z11);
            }

            @Override // com.bytedance.sdk.openadsdk.common.dy
            public void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
                fby.this.ycx(zbVar);
            }
        };
    }

    private Runnable thx() {
        return new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.fby.2
            @Override // java.lang.Runnable
            public void run() {
                fby.this.sz();
            }
        };
    }

    private ycx.zb tn() {
        return new ycx.zb() { // from class: com.bytedance.sdk.openadsdk.activity.single.fby.3
            @Override // com.bytedance.sdk.openadsdk.common.ycx.zb
            public void ycx(boolean z11, int i5) {
                fby fbyVar = fby.this;
                if (fbyVar instanceof ycx) {
                    ((ycx) fbyVar).ycx(z11, i5);
                } else if (fbyVar instanceof lud) {
                    fbyVar.ea();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.common.ycx.zb
            public void ycx() {
                fby.this.sz();
            }
        };
    }

    public boolean aeu() {
        return false;
    }

    public void b_() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar;
        zb zbVar2 = this.f24561ul;
        boolean z11 = zbVar2 != null && zbVar2.zb();
        if (z11 && (zbVar = this.f24556jw) != null && !(zbVar.f25196uu instanceof lt)) {
            this.f24560uh = fby();
        }
        if (z11) {
            ycx(this.f24560uh);
        }
    }

    public void bba() {
        sya(0);
    }

    public boolean c_() {
        return false;
    }

    public abstract boolean d_();

    public Activity dc() {
        return this.f24561ul.ul();
    }

    public void dj() {
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public void dqs() {
        if (dv() != null) {
            dv().f25177hf.ycx();
        }
    }

    public boolean duz() {
        return this.f24562zb;
    }

    public abstract com.bytedance.sdk.openadsdk.component.reward.ycx.zb dv();

    public boolean dwi() {
        return this.wie;
    }

    public abstract String e_();

    public abstract void f_();

    public abstract boolean g_();

    public boolean hpv() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarDv;
        uh uhVar;
        if (dwi() || (zbVarDv = dv()) == null || !zbVarDv.f25203zb.qlw() || (uhVar = this.sya) == null) {
            return false;
        }
        return uhVar.ycx(zbVarDv.yzp);
    }

    public void htf() {
    }

    public void ifb() {
    }

    public void iq() {
        if (dwi() || dv() == null || dv().ifb == null || !dv().f25203zb.qlw()) {
            return;
        }
        uh uhVar = new uh(dv(), new uh.ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.fby.7
            @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
            public int dj() {
                zb zbVar = fby.this.f24561ul;
                if (zbVar != null) {
                    return zbVar.aeu();
                }
                return 0;
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
            public void lt() {
                fby.this.dj(1);
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
            public void lud() {
                fby.this.dj(2);
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
            public void sya() {
                zb zbVar = fby.this.f24561ul;
                if (zbVar != null) {
                    zbVar.rmf();
                }
                fby.this.dj(2);
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
            public void ycx() {
                fby fbyVar = fby.this;
                fbyVar.sya(fbyVar.dv());
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
            public void zb() {
                zb zbVar = fby.this.f24561ul;
                if (zbVar != null) {
                    zbVar.av();
                }
                fby.this.dj(1);
            }
        });
        this.sya = uhVar;
        uhVar.ycx(dv().ifb);
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public void jc() {
        toString();
        rl();
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public void kgy() {
        sya(2);
    }

    public void lt(boolean z11) {
        this.pmi = z11;
    }

    public void lud(boolean z11) {
        this.f24562zb = z11;
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public void lv() {
        zb zbVar = this.f24561ul;
        if (zbVar != null) {
            zbVar.ycx(this, true);
        }
    }

    public JSONObject mp() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("oversea_version_type", 1);
            jSONObject.put("sdk_version", BuildConfig.VERSION_NAME);
            jSONObject.put("media_extra", this.syc);
            jSONObject.put("play_start_ts", 0);
            jSONObject.put("play_end_ts", 0);
            jSONObject.put("user_id", this.xkz);
            jSONObject.put("trans_id", tru.ycx().replace(Identify.UNSET_VALUE, b.f42142b));
            if (dv() != null) {
                com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarDv = dv();
                jSONObject.put("duration", (int) zbVarDv.thx.tru());
                jSONObject.put("reward_name", zbVarDv.f25203zb.sg());
                jSONObject.put("reward_amount", zbVarDv.f25203zb.bh());
                jSONObject.put("network", pmi.sya(zbVarDv.oby));
                JSONObject jSONObjectPu = zbVarDv.f25203zb.pu();
                jSONObjectPu.put("gaid", com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().zb());
                jSONObject.put("extra", jSONObjectPu);
                jSONObject.put("video_duration", zbVarDv.f25203zb.ci().f22186d);
                String strDj = "unKnow";
                int iRow = zbVarDv.f25203zb.row();
                if (iRow == 2) {
                    strDj = oby.zb();
                } else if (iRow == 1) {
                    strDj = oby.dj();
                }
                jSONObject.put("user_agent", strDj);
            }
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "aO0omwY=", "WfskmQeKbNWJTM5/gxW5", 476);
            htf.ycx("Scene", b.f42142b, th2);
            return null;
        }
    }

    public zb nji() {
        return this.f24561ul;
    }

    public int oby() {
        return this.f24554ea;
    }

    public boolean oty() {
        return false;
    }

    public void rl() {
        zb zbVar = this.f24561ul;
        if (zbVar == null || zbVar.pmi()) {
            return;
        }
        this.f24561ul.syc();
        this.f24561ul.htf();
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public void rmy() {
        zr();
    }

    public void ry() {
    }

    public void sya() {
    }

    public abstract void sya(boolean z11);

    public void sz() {
        if (this.f24557lt != null) {
            com.bytedance.sdk.openadsdk.lt.zb.ycx().ycx("videoForceBreak", this.f24557lt);
        }
        this.f24561ul.lt();
    }

    public void tru() {
    }

    public void uf() {
        com.bytedance.sdk.openadsdk.core.syc.ycx.zb zbVarLt = tn.lt(this.f24557lt);
        zbVarLt.ycx("material_meta", this.f24557lt);
        zbVarLt.ycx("ad_slot", this.f24557lt.qn());
        com.bytedance.sdk.openadsdk.core.syc.lud.ycx.ycx(zbVarLt, new c() { // from class: com.bytedance.sdk.openadsdk.activity.single.fby.6
            @Override // qb.a
            public void ycx(a aVar, int i5) {
            }

            @Override // qb.a
            public void ycx(a aVar, int i5, String str) {
            }
        });
    }

    public void uh() {
        uh uhVar = this.sya;
        if (uhVar != null) {
            uhVar.fby();
            this.sya = null;
        }
        this.ycx = false;
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public final void ui() {
        tn tnVar;
        zr();
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.f24556jw;
        if (zbVar == null || (tnVar = zbVar.f25203zb) == null) {
            return;
        }
        tnVar.goq();
        this.f24556jw.f25203zb.dj(true);
        if (tn.lud(this.f24556jw.f25203zb)) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.f24556jw;
            tn tnVar2 = zbVar2.f25203zb;
            com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar2, zbVar2.lud, tnVar2.eu());
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public List<tn> uz() {
        return this.f24561ul.tru();
    }

    public abstract boolean wwx();

    public void xkz() {
    }

    public void xym() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar;
        ok okVar;
        if (!d_() || (zbVar = this.f24556jw) == null || (okVar = zbVar.f25200xf) == null) {
            return;
        }
        okVar.dj();
    }

    public boolean xz() {
        return false;
    }

    public abstract com.bytedance.sdk.openadsdk.component.reward.view.fby ycx();

    public void ycx(Activity activity) {
    }

    public abstract void ycx(Activity activity, zb.lud ludVar);

    public abstract void ycx(String str);

    public boolean yi() {
        tn tnVarYcx = this.f24561ul.ycx();
        if (tnVarYcx != null) {
            List<tn> listSzb = tnVarYcx.szb();
            for (int i5 = 0; i5 < listSzb.size(); i5++) {
                tn tnVar = listSzb.get(i5);
                if (tnVar != null && tnVar.yi()) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean yzp() {
        zb zbVar = this.f24561ul;
        return zbVar != null && zbVar.ycx(this, this.f24555jc);
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public void zb(int i5) {
    }

    public final void zr() {
        this.f24561ul.ry();
    }

    public void dj(int i5) {
        zb zbVar = this.f24561ul;
        if (zbVar != null) {
            zbVar.ycx(i5);
        }
    }

    public void sya(final int i5) {
        if (!this.f24561ul.ea().getBoolean("reward_verify", false) && !this.f24561ul.dy() && !this.f24561ul.ok()) {
            this.f24561ul.ea().putBoolean("reward_verify", true);
            if (dv() != null) {
                com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarDv = dv();
                if (com.bytedance.sdk.openadsdk.core.pmi.dj().wie(String.valueOf(zbVarDv.f25181lt))) {
                    ycx(true, zbVarDv.f25203zb.bh(), zbVarDv.f25203zb.sg(), 0, b.f42142b, i5);
                } else {
                    com.bytedance.sdk.openadsdk.core.pmi.sya().ycx(mp(), new tn.zb() { // from class: com.bytedance.sdk.openadsdk.activity.single.fby.5
                        @Override // com.bytedance.sdk.openadsdk.core.tn.zb
                        public void ycx(int i11, String str) {
                            fby.this.ycx(false, 0, b.f42142b, i11, str, i5);
                        }

                        @Override // com.bytedance.sdk.openadsdk.core.tn.zb
                        public void ycx(dv.zb zbVar) {
                            fby.this.ycx(zbVar.f25351zb, zbVar.sya.ycx(), zbVar.sya.zb(), 0, b.f42142b, i5);
                        }
                    });
                }
            }
        }
    }

    public void ycx(Activity activity, Bundle bundle) {
    }

    public final void zb(Activity activity, zb.lud ludVar) {
        if (this.ycx) {
            return;
        }
        this.ycx = true;
        ycx(activity, ludVar);
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.zb
    public void ycx(Bundle bundle) {
    }

    public void ycx(fby fbyVar, fby fbyVar2, zb.lud ludVar) {
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
    }

    public void zb(Activity activity) {
        if (com.bytedance.sdk.openadsdk.dv.lud.jw() && activity != null && activity.isChangingConfigurations()) {
            zb zbVar = this.f24561ul;
            if (zbVar == null || zbVar.ycx() == null) {
                return;
            }
            jc.ycx(this.f24561ul.ycx(), "close_interception_config_change", this.f24561ul.ycx().lud(), (String) null);
            return;
        }
        Objects.toString(this.f24561ul);
        if (!this.f24561ul.pmi() && !yi()) {
            long jJw = this.f24561ul.ycx().jw();
            if (jJw > 0) {
                long jElapsedRealtime = SystemClock.elapsedRealtime() - jJw;
                if (jElapsedRealtime > 0) {
                    this.f24557lt.zb(jElapsedRealtime);
                }
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarDv = dv();
            if (zbVarDv != null) {
                zbVarDv.ycx(BackupConstant.CLOSE_NOT_SHOW_ONE_TO_N_CODE, BackupConstant.CLOSE_NOT_SHOW_CODE_MSG, 1004);
                zbVarDv.f25177hf.ycx();
            }
        }
        xym();
        this.f24561ul.xkz();
    }

    public void ycx(Map<String, Object> map, float f11, float f12) {
    }

    private void ycx(dy dyVar) {
        com.bytedance.sdk.openadsdk.common.ycx.zb(new xkz.ycx(this.f24556jw, "BVA", thx(), tn()).ycx(c_()).ycx(dyVar).ycx(bhi()).ycx());
    }

    public void sya(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        if (yzp()) {
            return;
        }
        zb.lud ludVar = new zb.lud(8, zbVar);
        ludVar.f24620dj = zbVar.f25202yi;
        zb zbVar2 = this.f24561ul;
        if (zbVar2 != null) {
            zbVar2.zb(this, ludVar);
        }
    }

    public void ycx(boolean z11, boolean z12, boolean z13, int i5) {
        this.f24561ul.ycx(this, z11, z12, z13, i5);
    }

    public final void ycx(boolean z11, int i5, String str, int i11, String str2, int i12) {
        if (this.f24561ul.dy()) {
            return;
        }
        this.f24561ul.ycx(this, z11, i5, str, i11, str2, i12);
        ok.ycx(this.f24557lt, z11, i12);
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, int i5, int i11) {
        this.f24557lt = tnVar;
        this.f24555jc = i5;
        this.f24554ea = i11;
    }

    public void zb(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        if (zbVar == null) {
            return;
        }
        try {
            int iAeu = this.f24561ul.aeu();
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("click_countdown_remaining", Math.max(iAeu, 0));
            com.bytedance.sdk.openadsdk.dj.sya.lud(this.f24557lt, zbVar.lud, jSONObject);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "aO0omwY=", "VOAdmQKlaMWMT/RVjR+nLXXrNYE=", 597);
        }
        sya(zbVar);
    }
}
