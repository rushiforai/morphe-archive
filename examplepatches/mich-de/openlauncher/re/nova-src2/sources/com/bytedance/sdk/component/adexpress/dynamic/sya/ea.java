package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.bytedance.sdk.component.utils.av;
import com.bytedance.sdk.component.utils.wwx;

/* loaded from: classes2.dex */
public class ea implements ul<ViewGroup> {
    private final com.bytedance.sdk.component.adexpress.lt.jc ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final FrameLayout f23455zb;

    public ea(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar, String str, String str2) {
        com.bytedance.sdk.component.adexpress.lt.jc jcVar = new com.bytedance.sdk.component.adexpress.lt.jc(context);
        this.ycx = jcVar;
        jcVar.setImageLottieTosPath(str);
        FrameLayout frameLayout = new FrameLayout(context);
        this.f23455zb = frameLayout;
        frameLayout.addView(jcVar, new FrameLayout.LayoutParams(-2, -2));
        double dUr = ulVar.ur();
        dUr = dUr == 0.0d ? 1.0d : dUr;
        double dWr = ulVar.wr();
        double d5 = dWr != 0.0d ? dWr : 1.0d;
        if ("22".equals(str2)) {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, 250.0f));
            layoutParams.gravity = 81;
            layoutParams.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, 120.0f);
            frameLayout.setLayoutParams(layoutParams);
            return;
        }
        if (!"20".equals(str2)) {
            FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams((int) (ludVar.getDynamicWidth() * 0.32d * dUr), (int) (ludVar.getDynamicWidth() * 0.32d * d5));
            layoutParams2.gravity = 17;
            frameLayout.setLayoutParams(layoutParams2);
        } else {
            ycx(context, frameLayout, ulVar);
            FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-2, -2);
            layoutParams3.gravity = 81;
            layoutParams3.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, ulVar.rl() > 0 ? ulVar.rl() : com.bytedance.sdk.component.adexpress.dj.zb() ? 0 : 120);
            frameLayout.setLayoutParams(layoutParams3);
            frameLayout.setClipChildren(false);
        }
    }

    private void ycx(Context context, FrameLayout frameLayout, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        LinearLayout linearLayout = new LinearLayout(context);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 17;
        layoutParams.setMargins(0, -av.ycx(context, 5.0f), 0, 0);
        linearLayout.setLayoutParams(layoutParams);
        linearLayout.setOrientation(1);
        TextView textView = new TextView(context);
        textView.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        textView.setText(context.getString(wwx.zb(context, "tt_splash_brush_mask_title")));
        textView.setTextColor(-1);
        textView.setTextSize(2, 20.0f);
        TextView textView2 = new TextView(context);
        textView2.setId(2097610738);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams2.setMargins(0, av.ycx(context, 5.0f), 0, 0);
        textView2.setLayoutParams(layoutParams2);
        textView2.setText(context.getString(wwx.zb(context, "tt_splash_brush_mask_hint")));
        if (ulVar != null && !TextUtils.isEmpty(ulVar.uf())) {
            textView2.setText(ulVar.uf());
        }
        textView2.setTextColor(-1);
        textView2.setTextSize(2, 14.0f);
        linearLayout.addView(textView);
        linearLayout.addView(textView2);
        frameLayout.addView(linearLayout);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public ViewGroup sya() {
        return this.f23455zb;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void zb() {
        this.ycx.lt();
        ViewParent parent = this.f23455zb.getParent();
        if (parent instanceof ViewGroup) {
            ((ViewGroup) parent).removeView(this.f23455zb);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void ycx() {
        this.ycx.fby();
    }
}
