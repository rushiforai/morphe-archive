package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.input.PointerEvent;
import com.watabou.noosa.Camera;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Image;
import com.watabou.noosa.PointerArea;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * A saved moment of a game shown the way undo mode shows a step: the hero at the time with their talents and backpack, the depth and turn,
 * the last game messages and the dungeon around them. Subclasses add their own buttons. In landscape the picture sits beside the rest.
 */
abstract class PreviewWindow extends EditorWindow {

	private static final int STATS_WIDTH = 40;
	private static final int LOG_LINES = 2;
	static final int GAME_BUTTON_HEIGHT = 20;
	private static final int LINK_WIDTH = 60;
	private static final int LINK_UNDERLINE_GAP = 1;
	private static final int LINK_TAP_MARGIN = 3;
	private static final int BACKPACK_HEIGHT = 16;
	static final int TOP_BUTTON_WIDTH = 50;
	static final int TOP_BUTTON_HEIGHT = 20;

	private File picture;

	/**
	 * Lays out the preview of a Game Save or undo step, with its picture of the dungeon when it has one.
	 */
	protected void layout(GameSaves.Save save) {
		layout(null, save);
	}

	/**
	 * Like the other, under [title] instead of the save's own, unless it is null.
	 */
	protected void layout(String title, GameSaves.Save save) {
		picture = save.picture();
		UndoScene scene = save.preview();
		layout(title == null ? save.heading(scene) : title, scene);
	}

	/**
	 * Whether the preview shows the last game messages.
	 */
	protected boolean showsLog() {
		return true;
	}

	/**
	 * Lays out the preview of [scene] under [title], then the buttons from [addActions], and sizes the window.
	 */
	protected void layout(String title, UndoScene scene) {
		StatLink link = statLink();
		if (link == null) {
			addTitle(title);
		} else {
			float linkLeft = addLink(link, pos);
			addTitle(title, null, WIDTH - linkLeft + 2 * GAP);
		}
		float columnTop = pos;
		boolean hasPicture = scene != null && (scene.hasArea() || scene.hasMap());
		boolean wide = PixelScene.landscape() && hasPicture;
		addHero(scene);
		if (hasPicture) {
			if (showsLog()) addLog(scene.lines);
		} else {
			addHint("No picture for this one. Ones made from now on keep one.");
		}
		float pictureBottom = pos;
		if (hasPicture && !wide) pictureBottom = addPicture(scene, 0, pos);
		if (wide) pictureBottom = addPicture(scene, WIDTH + 2 * GAP, columnTop);
		addActions();
		resize(wide ? 2 * WIDTH + 2 * GAP : WIDTH, (int) Math.max(pos, pictureBottom));
	}

	/**
	 * Adds the window's buttons at pos and moves pos past them.
	 */
	protected abstract void addActions();

	/**
	 * More small lines under the depth and turn, beside the hero.
	 */
	protected String[] extraStats() {
		return new String[0];
	}

	/**
	 * A line in the top right corner, beside the title, whose value can be tapped, or null for none.
	 */
	protected StatLink statLink() {
		return null;
	}

	/**
	 * A stat whose value is a link, in the top right corner: a dim [label], and under it [text] in yellow and underlined, which runs [action]
	 * when tapped.
	 */
	static final class StatLink {
		final String label;
		final String text;
		final Runnable action;

		StatLink(String label, String text, Runnable action) {
			this.label = label;
			this.text = text;
			this.action = action;
		}
	}

	/**
	 * Adds two buttons side by side across the window at pos, drawn and placed like the game's own Continue and Erase: full size, 20 pixels
	 * tall, with their icons. Moves pos past them.
	 */
	protected RedButton[] addGameButtons(String left, Image leftIcon, Runnable leftAction, String right, Image rightIcon, Runnable rightAction) {
		float half = WIDTH / 2f;
		RedButton[] buttons = { gameButton(left, leftIcon, 0, half - 1, leftAction), gameButton(right, rightIcon, half + 1, half - 1, rightAction) };
		pos += GAME_BUTTON_HEIGHT + 2;
		return buttons;
	}

	private RedButton gameButton(String label, Image icon, float x, float width, Runnable action) {
		RedButton button = new RedButton(label) {
			@Override
			public void onClick() {
				super.onClick();
				action.run();
			}
		};
		if (icon != null) button.icon(icon);
		button.setRect(x, pos, width, GAME_BUTTON_HEIGHT);
		add(button);
		return button;
	}

	/**
	 * The seed of the game [save] belongs to as a link that copies it or starts a new game on it, or null when it isn't known.
	 */
	protected static StatLink seedLink(GameSaves.Save save) {
		String seed = GameSlots.seedCode(save.seed());
		return seed == null ? null : new StatLink("Seed", seed, () -> GameSlots.seedChoices(seed));
	}

	private void addHero(UndoScene scene) {
		HeroCard hero = scene == null ? null : scene.hero;
		float top = pos;
		List<String> lines = new ArrayList<>();
		lines.add("Depth " + (scene != null && scene.depth >= 0 ? scene.depth : "-"));
		lines.add("Turn " + (scene != null && scene.turn >= 0 ? scene.turn : "-"));
		Collections.addAll(lines, extraStats());
		List<Gizmo> parts = new ArrayList<>();
		PreviewParts.statLines(parts, lines.toArray(new String[0]), WIDTH, top, LINK_WIDTH);
		float statsWidth = STATS_WIDTH;
		for (Gizmo part : parts) {
			if (part instanceof RenderedTextBlock) statsWidth = Math.max(statsWidth, ((RenderedTextBlock) part).width());
		}
		float statsBottom = top + lines.size() * PreviewParts.STAT_LINE_HEIGHT;
		if (hero != null) {
			try {
				UndoHeroView.build(parts, hero, 0, top, WIDTH - statsWidth - 4);
			} catch (Throwable e) {
				Log.e("PreviewWindow", "Could not show the hero", e);
			}
			statsBottom = Math.max(statsBottom, top + UndoHeroView.HEIGHT);
		}
		addAll(parts);
		pos = statsBottom + 3;
		if (hero == null) return;
		float half = WIDTH / 2f;
		Image backpackIcon = Icons.get(Icons.BACKPACK);
		Image talentsIcon = Icons.get(Icons.TALENT);
		float scale = backpackIcon.height() / talentsIcon.height();
		talentsIcon.scale.set(scale, scale);
		addHeroButton("Backpack", backpackIcon, 0, half - 1, () -> {
			hide();
			show(new BackpackWindow(hero, PreviewWindow.this::reopen));
		});
		addHeroButton("Talents", talentsIcon, half + 1, half - 1, () -> UndoHeroView.showTalents(hero));
		pos += BACKPACK_HEIGHT + 2 * GAP;
	}

	/**
	 * A button on the row under the hero, at pos.
	 */
	private void addHeroButton(String label, Image icon, float x, float width, Runnable action) {
		RedButton button = new RedButton(label, 7) {
			@Override
			public void onClick() {
				action.run();
			}
		};
		button.icon(icon);
		button.setRect(x, pos, width, BACKPACK_HEIGHT);
		add(button);
	}

	/**
	 * Adds [link] at [y], right-aligned to the window's edge: its dim label, and under it its text in yellow and underlined like the game's
	 * own links, with a tap area over the text. Returns where its wider line starts.
	 */
	private float addLink(StatLink link, float y) {
		RenderedTextBlock label = PixelScene.renderTextBlock(link.label, 6);
		label.hardlight(PreviewParts.DIM_COLOR);
		label.setPos(WIDTH - label.width(), y);
		PixelScene.align(label);
		add(label);
		RenderedTextBlock text = PixelScene.renderTextBlock(link.text, 6);
		text.hardlight(TITLE_COLOR);
		text.setPos(WIDTH - text.width(), y + PreviewParts.STAT_LINE_HEIGHT);
		PixelScene.align(text);
		add(text);
		ColorBlock underline = new ColorBlock(text.width(), 1, 0xFF000000 | TITLE_COLOR);
		underline.x = text.left();
		underline.y = text.bottom() + LINK_UNDERLINE_GAP;
		add(underline);
		add(new PointerArea(text.left() - LINK_TAP_MARGIN, text.top() - LINK_TAP_MARGIN, text.width() + 2 * LINK_TAP_MARGIN,
			text.height() + 2 * LINK_TAP_MARGIN) {
			@Override
			public void onClick(PointerEvent event) {
				link.action.run();
			}
		});
		return Math.min(label.left(), text.left());
	}

	/**
	 * Adds the picture with its top left corner at [x], [y]. Returns the bottom of the picture. Below the rest, it also moves pos past it.
	 */
	private float addPicture(UndoScene scene, float x, float y) {
		float size = WIDTH - 2 * PreviewParts.BORDER;
		List<Gizmo> parts = new ArrayList<>();
		PreviewParts.frame(parts, x + PreviewParts.BORDER, y + PreviewParts.BORDER, size);
		PreviewParts.picture(parts, scene, picture, null, x + PreviewParts.BORDER, y + PreviewParts.BORDER, size, this::refresh);
		addAll(parts);
		float bottom = y + size + 2 * PreviewParts.BORDER + 2 * GAP;
		if (x == 0) pos = bottom;
		return bottom;
	}

	private void addLog(List<String> lines) {
		List<Gizmo> parts = new ArrayList<>();
		PreviewParts.logBackground(parts, 0, pos, WIDTH, LOG_LINES);
		PreviewParts.logLines(parts, lines, 0, pos, WIDTH, "No recent messages", LOG_LINES);
		addAll(parts);
		pos += PreviewParts.logHeight(LOG_LINES) + 2 * GAP;
	}

	private void addAll(List<Gizmo> parts) {
		for (Gizmo part : parts) add(part);
	}

	/**
	 * A button centered just above a window, outside it, like the buttons below undo mode's panel.
	 */
	static final class TopButton {

		private final Window window;
		private final String label;
		private final Runnable action;
		private TintedButton button;

		TopButton(Window window, String label, Runnable action) {
			this.window = window;
			this.label = label;
			this.action = action;
		}

		/**
		 * Adds the button. Called once, just after the window is put on screen.
		 */
		void place() {
			if (button != null || window.parent == null || window.camera == null) return;
			Camera ui = PixelScene.uiCamera;
			Camera own = window.camera;
			float top = (own.y - ui.y) / ui.zoom;
			float center = (own.x - ui.x + own.width * own.zoom / 2f) / ui.zoom;
			button = new TintedButton(label, null, 1f, 1f, 1f, action);
			button.camera = ui;
			button.setRect(center - TOP_BUTTON_WIDTH / 2f, Math.max(0, top - TOP_BUTTON_HEIGHT - 2), TOP_BUTTON_WIDTH, TOP_BUTTON_HEIGHT);
			Game.scene().add(button);
		}

		void remove() {
			if (button == null) return;
			button.killAndErase();
			button.destroy();
			button = null;
		}
	}

	/**
	 * Everything the hero carried. Tapping an item shows its details. Back sits above the window and runs [onBack].
	 */
	static final class BackpackWindow extends EditorWindow {

		private static final float SHARE = 0.55f;

		private final HeroCard hero;
		private final Runnable onBack;
		private final TopButton back;

		BackpackWindow(HeroCard hero, Runnable onBack) {
			super();
			this.hero = hero;
			this.onBack = onBack;
			back = new TopButton(this, "Back", this::back);
			addTitle("Backpack");
			float height = Math.min(PixelScene.uiCamera.height * SHARE, 180);
			List<Gizmo> slots = new ArrayList<>();
			UndoHeroView.slots(slots, hero.belongings, 0, pos, WIDTH, height);
			for (Gizmo slot : slots) add(slot);
			pos += height;
			finish();
			Game.runOnRenderThread(back::place);
		}

		private void back() {
			hide();
			onBack.run();
		}

		@Override
		public void destroy() {
			back.remove();
			super.destroy();
		}

		@Override
		public void onBackPressed() {
			back();
		}

		@Override
		protected void reopen() {
			show(new BackpackWindow(hero, onBack));
		}
	}
}
