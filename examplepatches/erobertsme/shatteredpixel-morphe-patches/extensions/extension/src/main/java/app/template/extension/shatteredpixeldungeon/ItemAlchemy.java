package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Alchemy style conversions for single items, read from the game's own recipe tables, plus the waterskin and ankh.
 */
final class ItemAlchemy {

	private static final String TAG = "ItemAlchemy";
	private static final String ITEMS = "com.shatteredpixel.shatteredpixeldungeon.items.";
	static final int WATERSKIN_MAX = 20;

	private static final Map<Class<?>, String> names = new HashMap<>();

	private ItemAlchemy() {
	}

	@SuppressWarnings("unchecked")
	static List<Class<? extends Item>> conversions(Item item) {
		List<Class<? extends Item>> result = new ArrayList<>();
		Class<?> type = item.getClass();
		addFrom(result, type, "potions.exotic.ExoticPotion", "regToExo");
		addFrom(result, type, "potions.exotic.ExoticPotion", "exoToReg");
		addFrom(result, type, "scrolls.exotic.ExoticScroll", "regToExo");
		addFrom(result, type, "scrolls.exotic.ExoticScroll", "exoToReg");
		addFrom(result, type, "scrolls.Scroll$ScrollToStone", "stones");
		addFrom(result, type, "potions.Potion$SeedToPotion", "types");
		return result;
	}

	@SuppressWarnings("unchecked")
	private static void addFrom(List<Class<? extends Item>> result, Class<?> type, String owner, String field) {
		try {
			Field f = Reflect.field(Reflect.require(ITEMS + owner), field);
			Map<Class<?>, Class<?>> map = (Map<Class<?>, Class<?>>) f.get(null);
			Class<?> target = map == null ? null : map.get(type);
			if (target != null && !result.contains(target)) result.add((Class<? extends Item>) target);
		} catch (Throwable ignored) {
		}
	}

	/**
	 * The name of items of [type], read from the game once.
	 */
	static synchronized String name(Class<? extends Item> type) {
		String cached = names.get(type);
		if (cached != null) return cached;
		String name;
		try {
			name = InventoryEditor.capitalize(type.getConstructor().newInstance().trueName());
		} catch (Throwable e) {
			name = type.getSimpleName();
		}
		names.put(type, name);
		return name;
	}

	/**
	 * Replaces [item] with the same number of [target], identified.
	 */
	static Item convert(Hero hero, Item item, Class<? extends Item> target) {
		try {
			Item result = target.getConstructor().newInstance();
			if (result.stackable) result.quantity(item.quantity());
			result.identify();
			InventoryEditor.replace(hero, item, result);
			return result;
		} catch (Throwable e) {
			Log.e(TAG, "Could not convert " + item.getClass().getName(), e);
			return null;
		}
	}

	static boolean isWaterskin(Item item) {
		return item.getClass().getName().equals(ITEMS + "Waterskin");
	}

	static boolean isAnkh(Item item) {
		return item.getClass().getName().equals(ITEMS + "Ankh");
	}

	static int water(Item waterskin) {
		return readInt(waterskin, "volume");
	}

	static void setWater(Item waterskin, int value) {
		writeField(waterskin, "volume", Math.max(0, Math.min(WATERSKIN_MAX, value)));
	}

	static boolean isBlessed(Item ankh) {
		try {
			Field f = Reflect.field(ankh.getClass(), "blessed");
			return f.getBoolean(ankh);
		} catch (Throwable e) {
			return false;
		}
	}

	static void setBlessed(Item ankh, boolean blessed) {
		writeField(ankh, "blessed", blessed);
	}

	private static int readInt(Object target, String name) {
		try {
			Field f = Reflect.field(target.getClass(), name);
			return f.getInt(target);
		} catch (Throwable e) {
			return 0;
		}
	}

	private static void writeField(Object target, String name, Object value) {
		try {
			Field f = Reflect.field(target.getClass(), name);
			f.set(target, value);
			Item.updateQuickslot();
		} catch (Throwable e) {
			Log.e(TAG, "Could not set " + name, e);
		}
	}
}
