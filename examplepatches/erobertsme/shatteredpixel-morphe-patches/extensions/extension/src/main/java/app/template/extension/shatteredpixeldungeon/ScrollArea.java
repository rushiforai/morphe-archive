package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.ui.ScrollPane;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Group;
import com.watabou.noosa.Visual;
import com.watabou.noosa.audio.Sample;
import com.shatteredpixel.shatteredpixeldungeon.ui.Button;
import com.watabou.noosa.ui.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Lets the lower part of a window scroll when it is taller than the screen allows, with hints at its edges while there is more to see.
 * Taps in it still reach the buttons in it.
 */
final class ScrollArea {

	private static final String TAG = "ScrollArea";
	private static final String CLICK_SOUND = "sounds/click.mp3";

	private ScrollArea() {
	}

	/**
	 * How many parts [group] has, to mark where the parts that may scroll start.
	 */
	static int partCount(Group group) {
		try {
			return Reflect.members(group).size();
		} catch (Throwable e) {
			return 0;
		}
	}

	/**
	 * Moves the parts of [window] from [firstPart] on, which run [height] down from [top] and are [width] wide, into a scrolling area
	 * [maxHeight] tall when they are taller than that. Returns the area, or null when they fit and stay where they are.
	 */
	@SuppressWarnings("unchecked")
	static ScrollPane wrapIfTall(Group window, int firstPart, float top, float width, float height, float maxHeight) {
		if (height <= maxHeight) return null;
		try {
			List<Gizmo> members = Reflect.members(window);
			List<Gizmo> parts = new ArrayList<>(members.subList(firstPart, members.size()));
			ScrollPane pane = pane(new Component());
			Component content = pane.content();
			for (Gizmo part : parts) {
				window.remove(part);
				shift(part, -top);
				content.add(part);
			}
			content.setSize(width, height);
			window.add(pane);
			pane.setRect(0, top, width, maxHeight);
			return pane;
		} catch (Throwable e) {
			Log.e(TAG, "Could not make the window scroll", e);
			return null;
		}
	}

	/**
	 * Shows [content], built from y 0 and [height] tall, in [owner] from [top]: as it is when it fits in [maxHeight], or in a scrolling
	 * area that tall when it doesn't. Returns the area, or null when the content fits.
	 */
	@SuppressWarnings("unchecked")
	static ScrollPane place(Group owner, Component content, float top, float width, float height, float maxHeight) throws ReflectiveOperationException {
		if (height <= maxHeight) {
			for (Gizmo part : new ArrayList<>(Reflect.members(content))) {
				content.remove(part);
				shift(part, top);
				owner.add(part);
			}
			return null;
		}
		content.setSize(width, height);
		ScrollPane pane = pane(content);
		owner.add(pane);
		pane.setRect(0, top, width, maxHeight);
		return pane;
	}

	/**
	 * Moves [part] down by [distance]. Parts keep their own place on screen, not one relative to the group they are in.
	 */
	private static void shift(Gizmo part, float distance) {
		if (part instanceof Component) {
			Component component = (Component) part;
			component.setPos(component.left(), component.top() + distance);
		} else if (part instanceof Visual) {
			((Visual) part).y += distance;
		}
	}

	/**
	 * A scrolling area showing [content]. Taps in it reach the buttons in it, and it lays itself out again when the window it is in moves,
	 * as a window does when it is resized.
	 */
	static ScrollPane pane(Component content) {
		return new ScrollPane(content) {
			private int placedX = Integer.MIN_VALUE;
			private int placedY = Integer.MIN_VALUE;

			@Override
			public void onClick(float x, float y) {
				tapInside(content(), x, y);
			}

			@Override
			public void update() {
				super.update();
				com.watabou.noosa.Camera owner = camera();
				if (owner == null || owner.x == placedX && owner.y == placedY) return;
				placedX = owner.x;
				placedY = owner.y;
				layout();
			}
		};
	}

	/**
	 * Adds the hints to [pane], once [window] has its final size. Does nothing for a window that didn't need to scroll.
	 */
	static void finish(Group window, ScrollPane pane) {
		if (pane == null) return;
		pane.setRect(pane.left(), pane.top(), pane.width(), pane.height());
		ScrollHints.add(window, pane);
	}

	/**
	 * The scroll pane takes every tap itself, so a tap is passed on to the button under it.
	 */
	@SuppressWarnings("unchecked")
	private static void tapInside(Component content, float x, float y) {
		try {
			for (Gizmo gizmo : new ArrayList<>(Reflect.members(content))) {
				if (!(gizmo instanceof Button) || !gizmo.visible || !gizmo.active) continue;
				Button button = (Button) gizmo;
				if (x < button.left() || x >= button.right() || y < button.top() || y >= button.bottom()) continue;
				Sample.INSTANCE.play(CLICK_SOUND);
				button.onClick();
				return;
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not pass on the tap", e);
		}
	}
}
