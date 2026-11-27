package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.items.Item;

import java.lang.reflect.Field;

/**
 * Lets the blacksmith reforge hero armor, the armor the dwarven crown turns yours into, with armor of the tier it was before.
 */
public final class HeroArmorReforge {

	private static final String KEY_OFF = "qol_hero_armor_reforge_off";
	private static final String ARMOR = "com.shatteredpixel.shatteredpixeldungeon.items.armor.";
	private static final String[] CARRIED = { "glyph", "glyphHardened", "augment", "cursed", "curseInfusionBonus", "masteryPotionBonus" };
	private static final String[] TIERS = { "ClothArmor", "LeatherArmor", "MailArmor", "ScaleArmor", "PlateArmor" };

	private HeroArmorReforge() {
	}

	static boolean isOn() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
	}

	/**
	 * Called at the start of the reforge button's click, with the button. The blacksmith keeps the item with more upgrades and consumes
	 * the other. When that would consume hero armor, the hero armor takes the kept armor's upgrades, glyph, augment and curse first, and
	 * becomes the one kept, so the result is always the hero armor.
	 */
	public static void beforeReforge(Object button) {
		if (!isOn()) return;
		try {
			Object window = Reflect.get(button, "this$0");
			Object first = Reflect.get(window, "btnItem1");
			Object second = Reflect.get(window, "btnItem2");
			Item one = (Item) Reflect.call(first, "item", new Class<?>[0]);
			Item two = (Item) Reflect.call(second, "item", new Class<?>[0]);
			if (one == null || two == null) return;
			boolean firstKept = one.trueLevel() >= two.trueLevel();
			Item kept = firstKept ? one : two;
			Item consumed = firstKept ? two : one;
			Class<?> heroArmor = Reflect.require(ARMOR + "ClassArmor");
			if (!heroArmor.isInstance(consumed) || heroArmor.isInstance(kept)) return;
			consumed.level(kept.trueLevel());
			for (String name : CARRIED) {
				Field field = Reflect.field(kept.getClass(), name);
				field.set(consumed, field.get(kept));
			}
			Reflect.call(first, "item", new Class<?>[] { Item.class }, consumed);
			Reflect.call(second, "item", new Class<?>[] { Item.class }, kept);
		} catch (Throwable e) {
			Log.e("HeroArmorReforge", "Could not keep the hero armor", e);
		}
	}

	/**
	 * Called in place of getClass when the reforge window checks that two items are the same kind. Hero armor counts as the armor of its
	 * tier.
	 */
	public static Class<?> kind(Object item) {
		Class<?> type = item.getClass();
		if (!isOn()) return type;
		try {
			if (!Reflect.require(ARMOR + "ClassArmor").isInstance(item)) return type;
			Field tier = Reflect.field(type, "tier");
			int index = tier.getInt(item) - 1;
			return index >= 0 && index < TIERS.length ? Reflect.require(ARMOR + TIERS[index]) : type;
		} catch (Throwable e) {
			return type;
		}
	}
}
