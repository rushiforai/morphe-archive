package com.bytedance.sdk.openadsdk.api.reward;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener;

/* loaded from: classes2.dex */
public class PAGRewardFullExpressAdListenerProxy implements PAGExpressAdWrapperListener {
    private final PAGExpressAdWrapperListener ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f24674zb = false;
    private final Handler sya = new Handler(Looper.getMainLooper());

    public PAGRewardFullExpressAdListenerProxy(PAGExpressAdWrapperListener pAGExpressAdWrapperListener) {
        this.ycx = pAGExpressAdWrapperListener;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdWrapperListener
    public void onAdClicked() {
        PAGExpressAdWrapperListener pAGExpressAdWrapperListener = this.ycx;
        if (pAGExpressAdWrapperListener != null) {
            pAGExpressAdWrapperListener.onAdClicked();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onAdDismissed() {
        PAGExpressAdWrapperListener pAGExpressAdWrapperListener = this.ycx;
        if (pAGExpressAdWrapperListener != null) {
            pAGExpressAdWrapperListener.onAdDismissed();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onAdShow(View view, int i5) {
        PAGExpressAdWrapperListener pAGExpressAdWrapperListener = this.ycx;
        if (pAGExpressAdWrapperListener != null) {
            pAGExpressAdWrapperListener.onAdShow(view, i5);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onRenderFail(final View view, final String str, final int i5) {
        zb(new Runnable() { // from class: com.bytedance.sdk.openadsdk.api.reward.PAGRewardFullExpressAdListenerProxy.2
            @Override // java.lang.Runnable
            public void run() {
                PAGRewardFullExpressAdListenerProxy.this.ycx.onRenderFail(view, str, i5);
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onRenderSuccess(final View view, final float f11, final float f12) {
        zb(new Runnable() { // from class: com.bytedance.sdk.openadsdk.api.reward.PAGRewardFullExpressAdListenerProxy.3
            @Override // java.lang.Runnable
            public void run() {
                PAGRewardFullExpressAdListenerProxy.this.ycx.onRenderSuccess(view, f11, f12);
            }
        });
    }

    public void triggerUnfinishedFail(final View view) {
        zb(new Runnable() { // from class: com.bytedance.sdk.openadsdk.api.reward.PAGRewardFullExpressAdListenerProxy.4
            @Override // java.lang.Runnable
            public void run() {
                PAGRewardFullExpressAdListenerProxy.this.ycx.onRenderFail(view, BackupConstant.UNFINISHED_FAIL_MSG, BackupConstant.UNFINISHED_FAIL_CODE);
            }
        });
    }

    private void zb(final Runnable runnable) {
        ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.api.reward.PAGRewardFullExpressAdListenerProxy.1
            @Override // java.lang.Runnable
            public void run() {
                if (!PAGRewardFullExpressAdListenerProxy.this.f24674zb && PAGRewardFullExpressAdListenerProxy.this.ycx != null) {
                    PAGRewardFullExpressAdListenerProxy.this.f24674zb = true;
                    runnable.run();
                } else {
                    Log.i("ExpressAdListenerProxy", "onRenderFail or onRenderSuccess has been called before mHasNotified = " + PAGRewardFullExpressAdListenerProxy.this.f24674zb);
                }
            }
        });
    }

    private void ycx(Runnable runnable) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            runnable.run();
        } else {
            this.sya.post(runnable);
        }
    }
}
