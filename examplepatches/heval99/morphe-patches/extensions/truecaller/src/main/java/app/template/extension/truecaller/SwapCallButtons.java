package app.template.extension.truecaller;

import android.content.Context;
import android.content.res.Resources;
import android.util.SparseIntArray;

import app.template.extension.hevalcontrols.AppContext;
import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Swap call answer and decline buttons", incoming call notification: Truecaller's own notification
 * layouts get a copy with the answer button first (the patch adds them as
 * {@code <stock name>_heval_swapped}; the stock layouts are untouched). The notification class asks
 * this helper for each layout id right before it builds its RemoteViews: while the feature is on it
 * answers the swapped copy, while it is off (or the copy is missing) the stock id.
 */
@SuppressWarnings("unused")
public final class SwapCallButtons {
    static final String FEATURE = "truecaller.swap_call_buttons";

    static final String SUFFIX = "_heval_swapped";

    /** Stock layout id to the id of its swapped copy, or to itself when there is none. */
    private static final SparseIntArray swapped = new SparseIntArray();

    private SwapCallButtons() {
    }

    public static int layout(int stockId) {
        if (!HevalSettings.isEnabled(FEATURE)) return stockId;
        try {
            synchronized (swapped) {
                int known = swapped.get(stockId, 0);
                if (known != 0) return known;
            }
            Context context = AppContext.currentApplication();
            if (context == null) return stockId;
            Resources resources = context.getResources();
            int copy = resources.getIdentifier(
                    resources.getResourceEntryName(stockId) + SUFFIX, "layout", resources.getResourcePackageName(stockId));
            int answer = copy != 0 ? copy : stockId;
            synchronized (swapped) {
                swapped.put(stockId, answer);
            }
            return answer;
        } catch (Throwable failure) {
            HevalSettings.reportFailure(FEATURE, failure);
            return stockId;
        }
    }
}
