package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.text.TextUtils;
import android.widget.FrameLayout;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class ul extends lt {
    public ul(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        com.bytedance.sdk.component.adexpress.dynamic.animation.view.ycx ycxVar = new com.bytedance.sdk.component.adexpress.dynamic.animation.view.ycx(context);
        this.syc = ycxVar;
        ycxVar.setTag(Integer.valueOf(getClickArea()));
        addView(this.syc, getWidgetLayoutParams());
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt
    public FrameLayout.LayoutParams getWidgetLayoutParams() {
        if (!com.bytedance.sdk.component.adexpress.dj.zb() || !"fillButton".equals(this.f23414ry.jc().zb())) {
            return super.getWidgetLayoutParams();
        }
        ((TextView) this.syc).setEllipsize(TextUtils.TruncateAt.END);
        ((TextView) this.syc).setMaxLines(1);
        FrameLayout.LayoutParams widgetLayoutParams = super.getWidgetLayoutParams();
        widgetLayoutParams.width -= this.f23413ok.pmi() * 2;
        widgetLayoutParams.height -= this.f23413ok.pmi() * 2;
        widgetLayoutParams.topMargin = this.f23413ok.pmi() + widgetLayoutParams.topMargin;
        int iPmi = this.f23413ok.pmi() + widgetLayoutParams.leftMargin;
        widgetLayoutParams.leftMargin = iPmi;
        widgetLayoutParams.setMarginStart(iPmi);
        widgetLayoutParams.setMarginEnd(widgetLayoutParams.rightMargin);
        return widgetLayoutParams;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        if (TextUtils.equals("download-progress-button", this.f23414ry.jc().zb()) && TextUtils.isEmpty(this.f23413ok.jc())) {
            this.syc.setVisibility(4);
            return true;
        }
        this.syc.setTextAlignment(this.f23413ok.fby());
        ((TextView) this.syc).setText(this.f23413ok.jc());
        ((TextView) this.syc).setTextColor(this.f23413ok.ul());
        ((TextView) this.syc).setTextSize(this.f23413ok.lud());
        ((TextView) this.syc).setGravity(17);
        ((TextView) this.syc).setIncludeFontPadding(false);
        if ("fillButton".equals(this.f23414ry.jc().zb())) {
            this.syc.setPadding(0, 0, 0, 0);
        } else {
            this.syc.setPadding(this.f23413ok.sya(), this.f23413ok.zb(), this.f23413ok.dj(), this.f23413ok.ycx());
        }
        return true;
    }
}
