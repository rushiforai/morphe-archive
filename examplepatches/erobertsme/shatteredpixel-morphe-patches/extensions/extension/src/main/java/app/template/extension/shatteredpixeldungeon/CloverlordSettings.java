package app.template.extension.shatteredpixeldungeon;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unused")
public final class CloverlordSettings {

	private static final String PREFS = "cloverlord";
	private static final Map<String, Boolean> cache = new HashMap<>();
	private static final Map<String, Integer> intCache = new HashMap<>();
	private static final Map<String, String> stringCache = new HashMap<>();

	private CloverlordSettings() {
	}

	public static synchronized boolean get(String key) {
		Object override = GameSettings.override(key);
		if (override instanceof Boolean) return (Boolean) override;
		Boolean cached = cache.get(key);
		if (cached != null) return cached;

		SharedPreferences prefs = prefs();
		boolean value = prefs != null && prefs.getBoolean(key, false);
		cache.put(key, value);
		return value;
	}

	public static synchronized void set(String key, boolean value) {
		if (GameSettings.store(key, value)) return;
		cache.put(key, value);
		SharedPreferences prefs = prefs();
		if (prefs == null) return;
		prefs.edit().putBoolean(key, value).apply();
	}

	public static synchronized int getInt(String key) {
		Object override = GameSettings.override(key);
		if (override instanceof Integer) return (Integer) override;
		Integer cached = intCache.get(key);
		if (cached != null) return cached;

		SharedPreferences prefs = prefs();
		int value = prefs == null ? 0 : prefs.getInt(key, 0);
		intCache.put(key, value);
		return value;
	}

	public static synchronized void setInt(String key, int value) {
		if (GameSettings.store(key, value)) return;
		intCache.put(key, value);
		SharedPreferences prefs = prefs();
		if (prefs == null) return;
		prefs.edit().putInt(key, value).apply();
	}

	public static synchronized String getString(String key) {
		Object override = GameSettings.override(key);
		if (override instanceof String) return (String) override;
		if (stringCache.containsKey(key)) return stringCache.get(key);
		SharedPreferences prefs = prefs();
		String value = prefs == null ? null : prefs.getString(key, null);
		stringCache.put(key, value);
		return value;
	}

	public static synchronized void setString(String key, String value) {
		if (GameSettings.store(key, value)) return;
		stringCache.put(key, value);
		SharedPreferences prefs = prefs();
		if (prefs == null) return;
		prefs.edit().putString(key, value).apply();
	}

	private static SharedPreferences prefs() {
		Context context = SaveLocation.getContext();
		if (context == null) return null;
		return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
	}
}
