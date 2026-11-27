package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.items.Item;

/**
 * Weapons and armor that are the same kind of item at each tier, like the hand axe, mace, battle axe and war hammer. Changing an item's
 * tier changes it into its kind's item of that tier. A kind with no item at a tier leaves that tier out.
 */
final class ItemTier {

	static final int MIN = 1;
	static final int MAX = 5;

	private static final String MELEE = "com.shatteredpixel.shatteredpixeldungeon.items.weapon.melee.";
	private static final String ARMOR = "com.shatteredpixel.shatteredpixeldungeon.items.armor.";

	/**
	 * Each kind's items from tier 1 to 5, with null where the kind has none.
	 */
	private static final String[][] KINDS = {
		{ MELEE + "WornShortsword", MELEE + "Shortsword", MELEE + "Sword", MELEE + "Longsword", MELEE + "Greatsword" },
		{ MELEE + "Cudgel", MELEE + "HandAxe", MELEE + "Mace", MELEE + "BattleAxe", MELEE + "WarHammer" },
		{ MELEE + "Dagger", MELEE + "Dirk", null, MELEE + "AssassinsBlade", null },
		{ MELEE + "Gloves", null, MELEE + "Sai", null, MELEE + "Gauntlet" },
		{ null, MELEE + "Quarterstaff", MELEE + "RoundShield", null, MELEE + "Greatshield" },
		{ null, MELEE + "Spear", null, null, MELEE + "Glaive" },
		{ null, MELEE + "Sickle", null, null, MELEE + "WarScythe" },
		{ ARMOR + "ClothArmor", ARMOR + "LeatherArmor", ARMOR + "MailArmor", ARMOR + "ScaleArmor", ARMOR + "PlateArmor" },
	};

	private ItemTier() {
	}

	private static String[] kindOf(Item item) {
		String name = item.getClass().getName();
		for (String[] kind : KINDS) {
			for (String member : kind) {
				if (name.equals(member)) return kind;
			}
		}
		return null;
	}

	/**
	 * Whether [item] has items of its kind at other tiers.
	 */
	static boolean supports(Item item) {
		return kindOf(item) != null;
	}

	/**
	 * The tier of [item] within its kind, or 0 for an item without a kind.
	 */
	static int of(Item item) {
		String[] kind = kindOf(item);
		if (kind == null) return 0;
		String name = item.getClass().getName();
		for (int i = 0; i < kind.length; i++) {
			if (name.equals(kind[i])) return MIN + i;
		}
		return 0;
	}

	/**
	 * The class of [item]'s kind at [tier], or null when the kind has none there.
	 */
	@SuppressWarnings("unchecked")
	static Class<? extends Item> at(Item item, int tier) {
		String[] kind = kindOf(item);
		if (kind == null || tier < MIN || tier > MAX || kind[tier - MIN] == null) return null;
		try {
			return (Class<? extends Item>) Reflect.require(kind[tier - MIN]);
		} catch (ClassNotFoundException e) {
			return null;
		}
	}
}
