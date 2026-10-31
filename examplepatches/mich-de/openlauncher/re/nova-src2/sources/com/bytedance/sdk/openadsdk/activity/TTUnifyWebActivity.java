package com.bytedance.sdk.openadsdk.activity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity;
import com.bytedance.sdk.openadsdk.component.reward.sya.lud;
import com.bytedance.sdk.openadsdk.component.reward.sya.zb;
import com.bytedance.sdk.openadsdk.component.reward.xkz;
import com.bytedance.sdk.openadsdk.component.reward.ycx.ok;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.dwi;
import com.bytedance.sdk.openadsdk.core.lt.sya;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dj.jc;
import com.bytedance.sdk.openadsdk.utils.bhi;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.dj;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public abstract class TTUnifyWebActivity extends TTBaseActivity implements lud {

    /* renamed from: dj, reason: collision with root package name */
    protected zb f24275dj;
    private sya fby;

    /* renamed from: jc, reason: collision with root package name */
    private Context f24276jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f24277jw;

    /* renamed from: lt, reason: collision with root package name */
    private final ok.zb f24278lt;
    protected tn lud;
    int sya;

    /* renamed from: ul, reason: collision with root package name */
    private final AtomicBoolean f24279ul;
    public final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected boolean f24280zb;

    public TTUnifyWebActivity() {
        this.ycx = ycx() ? "rewarded_video" : "fullscreen_interstitial_ad";
        this.sya = 1;
        this.f24278lt = new ok.zb();
        this.f24279ul = new AtomicBoolean(false);
        this.f24277jw = -1;
    }

    private void ycx(tn tnVar, Bundle bundle) {
        Intent intent = getIntent();
        if (intent != null) {
            z = intent.getIntExtra("orientation_angle", 0) == 3;
            tnVar.ycx(intent.getLongExtra("start_show_time", 0L));
        }
        boolean z11 = z;
        this.f24276jc = pmi.ycx();
        sya syaVar = new sya(this);
        this.fby = syaVar;
        zb zbVarYcx = ycx(this, this.f24276jc, tnVar, this.ycx, syaVar, this.kgy, z11);
        this.f24275dj = zbVarYcx;
        zbVarYcx.sya(bundle);
        av.ycx().lud();
        com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(this.f24275dj, intent, bundle);
        zb zbVar = this.f24275dj;
        zbVar.f24945zb = z11;
        zbVar.ycx(bundle);
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity
    public boolean dj() {
        return true;
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void finish() {
        super.finish();
        if (bhi.lt()) {
            dc.sya((Activity) this);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        zb zbVar = this.f24275dj;
        if (zbVar != null) {
            zbVar.jw();
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        pmi.zb(getApplicationContext());
        if (!syc.lud()) {
            finish();
            return;
        }
        tn tnVarYcx = com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(getIntent(), bundle, this);
        if (tnVarYcx == null) {
            finish();
            return;
        }
        com.bytedance.sdk.openadsdk.utils.zb.ycx(tnVarYcx);
        this.f24280zb = com.bytedance.sdk.openadsdk.dv.lud.ycx("adapt_decor_size", 0) == 1;
        htf.ycx("BVA", "activity onCreate isAdaptDecorSize =" + this.f24280zb);
        tnVarYcx.dwi(String.valueOf(hashCode()));
        this.sya = tnVarYcx.pvm();
        this.lud = tnVarYcx;
        ycx(tnVarYcx, bundle);
        if (bundle != null) {
            if (tnVarYcx.nji()) {
                this.f24279ul.set(true);
            }
            jc.ycx(tnVarYcx, "activity_recreate", tnVarYcx.lud(), "activity_recreate", null);
        }
        try {
            sya();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmM", "b9oYmwq6cPCFSPZemBi2IU/3", "VOAOhwa9fcI=", 98);
            htf.ycx("TTUnifyWebActivity", "onCreate: ", th2);
            jc.ycx(tnVarYcx, "show_ad_fail", this.ycx, "init_view_crash");
            finish();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        htf.ycx("BVA", "onDestroy ".concat(String.valueOf(this)));
        zb zbVar = this.f24275dj;
        if (zbVar == null) {
            return;
        }
        zbVar.fby();
        AdSlot adSlotQn = this.lud.qn();
        if (!this.f24275dj.syc() && adSlotQn != null && TextUtils.isEmpty(adSlotQn.getBidAdm()) && !this.lud.oiz()) {
            syc.zb().post(new xkz(ycx(), adSlotQn));
        }
        this.f24278lt.ycx(this);
        dwi.ycx().ycx(String.valueOf(hashCode()));
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onPause() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onPause();
        htf.ycx("BVA", "onPause ".concat(String.valueOf(this)));
        zb zbVar = this.f24275dj;
        if (zbVar != null) {
            zbVar.lt();
        }
    }

    @Override // android.app.Activity
    public void onRestart() {
        super.onRestart();
        tn tnVar = this.lud;
        if (tnVar != null) {
            if (this.rmy && !tnVar.ai() && !TextUtils.isEmpty(tn.ycx(this, this.lud))) {
                finish();
            }
            if (this.lud.ai()) {
                this.lud.syc(false);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onResume() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onResume();
        htf.ycx("BVA", "onResume ".concat(String.valueOf(this)));
        if (this.f24275dj == null) {
            return;
        }
        this.f24278lt.ycx(this, this.sya, this.lud.oq());
        this.f24275dj.sya();
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        zb zbVar = this.f24275dj;
        if (zbVar == null) {
            super.onSaveInstanceState(bundle);
            return;
        }
        zbVar.zb(bundle);
        if (!TextUtils.isEmpty(this.kgy)) {
            bundle.putString("single_process_listener_key", this.kgy);
        }
        int iYcx = this.lud != null ? av.ycx().ycx(this.lud) : -1;
        this.f24277jw = iYcx;
        com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(this.f24275dj, bundle, iYcx);
        super.onSaveInstanceState(bundle);
    }

    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        htf.ycx("BVA", "onStart mMetaIndex =" + this.f24277jw + " this =" + this);
        if (this.f24277jw >= 0) {
            av.ycx().sya(this.f24277jw);
            this.f24277jw = -1;
        }
        if (this.f24275dj != null) {
            dj.ycx(this, this.lud);
        }
    }

    @Override // android.app.Activity
    public void onStop() {
        super.onStop();
        zb zbVar = this.f24275dj;
        if (zbVar != null) {
            zbVar.ul();
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        zb zbVar = this.f24275dj;
        if (zbVar != null) {
            zbVar.ycx(z11);
        }
    }

    public void sya() {
        setContentView(this.fby);
    }

    public abstract zb ycx(Activity activity, Context context, tn tnVar, String str, sya syaVar, String str2, boolean z11);

    public abstract boolean ycx();

    public void zb() {
        finish();
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.lud
    public void ycx(Bundle bundle) {
        if (bundle != null) {
            this.kgy = bundle.getString("single_process_listener_key");
        } else if (getIntent() != null) {
            this.kgy = getIntent().getStringExtra("single_process_listener_key");
        } else {
            this.kgy = b.f42142b;
        }
    }
}
