package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.effects.FloatingText;

/**
 * Experience and loot rules for defeated creatures. Each creature type stops giving experience once your level is
 * above its limit, and stops dropping loot 2 levels after that. These rules can lift, raise or soften that limit,
 * or multiply what you get.
 */
@SuppressWarnings("unused")
public final class KillRewards {

	enum Kind {
		EXPERIENCE("qol_xp_", "Experience"),
		LOOT("qol_loot_", "Loot");

		final String prefix;
		final String title;

		Kind(String prefix, String title) {
			this.prefix = prefix;
			this.title = title;
		}
	}

	static final int NORMAL = 0;
	static final int NO_LIMIT = 1;
	static final int RAISE = 2;
	static final int REDUCED = 3;
	static final int MULTIPLY = 4;
	static final String[] MODES = { "Normal", "No level limit", "Raise the limit", "Reduced past the limit", "Multiplier" };

	static final int DEFAULT_RAISE = 5;
	static final int DEFAULT_REDUCED = 25;
	static final int DEFAULT_MULTIPLY = 200;
	private static final int LOOT_MARGIN = 2;
	private static final int POSITIVE_COLOR = 0x00FF00;

	private static Mob dyingMob;
	private static Mob rollingMob;
	private static int originalMaxLvl;

	private KillRewards() {
	}

	static int mode(Kind kind) {
		if (!QolSettings.isAvailable()) return NORMAL;
		int mode = CloverlordSettings.getInt(kind.prefix + "mode");
		return mode < NORMAL || mode > MULTIPLY ? NORMAL : mode;
	}

	static void mode(Kind kind, int mode) {
		CloverlordSettings.setInt(kind.prefix + "mode", mode);
	}

	static int raise(Kind kind) {
		int value = CloverlordSettings.getInt(kind.prefix + "raise");
		return value <= 0 ? DEFAULT_RAISE : value;
	}

	static void raise(Kind kind, int value) {
		CloverlordSettings.setInt(kind.prefix + "raise", Math.max(1, Math.min(30, value)));
	}

	static int reduced(Kind kind) {
		int value = CloverlordSettings.getInt(kind.prefix + "reduced");
		return value <= 0 ? DEFAULT_REDUCED : value;
	}

	static void reduced(Kind kind, int value) {
		CloverlordSettings.setInt(kind.prefix + "reduced", Math.max(5, Math.min(100, value)));
	}

	static int multiply(Kind kind) {
		int value = CloverlordSettings.getInt(kind.prefix + "multiply");
		return value <= 0 ? DEFAULT_MULTIPLY : value;
	}

	static void multiply(Kind kind, int value) {
		CloverlordSettings.setInt(kind.prefix + "multiply", Math.max(10, Math.min(1000, value)));
	}

	/**
	 * Called at the start of Mob.destroy, which awards experience for the kill.
	 */
	public static void beforeDestroy(Object mob) {
		dyingMob = mob instanceof Mob ? (Mob) mob : null;
	}

	/**
	 * Called at the end of Mob.destroy.
	 */
	public static void afterDestroy() {
		dyingMob = null;
	}

	/**
	 * Called at the start of Hero.earnExp. Returns the experience to award instead of [exp].
	 */
	public static int adjustExp(int exp, Class<?> source) {
		Mob mob = dyingMob;
		Hero hero = Dungeon.hero;
		if (mob == null || hero == null || source != mob.getClass()) return exp;
		int mode = mode(Kind.EXPERIENCE);
		if (mode == NORMAL || mob.maxLvl <= 0 || mob.EXP <= 0) return exp;
		int result;
		if (mode == MULTIPLY) {
			result = Math.round(exp * multiply(Kind.EXPERIENCE) / 100f);
		} else {
			int limit = mode == RAISE ? mob.maxLvl + raise(Kind.EXPERIENCE) : mob.maxLvl;
			if (mode == NO_LIMIT || hero.lvl <= limit) {
				result = mob.EXP;
			} else if (mode == REDUCED) {
				result = Math.max(1, Math.round(mob.EXP * reduced(Kind.EXPERIENCE) / 100f));
			} else {
				result = 0;
			}
			result = Math.max(result, exp);
		}
		if (exp == 0 && result > 0) showGain(hero, result);
		return result;
	}

	private static void showGain(Hero hero, int amount) {
		try {
			hero.sprite.showStatusWithIcon(POSITIVE_COLOR, Integer.toString(amount), FloatingText.EXPERIENCE);
		} catch (Throwable ignored) {
		}
	}

	/**
	 * Called at the start of Mob.rollToDropLoot. Moves the creature's level limit for this roll.
	 */
	public static void beforeLootRoll(Object mob) {
		rollingMob = null;
		if (!(mob instanceof Mob)) return;
		Mob target = (Mob) mob;
		int mode = mode(Kind.LOOT);
		if (mode == NORMAL || mode == MULTIPLY || target.maxLvl <= 0) return;
		rollingMob = target;
		originalMaxLvl = target.maxLvl;
		if (mode == RAISE) {
			target.maxLvl += raise(Kind.LOOT);
		} else {
			target.maxLvl = 1000;
		}
	}

	/**
	 * Called at the end of Mob.rollToDropLoot. Puts the level limit back.
	 */
	public static void afterLootRoll() {
		Mob target = rollingMob;
		rollingMob = null;
		if (target != null) target.maxLvl = originalMaxLvl;
	}

	/**
	 * Called when Mob.lootChance returns. Returns the drop chance to use instead of [chance].
	 */
	public static float adjustLootChance(float chance, Object mob) {
		int mode = mode(Kind.LOOT);
		if (mode == MULTIPLY) return chance * multiply(Kind.LOOT) / 100f;
		if (mode != REDUCED || mob != rollingMob || Dungeon.hero == null) return chance;
		if (Dungeon.hero.lvl <= originalMaxLvl + LOOT_MARGIN) return chance;
		return chance * reduced(Kind.LOOT) / 100f;
	}
}
