package app.template.extension.shatteredpixeldungeon;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Favorite items and statuses for the add pickers. Starts with commonly used ones until the player changes them.
 */
final class Favorites {

	private static final String PACKAGE = "com.shatteredpixel.shatteredpixeldungeon.";
	private static final String KEY_ITEMS = "favorite_items";
	private static final String KEY_STATUSES = "favorite_statuses";

	private static final String[] DEFAULT_ITEMS = {
		"items.potions.PotionOfHealing",
		"items.potions.PotionOfStrength",
		"items.potions.PotionOfExperience",
		"items.scrolls.ScrollOfUpgrade",
		"items.scrolls.ScrollOfIdentify",
		"items.scrolls.ScrollOfRemoveCurse",
		"items.scrolls.ScrollOfMagicMapping",
		"items.scrolls.ScrollOfTeleportation",
		"items.food.Food",
		"items.stones.StoneOfEnchantment",
		"items.stones.StoneOfAugmentation",
		"items.Ankh",
		"items.Honeypot",
		"items.Torch",
	};

	private static final String[] DEFAULT_STATUSES = {
		"actors.buffs.Haste",
		"actors.buffs.Invisibility",
		"actors.buffs.Levitation",
		"actors.buffs.MindVision",
		"actors.buffs.Bless",
		"actors.buffs.Barkskin",
		"actors.buffs.Barrier",
		"actors.buffs.Recharging",
		"actors.buffs.Healing",
		"actors.buffs.Adrenaline",
		"actors.buffs.ArcaneArmor",
		"actors.buffs.Light",
	};

	private static final String KEY_EFFECTS = "favorite_effects";
	private static final String KEY_TRAPS = "favorite_traps";
	private static final String[] DEFAULT_EFFECTS = { "ToxicGas", "CorrosiveGas", "ParalyticGas", "Fire", "Freezing", "Web" };
	private static final String[] DEFAULT_TRAPS = {
		"levels.traps.ChillingTrap", "levels.traps.BurningTrap", "levels.traps.ToxicTrap",
		"levels.traps.GrippingTrap", "levels.traps.TeleportationTrap", "levels.traps.ExplosiveTrap",
	};

	private static Set<String> items;
	private static Set<String> statuses;
	private static final String KEY_CREATURES = "favorite_creatures";
	private static final String[] DEFAULT_CREATURES = {
		"actors.mobs.Rat", "actors.mobs.Gnoll", "actors.mobs.Crab", "actors.mobs.Skeleton", "actors.mobs.Golem", "actors.mobs.Wraith",
	};

	private static Set<String> effects;
	private static Set<String> creatures;
	private static Set<String> traps;

	private Favorites() {
	}

	static boolean isItem(Class<?> type) {
		return items().contains(type.getName());
	}

	static void toggleItem(Class<?> type) {
		toggle(items(), type.getName(), KEY_ITEMS);
	}

	static boolean isStatus(Class<?> type) {
		return statuses().contains(type.getName());
	}

	static void toggleStatus(Class<?> type) {
		toggle(statuses(), type.getName(), KEY_STATUSES);
	}

	static boolean isEffect(String className) {
		return effects().contains(className);
	}

	static void toggleEffect(String className) {
		toggle(effects(), className, KEY_EFFECTS);
	}

	static boolean isTrap(String className) {
		return traps().contains(className);
	}

	static void toggleTrap(String className) {
		toggle(traps(), className, KEY_TRAPS);
	}

	static boolean isCreature(String className) {
		return creatures().contains(className);
	}

	static void toggleCreature(String className) {
		toggle(creatures(), className, KEY_CREATURES);
	}

	private static synchronized Set<String> creatures() {
		if (creatures == null) creatures = load(KEY_CREATURES, DEFAULT_CREATURES, PACKAGE);
		return creatures;
	}

	private static synchronized Set<String> effects() {
		if (effects == null) effects = load(KEY_EFFECTS, DEFAULT_EFFECTS, "");
		return effects;
	}

	private static synchronized Set<String> traps() {
		if (traps == null) traps = load(KEY_TRAPS, DEFAULT_TRAPS, PACKAGE);
		return traps;
	}

	private static synchronized Set<String> items() {
		if (items == null) items = load(KEY_ITEMS, DEFAULT_ITEMS, PACKAGE);
		return items;
	}

	private static synchronized Set<String> statuses() {
		if (statuses == null) statuses = load(KEY_STATUSES, DEFAULT_STATUSES, PACKAGE);
		return statuses;
	}

	private static Set<String> load(String key, String[] defaults, String prefix) {
		String stored = CloverlordSettings.getString(key);
		Set<String> result = new LinkedHashSet<>();
		if (stored == null) {
			for (String name : defaults) result.add(prefix + name);
			return result;
		}
		if (!stored.isEmpty()) result.addAll(Arrays.asList(stored.split(";")));
		return result;
	}

	private static void toggle(Set<String> set, String name, String key) {
		if (!set.remove(name)) set.add(name);
		CloverlordSettings.setString(key, String.join(";", set));
	}
}
