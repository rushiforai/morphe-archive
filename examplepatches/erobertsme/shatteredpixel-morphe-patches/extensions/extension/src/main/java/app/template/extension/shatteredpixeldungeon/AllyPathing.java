package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.watabou.utils.PathFinder;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Path through allies: walking to a far tile swaps places with allies in the way, and walks over wards, when that is the shorter route.
 */
@SuppressWarnings("unused")
public final class AllyPathing {

	private static final String KEY_OFF = "qol_ally_pathing_off";
	private static final int CONTINUE = -1;
	private static final int STOPPED = 0;
	private static final int MOVED = 1;
	private static final String WARD_CLASS = "com.shatteredpixel.shatteredpixeldungeon.items.wands.WandOfWarding$Ward";
	private static final String GHOST_CLASS = "com.shatteredpixel.shatteredpixeldungeon.items.artifacts.DriedRose$GhostHero";

	private static Field pathField;

	private AllyPathing() {
	}

	static boolean isOn() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
	}

	/**
	 * Called at the start of Hero.getCloser. Returns -1 to run the game's own step, otherwise 1 if the hero swapped with an ally and 0 if it stopped.
	 */
	public static int beforeGetCloser(Object hero, int target) {
		if (!(hero instanceof Char) || !isOn()) return CONTINUE;
		Char walker = (Char) hero;
		Level level = Dungeon.level;
		if (level == null || target == walker.pos || walker.rooted || level.adjacent(walker.pos, target)) return CONTINUE;
		try {
			PathFinder.Path path = path(walker);
			if (needsNewPath(walker, level, path, target)) {
				boolean[] known = Grid.knownPassable(level);
				PathFinder.Path normal = Dungeon.findPath(walker, target, known, walker.fieldOfView, true);
				int normalSize = normal == null ? Integer.MAX_VALUE : normal.size();
				path = allyPath(walker, target, known);
				if (path == null || path.size() >= normalSize) return CONTINUE;
				pathField.set(walker, path);
			}
			Char ally = Actor.findChar(path.getFirst());
			if (!swappable(ally)) return CONTINUE;
			if (isWard(ally)) {
				stepOnto(walker, path.removeFirst());
				return MOVED;
			}
			int from = walker.pos;
			swap(walker, ally);
			if (walker.pos == from) {
				pathField.set(walker, null);
				return STOPPED;
			}
			path.removeFirst();
			return MOVED;
		} catch (Throwable e) {
			Log.e("AllyPathing", "Could not path through allies", e);
			return CONTINUE;
		}
	}

	/**
	 * The route the hero takes to [target]: the game's own, or one through allies and wards when that is shorter.
	 */
	static PathFinder.Path route(Char walker, int target) {
		Level level = Dungeon.level;
		boolean[] known = Grid.knownPassable(level);
		PathFinder.Path path = Dungeon.findPath(walker, target, known, walker.fieldOfView, true);
		if (!isOn()) return path;
		PathFinder.Path through = allyPath(walker, target, known);
		if (through == null || path != null && through.size() >= path.size()) return path;
		return through;
	}

	private static void swap(Char walker, Char ally) throws ReflectiveOperationException {
		if (!ally.getClass().getName().equals(GHOST_CLASS)) {
			ally.interact(walker);
			return;
		}
		Method update = Reflect.method(ally.getClass(), "updateRose");
		update.invoke(ally);
		Field roseField = Reflect.field(ally.getClass(), "rose");
		Object rose = roseField.get(ally);
		if (rose == null) {
			ally.interact(walker);
			return;
		}
		Field talked = Reflect.field(rose.getClass(), "talkedTo");
		boolean wasTalked = talked.getBoolean(rose);
		talked.setBoolean(rose, true);
		try {
			ally.interact(walker);
		} finally {
			talked.setBoolean(rose, wasTalked);
		}
	}

	private static void stepOnto(Char walker, int to) throws ReflectiveOperationException {
		Method moveSprite = Reflect.method(Char.class, "moveSprite", int.class, int.class);
		Method spend = Reflect.method(Actor.class, "spend", float.class);
		moveSprite.invoke(walker, walker.pos, to);
		walker.move(to);
		spend.invoke(walker, 1f / walker.speed());
		Reflect.method(walker.getClass(), "search", boolean.class).invoke(walker, false);
	}

	private static boolean isWard(Char c) {
		for (Class<?> type = c.getClass(); type != null; type = type.getSuperclass()) {
			if (type.getName().equals(WARD_CLASS)) return true;
		}
		return false;
	}

	private static PathFinder.Path path(Char walker) throws ReflectiveOperationException {
		if (pathField == null) {
			pathField = Reflect.field(Char.class, "path");
		}
		return (PathFinder.Path) pathField.get(walker);
	}

	private static boolean needsNewPath(Char walker, Level level, PathFinder.Path path, int target) {
		if (path == null || path.isEmpty() || path.getLast() != target) return true;
		int first = path.getFirst();
		if (!level.adjacent(walker.pos, first) || !level.passable[first]) return true;
		Char blocker = Actor.findChar(first);
		return blocker != null && !swappable(blocker);
	}

	private static PathFinder.Path allyPath(Char walker, int target, boolean[] known) {
		boolean[] passable = Dungeon.findPassable(walker, known, walker.fieldOfView, true);
		boolean any = false;
		for (Char c : Actor.chars()) {
			if (!swappable(c) || !known[c.pos]) continue;
			passable[c.pos] = true;
			any = true;
		}
		if (!any) return null;
		return PathFinder.find(walker.pos, target, passable);
	}

	private static boolean swappable(Char c) {
		if (!(c instanceof Mob) || c.alignment != Char.Alignment.ALLY || !c.isAlive()) return false;
		if (isWard(c)) return true;
		if (c.properties().contains(Char.Property.IMMOVABLE)) return false;
		return !c.rooted && c.paralysed <= 0;
	}
}
