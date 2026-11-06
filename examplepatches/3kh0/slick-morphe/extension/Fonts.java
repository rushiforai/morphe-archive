package slick.android;

import android.graphics.Typeface;
import java.io.File;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;

public final class Fonts {
  private static boolean loaded;
  private static Typeface selected;
  private static final Map<Integer, Typeface> styles = new HashMap<>();
  private static final Map<Integer, Object> composeStyles = new HashMap<>();
  private static final Map<Object, Boolean> families = new IdentityHashMap<>();
  private static final int[] LATO = {900, -900, 700, -700, 400, 100, -100, -400, 300, -300, 400};

  public static String label() {
    String name = Settings.preferences.getString("text_font", "default");
    return name.equals("lexend")
        ? "Lexend"
        : name.startsWith("import-") ? "Imported font" : "System default";
  }

  private static boolean lato(int id) {
    return id >= 0x7f090000 && id <= 0x7f09000a;
  }

  private static int key(int weight, boolean italic) {
    return weight * 2 + (italic ? 1 : 0);
  }

  private static Typeface base() {
    if (Settings.preferences == null || Settings.context == null) return null;
    if (!loaded) {
      loaded = true;
      String name = Settings.preferences.getString("text_font", "default");
      try {
        if (name.equals("lexend"))
          selected = Typeface.createFromAsset(Settings.context.getAssets(), "slick/Lexend.ttf");
        else if (name.matches("import-[0-9a-f]{64}\\.font"))
          selected =
              Typeface.createFromFile(
                  new File(new File(Settings.context.getNoBackupFilesDir(), "slick-fonts"), name));
      } catch (RuntimeException e) {
        android.util.Log.e("Slick", "Custom font unavailable; retaining Slack font", e);
      }
    }
    return selected;
  }

  private static Typeface styled(int weight, boolean italic) {
    return styles.computeIfAbsent(
        key(weight, italic), k -> Typeface.create(selected, weight, italic));
  }

  public static synchronized Typeface resource(int id, android.content.Context context) {
    if (!lato(id) || context.isRestricted() || base() == null) return null;
    int w = LATO[id - 0x7f090000];
    return styled(Math.abs(w), w < 0);
  }

  public static synchronized Typeface load(
      android.content.Context context,
      int id,
      android.util.TypedValue value,
      int style,
      Object callback,
      boolean fromLayout,
      boolean cachedOnly) {
    if (cachedOnly) return null;
    Typeface face = resource(id, context);
    if (face == null) return null;
    try {
      context.getResources().getValue(id, value, true);
      Typeface f = id == 0x7f090004 ? styled((style & 1) != 0 ? 700 : 400, (style & 2) != 0) : face;
      if (callback != null) {
        java.lang.reflect.Method success =
            callback.getClass().getMethod("onFontRetrieved", Typeface.class);
        success.setAccessible(true);
        if (!new android.os.Handler(android.os.Looper.getMainLooper())
            .post(() -> {
              try {
                success.invoke(callback, f);
              } catch (ReflectiveOperationException | RuntimeException e) {
                android.util.Log.e("Slick", "Custom font callback failed", e);
              }
            })) return null;
      }
      return f;
    } catch (ReflectiveOperationException | RuntimeException e) {
      android.util.Log.e("Slick", "Custom resource font unavailable", e);
      return null;
    }
  }

  public static synchronized Object compose(Object request) {
    if (base() == null) return null;
    try {
      if (!admitted(Host.get(request, "fontFamily"))) return null;
      int weight = (Integer) Host.get(Host.get(request, "fontWeight"), "weight");
      boolean italic = (Integer) Host.get(request, "fontStyle") == 1;
      if ((Integer) Host.get(request, "fontSynthesis") != 65535) return null;
      int k = key(weight, italic);
      Object result = composeStyles.get(k);
      if (result == null)
        composeStyles.put(
            k,
            result =
                Class.forName("androidx.compose.ui.text.font.TypefaceResult$Immutable")
                    .getConstructor(Object.class, boolean.class)
                    .newInstance(styled(weight, italic), true));
      return result;
    } catch (ReflectiveOperationException | RuntimeException e) {
      return null;
    }
  }

  private static boolean admitted(Object family) throws ReflectiveOperationException {
    if (family == null) return true;
    Boolean cached = families.get(family);
    if (cached != null) return cached;
    String type = family.getClass().getName();
    boolean allowed = type.equals("androidx.compose.ui.text.font.DefaultFontFamily");
    if (type.equals("androidx.compose.ui.text.font.GenericFontFamily"))
      allowed = "sans-serif".equals(Host.get(family, "name"));
    if (type.equals("androidx.compose.ui.text.font.FontListFontFamily")) {
      boolean sawLato = false;
      allowed = true;
      for (Object font : (java.util.List<?>) Host.get(family, "fonts")) {
        String t = font.getClass().getName();
        if (t.equals("androidx.compose.ui.text.font.ResourceFont")) {
          if (!lato((Integer) Host.get(font, "resId"))) {
            allowed = false;
            break;
          }
          sawLato = true;
        } else if (!t.equals("androidx.compose.ui.text.googlefonts.GoogleFontImpl")) {
          allowed = false;
          break;
        }
      }
      allowed &= sawLato;
    }
    if (families.size() >= 64) families.clear();
    families.put(family, allowed);
    return allowed;
  }
}
