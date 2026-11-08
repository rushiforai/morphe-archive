package app.twrailway.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Collections;

/**
 * Ways to open the patch settings page.
 *
 * <ul>
 *   <li>The "廣告設定" (ad settings) item of the drawer's 設定 section is renamed to "修補設定"
 *   in libapp.so. When the app navigates to its page ({@code AdSettingsPage}), the page is
 *   closed again and the patch settings page is shown instead. The route is reported by Flutter
 *   to the platform over the {@code flutter/navigation} channel, which is hooked in
 *   {@link #onMessageFromDart(String, ByteBuffer)}.</li>
 *   <li>A "修補設定" shortcut on the app icon (long press the icon in the launcher).</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class PatchSettingsEntry {
    private static final String NAVIGATION_CHANNEL = "flutter/navigation";
    /** The route GetX gives the ad settings page, which the drawer item opens. */
    private static final String AD_SETTINGS_ROUTE = "AdSettingsPage";

    private static final String SHORTCUT_ID = "twrailway_patch_settings";
    static final String EXTRA_OPEN_SETTINGS = "app.twrailway.extension.OPEN_PATCH_SETTINGS";

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> resumedActivity = new WeakReference<>(null);

    private PatchSettingsEntry() {
    }

    static void init(Context context) {
        if (context instanceof Application) {
            ((Application) context).registerActivityLifecycleCallbacks(new ActivityTracker());
        }
        addShortcut(context);
    }

    /**
     * Called by DartMessenger for every platform message Dart sends, before it is handled.
     * The message must not be consumed.
     */
    public static void onMessageFromDart(String channel, ByteBuffer message) {
        if (!NAVIGATION_CHANNEL.equals(channel) || message == null) return;
        try {
            ByteBuffer copy = message.duplicate();
            copy.position(0);
            byte[] bytes = new byte[copy.remaining()];
            copy.get(bytes);
            String json = new String(bytes, StandardCharsets.UTF_8);
            if (!json.contains("route")) return;

            JSONObject call = new JSONObject(json);
            JSONObject arguments = call.optJSONObject("args");
            if (arguments == null) return;
            // routeInformationUpdated: {uri | location, state, replace}, routeUpdated: {routeName}.
            String route = arguments.optString("uri",
                    arguments.optString("location", arguments.optString("routeName", "")));
            Log.d(PatchSettings.TAG, "Flutter route: " + route);

            if (route.endsWith("/" + AD_SETTINGS_ROUTE)) {
                mainHandler.post(PatchSettingsEntry::openInsteadOfAdSettings);
            }
        } catch (Throwable t) {
            Log.e(PatchSettings.TAG, "Could not read the Flutter route", t);
        }
    }

    private static void openInsteadOfAdSettings() {
        Activity activity = resumedActivity.get();
        if (activity == null || activity.isFinishing()) return;
        if (PatchSettingsDialog.isShowing()) return;
        // Close the ad settings page that was just opened: FlutterActivity.onBackPressed pops
        // the top Flutter route.
        activity.onBackPressed();
        PatchSettingsDialog.show(activity);
    }

    private static void addShortcut(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N_MR1) return;
        try {
            ShortcutManager shortcutManager = context.getSystemService(ShortcutManager.class);
            if (shortcutManager == null) return;
            Intent launchIntent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (launchIntent == null) return;

            Intent intent = new Intent(Intent.ACTION_MAIN)
                    .setComponent(launchIntent.getComponent())
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK)
                    .putExtra(EXTRA_OPEN_SETTINGS, true);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, SHORTCUT_ID)
                    .setShortLabel(Strings.TITLE)
                    .setLongLabel(Strings.TITLE)
                    .setIcon(Icon.createWithResource(context, context.getApplicationInfo().icon))
                    .setIntent(intent)
                    .build();
            shortcutManager.addDynamicShortcuts(Collections.singletonList(shortcut));
        } catch (Throwable t) {
            Log.e(PatchSettings.TAG, "Could not add the patch settings shortcut", t);
        }
    }

    private static final class ActivityTracker implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity activity) {
            resumedActivity = new WeakReference<>(activity);

            Intent intent = activity.getIntent();
            if (intent != null && intent.getBooleanExtra(EXTRA_OPEN_SETTINGS, false)) {
                intent.removeExtra(EXTRA_OPEN_SETTINGS);
                PatchSettingsDialog.show(activity);
            }
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (resumedActivity.get() == activity) resumedActivity = new WeakReference<>(null);
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            PatchSettingsDialog.dismissFor(activity);
        }
    }
}
