package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class thx extends ul implements com.bytedance.sdk.component.adexpress.dynamic.sya {
    private int htf;
    private int[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23423zb;

    public thx(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        dynamicRootView.setTimeOutListener(this);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.ul, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        ((TextView) this.syc).setText(b.f42142b);
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public void lt() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(this.f23416ul, this.fby);
        layoutParams.gravity = 8388629;
        layoutParams.setMarginStart(layoutParams.leftMargin);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        setLayoutParams(layoutParams);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (TextUtils.isEmpty(((TextView) this.syc).getText())) {
            setMeasuredDimension(0, this.fby);
        } else {
            setMeasuredDimension(this.f23416ul, this.fby);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya
    @SuppressLint({"SetTextI18n"})
    public void ycx(CharSequence charSequence, boolean z11, int i5, boolean z12) {
        String strYcx = com.bytedance.sdk.component.utils.wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_screen_skip_tx");
        if (i5 == 0) {
            this.syc.setVisibility(0);
            ((TextView) this.syc).setText("| ".concat(String.valueOf(strYcx)));
            this.syc.measure(-2, -2);
            this.ycx = new int[]{this.syc.getMeasuredWidth() + 1, this.syc.getMeasuredHeight()};
            View view = this.syc;
            int[] iArr = this.ycx;
            view.setLayoutParams(new FrameLayout.LayoutParams(iArr[0], iArr[1]));
            ((TextView) this.syc).setGravity(17);
            ((TextView) this.syc).setIncludeFontPadding(false);
            ycx();
            this.syc.setPadding(this.f23413ok.sya(), this.f23423zb, this.f23413ok.dj(), this.htf);
        }
        requestLayout();
    }

    private void ycx() {
        int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.lud());
        this.f23423zb = ((this.fby - iYcx) / 2) - this.f23413ok.ycx();
        this.htf = 0;
    }
}
