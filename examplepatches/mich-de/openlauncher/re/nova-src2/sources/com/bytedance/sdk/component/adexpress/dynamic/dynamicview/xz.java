package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import b.c0;

/* loaded from: classes2.dex */
public class xz extends lt implements com.bytedance.sdk.component.adexpress.dynamic.lud {
    boolean htf;
    TextView ycx;

    /* renamed from: zb, reason: collision with root package name */
    FrameLayout f23430zb;

    public xz(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.htf = false;
        View view = new View(context);
        this.syc = view;
        view.setTag(Integer.valueOf(getClickArea()));
        this.ycx = new TextView(context);
        this.f23430zb = new FrameLayout(context);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, 40.0f), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, 15.0f));
        layoutParams.gravity = 8388693;
        layoutParams.rightMargin = 20;
        layoutParams.bottomMargin = 20;
        this.ycx.setLayoutParams(layoutParams);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setCornerRadius(25.0f);
        gradientDrawable.setColor(Color.parseColor("#57000000"));
        this.ycx.setBackground(gradientDrawable);
        this.ycx.setTextSize(10.0f);
        this.ycx.setGravity(17);
        this.ycx.setTextColor(-1);
        this.ycx.setVisibility(8);
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            addView(this.f23430zb, new FrameLayout.LayoutParams(-1, -1));
        }
        addView(this.ycx);
        addView(this.syc, getWidgetLayoutParams());
        if (!com.bytedance.sdk.component.adexpress.dj.zb()) {
            addView(this.f23430zb, getWidgetLayoutParams());
        }
        dynamicRootView.videoView = this.f23430zb;
        dynamicRootView.setVideoListener(this);
    }

    private void sya(View view) {
        if (view == this.ycx || view == ((lt) this).f23399uh) {
            return;
        }
        try {
            if (((Integer) view.getTag(com.bytedance.sdk.component.adexpress.dynamic.ycx.f23519lt)).intValue() == 1) {
                return;
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avGJTtJSuhilPw==", "X+EbnBC1a8uF", 141);
        }
        int i5 = 0;
        view.setVisibility(0);
        if (!(view instanceof ViewGroup)) {
            return;
        }
        while (true) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (i5 >= viewGroup.getChildCount()) {
                return;
            }
            sya(viewGroup.getChildAt(i5));
            i5++;
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        double dUl = 0.0d;
        double dLt = 0.0d;
        for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVarOk = this.f23414ry; fbyVarOk != null; fbyVarOk = fbyVarOk.ok()) {
            dLt = (dLt + fbyVarOk.lt()) - fbyVarOk.dj();
            dUl = (dUl + fbyVarOk.ul()) - fbyVarOk.lud();
        }
        try {
            float f11 = (float) dLt;
            int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), f11);
            int iYcx2 = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), f11 + this.lud);
            if (com.bytedance.sdk.component.adexpress.dj.zb.ycx(getContext())) {
                int dynamicWidth = ((pmi) this.xkz.getChildAt(0)).getDynamicWidth();
                int i5 = dynamicWidth - iYcx2;
                iYcx2 = dynamicWidth - iYcx;
                iYcx = i5;
            }
            if ("open_ad".equals(this.xkz.getRenderRequest().dj())) {
                this.xkz.videoView = this.f23430zb;
            } else {
                float f12 = (float) dUl;
                ((pmi) this.xkz.getChildAt(0)).ycx.ycx(iYcx, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), f12), iYcx2, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(getContext(), f12 + this.f23412lt));
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avGJTtJSuhilPw==", "Wv49mRqSaNOJXNJumAisLQ==", 93);
        }
        this.xkz.updateRenderInfoForVideo(dLt, dUl, this.lud, this.f23412lt, this.f23413ok.syc());
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public boolean lud() {
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.lud
    public void setTimeUpdate(int i5) {
        if (!this.f23414ry.jc().lud().yw() || i5 <= 0 || this.htf) {
            this.htf = true;
            for (int i11 = 0; i11 < getChildCount(); i11++) {
                sya(getChildAt(i11));
            }
            this.ycx.setVisibility(8);
            return;
        }
        String strE = c0.E(i5 >= 60 ? "0" + (i5 / 60) : "00", ":");
        int i12 = i5 % 60;
        this.ycx.setText(i12 > 9 ? strE + i12 : strE + "0" + i12);
        this.ycx.setVisibility(0);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.lud
    public void ycx() {
        this.ycx.setVisibility(8);
    }
}
