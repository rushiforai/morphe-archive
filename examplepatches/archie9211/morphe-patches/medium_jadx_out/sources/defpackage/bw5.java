package defpackage;

import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.os.SystemClock;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bw5 extends GestureDetector.SimpleOnGestureListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ View b;

    public /* synthetic */ bw5(View view, int i) {
        this.a = i;
        this.b = view;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTap(MotionEvent motionEvent) {
        switch (this.a) {
            case 1:
                int i = py5.z;
                ImageViewTouch imageViewTouch = (ImageViewTouch) this.b;
                if (imageViewTouch.F) {
                    if (!imageViewTouch.B.isQuickScaleEnabled()) {
                        imageViewTouch.e = true;
                        float scale = imageViewTouch.getScale();
                        float maxScale = imageViewTouch.getMaxScale();
                        float minScale = imageViewTouch.getMinScale();
                        float f = scale + imageViewTouch.A;
                        if (f <= maxScale) {
                            minScale = f;
                        }
                        imageViewTouch.k(Math.min(imageViewTouch.getMaxScale(), Math.max(minScale, imageViewTouch.getMinScale())), motionEvent.getX(), motionEvent.getY(), imageViewTouch.o);
                    }
                }
                break;
        }
        return super.onDoubleTap(motionEvent);
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public boolean onDown(MotionEvent motionEvent) {
        switch (this.a) {
            case 1:
                int i = py5.z;
                ImageViewTouch imageViewTouch = (ImageViewTouch) this.b;
                AnimatorSet animatorSet = imageViewTouch.y;
                if (animatorSet != null) {
                    animatorSet.cancel();
                    imageViewTouch.y = null;
                }
                return !imageViewTouch.getBitmapChanged();
            default:
                return super.onDown(motionEvent);
        }
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
        switch (this.a) {
            case 1:
                ImageViewTouch imageViewTouch = (ImageViewTouch) this.b;
                if (!imageViewTouch.H || motionEvent == null || motionEvent2 == null || motionEvent.getPointerCount() > 1 || motionEvent2.getPointerCount() > 1 || imageViewTouch.B.isInProgress() || SystemClock.uptimeMillis() - imageViewTouch.I <= 150 || !imageViewTouch.l()) {
                    return false;
                }
                if (Math.abs(f) <= imageViewTouch.p * 4 && Math.abs(f2) <= imageViewTouch.p * 4) {
                    return false;
                }
                float fMin = Math.min(Math.max(2.0f, imageViewTouch.getScale() / 2.0f), 3.0f);
                float width = imageViewTouch.getWidth() * fMin * (f / imageViewTouch.q);
                float height = imageViewTouch.getHeight() * fMin * (f2 / imageViewTouch.q);
                imageViewTouch.e = true;
                long jMin = (long) Math.min(Math.max(300.0d, Math.sqrt(Math.pow(height, 2.0d) + Math.pow(width, 2.0d)) / 5.0d), 800.0d);
                ValueAnimator duration = ValueAnimator.ofFloat(0.0f, width).setDuration(jMin);
                ValueAnimator duration2 = ValueAnimator.ofFloat(0.0f, height).setDuration(jMin);
                AnimatorSet animatorSet = imageViewTouch.y;
                if (animatorSet != null) {
                    animatorSet.cancel();
                    imageViewTouch.y = null;
                }
                AnimatorSet animatorSet2 = new AnimatorSet();
                imageViewTouch.y = animatorSet2;
                animatorSet2.playTogether(duration, duration2);
                imageViewTouch.y.setDuration(jMin);
                imageViewTouch.y.setInterpolator(new DecelerateInterpolator());
                imageViewTouch.y.start();
                duration2.addUpdateListener(new jy5(imageViewTouch, duration, duration2));
                imageViewTouch.y.addListener(new ky5(imageViewTouch));
                imageViewTouch.postInvalidate();
                return true;
            default:
                return super.onFling(motionEvent, motionEvent2, f, f2);
        }
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public void onLongPress(MotionEvent motionEvent) {
        switch (this.a) {
            case 1:
                ImageViewTouch imageViewTouch = (ImageViewTouch) this.b;
                if (imageViewTouch.isLongClickable() && !imageViewTouch.B.isInProgress()) {
                    imageViewTouch.setPressed(true);
                    imageViewTouch.performLongClick();
                    break;
                }
                break;
            default:
                super.onLongPress(motionEvent);
                break;
        }
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public final boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
        int i = this.a;
        View view = this.b;
        switch (i) {
            case 0:
                motionEvent2.getClass();
                ((cw5) view).getParent().requestDisallowInterceptTouchEvent(true);
                return false;
            case 1:
                ImageViewTouch imageViewTouch = (ImageViewTouch) view;
                if (!imageViewTouch.H || motionEvent == null || motionEvent2 == null || motionEvent.getPointerCount() > 1 || motionEvent2.getPointerCount() > 1 || imageViewTouch.B.isInProgress() || !imageViewTouch.l()) {
                    return false;
                }
                imageViewTouch.e = true;
                imageViewTouch.f(-f, -f2);
                imageViewTouch.invalidate();
                return true;
            default:
                motionEvent2.getClass();
                ViewParent parent = ((g6d) view).getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                return false;
        }
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public boolean onSingleTapConfirmed(MotionEvent motionEvent) {
        switch (this.a) {
            case 1:
                int i = ImageViewTouch.J;
                return true;
            default:
                return super.onSingleTapConfirmed(motionEvent);
        }
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public boolean onSingleTapUp(MotionEvent motionEvent) {
        switch (this.a) {
            case 1:
                return !((ImageViewTouch) this.b).getBitmapChanged();
            default:
                return super.onSingleTapUp(motionEvent);
        }
    }
}
