package com.bytedance.sdk.openadsdk.component.reward.view;

import android.content.Context;
import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.sdk.openadsdk.core.lt.sya {

    /* renamed from: dj, reason: collision with root package name */
    private float f25022dj;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.activity.single.fby f25023lt;
    private float lud;
    private com.bytedance.sdk.openadsdk.core.lt.sya sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f25024ul;
    private final boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f25025zb;

    public zb(Context context, boolean z11, boolean z12, final int i5) {
        super(context);
        this.ycx = z11;
        this.f25025zb = z12;
        if (z11) {
            setOutlineProvider(new ViewOutlineProvider() { // from class: com.bytedance.sdk.openadsdk.component.reward.view.zb.2
                @Override // android.view.ViewOutlineProvider
                public void getOutline(View view, Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), i5);
                }
            });
            setClipToOutline(true);
            return;
        }
        this.sya = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        addView(this.sya, layoutParams);
        this.sya.setOutlineProvider(new ViewOutlineProvider() { // from class: com.bytedance.sdk.openadsdk.component.reward.view.zb.1
            @Override // android.view.ViewOutlineProvider
            public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), i5);
            }
        });
        this.sya.setClipToOutline(true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar;
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarDv;
        super.onAttachedToWindow();
        if (this.f25024ul || (fbyVar = this.f25023lt) == null || (zbVarDv = fbyVar.dv()) == null) {
            return;
        }
        zbVarDv.f25177hf.zb(true);
        this.f25024ul = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar;
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarDv;
        super.onDetachedFromWindow();
        if (!this.f25024ul || (fbyVar = this.f25023lt) == null || (zbVarDv = fbyVar.dv()) == null) {
            return;
        }
        zbVarDv.f25177hf.zb(false);
        this.f25024ul = false;
    }

    @Override // com.bytedance.sdk.openadsdk.core.lt.sya, android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        if (this.f25025zb) {
            float f11 = this.f25022dj;
            if (f11 > 0.0f) {
                int iMax = Math.max(0, (size - ((int) (size2 * f11))) / 2);
                setPadding(iMax, 0, iMax, 0);
            } else {
                float f12 = this.lud;
                if (f12 > 0.0f) {
                    int iMax2 = Math.max(0, (size - ((int) (size * f12))) / 2);
                    setPadding(iMax2, 0, iMax2, 0);
                }
            }
        } else if (this.ycx) {
            float f13 = this.f25022dj;
            if (f13 > 0.0f) {
                i11 = View.MeasureSpec.makeMeasureSpec((int) (size / f13), 1073741824);
            } else {
                float f14 = this.lud;
                if (f14 > 0.0f) {
                    i11 = View.MeasureSpec.makeMeasureSpec((int) (size2 * f14), 1073741824);
                }
            }
        } else {
            float f15 = this.f25022dj;
            if (f15 > 0.0f) {
                int iMax3 = Math.max(0, (size - ((int) (size2 * f15))) / 2);
                setPadding(iMax3, 0, iMax3, 0);
            } else {
                float f16 = this.lud;
                if (f16 > 0.0f) {
                    int iMax4 = Math.max(0, (size - ((int) (size * f16))) / 2);
                    setPadding(iMax4, 0, iMax4, 0);
                }
            }
        }
        super.onMeasure(i5, i11);
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar;
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVarDv;
        super.onWindowFocusChanged(z11);
        if (this.f25024ul == z11 || (fbyVar = this.f25023lt) == null || (zbVarDv = fbyVar.dv()) == null) {
            return;
        }
        zbVarDv.f25177hf.zb(z11);
    }

    public void setScene(com.bytedance.sdk.openadsdk.activity.single.fby fbyVar) {
        this.f25023lt = fbyVar;
    }

    public void setWidthAndHeightRatio(float f11) {
        this.f25022dj = f11;
    }

    public void setWidthOrHeightInParentRatio(float f11) {
        this.lud = f11;
    }

    public void ycx(fby fbyVar, FrameLayout.LayoutParams layoutParams) {
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = this.sya;
        if (syaVar != null) {
            syaVar.addView(fbyVar, layoutParams);
        } else {
            addView(fbyVar, layoutParams);
        }
    }

    public void ycx() {
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = this.sya;
        if (syaVar != null) {
            syaVar.removeAllViews();
        } else {
            removeAllViews();
        }
    }
}
