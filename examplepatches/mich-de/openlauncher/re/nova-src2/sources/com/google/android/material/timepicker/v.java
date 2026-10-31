package com.google.android.material.timepicker;

import android.view.GestureDetector;
import android.view.MotionEvent;

/* loaded from: classes3.dex */
public final class v extends GestureDetector.SimpleOnGestureListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ TimePickerView f34530a;

    public v(TimePickerView timePickerView) {
        this.f34530a = timePickerView;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTap(MotionEvent motionEvent) {
        MaterialTimePicker materialTimePicker = this.f34530a.f34483w;
        if (materialTimePicker == null) {
            return false;
        }
        materialTimePicker.f34465t = 1;
        materialTimePicker.q(materialTimePicker.f34463r);
        materialTimePicker.f34455h.c();
        return true;
    }
}
