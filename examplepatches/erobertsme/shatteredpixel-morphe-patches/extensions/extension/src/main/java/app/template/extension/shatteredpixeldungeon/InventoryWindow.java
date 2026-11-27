package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndGame;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoItem;
import com.shatteredpixel.shatteredpixeldungeon.items.potions.Potion;
import com.shatteredpixel.shatteredpixeldungeon.items.rings.Ring;
import com.shatteredpixel.shatteredpixeldungeon.items.scrolls.Scroll;
import com.shatteredpixel.shatteredpixeldungeon.items.scrolls.ScrollOfRemoveCurse;
import com.watabou.noosa.Game;

import java.util.ArrayList;
import java.util.List;

public class InventoryWindow extends EditorWindow {

	/**
	 * Replaced by the Inventory editor patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	public static void open() {
		Game.scene().addToFront(new InventoryWindow());
	}

	public InventoryWindow() {
		super();
		Hero hero = Dungeon.hero;

		addTitle("INVENTORY", "Changes apply straight away. Tap a number to type it, with Min and Max buttons.\n\n## Items\n_Open Backpack:_ your backpack in edit mode, with an Edit button on every item. Back returns here.\n{PREFS}The gear button in the backpack editor brings you back here too.\n_Add Item:_ any item in the game.\n\n## Identify and cleanse\n_Identify Carried Items:_ identifies everything you carry.\n_Identify All Types:_ Potions, Scrolls and Rings learn every type of that kind, so you know each color, rune or gem, even unfound ones.\n_Cleanse All:_ removes every curse from what you carry, including cursed enchantments and glyphs, like a Scroll of Remove Curse.\n\n## Space\n_Unlimited inventory space:_ every bag always has room for one more. Bags show up to 8 rows, with arrows for more pages.\nThe Equipment and Rings tabs are switched on in Extras, under QoL.");
		if (hero == null) {
			finishWithBack(() -> show(new WndGame()));
			return;
		}

		stepperIcon(Icons.get(Icons.COIN_SML));
		addStepper("Gold", String.valueOf(Dungeon.gold), Dungeon.gold, 10, 0, 999999, value -> Dungeon.gold = Math.max(0, value));
		stepperIcon(Icons.get(Icons.ENERGY_SML));
		addStepper("Energy", String.valueOf(Dungeon.energy), Dungeon.energy, 1, 0, 99999, value -> Dungeon.energy = Math.max(0, value));
		pos += GAP;

		addSection("Backpack");
		addButton("Open backpack", 0, WIDTH, () -> {
			hide();
			BackpackEditor.open(InventoryWindow::open, Dungeon.hero.belongings.backpack);
		});
		pos += ROW_HEIGHT + GAP;
		addCheckBox("Unlimited inventory space", InventorySpace.isOn(), () -> InventorySpace.setOn(!InventorySpace.isOn()), true, 6);

		addSection("Items");
		addButton("Add item", 0, WIDTH, () -> {
			hide();
			ItemPickerWindow.openFromInventory();
		});
		pos += ROW_HEIGHT + GAP;
		addButton("Identify carried items", 0, WIDTH, () -> {
			hero.belongings.identify();
			Item.updateQuickslot();
			refresh();
		});
		pos += ROW_HEIGHT + GAP;
		addButton("Cleanse all", 0, WIDTH, () -> {
			cleanseAll(hero);
			refresh();
		});
		pos += ROW_HEIGHT + GAP;

		addSection("Identify All Types");
		float third = (WIDTH - 2 * GAP) / 3f;
		addButton("Potions", 0, third, () -> identifyAll(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category.POTION)).enable(!allKnown(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category.POTION));
		addButton("Scrolls", third + GAP, third, () -> identifyAll(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category.SCROLL)).enable(!allKnown(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category.SCROLL));
		addButton("Rings", 2 * (third + GAP), third, () -> identifyAll(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category.RING)).enable(!allKnown(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category.RING));
		pos += ROW_HEIGHT + 2 * GAP;

		finishWithBack(() -> show(new WndGame()));
	}

	/**
	 * Learns every type in [category], so each potion color, scroll rune and ring gem shows what it is.
	 */
	private void identifyAll(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category category) {
		for (Item item : samples(category)) {
			try {
				if (item instanceof Potion) ((Potion) item).setKnown();
				if (item instanceof Scroll) ((Scroll) item).setKnown();
				if (item instanceof Ring) ((Ring) item).setKnown();
			} catch (Throwable ignored) {
			}
		}
		Item.updateQuickslot();
		refresh();
	}

	private static boolean allKnown(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category category) {
		for (Item item : samples(category)) {
			try {
				if (item instanceof Potion && !((Potion) item).isKnown()) return false;
				if (item instanceof Scroll && !item.isIdentified()) return false;
				if (item instanceof Ring && !item.isIdentified()) return false;
			} catch (Throwable ignored) {
			}
		}
		return true;
	}

	private static List<Item> samples(com.shatteredpixel.shatteredpixeldungeon.items.Generator.Category category) {
		List<Item> items = new ArrayList<>();
		Class<?>[] classes;
		try {
			classes = category.classes;
		} catch (Throwable e) {
			return items;
		}
		if (classes == null) return items;
		for (Class<?> type : classes) {
			try {
				Object item = type.getConstructor().newInstance();
				if (item instanceof Item) items.add((Item) item);
			} catch (Throwable ignored) {
			}
		}
		return items;
	}

	private static void cleanseAll(Hero hero) {
		List<Item> items = new ArrayList<>();
		for (Item item : hero.belongings) items.add(item);
		try {
			ScrollOfRemoveCurse.uncurse(hero, items.toArray(new Item[0]));
		} catch (Throwable e) {
			for (Item item : items) item.cursed = false;
		}
		Item.updateQuickslot();
	}

	static void showInfo(Item item) {
		try {
			show(new WndInfoItem(item));
		} catch (Throwable ignored) {
		}
	}

	@Override
	protected void reopen() {
		open();
	}
}
