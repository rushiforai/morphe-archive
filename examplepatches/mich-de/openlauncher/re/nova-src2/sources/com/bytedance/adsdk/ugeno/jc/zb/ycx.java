package com.bytedance.adsdk.ugeno.jc.zb;

import android.content.Context;
import android.graphics.Canvas;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.lud;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx extends FrameLayout {
    private lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Map<Integer, ry> f22351zb;

    public ycx(Context context) {
        super(context);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        Map<Integer, ry> map = this.f22351zb;
        if (map == null || !map.containsKey(4)) {
            return super.onInterceptTouchEvent(motionEvent);
        }
        return true;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.lt();
        }
        super.onLayout(z11, i5, i11, i12, i13);
        lud ludVar2 = this.ycx;
        if (ludVar2 != null) {
            ludVar2.ycx(i5, i11, i12, i13);
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        lud ludVar = this.ycx;
        if (ludVar != null) {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            super.onMeasure(iArrYcx[0], iArrYcx[1]);
        } else {
            super.onMeasure(i5, i11);
        }
        lud ludVar2 = this.ycx;
        if (ludVar2 != null) {
            ludVar2.lud();
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    public void setEventMap(Map<Integer, ry> map) {
        this.f22351zb = map;
    }

    public void ycx(lud ludVar) {
        this.ycx = ludVar;
    }
}
