package com.bytedance.sdk.openadsdk.sya;

import android.content.Context;
import android.graphics.Color;
import android.widget.LinearLayout;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ul extends LinearLayout {
    private final jc sya;
    private final FilterWord ycx;

    /* renamed from: zb, reason: collision with root package name */
    private fby f27023zb;

    public ul(Context context, FilterWord filterWord, jc jcVar) {
        super(context);
        setOrientation(1);
        this.ycx = filterWord;
        this.sya = jcVar;
        ycx();
    }

    private void sya() {
        String name = this.ycx.getName();
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(getContext());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.bottomMargin = dc.zb(getContext(), 12.0f);
        layoutParams.gravity = 17;
        fbyVar.setGravity(17);
        fbyVar.setText(name);
        fbyVar.setTextColor(Color.argb(85, 22, 24, 35));
        fbyVar.setTextSize(this.sya.jw() ? 14 : 10);
        addView(fbyVar, layoutParams);
    }

    private void ycx() {
        sya();
        zb();
    }

    private void zb() {
        this.f27023zb = new fby(getContext(), this.sya);
        new LinearLayout.LayoutParams(-1, -2);
        this.f27023zb.ycx(this.ycx.getOptions());
        addView(this.f27023zb);
    }
}
