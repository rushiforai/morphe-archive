package r;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import androidx.appcompat.widget.AppCompatSeekBar;

/* loaded from: classes2.dex */
public final class z extends v {

    /* renamed from: e, reason: collision with root package name */
    public final AppCompatSeekBar f84917e;

    /* renamed from: f, reason: collision with root package name */
    public Drawable f84918f;

    /* renamed from: g, reason: collision with root package name */
    public ColorStateList f84919g;

    /* renamed from: h, reason: collision with root package name */
    public PorterDuff.Mode f84920h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f84921i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f84922j;

    public z(AppCompatSeekBar appCompatSeekBar) {
        super(appCompatSeekBar);
        this.f84919g = null;
        this.f84920h = null;
        this.f84921i = false;
        this.f84922j = false;
        this.f84917e = appCompatSeekBar;
    }

    @Override // r.v
    public final void b(AttributeSet attributeSet, int i5) {
        super.b(attributeSet, 2130969918);
        AppCompatSeekBar appCompatSeekBar = this.f84917e;
        Context context = appCompatSeekBar.getContext();
        int[] iArr = l.a.f72894g;
        x7.u uVarR = x7.u.r(context, attributeSet, iArr, 2130969918);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        a5.a1.j(appCompatSeekBar, appCompatSeekBar.getContext(), iArr, attributeSet, (TypedArray) uVarR.f95209b, 2130969918);
        Drawable drawableM = uVarR.m(0);
        if (drawableM != null) {
            appCompatSeekBar.setThumb(drawableM);
        }
        Drawable drawableL = uVarR.l(1);
        Drawable drawable = this.f84918f;
        if (drawable != null) {
            drawable.setCallback(null);
        }
        this.f84918f = drawableL;
        if (drawableL != null) {
            drawableL.setCallback(appCompatSeekBar);
            drawableL.setLayoutDirection(appCompatSeekBar.getLayoutDirection());
            if (drawableL.isStateful()) {
                drawableL.setState(appCompatSeekBar.getDrawableState());
            }
            e();
        }
        appCompatSeekBar.invalidate();
        if (typedArray.hasValue(3)) {
            this.f84920h = a1.c(typedArray.getInt(3, -1), this.f84920h);
            this.f84922j = true;
        }
        if (typedArray.hasValue(2)) {
            this.f84919g = uVarR.k(2);
            this.f84921i = true;
        }
        uVarR.s();
        e();
    }

    public final void e() {
        Drawable drawable = this.f84918f;
        if (drawable != null) {
            if (this.f84921i || this.f84922j) {
                Drawable drawableMutate = drawable.mutate();
                this.f84918f = drawableMutate;
                if (this.f84921i) {
                    drawableMutate.setTintList(this.f84919g);
                }
                if (this.f84922j) {
                    this.f84918f.setTintMode(this.f84920h);
                }
                if (this.f84918f.isStateful()) {
                    this.f84918f.setState(this.f84917e.getDrawableState());
                }
            }
        }
    }

    public final void f(Canvas canvas) {
        if (this.f84918f != null) {
            int max = this.f84917e.getMax();
            if (max > 1) {
                int intrinsicWidth = this.f84918f.getIntrinsicWidth();
                int intrinsicHeight = this.f84918f.getIntrinsicHeight();
                int i5 = intrinsicWidth >= 0 ? intrinsicWidth / 2 : 1;
                int i11 = intrinsicHeight >= 0 ? intrinsicHeight / 2 : 1;
                this.f84918f.setBounds(-i5, -i11, i5, i11);
                float width = ((r0.getWidth() - r0.getPaddingLeft()) - r0.getPaddingRight()) / max;
                int iSave = canvas.save();
                canvas.translate(r0.getPaddingLeft(), r0.getHeight() / 2);
                for (int i12 = 0; i12 <= max; i12++) {
                    this.f84918f.draw(canvas);
                    canvas.translate(width, 0.0f);
                }
                canvas.restoreToCount(iSave);
            }
        }
    }
}
