package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.watabou.noosa.Image;

/**
 * A red button that shows its icon to the right of its label instead of the left.
 */
class IconRightButton extends RedButton {
	private final Runnable action;

	IconRightButton(String label, Runnable action) {
		super(TitleCase.of(label), 6);
		this.action = action;
	}

	@Override
	public void onClick() {
		action.run();
	}

	@Override
	public void layout() {
		super.layout();
		Image icon = icon();
		if (icon == null || text == null) return;
		float total = text.width() + 2 + icon.width();
		float left = left() + (width() - total) / 2f;
		text.setPos(left, text.top());
		PixelScene.align(text);
		icon.x = left + text.width() + 2;
		PixelScene.align(icon);
	}
}
