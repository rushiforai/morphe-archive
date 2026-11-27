package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.ScrollPane;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Group;
import com.watabou.noosa.Image;
import com.watabou.noosa.ui.Component;

/**
 * Arrows and shading at the top and bottom edges of a scrolling area, shown while there is more to scroll to in that direction.
 */
final class ScrollHints {

	private static final int SHADE_HEIGHT = 6;
	private static final float SHADE_ALPHA = 0.35f;
	private static final float ARROW_SCALE = 0.75f;
	private static final int ARROW_COLOR = 0xDDDDDD;

	private ScrollHints() {
	}

	/**
	 * Adds the hints for [pane] to [owner], which must already contain the pane at its final size.
	 */
	static void add(Group owner, ScrollPane pane) {
		Component content = pane.content();
		ColorBlock topShade = shade(pane.left(), pane.top(), pane.width());
		ColorBlock bottomShade = shade(pane.left(), pane.bottom() - SHADE_HEIGHT, pane.width());
		Image up = arrow(false, pane.left() + pane.width() / 2f, pane.top() + 1);
		Image down = arrow(true, pane.left() + pane.width() / 2f, pane.bottom() - 1);
		Gizmo watcher = new Gizmo() {
			private float shownScroll = Float.NaN;

			@Override
			public void update() {
				super.update();
				float scroll = content.camera == null || content.camera.scroll == null ? 0 : content.camera.scroll.y;
				if (scroll == shownScroll) return;
				shownScroll = scroll;
				boolean more = scroll < content.height() - pane.height() - 1;
				boolean less = scroll > 1;
				down.visible = bottomShade.visible = more;
				up.visible = topShade.visible = less;
			}
		};
		owner.add(topShade);
		owner.add(bottomShade);
		owner.add(up);
		owner.add(down);
		owner.add(watcher);
		up.visible = topShade.visible = false;
	}

	private static ColorBlock shade(float x, float y, float width) {
		ColorBlock shade = new ColorBlock(width, SHADE_HEIGHT, 0xFF000000);
		shade.x = x;
		shade.y = y;
		shade.alpha(SHADE_ALPHA);
		return shade;
	}

	private static Image arrow(boolean down, float centerX, float edgeY) {
		Image image = Icons.get(Icons.CHEVRON);
		float width = image.width();
		float height = image.height();
		image.origin.set(width / 2f, height / 2f);
		image.scale.set(ARROW_SCALE, ARROW_SCALE);
		image.color(ARROW_COLOR);
		if (down) image.angle = 180;
		float shown = height * ARROW_SCALE;
		image.x = centerX - width / 2f;
		image.y = (down ? edgeY - shown : edgeY) - (height - shown) / 2f;
		return image;
	}
}
