package com.android.launcher3.workprofile;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import b.l2;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import o9.s2;

/* loaded from: classes2.dex */
public class PersonalWorkPagedView extends s2 {
    public PersonalWorkPagedView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    @Override // o9.s2
    public final String C() {
        return b.f42142b;
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    @Override // o9.s2
    public final boolean n(float f11, float f12) {
        return f12 > f11 && super.n(f11, f12);
    }

    @Override // o9.s2, android.view.View
    public final void onScrollChanged(int i5, int i11, int i12, int i13) {
        super.onScrollChanged(i5, i11, i12, i13);
        ((PersonalWorkSlidingTabStrip) this.E).getClass();
    }

    @Override // o9.s2
    public final void p(MotionEvent motionEvent) {
        float fAbs = Math.abs(motionEvent.getX() - this.f80113m);
        float fAbs2 = Math.abs(motionEvent.getY() - this.n);
        if (Float.compare(fAbs, 0.0f) == 0) {
            return;
        }
        float fAtan = (float) Math.atan(fAbs2 / fAbs);
        float f11 = this.f80121w;
        if (fAbs > f11 || fAbs2 > f11) {
            s(new l2(10));
        }
        if (fAtan > 1.0471976f) {
            return;
        }
        if (fAtan > 0.5235988f) {
            q(motionEvent, (((float) Math.sqrt((fAtan - 0.5235988f) / 0.5235988f)) * 4.0f) + 1.0f);
        } else {
            super.p(motionEvent);
        }
    }
}
