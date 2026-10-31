package com.bytedance.sdk.openadsdk.component.reward.zb;

import android.app.Activity;
import android.content.Context;
import android.os.Message;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.c;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.activity.single.TTRewardVideoActivity;
import com.bytedance.sdk.openadsdk.activity.single.fby;
import com.bytedance.sdk.openadsdk.activity.single.zb;
import com.bytedance.sdk.openadsdk.component.reward.view.RFEndCardBackUpLayout;
import com.bytedance.sdk.openadsdk.component.reward.view.ea;
import com.bytedance.sdk.openadsdk.component.reward.view.jw;
import com.bytedance.sdk.openadsdk.component.reward.ycx.ry;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.core.widget.ok;
import com.bytedance.sdk.openadsdk.dj.jc;
import com.bytedance.sdk.openadsdk.dj.zb;
import com.bytedance.sdk.openadsdk.utils.DeviceUtils;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.wie;
import com.bytedance.sdk.openadsdk.utils.xkz;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import java.util.Objects;

/* loaded from: classes2.dex */
public abstract class zb extends ycx {

    /* renamed from: ea, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.core.sya.lud f25216ea;

    /* renamed from: ok, reason: collision with root package name */
    public com.bytedance.sdk.openadsdk.core.widget.zb f25217ok;

    /* renamed from: ry, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ry.ul f25218ry;

    public zb(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        super(zbVar);
    }

    private void dj(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        ry ryVar = zbVar.f25201xz;
        if (ryVar != null) {
            ryVar.dj();
        }
    }

    private void sya(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        ea eaVar = zbVar.kgy;
        if (eaVar != null && eaVar.jc() != null) {
            zbVar.kgy.jc().performClick();
            return;
        }
        ea eaVar2 = zbVar.kgy;
        if (eaVar2 == null || eaVar2.ea() == null) {
            return;
        }
        zbVar.kgy.ea().performClick();
    }

    public abstract boolean dj();

    public void dv() {
        sya();
        if (!this.ycx.f25203zb.wnd() && hf()) {
            oty();
        }
        if (hf()) {
            this.ycx.rmy.zb();
        }
        if (htf.dj(this.ycx.f25203zb) || htf.fby(this.ycx.f25203zb)) {
            this.f25211jc.sendEmptyMessageDelayed(500, 100L);
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
        zbVar.kgy.ycx(zbVar.f25183mp == 100.0f);
        wwx();
        lt();
    }

    public void dy() {
        int i5;
        if (this.ycx.f25180jw.get() && this.ycx.pmi.getAndSet(false) && ((i5 = this.ycx.f25194ul) >= 0 || i5 == -1)) {
            Message messageObtain = Message.obtain();
            messageObtain.what = Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE;
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
            messageObtain.arg1 = zbVar.f25194ul;
            zbVar.nji.sendMessage(messageObtain);
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
        if (zbVar2.fby <= 0 || !zbVar2.f25192uh.getAndSet(false)) {
            return;
        }
        Message messageObtain2 = Message.obtain();
        messageObtain2.what = 900;
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar3 = this.ycx;
        messageObtain2.arg1 = zbVar3.fby;
        zbVar3.nji.sendMessage(messageObtain2);
    }

    public void ea() {
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x010d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public View fby() {
        View viewCreatePAGLogoViewByMaterial;
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(this.ycx.yzp);
        syaVar.setId(wie.msc);
        View viewZb = com.bytedance.sdk.openadsdk.core.widget.ul.zb(this.ycx.yzp);
        viewZb.setId(520093708);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 8388661;
        layoutParams.topMargin = dc.zb(this.ycx.yzp, 20.0f);
        layoutParams.rightMargin = dc.zb(this.ycx.yzp, 16.0f);
        viewZb.setLayoutParams(layoutParams);
        viewZb.setContentDescription(wwx.ycx(this.ycx.yzp, "tt_ad_close_text"));
        viewZb.setVisibility(8);
        com.bytedance.sdk.openadsdk.core.lt.dj djVarYcx = com.bytedance.sdk.openadsdk.core.widget.ul.ycx(this.ycx.yzp, syaVar);
        djVarYcx.setId(wie.ixr);
        djVarYcx.setContentDescription(wwx.ycx(this.ycx.yzp, "tt_close_backup_button_text"));
        fby fbyVar = this.ycx.f25196uu;
        if (fbyVar == null || !fbyVar.nji().oty()) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
            viewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(zbVar.yzp, zbVar.f25203zb);
            viewCreatePAGLogoViewByMaterial.setId(520093757);
            FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-2, dc.zb(this.ycx.yzp, 14.0f));
            layoutParams2.gravity = 8388691;
            viewCreatePAGLogoViewByMaterial.setLayoutParams(layoutParams2);
        } else {
            viewCreatePAGLogoViewByMaterial = null;
        }
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(this.ycx.yzp);
        djVar.setId(wie.gxx);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(dc.zb(this.ycx.yzp, 32.0f), dc.zb(this.ycx.yzp, 14.0f));
        layoutParams3.gravity = 8388693;
        djVar.setLayoutParams(layoutParams3);
        djVar.setPadding(dc.zb(this.ycx.yzp, 9.0f), 0, dc.zb(this.ycx.yzp, 9.0f), 0);
        djVar.setScaleType(ImageView.ScaleType.FIT_CENTER);
        if (viewCreatePAGLogoViewByMaterial != null) {
            syaVar.addView(viewCreatePAGLogoViewByMaterial);
        }
        syaVar.addView(djVar);
        if (this.ycx.f25203zb.xym()) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
            if (!zbVar2.f25188sg || zbVar2.ycx != 1) {
                View syaVar2 = new com.bytedance.sdk.openadsdk.component.reward.top.sya(this.ycx.yzp);
                syaVar2.setId(wie.wnd);
                syaVar2.setLayoutParams(new FrameLayout.LayoutParams(-1, -2));
                syaVar.addView(syaVar2);
            }
        }
        syaVar.addView(viewZb);
        return syaVar;
    }

    public boolean hf() {
        return true;
    }

    public void htf() {
        if (!this.ycx.f25189tn.ea() && pmi.dj().wwx(String.valueOf(this.ycx.f25181lt)) == 1) {
            int iYcx = ycx(this.ycx);
            if (zb(this.ycx)) {
                sya(this.ycx);
            } else if (ycx(this.ycx, iYcx)) {
                dj(this.ycx);
            }
        }
    }

    public void jc() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
        zbVar.oty.ycx(zbVar, zbVar.f25173dj);
        this.ycx.kgy.zb();
        this.ycx.rmy.ycx();
        if (!this.ycx.f25203zb.wnd()) {
            this.ycx.rmf.ycx();
            this.ycx.aeu.ycx();
        }
        this.ycx.f25189tn.ul();
        this.ycx.f25201xz.ycx();
        if (av.lt(this.ycx.f25203zb)) {
            this.ycx.kgy.dj();
            dc.ycx((View) this.ycx.rmf.fby(), 4);
        }
        if (htf.dj(this.ycx.f25203zb) || htf.zb(this.ycx.f25203zb) || htf.fby(this.ycx.f25203zb)) {
            return;
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
        zbVar2.kgy.ycx(dc.zb(zbVar2.oby, zbVar2.f25191uf), dc.zb(this.ycx.oby, r2.duz));
        this.ycx.wwx.ycx();
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar3 = this.ycx;
        if (zbVar3.dqs) {
            zbVar3.kgy.zb(0);
        }
    }

    public View jw() {
        com.bytedance.sdk.openadsdk.core.lt.ul ulVar;
        if (this.f25215zb.zk() != 5) {
            ulVar = new com.bytedance.sdk.openadsdk.core.lt.ul(this.ycx.yzp);
            ulVar.setId(wie.f27222qu);
        } else {
            ulVar = null;
        }
        Objects.toString(ulVar);
        return ulVar;
    }

    public abstract void lt();

    public abstract boolean lud();

    public void ok() {
        com.bytedance.sdk.openadsdk.core.widget.zb zbVar = this.f25217ok;
        if (zbVar == null || !zbVar.isShowing()) {
            return;
        }
        this.f25217ok.dismiss();
    }

    public final void oty() {
        if (this.ycx.yzp.isFinishing()) {
            return;
        }
        this.ycx.rmf.jc();
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
        String str = zbVar.f25173dj ? "reward_endcard" : "fullscreen_endcard";
        zbVar.rmf.ycx(this.f25218ry, str, zbVar.dwi);
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
        if (zbVar2.f25190tx) {
            zbVar2.f25189tn.ycx(zbVar2.f25202yi);
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar3 = this.ycx;
        zbVar3.rmf.ycx(str, zbVar3.dwi);
        this.ycx.rmf.lud();
    }

    public void pmi() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
        if (zbVar == null) {
            return;
        }
        ea eaVar = zbVar.kgy;
        if (eaVar != null) {
            eaVar.wie();
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
        boolean z11 = zbVar2.f25202yi;
        zbVar2.f25171av.ycx();
        DeviceUtils.ul();
        this.ycx.rmf.syc();
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar3 = this.ycx;
        if (zbVar3.f25202yi) {
            zbVar3.yzp.runOnUiThread(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.zb.zb.1
                @Override // java.lang.Runnable
                public void run() {
                    if (zb.this.ycx.f25171av.ycx() > 0) {
                        zb.this.ycx.f25171av.ycx(false);
                    }
                }
            });
        }
    }

    public void ry() {
        if (this.ycx.ul()) {
            this.ycx.f25201xz.lud();
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
            boolean z11 = false;
            if (!zbVar.f25188sg || !(zbVar.f25196uu instanceof com.bytedance.sdk.openadsdk.activity.single.ycx)) {
                zbVar.kgy.ul(0);
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.pmi pmiVar = this.ycx.rmf;
            boolean z12 = pmiVar != null && pmiVar.htf();
            if (av.lt(this.ycx.f25203zb) && !z12) {
                z11 = true;
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
            if (zbVar2.giw != null) {
                if (zbVar2.xkz.get() || z11) {
                    this.ycx.giw.dj();
                    com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar3 = this.ycx;
                    zbVar3.giw.ycx(zbVar3, zbVar3.f25194ul);
                }
            }
        }
    }

    public void syc() {
        if (this.ycx.f25196uu != null || ((!av.zb(this.f25215zb) && !av.sya(this.f25215zb)) || (av.fby(this.f25215zb) && this.ycx.rmf.bhi() && !this.ycx.rmf.aeu()))) {
            dy();
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
        if (zbVar == null) {
            return;
        }
        if (zbVar.giw != null && !zbVar.f25179jc.get()) {
            this.ycx.giw.ycx();
        }
        this.ycx.dj();
    }

    public void thx() {
        this.ycx.f25201xz.sya();
        this.ycx.f25201xz.lud(true);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void tn() {
        if (!lud() && (this instanceof ul)) {
            this.ycx.f25177hf.zb();
            return;
        }
        if (!this.f25212jw.ycx(this.lud.syc(), false)) {
            this.ycx.thx.ea();
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
            if (zbVar.f25188sg) {
                fby fbyVar = zbVar.f25196uu;
                if (fbyVar instanceof com.bytedance.sdk.openadsdk.activity.single.ycx) {
                    ((com.bytedance.sdk.openadsdk.activity.single.ycx) fbyVar).tn();
                } else {
                    ycx(zb.C0100zb.ycx);
                    com.bytedance.sdk.openadsdk.component.reward.ycx.wie wieVar = this.lud;
                    wieVar.ycx(!wieVar.yzp() ? 1 : 0, 4);
                }
            }
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
        tn tnVar = zbVar2.f25203zb;
        if (tnVar == null || zbVar2.giw == null || !tnVar.uhs()) {
            return;
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar3 = this.ycx;
        zbVar3.giw.ycx(zbVar3, zbVar3.thx.tru());
    }

    public void uh() {
        zb(false);
    }

    public RFEndCardBackUpLayout ul() {
        return new RFEndCardBackUpLayout(this.ycx.oby);
    }

    public void wie() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
        if (zbVar == null) {
            return;
        }
        try {
            ea eaVar = zbVar.kgy;
            if (eaVar != null) {
                eaVar.pmi();
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
            zbVar2.xym = false;
            boolean z11 = zbVar2.f25202yi;
            if (!zbVar2.f25179jc.get()) {
                this.ycx.thx.dy();
            }
            xkz();
            this.ycx.rmf.dy();
            this.ycx.f25189tn.fby();
            this.ycx.f25192uh.set(true);
            if (this.ycx.f25180jw.get()) {
                this.ycx.pmi.set(true);
            }
            xkz xkzVar = this.ycx.giw;
            if (xkzVar != null) {
                xkzVar.zb();
            }
            this.ycx.lud();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCBbk4Xg==", "aes6lBG4T9KMRvZZuAiwLQ==", "VOAdlBavbA==", 363);
        }
    }

    public void wwx() {
        this.f25216ea = this.ycx.f25177hf.sya();
    }

    public void xkz() {
        tru truVar = this.f25211jc;
        if (truVar != null) {
            truVar.removeMessages(300);
        }
    }

    public abstract void ycx(FrameLayout frameLayout);

    @Override // com.bytedance.sdk.openadsdk.component.reward.zb.ycx
    public void ycx(com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar, tru truVar) {
        super.ycx(zbVar, truVar);
        if (this.ycx.f25203zb.lt()) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
            if (zbVar2.f25199wr) {
                zbVar2.rmf.ycx(false);
            }
        }
    }

    public void zb(boolean z11) {
        try {
            jw jwVar = this.ycx.f25174dv;
            if (jwVar != null && !z11) {
                jwVar.lt();
            }
            ea eaVar = this.ycx.kgy;
            if (eaVar != null) {
                eaVar.syc();
            }
            this.ycx.thx.kgy();
            if (!dj()) {
                this.ycx.f25180jw.get();
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.pmi pmiVar = this.ycx.rmf;
            if (pmiVar != null) {
                pmiVar.ea();
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.jw jwVar2 = this.ycx.f25189tn;
            if (jwVar2 != null) {
                jwVar2.sya(com.bytedance.sdk.openadsdk.component.reward.ycx.jw.ycx);
            }
            ea eaVar2 = this.ycx.kgy;
            if (eaVar2 != null) {
                eaVar2.ry();
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.lt ltVar = this.ycx.rmy;
            if (ltVar != null) {
                ltVar.sya();
            }
            xkz xkzVar = this.ycx.giw;
            if (xkzVar != null) {
                xkzVar.sya();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCBbk4Xg==", "aes6lBG4T9KMRvZZuAiwLQ==", "VOAJkBCoe8iZ", 429);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.view.fby fbyVar) {
        ycx(fbyVar, this.ycx);
    }

    public void ycx(boolean z11, boolean z12, boolean z13, int i5) {
        this.ycx.rmy.ycx(z11, z12, z13, this, i5);
    }

    private int ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        if (av.sya(zbVar.f25203zb)) {
            return zbVar.f25203zb.om();
        }
        if (zbVar.f25173dj) {
            return zbVar.f25203zb.jxj();
        }
        return zbVar.f25203zb.jvd();
    }

    private boolean ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, int i5) {
        if (i5 == -1) {
            return false;
        }
        boolean z11 = !zbVar.f25180jw.get() || av.sya(zbVar.f25203zb);
        com.bytedance.sdk.openadsdk.component.reward.ycx.wie wieVar = zbVar.thx;
        boolean z12 = wieVar != null && wieVar.xkz() >= ((long) i5) * 1000;
        com.bytedance.sdk.openadsdk.component.reward.ycx.jw jwVar = zbVar.f25189tn;
        return z11 && (z12 || (jwVar != null && jwVar.dj()));
    }

    public void ycx(int i5) {
        this.lud.htf();
        ycx(false, true, false, i5);
        if (this.ycx.f25173dj) {
            this.f25212jw.zb(10000);
        }
    }

    private boolean zb(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        ea eaVar = zbVar.kgy;
        return eaVar != null && eaVar.jw();
    }

    /* JADX WARN: Removed duplicated region for block: B:94:0x020d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(Message message) {
        htf htfVar;
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        int i5 = message.what;
        if (i5 == 1) {
            thx();
            return;
        }
        if (i5 == 300) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
            if (zbVar.f25188sg) {
                fby fbyVar = zbVar.f25196uu;
                if (fbyVar instanceof com.bytedance.sdk.openadsdk.activity.single.ycx) {
                    ((com.bytedance.sdk.openadsdk.activity.single.ycx) fbyVar).tn();
                } else {
                    ycx(zb.C0100zb.f26771zb);
                    com.bytedance.sdk.openadsdk.component.reward.ycx.wie wieVar = this.ycx.thx;
                    wieVar.ycx(!wieVar.yzp() ? 1 : 0, 1 ^ (this.ycx.thx.yzp() ? 1 : 0));
                }
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
            jc.ycx(zbVar2.f25203zb, "play_video_time_out", zbVar2.lud, (String) null);
            com.bytedance.sdk.openadsdk.core.model.dj djVarQye = this.ycx.f25203zb.qye();
            if (djVarQye != null && (djVarYcx = djVarQye.ycx()) != null) {
                djVarYcx.ycx(com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.GENERAL_LINEAR_AD_ERROR);
            }
            ea eaVar = this.ycx.kgy;
            if (eaVar == null || (htfVar = eaVar.f24996dy) == null) {
                return;
            }
            htfVar.ea();
            return;
        }
        if (i5 == 400) {
            this.ycx.thx.htf();
            ycx(false, true, false, 3);
            return;
        }
        if (i5 == 500) {
            if (!av.lud(this.ycx.f25203zb)) {
                this.ycx.f25201xz.sya(false);
            }
            com.bytedance.sdk.component.jw.fby fbyVarFby = this.ycx.rmf.fby();
            if (fbyVarFby != null && fbyVarFby.getWebView() != null) {
                fbyVarFby.ry();
                fbyVarFby.getWebView().resumeTimers();
            }
            if (this.ycx.rmf.fby() != null) {
                this.ycx.rmf.ycx(1.0f);
                this.ycx.kgy.ycx(1.0f);
            }
            if (!this.ycx.f25203zb.um() && this.ycx.thx.lt() && this.ycx.syc.get()) {
                this.ycx.thx.htf();
                return;
            }
            return;
        }
        if (i5 == 600) {
            ry();
            return;
        }
        if (i5 == 700) {
            int i11 = message.arg1;
            if (this.ycx.pmi.get()) {
                return;
            }
            if (i11 > 0) {
                this.ycx.f25201xz.zb();
                this.ycx.f25201xz.ycx((CharSequence) ((i11 / 1000) + "s"));
                this.ycx.f25201xz.lud(false);
                Message messageObtain = Message.obtain();
                messageObtain.what = Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE;
                messageObtain.arg1 = i11 - 1000;
                com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar3 = this.ycx;
                zbVar3.f25194ul -= 1000;
                this.f25211jc.sendMessageDelayed(messageObtain, 1000L);
                return;
            }
            this.f25211jc.removeMessages(Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE);
            if (av.ul(this.f25215zb)) {
                if (!this.ycx.f25189tn.zb() && this.ycx.rmf.ry()) {
                    thx();
                    return;
                } else {
                    ry();
                    return;
                }
            }
            ry();
            return;
        }
        if (i5 != 800) {
            if (i5 == 900 && !this.ycx.f25192uh.get()) {
                int i12 = message.arg1;
                double dDwi = this.ycx.thx.dwi();
                ycx(i12, (long) (1000.0d * dDwi));
                if (i12 > 0) {
                    this.ycx.f25201xz.zb();
                    this.ycx.f25201xz.ycx((CharSequence) ((i12 / 1000) + "s"));
                    this.ycx.f25201xz.lud(false);
                    Message messageObtain2 = Message.obtain();
                    messageObtain2.what = 900;
                    int i13 = i12 - 1000;
                    messageObtain2.arg1 = i13;
                    this.ycx.fby = i13;
                    this.f25211jc.sendMessageDelayed(messageObtain2, 1000L);
                    com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar4 = this.ycx;
                    if (zbVar4.f25188sg) {
                        fby fbyVar2 = zbVar4.f25196uu;
                        if (!(fbyVar2 instanceof com.bytedance.sdk.openadsdk.activity.single.ycx) || dDwi <= 0.0d) {
                            return;
                        }
                        ((com.bytedance.sdk.openadsdk.activity.single.ycx) fbyVar2).ycx((float) (1.0d - ((i12 / 1000.0f) / dDwi)));
                        return;
                    }
                    return;
                }
                this.f25211jc.removeMessages(900);
                ry();
                com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar5 = this.ycx;
                fby fbyVar3 = zbVar5.f25196uu;
                if (zbVar5.f25188sg && (fbyVar3 instanceof com.bytedance.sdk.openadsdk.activity.single.ycx)) {
                    fbyVar3.nji().ycx(fbyVar3, new zb.lud(5, this.ycx));
                    return;
                }
                return;
            }
            return;
        }
        if (!av.zb(this.ycx.f25203zb)) {
            this.ycx.f25201xz.sya(false);
        }
        this.ycx.kgy.ycx(1.0f);
        if (!this.ycx.f25203zb.um() && this.ycx.thx.lt() && this.ycx.syc.get()) {
            this.ycx.thx.htf();
        }
    }

    private void ycx(long j11, long j12) {
        long j13 = j12 - j11;
        Activity activity = this.ycx.yzp;
        if (activity instanceof TTRewardVideoActivity) {
            ((TTRewardVideoActivity) activity).sya(j13, j12);
        }
    }

    public static void ycx(FrameLayout frameLayout, final com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        final com.bytedance.sdk.openadsdk.core.lt.dj djVar;
        Context context = frameLayout.getContext();
        if (zbVar.f25199wr) {
            com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
            syaVar.setId(wie.f27215ok);
            frameLayout.addView(syaVar, new FrameLayout.LayoutParams(-1, -1));
            FrameLayout frameLayoutYcx = ycx(context);
            boolean zLud = tn.lud(zbVar.f25203zb);
            String strYcx = b.f42142b;
            if (zLud) {
                c cVarCi = zbVar.f25203zb.ci();
                if (cVarCi != null) {
                    strYcx = cVarCi.f22188f;
                }
            } else {
                List<com.bytedance.sdk.openadsdk.core.model.pmi> listCu = zbVar.f25203zb.cu();
                if (listCu != null && !listCu.isEmpty()) {
                    strYcx = listCu.get(0).ycx();
                }
            }
            if (TextUtils.isEmpty(strYcx)) {
                djVar = null;
            } else {
                djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
                int i5 = wie.f27200hh;
                djVar.setId(i5);
                djVar.setTag(i5, strYcx);
                djVar.setScaleType(ImageView.ScaleType.CENTER_CROP);
                frameLayoutYcx.addView(djVar);
            }
            syaVar.addView(frameLayoutYcx);
            syaVar.addView(new ok(context), new FrameLayout.LayoutParams(-1, -1));
            View djVar2 = new com.bytedance.sdk.openadsdk.component.reward.view.dj(context);
            djVar2.setId(wie.xkz);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
            layoutParams.gravity = 80;
            frameLayout.addView(djVar2, layoutParams);
            djVar2.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.zb.zb.2
                @Override // android.view.View.OnLayoutChangeListener
                public void onLayoutChange(View view, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18) {
                    int height = view.getHeight();
                    if (height <= 0) {
                        return;
                    }
                    View viewFindViewById = zbVar.ifb.findViewById(520093757);
                    if (viewFindViewById != null) {
                        ViewGroup.LayoutParams layoutParams2 = viewFindViewById.getLayoutParams();
                        if (layoutParams2 instanceof FrameLayout.LayoutParams) {
                            ((FrameLayout.LayoutParams) layoutParams2).bottomMargin = height;
                        }
                    }
                    View viewFindViewById2 = zbVar.ifb.findViewById(wie.gxx);
                    if (viewFindViewById2 != null) {
                        ViewGroup.LayoutParams layoutParams3 = viewFindViewById2.getLayoutParams();
                        if (layoutParams3 instanceof FrameLayout.LayoutParams) {
                            ((FrameLayout.LayoutParams) layoutParams3).bottomMargin = height;
                        }
                    }
                    View viewFindViewById3 = zbVar.ifb.findViewById(wie.ulm);
                    if (viewFindViewById3 != null) {
                        ViewGroup.LayoutParams layoutParams4 = viewFindViewById3.getLayoutParams();
                        if (layoutParams4 instanceof FrameLayout.LayoutParams) {
                            ((FrameLayout.LayoutParams) layoutParams4).bottomMargin = height;
                        }
                    }
                    com.bytedance.sdk.openadsdk.core.lt.dj djVar3 = djVar;
                    if (djVar3 != null) {
                        ViewGroup.LayoutParams layoutParams5 = djVar3.getLayoutParams();
                        if (layoutParams5 instanceof ViewGroup.MarginLayoutParams) {
                            ((ViewGroup.MarginLayoutParams) layoutParams5).bottomMargin = height;
                            djVar.setLayoutParams(layoutParams5);
                        }
                    }
                }
            });
            com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
            ludVar.setId(wie.syc);
            ludVar.setOrientation(1);
            ludVar.setVisibility(8);
            frameLayout.addView(ludVar, new FrameLayout.LayoutParams(-1, -1));
        }
        if (zbVar.dc) {
            View fbyVar = new com.bytedance.sdk.component.jw.fby(context, true, fby.sya.ENDCARD);
            fbyVar.setId(wie.f27194dy);
            fbyVar.setLayerType(2, null);
            fbyVar.setVisibility(4);
            boolean zUl = htf.ul(zbVar.f25203zb);
            boolean zRy = htf.ry(zbVar.f25203zb);
            if (!zbVar.nzi && (zUl || zRy)) {
                FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-1, -1);
                layoutParams2.topMargin = dc.zb(zbVar.oby, 58.0f);
                frameLayout.addView(fbyVar, layoutParams2);
            } else {
                frameLayout.addView(fbyVar, new FrameLayout.LayoutParams(-1, -1));
            }
            View frameLayout2 = new FrameLayout(context);
            frameLayout2.setId(wie.wie);
            frameLayout2.setVisibility(4);
            frameLayout.addView(frameLayout2, new FrameLayout.LayoutParams(-1, -1));
            if (av.zb(zbVar.f25203zb)) {
                View syaVar2 = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
                syaVar2.setId(wie.rdj);
                syaVar2.setVisibility(4);
                frameLayout.addView(syaVar2, new FrameLayout.LayoutParams(-1, -1));
            }
        }
    }

    public static FrameLayout ycx(Context context) {
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
        syaVar.setId(wie.f27227ry);
        syaVar.setBackgroundColor(-16777216);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        syaVar.setLayoutParams(layoutParams);
        return syaVar;
    }
}
