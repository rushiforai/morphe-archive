package com.bytedance.sdk.openadsdk.core.ry.zb.ul;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.adsdk.ugeno.jc.zb.ycx {
    private final com.bytedance.adsdk.ugeno.jc.zb.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.adsdk.ugeno.jc.zb.ycx f26052zb;

    public ycx(Context context) {
        super(context);
        com.bytedance.adsdk.ugeno.jc.zb.ycx ycxVar = new com.bytedance.adsdk.ugeno.jc.zb.ycx(context);
        this.ycx = ycxVar;
        addView(ycxVar, new FrameLayout.LayoutParams(-1, -1));
        com.bytedance.adsdk.ugeno.jc.zb.ycx ycxVar2 = new com.bytedance.adsdk.ugeno.jc.zb.ycx(context);
        this.f26052zb = ycxVar2;
        ycxVar2.setBackgroundColor(0);
        addView(ycxVar2, new FrameLayout.LayoutParams(-1, -1));
    }

    public com.bytedance.adsdk.ugeno.jc.zb.ycx getMarkView() {
        return this.f26052zb;
    }

    public com.bytedance.adsdk.ugeno.jc.zb.ycx getVideoView() {
        return this.ycx;
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener onClickListener) {
        this.f26052zb.setOnClickListener(onClickListener);
    }

    @Override // android.view.View
    @SuppressLint({"ClickableViewAccessibility"})
    public void setOnTouchListener(View.OnTouchListener onTouchListener) {
        this.f26052zb.setOnTouchListener(onTouchListener);
    }
}
