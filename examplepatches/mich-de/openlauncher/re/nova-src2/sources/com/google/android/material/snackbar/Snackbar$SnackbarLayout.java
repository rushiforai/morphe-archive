package com.google.android.material.snackbar;

import a5.a1;
import a5.q0;
import a5.s0;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import bk.g;
import bk.j;
import com.google.android.gms.internal.consent_sdk.k0;
import dk.b;
import dk.c;
import hk.a;
import java.util.WeakHashMap;
import ps.f0;
import tj.i;

/* loaded from: classes3.dex */
public final class Snackbar$SnackbarLayout extends FrameLayout {

    /* renamed from: e, reason: collision with root package name */
    public static final b f34354e = new b(0);

    /* renamed from: a, reason: collision with root package name */
    public final j f34355a;

    /* renamed from: b, reason: collision with root package name */
    public final int f34356b;

    /* renamed from: c, reason: collision with root package name */
    public ColorStateList f34357c;

    /* renamed from: d, reason: collision with root package name */
    public PorterDuff.Mode f34358d;

    /* JADX WARN: Multi-variable type inference failed */
    public Snackbar$SnackbarLayout(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        GradientDrawable gradientDrawable;
        super(a.a(context, attributeSet, 0, 0), attributeSet);
        Context context2 = getContext();
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, bj.a.J);
        if (typedArrayObtainStyledAttributes.hasValue(6)) {
            float dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(6, 0);
            WeakHashMap weakHashMap = a1.f250a;
            s0.k(this, dimensionPixelSize);
        }
        typedArrayObtainStyledAttributes.getInt(2, 0);
        if (typedArrayObtainStyledAttributes.hasValue(8) || typedArrayObtainStyledAttributes.hasValue(9)) {
            this.f34355a = j.c(context2, attributeSet, 0, 0).a();
        }
        float f11 = typedArrayObtainStyledAttributes.getFloat(3, 1.0f);
        setBackgroundTintList(f0.m(context2, typedArrayObtainStyledAttributes, 4));
        setBackgroundTintMode(i.g(typedArrayObtainStyledAttributes.getInt(5, -1), PorterDuff.Mode.SRC_IN));
        typedArrayObtainStyledAttributes.getFloat(1, 1.0f);
        this.f34356b = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, -1);
        typedArrayObtainStyledAttributes.getDimensionPixelSize(7, -1);
        typedArrayObtainStyledAttributes.recycle();
        setOnTouchListener(f34354e);
        setFocusable(true);
        if (getBackground() == null) {
            int iV = k0.v(f11, k0.m(2130968977, this), k0.m(2130968954, this));
            j jVar = this.f34355a;
            if (jVar != null) {
                int i5 = c.f49267a;
                g gVar = new g(jVar);
                gVar.l(ColorStateList.valueOf(iV));
                gradientDrawable = gVar;
            } else {
                Resources resources = getResources();
                int i11 = c.f49267a;
                float dimension = resources.getDimension(2131166249);
                GradientDrawable gradientDrawable2 = new GradientDrawable();
                gradientDrawable2.setShape(0);
                gradientDrawable2.setCornerRadius(dimension);
                gradientDrawable2.setColor(iV);
                gradientDrawable = gradientDrawable2;
            }
            ColorStateList colorStateList = this.f34357c;
            if (colorStateList != null) {
                gradientDrawable.setTintList(colorStateList);
            }
            WeakHashMap weakHashMap2 = a1.f250a;
            setBackgroundDrawable(gradientDrawable);
        }
    }

    public final void a(int i5, int i11) {
        super.onMeasure(i5, i11);
        int i12 = this.f34356b;
        if (i12 <= 0 || getMeasuredWidth() <= i12) {
            return;
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(i12, 1073741824), i11);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        WeakHashMap weakHashMap = a1.f250a;
        q0.c(this);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        a(i5, i11);
        int childCount = getChildCount();
        int measuredWidth = (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
        for (int i12 = 0; i12 < childCount; i12++) {
            View childAt = getChildAt(i12);
            if (childAt.getLayoutParams().width == -1) {
                childAt.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(childAt.getMeasuredHeight(), 1073741824));
            }
        }
    }

    @Override // android.view.View
    public final void setBackground(Drawable drawable) {
        setBackgroundDrawable(drawable);
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        if (drawable != null && this.f34357c != null) {
            drawable = drawable.mutate();
            drawable.setTintList(this.f34357c);
            drawable.setTintMode(this.f34358d);
        }
        super.setBackgroundDrawable(drawable);
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) {
        this.f34357c = colorStateList;
        if (getBackground() != null) {
            Drawable drawableMutate = getBackground().mutate();
            drawableMutate.setTintList(colorStateList);
            drawableMutate.setTintMode(this.f34358d);
            if (drawableMutate != getBackground()) {
                super.setBackgroundDrawable(drawableMutate);
            }
        }
    }

    @Override // android.view.View
    public final void setBackgroundTintMode(PorterDuff.Mode mode) {
        this.f34358d = mode;
        if (getBackground() != null) {
            Drawable drawableMutate = getBackground().mutate();
            drawableMutate.setTintMode(mode);
            if (drawableMutate != getBackground()) {
                super.setBackgroundDrawable(drawableMutate);
            }
        }
    }

    @Override // android.view.View
    public final void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        super.setLayoutParams(layoutParams);
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
            new Rect(marginLayoutParams.leftMargin, marginLayoutParams.topMargin, marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
        }
    }

    @Override // android.view.View
    public final void setOnClickListener(View.OnClickListener onClickListener) {
        setOnTouchListener(onClickListener != null ? null : f34354e);
        super.setOnClickListener(onClickListener);
    }
}
