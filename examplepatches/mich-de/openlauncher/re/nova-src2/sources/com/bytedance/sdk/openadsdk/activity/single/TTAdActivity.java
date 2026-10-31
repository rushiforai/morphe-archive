package com.bytedance.sdk.openadsdk.activity.single;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.dwi;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.dj.jc;
import com.bytedance.sdk.openadsdk.utils.dy;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class TTAdActivity extends TTBaseActivity {
    private zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f24304zb;
    private int sya = -1;

    /* renamed from: dj, reason: collision with root package name */
    private final AtomicBoolean f24303dj = new AtomicBoolean(false);

    private void lud() {
        zb zbVar = this.ycx;
        if (zbVar == null) {
            super.onBackPressed();
        } else {
            zbVar.fby();
        }
    }

    private void sya() {
        if (!this.f24304zb) {
            av.ycx().ycx((com.bytedance.sdk.openadsdk.ycx.lud.ycx) null);
            av.ycx().ycx((com.bytedance.sdk.openadsdk.ycx.sya.zb) null);
        } else if (!TextUtils.isEmpty(this.kgy)) {
            av.ycx().ycx(this.kgy, isFinishing(), isChangingConfigurations());
        }
        dy.ycx();
        dwi.ycx().ycx(String.valueOf(hashCode()));
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity
    public boolean dj() {
        return true;
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity
    public void h_() {
        lud();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.ycx((Activity) this);
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        lud();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0053 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onCreate(Bundle bundle) {
        long longExtra;
        tn tnVarYcx;
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (bundle == null) {
            if (intent != null) {
                this.kgy = intent.getStringExtra("single_process_listener_key");
                this.f24304zb = intent.getBooleanExtra("enable_new_arch", false);
                longExtra = intent.getLongExtra("start_show_time", SystemClock.elapsedRealtime());
            }
            com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVarYcx = ycx(this.kgy);
            com.bytedance.sdk.openadsdk.ycx.sya.zb zbVarZb = zb(this.kgy);
            tnVarYcx = com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(getIntent(), bundle, (com.bytedance.sdk.openadsdk.core.syc.dj.zb) null);
            if (tnVarYcx != null) {
                finish();
                return;
            }
            try {
                tnVarYcx.ycx(longExtra);
                this.ycx = new zb(this, tnVarYcx, this.f24304zb);
                if (bundle != null && tnVarYcx.dc()) {
                    this.ycx.wie();
                }
                this.ycx.ycx(this, bundle, ycxVarYcx, zbVarZb);
                if (bundle != null) {
                    jc.ycx(tnVarYcx, "activity_recreate", tnVarYcx.lud(), "activity_recreate", null);
                }
                com.bytedance.sdk.openadsdk.utils.zb.ycx(tnVarYcx);
                return;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMkSK/fc6WQ8NE", "VOAOhwa9fcI=", 76);
                htf.ycx("BVA", "onCreate: ", th2);
                jc.ycx(tnVarYcx, "show_ad_fail", tnVarYcx.lud(), "init_view_crash");
                finish();
                return;
            }
        }
        this.kgy = bundle.getString("single_process_listener_key");
        this.f24304zb = bundle.getBoolean("enable_new_arch", false);
        longExtra = 0;
        com.bytedance.sdk.openadsdk.ycx.lud.ycx ycxVarYcx2 = ycx(this.kgy);
        com.bytedance.sdk.openadsdk.ycx.sya.zb zbVarZb2 = zb(this.kgy);
        tnVarYcx = com.bytedance.sdk.openadsdk.component.reward.ycx.sya.ycx(getIntent(), bundle, (com.bytedance.sdk.openadsdk.core.syc.dj.zb) null);
        if (tnVarYcx != null) {
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        zb();
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onPause() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onPause();
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.sya(this);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onResume() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onResume();
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.zb(this);
        }
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (!TextUtils.isEmpty(this.kgy)) {
            bundle.putString("single_process_listener_key", this.kgy);
        }
        bundle.putBoolean("enable_new_arch", this.f24304zb);
        zb zbVar = this.ycx;
        if (zbVar != null) {
            int iYcx = av.ycx().ycx(zbVar.ycx());
            this.sya = iYcx;
            this.ycx.ycx(this, bundle, iYcx);
        }
    }

    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        if (this.sya >= 0) {
            av.ycx().sya(this.sya);
            this.sya = -1;
        }
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.ycx(this);
        }
    }

    @Override // android.app.Activity
    public void onStop() {
        super.onStop();
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.dj(this);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.ycx(z11);
        }
    }

    public com.bytedance.sdk.openadsdk.ycx.lud.ycx ycx(String str) {
        if (!this.f24304zb) {
            return av.ycx().zb();
        }
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return (com.bytedance.sdk.openadsdk.ycx.lud.ycx) av.ycx().ycx(str, com.bytedance.sdk.openadsdk.ycx.lud.ycx.class);
    }

    public com.bytedance.sdk.openadsdk.ycx.sya.zb zb(String str) {
        if (!this.f24304zb) {
            return av.ycx().sya();
        }
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return (com.bytedance.sdk.openadsdk.ycx.sya.zb) av.ycx().ycx(str, com.bytedance.sdk.openadsdk.ycx.sya.zb.class);
    }

    private void zb() {
        if (this.f24303dj.compareAndSet(false, true)) {
            zb zbVar = this.ycx;
            if (zbVar != null) {
                zbVar.lud(this);
            }
            sya();
        }
    }
}
