package com.bytedance.sdk.openadsdk.syc;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.lt.fby;
import com.bytedance.sdk.openadsdk.core.lt.ul;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.wie;

/* loaded from: classes2.dex */
public class lud extends ul {
    public lud(Context context) {
        this(context, null);
    }

    private void ycx(Context context) {
        setId(wie.f27216oq);
        setBackgroundColor(Color.parseColor("#00000000"));
        setGravity(16);
        setVisibility(8);
        fby fbyVar = new fby(context);
        int i5 = wie.gjv;
        fbyVar.setId(i5);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(14);
        fbyVar.setLayoutParams(layoutParams);
        fbyVar.setIncludeFontPadding(false);
        fbyVar.setText(wwx.ycx(context, "tt_video_without_wifi_tips"));
        fbyVar.setTextColor(Color.parseColor("#cacaca"));
        fbyVar.setTextSize(2, 14.0f);
        addView(fbyVar);
        ul ulVar = new ul(context);
        ulVar.setId(wie.kfb);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(3, i5);
        layoutParams2.addRule(13);
        ulVar.setLayoutParams(layoutParams2);
        addView(ulVar);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        djVar.setId(wie.qkm);
        int iZb = dc.zb(context, 44.0f);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(iZb, iZb);
        layoutParams3.addRule(15);
        djVar.setLayoutParams(layoutParams3);
        djVar.setImageDrawable(wwx.sya(context, "tt_new_play_video"));
        djVar.setScaleType(ImageView.ScaleType.FIT_XY);
        ulVar.addView(djVar);
    }

    public lud(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public lud(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        ycx(context);
    }
}
