package com.android.launcher3.shortcuts;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ViewParent;
import android.widget.TextView;
import android.widget.Toast;
import com.android.launcher3.BubbleTextView;
import o9.g3;

/* loaded from: classes2.dex */
public class DeepShortcutTextView extends BubbleTextView {
    public final Rect B;
    public final int C;
    public boolean D;
    public Toast E;
    public boolean F;
    public Drawable G;
    public final Rect H;

    public DeepShortcutTextView(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        this.B = new Rect();
        this.D = false;
        this.H = new Rect();
        Resources resources = getResources();
        this.C = (resources.getDimensionPixelSize(2131165363) / 2) + resources.getDimensionPixelSize(2131165362) + resources.getDimensionPixelSize(2131166356);
        W(true);
        N(true);
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void C(Canvas canvas) {
    }

    @Override // com.android.launcher3.BubbleTextView
    public final boolean Q(float f11, float f12) {
        this.D = this.B.contains((int) f11, (int) f12);
        return false;
    }

    public final void V() {
        if (this.G == null) {
            return;
        }
        int measuredWidth = getMeasuredWidth();
        int paddingStart = this.C;
        int paddingStart2 = (measuredWidth - paddingStart) - getPaddingStart();
        int intrinsicHeight = this.G.getIntrinsicHeight();
        Rect rect = this.H;
        rect.set(0, 0, paddingStart2, intrinsicHeight);
        if (!g3.p(getResources())) {
            paddingStart = getPaddingStart();
        }
        rect.offset(paddingStart, (int) ((getMeasuredHeight() - this.G.getIntrinsicHeight()) / 2.0f));
        this.G.setBounds(rect);
    }

    public final void W(boolean z11) {
        if (z11 == this.F) {
            return;
        }
        this.F = z11;
        if (z11) {
            this.G = getContext().getDrawable(2131231246);
            V();
        } else {
            this.G = null;
        }
        invalidate();
    }

    @Override // com.android.launcher3.BubbleTextView, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        if (this.F) {
            this.G.draw(canvas);
        } else {
            super.onDraw(canvas);
        }
    }

    @Override // com.android.launcher3.BubbleTextView, android.widget.TextView, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        int i12 = this.C;
        int measuredHeight = getMeasuredHeight();
        Rect rect = this.B;
        rect.set(0, 0, i12, measuredHeight);
        if (!g3.p(getResources())) {
            rect.offset(getMeasuredWidth() - rect.width(), 0);
        }
        V();
    }

    @Override // android.view.View
    public final boolean performClick() {
        if (!this.D) {
            return super.performClick();
        }
        Toast toast = this.E;
        if (toast != null) {
            toast.cancel();
        }
        Toast toastMakeText = Toast.makeText(getContext().getApplicationContext(), g3.x(getContext().getString(2132018108), getContext().getText(2132018109)), 0);
        this.E = toastMakeText;
        toastMakeText.show();
        return true;
    }

    @Override // android.view.View
    public final void setPressed(boolean z11) {
        super.setPressed(z11);
        ViewParent parent = getParent();
        if (parent instanceof DeepShortcutView) {
            DeepShortcutView deepShortcutView = (DeepShortcutView) parent;
            if (deepShortcutView.isPressed() != z11) {
                deepShortcutView.setPressed(z11);
            }
        }
    }

    @Override // android.widget.TextView
    public final void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        super.setText(charSequence, bufferType);
        if (TextUtils.isEmpty(charSequence)) {
            return;
        }
        W(false);
    }

    @Override // com.android.launcher3.BubbleTextView
    public final void t(Drawable drawable) {
    }
}
