package android.appwidget;
import android.content.Context;
public class AppWidgetManager {
    public static final String ACTION_APPWIDGET_CONFIGURE = "android.appwidget.action.APPWIDGET_CONFIGURE";
    public static final String EXTRA_APPWIDGET_ID = "appWidgetId";
    private static final AppWidgetManager INSTANCE = new AppWidgetManager();
    public AppWidgetProviderInfo info;
    public static AppWidgetManager getInstance(Context c) { return INSTANCE; }
    public AppWidgetProviderInfo getAppWidgetInfo(int id) { return info; }
}
