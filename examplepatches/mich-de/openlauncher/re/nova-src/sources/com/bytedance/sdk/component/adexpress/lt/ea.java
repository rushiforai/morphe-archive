package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.text.TextUtils;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class ea extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private final RotateAnimation f23547dj;
    private final ok sya;
    private final TextView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ImageView f23548zb;

    public ea(Context context) {
        super(context);
        addView(com.bytedance.sdk.component.adexpress.sya.ycx.dj(context));
        this.ycx = (TextView) findViewById(2097610742);
        this.f23548zb = (ImageView) findViewById(2097610745);
        this.sya = (ok) findViewById(2097610744);
        RotateAnimation rotateAnimation = new RotateAnimation(0.0f, 30.0f, 1, 0.65f, 1, 0.9f);
        this.f23547dj = rotateAnimation;
        rotateAnimation.setDuration(300L);
        rotateAnimation.setRepeatMode(2);
        rotateAnimation.setRepeatCount(1);
        rotateAnimation.setInterpolator(new LinearInterpolator());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Runnable getHaloAnimation() {
        return new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.ea.1
            @Override // java.lang.Runnable
            public void run() {
                ea.this.f23548zb.startAnimation(ea.this.f23547dj);
                ea.this.postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.ea.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ea.this.sya.ycx(4);
                    }
                }, 100L);
                ea.this.postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.ea.1.2
                    @Override // java.lang.Runnable
                    public void run() {
                        ea.this.sya.ycx(4);
                    }
                }, 300L);
                ea eaVar = ea.this;
                eaVar.postDelayed(eaVar.getHaloAnimation(), 1200L);
            }
        };
    }

    public void setText(String str) {
        if (TextUtils.isEmpty(str)) {
            str = "Slide or click to jump to the details page or third-party application";
        }
        TextView textView = this.ycx;
        if (textView != null) {
            textView.setText(str);
        }
    }

    public void ycx() {
        postDelayed(getHaloAnimation(), 300L);
    }

    public void zb() {
        this.f23547dj.cancel();
    }
}
