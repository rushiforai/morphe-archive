package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.FlavourBuff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Light;

/**
 * Improved torches: how long a torch burns, and while you are illuminated, a better chance to find hidden doors and traps when searching
 * and, if chosen, less stealth. The Illuminated status says what it does.
 */
public final class Torches {

	static final int DEFAULT_TURNS = (int) Light.DURATION;
	static final int TURNS_STEP = 25;
	static final int TURNS_HOLD_STEP = 100;
	static final int MAX_TURNS = 5000;
	static final int MAX_SEARCH = 500;
	static final int MAX_STEALTH = 20;

	private static final String KEY_TURNS = "qol_torch_turns";
	private static final String KEY_SEARCH = "qol_torch_search";
	private static final String KEY_STEALTH = "qol_torch_stealth";

	private Torches() {
	}

	/**
	 * How many turns a torch burns.
	 */
	static int turns() {
		int turns = QolSettings.isAvailable() ? CloverlordSettings.getInt(KEY_TURNS) : 0;
		return turns <= 0 ? DEFAULT_TURNS : turns;
	}

	static void turns(int turns) {
		CloverlordSettings.setInt(KEY_TURNS, Math.max(TURNS_STEP, Math.min(MAX_TURNS, turns)));
	}

	/**
	 * How much more likely searching is to find something while illuminated, in percent.
	 */
	static int searchBonus() {
		return QolSettings.isAvailable() ? CloverlordSettings.getInt(KEY_SEARCH) : 0;
	}

	static void searchBonus(int percent) {
		CloverlordSettings.setInt(KEY_SEARCH, Math.max(0, Math.min(MAX_SEARCH, percent)));
	}

	/**
	 * How much stealth you lose while illuminated.
	 */
	static int stealthPenalty() {
		return QolSettings.isAvailable() ? CloverlordSettings.getInt(KEY_STEALTH) : 0;
	}

	static void stealthPenalty(int penalty) {
		CloverlordSettings.setInt(KEY_STEALTH, Math.max(0, Math.min(MAX_STEALTH, penalty)));
	}

	private static boolean illuminated(Object character) {
		return character instanceof Char && ((Char) character).buff(Light.class) != null;
	}

	/**
	 * Called in place of Buff.affect when a torch is lit. Lights it for the chosen number of turns.
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static FlavourBuff light(Char hero, Class type, float duration) {
		return Buff.affect(hero, type, turns());
	}

	/**
	 * Called with how faded the Illuminated icon is. Measures the time left against how long a torch burns.
	 */
	public static float fade(float fade, Object light) {
		if (!(light instanceof Buff)) return fade;
		float turns = turns();
		return Math.max(0, Math.min(1, (turns - ((Buff) light).visualcooldown()) / turns));
	}

	/**
	 * Called with the roll for spotting a hidden door or trap while searching. Shrinking the roll raises the chance while illuminated.
	 */
	public static float adjustSearchRoll(float roll) {
		int bonus = searchBonus();
		if (bonus <= 0 || !illuminated(Dungeon.hero)) return roll;
		return roll / (1f + bonus / 100f);
	}

	/**
	 * Called when Char.stealth returns. Takes the torch's stealth penalty from the hero while illuminated.
	 */
	public static float adjustStealth(float value, Object character) {
		int penalty = stealthPenalty();
		if (penalty <= 0 || character != Dungeon.hero || !illuminated(character)) return value;
		return value - penalty;
	}

	/**
	 * Called when a timed status describes itself. Adds what being illuminated does for the hero: how much further they see, and any
	 * search bonus or stealth penalty.
	 */
	public static String describe(String description, Object buff) {
		if (!(buff instanceof Light) || ((Light) buff).target != Dungeon.hero || Dungeon.level == null) return description;
		StringBuilder text = new StringBuilder(description == null ? "" : description).append("\n");
		int extra = Light.DISTANCE - Dungeon.level.viewDistance;
		if (extra > 0) {
			text.append("\nYou see ").append(extra).append(extra == 1 ? " tile" : " tiles").append(" further.");
		} else {
			text.append("\nThis floor is already lit beyond a torch's ").append(Light.DISTANCE).append(" tiles, so you don't see any further.");
		}
		int search = searchBonus();
		if (search > 0) text.append("\nSearching is ").append(search).append("% more likely to find hidden doors and traps.");
		int stealth = stealthPenalty();
		if (stealth > 0) text.append("\nEnemies notice you more easily: stealth -").append(stealth).append(".");
		return text.toString();
	}
}
