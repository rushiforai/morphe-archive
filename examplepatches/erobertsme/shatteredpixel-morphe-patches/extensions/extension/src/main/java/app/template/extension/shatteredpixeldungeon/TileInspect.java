package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.plants.Plant;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.HeroSprite;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoCell;

/**
 * A Tile button in the header of the info window of anything on a tile, which shows that tile's own info, and a Back button there that
 * returns to what was being examined. A small hero in the header marks the tile you are standing on.
 */
final class TileInspect {

	private static final int TILE_WIDTH = 24;
	private static final int BACK_WIDTH = 28;

	private static Object returnTo;

	private TileInspect() {
	}

	static void decorateInfo(Window window, Object subject) throws ReflectiveOperationException {
		if (!QolSettings.isAvailable() || Dungeon.level == null) return;
		int cell = subject instanceof Integer ? (Integer) subject : cellOf(subject);
		if (cell < 0) return;
		if (Dungeon.hero != null && Dungeon.hero.pos == cell) WindowHeader.addMarker(window, HeroSprite.avatar(Dungeon.hero));
		if (subject instanceof Integer) {
			addBack(window, cell);
			return;
		}
		WindowHeader.add(window, WindowHeader.smallButton("Tile", null, () -> {
			window.hide();
			returnTo = subject;
			GameScene.show(new WndInfoCell(cell));
		}), TILE_WIDTH, WindowHeader.SMALL_HEIGHT, WindowHeader.PRIORITY_NAVIGATION);
	}

	private static void addBack(Window window, int cell) throws ReflectiveOperationException {
		Object target = returnTo;
		returnTo = null;
		if (target == null || cellOf(target) != cell) return;
		WindowHeader.add(window, WindowHeader.smallButton("Back", null, () -> {
			window.hide();
			if (cellOf(target) == cell) GameScene.examineObject(target);
		}), BACK_WIDTH, WindowHeader.SMALL_HEIGHT, WindowHeader.PRIORITY_NAVIGATION);
	}

	/**
	 * The tile [subject] is on, or -1 for something that isn't on this floor.
	 */
	private static int cellOf(Object subject) {
		int cell = subject instanceof Char ? (((Char) subject).isAlive() ? ((Char) subject).pos : -1)
			: subject instanceof Heap ? ((Heap) subject).pos
			: subject instanceof Plant ? ((Plant) subject).pos
			: subject instanceof Trap ? ((Trap) subject).pos
			: -1;
		return cell >= 0 && cell < Dungeon.level.length() ? cell : -1;
	}
}
