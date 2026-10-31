package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.text.TextUtils;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class hf extends ul implements com.bytedance.sdk.component.adexpress.dynamic.sya {
    private boolean htf;
    private boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f23398zb;

    public hf(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        dynamicRootView.setTimeOutListener(this);
        if ("timedown".equals(fbyVar.jc().zb())) {
            dynamicRootView.setTimedown(this.fby);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.ul, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        super.jw();
        if (com.bytedance.sdk.component.adexpress.dj.lt.zb(this.xkz.getRenderRequest().dj())) {
            setVisibility(8);
        }
        if ("timedown".equals(this.f23414ry.jc().zb())) {
            ((TextView) this.syc).setText(String.valueOf((int) Double.parseDouble(this.f23413ok.jc())));
            return true;
        }
        ((TextView) this.syc).setText(((int) Double.parseDouble(this.f23413ok.jc())) + "s");
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public void lt() {
        if (!TextUtils.equals("skip-with-countdowns-video-countdown", this.f23414ry.jc().zb()) && !TextUtils.equals("skip-with-time-countdown", this.f23414ry.jc().zb())) {
            super.lt();
            return;
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(this.f23416ul, this.fby);
        layoutParams.gravity = 8388627;
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            layoutParams.leftMargin = this.f23411jw;
        }
        layoutParams.setMarginStart(layoutParams.leftMargin);
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
        String string = b.f42142b;
        if (z12 || this.htf) {
            ((TextView) this.syc).setText(b.f42142b);
            setVisibility(8);
            return;
        }
        try {
            if (Integer.parseInt((String) charSequence) <= 0) {
                setVisibility(8);
                return;
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61avOJR9JymQWlOg==", "SOs5oQqxbA==", 86);
        }
        setVisibility(0);
        if (!z11 && this.xkz.getRenderRequest().ycx() && com.bytedance.sdk.component.adexpress.dj.lt.zb(this.xkz.getRenderRequest().dj())) {
            if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                ((TextView) this.syc).setText(i5 + "s");
            } else {
                ((TextView) this.syc).setText(String.format(com.bytedance.sdk.component.utils.wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_full_skip"), Integer.valueOf(i5)));
            }
            this.ycx = true;
            return;
        }
        if (com.bytedance.sdk.component.adexpress.dj.zb() && !"open_ad".equals(this.xkz.getRenderRequest().dj()) && this.xkz.getRenderRequest().ycx()) {
            this.htf = true;
            setVisibility(8);
            return;
        }
        if ("timedown".equals(this.f23414ry.jc().zb())) {
            ((TextView) this.syc).setText(charSequence);
            return;
        }
        ((TextView) this.syc).setText(((Object) charSequence) + "s");
        this.f23398zb = true;
        if (this.ycx) {
            CharSequence text = ((TextView) this.syc).getText();
            if (text != null) {
                string = text.toString();
            }
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), this.f23413ok.dj() + this.f23413ok.sya()) + com.bytedance.sdk.component.adexpress.dynamic.lud.ea.zb(string, this.f23413ok.lud(), true)[0]), this.fby);
            layoutParams.gravity = 8388629;
            this.syc.setLayoutParams(layoutParams);
            this.ycx = false;
            requestLayout();
        }
    }
}
