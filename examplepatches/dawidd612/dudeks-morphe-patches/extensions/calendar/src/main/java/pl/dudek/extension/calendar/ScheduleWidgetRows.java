package pl.dudek.extension.calendar;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.widget.RemoteViews;

/** Keeps the launcher adapter, but replaces the contents of each recycled agenda row. */
public final class ScheduleWidgetRows {
    private static final String LAYOUT = "dudeks_calendar_widget_row";
    private static volatile int wrapperLayoutId;
    private static volatile boolean initialized;

    private ScheduleWidgetRows() {}

    public static void initialize(Context context) {
        // The collection click traversal was checked against Android 16. Older hosts
        // retain the original implementation; no hidden APIs or device-name guesses.
        if (Build.VERSION.SDK_INT < 36 || initialized) return;
        synchronized (ScheduleWidgetRows.class) {
            if (initialized) return;
            wrapperLayoutId = context.getResources().getIdentifier(
                    LAYOUT, "layout", context.getPackageName());
            if (wrapperLayoutId == 0) {
                Log.e("DudeksCalendar", "Widget row resource missing; retaining original rows");
            }
            initialized = true;
        }
    }

    public static RemoteViews wrap(RemoteViews row) {
        int layoutId = wrapperLayoutId;
        if (row == null || layoutId == 0 || row.getLayoutId() == layoutId) return row;

        RemoteViews wrapper = new RemoteViews(row.getPackage(), layoutId);
        // Both actions are delivered in the SAME RemoteViews. No empty intermediate
        // widget update, polling, adapter replacement, or widget deletion is involved.
        // Deliberately use addView, NOT addStableView: a stable child can be recycled.
        wrapper.removeAllViews(android.R.id.content);
        wrapper.addView(android.R.id.content, row);
        return wrapper;
    }
}
