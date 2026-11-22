package app.voidhack.extension.applemusic;

import android.content.Context;
import android.graphics.Rect;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.Window;
import android.view.accessibility.AccessibilityManager;
import android.widget.SeekBar;

/** Keeps control touches with their views until a downward drag claims the stream. */
final class GlassPlayerControlsTouch {
    private final View sheet;
    private final GlassPlayerGesture gesture;
    private final Rect hit = new Rect();
    private final int[] location = new int[2];
    private GlassPlayerSheet bridge;
    private int pointerId = -1;
    private int startTop;
    private boolean claimed;

    GlassPlayerControlsTouch(View sheet) {
        this.sheet = sheet;
        gesture = new GlassPlayerGesture(ViewConfiguration.get(sheet.getContext()).getScaledTouchSlop(),
                sheet.getResources().getDisplayMetrics().density);
    }

    boolean ownsStream() {
        return bridge != null;
    }

    boolean onTouch(Window window, MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            reset();
            if (event.isFromSource(InputDevice.SOURCE_TOUCHSCREEN) && sheet.isShown()
                    && sheet.getLayoutParams() instanceof GlassPlayerSheet playerSheet
                    && playerSheet.glassPlayerCanDrag(sheet) && startsInControls(event)) {
                bridge = playerSheet;
                startTop = sheet.getTop();
                pointerId = event.getPointerId(0);
                sheet.getWindowVisibleDisplayFrame(hit);
                float y = event.getRawY();
                gesture.start(event.getEventTime(), event.getRawX(), y, hit.bottom - y);
            }
            return false;
        }

        if (bridge == null) return false;
        if (action == MotionEvent.ACTION_CANCEL) {
            boolean handled = claimed;
            reset();
            return handled;
        }

        int index = pointerId == -1 ? -1 : event.findPointerIndex(pointerId);
        boolean terminal = action == MotionEvent.ACTION_UP;
        boolean lift = index >= 0 && (terminal
                || (action == MotionEvent.ACTION_POINTER_UP && index == event.getActionIndex()));
        boolean canceled = lift && (event.getFlags() & MotionEvent.FLAG_CANCELED) != 0;
        if (index >= 0 && !canceled && (action == MotionEvent.ACTION_MOVE || lift)) {
            sample(event, index);
            if (!claimed && gesture.wantsDrag() && bridge.glassPlayerCanDrag(sheet)) {
                claimed = true;
                MotionEvent cancel = MotionEvent.obtainNoHistory(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                try {
                    window.superDispatchTouchEvent(cancel);
                } finally {
                    cancel.recycle();
                }
                if (bridge == null) return true;
            }
            if (claimed) bridge.glassPlayerDrag(sheet, startTop + gesture.dragDistance());
        }
        if (lift) settle(claimed && !canceled && gesture.shouldCollapse());

        boolean handled = claimed;
        if (terminal) reset();
        return handled;
    }

    void reset() {
        settle(false);
        bridge = null;
        claimed = false;
    }

    private void settle(boolean collapse) {
        // A second finger may still be down. Keep consuming a claimed stream until
        // it ends instead of switching to that finger or delivering an orphaned UP.
        boolean wasDragging = claimed && pointerId != -1;
        pointerId = -1;
        if (wasDragging && sheet.isAttachedToWindow()) bridge.glassPlayerSettle(sheet, collapse);
    }

    private void sample(MotionEvent event, int index) {
        float offsetX = event.getRawX() - event.getX();
        float offsetY = event.getRawY() - event.getY();
        for (int i = 0; i < event.getHistorySize(); i++) {
            gesture.sample(event.getHistoricalEventTime(i), event.getHistoricalX(index, i) + offsetX,
                    event.getHistoricalY(index, i) + offsetY);
        }
        gesture.sample(event.getEventTime(), event.getX(index) + offsetX, event.getY(index) + offsetY);
    }

    private boolean startsInControls(MotionEvent event) {
        AccessibilityManager accessibility = (AccessibilityManager)
                sheet.getContext().getSystemService(Context.ACCESSIBILITY_SERVICE);
        if (accessibility != null && accessibility.isTouchExplorationEnabled()) return false;
        sheet.getRootView().getLocationOnScreen(location);
        int x = (int) (event.getRawX() - location[0]);
        int y = (int) (event.getRawY() - location[1]);
        View page = LiquidGlass.currentPlayerPage(LiquidGlass.find(sheet, "player_fragments_host"));
        if (page == null) page = sheet;
        View controls = LiquidGlass.findVisible(page, "player_controls");
        if (controls == null || contains(LiquidGlass.findVisible(page, "vocal_ctrl"), x, y)) return false;
        View progress = LiquidGlass.find(controls, "progress");
        if (progress instanceof SeekBar && contains(progress, x, y)) return false;
        if (contains(controls, x, y)) return true;

        // The Song layout places its title and action buttons above the controls.
        // In landscape they can sit beside the artwork, which keeps its own touch target.
        View song = LiquidGlass.findVisible(page, "player_container");
        if (!contains(song, x, y)) return false;
        View title = LiquidGlass.findVisible(song, "title");
        if (title == null || !title.getGlobalVisibleRect(hit)) return false;
        int chromeTop = hit.top;
        View artwork = LiquidGlass.findVisible(song, "fullplayerSongImage");
        if (artwork != null && artwork.getGlobalVisibleRect(hit)) {
            if (hit.contains(x, y)) return false;
            chromeTop = Math.min(chromeTop, hit.bottom);
        }
        return y >= chromeTop;
    }

    private boolean contains(View view, int x, int y) {
        return view != null && view.isShown() && view.getGlobalVisibleRect(hit) && hit.contains(x, y);
    }
}
