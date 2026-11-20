package id.ikuradachi.kageroll.extension.crunchyroll;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Persists elapsed vs remaining (-MM:SS) timeline display mode and refreshes the
 * active timeline presenter immediately when the user taps the time readout.
 */
public final class RemainingTimeHelper {

    private static final String PREFS_NAME = "kageroll_player_prefs";
    private static final String KEY_SHOW_REMAINING = "timeline_show_remaining";

    private static final Map<Object, TickInfo> VIEW_TICKS = new WeakHashMap<>();

    private RemainingTimeHelper() {
    }

    private static final class TickInfo {
        Object presenter;
        int lastCurrentMs;
        String updateMethodName;
    }

    /**
     * Default initial state when no preference has been saved yet. Patched at build time.
     */
    public static boolean getDefaultShowRemaining() {
        return false;
    }

    public static void attach(final View timelineLayout, TextView currentTimeView, TextView durationView) {
        if (timelineLayout == null) {
            return;
        }
        View.OnClickListener listener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggleAndRefresh(timelineLayout);
            }
        };
        if (currentTimeView != null) {
            currentTimeView.setOnClickListener(listener);
        }
        if (durationView != null) {
            durationView.setOnClickListener(listener);
        }
    }

    public static boolean recordTick(
            Object view,
            Object presenter,
            int currentMs,
            String updateMethodName
    ) {
        if (view != null && presenter != null && updateMethodName != null) {
            synchronized (VIEW_TICKS) {
                TickInfo info = VIEW_TICKS.get(view);
                if (info == null) {
                    info = new TickInfo();
                    VIEW_TICKS.put(view, info);
                }
                info.presenter = presenter;
                info.lastCurrentMs = currentMs;
                info.updateMethodName = updateMethodName;
            }
        }
        if (view instanceof View) {
            return isShowRemaining(((View) view).getContext());
        }
        return false;
    }

    public static String prefixMinus(String formatted) {
        if (formatted == null || formatted.isEmpty() || formatted.startsWith("-")) {
            return formatted;
        }
        return "-" + formatted;
    }

    private static void toggleAndRefresh(View timelineLayout) {
        Context context = timelineLayout.getContext();
        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        boolean next = !prefs.getBoolean(KEY_SHOW_REMAINING, getDefaultShowRemaining());
        prefs.edit().putBoolean(KEY_SHOW_REMAINING, next).apply();

        Object presenter;
        int currentMs;
        String methodName;
        synchronized (VIEW_TICKS) {
            TickInfo info = VIEW_TICKS.get(timelineLayout);
            if (info == null || info.presenter == null || info.updateMethodName == null) {
                return;
            }
            presenter = info.presenter;
            currentMs = info.lastCurrentMs;
            methodName = info.updateMethodName;
        }

        try {
            Method m = presenter.getClass().getMethod(methodName, int.class);
            m.invoke(presenter, currentMs);
        } catch (Exception ignored) {
        }
    }

    private static boolean isShowRemaining(Context context) {
        if (context == null) {
            return getDefaultShowRemaining();
        }
        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        return prefs.getBoolean(KEY_SHOW_REMAINING, getDefaultShowRemaining());
    }
}
