package com.bytedance.sdk.component.adexpress.lt;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Interpolator;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class pmi extends LinearLayout {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.utils.dv f23580dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f23581ea;
    private LinearLayout fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f23582jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f23583jw;

    /* renamed from: lt, reason: collision with root package name */
    private TextView f23584lt;
    private TextView lud;

    /* renamed from: ok, reason: collision with root package name */
    private JSONObject f23585ok;
    private ImageView sya;

    /* renamed from: ul, reason: collision with root package name */
    private ycx f23586ul;
    private TextView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private TextView f23587zb;

    /* renamed from: com.bytedance.sdk.component.adexpress.lt.pmi$1, reason: invalid class name */
    public class AnonymousClass1 implements Runnable {
        public AnonymousClass1() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (pmi.this.sya != null) {
                final RotateAnimation rotateAnimation = new RotateAnimation(-14.0f, 14.0f, 1, 0.9f, 1, 0.9f);
                rotateAnimation.setInterpolator(new zb(null));
                rotateAnimation.setDuration(1000L);
                rotateAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.bytedance.sdk.component.adexpress.lt.pmi.1.1
                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationEnd(Animation animation) {
                        pmi.this.postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.pmi.1.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                pmi.this.sya.startAnimation(rotateAnimation);
                            }
                        }, 250L);
                    }

                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationRepeat(Animation animation) {
                    }

                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationStart(Animation animation) {
                    }
                });
                pmi.this.sya.startAnimation(rotateAnimation);
            }
        }
    }

    public interface ycx {
    }

    public static class zb implements Interpolator {
        private zb() {
        }

        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float f11) {
            return f11 <= 0.25f ? (f11 * (-2.0f)) + 0.5f : f11 <= 0.5f ? (f11 * 4.0f) - 1.0f : f11 <= 0.75f ? (f11 * (-4.0f)) + 3.0f : (f11 * 2.0f) - 1.5f;
        }

        public /* synthetic */ zb(AnonymousClass1 anonymousClass1) {
            this();
        }
    }

    public pmi(Context context, View view, int i5, int i11, int i12, JSONObject jSONObject) {
        super(context);
        this.f23583jw = i5;
        this.f23582jc = i11;
        this.f23581ea = i12;
        this.f23585ok = jSONObject;
        ycx(context, view);
    }

    public LinearLayout getShakeLayout() {
        return this.fby;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (isShown()) {
            if (this.f23580dj == null) {
                this.f23580dj = new com.bytedance.sdk.component.utils.dv(getContext().getApplicationContext(), 1);
            }
            new Object() { // from class: com.bytedance.sdk.component.adexpress.lt.pmi.2
            };
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
    }

    public void setOnShakeViewListener(ycx ycxVar) {
        this.f23586ul = ycxVar;
    }

    public void setShakeText(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.lud.setText(str);
        } else {
            this.lud.setVisibility(8);
            this.f23584lt.setVisibility(8);
        }
    }

    public void ycx(Context context, View view) {
        addView(view);
        this.fby = (LinearLayout) findViewById(2097610727);
        this.sya = (ImageView) findViewById(2097610725);
        this.ycx = (TextView) findViewById(2097610724);
        this.f23587zb = (TextView) findViewById(2097610726);
        this.lud = (TextView) findViewById(2097610723);
        this.f23584lt = (TextView) findViewById(2097610728);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor("#57000000"));
        this.fby.setBackground(gradientDrawable);
    }

    public void ycx() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, "alpha", 0.0f, 1.0f);
        objectAnimatorOfFloat.setDuration(300L);
        objectAnimatorOfFloat.start();
        postDelayed(new AnonymousClass1(), 500L);
    }
}
