package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.watabou.noosa.Game;
import com.watabou.noosa.Scene;
import com.watabou.utils.Bundle;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

/**
 * Settings changed during a game are kept with that game's save and override the main menu settings, which act
 * as the defaults for new games. Unlocks, supporter options and favorites always stay global.
 */
@SuppressWarnings("unused")
public final class GameSettings {

	private static final String TAG = "GameSettings";
	private static final String BUNDLE_KEY = "morphe_settings";
	private static final String[] GLOBAL_PREFIXES = { "unlock_", "supporter_", "hide_support", "favorite_", "hunger_", "display_" };
	private static final String[] GAME_SCENES = { "GameScene", "InterlevelScene", "AlchemyScene" };

	private static final Map<String, Object> overrides = new HashMap<>();
	private static WeakReference<Object> owner = new WeakReference<>(null);

	private GameSettings() {
	}

	/**
	 * The value this game has for [key], or null when it follows the main menu setting.
	 */
	static synchronized Object override(String key) {
		if (!inGame() || isGlobal(key)) return null;
		syncOwner();
		return overrides.get(key);
	}

	/**
	 * Stores [value] for this game only. Returns false outside a game, where the main menu setting changes instead.
	 */
	static synchronized boolean store(String key, Object value) {
		if (!inGame() || isGlobal(key)) return false;
		syncOwner();
		overrides.put(key, value);
		return true;
	}

	static boolean inGame() {
		try {
			if (Dungeon.hero == null) return false;
			Scene scene = Game.scene();
			if (scene == null) return false;
			String name = scene.getClass().getSimpleName();
			for (String game : GAME_SCENES) {
				if (game.equals(name)) return true;
			}
			return false;
		} catch (Throwable e) {
			return false;
		}
	}

	private static boolean isGlobal(String key) {
		if (key == null) return true;
		for (String prefix : GLOBAL_PREFIXES) {
			if (key.startsWith(prefix)) return true;
		}
		return false;
	}

	private static void syncOwner() {
		Object hero = Dungeon.hero;
		if (hero == null || owner.get() == hero) return;
		owner = new WeakReference<>(hero);
		overrides.clear();
	}

	/**
	 * Called at the start of Hero.storeInBundle.
	 */
	public static synchronized void onStore(Object hero, Bundle bundle) {
		try {
			if (bundle == null || owner.get() != hero || overrides.isEmpty()) return;
			StringBuilder text = new StringBuilder();
			for (Map.Entry<String, Object> entry : overrides.entrySet()) {
				Object value = entry.getValue();
				char type = value instanceof Boolean ? 'b' : value instanceof Integer ? 'i' : 's';
				if (text.length() > 0) text.append('\n');
				text.append(type).append(entry.getKey()).append('\t').append(value == null ? "" : String.valueOf(value).replace('\n', ' '));
			}
			bundle.put(BUNDLE_KEY, text.toString());
		} catch (Throwable e) {
			Log.e(TAG, "Could not save the game settings", e);
		}
	}

	/**
	 * Called at the start of Hero.restoreFromBundle.
	 */
	public static synchronized void onRestore(Object hero, Bundle bundle) {
		owner = new WeakReference<>(hero);
		overrides.clear();
		try {
			if (bundle == null || !bundle.contains(BUNDLE_KEY)) return;
			String text = bundle.getString(BUNDLE_KEY);
			if (text == null || text.isEmpty()) return;
			for (String line : text.split("\n")) {
				int tab = line.indexOf('\t');
				if (line.length() < 2 || tab < 1) continue;
				char type = line.charAt(0);
				String key = line.substring(1, tab);
				String value = line.substring(tab + 1);
				if (type == 'b') overrides.put(key, Boolean.parseBoolean(value));
				if (type == 'i') overrides.put(key, Integer.parseInt(value));
				if (type == 's') overrides.put(key, value);
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not load the game settings", e);
		}
	}
}
