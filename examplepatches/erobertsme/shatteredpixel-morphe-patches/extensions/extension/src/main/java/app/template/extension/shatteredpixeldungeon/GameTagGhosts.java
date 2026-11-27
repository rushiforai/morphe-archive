package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Tag;
import com.watabou.noosa.Camera;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Image;
import com.watabou.noosa.Scene;

import java.util.ArrayList;
import java.util.List;

/**
 * Stand-ins for the game's own tags, drawn the way the game draws them: Attack with a rat, Pick Up with a ration, Action with a combo, Resume
 * with its arrow, and the visible enemies counter. Shown while tags are positioned so they can be kept clear of them.
 */
final class GameTagGhosts {

	private static final String TAG = "GameTagGhosts";
	private static final String RAT_SPRITE = "com.shatteredpixel.shatteredpixeldungeon.sprites.RatSprite";
	private static final int DANGER_COLOR = 0xC03838;
	private static final int DANGER_HEIGHT = 16;
	private static final String DANGER_COUNT = "3";
	private static final int LABEL_COLOR = 0xFFFF44;

	private static final List<Gizmo> ghosts = new ArrayList<>();

	private GameTagGhosts() {
	}

	/**
	 * A game tag with an icon in its middle.
	 */
	private static final class Ghost extends Tag {
		private Image icon;
		private RenderedTextBlock count;

		Ghost(int color) {
			super(color);
			setColor(color);
		}

		void show(Image icon, RenderedTextBlock count) {
			this.icon = icon;
			this.count = count;
			if (icon != null) add(icon);
			if (count != null) add(count);
			layout();
		}

		@Override
		public void layout() {
			super.layout();
			float right = left() + width() - (count == null ? 0 : 3);
			if (icon != null) {
				icon.x = count == null ? left() + (width() - icon.width()) / 2f : right - icon.width();
				icon.y = top() + (height() - icon.height()) / 2f;
				PixelScene.align(icon);
			}
			if (count != null && icon != null) {
				count.setPos(icon.x - count.width() - 1, top() + (height() - count.height()) / 2f);
				PixelScene.align(count);
			}
		}

		@Override
		public void onClick() {
		}
	}

	static void show() {
		hide();
		Scene scene = Game.scene();
		if (scene == null) return;
		float[][] rects = GameTags.rects();
		for (int i = 0; i < rects.length; i++) {
			for (Gizmo part : ghost(i, rects[i])) add(scene, part);
		}
		add(scene, danger());
	}

	/**
	 * Game tag [index] at [rect] as the game draws it, with its name under it, as the tag and its label.
	 */
	static Gizmo[] ghost(int index, float[] rect) {
		Camera ui = PixelScene.uiCamera;
		Ghost ghost = new Ghost(GameTags.PLACEMENTS[index].color());
		ghost.camera = ui;
		ghost.setRect(rect[0], rect[1], rect[2], rect[3]);
		ghost.flip(GameTags.flipped(index));
		ghost.show(icon(index), null);
		RenderedTextBlock label = PixelScene.renderTextBlock(GameTags.NAMES[index], 5);
		label.hardlight(LABEL_COLOR);
		label.camera = ui;
		label.setPos(Math.max(0, Math.min(ui.width - label.width(), rect[0] + (rect[2] - label.width()) / 2f)), rect[1] + rect[3] + 1);
		PixelScene.align(label);
		return new Gizmo[] { ghost, label };
	}

	/**
	 * The visible enemies counter below the menu buttons, which can't be moved.
	 */
	static Gizmo danger() {
		Camera ui = PixelScene.uiCamera;
		float[] origins = ScreenLayout.tagOrigins();
		float[] insets = ScreenLayout.insets();
		Ghost ghost = new Ghost(DANGER_COLOR);
		ghost.camera = ui;
		ghost.setRect(ui.width - insets[2] - Tag.SIZE, origins[2] - ScreenLayout.ORIGIN_GAP - DANGER_HEIGHT, Tag.SIZE, DANGER_HEIGHT);
		ghost.show(Icons.get(Icons.SKULL), PixelScene.renderTextBlock(DANGER_COUNT, 6));
		return ghost;
	}

	private static Image icon(int index) {
		try {
			switch (index) {
				case 0: return (Image) Reflect.require(RAT_SPRITE).getDeclaredConstructor().newInstance();
				case 1: return new ItemSprite(ItemSpriteSheet.RATION);
				case 2: return new BuffIcon(StatIcons.BUFF_COMBO, true);
				default: return Icons.get(Icons.ARROW);
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not draw the icon of game tag " + index, e);
			return null;
		}
	}

	private static void add(Scene scene, Gizmo gizmo) {
		scene.add(gizmo);
		ghosts.add(gizmo);
	}

	static void hide() {
		for (Gizmo gizmo : ghosts) {
			gizmo.killAndErase();
			gizmo.destroy();
		}
		ghosts.clear();
	}
}
