package com.bytedance.sdk.openadsdk.component.jw;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.bytedance.sdk.openadsdk.core.jc.lt;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.core.widget.wie;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class lud extends sya {

    /* renamed from: ry, reason: collision with root package name */
    ycx f24788ry;

    public interface ycx {
        void ycx(View view, int i5);
    }

    public lud(Context context, tn tnVar) {
        super(context);
        ycx(context, tnVar);
    }

    private void ycx(Context context, tn tnVar) {
        com.bytedance.sdk.openadsdk.core.jc.lt ltVar = new com.bytedance.sdk.openadsdk.core.jc.lt(context);
        com.bytedance.sdk.openadsdk.core.jc.dj.ycx(ltVar);
        ltVar.ycx(tnVar, new lt.zb() { // from class: com.bytedance.sdk.openadsdk.component.jw.lud.1
            @Override // com.bytedance.sdk.openadsdk.core.jc.lt.zb
            public void ycx(int i5, int i11) {
            }

            @Override // com.bytedance.sdk.openadsdk.core.jc.lt.zb
            public void zb() {
            }

            @Override // com.bytedance.sdk.openadsdk.core.jc.lt.zb
            public View ycx() {
                return lud.this;
            }

            @Override // com.bytedance.sdk.openadsdk.core.jc.lt.zb
            public void ycx(View view, int i5) {
                ycx ycxVar = lud.this.f24788ry;
                if (ycxVar != null) {
                    ycxVar.ycx(view, i5);
                }
            }
        }, "open_ad");
        addView(ltVar, new ViewGroup.LayoutParams(-1, -1));
        ltVar.htf();
        int iZb = dc.zb(context, 9.0f);
        int iZb2 = dc.zb(context, 10.0f);
        this.f24789dj = PAGLogoView.createPAGLogoViewByMaterial(context, tnVar);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, dc.zb(context, 14.0f));
        layoutParams.leftMargin = iZb2;
        layoutParams.bottomMargin = iZb2;
        layoutParams.addRule(12);
        layoutParams.addRule(9);
        addView(this.f24789dj, layoutParams);
        com.bytedance.sdk.openadsdk.core.widget.sya syaVar = new com.bytedance.sdk.openadsdk.core.widget.sya(context);
        this.f24794ok = syaVar;
        syaVar.setPadding(iZb, 0, iZb, 0);
        this.f24794ok.setScaleType(ImageView.ScaleType.FIT_CENTER);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(dc.zb(context, 32.0f), dc.zb(context, 14.0f));
        layoutParams2.addRule(12);
        layoutParams2.addRule(11);
        layoutParams2.setMargins(0, 0, iZb2, iZb2);
        addView(this.f24794ok, layoutParams2);
        View view = this.fby;
        if (view != null) {
            addView(view);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public com.bytedance.sdk.openadsdk.core.lt.dj getAdIconView() {
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public com.bytedance.sdk.openadsdk.core.lt.fby getAdTitleTextView() {
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public wie getScoreBar() {
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public View getUserInfo() {
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f24788ry = null;
    }

    public void setRenderListener(ycx ycxVar) {
        this.f24788ry = ycxVar;
    }
}
