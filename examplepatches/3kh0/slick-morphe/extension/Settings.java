package slick.android;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

public final class Settings {
  static volatile Context context;
  static volatile SharedPreferences preferences;

  public static void initialize(Application app) {
    context = app;
    preferences = app.getSharedPreferences("slick_mod_settings", Context.MODE_PRIVATE);
    CrashReports.install(app);
  }

  public static String patched() {
    return "|";
  }

  public static boolean available(String key) {
    if (key.equals("crash")) return true;
    if (key.equals("erase")) return available("message_logger") || available("last_seen");
    return patched().contains("|" + key + "|");
  }

  public static boolean enabled(String key) {
    if (!available(key)) return false;
    SharedPreferences p = preferences;
    boolean fallback = key.equals("silent_typing") || key.equals("block_telemetry");
    return p == null ? fallback : p.getBoolean(key, fallback);
  }

  public static boolean silentTyping() {
    return enabled("silent_typing");
  }
}
