package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ry {

    /* renamed from: dj, reason: collision with root package name */
    private final zb f25133dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f25134lt;
    private boolean lud = false;
    private final Activity sya;
    com.bytedance.sdk.openadsdk.component.reward.top.sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    com.bytedance.sdk.component.adexpress.dynamic.dj f25135zb;

    public ry(zb zbVar) {
        this.sya = zbVar.yzp;
        this.f25133dj = zbVar;
    }

    public void dj(boolean z11) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.setShowSkip(z11);
    }

    public void lud(boolean z11) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.setSkipEnable(z11);
    }

    public void sya(boolean z11) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.setShowSound(z11);
    }

    public void ycx() {
        if (this.lud) {
            return;
        }
        this.lud = true;
        zb zbVar = this.f25133dj;
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = zbVar.bjp;
        if (syaVar != null) {
            this.ycx = syaVar;
            this.f25134lt = true;
        } else {
            this.ycx = (com.bytedance.sdk.openadsdk.component.reward.top.sya) zbVar.ifb.findViewById(com.bytedance.sdk.openadsdk.utils.wie.wnd);
        }
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar2 = this.ycx;
        if (syaVar2 != null) {
            syaVar2.ycx(this.f25133dj.f25203zb);
            if (this.f25133dj.f25203zb.wnd()) {
                ycx(false);
            } else {
                ycx(this.f25133dj.f25203zb.kfb());
            }
        }
    }

    public void zb(boolean z11) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.ycx;
        if (syaVar != null) {
            syaVar.setSoundMute(z11);
        }
        com.bytedance.sdk.component.adexpress.dynamic.dj djVar = this.f25135zb;
        if (djVar != null) {
            djVar.setSoundMute(z11);
        }
    }

    public void dj() {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.ycx;
        if (syaVar != null) {
            syaVar.clickSkip();
        }
    }

    public void lud() {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.setSkipInvisiable();
    }

    public void sya() {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.showSkipButton();
    }

    public void zb() {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.showCountDownText();
    }

    public void ycx(boolean z11) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.setShowDislike(z11);
    }

    public void ycx(String str, CharSequence charSequence) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.setTime(String.valueOf(str), charSequence);
    }

    public void ycx(CharSequence charSequence) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar;
        if (this.f25134lt || (syaVar = this.ycx) == null) {
            return;
        }
        syaVar.setSkipText(charSequence);
    }

    public void ycx(String str) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.ycx;
        if (syaVar != null) {
            syaVar.clickSound(str);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.top.zb zbVar) {
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.ycx;
        if (syaVar != null) {
            syaVar.setListener(zbVar);
        }
    }

    public void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj djVar) {
        this.f25135zb = djVar;
    }

    public void ycx(int i5) {
        View viewFindViewById;
        com.bytedance.sdk.openadsdk.component.reward.top.sya syaVar = this.ycx;
        if (syaVar == null || syaVar.getITopLayout() == null || i5 == 0 || (viewFindViewById = this.ycx.getITopLayout().findViewById(520093713)) == null || !(viewFindViewById.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) || viewFindViewById.getWidth() <= 0 || viewFindViewById.getVisibility() != 0) {
            return;
        }
        int[] iArr = new int[2];
        viewFindViewById.getLocationOnScreen(iArr);
        int width = i5 - (viewFindViewById.getWidth() + iArr[0]);
        if (width < dc.zb(this.sya, 16.0f)) {
            ((ViewGroup.MarginLayoutParams) viewFindViewById.getLayoutParams()).rightMargin = (dc.zb(this.sya, 16.0f) - width) + ((ViewGroup.MarginLayoutParams) viewFindViewById.getLayoutParams()).rightMargin;
            viewFindViewById.requestLayout();
        }
    }
}
