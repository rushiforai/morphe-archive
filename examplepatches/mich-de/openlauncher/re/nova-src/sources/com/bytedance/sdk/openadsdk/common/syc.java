package com.bytedance.sdk.openadsdk.common;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import android.view.ViewGroup;

@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class syc extends View {
    private final ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private View f24719zb;

    public interface ycx {
        View ycx(Context context);
    }

    public syc(Context context, ycx ycxVar) {
        super(context);
        this.ycx = ycxVar;
        ycx();
    }

    private void ycx() {
        setVisibility(8);
        setWillNotDraw(true);
    }

    private View zb() {
        ycx ycxVar;
        if (this.f24719zb == null && (ycxVar = this.ycx) != null) {
            this.f24719zb = ycxVar.ycx(getContext());
            ycx(this.f24719zb, (ViewGroup) getParent());
        }
        return this.f24719zb;
    }

    @Override // android.view.View
    @SuppressLint({"MissingSuperCall"})
    public void dispatchDraw(Canvas canvas) {
    }

    @Override // android.view.View
    @SuppressLint({"MissingSuperCall"})
    public void draw(Canvas canvas) {
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        setMeasuredDimension(0, 0);
    }

    @Override // android.view.View
    public void setVisibility(int i5) {
        View view = this.f24719zb;
        if (view != null) {
            view.setVisibility(i5);
            return;
        }
        super.setVisibility(i5);
        if (i5 == 0 || i5 == 4) {
            zb();
        }
    }

    private void ycx(View view, ViewGroup viewGroup) {
        int iIndexOfChild = viewGroup.indexOfChild(this);
        viewGroup.removeViewInLayout(this);
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams != null) {
            viewGroup.addView(view, iIndexOfChild, layoutParams);
        } else {
            viewGroup.addView(view, iIndexOfChild);
        }
    }
}
