package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.ui.Window;

/**
 * The game's info windows for what you examine: a creature, a status, an item or pile on the floor, a plant, a trap or a tile. What the
 * window is about is noted when it starts, and once it is built every feature adds its buttons to it. Each patch that needs these windows
 * hooks the same two calls, and the window is still decorated only once however many patches are included.
 */
public final class InfoWindows {

	private static final String TAG = "InfoWindows";

	interface Decorator {
		void decorate(Window window, Object subject) throws Exception;
	}

	private static final Decorator[] DECORATORS = {
		EnhancedBestiary::decorateInfo,
		EnemyEditor::decorateInfo,
		BuffInfoActions::decorateInfo,
		FloorEditor::decorateInfo,
		TileInspect::decorateInfo,
	};

	private static Object pending;

	private InfoWindows() {
	}

	/**
	 * Called at the start of the constructor of an info window about [subject].
	 */
	public static void before(Object subject) {
		pending = subject;
	}

	/**
	 * Called at the start of the WndInfoCell constructor, about the tile [cell].
	 */
	public static void beforeCell(int cell) {
		pending = cell;
	}

	/**
	 * Called at the end of an info window's constructor. Lets every feature add its buttons.
	 */
	public static void after(Object window) {
		Object subject = pending;
		pending = null;
		if (subject == null || !(window instanceof Window)) return;
		for (Decorator decorator : DECORATORS) {
			try {
				decorator.decorate((Window) window, subject);
			} catch (Throwable e) {
				Log.e(TAG, "Could not add buttons to the info window", e);
			}
		}
	}
}
