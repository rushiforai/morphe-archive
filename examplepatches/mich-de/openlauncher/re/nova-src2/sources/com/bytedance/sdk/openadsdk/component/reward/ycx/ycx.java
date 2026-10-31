package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    com.bytedance.sdk.openadsdk.core.widget.jw f25164dj;
    private AnimatorSet fby;

    /* renamed from: lt, reason: collision with root package name */
    protected final String f25165lt;
    protected com.bytedance.sdk.openadsdk.core.sya.lud lud;
    protected final int sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.widget.fby f25166ul;
    protected final tn ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected final Activity f25167zb;

    public ycx(Activity activity, tn tnVar, int i5, String str) {
        this.f25167zb = activity;
        this.ycx = tnVar;
        this.sya = i5;
        this.f25165lt = str;
    }

    public void dj() {
        AnimatorSet animatorSet = this.fby;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
    }

    public View lt() {
        return this.f25166ul;
    }

    public void lud() {
        com.bytedance.sdk.openadsdk.core.widget.fby fbyVar = this.f25166ul;
        if (fbyVar != null) {
            fbyVar.setVisibility(8);
        }
    }

    public void sya() {
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(1, 80);
        valueAnimatorOfInt.setDuration(2000L);
        valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ycx.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                int iIntValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                com.bytedance.sdk.openadsdk.core.widget.jw jwVar = ycx.this.f25164dj;
                if (jwVar != null) {
                    jwVar.setProgress(iIntValue);
                }
            }
        });
        ValueAnimator valueAnimatorOfInt2 = ValueAnimator.ofInt(81, 99);
        valueAnimatorOfInt2.setDuration(3000L);
        valueAnimatorOfInt2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ycx.2
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                int iIntValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                com.bytedance.sdk.openadsdk.core.widget.jw jwVar = ycx.this.f25164dj;
                if (jwVar != null) {
                    jwVar.setProgress(iIntValue);
                }
            }
        });
        AnimatorSet animatorSet = new AnimatorSet();
        this.fby = animatorSet;
        animatorSet.play(valueAnimatorOfInt).before(valueAnimatorOfInt2);
        this.fby.addListener(new AnimatorListenerAdapter() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.ycx.3
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
            }
        });
        this.fby.start();
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.sya.lud ludVar) {
        this.lud = ludVar;
    }

    public void zb() {
        com.bytedance.sdk.openadsdk.core.widget.fby fbyVar = this.f25166ul;
        if (fbyVar != null) {
            fbyVar.bringToFront();
        }
    }

    public void ycx() {
        try {
            if (av.sya(this.ycx)) {
                return;
            }
            com.bytedance.sdk.openadsdk.core.widget.fby fbyVar = new com.bytedance.sdk.openadsdk.core.widget.fby(this.f25167zb);
            this.f25166ul = fbyVar;
            this.f25164dj = fbyVar.getLoadingProgressBar();
            com.bytedance.sdk.openadsdk.core.lt.fby downloadButton = this.f25166ul.getDownloadButton();
            if (downloadButton != null) {
                downloadButton.setOnClickListener(this.lud);
            }
            this.f25166ul.ycx(this.ycx, this.sya);
            this.f25166ul.ycx(this.ycx, this.f25167zb, this.f25165lt);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvVcnxSMJ1rqJJsEkWjJgU3STw==", "UuAkgQ==", 58);
        }
    }
}
