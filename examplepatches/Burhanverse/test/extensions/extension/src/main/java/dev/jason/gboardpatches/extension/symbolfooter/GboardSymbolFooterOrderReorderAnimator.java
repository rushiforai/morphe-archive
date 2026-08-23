package dev.jason.gboardpatches.extension.symbolfooter;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.OvershootInterpolator;

import java.util.ArrayList;
import java.util.List;

final class GboardSymbolFooterOrderReorderAnimator {
    private static final String TAG = "GboardPatches";
    private static final long SIBLING_DURATION_MS = 420L;
    private static final float SIBLING_OVERSHOOT = 0.9f;

    GboardSymbolFooterOrderReorderAnimator(Context context) {
    }

    List<RowPosition> capture(ViewGroup host, View excludedView) {
        ArrayList<RowPosition> positions = new ArrayList<RowPosition>();
        if (host == null) {
            return positions;
        }
        for (int index = 0; index < host.getChildCount(); index++) {
            View child = host.getChildAt(index);
            if (child == null || child == excludedView) {
                continue;
            }
            positions.add(new RowPosition(child, child.getTop() + child.getTranslationY()));
        }
        return positions;
    }

    void animateToNewLayout(final ViewGroup host,
            final List<RowPosition> previousPositions,
            final View excludedView) {
        try {
            if (host == null || previousPositions == null || previousPositions.isEmpty()) {
                return;
            }
            host.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
                @Override
                public boolean onPreDraw() {
                    if (host.getViewTreeObserver().isAlive()) {
                        host.getViewTreeObserver().removeOnPreDrawListener(this);
                    }
                    runAnimation(host, previousPositions, excludedView);
                    return true;
                }
            });
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to animate expression footer row reorder", throwable);
        }
    }

    void cancel(ViewGroup host) {
        try {
            if (host == null) {
                return;
            }
            for (int index = 0; index < host.getChildCount(); index++) {
                View child = host.getChildAt(index);
                if (child == null) {
                    continue;
                }
                child.animate().cancel();
                child.setTranslationY(0f);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to cancel expression footer reorder animation", throwable);
        }
    }

    private void runAnimation(ViewGroup host,
            List<RowPosition> previousPositions,
            View excludedView) {
        try {
            for (RowPosition position : previousPositions) {
                View child = position != null ? position.view : null;
                if (child == null || child == excludedView || child.getParent() != host) {
                    continue;
                }
                float delta = position.visualTop - child.getTop();
                child.animate().cancel();
                if (Math.abs(delta) < 0.5f) {
                    child.setTranslationY(0f);
                    continue;
                }
                child.setTranslationY(delta);
                child.animate()
                        .translationY(0f)
                        .setDuration(SIBLING_DURATION_MS)
                        .setInterpolator(new OvershootInterpolator(SIBLING_OVERSHOOT))
                        .start();
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to run expression footer reorder animation", throwable);
        }
    }

    static final class RowPosition {
        final View view;
        final float visualTop;

        RowPosition(View view, float visualTop) {
            this.view = view;
            this.visualTop = visualTop;
        }
    }
}
