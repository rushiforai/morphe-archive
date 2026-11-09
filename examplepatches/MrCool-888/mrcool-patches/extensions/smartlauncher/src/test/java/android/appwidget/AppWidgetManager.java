package android.appwidget;
import android.content.Context;
import android.os.Bundle;
public class AppWidgetManager {
    public static final String ACTION_APPWIDGET_CONFIGURE = "android.appwidget.action.APPWIDGET_CONFIGURE";
    public static final String EXTRA_APPWIDGET_ID = "appWidgetId";
    public static final String OPTION_APPWIDGET_SIZES = "appWidgetSizes";
    public static final String OPTION_APPWIDGET_MIN_WIDTH = "appWidgetMinWidth";
    public static final String OPTION_APPWIDGET_MAX_WIDTH = "appWidgetMaxWidth";
    public static final String OPTION_APPWIDGET_MIN_HEIGHT = "appWidgetMinHeight";
    public static final String OPTION_APPWIDGET_MAX_HEIGHT = "appWidgetMaxHeight";
    private static final AppWidgetManager INSTANCE = new AppWidgetManager();
    public AppWidgetProviderInfo info;
    public final Bundle options = new Bundle();
    public int optionUpdates;
    public static AppWidgetManager getInstance(Context c) { return INSTANCE; }
    public AppWidgetProviderInfo getAppWidgetInfo(int id) { return info; }
    public Bundle getAppWidgetOptions(int id) { return options; }
    public void updateAppWidgetOptions(int id, Bundle changes) {
        optionUpdates++;
        options.putAll(changes);
    }
}
