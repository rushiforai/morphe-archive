package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.LinearLayout;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ea {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.widget.pmi f24689dj;
    private com.bytedance.sdk.openadsdk.core.lt.fby lud;
    private com.bytedance.sdk.openadsdk.core.widget.jw sya;
    protected View ycx = lud();

    /* renamed from: zb, reason: collision with root package name */
    protected Context f24690zb;

    public ea(Context context) {
        this.f24690zb = context;
    }

    private View lud() {
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(this.f24690zb);
        ludVar.setGravity(1);
        ludVar.setOrientation(1);
        com.bytedance.sdk.openadsdk.core.widget.pmi pmiVar = new com.bytedance.sdk.openadsdk.core.widget.pmi(this.f24690zb);
        this.f24689dj = pmiVar;
        pmiVar.setId(520093745);
        int iZb = dc.zb(this.f24690zb, 64.0f);
        ludVar.addView(this.f24689dj, new LinearLayout.LayoutParams(iZb, iZb));
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(this.f24690zb);
        this.lud = fbyVar;
        fbyVar.setId(520093746);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(dc.zb(this.f24690zb, 219.0f), -2);
        layoutParams.topMargin = dc.zb(this.f24690zb, 16.0f);
        this.lud.setLayoutParams(layoutParams);
        this.lud.setEllipsize(TextUtils.TruncateAt.END);
        this.lud.setGravity(17);
        this.lud.setMaxWidth(dc.zb(this.f24690zb, 150.0f));
        this.lud.setMaxLines(2);
        this.lud.setTextColor(-1);
        this.lud.setTextSize(1, 16.0f);
        ludVar.addView(this.lud);
        this.sya = new com.bytedance.sdk.openadsdk.core.widget.jw(this.f24690zb);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(dc.zb(this.f24690zb, 219.0f), dc.zb(this.f24690zb, 6.0f));
        layoutParams2.topMargin = dc.zb(this.f24690zb, 32.0f);
        ludVar.addView(this.sya, layoutParams2);
        return ludVar;
    }

    public void dj() {
        this.ycx = null;
        this.f24690zb = null;
    }

    public com.bytedance.sdk.openadsdk.core.lt.fby sya() {
        return this.lud;
    }

    public View ycx() {
        return this.ycx;
    }

    public com.bytedance.sdk.openadsdk.core.widget.pmi zb() {
        return this.f24689dj;
    }

    public void ycx(int i5) {
        this.sya.setProgress(i5);
    }
}
