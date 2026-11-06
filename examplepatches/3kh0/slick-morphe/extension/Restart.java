package slick.android;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Process;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.Collections;

public final class Restart {
  private Restart() {}

  static boolean needed(String key) {
    return key.equals("amoled") || key.equals("feature_flags");
  }

  public static void change(Activity activity, String key, boolean enabled) {
    if (!needed(key)) return;
    SharedPreferences p = Settings.preferences;
    if (p.getBoolean(key, false) == enabled) return;
    p.edit().putBoolean(key, enabled).apply();
    offer(activity);
  }

  public static void offer(Activity activity) {
    offer(activity, () -> {});
  }

  public static void offer(Activity activity, Runnable later) {
    SharedPreferences p = Settings.preferences;
    if (gone(activity)) return;
    NativeDialogs.show(
            activity,
            "Restart Slack?",
            "Your setting is saved. Restart Slack to apply the change. Restarting"
                + " interrupts active calls and uploads. Your app data will not be erased.",
            null,
            null,
            "Restart now",
            (dialog, which) -> {
              new Thread(
                      () -> {
                        boolean saved = save(p);
                        activity.runOnUiThread(() -> {
                          if (gone(activity)) return;
                          if (saved) launch(activity);
                          else
                            Toast.makeText(
                                    activity,
                                    "Could not save settings. Slack was not restarted. Please try"
                                        + " again.",
                                    Toast.LENGTH_LONG)
                                .show();
                          later.run();
                        });
                      },
                      "slick-restart-save")
                  .start();
            },
            "Later",
            (dialog, which) -> later.run())
        .setOnCancelListener(dialog -> later.run());
  }

  private static boolean gone(Activity activity) {
    return activity.isFinishing() || activity.isDestroyed();
  }

  private static boolean save(SharedPreferences preferences) {
    try {
      return preferences.edit().commit();
    } catch (RuntimeException e) {
      return false;
    }
  }

  private static void launch(Activity activity) {
    try {
      String name = activity.getPackageName();
      var pm = activity.getPackageManager();
      Intent target =
          pm.hasSystemFeature("android.software.leanback")
              ? pm.getLeanbackLaunchIntentForPackage(name)
              : null;
      if (target == null) target = pm.getLaunchIntentForPackage(name);
      if (target == null) throw new IllegalStateException("No Slack launch activity");
      target.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
      Intent restart =
          new Intent(activity, Class.forName("com.jakewharton.processphoenix.PhoenixActivity"));
      restart.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      restart.putParcelableArrayListExtra(
          "phoenix_restart_intents", new ArrayList<>(Collections.singletonList(target)));
      restart.putExtra("phoenix_main_process_pid", Process.myPid());
      activity.startActivity(restart);
    } catch (ReflectiveOperationException | RuntimeException e) {
      Toast.makeText(
              activity,
              "Unable to restart Slack. Your setting is saved; close and reopen Slack to apply it.",
              Toast.LENGTH_LONG)
          .show();
    }
  }
}
