package com.google.android.material.timepicker;

import android.os.Bundle;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes3.dex */
public final class c extends a5.b {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ClockFaceView f34486d;

    public c(ClockFaceView clockFaceView) {
        this.f34486d = clockFaceView;
    }

    @Override // a5.b
    public final void d(View view, b5.g gVar) {
        this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
        int iIntValue = ((Integer) view.getTag(2131428339)).intValue();
        if (iIntValue > 0) {
            gVar.f0((View) this.f34486d.f34424w.get(iIntValue - 1));
        }
        gVar.B(b5.f.k(false, view.isSelected(), 0, 1, iIntValue, 1));
        gVar.z(true);
        gVar.b(b5.d.f17535e);
    }

    @Override // a5.b
    public final boolean g(View view, int i5, Bundle bundle) {
        if (i5 != 16) {
            return super.g(view, i5, bundle);
        }
        long jUptimeMillis = SystemClock.uptimeMillis();
        ClockFaceView clockFaceView = this.f34486d;
        view.getHitRect(clockFaceView.f34421t);
        float fCenterX = clockFaceView.f34421t.centerX();
        float fCenterY = clockFaceView.f34421t.centerY();
        clockFaceView.f34420s.onTouchEvent(MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 0, fCenterX, fCenterY, 0));
        clockFaceView.f34420s.onTouchEvent(MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 1, fCenterX, fCenterY, 0));
        return true;
    }
}
