package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;

/**
 * The [i] button in the top right corner of the editor windows, which shows how the window works.
 */
final class InfoButton {

	static final int SIZE = 16;

	private InfoButton() {
	}

	static IconButton create(String text) {
		return new IconButton(Icons.get(Icons.INFO)) {
			@Override
			public void onClick() {
				InfoWindow.show(text);
			}
		};
	}

	static void add(Window window, float windowWidth, float y, String text) {
		IconButton button = create(text);
		button.setRect(windowWidth - SIZE, y, SIZE, SIZE);
		window.add(button);
	}
}
