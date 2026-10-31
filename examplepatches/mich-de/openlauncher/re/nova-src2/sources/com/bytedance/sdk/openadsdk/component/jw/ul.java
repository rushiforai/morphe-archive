package com.bytedance.sdk.openadsdk.component.jw;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ul extends com.bytedance.sdk.openadsdk.core.lt.ul {
    private final com.bytedance.sdk.openadsdk.core.lt.fby sya;
    private final com.bytedance.sdk.openadsdk.core.lt.dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.lt.dj f24797zb;

    public ul(Context context) {
        super(context);
        setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        int iZb = dc.zb(context, 12.0f);
        int iZb2 = dc.zb(context, 16.0f);
        int iZb3 = dc.zb(context, 20.0f);
        int iZb4 = dc.zb(context, 24.0f);
        int iZb5 = dc.zb(context, 28.0f);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        this.ycx = djVar;
        djVar.setId(520093713);
        int iZb6 = dc.zb(getContext(), 5.0f);
        djVar.setPadding(iZb6, iZb6, iZb6, iZb6);
        ImageView.ScaleType scaleType = ImageView.ScaleType.CENTER;
        djVar.setScaleType(scaleType);
        djVar.setBackground(com.bytedance.sdk.openadsdk.core.widget.dj.ycx());
        djVar.setImageResource(wwx.dj(pmi.ycx(), "tt_reward_full_feedback"));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(iZb5, iZb5);
        layoutParams.topMargin = iZb3;
        layoutParams.leftMargin = iZb2;
        layoutParams.setMarginStart(iZb2);
        djVar.setLayoutParams(layoutParams);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar2 = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        this.f24797zb = djVar2;
        djVar2.setId(520093714);
        djVar2.setPadding(iZb6, iZb6, iZb6, iZb6);
        djVar2.setScaleType(scaleType);
        djVar2.setBackground(com.bytedance.sdk.openadsdk.core.widget.dj.ycx());
        djVar2.setImageResource(wwx.dj(pmi.ycx(), "tt_close_btn"));
        if (djVar2.getDrawable() != null) {
            djVar2.getDrawable().setAutoMirrored(true);
        }
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(iZb5, iZb5);
        layoutParams2.topMargin = iZb3;
        layoutParams2.rightMargin = iZb2;
        layoutParams2.setMarginEnd(iZb2);
        layoutParams2.addRule(11);
        layoutParams2.addRule(21);
        djVar2.setLayoutParams(layoutParams2);
        djVar2.setVisibility(4);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.sya = fbyVar;
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, iZb4);
        layoutParams3.topMargin = iZb3;
        layoutParams3.rightMargin = iZb2;
        layoutParams3.addRule(11);
        layoutParams3.setMarginEnd(iZb2);
        layoutParams3.addRule(21);
        fbyVar.setLayoutParams(layoutParams3);
        fbyVar.setBackground(com.bytedance.sdk.openadsdk.core.widget.dj.zb());
        fbyVar.setGravity(17);
        fbyVar.setPadding(iZb, 0, iZb, 0);
        fbyVar.setTextColor(-1);
        fbyVar.setTextSize(1, 14.0f);
        fbyVar.setVisibility(4);
        addView(djVar);
        addView(fbyVar);
        addView(djVar2);
    }

    public com.bytedance.sdk.openadsdk.core.lt.fby getTopCountDown() {
        return this.sya;
    }

    public View getTopDislike() {
        return this.ycx;
    }

    public com.bytedance.sdk.openadsdk.core.lt.dj getTopSkip() {
        return this.f24797zb;
    }
}
