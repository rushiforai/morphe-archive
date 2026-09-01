package defpackage;

import android.view.ScaleGestureDetector;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class iy5 extends ScaleGestureDetector.SimpleOnScaleGestureListener {
    public boolean a = false;
    public final /* synthetic */ ImageViewTouch b;

    public iy5(ImageViewTouch imageViewTouch) {
        this.b = imageViewTouch;
    }

    @Override // android.view.ScaleGestureDetector.SimpleOnScaleGestureListener, android.view.ScaleGestureDetector.OnScaleGestureListener
    public final boolean onScale(ScaleGestureDetector scaleGestureDetector) {
        float currentSpan = scaleGestureDetector.getCurrentSpan() - scaleGestureDetector.getPreviousSpan();
        ImageViewTouch imageViewTouch = this.b;
        float scaleFactor = scaleGestureDetector.getScaleFactor() * imageViewTouch.getScale();
        if (imageViewTouch.G) {
            boolean z = this.a;
            if (z && currentSpan != 0.0f) {
                imageViewTouch.e = true;
                imageViewTouch.j(Math.min(imageViewTouch.getMaxScale(), Math.max(scaleFactor, imageViewTouch.getMinScale() - 0.1f)), scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
                imageViewTouch.invalidate();
                return true;
            }
            if (!z) {
                this.a = true;
            }
        }
        return true;
    }
}
