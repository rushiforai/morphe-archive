package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.watabou.noosa.Scene;

import java.util.ArrayList;
import java.util.List;

/**
 * A tag the patches add to the game screen. Every tag works the same way: it has a placement and look the player chooses, shows while the
 * hero is alive and its own check passes, and does its own thing when tapped. Only the name, the check and the tap differ.
 */
final class ScreenTag {

	interface Name {
		String get();
	}

	interface Check {
		boolean isTrue();
	}

	interface Tap {
		void tapped(IconTag tag);
	}

	/**
	 * A way to change what a tag does: the button's label, what it opens, and whether it shows for the tag as it is now.
	 */
	static final class Change {
		final String label;
		final Runnable change;
		final Check shows;

		Change(String label, Runnable change, Check shows) {
			this.label = label;
			this.change = change;
			this.shows = shows;
		}
	}

	/**
	 * How a tag is removed, and the question asked first.
	 */
	static final class Removal {
		final String question;
		final Runnable remove;

		Removal(String question, Runnable remove) {
			this.question = question;
			this.remove = remove;
		}
	}

	final TagPlacement placement;
	private final Name name;
	private final Check shows;
	private final Tap tap;
	private Check enabled = () -> true;
	private Removal removal;
	private final List<Change> changes = new ArrayList<>();
	private IconTag view;

	ScreenTag(Name name, TagPlacement placement, Check shows, Tap tap) {
		this.name = name;
		this.placement = placement;
		this.shows = shows;
		this.tap = tap;
	}

	ScreenTag(String name, TagPlacement placement, Check shows, Tap tap) {
		this(() -> name, placement, shows, tap);
	}

	String name() {
		return name.get();
	}

	/**
	 * Ties the tag to a feature that can be switched off: while [check] fails the tag is hidden, and the tags editor leaves it out.
	 */
	ScreenTag enabledWhen(Check check) {
		enabled = check;
		return this;
	}

	boolean isEnabled() {
		return passes(enabled);
	}

	/**
	 * Lets the tag be removed with [remove], asking [question] first.
	 */
	ScreenTag removable(String question, Runnable remove) {
		removal = new Removal(question, remove);
		return this;
	}

	/**
	 * Lets what the tag does be changed with [change], from a button labeled [label] that shows while [shows] passes.
	 */
	ScreenTag changeable(String label, Runnable change, Check shows) {
		changes.add(new Change(label, change, shows));
		return this;
	}

	/**
	 * The ways what the tag does can be changed, in the order they were added.
	 */
	List<Change> changes() {
		return changes;
	}

	/**
	 * How the tag is removed, or null when it can't be.
	 */
	Removal removal() {
		return removal;
	}

	/**
	 * The tag on screen, or null when it isn't in a scene.
	 */
	IconTag view() {
		IconTag current = view;
		return current == null || current.parent == null ? null : current;
	}

	/**
	 * Puts the tag on [scene], replacing the one on an earlier scene.
	 */
	void addTo(Scene scene) {
		remove();
		IconTag[] holder = new IconTag[1];
		IconTag tag = new IconTag(() -> tap.tapped(holder[0]));
		holder[0] = tag;
		tag.camera = PixelScene.uiCamera;
		tag.visible = false;
		scene.add(tag);
		view = tag;
		placement.onChange(this::refresh);
		refresh();
	}

	void remove() {
		IconTag current = view;
		view = null;
		if (current == null) return;
		current.killAndErase();
		current.destroy();
	}

	/**
	 * Shows or hides the tag and lays it out again. A tag in its automatic place is placed by the game's tag layout, which is asked to run.
	 */
	void refresh() {
		IconTag tag = view();
		if (tag == null) return;
		Hero hero = Dungeon.hero;
		boolean visible = hero != null && hero.isAlive() && passes(enabled) && passes(shows);
		boolean changed = visible != tag.visible;
		tag.visible = visible;
		if (placement.isAuto()) {
			if (visible) tag.style(placement);
			if (changed || visible) GameScene.updateTags = true;
			return;
		}
		if (visible) placement.place(tag);
	}

	/**
	 * Where the tag sits now: its own position, where the game's layout put it, or for a tag not on screen, its automatic place above the
	 * toolbar.
	 */
	float[] rect() {
		if (!placement.isAuto()) return placement.rect(0);
		float[] shown = shownRect();
		if (shown != null) return shown;
		float[] insets = ScreenLayout.insets();
		float width = placement.tagWidth();
		float height = placement.tagHeight();
		return new float[] { PixelScene.uiCamera.width - insets[2] - width, ScreenLayout.aboveToolbar() - height, width, height };
	}

	/**
	 * Where the tag is on screen, or null while it is hidden or not in a scene.
	 */
	float[] shownRect() {
		IconTag tag = view();
		if (tag == null || !tag.visible) return null;
		return new float[] { tag.left(), tag.top(), tag.width(), tag.height() };
	}

	private static boolean passes(Check check) {
		try {
			return check.isTrue();
		} catch (Throwable e) {
			return false;
		}
	}
}
