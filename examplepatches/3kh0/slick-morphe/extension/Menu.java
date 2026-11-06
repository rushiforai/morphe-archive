package slick.android;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class Menu {
  private static final String ID = "slick_mod_settings";
  private static final List<PopupAction> popupActions = new ArrayList<>();

  private static final class PopupAction {
    final WeakReference<Object> row;
    final WeakReference<Activity> activity;
    final String scope;

    PopupAction(Object row, Activity activity, String scope) {
      this.row = new WeakReference<>(row);
      this.activity = new WeakReference<>(activity);
      this.scope = scope;
    }
  }

  @SuppressWarnings("unchecked")
  public static Object popup(Object model, Object presenter, Object composer) {
    try {
      Object stock = Host.get(model, "menuItems");
      List<?> items = (List<?>) stock;
      for (Object item : items)
        if (item.getClass().getName().equals("slack.uikit.components.pageheader.menu.SKMenuItem")
            && ID.equals(Host.get(item, "id"))) return model;
      for (int i = 0; i < items.size(); i++) {
        Object template = items.get(i);
        if (!template
                .getClass()
                .getName()
                .equals("slack.uikit.components.pageheader.menu.SKMenuItem")
            || !"you_menu_preferences".equals(Host.get(template, "id"))) continue;
        Activity activity = NativeSettings.activity(composer);
        if (activity == null) return model;
        String scope = Accounts.scope(Host.get(presenter, "loggedInUser"));
        Object title =
            Class.forName("slack.uikit.text.CharSequenceResource")
                .getConstructor(CharSequence.class)
                .newInstance("Slick setup");
        Object icon =
            Arrays.stream(
                    Class.forName("slack.uikit.components.SKImageResource$Icon").getConstructors())
                .filter(c -> c.getParameterCount() == 3)
                .findFirst()
                .orElseThrow()
                .newInstance(
                    activity.getResources().getIdentifier("bolt", "drawable", "com.Slack"),
                    null,
                    null);
        Constructor<?> constructor =
            Arrays.stream(template.getClass().getConstructors())
                .filter(c -> c.getParameterCount() == 8 && c.getParameterTypes()[5] == int.class)
                .findFirst()
                .orElseThrow();
        Object entry =
            constructor.newInstance(
                ID,
                icon,
                title,
                Host.get(template, "tint"),
                null,
                Host.get(template, "maxLines"),
                null,
                null);
        Object builder = stock.getClass().getMethod("builder").invoke(stock);
        ((List<Object>) builder).add(i + 1, entry);
        Object updated = builder.getClass().getMethod("build").invoke(builder);
        popupActions.removeIf(action -> action.row.get() == null);
        popupActions.add(new PopupAction(entry, activity, scope));
        // NavHeaderYouModel is immutable. Return a copy rather than assigning its final fields.
        return Arrays.stream(model.getClass().getConstructors())
            .filter(c -> c.getParameterCount() == 11)
            .findFirst()
            .orElseThrow()
            .newInstance(
                Host.get(model, "avatar"),
                Host.get(model, "statusEmoji"),
                Host.get(model, "preferredName"),
                Host.get(model, "statusText"),
                Host.get(model, "isActive"),
                Host.get(model, "isIaHeaderComposeEnabled"),
                Host.get(model, "showYouMenu"),
                Host.get(model, "notificationsPauseState"),
                updated,
                Host.get(model, "pauseSectionEntries"),
                Host.get(model, "eventSink"));
      }
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Cannot add popup setup menu", e);
    }
    return model;
  }

  public static boolean popupClick(Object row) {
    PopupAction action = null;
    for (PopupAction candidate : popupActions)
      if (candidate.row.get() == row) {
        action = candidate;
        break;
      }
    if (action == null) return false;
    Activity activity = action.activity.get();
    if (activity == null) return true;
    try {
      activity.startActivity(
          new Intent(activity, Class.forName("slack.features.settings.SettingsActivity"))
              .putExtra(NativeSettings.EXTRA, true)
              .putExtra("scope", action.scope));
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Cannot open popup setup menu", e);
    }
    return true;
  }

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
