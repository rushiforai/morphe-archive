package ads_mobile_sdk;

import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class wx1 implements GestureDetector.OnGestureListener, GestureDetector.OnDoubleTapListener {

    /* renamed from: a, reason: collision with root package name */
    public final zt1 f11511a;

    /* renamed from: b, reason: collision with root package name */
    public final WeakReference f11512b;

    public wx1(zt1 nativeAdCore, WeakReference weakReference) {
        Intrinsics.g(nativeAdCore, "nativeAdCore");
        this.f11511a = nativeAdCore;
        this.f11512b = weakReference;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTap(MotionEvent e3) {
        Intrinsics.g(e3, "e");
        return false;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTapEvent(MotionEvent e3) {
        Intrinsics.g(e3, "e");
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent e3) {
        Intrinsics.g(e3, "e");
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onFling(MotionEvent motionEvent, MotionEvent e22, float f11, float f12) {
        int i5;
        float x11;
        int i11;
        Intrinsics.g(e22, "e2");
        if (motionEvent != null) {
            if (Math.abs(f11) > Math.abs(f12)) {
                if (f11 > 0.0f) {
                    ui.c[] cVarArr = ui.c.f91282b;
                    i5 = 1;
                } else {
                    ui.c[] cVarArr2 = ui.c.f91282b;
                    i5 = 2;
                }
            } else if (f12 > 0.0f) {
                ui.c[] cVarArr3 = ui.c.f91282b;
                i5 = 8;
            } else if (f12 < 0.0f) {
                ui.c[] cVarArr4 = ui.c.f91282b;
                i5 = 4;
            }
            zt1 zt1Var = this.f11511a;
            if (i5 == zt1Var.e()) {
                if (i5 == 1 || i5 == 2) {
                    x11 = (e22.getX() - motionEvent.getX()) / f11;
                } else if (i5 == 4 || i5 == 8) {
                    x11 = (e22.getY() - motionEvent.getY()) / f12;
                } else {
                    i11 = 0;
                    zt1Var.a((View) this.f11512b.get(), i11);
                }
                i11 = (int) (x11 * 1000);
                zt1Var.a((View) this.f11512b.get(), i11);
            }
        }
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final void onLongPress(MotionEvent e3) {
        Intrinsics.g(e3, "e");
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onScroll(MotionEvent motionEvent, MotionEvent e22, float f11, float f12) {
        Intrinsics.g(e22, "e2");
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final void onShowPress(MotionEvent e3) {
        Intrinsics.g(e3, "e");
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public final boolean onSingleTapConfirmed(MotionEvent e3) {
        Intrinsics.g(e3, "e");
        zt1 zt1Var = this.f11511a;
        if (!zt1Var.d()) {
            return false;
        }
        zt1Var.c();
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public final boolean onSingleTapUp(MotionEvent e3) {
        Intrinsics.g(e3, "e");
        return false;
    }
}
