package slick.android;

import android.content.SharedPreferences;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Overrides Slack's feature flags, which turn its features and experiments on and off. Ported from
 * the Slack "Feature flags" patch of HagiaHaya/morphe-patches (GPLv3).
 */
public final class FeatureFlags {
  /** Overrides are stored in Slick's preferences under this prefix, next to the switch. */
  private static final String PREFIX = "flag:";

  private static volatile WeakReference<Object> store = new WeakReference<>(null);
  private static volatile Map<String, Boolean> overrides;
  private static final ConcurrentHashMap<Object, String> keys = new ConcurrentHashMap<>();
  private static volatile java.lang.reflect.Method getKey;
  private static boolean reported;

  private FeatureFlags() {}

  /** A flag of the loaded workspace with Slack's own value. */
  static final class Flag {
    final String key;
    final boolean value;

    Flag(String key, boolean value) {
      this.key = key;
      this.value = value;
    }
  }

  /** Hook: FeatureFlagStoreImpl was constructed for a workspace. */
  public static void store(Object s) {
    store = new WeakReference<>(s);
  }

  /** Hook: start of FeatureFlagStoreImpl.isEnabled. Returns 1 or 0 to force a flag, else -1. */
  public static int override(Object flag) {
    try {
      Map<String, Boolean> map = overrides();
      if (map.isEmpty() || !Settings.enabled("feature_flags")) return -1;
      Boolean value = map.get(key(flag));
      return value == null ? -1 : value ? 1 : 0;
    } catch (ReflectiveOperationException | RuntimeException e) {
      if (!reported) {
        reported = true;
        Log.e("Slick", "Cannot override feature flags; keeping Slack's values", e);
      }
      return -1;
    }
  }

  /** Flags of the last loaded workspace, sorted by key; empty until Slack loads one. */
  static List<Flag> flags() {
    List<Flag> flags = new ArrayList<>();
    Object s = store.get();
    if (s == null) return flags;
    try {
      for (Map.Entry<?, ?> e : ((Map<?, ?>) Host.get(s, "featureFlagMap")).entrySet())
        flags.add(new Flag(key(e.getKey()), Boolean.TRUE.equals(e.getValue())));
    } catch (ReflectiveOperationException | RuntimeException e) {
      Log.e("Slick", "Cannot read feature flags", e);
    }
    flags.sort((a, b) -> a.key.compareTo(b.key));
    return flags;
  }

  /** The override of a flag, or null for Slack's value. */
  static Boolean get(String key) {
    return overrides().get(key);
  }

  /** Overrides a flag, or removes its override when value is null. */
  static void set(String key, Boolean value) {
    SharedPreferences p = Settings.preferences;
    if (p == null) return;
    Map<String, Boolean> map = overrides();
    if (value == null) {
      map.remove(key);
      p.edit().remove(PREFIX + key).apply();
    } else {
      map.put(key, value);
      p.edit().putBoolean(PREFIX + key, value).apply();
    }
  }

  static int count() {
    return overrides().size();
  }

  static void clear() {
    SharedPreferences p = Settings.preferences;
    if (p == null) return;
    SharedPreferences.Editor editor = p.edit();
    for (String key : overrides().keySet()) editor.remove(PREFIX + key);
    editor.apply();
    overrides().clear();
  }

  private static Map<String, Boolean> overrides() {
    Map<String, Boolean> map = overrides;
    if (map != null) return map;
    SharedPreferences p = Settings.preferences;
    if (p == null) return new ConcurrentHashMap<>();
    synchronized (FeatureFlags.class) {
      if (overrides == null) {
        map = new ConcurrentHashMap<>();
        for (Map.Entry<String, ?> e : p.getAll().entrySet())
          if (e.getKey().startsWith(PREFIX) && e.getValue() instanceof Boolean)
            map.put(e.getKey().substring(PREFIX.length()), (Boolean) e.getValue());
        overrides = map;
      }
      return overrides;
    }
  }

  /** FeatureFlagEnum.getKey(); flags are enum constants, so each key is looked up once. */
  private static String key(Object flag) throws ReflectiveOperationException {
    String k = keys.get(flag);
    if (k != null) return k;
    // Resolve through the public interface: constants with bodies are non-public subclasses.
    if (getKey == null)
      getKey = Class.forName("slack.featureflag.FeatureFlagEnum").getMethod("getKey");
    k = (String) getKey.invoke(flag);
    keys.put(flag, k);
    return k;
  }
}
