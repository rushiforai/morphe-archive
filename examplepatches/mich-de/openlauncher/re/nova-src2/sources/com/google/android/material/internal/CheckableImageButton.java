package com.google.android.material.internal;

import a5.a1;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Checkable;
import androidx.customview.view.AbsSavedState;
import com.google.android.material.datepicker.l;
import r.s;

/* loaded from: classes3.dex */
public class CheckableImageButton extends s implements Checkable {

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f34313g = {16842912};

    /* renamed from: d, reason: collision with root package name */
    public boolean f34314d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f34315e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f34316f;

    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public boolean f34317c;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f34317c = parcel.readInt() == 1;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f34317c ? 1 : 0);
        }
    }

    public CheckableImageButton(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969348);
        this.f34315e = true;
        this.f34316f = true;
        a1.k(this, new l(this, 5));
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return this.f34314d;
    }

    @Override // android.widget.ImageView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        return this.f34314d ? View.mergeDrawableStates(super.onCreateDrawableState(i5 + 1), f34313g) : super.onCreateDrawableState(i5);
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.f14272a);
        setChecked(savedState.f34317c);
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.f34317c = this.f34314d;
        return savedState;
    }

    @Override // android.widget.Checkable
    public final void setChecked(boolean z11) {
        if (!this.f34315e || this.f34314d == z11) {
            return;
        }
        this.f34314d = z11;
        refreshDrawableState();
        sendAccessibilityEvent(2048);
    }

    @Override // android.view.View
    public final void setPressed(boolean z11) {
        if (this.f34316f) {
            super.setPressed(z11);
        }
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        setChecked(!this.f34314d);
    }
}
