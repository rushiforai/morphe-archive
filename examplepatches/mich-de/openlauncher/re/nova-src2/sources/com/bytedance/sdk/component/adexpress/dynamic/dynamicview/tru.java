package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class tru extends lt implements com.bytedance.sdk.component.adexpress.dynamic.sya {
    private int htf;
    private int thx;
    private boolean wwx;
    int ycx;

    /* renamed from: zb, reason: collision with root package name */
    boolean f23424zb;

    public tru(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.thx = 0;
        setTag(Integer.valueOf(getClickArea()));
        ycx();
        dynamicRootView.setTimeOutListener(this);
        if (dynamicRootView.getRenderRequest() == null || dynamicRootView.getRenderRequest().hf()) {
            return;
        }
        View view = this.syc;
        if (view != null) {
            view.setVisibility(8);
        }
        setVisibility(8);
    }

    private void ycx() {
        List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> listEa = this.f23414ry.ea();
        if (listEa == null || listEa.size() <= 0) {
            return;
        }
        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it = listEa.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            com.bytedance.sdk.component.adexpress.dynamic.dj.fby next = it.next();
            if (TextUtils.equals("skip-with-time-skip-btn", next.jc().zb())) {
                int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, next.fby() + (com.bytedance.sdk.component.adexpress.dj.zb() ? next.ry() : 0));
                this.htf = iYcx;
                this.ycx = this.f23416ul - iYcx;
            }
        }
        this.thx = this.f23416ul - this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt
    public FrameLayout.LayoutParams getWidgetLayoutParams() {
        return new FrameLayout.LayoutParams(-2, -2);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        if (com.bytedance.sdk.component.adexpress.dj.lt.zb(this.xkz.getRenderRequest().dj())) {
            return true;
        }
        super.jw();
        setPadding((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.sya()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.zb()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.dj()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.ycx()));
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public void lt() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        if (this.f23424zb) {
            layoutParams.leftMargin = this.f23411jw;
        } else {
            layoutParams.leftMargin = this.f23411jw + this.thx;
        }
        if (this.wwx && this.f23413ok != null) {
            layoutParams.leftMargin = ((this.f23411jw + this.thx) - ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.sya()))) - ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.dj()));
        }
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            layoutParams.topMargin = this.f23410jc - ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.zb()));
        } else {
            layoutParams.topMargin = this.f23410jc;
        }
        layoutParams.setMarginStart(layoutParams.leftMargin);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        setLayoutParams(layoutParams);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (this.wwx && this.f23413ok != null) {
            setMeasuredDimension(this.htf + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.sya())) + ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.dj())), this.fby);
        } else if (this.f23424zb) {
            setMeasuredDimension(this.f23416ul, this.fby);
        } else {
            setMeasuredDimension(this.ycx, this.fby);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya
    public void ycx(CharSequence charSequence, boolean z11, int i5, boolean z12) {
        if (z12 && this.wwx != z12) {
            this.wwx = z12;
            lt();
            return;
        }
        if (z11 && this.f23424zb != z11) {
            this.f23424zb = z11;
            lt();
        }
        this.f23424zb = z11;
    }
}
