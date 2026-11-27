package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndBag;

import java.lang.reflect.Field;

/**
 * An Empty Quickslot button at the bottom of the backpack when it is opened to choose an item for a quickslot. It
 * also closes the backpack, so it works as a way out after tapping an empty quickslot by mistake.
 */
@SuppressWarnings("unused")
public final class QuickslotEmpty {

	private static final String TAG = "QuickslotEmpty";
	private static final String BUTTON_CLASS = "com.shatteredpixel.shatteredpixeldungeon.ui.QuickSlotButton";

	private QuickslotEmpty() {
	}

	/**
	 * Called at the end of the WndBag constructor.
	 */
	public static void afterBagCreated(Object window) {
		if (!QolSettings.isAvailable() || !(window instanceof WndBag)) return;
		try {
			Object selector = Reflect.bagSelector(window);
			if (selector == null) return;
			int slot = quickslotFor(selector);
			if (slot < 0) return;
			RedButton empty = new RedButton("Empty Quickslot", 7) {
				@Override
				public void onClick() {
					((Window) window).hide();
					Dungeon.quickslot.clearSlot(slot);
					Item.updateQuickslot();
				}
			};
			empty.icon(Icons.get(Icons.CLOSE));
			BottomRow.add((Window) window, empty);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the Empty Quickslot button", e);
		}
	}

	private static int quickslotFor(Object selector) throws ReflectiveOperationException {
		Class<?> buttonClass = Reflect.require(BUTTON_CLASS);
		Field instanceField = Reflect.field(buttonClass, "instance");
		Field selectorField = Reflect.field(buttonClass, "itemSelector");
		Field slotField = Reflect.field(buttonClass, "slotNum");
		Object[] buttons = (Object[]) instanceField.get(null);
		if (buttons == null) return -1;
		for (Object button : buttons) {
			if (button != null && selectorField.get(button) == selector) return slotField.getInt(button);
		}
		return -1;
	}
}
