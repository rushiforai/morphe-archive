package r;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;

/* loaded from: classes2.dex */
public final class h1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84723a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i1 f84724b;

    public /* synthetic */ h1(i1 i1Var, int i5) {
        this.f84723a = i5;
        this.f84724b = i1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f84723a) {
            case 0:
                ViewParent parent = this.f84724b.f84749d.getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                    break;
                }
                break;
            default:
                i1 i1Var = this.f84724b;
                i1Var.a();
                View view = i1Var.f84749d;
                if (view.isEnabled() && !view.isLongClickable() && i1Var.c()) {
                    view.getParent().requestDisallowInterceptTouchEvent(true);
                    long jUptimeMillis = SystemClock.uptimeMillis();
                    MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                    view.onTouchEvent(motionEventObtain);
                    motionEventObtain.recycle();
                    i1Var.f84752g = true;
                    break;
                }
                break;
        }
    }
}
