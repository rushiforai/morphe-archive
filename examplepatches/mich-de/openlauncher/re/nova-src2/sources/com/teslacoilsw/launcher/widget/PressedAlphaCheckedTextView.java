package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Checkable;
import android.widget.TextView;
import l30.q;

/* loaded from: classes.dex */
public class PressedAlphaCheckedTextView extends TextView implements Checkable {

    /* renamed from: b, reason: collision with root package name */
    public static final int[] f46455b = {16842912};

    /* renamed from: a, reason: collision with root package name */
    public boolean f46456a;

    public PressedAlphaCheckedTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return this.f46456a;
    }

    @Override // android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 1);
        if (this.f46456a) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f46455b);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // android.widget.Checkable
    public final void setChecked(boolean z11) {
        if (this.f46456a != z11) {
            this.f46456a = z11;
            refreshDrawableState();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            drawable = new q(drawable);
        }
        if (drawable2 != null) {
            drawable2 = new q(drawable2);
        }
        if (drawable3 != null) {
            drawable3 = new q(drawable3);
        }
        if (drawable4 != null) {
            drawable4 = new q(drawable4);
        }
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        setChecked(!this.f46456a);
    }
}
