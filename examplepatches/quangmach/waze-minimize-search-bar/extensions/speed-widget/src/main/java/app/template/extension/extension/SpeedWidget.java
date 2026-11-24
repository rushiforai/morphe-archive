package app.template.extension.extension;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.util.Log;
import android.widget.RemoteViews;

public class SpeedWidget extends AppWidgetProvider {
    private static SpeedWidgetDial renderer;
    private static Configuration rendererConfiguration;

    static ComponentName component(Context context) {
        return new ComponentName(context, SpeedWidget.class);
    }

    static boolean isBound(Context context, int id) {
        android.appwidget.AppWidgetProviderInfo info = AppWidgetManager.getInstance(context).getAppWidgetInfo(id);
        return info != null && (component(context).equals(info.provider) || NavigationWidget.component(context).equals(info.provider));
    }

    @Override
    public void onUpdate(Context context, AppWidgetManager manager, int[] widgetIds) {
        SpeedWidgetAuto.observe(context);
        SpeedWidgetService.refresh(context);
    }

    @Override
    public void onDeleted(Context context, int[] widgetIds) {
        for (int id : widgetIds) SpeedWidgetService.widgetDeleted(id);
    }

    @Override
    public void onDisabled(Context context) {
        if (SpeedWidgetAuto.hasWidgets(context)) return;
        SpeedWidgetAuto.removeWatchers(context);
        context.stopService(new Intent(context, SpeedWidgetService.class));
    }

    static void render(Context context, String speed, String unit, String limit, String status, boolean useUsSign) {
        AppWidgetManager manager = AppWidgetManager.getInstance(context);
        int[] widgetIds = manager.getAppWidgetIds(component(context));
        if (widgetIds.length == 0) return;
        Bitmap dial;
        try {
            Context app = context.getApplicationContext();
            Configuration configuration = app.getResources().getConfiguration();
            if (renderer == null || !configuration.equals(rendererConfiguration)) {
                renderer = new SpeedWidgetDial(app);
                rendererConfiguration = new Configuration(configuration);
            }
            dial = renderer.draw(speed, unit, limit, useUsSign);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            Log.w("QmWazeSpeedWidget", "Could not render Waze's speedometer", error);
            return;
        }
        int layout = resource(context, "layout", "qm_speed_widget");
        int container = resource(context, "id", "qm_widget_container");
        String speedDescription = "—".equals(speed) ? "Speed unavailable" : "Speed " + speed + " " + unit;
        String limitDescription = "—".equals(limit) ? "Waze speed limit unavailable" : "Waze speed limit " + limit + " " + unit;
        for (int id : widgetIds) {
            RemoteViews views = new RemoteViews(context.getPackageName(), layout);
            views.setImageViewBitmap(container, dial);
            views.setContentDescription(container, speedDescription + ". " + limitDescription
                    + (status.isEmpty() ? "." : ". " + status));
            views.setOnClickPendingIntent(container, controls(context, id));
            manager.updateAppWidget(id, views);
        }
    }

    static PendingIntent controls(Context context, int id) {
        Intent controls = new Intent(context, SpeedWidgetControls.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                .putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, id);
        return PendingIntent.getActivity(context, id, controls, PendingIntent.FLAG_IMMUTABLE);
    }

    private static int resource(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }
}
