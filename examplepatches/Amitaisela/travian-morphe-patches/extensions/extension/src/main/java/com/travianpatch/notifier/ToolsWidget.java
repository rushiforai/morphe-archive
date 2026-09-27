package com.travianpatch.notifier;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.RemoteViews;

/**
 * The Travian Tools home-screen widget: next attack, next queue finish, soonest full storage, last check.
 * Its layout and provider info are resources the patch adds to the game's APK (ManifestPatch), so they are
 * looked up by name. It never goes to the network: the background check calls update() at the end of each
 * run with what it saved. Tapping it opens Travian Tools.
 */
public class ToolsWidget extends AppWidgetProvider {

    private static final String TAG = "TravianNotifier";
    static final String KEY_STORAGE_FULL_AT = "storage_full_at";
    static final String KEY_STORAGE_FULL_WHAT = "storage_full_what";

    @Override
    public void onUpdate(Context context, AppWidgetManager manager, int[] ids) {
        update(context);
    }

    /** Redraws every placed widget from the saved state; does nothing if none is placed. Never throws. */
    static void update(Context context) {
        try {
            Context ctx = context.getApplicationContext();
            AppWidgetManager manager = AppWidgetManager.getInstance(ctx);
            ComponentName me = new ComponentName(ctx, ToolsWidget.class);
            int[] ids = manager.getAppWidgetIds(me);
            if (ids == null || ids.length == 0) {
                return;
            }
            String pkg = ctx.getPackageName();
            int layout = ctx.getResources().getIdentifier("travian_tools_widget", "layout", pkg);
            if (layout == 0) {
                Log.w(TAG, "widget layout missing from the APK");
                return;
            }
            SharedPreferences state = ctx.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
            long now = System.currentTimeMillis();
            AlertStatus status = AlertStatus.fromJson(state.getString(NotifierWorker.KEY_STATUS, null));
            RemoteViews rv = new RemoteViews(pkg, layout);
            set(ctx, rv, "tt_widget_attack", WidgetText.attack(state.getLong(NotifierWorker.KEY_NEXT_ATTACK_AT, 0),
                    state.getLong(NotifierWorker.KEY_ATTACKS_KNOWN_AT, 0), now));
            set(ctx, rv, "tt_widget_queue", WidgetText.queue(QueueView.parse(
                    state.getString(NotifierWorker.STATE_KEY, null)), now));
            set(ctx, rv, "tt_widget_storage", WidgetText.storage(state.getLong(KEY_STORAGE_FULL_AT, 0),
                    state.getString(KEY_STORAGE_FULL_WHAT, null), now));
            set(ctx, rv, "tt_widget_checked", WidgetText.checked(status.lastCheckMs));
            int root = ctx.getResources().getIdentifier("tt_widget_root", "id", pkg);
            if (root != 0) {
                Intent open = new Intent(ctx, HubActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                rv.setOnClickPendingIntent(root, PendingIntent.getActivity(ctx, 7301, open,
                        PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE));
            }
            manager.updateAppWidget(me, rv);
        } catch (Exception e) {
            Log.w(TAG, "widget update failed: " + e);
        }
    }

    private static void set(Context ctx, RemoteViews rv, String idName, String text) {
        int id = ctx.getResources().getIdentifier(idName, "id", ctx.getPackageName());
        if (id != 0) {
            rv.setTextViewText(id, text);
        }
    }
}
