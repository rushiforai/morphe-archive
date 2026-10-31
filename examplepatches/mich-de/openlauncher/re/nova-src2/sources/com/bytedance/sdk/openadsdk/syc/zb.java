package com.bytedance.sdk.openadsdk.syc;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.bytedance.sdk.openadsdk.core.lt.fby;
import com.bytedance.sdk.openadsdk.core.lt.ul;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ea;
import com.bytedance.sdk.openadsdk.utils.wie;

/* loaded from: classes2.dex */
public class zb extends ul {
    public zb(Context context) {
        this(context, null);
    }

    private void ycx(Context context) {
        setId(wie.pyn);
        setVisibility(8);
        setBackgroundColor(Color.parseColor("#7f000000"));
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(getContext());
        djVar.setId(wie.hfd);
        djVar.setScaleType(ImageView.ScaleType.CENTER_CROP);
        djVar.setImageTintMode(PorterDuff.Mode.SRC_OVER);
        djVar.setImageTintList(ColorStateList.valueOf(Color.parseColor("#7f000000")));
        djVar.setBackgroundColor(Color.parseColor("#7f000000"));
        djVar.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        addView(djVar);
        ul ulVar = new ul(context);
        ulVar.setId(wie.skm);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        ulVar.setLayoutParams(layoutParams);
        addView(ulVar);
        int iZb = dc.zb(context, 20.0f);
        fby fbyVar = new fby(context);
        fbyVar.setId(wie.xym);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(14);
        layoutParams2.setMargins(iZb, 0, iZb, 0);
        fbyVar.setLayoutParams(layoutParams2);
        fbyVar.setMaxLines(2);
        fbyVar.setMinHeight(dc.zb(context, 40.0f));
        fbyVar.setEllipsize(TextUtils.TruncateAt.END);
        fbyVar.setTextColor(-1);
        fbyVar.setTextSize(2, 14.0f);
        fbyVar.setBackground(ea.ycx(context, "tt_ad_cover_btn_begin_bg"));
        fbyVar.setGravity(17);
        int iZb2 = dc.zb(context, 10.0f);
        int iZb3 = dc.zb(context, 2.0f);
        fbyVar.setPadding(iZb2, iZb3, iZb2, iZb3);
        fbyVar.setVisibility(8);
        ulVar.addView(fbyVar);
    }

    public zb(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public zb(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        ycx(context);
    }
}
