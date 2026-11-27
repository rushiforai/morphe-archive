package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;

import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Image;
import com.watabou.noosa.ui.Component;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Small buttons in the top right corner of a game window, beside its title. Buttons added by different patches
 * line up, the [i] button always furthest right. The title narrows to make room, and if it needs another line the
 * rest of the window moves down. A title that still doesn't fit, such as one long word, keeps the full width and the buttons go on a row
 * of their own just below it.
 */
final class WindowHeader {

	static final int PRIORITY_INFO = 0;
	static final int PRIORITY_ACTION = 1;
	static final int PRIORITY_NAVIGATION = 2;
	static final int PRIORITY_MARKER = 3;
	static final int SMALL_HEIGHT = 12;
	static final int EDIT_WIDTH = 24;
	private static final int ROW = 16;
	private static final int GAP = 2;

	private static final Map<Window, State> states = Collections.synchronizedMap(new WeakHashMap<>());

	private static final class Entry {
		final Component button;
		final float width;
		final float height;
		final int priority;

		Entry(Component button, float width, float height, int priority) {
			this.button = button;
			this.width = width;
			this.height = height;
			this.priority = priority;
		}
	}

	private static final class State {
		Component title;
		float lastBottom;
		final List<Entry> entries = new ArrayList<>();
	}

	private WindowHeader() {
	}

	static RedButton smallButton(String label, Icons icon, Runnable action) {
		RedButton button = new RedButton(label, 6) {
			@Override
			public void onClick() {
				action.run();
			}
		};
		if (icon != null) button.icon(Icons.get(icon));
		return button;
	}

	/**
	 * A small picture beside the title, such as the hero on the tile you are standing on, sized to the header's buttons.
	 */
	static void addMarker(Window window, Image image) throws ReflectiveOperationException {
		float scale = Math.min(1, SMALL_HEIGHT / image.height());
		image.scale.set(scale, scale);
		Component marker = new Component() {
			@Override
			public void layout() {
				image.x = left() + (width() - image.width()) / 2f;
				image.y = top() + (height() - image.height()) / 2f;
				PixelScene.align(image);
			}
		};
		marker.add(image);
		add(window, marker, image.width(), SMALL_HEIGHT, PRIORITY_MARKER);
	}

	static void addEdit(Window window, Runnable action) throws ReflectiveOperationException {
		add(window, smallButton("Edit", null, action), EDIT_WIDTH, SMALL_HEIGHT, PRIORITY_ACTION);
	}

	@SuppressWarnings("unchecked")
	static void add(Window window, Component button, float width, float height, int priority) throws ReflectiveOperationException {
		int windowWidth = Reflect.width(window);
		int windowHeight = Reflect.height(window);

		State state = states.get(window);
		if (state == null) {
			state = new State();
			state.title = findTitle(Reflect.members(window), windowWidth);
			state.lastBottom = state.title == null ? 0 : state.title.bottom();
			states.put(window, state);
		}

		int index = 0;
		while (index < state.entries.size() && state.entries.get(index).priority <= priority) index++;
		state.entries.add(index, new Entry(button, width, height, priority));
		window.add(button);

		float x = windowWidth;
		for (Entry entry : state.entries) {
			x -= entry.width;
			entry.button.setRect(x, (ROW - entry.height) / 2f, entry.width, entry.height);
			x -= GAP;
		}
		if (state.title == null) return;

		Component title = state.title;
		title.setRect(title.left(), title.top(), Math.max(10, x - title.left()), 0);
		float bottom = title.bottom();
		if (textRight(title) > x + GAP) {
			title.setRect(title.left(), title.top(), windowWidth - title.left(), 0);
			float rowTop = title.bottom() + GAP;
			for (Entry entry : state.entries) entry.button.setPos(entry.button.left(), rowTop + (ROW - entry.height) / 2f);
			bottom = rowTop + ROW;
		}
		float shift = bottom - state.lastBottom;
		if (shift == 0) return;
		for (Gizmo member : new ArrayList<>(Reflect.members(window))) {
			if (member == title || !(member instanceof Component) || isHeaderButton(state, member)) continue;
			Component component = (Component) member;
			if (component.top() < state.lastBottom - 1) continue;
			component.setPos(component.left(), component.top() + shift);
		}
		state.lastBottom = bottom;
		window.resize(windowWidth, (int) (windowHeight + shift));
	}

	/**
	 * Where the title's text ends. A single word too long to wrap reaches past the width the title was given.
	 */
	@SuppressWarnings("unchecked")
	private static float textRight(Component title) throws ReflectiveOperationException {
		float right = title.left();
		for (Gizmo member : Reflect.members(title)) {
			if (member instanceof RenderedTextBlock) right = Math.max(right, ((RenderedTextBlock) member).right());
		}
		return right;
	}

	private static boolean isHeaderButton(State state, Gizmo member) {
		for (Entry entry : state.entries) {
			if (entry.button == member) return true;
		}
		return false;
	}

	private static Component findTitle(List<Gizmo> members, int windowWidth) {
		for (Gizmo member : members) {
			if (!(member instanceof Component) || member instanceof RenderedTextBlock) continue;
			Component component = (Component) member;
			if (component.top() > 1 || component.width() < windowWidth / 2f) continue;
			return component;
		}
		return null;
	}
}
