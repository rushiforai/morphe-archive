package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class jc extends RelativeLayout {
    public jc(Context context) {
        super(context);
        ycx();
    }

    private void ycx() {
        Context context = getContext();
        int iZb = dc.zb(context, 12.0f);
        setLayoutParams(new ViewGroup.LayoutParams(-1, dc.zb(context, 44.0f)));
        setBackgroundColor(-1);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        djVar.setId(520093720);
        djVar.setClickable(true);
        djVar.setFocusable(true);
        djVar.setImageDrawable(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_leftbackicon_selector"));
        int iZb2 = dc.zb(context, 24.0f);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(iZb2, iZb2);
        layoutParams.leftMargin = iZb;
        layoutParams.addRule(15);
        addView(djVar, layoutParams);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar2 = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        djVar2.setId(520093716);
        djVar2.setClickable(true);
        djVar2.setFocusable(true);
        djVar2.setImageDrawable(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_titlebar_close_seletor"));
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(iZb2, iZb2);
        layoutParams2.leftMargin = iZb;
        layoutParams2.addRule(15);
        layoutParams2.addRule(1, 520093720);
        addView(djVar2, layoutParams2);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar3 = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        int i5 = com.bytedance.sdk.openadsdk.utils.wie.f27182ag;
        djVar3.setId(i5);
        djVar3.setImageDrawable(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_ad_feedback_new"));
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(iZb2, iZb2);
        layoutParams3.addRule(11);
        layoutParams3.addRule(15);
        layoutParams3.rightMargin = iZb;
        addView(djVar3, layoutParams3);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        fbyVar.setId(com.bytedance.sdk.openadsdk.utils.wie.f27221qt);
        fbyVar.setSingleLine(true);
        fbyVar.setEllipsize(TextUtils.TruncateAt.END);
        fbyVar.setGravity(17);
        fbyVar.setTextColor(-16777216);
        fbyVar.setTextSize(1, 16.0f);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(dc.zb(context, 240.0f), -2);
        layoutParams4.addRule(15);
        layoutParams4.addRule(1, 520093716);
        layoutParams4.addRule(0, i5);
        int iZb3 = dc.zb(context, 25.0f);
        layoutParams4.rightMargin = iZb3;
        layoutParams4.leftMargin = iZb3;
        addView(fbyVar, layoutParams4);
    }
}
