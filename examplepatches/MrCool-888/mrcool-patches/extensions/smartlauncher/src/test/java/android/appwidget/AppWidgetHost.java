package android.appwidget;
import android.app.Activity;
import android.os.Bundle;
public class AppWidgetHost {
    public int calls, widgetId, flags, requestCode;
    public Activity activity;
    public Bundle options;
    public RuntimeException failure;
    public void startAppWidgetConfigureActivityForResult(Activity a, int id, int f, int r, Bundle o) {
        calls++; activity=a; widgetId=id; flags=f; requestCode=r; options=o;
        if (failure != null) throw failure;
    }
}
