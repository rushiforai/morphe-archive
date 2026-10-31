package com.android.launcher3.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: classes2.dex */
public class WidgetImageView extends View {

    /* renamed from: a, reason: collision with root package name */
    public final RectF f21340a;

    /* renamed from: b, reason: collision with root package name */
    public Drawable f21341b;

    public WidgetImageView(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        this.f21340a = new RectF();
        context.getResources().getDimensionPixelSize(2131166367);
    }

    public final void a() {
        float width = getWidth();
        float height = getHeight();
        float intrinsicWidth = this.f21341b.getIntrinsicWidth();
        float f11 = intrinsicWidth > width ? width / intrinsicWidth : 1.0f;
        float f12 = intrinsicWidth * f11;
        float intrinsicHeight = this.f21341b.getIntrinsicHeight() * f11;
        RectF rectF = this.f21340a;
        rectF.left = (width - f12) / 2.0f;
        rectF.right = (width + f12) / 2.0f;
        if (intrinsicHeight > height) {
            rectF.top = 0.0f;
            rectF.bottom = intrinsicHeight;
        } else {
            rectF.top = (height - intrinsicHeight) / 2.0f;
            rectF.bottom = (height + intrinsicHeight) / 2.0f;
        }
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        if (this.f21341b != null) {
            a();
            Drawable drawable = this.f21341b;
            a();
            Rect rect = new Rect();
            this.f21340a.round(rect);
            drawable.setBounds(rect);
            this.f21341b.draw(canvas);
        }
    }
}
