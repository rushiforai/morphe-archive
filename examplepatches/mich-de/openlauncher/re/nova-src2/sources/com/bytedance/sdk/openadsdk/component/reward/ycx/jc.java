package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.content.Context;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.activity.single.dj;
import com.bytedance.sdk.openadsdk.core.kgy;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.tru;
import com.bytedance.sdk.openadsdk.core.widget.uh;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc {

    /* renamed from: dy, reason: collision with root package name */
    protected boolean f25080dy;

    /* renamed from: ea, reason: collision with root package name */
    protected final String f25081ea;
    protected volatile boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    protected final tn f25082jc;

    /* renamed from: jw, reason: collision with root package name */
    protected final Activity f25083jw;

    /* renamed from: ok, reason: collision with root package name */
    protected final zb f25084ok;
    protected com.bytedance.sdk.openadsdk.wwx.ycx.ycx pmi;

    /* renamed from: ry, reason: collision with root package name */
    protected boolean f25085ry;
    private boolean sya;
    protected boolean syc;

    /* renamed from: uh, reason: collision with root package name */
    protected AtomicBoolean f25086uh = new AtomicBoolean(false);
    protected FrameLayout wie;
    protected boolean xkz;
    private com.bytedance.sdk.openadsdk.core.widget.uh ycx;

    /* renamed from: zb, reason: collision with root package name */
    private dj.lt f25087zb;

    public jc(zb zbVar) {
        this.f25084ok = zbVar;
        this.f25083jw = zbVar.yzp;
        this.f25081ea = zbVar.lud;
        tn tnVar = zbVar.f25203zb;
        this.f25082jc = tnVar;
        this.xkz = av.lud(tnVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj(boolean z11) {
        com.bytedance.sdk.openadsdk.activity.single.zb zbVarNji;
        zb zbVar = this.f25084ok;
        if (!zbVar.f25188sg) {
            if (this instanceof fby) {
                ycx(0L);
            } else {
                dj.lt ltVar = this.f25087zb;
                if (ltVar != null) {
                    ltVar.sya();
                }
            }
            this.sya = false;
            return;
        }
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
        if (fbyVar == null || (zbVarNji = fbyVar.nji()) == null) {
            return;
        }
        if (z11) {
            zbVarNji.av();
        }
        zbVarNji.ycx(1);
    }

    private void dy() {
        if (this.f25084ok.f25203zb.qlw()) {
            com.bytedance.sdk.openadsdk.core.widget.uh uhVar = new com.bytedance.sdk.openadsdk.core.widget.uh(this.f25084ok, new uh.ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.jc.1
                @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
                public int dj() {
                    jc jcVar = jc.this;
                    return jcVar.f25084ok.f25188sg ? jcVar.ok() : jcVar.fby();
                }

                @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
                public void lt() {
                    jc.this.dj(false);
                }

                @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
                public void lud() {
                    jc.this.wie();
                }

                @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
                public void sya() {
                    com.bytedance.sdk.openadsdk.activity.single.fby fbyVar;
                    com.bytedance.sdk.openadsdk.activity.single.zb zbVarNji;
                    kgy kgyVarUl = jc.this.pmi.ul();
                    if (kgyVarUl != null) {
                        kgyVarUl.ycx("popupDidShow", (JSONObject) null);
                    }
                    zb zbVar = jc.this.f25084ok;
                    if (!zbVar.f25188sg || (fbyVar = zbVar.f25196uu) == null || (zbVarNji = fbyVar.nji()) == null) {
                        return;
                    }
                    zbVarNji.rmf();
                }

                @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
                public void ycx() {
                    jc.this.f25084ok.dwi.ycx("skipToNextAd", (JSONObject) null);
                }

                @Override // com.bytedance.sdk.openadsdk.core.widget.uh.ycx
                public void zb() {
                    kgy kgyVarUl = jc.this.pmi.ul();
                    if (kgyVarUl != null) {
                        kgyVarUl.ycx("popupDidDismiss", (JSONObject) null);
                    }
                    jc.this.dj(true);
                }
            });
            this.ycx = uhVar;
            uhVar.ycx(this.f25084ok.ifb);
            kgy kgyVarUl = this.pmi.ul();
            if (kgyVarUl != null) {
                kgyVarUl.ycx(new tru() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.jc.2
                    @Override // com.bytedance.sdk.openadsdk.core.tru
                    public void o_() throws JSONException {
                        if (jc.this.ycx != null) {
                            jc.this.ycx.ycx(jc.this.f25084ok.yzp);
                        }
                    }

                    @Override // com.bytedance.sdk.openadsdk.core.tru
                    public void p_() {
                        if (jc.this.ycx != null) {
                            jc.this.ycx.p_();
                        }
                    }

                    @Override // com.bytedance.sdk.openadsdk.core.tru
                    public int q_() {
                        jc jcVar = jc.this;
                        return jcVar.f25084ok.f25188sg ? jcVar.ok() : jcVar.fby();
                    }

                    @Override // com.bytedance.sdk.openadsdk.core.tru
                    public void r_() {
                        jc.this.wie();
                    }

                    @Override // com.bytedance.sdk.openadsdk.core.tru
                    public void s_() {
                        jc.this.dj(false);
                    }

                    @Override // com.bytedance.sdk.openadsdk.core.tru
                    public void t_() {
                    }
                });
            }
        }
    }

    private void pmi() {
        int iGxx = this.f25082jc.gxx();
        if (iGxx == -1) {
            if (!av.ul(this.f25082jc)) {
                this.f25084ok.f25175dy.set(true);
                this.f25084ok.f25195ur.ry();
                return;
            }
            com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = this.pmi;
            if (ycxVar == null || !ycxVar.lud()) {
                this.f25084ok.f25195ur.thx();
                return;
            } else {
                this.f25084ok.f25175dy.set(true);
                this.f25084ok.f25195ur.ry();
                return;
            }
        }
        if (iGxx >= 0) {
            this.f25084ok.f25201xz.dj(false);
            if (!av.ul(this.f25082jc)) {
                dj.lt ltVar = new dj.lt(iGxx) { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.jc.6
                    @Override // com.bytedance.sdk.openadsdk.activity.single.dj.lt
                    public void ycx() {
                        jc.this.f25084ok.nji.sendEmptyMessage(600);
                    }
                };
                this.f25087zb = ltVar;
                ltVar.lud();
                return;
            }
            com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar2 = this.pmi;
            if (ycxVar2 == null || !ycxVar2.lud()) {
                dj.lt ltVar2 = new dj.lt(iGxx) { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.jc.5
                    @Override // com.bytedance.sdk.openadsdk.activity.single.dj.lt
                    public void ycx() {
                        jc.this.f25084ok.nji.sendEmptyMessage(1);
                    }
                };
                this.f25087zb = ltVar2;
                ltVar2.lud();
            } else {
                dj.lt ltVar3 = new dj.lt(iGxx) { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.jc.4
                    @Override // com.bytedance.sdk.openadsdk.activity.single.dj.lt
                    public void ycx() {
                        jc.this.f25084ok.nji.sendEmptyMessage(600);
                    }
                };
                this.f25087zb = ltVar3;
                ltVar3.lud();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void wie() {
        com.bytedance.sdk.openadsdk.activity.single.zb zbVarNji;
        zb zbVar = this.f25084ok;
        if (zbVar.f25188sg) {
            com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
            if (fbyVar == null || (zbVarNji = fbyVar.nji()) == null) {
                return;
            }
            zbVarNji.ycx(2);
            return;
        }
        if (this instanceof fby) {
            jw();
        } else {
            dj.lt ltVar = this.f25087zb;
            if (ltVar != null) {
                ltVar.zb();
            }
        }
        this.sya = true;
    }

    public boolean ea() {
        return !this.sya;
    }

    public int fby() {
        dj.lt ltVar = this.f25087zb;
        if (ltVar != null) {
            return (int) (ltVar.lt() / 1000);
        }
        return 0;
    }

    public boolean jc() {
        return false;
    }

    public void jw() {
        dj.lt ltVar = this.f25087zb;
        if (ltVar != null) {
            ltVar.zb();
        }
    }

    public void lt() {
        if (this.xkz && !this.f25080dy) {
            this.f25080dy = true;
            com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = this.pmi;
            if (ycxVar != null) {
                ycxVar.dj();
            }
            FrameLayout frameLayout = this.wie;
            if (frameLayout != null) {
                frameLayout.setVisibility(8);
            }
            com.bytedance.sdk.openadsdk.core.widget.uh uhVar = this.ycx;
            if (uhVar != null) {
                uhVar.fby();
                this.ycx = null;
            }
            dj.lt ltVar = this.f25087zb;
            if (ltVar != null) {
                ltVar.dj();
                this.f25087zb = null;
            }
        }
    }

    public void lud() throws JSONException {
        if (!this.xkz || this.f25086uh.get()) {
            return;
        }
        com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = this.pmi;
        if (ycxVar != null) {
            ycxVar.sya();
        }
        dj.lt ltVar = this.f25087zb;
        if (ltVar != null) {
            ltVar.zb();
        }
    }

    public int ok() {
        com.bytedance.sdk.openadsdk.activity.single.zb zbVarNji;
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = this.f25084ok.f25196uu;
        if (fbyVar == null || (zbVarNji = fbyVar.nji()) == null) {
            return 0;
        }
        return zbVarNji.aeu();
    }

    public boolean ry() {
        return this.fby;
    }

    public void sya() {
        if (this.xkz) {
            this.fby = true;
            sya(this.f25084ok.f25202yi);
            this.pmi.ycx();
            pmi();
            if (av.fby(this.f25082jc)) {
                this.f25084ok.rmf.lt();
            }
        }
    }

    public boolean syc() {
        com.bytedance.sdk.openadsdk.core.widget.uh uhVar = this.ycx;
        if (uhVar != null) {
            return uhVar.jw();
        }
        return false;
    }

    public int ul() {
        return 0;
    }

    public void xkz() {
        if (!this.f25086uh.compareAndSet(false, true)) {
            this.f25084ok.rmf.ul();
            return;
        }
        com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = this.pmi;
        if (ycxVar != null) {
            ycxVar.ycx(true);
        }
        this.f25084ok.rmf.ul(true);
        zb zbVar = this.f25084ok;
        zbVar.rmy.ycx(true, zbVar.f25195ur);
        if (this.f25084ok.rmy.lud()) {
            zb zbVar2 = this.f25084ok;
            com.bytedance.sdk.openadsdk.utils.xkz xkzVar = zbVar2.giw;
            if (xkzVar != null) {
                xkzVar.ycx(zbVar2, zbVar2.f25194ul);
                return;
            }
            return;
        }
        zb zbVar3 = this.f25084ok;
        zbVar3.rmf.ycx(zbVar3.f25202yi, true);
        this.f25084ok.rmf.sya(true);
        this.f25084ok.rmf.zb(true);
        this.f25084ok.nji.removeMessages(600);
    }

    public void ycx(int i5) {
    }

    public void zb(boolean z11) {
        if (this.xkz) {
            zb zbVar = this.f25084ok;
            if (zbVar.dc) {
                this.wie = (FrameLayout) zbVar.ifb.findViewById(com.bytedance.sdk.openadsdk.utils.wie.rdj);
                ycx(z11);
                dy();
            }
        }
    }

    public void ycx() {
        if (this.xkz && !this.f25085ry) {
            this.f25085ry = true;
        }
    }

    public com.bytedance.sdk.openadsdk.ry.ul zb() {
        return new com.bytedance.sdk.openadsdk.ry.ul() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.jc.3
            @Override // com.bytedance.sdk.openadsdk.ry.ul
            public void ycx() {
                jc.this.f25084ok.dwi.zb(false);
            }
        };
    }

    public void ycx(boolean z11) {
        FrameLayout frameLayout = this.wie;
        if (frameLayout != null) {
            zb zbVar = this.f25084ok;
            Context context = zbVar.oby;
            tn tnVar = this.f25082jc;
            int i5 = zbVar.bba;
            com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
            com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = new com.bytedance.sdk.openadsdk.wwx.ycx.ycx(context, tnVar, i5, z11, frameLayout, false, fbyVar != null ? fbyVar.oby() : 0);
            this.pmi = ycxVar;
            ycxVar.ycx(this.f25084ok.dwi);
            this.pmi.ycx(true, zb());
        }
    }

    public void sya(boolean z11) {
        if (this.xkz && this.pmi != null && this.fby) {
            this.pmi.ycx(z11);
        }
    }

    public void dj() throws JSONException {
        if (!this.xkz || this.f25086uh.get()) {
            return;
        }
        com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar = this.pmi;
        if (ycxVar != null) {
            ycxVar.zb();
        }
        if (this.f25087zb == null || !ea()) {
            return;
        }
        this.f25087zb.sya();
    }

    public void ycx(long j11) {
        dj.lt ltVar = this.f25087zb;
        if (ltVar != null) {
            ltVar.sya();
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.sya.lud ludVar) {
        com.bytedance.sdk.openadsdk.wwx.ycx.ycx ycxVar;
        if (this.xkz && (ycxVar = this.pmi) != null) {
            ycxVar.ycx(ludVar);
        }
    }
}
