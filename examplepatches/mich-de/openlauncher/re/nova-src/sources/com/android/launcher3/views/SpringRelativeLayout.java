package com.android.launcher3.views;

import ab.p;
import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.widget.EdgeEffect;
import android.widget.RelativeLayout;
import o9.g3;

/* loaded from: classes.dex */
public class SpringRelativeLayout extends RelativeLayout {

    /* renamed from: a, reason: collision with root package name */
    public final EdgeEffect f21309a;

    /* renamed from: b, reason: collision with root package name */
    public final EdgeEffect f21310b;

    public SpringRelativeLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        EdgeEffect edgeEffect = this.f21309a;
        if (!edgeEffect.isFinished()) {
            int iSave = canvas.save();
            canvas.translate(0.0f, 0.0f);
            edgeEffect.setSize(getWidth(), getHeight());
            if (edgeEffect.draw(canvas)) {
                postInvalidateOnAnimation();
            }
            canvas.restoreToCount(iSave);
        }
        EdgeEffect edgeEffect2 = this.f21310b;
        if (edgeEffect2.isFinished()) {
            return;
        }
        int iSave2 = canvas.save();
        int width = getWidth();
        int height = getHeight();
        canvas.translate(-width, height);
        canvas.rotate(180.0f, width, 0.0f);
        edgeEffect2.setSize(width, height);
        if (edgeEffect2.draw(canvas)) {
            postInvalidateOnAnimation();
        }
        canvas.restoreToCount(iSave2);
    }

    public SpringRelativeLayout(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0);
        boolean z11 = g3.f79853h;
        this.f21309a = z11 ? p.h(context, attributeSet) : new EdgeEffect(context);
        this.f21310b = z11 ? p.h(context, attributeSet) : new EdgeEffect(context);
        setWillNotDraw(false);
    }
}
