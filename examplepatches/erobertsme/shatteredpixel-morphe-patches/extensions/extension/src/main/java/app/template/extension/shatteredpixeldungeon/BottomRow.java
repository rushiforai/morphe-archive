package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * A row of buttons added below the content of a game window. Buttons added by different patches share the row.
 */
final class BottomRow {

	private static final int GAP = 2;
	private static final int BUTTON_HEIGHT = 16;
	private static final Map<Window, RedButton[]> rows = Collections.synchronizedMap(new WeakHashMap<>());

	private BottomRow() {
	}

	static void add(Window window, RedButton button) throws ReflectiveOperationException {
		int width = Reflect.width(window);
		int height = Reflect.height(window);

		RedButton[] existing = rows.get(window);
		window.add(button);
		if (existing == null) {
			button.setRect(0, height + GAP, width, BUTTON_HEIGHT);
			rows.put(window, new RedButton[] { button });
			window.resize(width, height + GAP + BUTTON_HEIGHT);
			return;
		}
		RedButton[] row = new RedButton[existing.length + 1];
		System.arraycopy(existing, 0, row, 0, existing.length);
		row[existing.length] = button;
		float top = existing[0].top();
		float each = (width - (row.length - 1) * GAP) / (float) row.length;
		for (int i = 0; i < row.length; i++) row[i].setRect(i * (each + GAP), top, each, BUTTON_HEIGHT);
		rows.put(window, row);
	}
}
