package com.bytedance.sdk.openadsdk.activity.single;

import android.os.SystemClock;

/* loaded from: classes2.dex */
public class TTBaseLandingPageActivity extends TTBaseActivity {
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f24324zb;

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        long j11 = this.ycx;
        if (j11 > 0) {
            com.bytedance.sdk.openadsdk.utils.lud.ycx(j11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onPause() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onPause();
        if (this.f24324zb > 0) {
            this.ycx = (SystemClock.elapsedRealtime() - this.f24324zb) + this.ycx;
            this.f24324zb = 0L;
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onResume() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onResume();
        if (com.bytedance.sdk.openadsdk.utils.lud.sya()) {
            this.f24324zb = SystemClock.elapsedRealtime();
        }
    }
}
