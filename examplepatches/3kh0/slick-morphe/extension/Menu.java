package slick.android;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class Menu {
  private static final String ID = "slick_mod_settings";

  public static void insert(Object fragment) {
    try {
      ArrayList<Object> items = new ArrayList<>((List<?>) Host.get(fragment, "items"));
      Class<?> you = Class.forName("slack.features.navigationview.you.data.YouType");
      String preferences =
          (String) you.getMethod("getId").invoke(you.getField("PREFERENCES").get(null));
      for (int i = 0; i < items.size(); i++) {
        Object row = items.get(i);
        String id = id(row);
        if (ID.equals(id)) return;
        if (!preferences.equals(id)) continue;
        Object title =
            Class.forName("slack.uikit.text.CharSequenceResource")
                .getConstructor(CharSequence.class)
                .newInstance("Slick settings");
        Constructor<?> constructor = null;
        for (Constructor<?> c : row.getClass().getConstructors())
          if (c.getParameterTypes().length == 11) constructor = c;
        if (constructor == null) throw new NoSuchMethodException("Slack settings row constructor");
        Object old = Host.get(row, "icon");
        int bolt = Settings.context.getResources().getIdentifier("bolt", "drawable", "com.Slack");
        Object icon =
            Arrays.stream(old.getClass().getConstructors())
                .filter(c -> c.getParameterCount() == 3)
                .findFirst()
                .orElseThrow()
                .newInstance(bolt, Host.get(old, "tintColor"), Host.get(old, "contentDescription"));
        items.add(
            i + 1,
            constructor.newInstance(
                ID,
                title,
                null,
                icon,
                title,
                null,
                Host.get(row, "type"),
                Host.get(row, "options"),
                null,
                null,
                null));
        Host.set(fragment, "items", items);
        return;
      }
      throw new IllegalStateException("Preferences row not found");
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Cannot add mod menu", e);
    }
  }

  private static String id(Object row) throws ReflectiveOperationException {
    return (String) row.getClass().getMethod("id").invoke(row);
  }

  public static boolean click(Object listener, Object row) {
    try {
      if (!ID.equals(row.getClass().getMethod("id").invoke(row))) return false;
      Object fragment = Host.get(listener, "this$0");
      Activity a = (Activity) fragment.getClass().getMethod("requireActivity").invoke(fragment);
      String scope = Accounts.scope(Host.get(fragment, "loggedInUser"));
      a.startActivity(
          new Intent(a, Class.forName("slack.features.settings.SettingsActivity"))
              .putExtra(NativeSettings.EXTRA, true)
              .putExtra("scope", scope));
      return true;
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Cannot open mod menu", e);
      return false;
    }
  }
}
