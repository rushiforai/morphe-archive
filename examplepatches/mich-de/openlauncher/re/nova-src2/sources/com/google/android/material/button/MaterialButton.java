package com.google.android.material.button;

import a5.a1;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.Layout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.Checkable;
import android.widget.CompoundButton;
import androidx.appcompat.widget.AppCompatButton;
import androidx.customview.view.AbsSavedState;
import b.u4;
import bk.f;
import bk.g;
import bk.u;
import com.google.android.gms.internal.consent_sdk.k0;
import e10.z2;
import gu.j;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.WeakHashMap;
import ps.f0;
import r.m;
import tj.i;

/* loaded from: classes3.dex */
public class MaterialButton extends AppCompatButton implements Checkable, u {

    /* renamed from: r, reason: collision with root package name */
    public static final int[] f34116r = {16842911};

    /* renamed from: s, reason: collision with root package name */
    public static final int[] f34117s = {16842912};

    /* renamed from: d, reason: collision with root package name */
    public final hj.a f34118d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkedHashSet f34119e;

    /* renamed from: f, reason: collision with root package name */
    public j f34120f;

    /* renamed from: g, reason: collision with root package name */
    public final PorterDuff.Mode f34121g;

    /* renamed from: h, reason: collision with root package name */
    public final ColorStateList f34122h;

    /* renamed from: i, reason: collision with root package name */
    public Drawable f34123i;

    /* renamed from: j, reason: collision with root package name */
    public String f34124j;

    /* renamed from: k, reason: collision with root package name */
    public final int f34125k;

    /* renamed from: l, reason: collision with root package name */
    public int f34126l;

    /* renamed from: m, reason: collision with root package name */
    public int f34127m;
    public final int n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f34128p;

    /* renamed from: q, reason: collision with root package name */
    public final int f34129q;

    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public boolean f34130c;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f34130c = parcel.readInt() == 1;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f34130c ? 1 : 0);
        }
    }

    public MaterialButton(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 2130969579);
    }

    public final boolean a() {
        hj.a aVar = this.f34118d;
        return (aVar == null || aVar.o) ? false : true;
    }

    public final void b() {
        int i5 = this.f34129q;
        if (i5 == 1 || i5 == 2) {
            setCompoundDrawablesRelative(this.f34123i, null, null, null);
            return;
        }
        if (i5 == 3 || i5 == 4) {
            setCompoundDrawablesRelative(null, null, this.f34123i, null);
        } else if (i5 == 16 || i5 == 32) {
            setCompoundDrawablesRelative(null, this.f34123i, null, null);
        }
    }

    @Override // bk.u
    public final void c(bk.j jVar) {
        if (!a()) {
            throw new IllegalStateException("Attempted to set ShapeAppearanceModel on a MaterialButton which has an overwritten background.");
        }
        this.f34118d.c(jVar);
    }

    public final void d(ColorStateList colorStateList) {
        if (!a()) {
            m mVar = this.f13754a;
            if (mVar != null) {
                mVar.h(colorStateList);
                return;
            }
            return;
        }
        hj.a aVar = this.f34118d;
        if (aVar.f59872j != colorStateList) {
            aVar.f59872j = colorStateList;
            if (aVar.b(false) != null) {
                aVar.b(false).setTintList(aVar.f59872j);
            }
        }
    }

    public final void e(PorterDuff.Mode mode) {
        if (!a()) {
            m mVar = this.f13754a;
            if (mVar != null) {
                mVar.i(mode);
                return;
            }
            return;
        }
        hj.a aVar = this.f34118d;
        if (aVar.f59871i != mode) {
            aVar.f59871i = mode;
            if (aVar.b(false) == null || aVar.f59871i == null) {
                return;
            }
            aVar.b(false).setTintMode(aVar.f59871i);
        }
    }

    public final void f(boolean z11) {
        Drawable drawable = this.f34123i;
        if (drawable != null) {
            Drawable drawableMutate = drawable.mutate();
            this.f34123i = drawableMutate;
            drawableMutate.setTintList(this.f34122h);
            PorterDuff.Mode mode = this.f34121g;
            if (mode != null) {
                this.f34123i.setTintMode(mode);
            }
            int intrinsicHeight = this.f34125k;
            int intrinsicWidth = intrinsicHeight != 0 ? intrinsicHeight : this.f34123i.getIntrinsicWidth();
            if (intrinsicHeight == 0) {
                intrinsicHeight = this.f34123i.getIntrinsicHeight();
            }
            Drawable drawable2 = this.f34123i;
            int i5 = this.f34126l;
            int i11 = this.f34127m;
            drawable2.setBounds(i5, i11, intrinsicWidth + i5, intrinsicHeight + i11);
            this.f34123i.setVisible(true, z11);
        }
        if (z11) {
            b();
            return;
        }
        Drawable[] compoundDrawablesRelative = getCompoundDrawablesRelative();
        Drawable drawable3 = compoundDrawablesRelative[0];
        Drawable drawable4 = compoundDrawablesRelative[1];
        Drawable drawable5 = compoundDrawablesRelative[2];
        int i12 = this.f34129q;
        if (((i12 == 1 || i12 == 2) && drawable3 != this.f34123i) || (((i12 == 3 || i12 == 4) && drawable5 != this.f34123i) || ((i12 == 16 || i12 == 32) && drawable4 != this.f34123i))) {
            b();
        }
    }

    public final void g(int i5, int i11) {
        Layout.Alignment alignment;
        int iMin;
        if (this.f34123i == null || getLayout() == null) {
            return;
        }
        int i12 = this.n;
        int intrinsicWidth = this.f34125k;
        int i13 = this.f34129q;
        if (i13 != 1 && i13 != 2 && i13 != 3 && i13 != 4) {
            if (i13 == 16 || i13 == 32) {
                this.f34126l = 0;
                if (i13 == 16) {
                    this.f34127m = 0;
                    f(false);
                    return;
                }
                if (intrinsicWidth == 0) {
                    intrinsicWidth = this.f34123i.getIntrinsicHeight();
                }
                if (getLineCount() > 1) {
                    iMin = getLayout().getHeight();
                } else {
                    TextPaint paint = getPaint();
                    String string = getText().toString();
                    if (getTransformationMethod() != null) {
                        string = getTransformationMethod().getTransformation(string, this).toString();
                    }
                    Rect rect = new Rect();
                    paint.getTextBounds(string, 0, string.length(), rect);
                    iMin = Math.min(rect.height(), getLayout().getHeight());
                }
                int iMax = Math.max(0, (((((i11 - iMin) - getPaddingTop()) - intrinsicWidth) - i12) - getPaddingBottom()) / 2);
                if (this.f34127m != iMax) {
                    this.f34127m = iMax;
                    f(false);
                    return;
                }
                return;
            }
            return;
        }
        this.f34127m = 0;
        int textAlignment = getTextAlignment();
        if (textAlignment != 1) {
            alignment = (textAlignment == 6 || textAlignment == 3) ? Layout.Alignment.ALIGN_OPPOSITE : textAlignment != 4 ? Layout.Alignment.ALIGN_NORMAL : Layout.Alignment.ALIGN_CENTER;
        } else {
            int gravity = getGravity() & 8388615;
            alignment = gravity != 1 ? (gravity == 5 || gravity == 8388613) ? Layout.Alignment.ALIGN_OPPOSITE : Layout.Alignment.ALIGN_NORMAL : Layout.Alignment.ALIGN_CENTER;
        }
        if (i13 == 1 || i13 == 3 || ((i13 == 2 && alignment == Layout.Alignment.ALIGN_NORMAL) || (i13 == 4 && alignment == Layout.Alignment.ALIGN_OPPOSITE))) {
            this.f34126l = 0;
            f(false);
            return;
        }
        if (intrinsicWidth == 0) {
            intrinsicWidth = this.f34123i.getIntrinsicWidth();
        }
        int lineCount = getLineCount();
        float fMax = 0.0f;
        for (int i14 = 0; i14 < lineCount; i14++) {
            fMax = Math.max(fMax, getLayout().getLineWidth(i14));
        }
        int iCeil = i5 - ((int) Math.ceil(fMax));
        WeakHashMap weakHashMap = a1.f250a;
        int paddingEnd = (((iCeil - getPaddingEnd()) - intrinsicWidth) - i12) - getPaddingStart();
        if (alignment == Layout.Alignment.ALIGN_CENTER) {
            paddingEnd /= 2;
        }
        if ((getLayoutDirection() == 1) != (i13 == 4)) {
            paddingEnd = -paddingEnd;
        }
        if (this.f34126l != paddingEnd) {
            this.f34126l = paddingEnd;
            f(false);
        }
    }

    @Override // android.view.View
    public final ColorStateList getBackgroundTintList() {
        if (a()) {
            return this.f34118d.f59872j;
        }
        m mVar = this.f13754a;
        if (mVar != null) {
            return mVar.b();
        }
        return null;
    }

    @Override // android.view.View
    public final PorterDuff.Mode getBackgroundTintMode() {
        if (a()) {
            return this.f34118d.f59871i;
        }
        m mVar = this.f13754a;
        if (mVar != null) {
            return mVar.c();
        }
        return null;
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return this.o;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (a()) {
            k0.E(this, this.f34118d.b(false));
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 2);
        hj.a aVar = this.f34118d;
        if (aVar != null && aVar.f59877q) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f34116r);
        }
        if (this.o) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f34117s);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        String name;
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        if (TextUtils.isEmpty(this.f34124j)) {
            hj.a aVar = this.f34118d;
            name = ((aVar == null || !aVar.f59877q) ? Button.class : CompoundButton.class).getName();
        } else {
            name = this.f34124j;
        }
        accessibilityEvent.setClassName(name);
        accessibilityEvent.setChecked(this.o);
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        String name;
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        boolean zIsEmpty = TextUtils.isEmpty(this.f34124j);
        hj.a aVar = this.f34118d;
        if (zIsEmpty) {
            name = ((aVar == null || !aVar.f59877q) ? Button.class : CompoundButton.class).getName();
        } else {
            name = this.f34124j;
        }
        accessibilityNodeInfo.setClassName(name);
        accessibilityNodeInfo.setCheckable(aVar != null && aVar.f59877q);
        accessibilityNodeInfo.setChecked(this.o);
        accessibilityNodeInfo.setClickable(isClickable());
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.widget.TextView, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        g(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.f14272a);
        setChecked(savedState.f34130c);
    }

    @Override // android.widget.TextView, android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.f34130c = this.o;
        return savedState;
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.widget.TextView
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        super.onTextChanged(charSequence, i5, i11, i12);
        g(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.view.View
    public final boolean performClick() {
        if (this.f34118d.f59878r) {
            toggle();
        }
        return super.performClick();
    }

    @Override // android.view.View
    public final void refreshDrawableState() {
        super.refreshDrawableState();
        if (this.f34123i != null) {
            if (this.f34123i.setState(getDrawableState())) {
                invalidate();
            }
        }
    }

    @Override // android.view.View
    public final void setBackground(Drawable drawable) {
        setBackgroundDrawable(drawable);
    }

    @Override // android.view.View
    public final void setBackgroundColor(int i5) {
        if (!a()) {
            super.setBackgroundColor(i5);
            return;
        }
        hj.a aVar = this.f34118d;
        if (aVar.b(false) != null) {
            aVar.b(false).setTint(i5);
        }
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        if (!a()) {
            super.setBackgroundDrawable(drawable);
            return;
        }
        if (drawable == getBackground()) {
            getBackground().setState(drawable.getState());
            return;
        }
        Log.w("MaterialButton", "MaterialButton manages its own background to control elevation, shape, color and states. Consider using backgroundTint, shapeAppearance and other attributes where available. A custom background will ignore these attributes and you should consider handling interaction states such as pressed, focused and disabled");
        hj.a aVar = this.f34118d;
        aVar.o = true;
        MaterialButton materialButton = aVar.f59863a;
        materialButton.d(aVar.f59872j);
        materialButton.e(aVar.f59871i);
        super.setBackgroundDrawable(drawable);
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void setBackgroundResource(int i5) {
        setBackgroundDrawable(i5 != 0 ? z2.b0(getContext(), i5) : null);
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) {
        d(colorStateList);
    }

    @Override // android.view.View
    public final void setBackgroundTintMode(PorterDuff.Mode mode) {
        e(mode);
    }

    @Override // android.widget.Checkable
    public final void setChecked(boolean z11) {
        hj.a aVar = this.f34118d;
        if (aVar == null || !aVar.f59877q || !isEnabled() || this.o == z11) {
            return;
        }
        this.o = z11;
        refreshDrawableState();
        if (getParent() instanceof MaterialButtonToggleGroup) {
            MaterialButtonToggleGroup materialButtonToggleGroup = (MaterialButtonToggleGroup) getParent();
            boolean z12 = this.o;
            if (!materialButtonToggleGroup.f34137f) {
                materialButtonToggleGroup.b(getId(), z12);
            }
        }
        if (this.f34128p) {
            return;
        }
        this.f34128p = true;
        Iterator it = this.f34119e.iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        this.f34128p = false;
    }

    @Override // android.view.View
    public final void setElevation(float f11) {
        super.setElevation(f11);
        if (a()) {
            this.f34118d.b(false).k(f11);
        }
    }

    @Override // android.view.View
    public final void setPressed(boolean z11) {
        j jVar = this.f34120f;
        if (jVar != null) {
            ((MaterialButtonToggleGroup) jVar.f57836b).invalidate();
        }
        super.setPressed(z11);
    }

    @Override // android.view.View
    public final void setTextAlignment(int i5) {
        super.setTextAlignment(i5);
        g(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        setChecked(!this.o);
    }

    public MaterialButton(Context context, AttributeSet attributeSet, int i5) {
        boolean z11;
        boolean z12;
        super(hk.a.a(context, attributeSet, i5, 2132083958), attributeSet, i5);
        this.f34119e = new LinkedHashSet();
        this.o = false;
        this.f34128p = false;
        Context context2 = getContext();
        TypedArray typedArrayF = i.f(context2, attributeSet, bj.a.f17930s, i5, 2132083958, new int[0]);
        int dimensionPixelSize = typedArrayF.getDimensionPixelSize(12, 0);
        this.n = dimensionPixelSize;
        int i11 = typedArrayF.getInt(15, -1);
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        this.f34121g = i.g(i11, mode);
        this.f34122h = f0.m(getContext(), typedArrayF, 14);
        this.f34123i = f0.p(getContext(), typedArrayF, 10);
        this.f34129q = typedArrayF.getInteger(11, 1);
        this.f34125k = typedArrayF.getDimensionPixelSize(13, 0);
        hj.a aVar = new hj.a(this, bk.j.c(context2, attributeSet, i5, 2132083958).a());
        this.f34118d = aVar;
        aVar.f59865c = typedArrayF.getDimensionPixelOffset(1, 0);
        aVar.f59866d = typedArrayF.getDimensionPixelOffset(2, 0);
        aVar.f59867e = typedArrayF.getDimensionPixelOffset(3, 0);
        aVar.f59868f = typedArrayF.getDimensionPixelOffset(4, 0);
        if (typedArrayF.hasValue(8)) {
            int dimensionPixelSize2 = typedArrayF.getDimensionPixelSize(8, -1);
            aVar.f59869g = dimensionPixelSize2;
            float f11 = dimensionPixelSize2;
            bk.j jVarF = aVar.f59864b.f();
            jVarF.f18007e = new bk.a(f11);
            jVarF.f18008f = new bk.a(f11);
            jVarF.f18009g = new bk.a(f11);
            jVarF.f18010h = new bk.a(f11);
            aVar.c(jVarF.a());
            aVar.f59876p = true;
        }
        aVar.f59870h = typedArrayF.getDimensionPixelSize(20, 0);
        aVar.f59871i = i.g(typedArrayF.getInt(7, -1), mode);
        aVar.f59872j = f0.m(getContext(), typedArrayF, 6);
        aVar.f59873k = f0.m(getContext(), typedArrayF, 19);
        aVar.f59874l = f0.m(getContext(), typedArrayF, 16);
        aVar.f59877q = typedArrayF.getBoolean(5, false);
        aVar.f59880t = typedArrayF.getDimensionPixelSize(9, 0);
        aVar.f59878r = typedArrayF.getBoolean(21, true);
        WeakHashMap weakHashMap = a1.f250a;
        int paddingStart = getPaddingStart();
        int paddingTop = getPaddingTop();
        int paddingEnd = getPaddingEnd();
        int paddingBottom = getPaddingBottom();
        if (typedArrayF.hasValue(0)) {
            aVar.o = true;
            d(aVar.f59872j);
            e(aVar.f59871i);
            z12 = false;
            z11 = true;
        } else {
            g gVar = new g(aVar.f59864b);
            gVar.j(getContext());
            gVar.setTintList(aVar.f59872j);
            PorterDuff.Mode mode2 = aVar.f59871i;
            if (mode2 != null) {
                gVar.setTintMode(mode2);
            }
            float f12 = aVar.f59870h;
            ColorStateList colorStateList = aVar.f59873k;
            gVar.f17980a.f17973j = f12;
            gVar.invalidateSelf();
            f fVar = gVar.f17980a;
            if (fVar.f17967d != colorStateList) {
                fVar.f17967d = colorStateList;
                gVar.onStateChange(gVar.getState());
            }
            g gVar2 = new g(aVar.f59864b);
            gVar2.setTint(0);
            float f13 = aVar.f59870h;
            int iM = aVar.n ? k0.m(2130968977, this) : 0;
            z11 = true;
            gVar2.f17980a.f17973j = f13;
            gVar2.invalidateSelf();
            ColorStateList colorStateListValueOf = ColorStateList.valueOf(iM);
            f fVar2 = gVar2.f17980a;
            if (fVar2.f17967d != colorStateListValueOf) {
                fVar2.f17967d = colorStateListValueOf;
                gVar2.onStateChange(gVar2.getState());
            }
            g gVar3 = new g(aVar.f59864b);
            aVar.f59875m = gVar3;
            gVar3.setTint(-1);
            RippleDrawable rippleDrawable = new RippleDrawable(zj.a.a(aVar.f59874l), new InsetDrawable((Drawable) new LayerDrawable(new Drawable[]{gVar2, gVar}), aVar.f59865c, aVar.f59867e, aVar.f59866d, aVar.f59868f), aVar.f59875m);
            aVar.f59879s = rippleDrawable;
            super.setBackgroundDrawable(rippleDrawable);
            z12 = false;
            g gVarB = aVar.b(false);
            if (gVarB != null) {
                gVarB.k(aVar.f59880t);
                gVarB.setState(getDrawableState());
            }
        }
        setPaddingRelative(paddingStart + aVar.f59865c, paddingTop + aVar.f59867e, paddingEnd + aVar.f59866d, paddingBottom + aVar.f59868f);
        typedArrayF.recycle();
        setCompoundDrawablePadding(dimensionPixelSize);
        f(this.f34123i != null ? z11 : z12);
    }
}
