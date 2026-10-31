package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

/* loaded from: classes2.dex */
public class wie extends lt {
    private TextView htf;
    private TextView thx;

    /* renamed from: tn, reason: collision with root package name */
    private LinearLayout f23427tn;
    private TextView wwx;
    private TextView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private TextView f23428zb;

    public wie(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.ycx = new TextView(this.f23409ea);
        this.f23428zb = new TextView(this.f23409ea);
        this.htf = new TextView(this.f23409ea);
        this.f23427tn = new LinearLayout(this.f23409ea);
        this.thx = new TextView(this.f23409ea);
        this.wwx = new TextView(this.f23409ea);
        this.ycx.setTag(9);
        this.f23428zb.setTag(10);
        this.htf.setTag(12);
        this.f23427tn.addView(this.htf);
        this.f23427tn.addView(this.wwx);
        this.f23427tn.addView(this.f23428zb);
        this.f23427tn.addView(this.thx);
        this.f23427tn.addView(this.ycx);
        addView(this.f23427tn, getWidgetLayoutParams());
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud
    public boolean dj() {
        this.ycx.setOnTouchListener((View.OnTouchListener) getDynamicClickListener());
        this.ycx.setOnClickListener((View.OnClickListener) getDynamicClickListener());
        this.f23428zb.setOnTouchListener((View.OnTouchListener) getDynamicClickListener());
        this.f23428zb.setOnClickListener((View.OnClickListener) getDynamicClickListener());
        this.htf.setOnTouchListener((View.OnTouchListener) getDynamicClickListener());
        this.htf.setOnClickListener((View.OnClickListener) getDynamicClickListener());
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt
    public FrameLayout.LayoutParams getWidgetLayoutParams() {
        return new FrameLayout.LayoutParams(this.f23416ul, this.fby);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        this.htf.setText("Function");
        this.f23428zb.setText("Permission list");
        this.thx.setText(" | ");
        this.wwx.setText(" | ");
        this.ycx.setText("Privacy policy");
        com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar = this.f23413ok;
        if (ulVar != null) {
            this.htf.setTextColor(ulVar.ul());
            this.htf.setTextSize(this.f23413ok.lud());
            this.f23428zb.setTextColor(this.f23413ok.ul());
            this.f23428zb.setTextSize(this.f23413ok.lud());
            this.thx.setTextColor(this.f23413ok.ul());
            this.wwx.setTextColor(this.f23413ok.ul());
            this.ycx.setTextColor(this.f23413ok.ul());
            this.ycx.setTextSize(this.f23413ok.lud());
            return false;
        }
        this.htf.setTextColor(-1);
        this.htf.setTextSize(12.0f);
        this.f23428zb.setTextColor(-1);
        this.f23428zb.setTextSize(12.0f);
        this.thx.setTextColor(-1);
        this.wwx.setTextColor(-1);
        this.ycx.setTextColor(-1);
        this.ycx.setTextSize(12.0f);
        return false;
    }
}
