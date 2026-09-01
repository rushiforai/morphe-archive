package it.sephiroth.android.library.imagezoom;

import android.content.Context;
import android.graphics.PointF;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import defpackage.bw5;
import defpackage.gy5;
import defpackage.hy5;
import defpackage.iy5;
import defpackage.py5;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class ImageViewTouch extends py5 {
    public static final /* synthetic */ int J = 0;
    public float A;
    public ScaleGestureDetector B;
    public GestureDetector C;
    public GestureDetector.OnGestureListener D;
    public ScaleGestureDetector.OnScaleGestureListener E;
    public boolean F;
    public boolean G;
    public boolean H;
    public long I;

    public ImageViewTouch(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.F = true;
        this.G = true;
        this.H = true;
    }

    @Override // defpackage.py5
    public final void e() {
        Log.v("ImageViewTouchBase", "min: " + getMinScale() + ", max: " + getMaxScale() + ", result: " + ((getMaxScale() - getMinScale()) / 2.0f));
        this.A = ((getMaxScale() - getMinScale()) / 2.0f) + 0.5f;
    }

    public boolean getDoubleTapEnabled() {
        return this.F;
    }

    public GestureDetector.OnGestureListener getGestureListener() {
        return new bw5(this, 1);
    }

    public boolean getQuickScaleEnabled() {
        return this.B.isQuickScaleEnabled();
    }

    public float getScaleFactor() {
        return this.A;
    }

    public ScaleGestureDetector.OnScaleGestureListener getScaleListener() {
        return new iy5(this);
    }

    public final boolean l() {
        if (getScale() > 1.0f) {
            return true;
        }
        return !this.w.contains(getBitmapRect());
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (getBitmapChanged()) {
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 6) {
            this.I = motionEvent.getEventTime();
        }
        this.B.onTouchEvent(motionEvent);
        if (!this.B.isInProgress()) {
            this.C.onTouchEvent(motionEvent);
        }
        if (actionMasked != 1) {
            return true;
        }
        if (getBitmapChanged()) {
            return false;
        }
        if (getScale() < getMinScale()) {
            float minScale = getMinScale();
            PointF center = getCenter();
            k(minScale, center.x, center.y, 50L);
        }
        return true;
    }

    public void setDoubleTapEnabled(boolean z) {
        this.F = z;
    }

    public void setQuickScaleEnabled(boolean z) {
        this.B.setQuickScaleEnabled(z);
    }

    public void setScaleEnabled(boolean z) {
        this.G = z;
    }

    public void setScrollEnabled(boolean z) {
        this.H = z;
    }

    public void setDoubleTapListener(gy5 gy5Var) {
    }

    public void setSingleTapListener(hy5 hy5Var) {
    }
}
