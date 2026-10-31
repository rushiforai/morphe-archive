package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class PAGLogoView extends LinearLayout {
    protected int containerHeight;
    private com.bytedance.sdk.openadsdk.core.lt.dj mAdLogo;
    private com.bytedance.sdk.openadsdk.core.lt.fby mAdText;

    public PAGLogoView(Context context) {
        this(context, null);
    }

    public static PAGLogoView createPAGLogoViewByMaterial(Context context, tn tnVar) {
        PAGLogoView pAGLogoView = new PAGLogoView(context);
        pAGLogoView.initData(tnVar);
        return pAGLogoView;
    }

    private void initView(Context context) {
        int iZb = dc.zb(context, 2.0f);
        this.containerHeight = dc.zb(getContext(), 12.0f);
        this.mAdLogo = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(dc.zb(context, 14.0f), dc.zb(context, 6.0f));
        layoutParams.leftMargin = iZb;
        this.mAdLogo.setLayoutParams(layoutParams);
        this.mAdLogo.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        this.mAdText = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, this.containerHeight);
        layoutParams2.leftMargin = iZb;
        layoutParams2.rightMargin = iZb;
        this.mAdText.setLayoutParams(layoutParams2);
        this.mAdText.setTextSize(1, 8.0f);
        this.mAdText.setGravity(17);
        this.mAdText.setTextColor(Color.parseColor("#BFFFFFFF"));
        addView(this.mAdLogo);
        addView(this.mAdText);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setColor(Color.parseColor("#26000000"));
        gradientDrawable.setCornerRadius(iZb);
        setBackground(gradientDrawable);
        setGravity(16);
    }

    public void initData(tn tnVar) {
        if (tnVar == null) {
            return;
        }
        initData(tnVar.mnf());
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
    }

    @Override // android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        layoutParams.width = -2;
        layoutParams.height = this.containerHeight;
        super.setLayoutParams(com.bytedance.sdk.openadsdk.core.lt.jw.ycx(this, layoutParams));
    }

    public PAGLogoView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public void initData(com.bytedance.sdk.openadsdk.core.model.zb zbVar) {
        if (zbVar == null) {
            return;
        }
        if (zbVar.lt()) {
            this.mAdLogo.setImageDrawable(wwx.sya(com.bytedance.sdk.openadsdk.core.pmi.ycx(), "tt_ad_logo"));
        } else {
            String strYcx = zbVar.ycx();
            if (TextUtils.isEmpty(strYcx)) {
                this.mAdLogo.setVisibility(8);
            } else {
                if (strYcx.contains("logo")) {
                    this.mAdLogo.setImageDrawable(wwx.sya(com.bytedance.sdk.openadsdk.core.pmi.ycx(), "tt_ad_logo"));
                } else {
                    com.bytedance.sdk.openadsdk.jc.dj.ycx(strYcx).sya(1).ycx(this.mAdLogo);
                }
                this.mAdLogo.setVisibility(0);
            }
        }
        String strZb = zbVar.zb();
        if (zbVar.lt()) {
            this.mAdText.setText(wwx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx(), "tt_logo_en"));
        } else if (TextUtils.isEmpty(strZb)) {
            this.mAdText.setVisibility(8);
        } else {
            this.mAdText.setText(strZb);
            this.mAdText.setVisibility(0);
        }
    }

    public PAGLogoView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        initView(context);
    }

    public PAGLogoView(Context context, AttributeSet attributeSet, int i5, int i11) {
        super(context, attributeSet, i5, i11);
        initView(context);
    }
}
