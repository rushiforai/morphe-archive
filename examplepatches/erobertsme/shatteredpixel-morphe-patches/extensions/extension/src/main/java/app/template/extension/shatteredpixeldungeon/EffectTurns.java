package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Adds how many turns an area effect has left to its description. Effects that fade by one each turn get an exact count. Gases that spread get the most
 * they can last, since spreading thins them out faster.
 */
@SuppressWarnings("unused")
public final class EffectTurns {

	private static final Set<String> EXACT = new HashSet<>(Arrays.asList("Fire", "Electricity", "Freezing", "GooWarn", "Web"));
	private static final Set<String> LASTING = new HashSet<>(Arrays.asList("Alchemy", "Foliage", "SacrificialFire", "WellWater", "WaterOfHealth",
		"WaterOfAwareness", "VaultFlameTraps"));

	private static int infoCell = -1;

	private EffectTurns() {
	}

	/**
	 * Called at the start of the tile info window, with the tile being described.
	 */
	public static void beforeCellInfo(int cell) {
		infoCell = cell;
	}

	/**
	 * Called with each effect description the tile info window shows. Returns the description with the turns left added.
	 */
	public static String describe(String desc) {
		if (desc == null || !QolSettings.isAvailable()) return desc;
		Level level = Dungeon.level;
		if (level == null || level.blobs == null || infoCell < 0 || infoCell >= level.length()) return desc;
		for (Blob blob : level.blobs.values()) {
			if (blob == null || blob.cur == null || blob.cur[infoCell] <= 0) continue;
			String own;
			try {
				own = blob.tileDesc();
			} catch (Throwable e) {
				continue;
			}
			if (desc.equals(own)) return withTurns(desc, blob, infoCell);
		}
		return desc;
	}

	/**
	 * [desc] followed by the turns [blob] has left on [cell], if it fades. A [cell] of -1 means the whole floor.
	 */
	static String withTurns(String desc, Blob blob, int cell) {
		String line = turnsLine(blob, cell);
		if (line == null) return desc;
		return (desc == null || desc.isEmpty() ? "" : desc + "\n\n") + line;
	}

	private static String turnsLine(Blob blob, int cell) {
		if (blob.cur == null || cell >= blob.cur.length || cell >= 0 && blob.cur[cell] <= 0) return null;
		String name = typeName(blob.getClass());
		if (LASTING.contains(name)) return null;
		if (EXACT.contains(name) && cell >= 0) return turns(blob.cur[cell]) + " remaining";
		int most = 0;
		for (int value : blob.cur) most = Math.max(most, value);
		if (most <= 0) return null;
		return "Up to " + turns(most) + " remaining";
	}

	private static String typeName(Class<?> type) {
		for (Class<?> current = type; current != null && current != Blob.class; current = current.getSuperclass()) {
			String name = current.getSimpleName();
			if (EXACT.contains(name) || LASTING.contains(name)) return name;
		}
		return type.getSimpleName();
	}

	private static String turns(int count) {
		return count + (count == 1 ? " turn" : " turns");
	}
}
