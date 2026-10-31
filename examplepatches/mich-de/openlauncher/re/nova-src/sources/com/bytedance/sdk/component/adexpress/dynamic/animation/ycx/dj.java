package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import com.bytedance.sdk.component.adexpress.dynamic.dynamicview.kgy;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public abstract class dj implements kgy {
    public View sya;

    /* renamed from: zb, reason: collision with root package name */
    com.bytedance.sdk.component.adexpress.dynamic.dj.ycx f23292zb;

    /* renamed from: dj, reason: collision with root package name */
    private Set<ScheduledFuture<?>> f23291dj = new HashSet();
    public List<ObjectAnimator> ycx = ycx();

    public class ycx implements Runnable {
        ObjectAnimator ycx;

        /* renamed from: zb, reason: collision with root package name */
        ScheduledFuture<?> f23295zb;

        public ycx(ObjectAnimator objectAnimator) {
            this.ycx = objectAnimator;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
                com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().sya().post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj.ycx.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ycx.this.ycx.resume();
                    }
                });
                if (this.f23295zb != null) {
                    dj.this.f23291dj.remove(this.f23295zb);
                }
            }
        }

        public void ycx(ScheduledFuture<?> scheduledFuture) {
            this.f23295zb = scheduledFuture;
        }
    }

    public dj(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        this.sya = view;
        this.f23292zb = ycxVar;
    }

    public void sya() {
        List<ObjectAnimator> list = this.ycx;
        if (list == null) {
            return;
        }
        for (final ObjectAnimator objectAnimator : list) {
            objectAnimator.start();
            if (this.f23292zb.wie() > 0.0d) {
                objectAnimator.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj.1
                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationCancel(Animator animator) {
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animator) {
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationRepeat(Animator animator) {
                        objectAnimator.pause();
                        ycx ycxVar = dj.this.new ycx(objectAnimator);
                        ScheduledFuture<?> scheduledFutureYcx = com.bytedance.sdk.component.adexpress.dj.dj.ycx(ycxVar, (long) (dj.this.f23292zb.wie() * 1000.0d), TimeUnit.MILLISECONDS);
                        ycxVar.ycx(scheduledFutureYcx);
                        dj.this.f23291dj.add(scheduledFutureYcx);
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator animator) {
                    }
                });
            }
        }
    }

    public abstract List<ObjectAnimator> ycx();

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.kgy
    public void zb() {
        List<ObjectAnimator> list = this.ycx;
        if (list == null) {
            return;
        }
        for (ObjectAnimator objectAnimator : list) {
            objectAnimator.cancel();
            objectAnimator.removeAllUpdateListeners();
        }
        Iterator<ScheduledFuture<?>> it = this.f23291dj.iterator();
        while (it.hasNext()) {
            it.next().cancel(true);
        }
    }

    public ObjectAnimator ycx(final ObjectAnimator objectAnimator) {
        objectAnimator.setStartDelay((long) (this.f23292zb.xkz() * 1000.0d));
        if (this.f23292zb.syc() > 0) {
            objectAnimator.setRepeatCount(this.f23292zb.syc() - 1);
        } else {
            objectAnimator.setRepeatCount(-1);
        }
        if (!"normal".equals(this.f23292zb.dy())) {
            if ("alternate".equals(this.f23292zb.dy()) || "alternate-reverse".equals(this.f23292zb.dy())) {
                objectAnimator.setRepeatMode(2);
            } else {
                objectAnimator.setRepeatMode(1);
            }
        }
        if ("ease-in-out".equals(this.f23292zb.ry())) {
            objectAnimator.setInterpolator(new AccelerateDecelerateInterpolator());
        } else if ("ease-in".equals(this.f23292zb.dy())) {
            objectAnimator.setInterpolator(new AccelerateInterpolator());
        } else if ("ease-out".equals(this.f23292zb.dy())) {
            objectAnimator.setInterpolator(new DecelerateInterpolator());
        } else {
            objectAnimator.setInterpolator(new LinearInterpolator());
        }
        objectAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj.2
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                if (valueAnimator.getCurrentPlayTime() > 0) {
                    dj.this.sya.setVisibility(0);
                    if (dj.this.sya.getParent() instanceof com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt) {
                        ((View) dj.this.sya.getParent()).setVisibility(0);
                    }
                    objectAnimator.removeAllUpdateListeners();
                }
            }
        });
        return objectAnimator;
    }
}
