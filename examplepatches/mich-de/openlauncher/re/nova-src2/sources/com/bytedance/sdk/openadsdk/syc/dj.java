package com.bytedance.sdk.openadsdk.syc;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.bytedance.sdk.openadsdk.core.lt.lt;
import com.bytedance.sdk.openadsdk.core.lt.ul;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ea;
import com.bytedance.sdk.openadsdk.utils.wie;

/* loaded from: classes2.dex */
public class dj extends ul {
    public dj(Context context) {
        this(context, null);
    }

    private void ycx(Context context) {
        setBackgroundColor(Color.parseColor("#000000"));
        setId(520093726);
        int iZb = dc.zb(context, 60.0f);
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
        syaVar.setId(wie.f27214nq);
        syaVar.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        syaVar.setBackgroundColor(0);
        addView(syaVar);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        djVar.setId(wie.spv);
        djVar.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        djVar.setScaleType(ImageView.ScaleType.CENTER_CROP);
        syaVar.addView(djVar);
        lt ltVar = new lt(context);
        ltVar.setId(wie.xh);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(iZb, iZb);
        layoutParams.gravity = 17;
        ltVar.setLayoutParams(layoutParams);
        ltVar.setIndeterminateDrawable(ea.ycx(context, "tt_video_loading_progress_bar"));
        syaVar.addView(ltVar);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar2 = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        djVar2.setId(wie.bah);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(13);
        djVar2.setLayoutParams(layoutParams2);
        djVar2.setScaleType(ImageView.ScaleType.CENTER);
        djVar2.setImageDrawable(ea.ycx(context, "tt_play_movebar_textpage"));
        djVar2.setVisibility(8);
        addView(djVar2);
        View zbVar = new zb(context);
        zbVar.setId(wie.pyn);
        zbVar.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        addView(zbVar);
    }

    public dj(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public dj(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        ycx(context);
    }
}
