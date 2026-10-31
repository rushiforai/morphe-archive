package com.android.launcher3;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.util.AttributeSet;
import android.view.View;
import w20.e;

/* loaded from: classes2.dex */
public class DashedLineGuideView extends View {

    /* renamed from: a, reason: collision with root package name */
    public final Paint f20946a;

    /* renamed from: b, reason: collision with root package name */
    public final Path f20947b;

    public DashedLineGuideView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setWillNotDraw(false);
        this.f20947b = new Path();
        Paint paint = new Paint();
        this.f20946a = paint;
        paint.setColor(-2131824914);
        this.f20946a.setStyle(Paint.Style.STROKE);
        this.f20946a.setStrokeWidth(e.k(2));
        this.f20946a.setPathEffect(new DashPathEffect(new float[]{e.k(8), e.k(16)}, 0.0f));
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        float width = getWidth() / 2.0f;
        this.f20947b.reset();
        this.f20947b.moveTo(width, 0.0f);
        this.f20947b.lineTo(width, getHeight());
        canvas.drawPath(this.f20947b, this.f20946a);
    }
}
