package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.widget.FrameLayout;
import java.util.List;

/* loaded from: classes2.dex */
public class wwx extends lt implements com.bytedance.sdk.component.adexpress.dynamic.sya {
    private int htf;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23429zb;

    public wwx(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        setTag(Integer.valueOf(getClickArea()));
        dynamicRootView.setTimeOutListener(this);
        ycx();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt
    public FrameLayout.LayoutParams getWidgetLayoutParams() {
        return new FrameLayout.LayoutParams(-2, -2);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        setBackground(getBackgroundDrawable());
        setPadding((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.sya()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.zb()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.dj()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.ycx()));
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public void lt() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        int i5 = this.f23411jw;
        layoutParams.leftMargin = i5;
        layoutParams.topMargin = this.f23410jc;
        layoutParams.setMarginStart(i5);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        setLayoutParams(layoutParams);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (this.htf == 0) {
            setMeasuredDimension(this.f23429zb, this.fby);
        } else {
            setMeasuredDimension(this.ycx, this.fby);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya
    public void ycx(CharSequence charSequence, boolean z11, int i5, boolean z12) {
        this.htf = i5;
    }

    private void ycx() {
        List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> listEa = this.f23414ry.ea();
        if (listEa == null || listEa.size() <= 0) {
            return;
        }
        for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar : listEa) {
            if (fbyVar.jc().ycx() == 21) {
                this.ycx = (int) (this.f23416ul - com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, fbyVar.fby()));
            }
            if (fbyVar.jc().ycx() == 20) {
                this.f23429zb = (int) (this.f23416ul - com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, fbyVar.fby()));
            }
        }
    }
}
