package slick.android;

import android.content.Context;
import android.util.Log;
import java.util.Arrays;
import java.util.IdentityHashMap;

public final class Appearance {
  private static final IdentityHashMap<Object, Object> darkCache = new IdentityHashMap<>();
  private static boolean darkAmoled;

  private static synchronized Object dark(Object original, boolean core) {
    boolean amoled = Settings.enabled("amoled");
    if (darkAmoled != amoled) {
      darkCache.clear();
      darkAmoled = amoled;
    }
    if (!amoled) return original;
    Object result = darkCache.get(original);
    if (result != null) return result;
    result = core ? coreAmoled(original) : composeAmoled(original);
    if (darkCache.size() >= 64) darkCache.clear();
    darkCache.put(original, result);
    return result;
  }

  private static long pack(int argb) {
    return ((long) argb) << 32;
  }

  private static Object copy(Object source, String[] fields, Long... values)
      throws ReflectiveOperationException {
    Class<?>[] types = new Class<?>[fields.length];
    Arrays.fill(types, long.class);
    Object[] args = new Object[fields.length];
    for (int i = 0; i < fields.length; i++)
      args[i] = i < values.length && values[i] != null ? values[i] : Host.get(source, fields[i]);
    return source.getClass().getConstructor(types).newInstance(args);
  }

  static boolean night(Context context) {
    return (context.getResources().getConfiguration().uiMode & 48) == 32;
  }

  private static int style(Context context, String name) {
    return context.getResources().getIdentifier(name, "style", "com.Slack");
  }

  public static Integer overlay(Integer original) {
    if (original == null || !Settings.enabled("amoled") || Settings.context == null)
      return original;
    int id = style(Settings.context, "SlickAmoled");
    return id == 0 ? original : id;
  }

  public static String headerTitle(String original) {
    return Settings.enabled("workspace_title") ? original : "Slick";
  }

  public static boolean blackSheet(boolean dark) {
    return dark && Settings.enabled("amoled");
  }

  public static void sheet(android.app.Dialog dialog) {
    Context context = dialog.getContext();
    if (!Settings.enabled("amoled") || !night(context)) return;
    int id = style(context, "SlickAmoledSheet");
    if (id != 0) context.getTheme().applyStyle(id, true);
  }

  public static Object core(Object original) {
    return dark(original, true);
  }

  public static Object compose(Object original) {
    return dark(original, false);
  }

  private static Object coreAmoled(Object original) {
    if (!Settings.enabled("amoled")) return original;
    try {
      long black = pack(0xff000000);
      Object base =
          copy(
              Host.get(original, "base"),
              new String[] {
                "primary",
                "secondary",
                "tertiary",
                "highlight1",
                "highlight2",
                "highlight3",
                "important",
                "modal",
                "inversePrimary",
                "inverseHighlight1",
                "inverseHighlight2",
                "inverseHighlight3",
                "inverseImportant",
                "education",
                "inverseEducation"
              },
              black,
              black,
              black);
      Object container =
          copy(
              Host.get(original, "container"), new String[] {"primary", "secondary"}, black, black);
      return original
          .getClass()
          .getConstructors()[0]
          .newInstance(
              base,
              Host.get(original, "surface"),
              container,
              Host.get(original, "content"),
              Host.get(original, "outline"));
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Cannot apply AMOLED core palette", e);
      return original;
    }
  }

  private static Object composeAmoled(Object original) {
    if (!Settings.enabled("amoled")) return original;
    try {
      long black = pack(0xff000000),
          white = pack(0xfff8f8f8),
          gray = pack(0xff181818),
          dim = pack(0xff121212),
          muted = pack(0xffbababa),
          faint = pack(0xff9a9a9a);
      Object base =
          copy(
              Host.get(original, "base"),
              new String[] {
                "primary",
                "secondary",
                "highlight1",
                "highlight2",
                "important",
                "inversePrimary",
                "inverseSecondary",
                "inverseHighlight1",
                "inverseHighlight2",
                "inverseImportant"
              },
              black,
              black,
              null,
              null,
              null,
              black,
              gray);
      Object surface =
          copy(
              Host.get(original, "surface"),
              new String[] {
                "primary",
                "secondary",
                "tertiary",
                "inversePrimary",
                "inverseSecondary",
                "inverseTertiary"
              },
              gray,
              dim,
              black,
              black,
              gray,
              dim);
      Object content =
          copy(
              Host.get(original, "content"),
              new String[] {
                "primary",
                "secondary",
                "tertiary",
                "highlight1",
                "important",
                "inversePrimary",
                "inverseSecondary",
                "inverseTertiary",
                "inverseHighlight1",
                "inverseImportant",
                "inverseImportantSecondary"
              },
              white,
              muted,
              faint,
              null,
              null,
              white,
              muted,
              faint);
      Object background =
          Host.get(original, "background")
              .getClass()
              .getConstructor(long.class, long.class, boolean.class)
              .newInstance(black, black, false);
      return original
          .getClass()
          .getConstructors()[0]
          .newInstance(
              base,
              surface,
              content,
              Host.get(original, "outline"),
              background,
              Host.get(original, "palettes"));
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Cannot apply AMOLED Compose palette", e);
      return original;
    }
  }
}
