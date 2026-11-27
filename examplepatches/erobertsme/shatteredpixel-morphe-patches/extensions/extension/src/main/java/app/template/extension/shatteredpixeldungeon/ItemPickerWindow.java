package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;

import java.util.List;

public class ItemPickerWindow extends EditorWindow {

	private static int level = 0;
	private static int quantity = 1;
	private static boolean returnToBackpack;
	private static int dropCell = -1;
	private static boolean keepTrapActive = true;

	private static Item changing;

	private final InventoryEditor.Category category;
	private final int page;

	/**
	 * Opens the picker to change the type of [item] to another item of its kind.
	 */
	static void openToChangeType(Item item) {
		changing = item;
		show(new ItemPickerWindow(InventoryEditor.Category.FAVORITES, 0));
	}

	public ItemPickerWindow(InventoryEditor.Category category, int page) {
		super();
		this.category = category;
		this.page = page;
		Hero hero = Dungeon.hero;
		if (changing != null) {
			addTypeChoices(hero, changing);
			return;
		}

		addTitle(dropCell >= 0 ? "Place item" : "Add item", (dropCell >= 0 ? "Items are placed on the chosen tile. " : "") + "Tap an item to add it to your backpack, identified. If your backpack is full it drops at your feet.\n\n_Level:_ for upgradable items and trinkets.\n_Quantity:_ for stackable items.\n\n{HEART}The heart adds an item to Favorites.\n\n{INFO}Tap i or long-press to read one.");

		InventoryEditor.Category[] categories = InventoryEditor.Category.values();
		int perRow = perPage(3, 5);
		for (int start = 0; start < categories.length; start += perRow) {
			int count = Math.min(perRow, categories.length - start);
			String[] labels = new String[perRow];
			for (int i = 0; i < perRow; i++) labels[i] = i < count ? categories[start + i].label : "";
			int selected = category.ordinal() - start;
			int offset = start;
			addButtonRow(labels, selected, index -> {
				if (offset + index >= categories.length) return;
				replaceWith(new ItemPickerWindow(categories[offset + index], 0));
			});
		}

		addStepper("Level", (level >= 0 ? "+" : "") + level, level, 1, -5, 99, value -> level = Math.max(-5, Math.min(99, value)));
		addStepper("Quantity", String.valueOf(quantity), quantity, 1, 1, 9999, value -> quantity = Math.max(1, Math.min(9999, value)));

		pos += GAP;
		List<InventoryEditor.Entry> entries = InventoryEditor.catalog(category);
		if (entries.isEmpty()) addHint("No favorites yet. Tap the heart next to an item to add it here.");
		addPagedList(entries.size(), perPage(6, 3), page, index -> {
			InventoryEditor.Entry entry = entries.get(index);
			Item sample = sample(entry);
			addListRow(entry.label(), sample == null ? null : new ItemSprite(sample), false, true, () -> {
				InventoryEditor.add(hero, entry.type, level, quantity, dropCell);
				refresh();
			}, sample == null ? null : () -> InventoryWindow.showInfo(sample), new Favorite() {
				@Override
				public boolean isFavorite() {
					return Favorites.isItem(entry.type);
				}

				@Override
				public void toggle() {
					Favorites.toggleItem(entry.type);
				}
			});
		}, newPage -> replaceWith(new ItemPickerWindow(category, newPage)));

		finishWithBack(this::back);
	}

	/**
	 * The items [item] can change into. Tapping one changes it, keeping what it can of the item, and goes back to editing it.
	 */
	private void addTypeChoices(Hero hero, Item item) {
		addTitle("Change type", "Change type\n\nTap an item of the same kind to turn this one into it. It keeps its level, curse, identification, enchantment or glyph, augment, charges and quantity where the new item has them, and stays where it was: equipped, in its bag or quickslot, or on the floor.\n\n{INFO}Tap i or long-press to read one.");
		addListRow(InventoryEditor.titleOf(item), new ItemSprite(item), true, true, () -> InventoryWindow.showInfo(item), null);
		pos += GAP;
		List<InventoryEditor.Entry> entries = InventoryEditor.typeChoices(item);
		if (entries.isEmpty()) addHint("Nothing else of this kind.");
		addPagedList(entries.size(), perPage(5, 3), page, index -> {
			InventoryEditor.Entry entry = entries.get(index);
			Item sample = sample(entry);
			listRowHeight(2 * ROW_HEIGHT);
			addListRow(entry.name, sample == null ? null : new ItemSprite(sample), false, true, () -> {
				changing = null;
				Item changed = InventoryEditor.changeType(hero, item, entry.type);
				hide();
				show(new ItemEditWindow(changed != null ? changed : item));
			}, sample == null ? null : () -> InventoryWindow.showInfo(sample));
		}, newPage -> replaceWith(new ItemPickerWindow(category, newPage)));
		finishWithBack(() -> {
			changing = null;
			show(new ItemEditWindow(item));
		});
	}

	/**
	 * Opens the picker to place items on [cell] instead of in the backpack.
	 */
	static void openForCell(int cell) {
		dropCell = cell;
		returnToBackpack = false;
		keepTrapActive = true;
		com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap trap = FloorEditor.trapAt(cell);
		if (trap == null || !trap.active) {
			show(new ItemPickerWindow(InventoryEditor.Category.FAVORITES, 0));
			return;
		}
		ConfirmPrompt.askAboutTile(cell, "Place item", "There is an active " + FloorEditor.trapName(trap).toLowerCase() + " on this tile. Items you place here won't set it off.",
			new String[] { "Keep Trap Active", "Deactivate Trap" },
			new Runnable[] { () -> openPicker(true), () -> openPicker(false) },
			null);
	}

	private static void openPicker(boolean keep) {
		keepTrapActive = keep;
		show(new ItemPickerWindow(InventoryEditor.Category.FAVORITES, 0));
	}

	static boolean keepTrapActive() {
		return keepTrapActive;
	}

	public static void openFromBackpack() {
		dropCell = -1;
		returnToBackpack = true;
		show(new ItemPickerWindow(InventoryEditor.Category.FAVORITES, 0));
	}

	public static void openFromInventory() {
		dropCell = -1;
		returnToBackpack = false;
		show(new ItemPickerWindow(InventoryEditor.Category.FAVORITES, 0));
	}

	private void back() {
		if (dropCell >= 0) {
			int cell = dropCell;
			dropCell = -1;
			TileWindow.open(cell);
		} else if (returnToBackpack) {
			BackpackEditor.open();
		} else {
			InventoryWindow.open();
		}
	}

	private static Item sample(InventoryEditor.Entry entry) {
		try {
			return entry.type.getConstructor().newInstance();
		} catch (Throwable e) {
			return null;
		}
	}

	@Override
	protected void reopen() {
		show(new ItemPickerWindow(category, page));
	}
}
