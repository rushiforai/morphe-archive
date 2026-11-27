package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.armor.Armor;
import com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag;
import com.shatteredpixel.shatteredpixeldungeon.items.rings.Ring;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.melee.MeleeWeapon;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;

import java.util.ArrayList;
import java.util.List;

/**
 * A backpack tab that holds items of one kind, like the potion bandolier holds potions: equipment, which is armor and melee weapons
 * (not thrown weapons, bombs or the spirit bow), or rings. The items it holds stay in
 * the backpack's own list, so saves never contain this tab, but they are shown here instead of in the backpack and
 * don't use backpack space. It holds 19 items, or any number with unlimited inventory space.
 */
final class FilterBag extends Bag {

	static final int EQUIPMENT = 0;
	static final int RINGS = 1;

	private static final String[] NAMES = { "Equipment", "Rings" };
	private static final String[] KEYS = { "inv_tab_weapons_off", "inv_tab_rings_off" };
	private static final FilterBag[] TABS = new FilterBag[NAMES.length];

	private static final String PICKAXE = "com.shatteredpixel.shatteredpixeldungeon.items.quest.Pickaxe";

	private final int kind;

	private FilterBag(int kind) {
		this.kind = kind;
		this.image = icon(kind);
		this.items = new ArrayList<>();
	}

	static synchronized FilterBag get(int kind) {
		if (TABS[kind] == null) TABS[kind] = new FilterBag(kind);
		return TABS[kind];
	}

	int kind() {
		return kind;
	}

	static String label(int kind) {
		return NAMES[kind];
	}

	/**
	 * Whether the tab for [kind] is switched on in the settings.
	 */
	static boolean enabled(int kind) {
		return InventoryWindow.isAvailable() && !CloverlordSettings.get(KEYS[kind]);
	}

	/**
	 * Whether the tab for [kind] is in use: switched on, and bought if it has to be bought from a shop.
	 */
	static boolean isOn(int kind) {
		return enabled(kind) && (!TabPouches.soldInShops(kind) || TabPouches.owned(kind));
	}

	static void setOn(int kind, boolean on) {
		CloverlordSettings.set(KEYS[kind], !on);
	}

	static int count() {
		return NAMES.length;
	}

	private static int icon(int kind) {
		try {
			if (kind == EQUIPMENT) return ItemSpriteSheet.SWORD;
			return ItemSpriteSheet.RING_GARNET;
		} catch (Throwable e) {
			return 0;
		}
	}

	String key() {
		return "filter_" + kind;
	}

	static final int CAPACITY = 19;

	static int tabCapacity() {
		return InventorySpace.isOn() ? Integer.MAX_VALUE : CAPACITY + QolSettings.extraBagSlots();
	}

	/**
	 * Fills the tab with the items it holds.
	 */
	void refresh() {
		items = new ArrayList<>(held(kind));
	}

	/**
	 * The items the tab for [kind] holds: the first matching items in the backpack, up to its capacity. Matching
	 * items beyond that stay in the backpack.
	 */
	static List<Item> held(int kind) {
		List<Item> found = new ArrayList<>();
		if (!isOn(kind) || Dungeon.hero == null || Dungeon.hero.belongings == null) return found;
		Bag backpack = Dungeon.hero.belongings.backpack;
		if (backpack == null || backpack.items == null) return found;
		int capacity = tabCapacity();
		for (Item item : backpack.items) {
			if (found.size() >= capacity) break;
			if (!(item instanceof Bag) && accepts(kind, item)) found.add(item);
		}
		return found;
	}

	/**
	 * Every item held by any switched-on tab.
	 */
	static java.util.Set<Item> allHeld() {
		java.util.Set<Item> held = java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());
		for (int kind = 0; kind < NAMES.length; kind++) held.addAll(held(kind));
		return held;
	}

	/**
	 * The switched-on tab that [item] belongs in, or -1.
	 */
	static int kindOf(Item item) {
		for (int kind = 0; kind < NAMES.length; kind++) {
			if (isOn(kind) && accepts(kind, item)) return kind;
		}
		return -1;
	}

	static boolean anyOn() {
		for (int kind = 0; kind < NAMES.length; kind++) {
			if (isOn(kind)) return true;
		}
		return false;
	}

	private boolean accepts(Item item) {
		return accepts(kind, item);
	}

	private static boolean accepts(int kind, Item item) {
		if (kind == EQUIPMENT) return item instanceof Armor || item instanceof MeleeWeapon && !PICKAXE.equals(item.getClass().getName());
		return item instanceof Ring;
	}

	@Override
	public String name() {
		return NAMES[kind];
	}

	@Override
	public String desc() {
		String held = kind == EQUIPMENT ? "melee weapons and armor" : "rings";
		return "Holds the " + held + " you carry, so they don't take up space in your backpack.";
	}

	@Override
	public String info() {
		return desc();
	}

	@Override
	public int capacity() {
		return InventorySpace.filterCapacity(this);
	}
}
