package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.AbsSeekBar;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u20 extends s26 {
    public final t20 f;
    public Drawable g;
    public ColorStateList h;
    public PorterDuff.Mode i;
    public boolean j;
    public boolean k;

    public u20(t20 t20Var) {
        super((AbsSeekBar) t20Var);
        this.h = null;
        this.i = null;
        this.j = false;
        this.k = false;
        this.f = t20Var;
    }

    public final void B0() {
        Drawable drawable = this.g;
        if (drawable != null) {
            if (this.j || this.k) {
                Drawable drawableMutate = drawable.mutate();
                this.g = drawableMutate;
                if (this.j) {
                    drawableMutate.setTintList(this.h);
                }
                if (this.k) {
                    this.g.setTintMode(this.i);
                }
                if (this.g.isStateful()) {
                    this.g.setState(this.f.getDrawableState());
                }
            }
        }
    }

    public final void C0(Canvas canvas) {
        if (this.g != null) {
            int max = this.f.getMax();
            if (max > 1) {
                int intrinsicWidth = this.g.getIntrinsicWidth();
                int intrinsicHeight = this.g.getIntrinsicHeight();
                int i = intrinsicWidth >= 0 ? intrinsicWidth / 2 : 1;
                int i2 = intrinsicHeight >= 0 ? intrinsicHeight / 2 : 1;
                this.g.setBounds(-i, -i2, i, i2);
                float width = ((r0.getWidth() - r0.getPaddingLeft()) - r0.getPaddingRight()) / max;
                int iSave = canvas.save();
                canvas.translate(r0.getPaddingLeft(), r0.getHeight() / 2);
                for (int i3 = 0; i3 <= max; i3++) {
                    this.g.draw(canvas);
                    canvas.translate(width, 0.0f);
                }
                canvas.restoreToCount(iSave);
            }
        }
    }

    @Override // defpackage.s26
    public final void o0(AttributeSet attributeSet, int i) {
        super.o0(attributeSet, R.attr.seekBarStyle);
        t20 t20Var = this.f;
        Context context = t20Var.getContext();
        int[] iArr = esa.g;
        vwa vwaVarX = vwa.x(context, attributeSet, iArr, R.attr.seekBarStyle);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        ute.n(t20Var, t20Var.getContext(), iArr, attributeSet, (TypedArray) vwaVarX.c, R.attr.seekBarStyle);
        Drawable drawableR = vwaVarX.r(0);
        if (drawableR != null) {
            t20Var.setThumb(drawableR);
        }
        Drawable drawableQ = vwaVarX.q(1);
        Drawable drawable = this.g;
        if (drawable != null) {
            drawable.setCallback(null);
        }
        this.g = drawableQ;
        if (drawableQ != null) {
            drawableQ.setCallback(t20Var);
            drawableQ.setLayoutDirection(t20Var.getLayoutDirection());
            if (drawableQ.isStateful()) {
                drawableQ.setState(t20Var.getDrawableState());
            }
            B0();
        }
        t20Var.invalidate();
        if (typedArray.hasValue(3)) {
            this.i = lm3.b(typedArray.getInt(3, -1), this.i);
            this.k = true;
        }
        if (typedArray.hasValue(2)) {
            this.h = vwaVarX.o(2);
            this.j = true;
        }
        vwaVarX.C();
        B0();
    }
}
