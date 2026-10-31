package com.bytedance.sdk.component.adexpress.lt;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.animation.CycleInterpolator;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class ul extends thx {
    private AnimatorSet sya;
    private TextView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private View f23611zb;

    public ul(Context context) {
        super(context);
        this.sya = new AnimatorSet();
        zb(context);
    }

    private void dj() {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.f23611zb, "translationY", 0.0f, com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), -3.0f));
        objectAnimatorOfFloat.setInterpolator(new CycleInterpolator(1.0f));
        objectAnimatorOfFloat.setDuration(1000L);
        objectAnimatorOfFloat.setRepeatCount(-1);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.f23611zb, "alpha", 1.0f, 0.8f);
        objectAnimatorOfFloat2.setDuration(1000L);
        objectAnimatorOfFloat2.setInterpolator(new CycleInterpolator(1.0f));
        objectAnimatorOfFloat2.setRepeatCount(-1);
        this.sya.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2);
        this.sya.setDuration(1000L);
        this.sya.start();
    }

    private void zb(Context context) {
        View viewYcx = com.bytedance.sdk.component.adexpress.sya.ycx.ycx(context);
        this.f23611zb = viewYcx;
        addView(viewYcx);
        setClipChildren(false);
        this.ycx = (TextView) findViewById(2097610748);
    }

    public void setButtonText(String str) {
        if (this.ycx == null || TextUtils.isEmpty(str)) {
            return;
        }
        this.ycx.setText(str);
    }

    @Override // com.bytedance.sdk.component.adexpress.lt.thx
    public void ycx(Context context) {
    }

    @Override // com.bytedance.sdk.component.adexpress.lt.thx
    public void ycx() {
        dj();
    }

    @Override // com.bytedance.sdk.component.adexpress.lt.thx
    public void zb() {
        this.sya.cancel();
    }
}
