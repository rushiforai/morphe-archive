package com.google.android.material.timepicker;

import android.view.ViewTreeObserver;

/* loaded from: classes3.dex */
public final class b implements ViewTreeObserver.OnPreDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ClockFaceView f34485a;

    public b(ClockFaceView clockFaceView) {
        this.f34485a = clockFaceView;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        ClockFaceView clockFaceView = this.f34485a;
        if (!clockFaceView.isShown()) {
            return true;
        }
        clockFaceView.getViewTreeObserver().removeOnPreDrawListener(this);
        int height = ((clockFaceView.getHeight() / 2) - clockFaceView.f34420s.f34439k) - clockFaceView.A;
        if (height != clockFaceView.f34497q) {
            clockFaceView.f34497q = height;
            clockFaceView.n();
            ClockHandView clockHandView = clockFaceView.f34420s;
            clockHandView.f34446t = clockFaceView.f34497q;
            clockHandView.invalidate();
        }
        return true;
    }
}
