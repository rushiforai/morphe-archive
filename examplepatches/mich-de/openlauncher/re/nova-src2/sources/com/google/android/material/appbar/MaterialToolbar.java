package com.google.android.material.appbar;

import a5.a1;
import a5.s0;
import ai.r2;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.appcompat.widget.Toolbar;
import bk.g;
import com.google.android.gms.internal.consent_sdk.k0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.WeakHashMap;
import q.k;
import r.s;
import tj.i;

/* loaded from: classes3.dex */
public class MaterialToolbar extends Toolbar {

    /* renamed from: b0, reason: collision with root package name */
    public static final ImageView.ScaleType[] f34059b0 = {ImageView.ScaleType.MATRIX, ImageView.ScaleType.FIT_XY, ImageView.ScaleType.FIT_START, ImageView.ScaleType.FIT_CENTER, ImageView.ScaleType.FIT_END, ImageView.ScaleType.CENTER, ImageView.ScaleType.CENTER_CROP, ImageView.ScaleType.CENTER_INSIDE};
    public final Integer T;
    public final boolean U;
    public final boolean V;
    public final ImageView.ScaleType W;

    /* renamed from: a0, reason: collision with root package name */
    public final Boolean f34060a0;

    public MaterialToolbar(Context context, AttributeSet attributeSet) {
        super(hk.a.a(context, attributeSet, 2130970240, 2132084058), attributeSet, 0);
        Context context2 = getContext();
        TypedArray typedArrayF = i.f(context2, attributeSet, bj.a.D, 2130970240, 2132084058, new int[0]);
        if (typedArrayF.hasValue(2)) {
            this.T = Integer.valueOf(typedArrayF.getColor(2, -1));
            s sVar = this.f13803d;
            Drawable drawable = sVar != null ? sVar.getDrawable() : null;
            if (drawable != null) {
                x(drawable);
            }
        }
        this.U = typedArrayF.getBoolean(4, false);
        this.V = typedArrayF.getBoolean(3, false);
        int i5 = typedArrayF.getInt(1, -1);
        if (i5 >= 0) {
            ImageView.ScaleType[] scaleTypeArr = f34059b0;
            if (i5 < scaleTypeArr.length) {
                this.W = scaleTypeArr[i5];
            }
        }
        if (typedArrayF.hasValue(0)) {
            this.f34060a0 = Boolean.valueOf(typedArrayF.getBoolean(0, false));
        }
        typedArrayF.recycle();
        Drawable background = getBackground();
        ColorStateList colorStateListValueOf = background == null ? ColorStateList.valueOf(0) : k0.o(background);
        if (colorStateListValueOf != null) {
            g gVar = new g();
            gVar.l(colorStateListValueOf);
            gVar.j(context2);
            WeakHashMap weakHashMap = a1.f250a;
            gVar.k(s0.e(this));
            setBackground(gVar);
        }
    }

    public final void E(TextView textView, Pair pair) {
        int measuredWidth = getMeasuredWidth();
        int measuredWidth2 = textView.getMeasuredWidth();
        int i5 = (measuredWidth / 2) - (measuredWidth2 / 2);
        int i11 = measuredWidth2 + i5;
        int iMax = Math.max(Math.max(((Integer) pair.first).intValue() - i5, 0), Math.max(i11 - ((Integer) pair.second).intValue(), 0));
        if (iMax > 0) {
            i5 += iMax;
            i11 -= iMax;
            textView.measure(View.MeasureSpec.makeMeasureSpec(i11 - i5, 1073741824), textView.getMeasuredHeightAndState());
        }
        textView.layout(i5, textView.getTop(), i11, textView.getBottom());
    }

    @Override // androidx.appcompat.widget.Toolbar
    public final void o(int i5) {
        k kVarM = m();
        if (kVarM != null) {
            kVarM.w();
        }
        super.o(i5);
        if (kVarM != null) {
            kVarM.v();
        }
    }

    @Override // androidx.appcompat.widget.Toolbar, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        Drawable background = getBackground();
        if (background instanceof g) {
            k0.E(this, (g) background);
        }
    }

    @Override // androidx.appcompat.widget.Toolbar, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        ImageView imageView;
        Drawable drawable;
        super.onLayout(z11, i5, i11, i12, i13);
        r2 r2Var = i.f89396c;
        int i14 = 0;
        ImageView imageView2 = null;
        boolean z12 = this.V;
        boolean z13 = this.U;
        if (z13 || z12) {
            ArrayList arrayListD = i.d(this, this.f13821x);
            TextView textView = arrayListD.isEmpty() ? null : (TextView) Collections.min(arrayListD, r2Var);
            ArrayList arrayListD2 = i.d(this, this.f13822y);
            TextView textView2 = arrayListD2.isEmpty() ? null : (TextView) Collections.max(arrayListD2, r2Var);
            if (textView != null || textView2 != null) {
                int measuredWidth = getMeasuredWidth();
                int i15 = measuredWidth / 2;
                int paddingLeft = getPaddingLeft();
                int paddingRight = measuredWidth - getPaddingRight();
                for (int i16 = 0; i16 < getChildCount(); i16++) {
                    View childAt = getChildAt(i16);
                    if (childAt.getVisibility() != 8 && childAt != textView && childAt != textView2) {
                        if (childAt.getRight() < i15 && childAt.getRight() > paddingLeft) {
                            paddingLeft = childAt.getRight();
                        }
                        if (childAt.getLeft() > i15 && childAt.getLeft() < paddingRight) {
                            paddingRight = childAt.getLeft();
                        }
                    }
                }
                Pair pair = new Pair(Integer.valueOf(paddingLeft), Integer.valueOf(paddingRight));
                if (z13 && textView != null) {
                    E(textView, pair);
                }
                if (z12 && textView2 != null) {
                    E(textView2, pair);
                }
            }
        }
        AppCompatImageView appCompatImageView = this.f13804e;
        Drawable drawable2 = appCompatImageView != null ? appCompatImageView.getDrawable() : null;
        if (drawable2 != null) {
            while (true) {
                if (i14 >= getChildCount()) {
                    break;
                }
                View childAt2 = getChildAt(i14);
                if ((childAt2 instanceof ImageView) && (drawable = (imageView = (ImageView) childAt2).getDrawable()) != null && drawable.getConstantState() != null && drawable.getConstantState().equals(drawable2.getConstantState())) {
                    imageView2 = imageView;
                    break;
                }
                i14++;
            }
        }
        if (imageView2 != null) {
            Boolean bool = this.f34060a0;
            if (bool != null) {
                imageView2.setAdjustViewBounds(bool.booleanValue());
            }
            ImageView.ScaleType scaleType = this.W;
            if (scaleType != null) {
                imageView2.setScaleType(scaleType);
            }
        }
    }

    @Override // android.view.View
    public final void setElevation(float f11) {
        super.setElevation(f11);
        Drawable background = getBackground();
        if (background instanceof g) {
            ((g) background).k(f11);
        }
    }

    @Override // androidx.appcompat.widget.Toolbar
    public final void x(Drawable drawable) {
        if (drawable != null && this.T != null) {
            drawable = drawable.mutate();
            drawable.setTint(this.T.intValue());
        }
        super.x(drawable);
    }
}
