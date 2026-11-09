package app.mrcool.extension.smartlauncher;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.util.SizeF;

import java.util.ArrayList;

public final class WidgetSizing {
    public static boolean updateBudsSize(AppWidgetManager manager, int widgetId,
                                         float width, float height) {
        if (!isBudsWidget(manager, widgetId)) return false;
        if (!Float.isFinite(width) || !Float.isFinite(height) || width < 1 || height < 1) {
            return true;
        }

        // The provider renders every reported size. Publish just the current measurement.
        ArrayList<SizeF> sizes = new ArrayList<>(1);
        sizes.add(new SizeF(width, height));
        Bundle current = manager.getAppWidgetOptions(widgetId);
        int widthDp = (int) width;
        int heightDp = (int) height;
        if (sizes.equals(current.getParcelableArrayList(AppWidgetManager.OPTION_APPWIDGET_SIZES))
                && current.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH) == widthDp
                && current.getInt(AppWidgetManager.OPTION_APPWIDGET_MAX_WIDTH) == widthDp
                && current.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_HEIGHT) == heightDp
                && current.getInt(AppWidgetManager.OPTION_APPWIDGET_MAX_HEIGHT) == heightDp) {
            return true;
        }

        Bundle options = new Bundle();
        options.putParcelableArrayList(AppWidgetManager.OPTION_APPWIDGET_SIZES, sizes);
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH, widthDp);
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MAX_WIDTH, widthDp);
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MIN_HEIGHT, heightDp);
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MAX_HEIGHT, heightDp);
        try {
            manager.updateAppWidgetOptions(widgetId, options);
        } catch (NullPointerException e) {
            Log.e("AppWidgetManagerCompat", "Cannot update widget size", e);
        }
        return true;
    }

    public static void invalidateWidgetSize(AppWidgetManager manager, int widgetId, Bundle options) {
        // Keep the last usable size until the launcher measures the widget again.
        if (!isBudsWidget(manager, widgetId)) {
            manager.updateAppWidgetOptions(widgetId, options);
        }
    }

    private static boolean isBudsWidget(AppWidgetManager manager, int widgetId) {
        if (Build.VERSION.SDK_INT < 31) return false;
        AppWidgetProviderInfo info = manager.getAppWidgetInfo(widgetId);
        return info != null && info.provider != null
                && WidgetConfiguration.BUDS_PACKAGE.equals(info.provider.getPackageName());
    }
}
