package e.e.a;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

/** Adds the selected device-folder rows to nicoid's native playback queue. */
public final class PlaylistPlayback {
    private PlaylistPlayback() { }

    public static void attach(Activity activity, Intent intent, ArrayList<?> folderRows,
                              int selectedIndex, boolean shuffle) {
        withMode(shuffle, () -> {
            try {
                Class<?> helper = Class.forName("e.e.a.v0");
                Method addQueue = helper.getMethod("a", Intent.class, ArrayList.class,
                        int.class, boolean.class);
                addQueue.invoke(null, intent, folderRows, selectedIndex, true);
            } catch (Exception e) {
                Log.w("nicoid-playlist", "Unable to attach folder playback queue", e);
            }
        });
    }

    public static void launchTap(Activity activity, String url, String title,
                                 ArrayList<?> folderRows, int selectedIndex,
                                 boolean queue, boolean shuffle) {
        int tap;
        try { tap = Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(activity)
                .getString("videolist_tap", "0")); }
        catch (Exception ignored) { tap = 0; }
        if (tap < 0 || tap > 3) tap = 0;
        Intent intent;
        if (tap == 2 || tap == 3) {
            String id = url.replaceAll("^.*?/watch/(nm|sm|so|)([0-9]+).*?$", "$1$2");
            intent = new Intent(Intent.ACTION_VIEW).setClassName(activity,
                    "com.sauzask.nicoid.NicoidPopupViewService")
                    .putExtra("url", id).putExtra("isBackgroundPlay", tap == 3);
            if (tap == 3) intent.putExtra("tickerText", title);
        } else {
            String target = tap == 1 ? "com.sauzask.nicoid.NicoidVideoInfoActivity"
                    : "com.sauzask.nicoid.NicoidVideoActivity";
            intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).setClassName(activity, target);
            if (tap == 0) intent.putExtra("intentselect", true).putExtra("title", title);
        }
        if (queue) attach(activity, intent, folderRows, selectedIndex, shuffle);
        if (tap == 2 || tap == 3) {
            try { Class.forName("e.e.a.v0").getMethod("a", android.content.Context.class,
                    Intent.class).invoke(null, activity, intent); }
            catch (Exception e) { Log.w("nicoid-playlist", "Unable to open selected playback mode", e); }
        } else activity.startActivity(intent);
    }

    static void withMode(boolean shuffle, Runnable action) {
        Integer previous = null;
        Field mode = null;
        try {
            mode = Class.forName("com.sauzask.nicoid.NicoidVideoListActivity").getField("J");
            previous = mode.getInt(null);
            mode.setInt(null, shuffle ? 2 : 0);
        } catch (Exception e) {
            Log.w("nicoid-playlist", "Unable to apply folder playback mode", e);
        }
        try { action.run(); }
        finally { if (previous != null) try { mode.setInt(null, previous); }
            catch (Exception e) { Log.w("nicoid-playlist", "Unable to restore playback mode", e); } }
    }
}
