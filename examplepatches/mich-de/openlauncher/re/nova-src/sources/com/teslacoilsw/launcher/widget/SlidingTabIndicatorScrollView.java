package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.widget.HorizontalScrollView;
import l30.r;
import o9.u2;

/* loaded from: classes4.dex */
public class SlidingTabIndicatorScrollView extends HorizontalScrollView {

    /* renamed from: a, reason: collision with root package name */
    public final r f46484a;

    public SlidingTabIndicatorScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.G, 0, 0);
        this.f46484a = new r(this, typedArrayObtainStyledAttributes);
        typedArrayObtainStyledAttributes.recycle();
    }

    public final r a() {
        return this.f46484a;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        this.f46484a.a(canvas);
        super.dispatchDraw(canvas);
    }

    @Override // android.view.View
    public final float getAlpha() {
        if (this.f46484a == null) {
            return 1.0f;
        }
        return r0.f74681f / 255.0f;
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f46484a.j();
    }

    @Override // android.view.View
    public final void setAlpha(float f11) {
        r rVar = this.f46484a;
        if (rVar != null) {
            rVar.k(f11);
        }
    }
}
