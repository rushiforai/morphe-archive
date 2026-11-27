package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.abilities.ArmorAbility;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroSubClass;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

final class TalentEditor {

	private TalentEditor() {
	}

	static boolean canSwap(int tier) {
		return tier >= 1 && tier <= 3;
	}

	static void addPoint(Hero hero, int tier, Talent talent) {
		int points = hero.pointsInTalent(talent);
		if (points >= talent.maxPoints()) return;
		if (hero.talentPointsAvailable(tier) <= 0) return;
		hero.upgradeTalent(talent);
	}

	static void removePoint(Hero hero, int tier, Talent talent) {
		LinkedHashMap<Talent, Integer> talents = hero.talents.get(tier - 1);
		Integer points = talents.get(talent);
		if (points == null || points <= 0) return;
		talents.put(talent, points - 1);
	}

	static boolean isOwned(Hero hero, int tier, Talent talent) {
		return hero.talents.get(tier - 1).containsKey(talent);
	}

	static List<Talent> swapOptions(Hero hero, int tier, HeroClass heroClass) {
		List<Talent> options = new ArrayList<>();
		if (!canSwap(tier)) return options;

		ArrayList<LinkedHashMap<Talent, Integer>> classTalents = new ArrayList<>();
		Talent.initClassTalents(heroClass, classTalents);
		if (classTalents.size() < tier) return options;

		options.addAll(classTalents.get(tier - 1).keySet());
		return options;
	}

	static void swap(Hero hero, int tier, Talent replacing, Talent replacement) {
		LinkedHashMap<Talent, Integer> current = hero.talents.get(tier - 1);
		if (!current.containsKey(replacing) || current.containsKey(replacement)) return;

		LinkedHashMap<Talent, Integer> updated = new LinkedHashMap<>();
		for (Map.Entry<Talent, Integer> entry : current.entrySet()) {
			Talent key = entry.getKey() == replacing ? replacement : entry.getKey();
			updated.put(key, entry.getValue());
		}

		LinkedHashMap<Talent, Talent> metamorphed = hero.metamorphedTalents;
		if (!metamorphed.containsValue(replacing)) {
			metamorphed.put(replacing, replacement);
		} else if (metamorphed.get(replacement) == replacing) {
			metamorphed.remove(replacement);
		} else {
			for (Talent original : new ArrayList<>(metamorphed.keySet())) {
				if (metamorphed.get(original) == replacing) metamorphed.put(original, replacement);
			}
		}

		hero.talents.set(tier - 1, updated);
		if (hero.hasTalent(replacement)) Talent.onTalentUpgraded(hero, replacement);
	}

	/**
	 * Changes the hero's subclass. The old subclass's talents and the points in them go away, and the new
	 * subclass's talents are added to tier 3.
	 */
	static void setSubclass(Hero hero, HeroSubClass subclass) {
		if (hero.subClass == subclass) return;
		if (hero.subClass != null && hero.subClass != HeroSubClass.NONE && hero.talents.size() > 2) {
			ArrayList<LinkedHashMap<Talent, Integer>> old = new ArrayList<>();
			Talent.initSubclassTalents(hero.subClass, old);
			if (old.size() > 2) {
				for (Talent talent : old.get(2).keySet()) hero.talents.get(2).remove(talent);
			}
		}
		hero.subClass = subclass;
		Talent.initSubclassTalents(hero);
		Item.updateQuickslot();
	}

	/**
	 * Changes the hero's armor ability. The old ability's talents and the points in them go away, and the new
	 * ability's talents are added to tier 4.
	 */
	static void setArmorAbility(Hero hero, ArmorAbility ability) {
		if (hero.armorAbility == ability) return;
		if (hero.armorAbility != null && hero.talents.size() > 3) {
			for (Talent talent : hero.armorAbility.talents()) hero.talents.get(3).remove(talent);
		}
		hero.armorAbility = ability;
		Talent.initArmorTalents(hero);
		Item.updateQuickslot();
	}
}
