package com.bytedance.adsdk.ugeno.yoga.zb;

import android.view.View;
import android.view.ViewGroup;
import com.bytedance.adsdk.ugeno.yoga.ea;
import com.bytedance.adsdk.ugeno.yoga.jc;
import com.bytedance.adsdk.ugeno.yoga.ul;
import com.bytedance.adsdk.ugeno.yoga.zb.sya;

/* loaded from: classes2.dex */
public class zb extends ViewGroup {
    @Override // android.view.ViewGroup
    public void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (view instanceof zb) {
            throw null;
        }
        jc jcVarYcx = ea.ycx();
        sya.ycx(new sya.ycx(layoutParams), jcVarYcx, view);
        jcVarYcx.ycx(view);
        jcVarYcx.ycx((ul) new sya.zb());
        throw null;
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof sya.ycx;
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new sya.ycx(-1, -1);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new sya.ycx(layoutParams);
    }

    public jc getYogaNode() {
        throw null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        throw new RuntimeException("Attempting to layout a VirtualYogaLayout");
    }
}
