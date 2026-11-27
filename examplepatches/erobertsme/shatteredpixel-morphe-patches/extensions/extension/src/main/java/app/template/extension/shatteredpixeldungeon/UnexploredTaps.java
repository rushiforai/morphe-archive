package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.watabou.utils.PathFinder;

/**
 * Tapping an unexplored part of the map walks to the reachable explored tile closest to where you tapped.
 */
final class UnexploredTaps {

	private static final String TAG = "UnexploredTaps";
	private static final String KEY_OFF = "qol_unexplored_taps_off";

	private UnexploredTaps() {
	}

	static boolean isOn() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
	}

	/**
	 * The tile to walk to instead of [cell] when [cell] is unexplored, or null to leave the tap alone.
	 */
	static Integer redirect(Integer cell) {
		try {
			if (cell == null || !isOn()) return null;
			Hero hero = Dungeon.hero;
			Level level = Dungeon.level;
			if (hero == null || level == null || !hero.isAlive() || !hero.ready) return null;
			if (cell < 0 || cell >= level.length()) return null;
			if (level.visited[cell] || level.mapped[cell] || hero.fieldOfView[cell]) return null;

			boolean[] passable = Grid.knownPassable(level);
			passable[hero.pos] = true;
			PathFinder.buildDistanceMap(hero.pos, passable, Integer.MAX_VALUE);

			int width = level.width();
			int tx = cell % width;
			int ty = cell / width;
			int best = -1;
			int bestDistance = Integer.MAX_VALUE;
			int bestSteps = Integer.MAX_VALUE;
			for (int i = 0; i < passable.length; i++) {
				int steps = PathFinder.distance[i];
				if (steps == Integer.MAX_VALUE) continue;
				int dx = i % width - tx;
				int dy = i / width - ty;
				int distance = dx * dx + dy * dy;
				if (distance > bestDistance || (distance == bestDistance && steps >= bestSteps)) continue;
				best = i;
				bestDistance = distance;
				bestSteps = steps;
			}
			return best < 0 || best == hero.pos ? null : best;
		} catch (Throwable e) {
			Log.e(TAG, "Could not find a tile near " + cell, e);
			return null;
		}
	}

	static void walk(int cell) {
		Hero hero = Dungeon.hero;
		if (hero == null || !hero.ready) return;
		if (hero.handle(cell)) hero.next();
	}
}
