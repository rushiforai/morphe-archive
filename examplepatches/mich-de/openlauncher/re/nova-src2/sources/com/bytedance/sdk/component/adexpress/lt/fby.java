package com.bytedance.sdk.component.adexpress.lt;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.text.TextUtils;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class fby extends thx {

    /* renamed from: dj, reason: collision with root package name */
    private ImageView f23549dj;

    /* renamed from: lt, reason: collision with root package name */
    private AnimatorSet f23550lt;
    private int lud;
    private ImageView sya;
    private TextView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ImageView f23551zb;

    public fby(Context context) {
        super(context);
        this.f23550lt = new AnimatorSet();
        zb(context);
    }

    private void dj() {
        ObjectAnimator objectAnimatorOfInt = ObjectAnimator.ofInt(this, "alphaColor", 0, 60);
        objectAnimatorOfInt.setInterpolator(new LinearInterpolator());
        objectAnimatorOfInt.setDuration(2000L);
        objectAnimatorOfInt.setRepeatCount(-1);
        objectAnimatorOfInt.start();
    }

    private void zb(Context context) {
        addView(com.bytedance.sdk.component.adexpress.sya.ycx.zb(context));
        this.f23551zb = (ImageView) findViewById(2097610751);
        this.sya = (ImageView) findViewById(2097610750);
        this.f23549dj = (ImageView) findViewById(2097610749);
        this.ycx = (TextView) findViewById(2097610748);
    }

    public float getAlphaColor() {
        return this.lud;
    }

    public void setAlphaColor(int i5) {
        if (i5 < 0 || i5 > 60) {
            return;
        }
        int i11 = i5 + 195;
        ImageView imageView = this.f23549dj;
        int iRgb = Color.rgb(i11, i11, i11);
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        imageView.setColorFilter(iRgb, mode);
        int i12 = ((i5 + 20) % 60) + 195;
        this.sya.setColorFilter(Color.rgb(i12, i12, i12), mode);
        int i13 = ((i5 + 40) % 60) + 195;
        this.f23551zb.setColorFilter(Color.rgb(i13, i13, i13), mode);
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
        this.f23550lt.cancel();
    }
}
