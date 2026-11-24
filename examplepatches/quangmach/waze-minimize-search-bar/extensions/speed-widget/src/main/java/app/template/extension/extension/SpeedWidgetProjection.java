package app.template.extension.extension;

import android.content.AsyncQueryHandler;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.util.Log;

public final class SpeedWidgetProjection extends BroadcastReceiver {
    private static final String TAG = "QmWazeSpeedWidget";
    private static final String AUTHORITY = "androidx.car.app.connection";
    private static final String ACTION = AUTHORITY + ".action.CAR_CONNECTION_UPDATED";
    private static final String STATE = "CarConnectionState";
    private static final int PROJECTING = 2;
    private static SpeedWidgetProjection receiver;
    private static AsyncQueryHandler query;
    private static int generation;

    public static void observe(Context context) {
        if (receiver != null || !context.getPackageName().equals(Application.getProcessName())
                || !SpeedWidgetAuto.armed(context)) return;
        Context app = context.getApplicationContext();
        receiver = new SpeedWidgetProjection();
        if (Build.VERSION.SDK_INT >= 33) app.registerReceiver(receiver, new IntentFilter(ACTION), Context.RECEIVER_EXPORTED);
        else app.registerReceiver(receiver, new IntentFilter(ACTION));
        refresh(app);
    }

    public static void checkConnection(Context context) {
        if (!SpeedWidgetAuto.armed(context)) return;
        if (receiver == null) observe(context);
        else refresh(context.getApplicationContext());
    }

    static void remove(Context context) {
        if (receiver != null) {
            context.getApplicationContext().unregisterReceiver(receiver);
            receiver = null;
        }
        generation++;
        query = null;
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        if (ACTION.equals(intent.getAction())) checkConnection(context);
    }

    private static void refresh(Context app) {
        // Treat the broadcast only as a notification. Read the state from Android Auto's provider.
        ProviderInfo provider = app.getPackageManager().resolveContentProvider(AUTHORITY, 0);
        if (provider == null || !"com.google.android.projection.gearhead".equals(provider.packageName)) {
            SpeedWidgetAuto.projectionChanged(app, false);
            return;
        }
        if (query == null) {
            query = new AsyncQueryHandler(app.getContentResolver()) {
                @Override
                protected void onQueryComplete(int token, Object cookie, Cursor cursor) {
                    boolean connected;
                    try (Cursor result = cursor) {
                        connected = result != null && result.moveToFirst() && result.getInt(0) == PROJECTING;
                    } catch (RuntimeException error) {
                        Log.w(TAG, "Could not read Android Auto connection state", error);
                        return;
                    }
                    if (token == generation) SpeedWidgetAuto.projectionChanged(app, connected);
                }
            };
        }
        query.startQuery(++generation, null, Uri.parse("content://" + AUTHORITY), new String[]{STATE}, null, null, null);
    }
}
