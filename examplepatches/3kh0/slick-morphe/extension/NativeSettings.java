package slick.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.view.ContextThemeWrapper;
import android.widget.ScrollView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;

public final class NativeSettings {
  static final String EXTRA = "slick_settings";
  private static final String MODELS = "slack.uikit.components.list.viewmodels.";

  private static Object make(String type, int arity, Object... args)
      throws ReflectiveOperationException {
    return java.util.Arrays.stream(Class.forName(type).getConstructors())
        .filter(c -> c.getParameterCount() == arity)
        .findFirst()
        .orElseThrow()
        .newInstance(args);
  }

  private static Activity activity(Object composer) throws ReflectiveOperationException {
    Object local =
        Class.forName("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt")
            .getField("LocalContext")
            .get(null);
    Context context =
        (Context)
            composer
                .getClass()
                .getMethod(
                    "consume", Class.forName("androidx.compose.runtime.ProvidableCompositionLocal"))
                .invoke(composer, local);
    while (context instanceof ContextWrapper && !(context instanceof Activity))
      context = ((ContextWrapper) context).getBaseContext();
    return context instanceof Activity ? (Activity) context : null;
  }

  /** The composing Activity when it was opened as a Slick settings page, otherwise null. */
  private static Activity page(Object composer) throws ReflectiveOperationException {
    Activity a = activity(composer);
    return a != null && a.getIntent().getBooleanExtra(EXTRA, false) ? a : null;
  }

  public static int titleResource(int original, Object composer) {
    try {
      Activity activity = page(composer);
      if (activity == null) return original;
      return activity
          .getResources()
          .getIdentifier(
              activity.getIntent().getBooleanExtra("slick_cache", false)
                  ? "slick_cache_title"
                  : "slick_settings_title",
              "string",
              "com.Slack");
    } catch (ReflectiveOperationException e) {
      throw new IllegalStateException("Slick Preferences title contract changed", e);
    }
  }

  public static Object state(Object original, Object composer) {
    try {
      Activity activity = page(composer);
      if (activity == null) return original;
      composer.getClass().getMethod("startReplaceGroup", int.class).invoke(composer, 0x534c494b);
      try {
        Object remembered = composer.getClass().getMethod("rememberedValue").invoke(composer);
        Object empty =
            Class.forName("androidx.compose.runtime.Composer$Companion")
                .getField("Empty")
                .get(null);
        Session session;
        if (remembered == empty) {
          session = new Session(activity, (List<?>) Host.get(original, "skListItems"));
          composer
              .getClass()
              .getMethod("updateRememberedValue", Object.class)
              .invoke(composer, session);
        } else session = (Session) remembered;
        session.revision.getClass().getMethod("getValue").invoke(session.revision);
        return make(
            "slack.features.settings.circuit.PreferenceSettings$State",
            3,
            session.items(),
            null,
            session.events);
      } finally {
        composer.getClass().getMethod("end", boolean.class).invoke(composer, false);
      }
    } catch (ReflectiveOperationException e) {
      throw new IllegalStateException("Slick Preferences rendering contract changed", e);
    }
  }

  private static Object text(String value) throws ReflectiveOperationException {
    return make("slack.uikit.text.CharSequenceResource", 1, value);
  }

  private static final class Session {
    final Activity activity;
    final Object toggleTemplate, actionTemplate, revision, events;
    final boolean cachePage;
    final Set<String> selectedCaches = new HashSet<>();
    CacheCleaner.Snapshot cache;
    boolean cacheBusy;
    String cacheNotice = "Scanning disposable caches…";

    Session(Activity activity, List<?> stock) throws ReflectiveOperationException {
      this.activity = activity;
      cachePage = activity.getIntent().getBooleanExtra("slick_cache", false);
      toggleTemplate = find(stock, "id_underline_links");
      actionTemplate = find(stock, "id_dark_mode");
      revision =
          Class.forName("androidx.compose.runtime.Updater")
              .getMethod("mutableStateOf$default", Object.class)
              .invoke(null, 0);
      Class<?> function = Class.forName("kotlin.jvm.functions.Function1");
      events =
          Proxy.newProxyInstance(
              function.getClassLoader(),
              new Class<?>[] {function},
              (proxy, method, args) -> {
                if (method.getName().equals("equals")) return proxy == args[0];
                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (method.getName().equals("toString")) return "Slick Preferences events";
                if (!method.getName().equals("invoke"))
                  throw new UnsupportedOperationException(method.getName());
                Object event = args[0];
                String id = (String) Host.get(event, "itemId");
                if (event.getClass().getName().endsWith("$ChangeToggle")) {
                  String key = id.substring("slick_".length());
                  boolean enabled = (Boolean) Host.get(event, "enabled");
                  if (cachePage) {
                    if (!cacheBusy && cache != null)
                      for (CacheCleaner.Category c : cache.categories)
                        if (key.equals("cache_" + c.id) && c.clearable) {
                          if (enabled) selectedCaches.add(c.id);
                          else selectedCaches.remove(c.id);
                        }
                  } else if (Restart.needed(key)) {
                    Restart.change(activity, key, enabled);
                  } else {
                    Settings.preferences.edit().putBoolean(key, enabled).apply();
                    if (key.equals("message_logger")) InlineHistory.invalidate(null, null);
                  }
                  changed();
                } else if (event.getClass().getName().endsWith("$ClickItem")) action(id);
                return Class.forName("kotlin.Unit").getField("INSTANCE").get(null);
              });
      if (cachePage) scanCache();
    }

    private void changed() throws ReflectiveOperationException {
      int version = (Integer) revision.getClass().getMethod("getValue").invoke(revision);
      revision.getClass().getMethod("setValue", Object.class).invoke(revision, version + 1);
    }

    private Object find(List<?> list, String id) throws ReflectiveOperationException {
      for (Object item : list) if (id.equals(Host.get(item, "id"))) return item;
      throw new IllegalStateException("Slack preference template missing: " + id);
    }

    List<Object> items() throws ReflectiveOperationException {
      if (cachePage) return cacheItems();
      ArrayList<Object> items = new ArrayList<>();
      section(items, "Appearance");
      row(
          items,
          "amoled",
          "moon",
          "AMOLED theme",
          "Finally, a real dark mode. Restart Slack to apply.",
          true);
      row(
          items,
          "font",
          "file",
          "Text font",
          "System default, Lexend or your own TTF/OTF. Restart to apply.",
          false);
      row(
          items,
          "workspace_title",
          "building",
          "Show workspace name",
          "Use your workspace name instead of Slick. Reopen Home to apply.",
          true);
      row(
          items,
          "pronouns",
          "user",
          "Show pronouns",
          "Display users' pronouns next to their messages",
          true);
      row(
          items,
          "who_reacted",
          "add_reaction",
          "Who reacted",
          "Show the avatars of everyone who reacted next to each reaction",
          true);
      section(items, "Privacy");
      row(
          items,
          "silent_typing",
          "keyboard",
          "Silent typing",
          "Never show the is typing… indicator to anyone else",
          true);
      row(
          items,
          "anonymous_uploads",
          "file_upload",
          "Anonymous file names",
          "Replace uploaded file names with a random string.",
          true);
      section(items, "Local history");
      row(
          items,
          "message_logger",
          "history",
          "Message logger",
          "Keep deleted and edited messages visible",
          true);
      row(
          items,
          "last_seen",
          "clock",
          "Last seen",
          "Show a last seen time for other people, based on what your client can observe.",
          true);
      row(
          items,
          "log",
          "file",
          "Message log",
          "Text retained for this account and workspace",
          false);
      row(
          items,
          "activity",
          "clock",
          "Observed activity",
          "Activity received while tracking is enabled",
          false);
      row(
          items,
          "erase",
          "trash",
          "Erase local history",
          "Remove this account's logs and observed activity",
          false);
      section(items, "Storage");
      row(
          items,
          "cache",
          "file",
          "Cache cleaner",
          "See storage usage and choose which disposable caches to clear",
          false);
      section(items, "Advanced");
      row(
          items,
          "feature_flags",
          "flag",
          "Apply feature flags",
          "Apply your flag overrides. This can break Slack in ways you don't even understand."
              + " Restart to apply.",
          true);
      row(items, "flags", "flag", "Feature flags", "Turn Slack's experiments on or off", false);
      section(items, "Diagnostics");
      row(items, "crash", "bug", "Latest crash report", "Used for debugging :3", false);
      return items;
    }

    private void section(List<Object> items, String label) throws ReflectiveOperationException {
      if (!items.isEmpty())
        items.add(make(MODELS + "SKListDividerPresentationObject", 2, "slick_divider_" + label, 6));
      items.add(
          make(
              MODELS + "SKListHeaderPresentationObject",
              9,
              "slick_section_" + label,
              text(label),
              null,
              null,
              null,
              null,
              null,
              null,
              1020));
    }

    private void row(
        List<Object> items, String key, String icon, String title, String summary, boolean toggle)
        throws ReflectiveOperationException {
      row(items, key, icon, title, summary, toggle, Settings.enabled(key), true);
    }

    private void row(
        List<Object> items,
        String key,
        String icon,
        String title,
        String summary,
        boolean toggle,
        boolean selected,
        boolean enabled)
        throws ReflectiveOperationException {
      Object template = toggle ? toggleTemplate : actionTemplate;
      Object options = Host.get(template, "options");
      if (toggle || !enabled) {
        options =
            make(
                options.getClass().getName(),
                13,
                enabled && (Boolean) Host.get(options, "isClickable"),
                Host.get(options, "isLongClickable"),
                enabled && (Boolean) Host.get(options, "isEnabled"),
                Host.get(options, "isHighlighted"),
                selected,
                Host.get(options, "size"),
                Host.get(options, "iconBackgroundColor"),
                Host.get(options, "imageResIsIcon"),
                Host.get(options, "unreadType"),
                Host.get(options, "maxLinesTitle"),
                Host.get(options, "maxLinesSubtitle"),
                Host.get(options, "combineTitleAndSubtitle"),
                Host.get(options, "titleOverflow"));
      }
      Object image =
          make(
              "slack.uikit.components.SKImageResource$Icon",
              3,
              activity.getResources().getIdentifier(icon, "drawable", "com.Slack"),
              null,
              null);
      items.add(
          make(
              MODELS + "SKListGenericPresentationObject",
              11,
              "slick_" + key,
              text(title),
              text(summary),
              image,
              null,
              null,
              Host.get(template, "type"),
              options,
              Host.get(template, "accessories"),
              null,
              null));
    }

    private List<Object> cacheItems() throws ReflectiveOperationException {
      ArrayList<Object> items = new ArrayList<>();
      section(items, "Cache usage");
      row(
          items,
          "cache_chart",
          "file",
          cache == null ? "Scanning…" : CacheCleaner.format(cache.total()) + " measured cache",
          cacheNotice,
          false,
          false,
          cache != null && !cacheBusy);
      section(items, "Choose what to clear");
      if (cache != null)
        for (CacheCleaner.Category c : cache.categories) {
          String size = c.bytes < 0 ? "Size unavailable" : CacheCleaner.format(c.bytes);
          String percent =
              cache.total() > 0 && c.bytes > 0
                  ? String.format(
                      java.util.Locale.ROOT, " · %.1f%%", 100d * c.bytes / cache.total())
                  : "";
          row(
              items,
              "cache_" + c.id,
              "file",
              c.title + " · " + size + percent,
              c.detail,
              true,
              selectedCaches.contains(c.id),
              !cacheBusy && c.clearable && c.bytes > 0);
        }
      section(items, "Manage storage");
      long selected = selectedBytes();
      row(
          items,
          "cache_clear",
          "trash",
          cacheBusy ? "Working…" : "Clear selected · " + CacheCleaner.format(selected),
          "Disposable caches across all workspaces on this device. Downloads may be needed again.",
          false,
          false,
          !cacheBusy && selected > 0);
      row(
          items,
          "cache_refresh",
          "history",
          "Refresh usage",
          "Cache sizes can change while Slack is running",
          false,
          false,
          !cacheBusy);
      return items;
    }

    private long selectedBytes() {
      long bytes = 0;
      if (cache != null)
        for (CacheCleaner.Category c : cache.categories)
          if (c.clearable && selectedCaches.contains(c.id)) bytes += Math.max(0, c.bytes);
      return bytes;
    }

    private void scanCache() {
      if (busy("Scanning in the background…")) CacheCleaner.scan(receiver());
    }

    private boolean busy(String notice) {
      if (cacheBusy) return false;
      cacheBusy = true;
      cacheNotice = notice;
      cacheChanged();
      return true;
    }

    private Consumer<CacheCleaner.Snapshot> receiver() {
      WeakReference<Session> reference = new WeakReference<>(this);
      return snapshot -> deliver(reference, snapshot);
    }

    private static void deliver(WeakReference<Session> reference, CacheCleaner.Snapshot snapshot) {
      Session session = reference.get();
      if (session == null) return;
      session.activity.runOnUiThread(() -> {
        if (session.activity.isFinishing() || session.activity.isDestroyed()) return;
        boolean first = session.cache == null;
        session.cache = snapshot;
        session.cacheBusy = false;
        session.cacheNotice = snapshot.notice;
        Set<String> available = new HashSet<>();
        for (CacheCleaner.Category c : snapshot.categories)
          if (c.clearable && c.bytes > 0) available.add(c.id);
        session.selectedCaches.retainAll(available);
        if (first) session.selectedCaches.addAll(available);
        session.cacheChanged();
      });
    }

    private void cacheChanged() {
      try {
        changed();
      } catch (ReflectiveOperationException e) {
        throw new IllegalStateException("Cache settings refresh failed", e);
      }
    }

    private void cacheAction(String id) {
      if (cacheBusy) return;
      if (id.equals("slick_cache_refresh")) {
        scanCache();
        return;
      }
      if (id.equals("slick_cache_chart") && cache != null) {
        CacheChart.show(activity, cache);
        return;
      }
      if (!id.equals("slick_cache_clear") || selectedBytes() == 0) return;
      Set<String> chosen = new HashSet<>(selectedCaches);
      StringBuilder names = new StringBuilder();
      for (CacheCleaner.Category c : cache.categories)
        if (chosen.contains(c.id) && c.clearable)
          names
              .append("• ")
              .append(c.title)
              .append(" — ")
              .append(CacheCleaner.format(c.bytes))
              .append('\n');
      new AlertDialog.Builder(activity)
          .setTitle("Clear selected caches?")
          .setMessage(
              names
                  + "\n"
                  + "This affects cached media across all workspaces on this device. Slack may"
                  + " download it again. Your messages, uploads, drafts and Slick history are"
                  + " kept.")
          .setNegativeButton("Cancel", null)
          .setPositiveButton(
              "Clear cache",
              (dialog, which) -> {
                if (busy("Clearing selected caches…")) CacheCleaner.clear(chosen, receiver());
              })
          .show();
    }

    private void action(String id) {
      String scope = activity.getIntent().getStringExtra("scope");
      if (id.equals("slick_cache")) {
        try {
          activity.startActivity(
              new Intent(activity, Class.forName("slack.features.settings.SettingsActivity"))
                  .putExtra(EXTRA, true)
                  .putExtra("slick_cache", true)
                  .putExtra("scope", scope));
        } catch (ClassNotFoundException e) {
          throw new IllegalStateException(e);
        }
        return;
      }
      if (cachePage) {
        cacheAction(id);
        return;
      }
      if (id.equals("slick_font")) {
        activity.startActivity(new Intent(activity, FontActivity.class));
        return;
      }
      if (id.equals("slick_flags")) {
        activity.startActivity(new Intent(activity, FeatureFlagsActivity.class));
        return;
      }
      if (id.equals("slick_crash")) {
        CrashReports.show(activity);
        return;
      }
      Context context =
          new ContextThemeWrapper(
              activity,
              Appearance.night(activity)
                  ? android.R.style.Theme_Material_Dialog_Alert
                  : android.R.style.Theme_Material_Light_Dialog_Alert);
      if (id.equals("slick_erase")) {
        new AlertDialog.Builder(context)
            .setTitle("Erase local history?")
            .setMessage(
                "This removes Slick's records for this account and workspace, not messages on"
                    + " Slack's servers.")
            .setNegativeButton("Cancel", null)
            .setPositiveButton("Erase", (d, which) -> Archive.clear(scope))
            .show();
      } else if (id.equals("slick_log") || id.equals("slick_activity")) {
        boolean observed = id.equals("slick_activity");
        TextView text =
            textDialog(context, observed ? "Observed activity" : "Message log", "Loading…");
        Archive.read(scope, observed, result -> activity.runOnUiThread(() -> text.setText(result)));
      }
    }

    private static TextView textDialog(Context context, String title, String body) {
      TextView t = new TextView(context);
      t.setText(body);
      t.setTextIsSelectable(true);
      int p = Math.round(20 * context.getResources().getDisplayMetrics().density);
      t.setPadding(p, p, p, p);
      ScrollView s = new ScrollView(context);
      s.addView(t);
      new AlertDialog.Builder(context)
          .setTitle(title)
          .setView(s)
          .setPositiveButton("Close", null)
          .show();
      return t;
    }
  }
}
