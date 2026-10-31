package com.android.launcher3;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Checkable;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class CheckableFrameLayout extends FrameLayout implements Checkable {

    /* renamed from: b, reason: collision with root package name */
    public static final int[] f20921b = {16842912};

    /* renamed from: a, reason: collision with root package name */
    public boolean f20922a;

    public CheckableFrameLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return this.f20922a;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 1);
        if (this.f20922a) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f20921b);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // android.widget.Checkable
    public final void setChecked(boolean z11) {
        if (z11 != this.f20922a) {
            this.f20922a = z11;
            refreshDrawableState();
        }
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        setChecked(!this.f20922a);
    }
}
