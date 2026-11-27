package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.plants.Plant;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * Keeps a floor's gardens, its garden rooms and secret gardens, safe: enemies don't trample their plants, fire doesn't catch in them, and
 * enemies leave them alone as if they never saw the way in, golems included. Each can be switched off on its own.
 */
public final class Garden {

	private static final String TAG = "Garden";
	private static final String KEY_TRAMPLE_OFF = "qol_garden_trample_off";
	private static final String KEY_FIRE_OFF = "qol_garden_fire_off";
	private static final String KEY_ENEMIES_OFF = "qol_garden_enemies_off";
	private static final String[] GARDEN_ROOMS = { "GardenRoom", "SecretGardenRoom" };

	private static WeakReference<Level> cachedLevel = new WeakReference<>(null);
	private static boolean[] cachedCells;

	private Garden() {
	}

	static boolean noTrampling() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_TRAMPLE_OFF);
	}

	static void noTrampling(boolean on) {
		CloverlordSettings.set(KEY_TRAMPLE_OFF, !on);
	}

	static boolean noFire() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_FIRE_OFF);
	}

	static void noFire(boolean on) {
		CloverlordSettings.set(KEY_FIRE_OFF, !on);
	}

	static boolean noEnemies() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_ENEMIES_OFF);
	}

	static void noEnemies(boolean on) {
		CloverlordSettings.set(KEY_ENEMIES_OFF, !on);
	}

	/**
	 * Called at the start of Plant.trigger. Returns true to keep the plant when an enemy steps on it in a garden.
	 */
	public static boolean keepsPlant(Object plant) {
		if (!(plant instanceof Plant) || !noTrampling()) return false;
		int cell = ((Plant) plant).pos;
		return isEnemy(Actor.findChar(cell)) && contains(cell);
	}

	/**
	 * Called with the cells that can catch fire each time fire spreads. Returns them without the gardens' cells.
	 */
	public static boolean[] flammable(boolean[] cells) {
		if (cells == null || !noFire()) return cells;
		boolean[] garden = cells();
		if (garden == null) return cells;
		boolean[] result = cells.clone();
		for (int i = 0; i < result.length && i < garden.length; i++) {
			if (garden[i]) result[i] = false;
		}
		return result;
	}

	/**
	 * Called in place of Plant.wither when fire reaches a plant. Leaves plants in a garden as they are.
	 */
	public static void burnPlant(Plant plant) {
		if (plant == null || noFire() && contains(plant.pos)) return;
		plant.wither();
	}

	/**
	 * Called at the start of Mob.getCloser. Returns true to stop an enemy outside a garden from heading into one.
	 */
	public static boolean staysOut(Object mob, int target) {
		if (!(mob instanceof Mob) || !noEnemies() || !isEnemy((Char) mob)) return false;
		return contains(target) && !contains(((Mob) mob).pos);
	}

	/**
	 * Called with the cell a new enemy would appear on. Returns -1, no cell this time, when it is in a garden.
	 */
	public static int respawnCell(int cell) {
		return noEnemies() && contains(cell) ? -1 : cell;
	}

	/**
	 * Called in place of ScrollOfTeleportation.appear in the golem's code, both when it teleports itself and when it pulls you to it. A golem
	 * doesn't teleport itself into a garden; pulling you out of one is left alone.
	 */
	public static void golemAppears(Char ch, int cell) {
		if (ch instanceof Mob && noEnemies() && contains(cell) && !contains(ch.pos)) return;
		com.shatteredpixel.shatteredpixeldungeon.items.scrolls.ScrollOfTeleportation.appear(ch, cell);
	}

	private static boolean isEnemy(Char ch) {
		return ch instanceof Mob && ch.alignment == Char.Alignment.ENEMY;
	}

	private static boolean contains(int cell) {
		boolean[] garden = cells();
		return garden != null && cell >= 0 && cell < garden.length && garden[cell];
	}

	/**
	 * Which cells of the current floor are inside a garden, worked out once per floor, or null when it has none.
	 */
	private static synchronized boolean[] cells() {
		Level level = Dungeon.level;
		if (level == null) return null;
		if (cachedLevel.get() == level) return cachedCells;
		cachedLevel = new WeakReference<>(level);
		cachedCells = gardenCells(level);
		return cachedCells;
	}

	@SuppressWarnings("unchecked")
	private static boolean[] gardenCells(Level level) {
		try {
			Object rooms = Reflect.get(level, "rooms");
			if (!(rooms instanceof List)) return null;
			boolean[] cells = null;
			int width = level.width();
			for (Object room : (List<Object>) rooms) {
				if (room == null || !isGarden(room)) continue;
				if (cells == null) cells = new boolean[level.length()];
				int left = Reflect.field(room.getClass(), "left").getInt(room);
				int top = Reflect.field(room.getClass(), "top").getInt(room);
				int right = Reflect.field(room.getClass(), "right").getInt(room);
				int bottom = Reflect.field(room.getClass(), "bottom").getInt(room);
				for (int y = top + 1; y < bottom; y++) {
					for (int x = left + 1; x < right; x++) cells[x + y * width] = true;
				}
			}
			return cells;
		} catch (Throwable e) {
			Log.e(TAG, "Could not find the gardens", e);
			return null;
		}
	}

	private static boolean isGarden(Object room) {
		String name = room.getClass().getSimpleName();
		for (String garden : GARDEN_ROOMS) {
			if (garden.equals(name)) return true;
		}
		return false;
	}
}
