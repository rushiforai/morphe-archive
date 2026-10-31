package com.teslacoilsw.launcher.widget;

import a5.a1;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import java.util.WeakHashMap;
import kotlin.Metadata;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0017\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/widget/DumbGridLayout;", "Landroid/view/ViewGroup;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public class DumbGridLayout extends ViewGroup {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f46399a;

    /* renamed from: b, reason: collision with root package name */
    public int f46400b;

    /* renamed from: c, reason: collision with root package name */
    public int f46401c;

    /* renamed from: d, reason: collision with root package name */
    public final int f46402d;

    /* renamed from: e, reason: collision with root package name */
    public int f46403e;

    public DumbGridLayout(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46401c = -1;
        this.f46403e = -1;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80161j);
        try {
            j(typedArrayObtainStyledAttributes.getInt(0, -1));
            this.f46399a = typedArrayObtainStyledAttributes.getBoolean(1, true);
            this.f46402d = typedArrayObtainStyledAttributes.getInt(2, 8388659);
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public final int i() {
        int childCount = getChildCount();
        int i5 = 0;
        for (int i11 = 0; i11 < childCount; i11++) {
            if (getChildAt(i11).getVisibility() != 8) {
                i5++;
            }
        }
        return i5;
    }

    public final void j(int i5) {
        this.f46400b = i5;
        if (isAttachedToWindow()) {
            requestLayout();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        if (getChildCount() > 0) {
            int measuredWidth = getChildAt(0).getMeasuredWidth();
            int measuredHeight = getChildAt(0).getMeasuredHeight();
            int i14 = i();
            int measuredWidth2 = getMeasuredWidth();
            int i15 = this.f46400b;
            if (i15 == -1) {
                i15 = measuredWidth2 / measuredWidth;
            } else if (this.f46399a && i() % i15 == 1) {
                i15++;
            }
            int iCeil = (int) Math.ceil(i14 / i15);
            float width = (((getWidth() - getPaddingLeft()) - getPaddingRight()) - (i15 * measuredWidth)) / (i15 - 1);
            int height = ((getHeight() - getPaddingTop()) - getPaddingBottom()) - (iCeil * measuredHeight);
            int i16 = iCeil - 1;
            float f11 = height / i16;
            int childCount = getChildCount();
            int i17 = 0;
            for (int i18 = 0; i18 < childCount; i18++) {
                View childAt = getChildAt(i18);
                if (childAt.getVisibility() != 8) {
                    childAt.getLayoutParams();
                    int i19 = this.f46402d;
                    int i21 = (i19 & 48) == 48 ? i17 / i15 : i16 - (i17 / i15);
                    WeakHashMap weakHashMap = a1.f250a;
                    int paddingLeft = getPaddingLeft() + ((int) ((measuredWidth + width) * ((Gravity.getAbsoluteGravity(i19, getLayoutDirection()) & 3) == 3 ? i17 % i15 : r3 - (i17 % i15))));
                    int paddingTop = getPaddingTop() + ((int) ((measuredHeight + f11) * i21));
                    childAt.layout(paddingLeft, paddingTop, paddingLeft + measuredWidth, paddingTop + measuredHeight);
                    i17++;
                }
            }
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        int size = View.MeasureSpec.getSize(i5);
        int mode = View.MeasureSpec.getMode(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        int mode2 = View.MeasureSpec.getMode(i11);
        if (getChildCount() <= 0) {
            setMeasuredDimension(0, 0);
            return;
        }
        View childAt = getChildAt(0);
        int measuredWidth = this.f46403e;
        if (measuredWidth < 0) {
            measuredWidth = childAt.getLayoutParams().width;
        }
        int measuredHeight = childAt.getLayoutParams().height;
        if (measuredHeight <= 0 || measuredWidth <= 0) {
            childAt.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth, Integer.MIN_VALUE), View.MeasureSpec.makeMeasureSpec(measuredHeight, Integer.MIN_VALUE));
            if (measuredHeight <= 0) {
                measuredHeight = childAt.getMeasuredHeight();
            }
            if (measuredWidth == -1) {
                measuredWidth = ((size - getPaddingLeft()) - getPaddingRight()) / this.f46400b;
            } else if (measuredHeight == -2) {
                measuredWidth = childAt.getMeasuredWidth();
            }
        }
        int childCount = getChildCount();
        for (int i12 = 0; i12 < childCount; i12++) {
            getChildAt(i12).measure(View.MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824));
        }
        int i13 = this.f46400b;
        if (i13 == -1) {
            i13 = size / measuredWidth;
        } else if (this.f46399a && i() % i13 == 1) {
            i13++;
        }
        if (mode != 1073741824) {
            size = measuredWidth * i13;
        }
        if (mode2 != 1073741824) {
            size2 = getPaddingBottom() + getPaddingTop() + (measuredHeight * Math.max(this.f46401c, (int) Math.ceil(i() / i13)));
        }
        setMeasuredDimension(size, size2);
    }
}
