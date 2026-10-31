package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;

/* renamed from: com.facebook.ads.redexgen.X.sa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2548sa extends ViewGroup {
    public static final int A01 = (int) (AbstractC2385px.A02 * 8.0f);
    public int A00;

    public C2548sa(C0958Hi c0958Hi) {
        super(c0958Hi);
        setMotionEventSplittingEnabled(false);
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000e */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int i14 = i12 - i5;
        int paddingLeft = getPaddingLeft();
        int childHeight = getPaddingTop();
        for (int childWidth = 0; childWidth < width; childWidth++) {
            View child = getChildAt(childWidth);
            int i15 = child.getMeasuredWidth();
            int yPos = child.getMeasuredHeight();
            int width = paddingLeft + i15;
            if (width > i14) {
                paddingLeft = getPaddingLeft();
                int width2 = this.A00;
                childHeight += width2;
            }
            int xPos = paddingLeft + i15;
            int width3 = childHeight + yPos;
            child.layout(paddingLeft, childHeight, xPos, width3);
            int width4 = A01;
            paddingLeft += width4 + i15;
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:7:0x0033 */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        int lines = (View.MeasureSpec.getSize(i5) - getPaddingLeft()) - getPaddingRight();
        int size = View.MeasureSpec.getSize(i11);
        int width = getPaddingTop();
        int i12 = size - width;
        int width2 = getPaddingBottom();
        int height = i12 - width2;
        int childWidth = getPaddingLeft();
        int iMax = 0;
        int childHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(height, Integer.MIN_VALUE);
        int width3 = getChildCount();
        int i13 = width3 > 0 ? 1 : 0;
        for (int lineHeight = 0; lineHeight < width; lineHeight++) {
            View childAt = getChildAt(lineHeight);
            int width4 = View.MeasureSpec.makeMeasureSpec(lines, Integer.MIN_VALUE);
            childAt.measure(width4, childHeightMeasureSpec);
            int xPos = childAt.getMeasuredWidth();
            int height2 = childAt.getMeasuredHeight();
            int width5 = A01;
            iMax = Math.max(iMax, height2 + width5);
            int width6 = childWidth + xPos;
            if (width6 > lines) {
                i13++;
                childWidth = getPaddingLeft();
            }
            int width7 = A01;
            childWidth += width7 + xPos;
        }
        this.A00 = iMax;
        int height3 = this.A00;
        int width8 = A01;
        setMeasuredDimension(lines, (height3 * i13) + width8);
    }
}
