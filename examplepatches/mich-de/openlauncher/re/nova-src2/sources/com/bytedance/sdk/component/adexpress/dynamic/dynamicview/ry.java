package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.text.TextUtils;
import android.widget.FrameLayout;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class ry extends lt {
    public ry(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        TextView textView = new TextView(context);
        this.syc = textView;
        textView.setTag(Integer.valueOf(getClickArea()));
        addView(this.syc, getWidgetLayoutParams());
    }

    private boolean ycx() {
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            return false;
        }
        return (!TextUtils.isEmpty(this.f23413ok.f23373zb) && this.f23413ok.f23373zb.contains("adx:")) || com.bytedance.sdk.component.adexpress.dynamic.lud.ea.zb();
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0080  */
    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean jw() {
        com.bytedance.sdk.component.adexpress.zb.ry renderRequest;
        super.jw();
        this.syc.setTextAlignment(this.f23413ok.fby());
        ((TextView) this.syc).setTextColor(this.f23413ok.ul());
        ((TextView) this.syc).setTextSize(this.f23413ok.lud());
        if (!com.bytedance.sdk.component.adexpress.dj.zb()) {
            if (!ycx()) {
                ((TextView) this.syc).setText(com.bytedance.sdk.component.utils.wwx.zb(getContext(), "tt_logo_cn"));
                return true;
            }
            if (com.bytedance.sdk.component.adexpress.dynamic.lud.ea.zb()) {
                ((TextView) this.syc).setText(com.bytedance.sdk.component.adexpress.dynamic.lud.ea.ycx());
                return true;
            }
            ((TextView) this.syc).setText(com.bytedance.sdk.component.adexpress.dynamic.lud.ea.ycx(this.f23413ok.f23373zb));
            return true;
        }
        int i5 = 0;
        ((TextView) this.syc).setIncludeFontPadding(false);
        ((TextView) this.syc).setTextSize(Math.min(((com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), this.fby) - this.f23413ok.zb()) - this.f23413ok.ycx()) - 0.5f, this.f23413ok.lud()));
        DynamicRootView dynamicRootView = this.xkz;
        if (dynamicRootView == null || (renderRequest = dynamicRootView.getRenderRequest()) == null) {
            i5 = 8;
        } else {
            String strBhi = renderRequest.bhi();
            if (!TextUtils.isEmpty(strBhi)) {
                ((TextView) this.syc).setText(strBhi);
            }
        }
        ((TextView) this.syc).setVisibility(i5);
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public void lt() {
        com.bytedance.sdk.component.adexpress.zb.ry renderRequest = this.xkz.getRenderRequest();
        if (renderRequest == null || !TextUtils.isEmpty(renderRequest.tru())) {
            super.lt();
            return;
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(this.f23416ul, this.fby);
        layoutParams.gravity = 17;
        setLayoutParams(layoutParams);
    }
}
