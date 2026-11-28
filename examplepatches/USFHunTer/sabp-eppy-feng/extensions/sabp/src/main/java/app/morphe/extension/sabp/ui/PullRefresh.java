package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.ProgressBar;

import app.morphe.extension.sabp.EppyTheme;

/**
 * Pull-to-refresh for a scrolling page, without AndroidX: when the content is at its top, a
 * downward drag pulls a Material progress indicator into view; releasing past the threshold
 * starts the refresh. The indicator stays until {@link #setRefreshing(boolean) setRefreshing(false)}.
 * A refresh button in the page header does the same for keyboard and TalkBack users.
 */
public final class PullRefresh extends FrameLayout {
    private final View content;
    private final FrameLayout indicator;
    private final ProgressBar spinner;
    private final Runnable onRefresh;
    private final int threshold, slop;
    private float downY;
    private boolean dragging, refreshing;

    public PullRefresh(Context c, EppyTheme t, View content, Runnable onRefresh) {
        super(c);
        this.content = content;
        this.onRefresh = onRefresh;
        threshold = Ui.dp(c, 72);
        slop = ViewConfiguration.get(c).getScaledTouchSlop();
        addView(content, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
        indicator = new FrameLayout(c);
        indicator.setBackground(Ui.rounded(t.surfaceContainerHigh, Ui.dp(c, 20)));
        indicator.setElevation(Ui.dp(c, 4));
        spinner = new ProgressBar(c);
        spinner.setIndeterminateTintList(ColorStateList.valueOf(t.primary));
        indicator.addView(spinner, new LayoutParams(Ui.dp(c, 24), Ui.dp(c, 24), Gravity.CENTER));
        LayoutParams il = new LayoutParams(Ui.dp(c, 40), Ui.dp(c, 40), Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        addView(indicator, il);
        indicator.setTranslationY(-Ui.dp(c, 48));
        indicator.setAlpha(0f);
        indicator.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    public boolean isRefreshing() {
        return refreshing;
    }

    public void setRefreshing(boolean on) {
        refreshing = on;
        if (on) {
            indicator.animate().translationY(Ui.dp(getContext(), 16)).alpha(1f).setDuration(150).start();
        } else {
            indicator.animate().translationY(-Ui.dp(getContext(), 48)).alpha(0f).setDuration(200).start();
        }
    }

    @Override
    public boolean onInterceptTouchEvent(MotionEvent e) {
        if (refreshing) return false;
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downY = e.getY();
                dragging = false;
                break;
            case MotionEvent.ACTION_MOVE:
                if (!content.canScrollVertically(-1) && e.getY() - downY > slop) {
                    dragging = true;
                    return true;
                }
                break;
            default:
                break;
        }
        return false;
    }

    @Override
    public boolean onTouchEvent(MotionEvent e) {
        if (!dragging) return super.onTouchEvent(e);
        float pull = Math.max(0, e.getY() - downY);
        switch (e.getActionMasked()) {
            case MotionEvent.ACTION_MOVE: {
                float eased = Math.min(threshold * 1.5f, pull * 0.5f);
                indicator.setTranslationY(-Ui.dp(getContext(), 48) + eased + Ui.dp(getContext(), 16));
                indicator.setAlpha(Math.min(1f, eased / threshold));
                indicator.setRotation(eased * 2);
                return true;
            }
            case MotionEvent.ACTION_UP:
                dragging = false;
                if (pull * 0.5f >= threshold * 0.8f) {
                    performHapticFeedback(android.view.HapticFeedbackConstants.CONFIRM);
                    setRefreshing(true);
                    onRefresh.run();
                } else {
                    setRefreshing(false);
                }
                return true;
            case MotionEvent.ACTION_CANCEL:
                dragging = false;
                setRefreshing(false);
                return true;
            default:
                return true;
        }
    }
}
