package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;

/**
 * Tile math on the current floor.
 */
final class Grid {

	private static final int TILE_SIZE = 16;

	private Grid() {
	}

	/**
	 * The cell of the current floor under the point [screen] on the screen, or -1 when it is off the floor.
	 */
	static int cellAt(com.watabou.utils.PointF screen) {
		Level level = Dungeon.level;
		if (level == null || screen == null) return -1;
		com.watabou.utils.PointF world = com.watabou.noosa.Camera.main.screenToCamera((int) screen.x, (int) screen.y);
		int width = level.width();
		int x = (int) Math.floor(world.x / TILE_SIZE);
		int y = (int) Math.floor(world.y / TILE_SIZE);
		if (x < 0 || y < 0 || x >= width || y >= level.length() / width) return -1;
		return x + y * width;
	}

	/**
	 * Steps between two cells, counting diagonal steps as one.
	 */
	static int distance(int a, int b, int width) {
		return Math.max(Math.abs(a % width - b % width), Math.abs(a / width - b / width));
	}

	static int distance(int a, int b) {
		return distance(a, b, Dungeon.level.width());
	}

	/**
	 * The tiles of [level] that can be walked on and that the hero has seen or mapped, the way the game picks routes for taps.
	 */
	static boolean[] knownPassable(Level level) {
		int length = level.length();
		boolean[] passable = new boolean[length];
		for (int i = 0; i < length; i++) passable[i] = level.passable[i] && (level.visited[i] || level.mapped[i]);
		return passable;
	}
}
