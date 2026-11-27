package app.template.extension.shatteredpixeldungeon;

import com.watabou.input.PointerEvent;

/**
 * Keeps taps on the toolbar's area from reaching the dungeon. A tap that just misses a toolbar button would otherwise walk or attack.
 */
public final class ToolbarTaps {

	private ToolbarTaps() {
	}

	/**
	 * Called at the start of CellSelector.onClick. Returns true to ignore a tap from the top of the quickslot bar down. A tap that ends a
	 * drag of the map is left to the game, which uses it to finish the drag.
	 */
	public static boolean ignoreTap(Object selector, Object event) {
		if (!QolSettings.isAvailable() || !(event instanceof PointerEvent)) return false;
		try {
			if ((Boolean) Reflect.get(selector.getClass(), selector, "dragging")) return false;
			return ScreenLayout.toUi((PointerEvent) event).y >= ScreenLayout.toolbarTop();
		} catch (Throwable e) {
			return false;
		}
	}
}
