package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.watabou.noosa.Game;
import com.shatteredpixel.shatteredpixeldungeon.items.armor.Armor;
import com.shatteredpixel.shatteredpixeldungeon.items.artifacts.Artifact;
import com.shatteredpixel.shatteredpixeldungeon.items.wands.Wand;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.Weapon;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;

public class ItemEditWindow extends EditorWindow {

	private static final String[] WEAPON_AUGMENTS = { "Speed", "None", "Damage" };
	private static final Weapon.Augment[] WEAPON_AUGMENT_VALUES = { Weapon.Augment.SPEED, Weapon.Augment.NONE, Weapon.Augment.DAMAGE };
	private static final String[] ARMOR_AUGMENTS = { "Evasion", "None", "Defense" };
	private static final Armor.Augment[] ARMOR_AUGMENT_VALUES = { Armor.Augment.EVASION, Armor.Augment.NONE, Armor.Augment.DEFENSE };

	private final Item item;

	public ItemEditWindow(Item item) {
		super();
		this.item = item;
		Hero hero = Dungeon.hero;

		InfoButton.add(this, WIDTH, pos, "Edit item\n\nChanges apply straight away. Tap a number to type it, with Min and Max buttons.\n\n## Type and tier\n_Change type:_ turns the item into another of its kind, like one sword into another or one potion into another, keeping its level, curse, enchantment and so on.\n_Tier:_ turns a weapon or armor into the same kind at another tier, keeping its level, curse, enchantment and so on: hand axe, mace, battle axe, war hammer; shortsword, sword, longsword, greatsword; leather, mail, scale, plate armor. Tiers its kind has nothing at are left out. Changing an equipped item doesn't use a turn.\n\n## Charges and magic\n_Infinite charges:_ keeps a wand or artifact fully charged, topped up every turn. Saved with the item.\n_Enchantment / Glyph:_ pick one for a weapon or armor. _Curses:_ pick a curse.\n_Augment:_ trades speed for damage on weapons, or evasion for defense on armor.\n\n## Special items\n_Water:_ how full a waterskin is.\n_Blessed:_ blesses an ankh, as if you used a full waterskin on it.\n_Alchemy:_ turns it into what alchemy would make: potions and scrolls into exotic versions and back, scrolls into runestones, seeds into potions.\n\n## Copy or remove\n_Duplicate:_ adds a copy to your backpack.\n_Delete:_ removes it for good, even if equipped or cursed.");
		float headerTop = pos;
		addListRow(InventoryEditor.titleOf(item), new ItemSprite(item), true, true, () -> InventoryWindow.showInfo(item), null);
		pos = Math.max(pos, headerTop + InfoButton.SIZE + GAP);

		if (InventoryEditor.isLevelEditable(item)) {
			int level = item.level();
			addStepper("Upgrade level", (level >= 0 ? "+" : "") + level, level, 1, -5, 99, value -> InventoryEditor.setLevel(item, Math.max(-5, Math.min(99, value))));
		}
		if (item.stackable) {
			addStepper("Quantity", String.valueOf(item.quantity()), item.quantity(), 1, 1, 9999, value -> item.quantity(Math.max(1, Math.min(9999, value))));
		}

		addCheckBox("Identified", item.isIdentified(), () -> InventoryEditor.setIdentified(item, !item.isIdentified()));
		addCheckBox("Cursed", item.cursed, () -> InventoryEditor.setCursed(item, !item.cursed));

		if (!InventoryEditor.typeChoices(item).isEmpty()) {
			addRowButton("Change type", null, () -> {
				hide();
				ItemPickerWindow.openToChangeType(item);
			});
		}

		if (ItemTier.supports(item)) {
			addSection("Tier");
			String[] tiers = new String[ItemTier.MAX - ItemTier.MIN + 1];
			for (int i = 0; i < tiers.length; i++) tiers[i] = ItemTier.at(item, ItemTier.MIN + i) == null ? "" : String.valueOf(ItemTier.MIN + i);
			addButtonRow(tiers, ItemTier.of(item) - ItemTier.MIN, index -> {
				Class<? extends Item> type = ItemTier.at(item, ItemTier.MIN + index);
				if (type == null || type == item.getClass()) return;
				Item changed = InventoryEditor.changeType(Dungeon.hero, item, type);
				hide();
				show(new ItemEditWindow(changed != null ? changed : item));
			});
		}

		if (item instanceof Weapon) {
			Weapon weapon = (Weapon) item;
			addSection("Weapon");
			addPickerRow("Enchantment", weapon.enchantment, false);
			addSection("Augment");
			addButtonRow(WEAPON_AUGMENTS, indexOf(WEAPON_AUGMENT_VALUES, weapon.augment), index -> {
				weapon.augment = WEAPON_AUGMENT_VALUES[index];
				Item.updateQuickslot();
				refresh();
			});
		}

		if (item instanceof Armor) {
			Armor armor = (Armor) item;
			addSection("Armor");
			addPickerRow("Glyph", armor.glyph, true);
			addSection("Augment");
			addButtonRow(ARMOR_AUGMENTS, indexOf(ARMOR_AUGMENT_VALUES, armor.augment), index -> {
				armor.augment = ARMOR_AUGMENT_VALUES[index];
				Item.updateQuickslot();
				refresh();
			});
		}

		if (item instanceof Wand) {
			Wand wand = (Wand) item;
			addStepper("Charges", wand.curCharges + " / " + wand.maxCharges, wand.curCharges, 1, 0, wand.maxCharges, value -> {
				wand.curCharges = Math.max(0, Math.min(wand.maxCharges, value));
				Item.updateQuickslot();
			});
		}

		if (item instanceof Artifact) {
			Artifact artifact = (Artifact) item;
			int charge = InventoryEditor.artifactValue(artifact, "charge");
			int cap = InventoryEditor.artifactChargeMax(artifact);
			if (cap > 0) addStepper("Charge", charge + " / " + cap, charge, 1, 0, cap, value -> InventoryEditor.setArtifactCharge(artifact, value));
		}

		if (InfiniteCharges.supports(item)) {
			addCheckBox("Infinite charges", InfiniteCharges.isOn(item), () -> InfiniteCharges.setOn(item, !InfiniteCharges.isOn(item)));
		}

		if (ItemAlchemy.isWaterskin(item)) {
			int water = ItemAlchemy.water(item);
			addStepper("Water", water + " / " + ItemAlchemy.WATERSKIN_MAX, water, 1, 0, ItemAlchemy.WATERSKIN_MAX, value -> ItemAlchemy.setWater(item, value));
		}

		if (ItemAlchemy.isAnkh(item)) {
			addCheckBox("Blessed", ItemAlchemy.isBlessed(item), () -> ItemAlchemy.setBlessed(item, !ItemAlchemy.isBlessed(item)));
		}

		java.util.List<Class<? extends Item>> conversions = ItemAlchemy.conversions(item);
		if (!conversions.isEmpty()) {
			addSection("Alchemy");
			for (Class<? extends Item> target : conversions) {
				addButton("Turn into " + ItemAlchemy.name(target), 0, WIDTH, () -> {
					ItemAlchemy.convert(hero, item, target);
					goBack();
				});
				pos += ROW_HEIGHT + GAP;
			}
		}

		pos += GAP;
		float third = (WIDTH - 2 * GAP) / 3f;
		addButton("Duplicate", 0, third, () -> {
			InventoryEditor.duplicate(hero, item);
			goBack();
		});
		addButton("Delete", third + GAP, third, () -> {
			InventoryEditor.delete(hero, item);
			goBack();
		}).icon(Icons.get(Icons.CLOSE));
		backTo(() -> backAction.run(BackpackEditor::open));
		addBackButton(2 * (third + GAP), third);
		pos += ROW_HEIGHT + GAP;

		finish();
	}

	private void addPickerRow(String label, Object current, boolean armor) {
		boolean curse = InventoryEditor.isCurse(current, armor);
		String text = (curse ? "Curse" : label) + ": " + InventoryEditor.shortEnchantmentName(current);
		addRowButton(text, null, () -> replaceWith(new EnchantPickerWindow(item, armor, curse, 0)));
	}

	private static <T> int indexOf(T[] values, T value) {
		for (int i = 0; i < values.length; i++) {
			if (values[i] == value) return i;
		}
		return -1;
	}

	private static final BackAction backAction = new BackAction();

	/**
	 * Opens the edit window for [item] from outside the backpack editor. Back runs [back], or just closes when it
	 * is null.
	 */
	static void openFrom(Item item, Runnable back) {
		backAction.set(back != null ? back : () -> {
		});
		Game.scene().addToFront(new ItemEditWindow(item));
	}

	@Override
	protected void reopen() {
		show(new ItemEditWindow(item));
	}
}
