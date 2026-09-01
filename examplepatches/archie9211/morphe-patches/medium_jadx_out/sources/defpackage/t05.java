package defpackage;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t05 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ u05 b;

    public /* synthetic */ t05(u05 u05Var, int i) {
        this.a = i;
        this.b = u05Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        u05 u05Var = this.b;
        switch (i) {
            case 0:
                ViewParent parent = u05Var.d.getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                break;
            default:
                u05Var.a();
                View view = u05Var.d;
                if (view.isEnabled() && !view.isLongClickable() && u05Var.c()) {
                    view.getParent().requestDisallowInterceptTouchEvent(true);
                    long jUptimeMillis = SystemClock.uptimeMillis();
                    MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                    view.onTouchEvent(motionEventObtain);
                    motionEventObtain.recycle();
                    u05Var.g = true;
                    break;
                }
                break;
        }
    }
}
