package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.items.Item;

/**
 * Energize more items: gives an energy value to items the game doesn't let you energize in alchemy.
 */
@SuppressWarnings("unused")
public final class EnergizeMore {

	private static final String KEY_OFF = "qol_energize_more_off";
	private static final String STYLUS_CLASS = "com.shatteredpixel.shatteredpixeldungeon.items.Stylus";
	private static final int STYLUS_ENERGY = 5;

	private EnergizeMore() {
	}

	static boolean isOn() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
	}

	/**
	 * Called when Item.energyVal returns. Returns the energy value to use instead of [value].
	 */
	public static int energyVal(int value, Object item) {
		if (value > 0 || !(item instanceof Item) || !isOn()) return value;
		Item target = (Item) item;
		if (target.getClass().getName().equals(STYLUS_CLASS)) return STYLUS_ENERGY * target.quantity();
		return value;
	}
}
