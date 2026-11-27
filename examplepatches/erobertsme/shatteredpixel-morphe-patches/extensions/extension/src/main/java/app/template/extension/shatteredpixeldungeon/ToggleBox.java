package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Chrome;
import com.shatteredpixel.shatteredpixeldungeon.ui.CheckBox;
import com.watabou.noosa.NinePatch;

/**
 * A check box that turns grey while it is unchecked.
 */
class ToggleBox extends CheckBox {
	private boolean red = true;

	ToggleBox(String label) {
		super(label);
		updateLook();
	}

	@Override
	public void checked(boolean value) {
		super.checked(value);
		updateLook();
	}

	private void updateLook() {
		boolean on = checked();
		if (on == red || bg == null) return;
		red = on;
		NinePatch old = bg;
		bg = Chrome.get(on ? Chrome.Type.RED_BUTTON : Chrome.Type.GREY_BUTTON);
		replace(old, bg);
		layout();
	}
}
