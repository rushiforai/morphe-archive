package app.template.extension.shatteredpixeldungeon;

import java.util.List;
import java.util.ArrayList;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;
import com.shatteredpixel.shatteredpixeldungeon.items.rings.Ring;

/**
 * The effective values of the senses, ring levels and resistances, worked out the way the game does, for the stats screens.
 */
final class ExtraStats {

	private static final float FARSIGHT_PER_POINT = 0.25f;
	private static final int FORESIGHT_RANGE = 8;
	private static final String EYE_OF_NEWT = "com.shatteredpixel.shatteredpixeldungeon.items.trinkets.EyeOfNewt";
	private static final String FORESIGHT = "com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Foresight";

	private ExtraStats() {
	}

	/**
	 * How many tiles [character] sees, with talents, trinkets and the Vision modifier.
	 */
	static int vision(Char character) {
		float distance = character.viewDistance;
		if (character instanceof Hero) {
			Hero hero = (Hero) character;
			distance *= 1f + FARSIGHT_PER_POINT * talentPoints(hero, "FARSIGHT");
			distance *= eyeOfNewt();
		}
		return Math.round(HeroExtras.adjustViewDistance(character, distance));
	}

	/**
	 * How many tiles around the hero are searched for hidden doors and traps.
	 */
	static int searchRange(Hero hero) {
		int distance = hero.heroClass == HeroClass.valueOf("ROGUE") ? 2 : 1;
		if (talentPoints(hero, "WIDE_SEARCH") > 0) distance++;
		if (hasBuff(hero, FORESIGHT)) distance = FORESIGHT_RANGE;
		return HeroExtras.adjustSearchDistance(distance);
	}

	/**
	 * How hard [character] is to notice, counted in tiles of extra distance.
	 */
	static float stealth(Char character) {
		try {
			return character.stealth();
		} catch (Throwable e) {
			return 0;
		}
	}

	/**
	 * The level [character] gets from rings of [mod]'s kind, worn or added by the modifier.
	 */
	static int ringLevel(Char character, HeroExtras.Mod mod) {
		if (mod.ring == null) return 0;
		try {
			return Ring.getBuffedBonus(character, Reflect.require(mod.ring));
		} catch (Throwable e) {
			return 0;
		}
	}

	/**
	 * How much less [character] is affected by [element] as a whole percentage, or null when it is immune.
	 */
	static Integer resistancePercent(Char character, HeroExtras.Element element) {
		Class<?> effect = element.primary();
		if (effect == null) return 0;
		try {
			if (character.isImmune(effect)) return null;
			return Math.round((1f - character.resist(effect)) * 100f);
		} catch (Throwable e) {
			return 0;
		}
	}

	private static int talentPoints(Hero hero, String talent) {
		try {
			return hero.pointsInTalent(Talent.valueOf(talent));
		} catch (Throwable e) {
			return 0;
		}
	}

	private static float eyeOfNewt() {
		try {
			return (Float) Reflect.callStatic(Reflect.require(EYE_OF_NEWT), "visionRangeMultiplier", new Class<?>[0]);
		} catch (Throwable e) {
			return 1f;
		}
	}

	private static boolean hasBuff(Char character, String className) {
		Class<?> type = Reflect.type(className);
		if (type == null) return false;
		for (Buff buff : character.buffs()) {
			if (type.isInstance(buff)) return true;
		}
		return false;
	}

	/**
	 * Adds a Resistances section to [window] listing each element [character] is immune to, resists or is weak to, or None.
	 */
	static void addResistances(EditorWindow window, Char character) {
		window.addSection("Resistances");
		List<CharacterWindow.HeroStat> rows = resistances(character);
		for (CharacterWindow.HeroStat row : rows) window.addIconRow(row.icon, row.label, row.value);
		if (rows.isEmpty()) window.addHint("None");
	}

	/**
	 * Each element [character] is immune to, resists or is weak to.
	 */
	static List<CharacterWindow.HeroStat> resistances(Char character) {
		List<CharacterWindow.HeroStat> rows = new ArrayList<>();
		for (HeroExtras.Element element : HeroExtras.Element.values()) {
			Integer percent = resistancePercent(character, element);
			if (percent != null && percent == 0) continue;
			String value = percent == null ? "Immune" : percent > 0 ? percent + "% less" : -percent + "% more";
			rows.add(new CharacterWindow.HeroStat(StatIcons.buff(element.icon), element.label, value));
		}
		return rows;
	}
}
