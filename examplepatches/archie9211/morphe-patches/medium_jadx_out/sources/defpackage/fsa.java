package defpackage;

import android.view.MotionEvent;
import android.view.View;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fsa implements View.OnTouchListener {
    public final d34 a;
    public final WeakReference b;
    public final WeakReference c;
    public final View.OnTouchListener d;

    public fsa(d34 d34Var, View view, View view2) {
        this.a = d34Var;
        this.b = new WeakReference(view2);
        this.c = new WeakReference(view);
        this.d = gue.g(view2);
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        view.getClass();
        motionEvent.getClass();
        View view2 = (View) this.c.get();
        View view3 = (View) this.b.get();
        if (view2 != null && view3 != null && motionEvent.getAction() == 1) {
            dq1.B(this.a, view2, view3);
        }
        View.OnTouchListener onTouchListener = this.d;
        return onTouchListener != null && onTouchListener.onTouch(view, motionEvent);
    }
}
