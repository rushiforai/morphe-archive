package com.bytedance.sdk.component.adexpress.dynamic.animation.view;

import android.content.Context;
import android.graphics.Canvas;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.bytedance.sdk.component.adexpress.dynamic.dj.ul;

/* loaded from: classes2.dex */
public class zb extends ImageView implements IAnimation {

    /* renamed from: dj, reason: collision with root package name */
    private float f23288dj;

    /* renamed from: lt, reason: collision with root package name */
    private ul f23289lt;
    private float lud;
    private float sya;
    sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23290zb;

    public zb(Context context) {
        super(context);
        this.ycx = new sya();
    }

    public ul getBrickNativeValue() {
        return this.f23289lt;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getMarqueeValue() {
        return this.f23288dj;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getRippleValue() {
        return this.f23290zb;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getShineValue() {
        return this.sya;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getStretchValue() {
        return this.lud;
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        ul ulVar;
        super.onDraw(canvas);
        this.ycx.ycx(canvas, this, this);
        if (getRippleValue() == 0.0f || (ulVar = this.f23289lt) == null || ulVar.zb() <= 0) {
            return;
        }
        ((ViewGroup) getParent()).setClipChildren(false);
        ((ViewGroup) getParent().getParent()).setClipChildren(false);
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.ycx.ycx(this, i5, i11);
    }

    public void setBrickNativeValue(ul ulVar) {
        this.f23289lt = ulVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setMarqueeValue(float f11) {
        this.f23288dj = f11;
        postInvalidate();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setRippleValue(float f11) {
        this.f23290zb = f11;
        postInvalidate();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setShineValue(float f11) {
        this.sya = f11;
        postInvalidate();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setStretchValue(float f11) {
        this.lud = f11;
        this.ycx.ycx(this, f11);
    }
}
