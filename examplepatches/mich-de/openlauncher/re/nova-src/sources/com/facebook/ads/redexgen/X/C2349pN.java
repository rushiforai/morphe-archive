package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;

/* renamed from: com.facebook.ads.redexgen.X.pN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2349pN {
    public final int[] A00(View view, int i5, int i11) {
        C1961ix c1961ix = (C1961ix) view.getLayoutParams();
        int childHeightSpec = ViewGroup.getChildMeasureSpec(i5, view.getPaddingLeft() + view.getPaddingRight(), c1961ix.width);
        int childWidthSpec = view.getPaddingTop();
        view.measure(childHeightSpec, ViewGroup.getChildMeasureSpec(i11, childWidthSpec + view.getPaddingBottom(), c1961ix.height));
        int childWidthSpec2 = view.getMeasuredWidth();
        int childWidthSpec3 = view.getMeasuredHeight();
        return new int[]{childWidthSpec2 + c1961ix.leftMargin + c1961ix.rightMargin, childWidthSpec3 + c1961ix.bottomMargin + c1961ix.topMargin};
    }
}
