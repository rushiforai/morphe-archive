package androidx.recyclerview.widget;

import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes2.dex */
public final class o0 extends GestureDetector.SimpleOnGestureListener {

    /* renamed from: a, reason: collision with root package name */
    public boolean f15067a = true;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r0 f15068b;

    public o0(r0 r0Var) {
        this.f15068b = r0Var;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent motionEvent) {
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final void onLongPress(MotionEvent motionEvent) {
        View viewH;
        s2 childViewHolder;
        r0 r0Var = this.f15068b;
        p0 p0Var = r0Var.f15097m;
        if (this.f15067a && (viewH = r0Var.h(motionEvent)) != null && (childViewHolder = r0Var.f15100r.getChildViewHolder(viewH)) != null && p0Var.hasDragFlag(r0Var.f15100r, childViewHolder)) {
            int pointerId = motionEvent.getPointerId(0);
            int i5 = r0Var.f15096l;
            if (pointerId == i5) {
                int iFindPointerIndex = motionEvent.findPointerIndex(i5);
                float x11 = motionEvent.getX(iFindPointerIndex);
                float y11 = motionEvent.getY(iFindPointerIndex);
                r0Var.f15088d = x11;
                r0Var.f15089e = y11;
                r0Var.f15093i = 0.0f;
                r0Var.f15092h = 0.0f;
                if (p0Var.isLongPressDragEnabled()) {
                    r0Var.m(childViewHolder, 2);
                }
            }
        }
    }
}
