package com.bytedance.sdk.openadsdk.component.reward.view;

import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class fby extends com.bytedance.sdk.openadsdk.core.lt.sya {
    private final com.bytedance.sdk.openadsdk.component.reward.ycx.zb ycx;

    public fby(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        super(zbVar.oby);
        this.ycx = zbVar;
        if (zbVar.f25196uu != null || Build.VERSION.SDK_INT < 35) {
            return;
        }
        setFitsSystemWindows(true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.view.fby.1
            @Override // java.lang.Runnable
            public void run() {
                fby.this.ycx();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.ycx;
        if (zbVar != null && com.bytedance.sdk.openadsdk.core.jc.zb.ycx.zb(zbVar.yzp)) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.ycx;
            if (zbVar2.f25188sg) {
                return;
            }
            float[] fArrYcx = com.bytedance.sdk.openadsdk.component.reward.ycx.ok.ycx(zbVar2.yzp, zbVar2.bba, false);
            int i5 = (int) fArrYcx[0];
            int i11 = (int) fArrYcx[1];
            ViewGroup.LayoutParams layoutParams = getLayoutParams();
            FrameLayout.LayoutParams layoutParams2 = layoutParams instanceof FrameLayout.LayoutParams ? (FrameLayout.LayoutParams) layoutParams : layoutParams != null ? new FrameLayout.LayoutParams(layoutParams) : new FrameLayout.LayoutParams(i5, i11);
            boolean z11 = (layoutParams2.width == i5 && layoutParams2.height == i11) ? false : true;
            layoutParams2.width = i5;
            layoutParams2.height = i11;
            layoutParams2.gravity = 17;
            if (z11) {
                setLayoutParams(layoutParams2);
            }
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.zb.zb zbVar) {
        RFEndCardBackUpLayout rFEndCardBackUpLayoutUl;
        zbVar.ycx(this);
        if (this.ycx.ycx != 1 && (rFEndCardBackUpLayoutUl = zbVar.ul()) != null) {
            addView(rFEndCardBackUpLayoutUl, new FrameLayout.LayoutParams(-1, -1));
        }
        ycx(zbVar.fby(), this);
        ycx(zbVar.jw(), this);
    }

    private void ycx(View view, ViewGroup viewGroup) {
        if (view != null) {
            viewGroup.addView(view, new FrameLayout.LayoutParams(-1, -1));
        }
    }
}
