package com.bytedance.adsdk.ugeno.ul;

import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import com.bytedance.adsdk.ugeno.lud;

/* loaded from: classes2.dex */
public class zb extends ycx<com.bytedance.adsdk.ugeno.zb.sya> {

    /* renamed from: dj, reason: collision with root package name */
    private lud f22526dj;

    public zb(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.ul.ycx
    public View ea(int i5) {
        return ((com.bytedance.adsdk.ugeno.zb.sya) this.ycx.get(i5)).ea();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.f22526dj;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.f22526dj;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        lud ludVar = this.f22526dj;
        if (ludVar != null) {
            ludVar.lt();
        }
        super.onLayout(z11, i5, i11, i12, i13);
        lud ludVar2 = this.f22526dj;
        if (ludVar2 != null) {
            ludVar2.ycx(i5, i11, i12, i13);
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        lud ludVar = this.f22526dj;
        if (ludVar != null) {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            super.onMeasure(iArrYcx[0], iArrYcx[1]);
        } else {
            super.onMeasure(i5, i11);
        }
        lud ludVar2 = this.f22526dj;
        if (ludVar2 != null) {
            ludVar2.lud();
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        lud ludVar = this.f22526dj;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        lud ludVar = this.f22526dj;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    public void ycx(lud ludVar) {
        this.f22526dj = ludVar;
    }
}
