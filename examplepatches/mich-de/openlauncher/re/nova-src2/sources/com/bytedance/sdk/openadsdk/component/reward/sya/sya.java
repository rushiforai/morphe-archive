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
import com.bytedance.sdk.openadsdk.activity.TTFullWebActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTFullScreenExpressVideoActivity;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.model.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dj.jc;
import com.bytedance.sdk.openadsdk.oem.IPBroadcastReceiver;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya extends zb {

    /* renamed from: uh, reason: collision with root package name */
    private static com.bytedance.sdk.openadsdk.ycx.sya.zb f24898uh;
    private long htf;
    private com.bytedance.sdk.openadsdk.ycx.sya.zb pmi;

    public sya(Activity activity, Context context, tn tnVar, String str, ViewGroup viewGroup, String str2, boolean z11) {
        super(activity, context, tnVar, str, viewGroup, str2, z11);
        this.htf = System.currentTimeMillis();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void uh() {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj;
        tn tnVar = this.lud;
        if (tnVar == null || (ycxVarDj = tnVar.dj()) == null) {
            return;
        }
        List<tn> listLud = ycxVarDj.lud();
        if (listLud != null) {
            Iterator<tn> it = listLud.iterator();
            while (it.hasNext()) {
                IPBroadcastReceiver.zb(this.f24941ry, it.next());
            }
        }
        tn tnVar2 = this.lud;
        if (tnVar2 == null || (tnVar2.ci() == null && this.lud.cu() == null)) {
            jc.ycx(this.lud, "show_ad_fail", this.f24939lt, "video_or_image_empty");
            return;
        }
        this.lud.htf(1);
        jc.ycx(this.lud, "show_start", this.f24939lt, (String) null);
        Context contextYcx = this.f24932dj;
        if (contextYcx == null) {
            contextYcx = this.f24941ry;
        }
        if (contextYcx == null) {
            contextYcx = pmi.ycx();
        }
        Intent intent = new Intent(contextYcx, (Class<?>) TTFullScreenExpressVideoActivity.class);
        if (htf.lud(this.lud)) {
            this.lud.ycx(7, 8);
            if (this.lud.ci() != null) {
                this.lud.ci().f22190h = b.f42142b;
            }
            intent.putExtra("extra_conversion_link", 5);
        }
        intent.putExtra("start_show_time", SystemClock.elapsedRealtime());
        intent.putExtra("enable_new_arch", this.f24934dy);
        com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(intent, this.f24932dj, this.sya, ycxVarDj, this.ycx);
        if (this.f24934dy) {
            av.ycx().ycx(this.ycx, (String) this.pmi);
        } else {
            av.ycx().ycx(this.pmi);
        }
        this.pmi = null;
        intent.putExtra("back_up", true);
        final boolean z11 = com.bytedance.sdk.openadsdk.dv.lud.ycx("start_activity_async", 0) == 1;
        if (z11) {
            com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.sya.2
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVar = new com.bytedance.sdk.openadsdk.pmi.zb.ycx();
                    ycxVar.zb("start_activity");
                    ycxVar.dj("fullscreen_interstitial_ad");
                    return ycxVar;
                }
            });
        }
        final long jElapsedRealtime = SystemClock.elapsedRealtime();
        com.bytedance.sdk.component.utils.zb.ycx(contextYcx, intent, new zb.InterfaceC0044zb() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.sya.3
            @Override // com.bytedance.sdk.component.utils.zb.InterfaceC0044zb
            public void ycx() {
                if (z11) {
                    com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.sya.3.1
                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                            com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVar = new com.bytedance.sdk.openadsdk.pmi.zb.ycx();
                            ycxVar.zb("start_activity");
                            ycxVar.dj("fullscreen_interstitial_ad");
                            return ycxVar;
                        }
                    });
                    final long jElapsedRealtime2 = SystemClock.elapsedRealtime() - jElapsedRealtime;
                    com.bytedance.sdk.openadsdk.dy.dj.ycx("start_activity_action", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.sya.3.2
                        @Override // com.bytedance.sdk.openadsdk.dy.zb
                        public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                            JSONObject jSONObject = new JSONObject();
                            jSONObject.put("duration", jElapsedRealtime2);
                            return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("start_activity_action").zb(jSONObject.toString());
                        }
                    });
                }
            }

            @Override // com.bytedance.sdk.component.utils.zb.InterfaceC0044zb
            public void ycx(Throwable th2) {
                sya syaVar = sya.this;
                jc.ycx(syaVar.lud, "show_ad_fail", syaVar.f24939lt, "activity_start_fail");
                if (z11) {
                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.sya.3.3
                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                            com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVar = new com.bytedance.sdk.openadsdk.pmi.zb.ycx();
                            ycxVar.zb("start_activity");
                            ycxVar.dj("fullscreen_interstitial_ad");
                            return ycxVar;
                        }
                    });
                }
            }
        }, true);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void dy() {
        toString();
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar = this.pmi;
        if (zbVar != null) {
            zbVar.zb();
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
        this.pmi = null;
    }

    public void finalize() throws Throwable {
        super.finalize();
        if (this.f24934dy) {
            return;
        }
        f24898uh = null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void ok() {
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar = this.pmi;
        if (zbVar != null) {
            zbVar.ycx();
        } else {
            jc.ycx(this.lud, "show", 0);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb, com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onRenderFail(View view, String str, int i5) {
        super.onRenderFail(view, str, i5);
        syc.sya().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.sya.1
            @Override // java.lang.Runnable
            public void run() {
                com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar = sya.this.f24937jc;
                if (ycxVar != null) {
                    ycxVar.lud();
                }
                sya.this.uh();
                Activity activity = sya.this.f24932dj;
                if (activity == null || activity.isFinishing()) {
                    return;
                }
                Activity activity2 = sya.this.f24932dj;
                if (activity2 instanceof TTFullWebActivity) {
                    ((TTFullWebActivity) activity2).zb();
                }
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void ry() {
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVar = this.pmi;
        if (zbVar != null) {
            zbVar.onAdClicked();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void sya(Bundle bundle) {
        super.sya(bundle);
        if (this.f24934dy) {
            this.pmi = (com.bytedance.sdk.openadsdk.ycx.sya.zb) av.ycx().ycx(this.ycx, com.bytedance.sdk.openadsdk.ycx.sya.zb.class);
            return;
        }
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVarSya = av.ycx().sya();
        this.pmi = zbVarSya;
        if (zbVarSya != null || bundle == null) {
            return;
        }
        this.pmi = f24898uh;
        f24898uh = null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void ycx(boolean z11, int i5, String str, int i11, String str2, int i12, tn tnVar) {
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb
    public void zb(Bundle bundle) {
        if (!this.f24934dy) {
            f24898uh = this.pmi;
        }
        super.zb(bundle);
    }

    public void ycx(boolean z11, boolean z12) {
        if (!TextUtils.isEmpty(this.ycx)) {
            av.ycx().ycx(this.ycx, z11, z12);
        }
        if (!this.f24934dy || TextUtils.isEmpty(this.ycx)) {
            return;
        }
        av.ycx().ycx(this.ycx, z11, z12);
    }
}
