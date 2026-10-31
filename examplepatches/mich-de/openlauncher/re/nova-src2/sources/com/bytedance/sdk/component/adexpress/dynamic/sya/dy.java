package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.htf;

/* loaded from: classes2.dex */
public class dy implements ul {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.ul f23453dj;
    private com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud sya;
    private htf ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Context f23454zb;

    public dy(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        this.f23454zb = context;
        this.sya = ludVar;
        this.f23453dj = ulVar;
        dj();
    }

    private void dj() {
        this.ycx = new htf(this.f23454zb);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23454zb, 120.0f));
        layoutParams.gravity = 17;
        this.ycx.setLayoutParams(layoutParams);
        this.ycx.setClipChildren(false);
        this.ycx.setGuideText(this.f23453dj.uf());
        com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar = this.sya;
        if (ludVar != null) {
            this.ycx.setOnClickListener((View.OnClickListener) ludVar.getDynamicClickListener());
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public ViewGroup sya() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void ycx() {
        htf htfVar = this.ycx;
        if (htfVar != null) {
            htfVar.ycx();
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void zb() {
        htf htfVar = this.ycx;
        if (htfVar != null) {
            htfVar.zb();
        }
    }
}
