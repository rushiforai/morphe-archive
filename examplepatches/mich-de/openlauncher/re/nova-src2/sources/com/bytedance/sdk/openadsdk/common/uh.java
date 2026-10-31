package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class uh extends com.bytedance.sdk.openadsdk.core.lt.sya {
    public uh(Context context) {
        super(context);
        ycx();
    }

    private void ycx() {
        Context context = getContext();
        int iZb = dc.zb(context, 12.0f);
        int iZb2 = dc.zb(context, 10.0f);
        int iZb3 = dc.zb(context, 24.0f);
        setLayoutParams(new ViewGroup.LayoutParams(-1, dc.zb(context, 44.0f)));
        setBackgroundColor(-1);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        djVar.setId(520093720);
        djVar.setClickable(true);
        djVar.setFocusable(true);
        djVar.setImageDrawable(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_leftbackicon_selector"));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(iZb3, iZb3);
        layoutParams.setMargins(iZb, iZb2, 0, iZb2);
        layoutParams.gravity = (ycx(context) ? 5 : 3) | 16;
        addView(djVar, layoutParams);
        if (ycx(context)) {
            djVar.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(context, "tt_titlebar_forward"));
        }
        com.bytedance.sdk.openadsdk.core.lt.dj djVar2 = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        djVar2.setId(com.bytedance.sdk.openadsdk.utils.wie.f27228sg);
        djVar2.setClickable(true);
        djVar2.setFocusable(true);
        djVar2.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(context, "tt_history_titlebar_delete"));
        djVar2.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(iZb3, iZb3);
        layoutParams2.setMargins(0, iZb2, iZb, iZb2);
        layoutParams2.gravity = (ycx(context) ? 3 : 5) | 16;
        addView(djVar2, layoutParams2);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        fbyVar.setId(com.bytedance.sdk.openadsdk.utils.wie.f27221qt);
        fbyVar.setSingleLine(true);
        fbyVar.setText(context.getString(com.bytedance.sdk.component.utils.wwx.zb(context, "tt_history_title")));
        fbyVar.setEllipsize(TextUtils.TruncateAt.END);
        int i5 = Build.VERSION.SDK_INT;
        fbyVar.setTextAppearance(16974331);
        Typeface typefaceCreate = i5 >= 28 ? Typeface.create(fbyVar.getTypeface(), 500, false) : null;
        if (typefaceCreate != null) {
            fbyVar.setTypeface(typefaceCreate);
        }
        fbyVar.setGravity(17);
        fbyVar.setTextColor(-16777216);
        fbyVar.setTextSize(1, 17.0f);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-1, -2);
        layoutParams3.gravity = 17;
        addView(fbyVar, layoutParams3);
    }

    private boolean ycx(Context context) {
        return context.getResources().getConfiguration().getLayoutDirection() == 1;
    }

    private boolean ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        for (char c11 : str.toCharArray()) {
            if (Character.getDirectionality(c11) == 1 || Character.getDirectionality(c11) == 2) {
                return true;
            }
        }
        return false;
    }
}
