package com.bytedance.sdk.openadsdk.common;

import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.widget.zb;

/* loaded from: classes2.dex */
public abstract class dy {

    /* renamed from: dj, reason: collision with root package name */
    protected String f24683dj;

    /* renamed from: lt, reason: collision with root package name */
    protected String f24684lt;
    protected String lud;
    protected String sya;

    /* renamed from: ul, reason: collision with root package name */
    protected final com.bytedance.sdk.openadsdk.component.reward.ycx.zb f24685ul;

    /* renamed from: zb, reason: collision with root package name */
    protected String f24686zb;

    public dy(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        this.f24685ul = zbVar;
        lud();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean fby() {
        if (!av.fby(this.f24685ul.f25203zb)) {
            return false;
        }
        this.f24685ul.f25189tn.jw();
        return true;
    }

    private boolean jw() {
        return !this.f24685ul.f25203zb.xym() && av.fby(this.f24685ul.f25203zb) && this.f24685ul.rmf.fby().getVisibility() == 0;
    }

    private boolean lt() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.f24685ul;
        return !zbVar.f25188sg && zbVar.f25180jw.get();
    }

    private void lud() {
        if (this.f24686zb != null) {
            return;
        }
        try {
            this.f24686zb = com.bytedance.sdk.component.utils.wwx.ycx(this.f24685ul.oby, "tt_reward_msg");
            this.sya = com.bytedance.sdk.component.utils.wwx.ycx(this.f24685ul.oby, "tt_msgPlayable");
            this.f24684lt = com.bytedance.sdk.component.utils.wwx.ycx(this.f24685ul.oby, "tt_negtiveBtnBtnText");
            this.f24683dj = com.bytedance.sdk.component.utils.wwx.ycx(this.f24685ul.oby, "tt_postiveBtnText");
            this.lud = com.bytedance.sdk.component.utils.wwx.ycx(this.f24685ul.oby, "tt_postiveBtnTextPlayable");
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "aes6lBG4Xc6Qbt5cgB6nAF7iPZAR", "UuAkgTG5esiVWNRYuBS4PA==", 50);
            com.bytedance.sdk.component.utils.htf.sya("RewardTipDialogHelper", "init res text failed：" + th2.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya(boolean z11) {
        this.f24685ul.thx.thx();
        if (z11) {
            this.f24685ul.f25189tn.ycx(1000);
        }
        this.f24685ul.wie.set(false);
    }

    private boolean ul() {
        return com.bytedance.sdk.openadsdk.core.pmi.dj().fby(String.valueOf(this.f24685ul.f25181lt));
    }

    private boolean zb(boolean z11, boolean z12, Runnable runnable) {
        if ((z11 || !lt() || !fby()) && runnable == null) {
            if (z12) {
                sya();
                return true;
            }
            dj();
        }
        return false;
    }

    public void dj() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.f24685ul;
        if (zbVar == null) {
            com.bytedance.sdk.component.utils.htf.sya("execSkipTaskBaseImpl adContext is null", new Object[0]);
            return;
        }
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar = zbVar.f25196uu;
        if (fbyVar == null || !(fbyVar instanceof com.bytedance.sdk.openadsdk.activity.single.lud)) {
            zbVar.thx.xz();
            ycx.ycx(this.f24685ul);
            ycx(this.f24685ul);
        } else {
            if (((com.bytedance.sdk.openadsdk.activity.single.lud) fbyVar).fby()) {
                return;
            }
            sya();
        }
    }

    public abstract void sya();

    public abstract void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar);

    public abstract void ycx(boolean z11);

    public abstract boolean ycx();

    public abstract boolean zb();

    public final boolean ycx(boolean z11, boolean z12, Runnable runnable) {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.f24685ul;
        if (zbVar.f25196uu instanceof com.bytedance.sdk.openadsdk.activity.single.lud) {
            if (!zbVar.f25173dj || zb() || (this.f24685ul.f25196uu.nji() != null && this.f24685ul.f25196uu.nji().dy())) {
                return false;
            }
            if (!z12 && ycx()) {
                return false;
            }
            if (!ul()) {
                if (!z12) {
                    return false;
                }
                if (runnable == null && z11) {
                    sya();
                    return true;
                }
            }
        } else {
            if (ycx(z12, runnable)) {
                return false;
            }
            if (!ul()) {
                return zb(z12, z11, runnable);
            }
            if (zb()) {
                zb(z11, runnable);
                return false;
            }
            if (jw()) {
                this.f24685ul.f25189tn.jw();
                return false;
            }
        }
        sya(z11, runnable);
        return true;
    }

    private void sya(final boolean z11, final Runnable runnable) {
        zb(z11);
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.f24685ul;
        if (zbVar != null && !zbVar.yzp.isFinishing() && !this.f24685ul.yzp.isDestroyed()) {
            final com.bytedance.sdk.openadsdk.core.widget.zb zbVar2 = new com.bytedance.sdk.openadsdk.core.widget.zb(this.f24685ul.yzp);
            com.bytedance.sdk.openadsdk.component.reward.zb.zb zbVar3 = this.f24685ul.f25195ur;
            if (zbVar3 == null) {
                com.bytedance.sdk.component.utils.htf.sya("RewardTipDialogHelper", "adContext or  adType == null");
                return;
            }
            zbVar3.f25217ok = zbVar2;
            if (z11) {
                zbVar2.ycx(this.sya).sya(this.lud).dj(this.f24684lt);
            } else {
                zbVar2.ycx(this.f24686zb).sya(this.f24683dj).dj(this.f24684lt);
            }
            com.bytedance.sdk.openadsdk.component.reward.view.jw jwVar = this.f24685ul.f25174dv;
            if (jwVar != null && jwVar.ycx() != null) {
                com.bytedance.sdk.openadsdk.core.widget.lud.ycx(zbVar2, this.f24685ul.f25174dv.ycx(), "reward_popup");
            }
            zbVar2.ycx(new zb.InterfaceC0090zb() { // from class: com.bytedance.sdk.openadsdk.common.dy.1
                @Override // com.bytedance.sdk.openadsdk.core.widget.zb.InterfaceC0090zb
                public void ycx() {
                    dy.this.sya(z11);
                    zbVar2.dismiss();
                }

                @Override // com.bytedance.sdk.openadsdk.core.widget.zb.InterfaceC0090zb
                public void zb() {
                    zbVar2.dismiss();
                    dy.this.ycx(true);
                    dy.this.f24685ul.wie.set(false);
                    dy.this.f24685ul.f25189tn.zb(LayoutNode.NotPlacedPlaceOrder);
                    Runnable runnable2 = runnable;
                    if (runnable2 != null) {
                        runnable2.run();
                        return;
                    }
                    if (!z11) {
                        dy.this.dj();
                        return;
                    }
                    dy dyVar = dy.this;
                    if (dyVar.f24685ul.f25188sg || !dyVar.fby()) {
                        dy.this.f24685ul.f25177hf.lt();
                        dy.this.sya();
                    }
                }
            }).show();
            return;
        }
        com.bytedance.sdk.component.utils.htf.sya("RewardTipDialogHelper", "adContext or activity is null");
    }

    private void zb(boolean z11, Runnable runnable) {
        if (!(lt() && fby()) && runnable == null) {
            if (z11) {
                sya();
            } else {
                dj();
            }
        }
    }

    private void zb(boolean z11) {
        this.f24685ul.thx.wwx();
        if (z11) {
            this.f24685ul.f25189tn.lt();
        }
        this.f24685ul.wie.set(true);
    }

    private boolean ycx(boolean z11, Runnable runnable) {
        if (z11 || !ycx()) {
            return false;
        }
        if (!this.f24685ul.f25188sg) {
            if (lt()) {
                return fby();
            }
            return false;
        }
        if (runnable != null) {
            return true;
        }
        dj();
        return true;
    }
}
