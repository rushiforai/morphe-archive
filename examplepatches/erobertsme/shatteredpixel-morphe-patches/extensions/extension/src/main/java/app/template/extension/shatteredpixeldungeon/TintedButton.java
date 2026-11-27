package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Chrome;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.StyledButton;

/**
 * A grey game button tinted to a color, with white text so it stays readable.
 */
class TintedButton extends StyledButton {

	private final Runnable action;

	TintedButton(String label, Icons icon, float red, float green, float blue, Runnable action) {
		super(Chrome.Type.GREY_BUTTON, TitleCase.of(label));
		this.action = action;
		if (bg != null) bg.hardlight(red, green, blue);
		if (icon != null) icon(Icons.get(icon));
	}

	static TintedButton finish(String label, Runnable action) {
		return new TintedButton(label, Icons.CHECKED, 0.45f, 1f, 0.45f, action);
	}

	static TintedButton cancel(String label, Runnable action) {
		return new TintedButton(label, Icons.CLOSE, 1f, 0.4f, 0.4f, action);
	}

	@Override
	public void onClick() {
		action.run();
	}
}
