package com.bytedance.sdk.component.adexpress.lt;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;

/* loaded from: classes2.dex */
public class htf extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private ImageView f23552dj;
    private AnimatorSet fby;

    /* renamed from: jw, reason: collision with root package name */
    private AnimatorSet f23553jw;

    /* renamed from: lt, reason: collision with root package name */
    private AnimatorSet f23554lt;
    private TextView lud;
    private ImageView sya;

    /* renamed from: ul, reason: collision with root package name */
    private AnimatorSet f23555ul;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ImageView f23556zb;

    public htf(Context context) {
        super(context);
        this.f23554lt = new AnimatorSet();
        this.f23555ul = new AnimatorSet();
        this.fby = new AnimatorSet();
        this.f23553jw = new AnimatorSet();
        this.ycx = context;
        sya();
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
    }

    public void setGuideText(String str) {
        this.lud.setText(str);
    }

    private void dj() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.f23556zb, "alpha", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.sya, "scaleX", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(this.sya, "scaleY", 0.0f, 1.0f);
        ObjectAnimator objectAnimatorOfFloat4 = ObjectAnimator.ofFloat(this.f23552dj, "alpha", 0.0f, 1.0f);
        this.fby.setDuration(300L);
        this.fby.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2, objectAnimatorOfFloat3, objectAnimatorOfFloat4);
        ObjectAnimator objectAnimatorOfFloat5 = ObjectAnimator.ofFloat(this.f23556zb, "translationX", 0.0f, com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), 90.0f));
        objectAnimatorOfFloat5.setInterpolator(new PathInterpolator(0.2f, 0.0f, 0.3f, 1.0f));
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(0, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), 90.0f));
        valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.component.adexpress.lt.htf.2
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                Integer num = (Integer) valueAnimator.getAnimatedValue();
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) htf.this.f23552dj.getLayoutParams();
                layoutParams.width = num.intValue();
                htf.this.f23552dj.setLayoutParams(layoutParams);
            }
        });
        valueAnimatorOfInt.setInterpolator(new PathInterpolator(0.2f, 0.0f, 0.3f, 1.0f));
        ObjectAnimator objectAnimatorOfFloat6 = ObjectAnimator.ofFloat(this.sya, "translationX", 0.0f, com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), 90.0f));
        objectAnimatorOfFloat6.setInterpolator(new PathInterpolator(0.2f, 0.0f, 0.3f, 1.0f));
        this.f23553jw.setDuration(a.f39430h);
        this.f23553jw.playTogether(objectAnimatorOfFloat5, valueAnimatorOfInt, objectAnimatorOfFloat6);
        ObjectAnimator objectAnimatorOfFloat7 = ObjectAnimator.ofFloat(this.f23556zb, "alpha", 1.0f, 0.0f);
        ObjectAnimator objectAnimatorOfFloat8 = ObjectAnimator.ofFloat(this.f23552dj, "alpha", 1.0f, 0.0f);
        ObjectAnimator objectAnimatorOfFloat9 = ObjectAnimator.ofFloat(this.sya, "alpha", 1.0f, 0.0f);
        this.f23555ul.setDuration(50L);
        this.f23555ul.playTogether(objectAnimatorOfFloat7, objectAnimatorOfFloat8, objectAnimatorOfFloat9);
        this.f23554lt.playSequentially(this.fby, this.f23553jw, this.f23555ul);
    }

    private void sya() {
        ImageView imageView = new ImageView(this.ycx);
        this.f23552dj = imageView;
        imageView.setBackgroundResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, "tt_splash_slide_right_bg"));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(0, -2);
        layoutParams.gravity = 48;
        layoutParams.leftMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 30.0f);
        addView(this.f23552dj, layoutParams);
        setClipChildren(false);
        setClipToPadding(false);
        ImageView imageView2 = new ImageView(this.ycx);
        this.sya = imageView2;
        imageView2.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, "tt_splash_slide_right_circle"));
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 50.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 50.0f));
        layoutParams2.gravity = 48;
        layoutParams2.leftMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 30.0f);
        addView(this.sya, layoutParams2);
        ImageView imageView3 = new ImageView(this.ycx);
        this.f23556zb = imageView3;
        imageView3.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, "tt_splash_hand2"));
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 80.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 80.0f));
        layoutParams3.gravity = 48;
        layoutParams3.leftMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.ycx, 30.0f);
        addView(this.f23556zb, layoutParams3);
        TextView textView = new TextView(this.ycx);
        this.lud = textView;
        textView.setTextColor(-1);
        this.lud.setSingleLine();
        FrameLayout.LayoutParams layoutParams4 = new FrameLayout.LayoutParams(-2, -2);
        layoutParams4.gravity = 80;
        addView(this.lud, layoutParams4);
        post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.htf.1
            @Override // java.lang.Runnable
            public void run() {
                FrameLayout.LayoutParams layoutParams5 = (FrameLayout.LayoutParams) htf.this.f23556zb.getLayoutParams();
                layoutParams5.topMargin = (int) ((htf.this.sya.getMeasuredHeight() / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(htf.this.getContext(), 7.0f));
                int iYcx = (-htf.this.sya.getMeasuredWidth()) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(htf.this.ycx, 30.0f));
                layoutParams5.leftMargin = iYcx;
                layoutParams5.setMarginStart(iYcx);
                layoutParams5.setMarginEnd(layoutParams5.rightMargin);
                htf.this.f23556zb.setLayoutParams(layoutParams5);
                FrameLayout.LayoutParams layoutParams6 = (FrameLayout.LayoutParams) htf.this.f23552dj.getLayoutParams();
                layoutParams6.topMargin = (int) ((htf.this.sya.getMeasuredHeight() / 2.0f) - com.bytedance.sdk.component.adexpress.dj.ul.ycx(htf.this.getContext(), 5.0f));
                layoutParams6.leftMargin = (int) ((htf.this.sya.getMeasuredWidth() / 2.0f) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(htf.this.ycx, 30.0f)));
                layoutParams5.setMarginStart(layoutParams5.leftMargin);
                layoutParams5.setMarginEnd(layoutParams5.rightMargin);
                htf.this.f23552dj.setLayoutParams(layoutParams6);
            }
        });
    }

    public void ycx() {
        dj();
        this.f23554lt.start();
        this.f23554lt.addListener(new AnimatorListenerAdapter() { // from class: com.bytedance.sdk.component.adexpress.lt.htf.3
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                htf.this.postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.htf.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        htf.this.f23554lt.start();
                    }
                }, 200L);
            }
        });
    }

    public void zb() {
        try {
            AnimatorSet animatorSet = this.f23554lt;
            if (animatorSet != null) {
                animatorSet.cancel();
            }
            AnimatorSet animatorSet2 = this.fby;
            if (animatorSet2 != null) {
                animatorSet2.cancel();
            }
            AnimatorSet animatorSet3 = this.f23553jw;
            if (animatorSet3 != null) {
                animatorSet3.cancel();
            }
            AnimatorSet animatorSet4 = this.f23555ul;
            if (animatorSet4 != null) {
                animatorSet4.cancel();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+zoRN0kk=", "aOIkkQaOYMCIXuFUiQY=", "WO8jlgawSMmJR9ZJhR6u", 189);
        }
    }
}
