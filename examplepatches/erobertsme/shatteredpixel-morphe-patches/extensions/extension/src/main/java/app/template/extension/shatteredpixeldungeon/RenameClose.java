package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;

/**
 * A close button in the top right corner of the rename hero window, which otherwise only offers Rename and Revert.
 */
@SuppressWarnings("unused")
public final class RenameClose {

	private static final int SIZE = 16;

	private RenameClose() {
	}

	/**
	 * Called at the end of the rename hero window's constructor.
	 */
	public static void afterRenameWindow(Object window) {
		if (!QolSettings.isAvailable() || !(window instanceof Window)) return;
		try {
			Window target = (Window) window;
			int width = Reflect.width(target);
			IconButton close = new IconButton(Icons.get(Icons.CLOSE)) {
				@Override
				public void onClick() {
					target.hide();
				}
			};
			close.setRect(width - SIZE, 0, SIZE, SIZE);
			target.add(close);
		} catch (Throwable e) {
			Log.e("RenameClose", "Could not add the close button", e);
		}
	}
}
