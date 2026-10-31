package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ul extends com.bytedance.sdk.openadsdk.core.lt.dj {
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f26345zb;

    public ul(Context context) {
        super(context);
        this.ycx = 2.25f;
        this.f26345zb = 12;
        ycx();
    }

    private void ycx() {
        setBackground(dj.ycx());
        setImageResource(wwx.dj(getContext(), "tt_close_btn"));
        int iZb = dc.zb(getContext(), this.ycx);
        setPadding(iZb, iZb, iZb, iZb);
        setScaleType(ImageView.ScaleType.FIT_XY);
    }

    public static com.bytedance.sdk.openadsdk.core.lt.dj zb(Context context) {
        return new ul(context, 28, 5.0f);
    }

    @Override // com.bytedance.sdk.openadsdk.core.lt.dj, android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams != null) {
            int iZb = dc.zb(getContext(), this.f26345zb);
            layoutParams.width = iZb;
            layoutParams.height = iZb;
        }
        super.setLayoutParams(layoutParams);
    }

    public ul(Context context, int i5, float f11) {
        super(context);
        this.ycx = f11;
        this.f26345zb = i5;
        ycx();
    }

    public static com.bytedance.sdk.openadsdk.core.lt.dj ycx(Context context) {
        return new ul(context);
    }

    public static com.bytedance.sdk.openadsdk.core.lt.dj ycx(Context context, ViewGroup viewGroup) {
        if (context == null || viewGroup == null) {
            return null;
        }
        ul ulVar = new ul(context, 33, 0.0f);
        ulVar.setImageResource(wwx.dj(context, "tt_ad_close_backup"));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 8388661;
        layoutParams.topMargin = dc.zb(context, 20.0f);
        layoutParams.rightMargin = dc.zb(context, 16.0f);
        ulVar.setLayoutParams(layoutParams);
        ulVar.setVisibility(8);
        viewGroup.addView(ulVar);
        return ulVar;
    }
}
