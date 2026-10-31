package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class htf extends ul implements com.bytedance.sdk.component.adexpress.dynamic.sya {
    public htf(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        dynamicRootView.setTimeOutListener(this);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.ul, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt
    public FrameLayout.LayoutParams getWidgetLayoutParams() {
        return new FrameLayout.LayoutParams(-2, -2);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public void lt() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(this.f23416ul, this.fby);
        int i5 = this.f23411jw;
        layoutParams.leftMargin = i5;
        layoutParams.gravity = 16;
        layoutParams.setMarginStart(i5);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        setLayoutParams(layoutParams);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (TextUtils.isEmpty(((TextView) this.syc).getText())) {
            setMeasuredDimension(0, this.fby);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya
    public void ycx(CharSequence charSequence, boolean z11, int i5, boolean z12) {
        if (i5 != 0) {
            ((TextView) this.syc).setText(" | ".concat(String.format(com.bytedance.sdk.component.utils.wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_full_skip_count_down"), Integer.valueOf(i5))));
        } else if (getParent() != null) {
            ((ViewGroup) getParent()).removeView(this);
        }
        requestLayout();
    }
}
