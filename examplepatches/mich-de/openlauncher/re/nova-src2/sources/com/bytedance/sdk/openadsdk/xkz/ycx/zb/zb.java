package com.bytedance.sdk.openadsdk.xkz.ycx.zb;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.lt.dj;
import com.bytedance.sdk.openadsdk.core.lt.fby;
import com.bytedance.sdk.openadsdk.core.lt.sya;
import com.bytedance.sdk.openadsdk.core.lt.ul;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.wie;

/* loaded from: classes2.dex */
public class zb extends sya {
    private Context ycx;

    public zb(Context context) {
        super(context);
        this.ycx = context;
        zb();
    }

    private void zb() {
        setVisibility(8);
    }

    public void ycx() {
        Context context = getContext();
        if (getChildCount() > 0) {
            setVisibility(0);
            return;
        }
        ul ulVar = new ul(context);
        ulVar.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        fby fbyVar = new fby(context);
        fbyVar.setText(wwx.zb(context, "tt_history_no_data"));
        fbyVar.setId(wie.bjp);
        fbyVar.setTextSize(2, 18.0f);
        Typeface typefaceCreate = Build.VERSION.SDK_INT >= 28 ? Typeface.create(fbyVar.getTypeface(), 500, false) : null;
        if (typefaceCreate != null) {
            fbyVar.setTypeface(typefaceCreate);
        }
        fbyVar.setTextColor(Color.parseColor("#333333"));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        layoutParams.topMargin = ycx(16.0f);
        layoutParams.bottomMargin = ycx(8.0f);
        ulVar.addView(fbyVar, layoutParams);
        dj djVar = new dj(context);
        djVar.setImageResource(wwx.dj(context, "tt_history_empty_icon"));
        djVar.setId(wie.f27185bh);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(ycx(72.0f), ycx(72.0f));
        layoutParams2.addRule(2, fbyVar.getId());
        layoutParams2.addRule(14);
        ulVar.addView(djVar, layoutParams2);
        fby fbyVar2 = new fby(context);
        fbyVar2.setText(wwx.zb(context, "tt_history_placeholder_submessage"));
        fbyVar2.setTextSize(2, 14.0f);
        fbyVar2.setTextColor(Color.parseColor("#666666"));
        fbyVar2.setGravity(17);
        fbyVar2.setMaxWidth(ycx(280.0f));
        fbyVar2.setLineSpacing(ycx(2.0f), 1.0f);
        fbyVar2.setPadding(ycx(20.0f), 0, ycx(20.0f), 0);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.addRule(3, fbyVar.getId());
        layoutParams3.addRule(14);
        layoutParams3.topMargin = ycx(8.0f);
        ulVar.addView(fbyVar2, layoutParams3);
        addView(ulVar);
    }

    private int ycx(float f11) {
        return dc.zb(this.ycx, f11);
    }
}
