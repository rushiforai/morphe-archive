package dev.jason.gboardpatches.extension.symbolfooter;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.PathInterpolator;
import android.widget.ImageView;

final class GboardSymbolFooterOrderDragOverlay {
    private static final String TAG = "GboardPatches";
    private static final PathInterpolator EASE_OUT =
            new PathInterpolator(0.22f, 1f, 0.36f, 1f);

    private final ViewGroup host;
    private final ImageView overlayView;
    private final Bitmap bitmap;
    private final float touchOffsetY;
    private final int height;

    private GboardSymbolFooterOrderDragOverlay(ViewGroup host,
            ImageView overlayView,
            Bitmap bitmap,
            float touchOffsetY,
            int height) {
        this.host = host;
        this.overlayView = overlayView;
        this.bitmap = bitmap;
        this.touchOffsetY = touchOffsetY;
        this.height = height;
    }

    static GboardSymbolFooterOrderDragOverlay attach(ViewGroup host, View source, float rawY) {
        try {
            if (host == null || source == null || source.getWidth() <= 0 || source.getHeight() <= 0) {
                return null;
            }
            Bitmap bitmap = Bitmap.createBitmap(
                    source.getWidth(),
                    source.getHeight(),
                    Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            source.draw(canvas);

            ImageView overlayView = new ImageView(source.getContext());
            overlayView.setImageBitmap(bitmap);
            overlayView.setScaleType(ImageView.ScaleType.FIT_XY);
            overlayView.measure(
                    View.MeasureSpec.makeMeasureSpec(source.getWidth(), View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(source.getHeight(), View.MeasureSpec.EXACTLY));
            overlayView.layout(0, 0, source.getWidth(), source.getHeight());
            overlayView.setX(resolveLeftInHost(host, source));
            overlayView.setY(resolveTopInHost(host, source));
            overlayView.setScaleX(1.02f);
            overlayView.setScaleY(1.02f);
            overlayView.setAlpha(0.98f);
            host.getOverlay().add(overlayView);

            return new GboardSymbolFooterOrderDragOverlay(
                    host,
                    overlayView,
                    bitmap,
                    rawY - resolveSourceTopOnScreen(source),
                    source.getHeight());
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to attach expression footer drag overlay", throwable);
            return null;
        }
    }

    void updateRawY(float rawY) {
        try {
            if (overlayView == null) {
                return;
            }
            overlayView.setY(rawY - resolveHostTopOnScreen(host) - touchOffsetY);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to update expression footer drag overlay", throwable);
        }
    }

    float topInHost() {
        return overlayView != null ? overlayView.getY() : 0f;
    }

    float bottomInHost() {
        return topInHost() + height;
    }

    void animateTo(View targetView, Runnable endAction) {
        try {
            if (overlayView == null || targetView == null) {
                remove();
                if (endAction != null) {
                    endAction.run();
                }
                return;
            }
            float targetY = resolveTopInHost(host, targetView) + targetView.getTranslationY();
            overlayView.animate()
                    .y(targetY)
                    .scaleX(1f)
                    .scaleY(1f)
                    .alpha(1f)
                    .setDuration(resolveSnapDuration(targetY))
                    .setInterpolator(EASE_OUT)
                    .withEndAction(new EndAction(removeAction(endAction)))
                    .start();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to animate expression footer drag overlay", throwable);
            remove();
            if (endAction != null) {
                endAction.run();
            }
        }
    }

    void remove() {
        try {
            if (host != null && overlayView != null) {
                host.getOverlay().remove(overlayView);
                overlayView.setImageBitmap(null);
            }
            if (bitmap != null && !bitmap.isRecycled()) {
                bitmap.recycle();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to remove expression footer drag overlay", throwable);
        }
    }

    private Runnable removeAction(final Runnable endAction) {
        return new Runnable() {
            @Override
            public void run() {
                remove();
                if (endAction != null) {
                    endAction.run();
                }
            }
        };
    }

    private long resolveSnapDuration(float targetY) {
        if (overlayView == null) {
            return 220L;
        }
        float distance = Math.abs(targetY - overlayView.getY());
        return Math.max(180L, Math.min(360L, 190L + Math.round(distance * 0.35f)));
    }

    private static float resolveLeftInHost(ViewGroup host, View source) {
        int[] hostLocation = new int[2];
        int[] sourceLocation = new int[2];
        host.getLocationOnScreen(hostLocation);
        source.getLocationOnScreen(sourceLocation);
        return sourceLocation[0] - hostLocation[0];
    }

    private static float resolveTopInHost(ViewGroup host, View source) {
        return resolveSourceTopOnScreen(source) - resolveHostTopOnScreen(host);
    }

    private static float resolveHostTopOnScreen(View host) {
        int[] hostLocation = new int[2];
        host.getLocationOnScreen(hostLocation);
        return hostLocation[1];
    }

    private static float resolveSourceTopOnScreen(View source) {
        int[] sourceLocation = new int[2];
        source.getLocationOnScreen(sourceLocation);
        return sourceLocation[1];
    }

    private static final class EndAction implements Runnable {
        private final Runnable delegate;

        EndAction(Runnable delegate) {
            this.delegate = delegate;
        }

        @Override
        public void run() {
            if (delegate != null) {
                delegate.run();
            }
        }
    }
}
