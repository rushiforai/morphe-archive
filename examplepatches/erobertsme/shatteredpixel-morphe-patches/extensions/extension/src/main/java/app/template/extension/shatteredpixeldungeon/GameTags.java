package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.SPDSettings;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Tag;
import com.watabou.noosa.ui.Component;

/**
 * The game's own situational tags (Attack, Pick Up, Action and Resume). Each keeps its automatic place, stacked above the toolbar, until it
 * is moved to a place of its own. Their color can be changed too; the game draws the rest of their look itself.
 */
final class GameTags {

	static final String[] NAMES = { "Attack", "Pick Up", "Action", "Resume" };
	private static final String[] FIELDS = { "attack", "loot", "action", "resume" };
	private static final String[] FLAGS = { "tagAttack", "tagLoot", "tagAction", "tagResume" };
	static final int[] COLORS = { 0xC03838, 0x185898, 0xC0A040, 0xA3A695 };
	private static final boolean[] FIXED_COLOR = { true, true, false, true };
	static final TagPlacement[] PLACEMENTS = new TagPlacement[NAMES.length];

	static {
		for (int i = 0; i < NAMES.length; i++) {
			PLACEMENTS[i] = new TagPlacement("game_tag_" + FIELDS[i], TagPlacement.Side.RIGHT, 0.5f, 1, IconCatalog.WEAPON, 0, COLORS[i], true)
				.autoByDefault()
				.positionAndColorOnly();
			PLACEMENTS[i].onChange(() -> GameScene.updateTags = true);
		}
	}

	private GameTags() {
	}

	/**
	 * Called at the end of GameScene.layoutTags, after the Attack Tile button is placed. Puts each moved tag in its own place, stacks the
	 * rest in their usual order above the toolbar and the Attack Tile button, and applies any chosen colors.
	 */
	static void afterLayoutTags() {
		try {
			layout();
		} catch (ReflectiveOperationException e) {
			Log.e("GameTags", "Could not place the game's tags", e);
		}
	}

	private static void layout() throws ReflectiveOperationException {
		Object scene = Reflect.getStatic(GameScene.class, "scene");
		if (scene == null) return;
		boolean onLeft = SPDSettings.flipTags();
		float[] insets = ScreenLayout.insets();
		float width = Tag.SIZE + (onLeft ? insets[0] : insets[2]);
		float left = onLeft ? 0 : PixelScene.uiCamera.width - width;
		float pos = ((Component) Reflect.get(GameScene.class, scene, onLeft && SPDSettings.interfaceSize() > 0 ? "status" : "toolbar")).top();
		float[] attackTile = ForceAttack.PLACEMENT.isAuto() ? ForceAttack.TAG.shownRect() : null;
		if (attackTile != null) pos = attackTile[1];
		for (int i = 0; i < NAMES.length; i++) {
			Tag tag = (Tag) Reflect.get(GameScene.class, scene, FIELDS[i]);
			if (tag == null) continue;
			TagPlacement placement = PLACEMENTS[i];
			if (!placement.isAuto()) {
				float[] rect = placement.rect(0);
				tag.setRect(rect[0], rect[1], rect[2], rect[3]);
				tag.flip(placement.side() == TagPlacement.Side.LEFT);
			} else if ((boolean) Reflect.get(GameScene.class, scene, FLAGS[i])) {
				tag.setRect(left, pos - Tag.SIZE, width, Tag.SIZE);
				tag.flip(onLeft);
				pos -= Tag.SIZE;
			}
			if (placement.colorChosen()) {
				tag.setColor(placement.color());
			} else if (FIXED_COLOR[i]) {
				tag.setColor(COLORS[i]);
			}
		}
	}

	/**
	 * Where each of the game's tags shows up when it is needed, as x, y, width and height, for the outlines shown while positioning tags.
	 */
	static float[][] rects() {
		float[][] rects = new float[NAMES.length][];
		boolean onLeft = SPDSettings.flipTags();
		float[] insets = ScreenLayout.insets();
		float left = onLeft ? insets[0] : PixelScene.uiCamera.width - insets[2] - Tag.SIZE;
		float pos = ScreenLayout.aboveToolbar() + 4;
		if (ForceAttack.PLACEMENT.isAuto()) {
			float[] attackTile = ForceAttack.TAG.shownRect();
			pos -= attackTile != null ? attackTile[3] : ForceAttack.PLACEMENT.tagHeight();
		}
		for (int i = 0; i < NAMES.length; i++) {
			if (!PLACEMENTS[i].isAuto()) {
				rects[i] = PLACEMENTS[i].rect(0);
				continue;
			}
			pos -= Tag.SIZE;
			rects[i] = new float[] { left, pos, Tag.SIZE, Tag.SIZE };
		}
		return rects;
	}

	/**
	 * Whether tag [index] faces right, as it does on the left edge.
	 */
	static boolean flipped(int index) {
		TagPlacement placement = PLACEMENTS[index];
		return placement.isAuto() ? SPDSettings.flipTags() : placement.side() == TagPlacement.Side.LEFT;
	}
}
