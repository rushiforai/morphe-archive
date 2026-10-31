package yf;

import android.content.Context;
import android.graphics.PointF;
import android.opengl.Matrix;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes3.dex */
public final class l extends GestureDetector.SimpleOnGestureListener implements View.OnTouchListener, c {

    /* renamed from: c, reason: collision with root package name */
    public final j f97306c;

    /* renamed from: e, reason: collision with root package name */
    public final GestureDetector f97308e;

    /* renamed from: a, reason: collision with root package name */
    public final PointF f97304a = new PointF();

    /* renamed from: b, reason: collision with root package name */
    public final PointF f97305b = new PointF();

    /* renamed from: d, reason: collision with root package name */
    public final float f97307d = 25.0f;

    /* renamed from: f, reason: collision with root package name */
    public volatile float f97309f = 3.1415927f;

    public l(Context context, j jVar) {
        this.f97306c = jVar;
        this.f97308e = new GestureDetector(context, this);
    }

    @Override // yf.c
    public final void a(float[] fArr, float f11) {
        this.f97309f = -f11;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onDown(MotionEvent motionEvent) {
        this.f97304a.set(motionEvent.getX(), motionEvent.getY());
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f11, float f12) {
        float x11 = (motionEvent2.getX() - this.f97304a.x) / this.f97307d;
        float y11 = motionEvent2.getY();
        PointF pointF = this.f97304a;
        float f13 = (y11 - pointF.y) / this.f97307d;
        pointF.set(motionEvent2.getX(), motionEvent2.getY());
        double d5 = this.f97309f;
        float fCos = (float) Math.cos(d5);
        float fSin = (float) Math.sin(d5);
        PointF pointF2 = this.f97305b;
        pointF2.x -= (fCos * x11) - (fSin * f13);
        float f14 = (fCos * f13) + (fSin * x11) + pointF2.y;
        pointF2.y = f14;
        pointF2.y = Math.max(-45.0f, Math.min(45.0f, f14));
        j jVar = this.f97306c;
        PointF pointF3 = this.f97305b;
        synchronized (jVar) {
            float f15 = pointF3.y;
            jVar.f97288g = f15;
            Matrix.setRotateM(jVar.f97286e, 0, -f15, (float) Math.cos(jVar.f97289h), (float) Math.sin(jVar.f97289h), 0.0f);
            Matrix.setRotateM(jVar.f97287f, 0, -pointF3.x, 0.0f, 1.0f, 0.0f);
        }
        return true;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onSingleTapUp(MotionEvent motionEvent) {
        return this.f97306c.f97292k.performClick();
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        return this.f97308e.onTouchEvent(motionEvent);
    }
}
