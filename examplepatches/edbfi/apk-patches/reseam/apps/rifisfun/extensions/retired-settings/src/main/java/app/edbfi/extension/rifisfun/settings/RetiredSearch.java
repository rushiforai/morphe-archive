// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.rifisfun.settings;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.Iterator;
import java.util.List;

public final class RetiredSearch {
    public static void filter(Context context, List<?> results) {
        ServiceVisibility services = new ServiceVisibility(context);
        Iterator<?> entries = results.iterator();
        while (entries.hasNext()) {
            if (services.isHidden(entries.next())) entries.remove();
        }
    }

    public static void filterRetained(Activity activity) {
        ListView list = activity.findViewById(android.R.id.list);
        if (list == null || !(list.getAdapter() instanceof ArrayAdapter<?> adapter)) return;
        prune(activity, list, adapter);
    }

    private static <T> void prune(Context context, ListView list, ArrayAdapter<T> adapter) {
        ServiceVisibility services = new ServiceVisibility(context);
        int first = list.getFirstVisiblePosition();
        int nextFirst = first;
        View topRow = list.getChildAt(0);
        int offset = topRow == null ? 0 : topRow.getTop() - list.getListPaddingTop();
        boolean changed = false;
        for (int position = adapter.getCount() - 1; position >= 0; position--) {
            T item = adapter.getItem(position);
            if (item == null || !services.isHidden(item)) continue;
            if (!changed) adapter.setNotifyOnChange(false);
            adapter.remove(item);
            if (position < first) nextFirst--;
            changed = true;
        }
        if (changed) {
            adapter.notifyDataSetChanged();
            if (topRow != null && adapter.getCount() != 0) {
                list.setSelectionFromTop(Math.min(nextFirst, adapter.getCount() - 1), offset);
            }
        }
    }

    private static final class ServiceVisibility {
        private final boolean synccitEnabled;
        private final boolean notificationsEnabled;

        ServiceVisibility(Context context) {
            // In rif 5.6.22, RifBaseSettingsFragment.F4() selects this file for its PreferenceManager.
            SharedPreferences preferences = context.getSharedPreferences("settings", Context.MODE_PRIVATE);
            synccitEnabled = preferences.getBoolean("SYNCCIT_ENABLED", false);
            notificationsEnabled = preferences.getBoolean("ENABLE_NEW_POST_NOTIFICATIONS", false);
        }

        boolean isHidden(Object result) {
            String key = resultKey(result);
            if (key == null) return false;
            return switch (key) {
                case "SYNCCIT_ENABLED", "SYNCCIT_PREFS" -> !synccitEnabled;
                case "ENABLE_NEW_POST_NOTIFICATIONS", "MANAGE_NEW_POST_NOTIFICATIONS" -> !notificationsEnabled;
                default -> false;
            };
        }
    }

    // Bound at patch time to the stock search result's key getter.
    public static String resultKey(Object result) {
        throw new AssertionError();
    }
}
