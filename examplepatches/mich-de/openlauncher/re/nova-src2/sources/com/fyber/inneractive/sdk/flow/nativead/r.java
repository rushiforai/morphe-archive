package com.fyber.inneractive.sdk.flow.nativead;

import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.fyber.inneractive.sdk.flow.w0;

/* loaded from: classes3.dex */
public final class r extends GestureDetector.SimpleOnGestureListener implements View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public final GestureDetector f28245a;

    /* renamed from: b, reason: collision with root package name */
    public final u f28246b;

    /* renamed from: c, reason: collision with root package name */
    public String f28247c;

    public r(Context context, u uVar) {
        this.f28246b = uVar;
        this.f28245a = new GestureDetector(context, this);
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public final boolean onDoubleTap(MotionEvent motionEvent) {
        onSingleTapConfirmed(motionEvent);
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent motionEvent) {
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final void onLongPress(MotionEvent motionEvent) {
        onSingleTapConfirmed(motionEvent);
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public final boolean onSingleTapConfirmed(MotionEvent motionEvent) {
        ((w0) this.f28246b).b(this.f28247c);
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onSingleTapUp(MotionEvent motionEvent) {
        return true;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        this.f28247c = view.getTag() instanceof String ? view.getTag().toString() : null;
        return this.f28245a.onTouchEvent(motionEvent);
    }
}
