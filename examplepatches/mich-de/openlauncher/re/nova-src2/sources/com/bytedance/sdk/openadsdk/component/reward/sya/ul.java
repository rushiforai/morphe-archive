package com.bytedance.sdk.openadsdk.component.reward.sya;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.component.utils.zb;
import com.bytedance.sdk.openadsdk.activity.TTRewardWebActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTRewardExpressVideoActivity;
import com.bytedance.sdk.openadsdk.component.reward.ok;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.model.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dj.jc;
import com.bytedance.sdk.openadsdk.oem.IPBroadcastReceiver;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class ul extends zb implements lt {
    private static com.bytedance.sdk.openadsdk.ycx.lud.ycx htf;
    public com.bytedance.sdk.openadsdk.component.reward.sya.zb.lt pmi;
    private long thx;

    /* renamed from: tn, reason: collision with root package name */
    private String f24901tn;

    /* renamed from: uh, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ycx.lud.ycx f24902uh;
    private String wwx;

    public ul(Activity activity, Context context, tn tnVar, String str, ViewGroup viewGroup, String str2, boolean z11) {
        super(activity, context, tnVar, str, viewGroup, str2, z11);
        this.thx = System.currentTimeMillis();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void uh() {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj;
        tn tnVar = this.lud;
        if (tnVar == null || (ycxVarDj = tnVar.dj()) == null || !ycxVarDj.lt()) {
            return;
        }
        final tn tnVarUl = ycxVarDj.ul();
        List<tn> listLud = ycxVarDj.lud();
        if (listLud != null) {
            Iterator<tn> it = listLud.iterator();
            while (it.hasNext()) {
                IPBroadcastReceiver.zb(this.f24941ry, it.next());
            }
        }
        tnVarUl.htf(1);
        Context contextYcx = this.f24932dj;
        if (contextYcx == null) {
            contextYcx = this.f24941ry;
        }
        if (contextYcx == null) {
            contextYcx = pmi.ycx();
        }
        Intent intent = new Intent(contextYcx, (Class<?>) TTRewardExpressVideoActivity.class);
        if (htf.lud(this.lud)) {
            this.lud.ycx(7, 8);
            if (this.lud.ci() != null) {
                this.lud.ci().f22190h = b.f42142b;
            }
            intent.putExtra("extra_conversion_link", 5);
        }
        com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(intent, this.f24932dj, this.sya, ycxVarDj, this.ycx);
        intent.putExtra("media_extra", this.wwx);
        intent.putExtra("user_id", this.f24901tn);
        intent.putExtra("start_show_time", SystemClock.elapsedRealtime());
        intent.putExtra("enable_new_arch", this.f24934dy);
        if (this.f24934dy) {
            av.ycx().ycx(this.ycx, (String) this.f24902uh);
        } else {
            av.ycx().ycx(this.f24902uh);
        }
        this.f24902uh = null;
        intent.putExtra("back_up", true);
        if (com.bytedance.sdk.openadsdk.dv.lud.ycx("start_activity_async", 0) == 1) {
            com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.ul.2
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVar = new com.bytedance.sdk.openadsdk.pmi.zb.ycx();
                    ycxVar.zb("start_activity");
                    ycxVar.dj("rewarded_video");
                    return ycxVar;
                }
            });
        }
        com.bytedance.sdk.component.utils.zb.ycx(contextYcx, intent, new zb.InterfaceC0044zb() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.ul.3
            @Override // com.bytedance.sdk.component.utils.zb.InterfaceC0044zb
            public void ycx() {
            }

            @Override // com.bytedance.sdk.component.utils.zb.InterfaceC0044zb
            public void ycx(Throwable th2) {
                jc.ycx(tnVarUl, "show_ad_fail", ul.this.f24939lt, "activity_start_fail");
            }
        }, true);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void dy() {
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24902uh;
        if (ycxVar != null) {
            ycxVar.zb();
        } else {
            jc.ycx(this.lud, n.f39150d, 0);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void fby() {
        super.fby();
        if (this.xkz.get()) {
            wie();
        }
        ycx(this.f24932dj.isFinishing(), this.f24932dj.isChangingConfigurations());
        if (this.f24934dy) {
            return;
        }
        this.f24902uh = null;
    }

    public void finalize() throws Throwable {
        super.finalize();
        if (this.f24934dy) {
            return;
        }
        htf = null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void lt() {
        super.lt();
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void lud() {
        this.f24944ul.ycx((lt) this);
        super.lud();
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void ok() {
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24902uh;
        if (ycxVar != null) {
            ycxVar.ycx();
        } else {
            jc.ycx(this.lud, "show", 0);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb, com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onRenderFail(View view, String str, int i5) {
        super.onRenderFail(view, str, i5);
        syc.sya().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.ul.1
            @Override // java.lang.Runnable
            public void run() {
                com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar = ul.this.f24937jc;
                if (ycxVar != null) {
                    ycxVar.lud();
                }
                ul.this.uh();
                Activity activity = ul.this.f24932dj;
                if (activity == null || activity.isFinishing()) {
                    return;
                }
                Activity activity2 = ul.this.f24932dj;
                if (activity2 instanceof TTRewardWebActivity) {
                    ((TTRewardWebActivity) activity2).zb();
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void ry() {
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24902uh;
        if (ycxVar != null) {
            ycxVar.onAdClicked();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void sya() {
        super.sya();
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void xkz() {
        super.xkz();
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.lt ltVar = this.pmi;
        if (ltVar != null) {
            ltVar.ycx(this.syc, (int) (System.currentTimeMillis() - this.syc), this.lud, 14);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void zb(Bundle bundle) {
        if (!this.f24934dy) {
            htf = this.f24902uh;
        }
        super.zb(bundle);
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.lt ltVar = this.pmi;
        if (ltVar != null) {
            ltVar.ycx();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void sya(Bundle bundle) {
        super.sya(bundle);
        if (this.f24934dy) {
            this.f24902uh = (com.bytedance.sdk.openadsdk.ycx.lud.ycx) av.ycx().ycx(this.ycx, com.bytedance.sdk.openadsdk.ycx.lud.ycx.class);
            return;
        }
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVarZb = av.ycx().zb();
        this.f24902uh = ycxVarZb;
        if (ycxVarZb != null || bundle == null) {
            return;
        }
        this.f24902uh = htf;
        htf = null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void ycx(Bundle bundle) {
        super.ycx(bundle);
        Intent intent = this.f24932dj.getIntent();
        if (intent != null) {
            this.wwx = intent.getStringExtra("media_extra");
            this.f24901tn = intent.getStringExtra("user_id");
        }
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.lt ltVar = new com.bytedance.sdk.openadsdk.component.reward.sya.zb.lt(this.lud, this.f24932dj, this.f24901tn, this.wwx);
        this.pmi = ltVar;
        ltVar.ycx(this);
        if (bundle != null) {
            this.pmi.zb();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.lt
    public void zb(boolean z11, int i5, String str, int i11, String str2, int i12, tn tnVar) {
        sya(z11, i5, str, i11, str2, i12, tnVar);
    }

    private void sya(final boolean z11, final int i5, final String str, final int i11, final String str2, final int i12, final tn tnVar) {
        com.bytedance.sdk.component.utils.htf.ycx("UnifyRewardBundle", "invoke callback onRewardVerify: " + z11 + ", " + i5 + ", " + str + ", " + i11 + ", " + str2 + "; " + this);
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.ul.4
            @Override // java.lang.Runnable
            public void run() {
                ul.this.ycx(z11, i5, str, i11, str2, i12, tnVar);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void ycx(boolean z11, int i5, String str, int i11, String str2, int i12, tn tnVar) {
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVar = this.f24902uh;
        if (ycxVar != null) {
            ycxVar.ycx(z11, i5, str, i11, str2);
            ok.ycx(this.lud, z11, i12);
        }
    }

    public void ycx(boolean z11, boolean z12) {
        if (!this.f24934dy || TextUtils.isEmpty(this.ycx)) {
            return;
        }
        av.ycx().ycx(this.ycx, z11, z12);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.lt
    public void ycx(long j11, int i5, tn tnVar) {
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.lt ltVar = this.pmi;
        if (ltVar != null) {
            ltVar.ycx(j11, i5, tnVar, 13);
        }
    }
}
