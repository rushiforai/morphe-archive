package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.Statistics;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Group;
import com.watabou.noosa.Scene;
import com.watabou.utils.Bundle;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * The Quantum Chest: a chest beside the exit of every boss floor once its boss is beaten. Every chest opens the
 * same storage, which is saved with the hero.
 */
@SuppressWarnings("unused")
public final class QuantumChest {

	private static final String TAG = "QuantumChest";
	private static final String KEY_OFF = "qol_quantum_chest_off";
	private static final String KEY_PAGES = "qol_quantum_chest_pages";
	private static final String KEY_QUICK = "qol_quantum_chest_quick";
	private static final String BUNDLE_ITEMS = "morphe_quantum_chest";
	private static final String BUNDLE_BOSSES = "morphe_quantum_chest_bosses";
	static final int PER_PAGE = 25;
	static final int MAX_PAGES = 3;
	private static final int TILE = 16;

	private static final List<Item> items = new ArrayList<>();
	private static final Set<Integer> defeatedBosses = new HashSet<>();
	private static WeakReference<Object> owner = new WeakReference<>(null);
	private static WeakReference<ItemSprite> sprite = new WeakReference<>(null);
	private static int chestCell = -1;

	private QuantumChest() {
	}

	static boolean isAvailable() {
		return QolSettings.isAvailable();
	}

	static boolean isOn() {
		return isAvailable() && !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
		ItemSprite chest = sprite.get();
		if (chest != null) chest.visible = isHere();
		if (on && chest == null && bossDefeated()) placeAfterBoss();
	}

	static int pages() {
		int pages = CloverlordSettings.getInt(KEY_PAGES);
		return pages <= 0 ? 1 : Math.min(MAX_PAGES, pages);
	}

	static void pages(int pages) {
		CloverlordSettings.setInt(KEY_PAGES, Math.max(1, Math.min(MAX_PAGES, pages)));
	}

	static boolean quickMove() {
		return CloverlordSettings.get(KEY_QUICK);
	}

	static void quickMove(boolean on) {
		CloverlordSettings.set(KEY_QUICK, on);
	}

	/**
	 * Everything in the hero's bags that can go in the chest: not bags, and not equipped.
	 */
	static List<Item> storable() {
		List<Item> found = new ArrayList<>();
		Hero hero = Dungeon.hero;
		if (hero != null) collectStorable(hero, hero.belongings.backpack, found);
		return found;
	}

	private static void collectStorable(Hero hero, com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag bag, List<Item> found) {
		if (bag == null || bag.items == null) return;
		for (Item item : bag.items) {
			if (item instanceof com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag) {
				collectStorable(hero, (com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag) item, found);
				continue;
			}
			if (!item.isEquipped(hero)) found.add(item);
		}
	}

	static int capacity() {
		return pages() * PER_PAGE;
	}

	/**
	 * The stored items for the current hero. A new game starts with an empty chest.
	 */
	static synchronized List<Item> items() {
		syncOwner();
		return items;
	}

	private static void syncOwner() {
		Hero hero = Dungeon.hero;
		if (hero == null || owner.get() == hero) return;
		owner = new WeakReference<>(hero);
		items.clear();
		defeatedBosses.clear();
	}

	/**
	 * Called at the start of Hero.storeInBundle.
	 */
	public static synchronized void onStore(Object hero, Bundle bundle) {
		try {
			if (bundle == null || owner.get() != hero) return;
			if (!items.isEmpty()) bundle.put(BUNDLE_ITEMS, new ArrayList<>(items));
			if (defeatedBosses.isEmpty()) return;
			int[] depths = new int[defeatedBosses.size()];
			int i = 0;
			for (int depth : defeatedBosses) depths[i++] = depth;
			bundle.put(BUNDLE_BOSSES, depths);
		} catch (Throwable e) {
			Log.e(TAG, "Could not save the quantum chest", e);
		}
	}

	/**
	 * Called at the start of Hero.restoreFromBundle.
	 */
	public static synchronized void onRestore(Object hero, Bundle bundle) {
		owner = new WeakReference<>(hero);
		items.clear();
		defeatedBosses.clear();
		try {
			if (bundle == null) return;
			if (bundle.contains(BUNDLE_ITEMS)) {
				for (Object stored : bundle.getCollection(BUNDLE_ITEMS)) {
					if (stored instanceof Item) items.add((Item) stored);
				}
			}
			if (bundle.contains(BUNDLE_BOSSES)) {
				for (int depth : bundle.getIntArray(BUNDLE_BOSSES)) defeatedBosses.add(depth);
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not load the quantum chest", e);
		}
	}

	/**
	 * Called at the start of GameScene.bossSlain.
	 */
	public static synchronized void onBossSlain() {
		try {
			if (!Dungeon.bossLevel()) return;
			syncOwner();
			defeatedBosses.add(Dungeon.depth);
			placeAfterBoss();
		} catch (Throwable e) {
			Log.e(TAG, "Could not record the boss", e);
		}
	}

	private static synchronized boolean bossDefeated() {
		syncOwner();
		return defeatedBosses.contains(Dungeon.depth) || Statistics.deepestFloor > Dungeon.depth;
	}

	/**
	 * Whether the chest stands on this floor right now.
	 */
	static boolean isHere() {
		try {
			return isOn() && Dungeon.level != null && Dungeon.bossLevel() && chestCell >= 0 && bossDefeated();
		} catch (Throwable e) {
			return false;
		}
	}

	static int cell() {
		return chestCell;
	}

	/**
	 * Called at the end of GameScene.create. Places the chest sprite beside the exit of a boss floor whose boss is already defeated.
	 */
	public static void onSceneCreated(Object scene) {
		chestCell = -1;
		pendingOpen = false;
		sprite = new WeakReference<>(null);
		sceneRef = new WeakReference<>(null);
		try {
			if (!isAvailable() || !(scene instanceof Scene) || Dungeon.level == null || !Dungeon.bossLevel()) return;
			sceneRef = new WeakReference<>((Scene) scene);
			if (isOn() && bossDefeated()) place((Scene) scene, Dungeon.level);
		} catch (Throwable e) {
			Log.e(TAG, "Could not place the quantum chest", e);
		}
	}

	/**
	 * Places the chest once the boss falls. The floor is back to its final layout by then, so the spot beside the exit can be found.
	 */
	private static void placeAfterBoss() {
		Game.runOnRenderThread(() -> {
			try {
				Scene scene = sceneRef.get();
				if (scene == null || chestCell >= 0 || Dungeon.level == null || !isOn()) return;
				place(scene, Dungeon.level);
				if (isHere()) GLog.i("A quantum chest shimmers into being beside the exit.");
			} catch (Throwable e) {
				Log.e(TAG, "Could not place the quantum chest", e);
			}
		});
	}

	private static WeakReference<Scene> sceneRef = new WeakReference<>(null);

	private static void place(Scene scene, Level level) {
		int cell = findCell(level);
		if (cell < 0) return;
		chestCell = cell;
		ItemSprite chest = new ItemSprite(ItemSpriteSheet.EBONY_CHEST);
		int width = level.width();
		chest.x = (cell % width) * TILE + (TILE - chest.width()) / 2f;
		chest.y = (cell / width) * TILE + (TILE - chest.height()) / 2f;
		chest.visible = isHere();
		heapLayer(scene).add(chest);
		sprite = new WeakReference<>(chest);
	}

	private static boolean pendingOpen;
	private static boolean walkStarted;
	private static float pendingTime;
	private static final float START_TIMEOUT = 1f;

	/**
	 * Opens the chest once the hero has walked up to it after tapping it from further away.
	 */
	private static void openWhenArrived() {
		if (!pendingOpen) return;
		Hero hero = Dungeon.hero;
		if (hero == null || !hero.isAlive() || !isHere()) {
			pendingOpen = false;
			return;
		}
		if (!hero.ready) {
			walkStarted = true;
			return;
		}
		if (!walkStarted && Grid.distance(hero.pos, chestCell) > 1) {
			pendingTime += com.watabou.noosa.Game.elapsed;
			if (pendingTime < START_TIMEOUT) return;
		}
		pendingOpen = false;
		if (Grid.distance(hero.pos, chestCell) <= 1) EditorWindow.show(new QuantumChestWindow(0));
	}

	/**
	 * Watches the walk to the chest until it ends, then stops watching.
	 */
	private static void watchWalk() {
		Scene scene = sceneRef.get();
		if (scene == null) return;
		scene.add(new Gizmo() {
			@Override
			public void update() {
				super.update();
				openWhenArrived();
				if (!pendingOpen) killAndErase();
			}
		});
	}

	private static Group heapLayer(Scene scene) {
		try {
			Field field = Reflect.field(scene.getClass(), "heaps");
			Object layer = field.get(scene);
			if (layer instanceof Group) return (Group) layer;
		} catch (Throwable ignored) {
		}
		return scene;
	}

	/**
	 * A floor tile near the exit but out of the way of it, the same one every time.
	 */
	private static int findCell(Level level) {
		int exit = level.exit();
		if (exit < 0) return -1;
		int width = level.width();
		int chosen = chosenCell(level, exit, width);
		if (chosen >= 0) return chosen;
		return nearestFloor(level, exit, width);
	}

	/**
	 * The approved spot for each boss floor: Prison above the walkway, Caves beside the stairs, City in the hallway
	 * corner, Halls in the corner of the boss room, and the Sewers beside the exit's wall away from any door.
	 */
	private static int chosenCell(Level level, int exit, int width) {
		switch (Dungeon.depth) {
			case 5:
				for (int side : new int[] { -2, 2 }) {
					int cell = exit + side;
					if (isFloor(level, cell) && !nextToDoor(level, cell, width)) return cell;
				}
				return -1;
			case 10:
				return floorOrNone(level, exit - 3 * width);
			case 15:
				return floorOrNone(level, exit + 2 + width);
			case 20:
				return floorOrNone(level, exit + 3 + width);
			case 25:
				return floorOrNone(level, exit - 4 + width);
			default:
				return -1;
		}
	}

	private static int floorOrNone(Level level, int cell) {
		return cell >= 0 && cell < level.length() && isFloor(level, cell) ? cell : -1;
	}

	private static boolean nextToDoor(Level level, int cell, int width) {
		for (int dx = -1; dx <= 1; dx++) {
			for (int dy = -1; dy <= 1; dy++) {
				int next = cell + dx + dy * width;
				if (next < 0 || next >= level.length()) continue;
				int tile = level.map[next];
				if (tile == FloorEditor.DOOR || tile == FloorEditor.OPEN_DOOR || tile == FloorEditor.LOCKED_DOOR) return true;
			}
		}
		return false;
	}

	private static int nearestFloor(Level level, int exit, int width) {
		int[][] rings = {
			{ -width, 1, width, -1 },
			{ -width - 1, -width + 1, width - 1, width + 1 },
			{ -2 * width, 2, 2 * width, -2 },
		};
		for (int[] ring : rings) {
			for (int offset : ring) {
				int cell = exit + offset;
				if (cell < 0 || cell >= level.length()) continue;
				if (Math.abs(cell % width - exit % width) > 2) continue;
				if (isFloor(level, cell)) return cell;
			}
		}
		return -1;
	}

	private static boolean isFloor(Level level, int cell) {
		if (cell < 0 || cell >= level.length()) return false;
		int tile = level.map[cell];
		if (!level.passable[cell] || tile == FloorEditor.CHASM) return false;
		if (tile == 7 || tile == 8 || tile == 22 || tile == 37) return false;
		return FloorEditor.trapAt(cell) == null;
	}

	/**
	 * Called before a tap moves the hero. Opens the chest when the hero is next to it or on it.
	 */
	static boolean interceptTap(int cell) {
		if (cell != chestCell || !isHere()) return false;
		Hero hero = Dungeon.hero;
		if (hero == null) return false;
		if (Grid.distance(hero.pos, cell) <= 1) {
			EditorWindow.show(new QuantumChestWindow(0));
			return true;
		}
		int next = besideChest(hero);
		if (next < 0 || !hero.ready) return true;
		if (hero.handle(next)) {
			pendingOpen = true;
			walkStarted = false;
			pendingTime = 0;
			watchWalk();
			hero.next();
		}
		return true;
	}

	/**
	 * The free tile next to the chest that is closest to the hero, or -1 if there is none.
	 */
	private static int besideChest(Hero hero) {
		Level level = Dungeon.level;
		int width = level.width();
		int best = -1;
		int bestDistance = Integer.MAX_VALUE;
		for (int dy = -1; dy <= 1; dy++) {
			for (int dx = -1; dx <= 1; dx++) {
				if (dx == 0 && dy == 0) continue;
				int cell = chestCell + dx + dy * width;
				if (cell < 0 || cell >= level.length() || Math.abs(cell % width - chestCell % width) > 1) continue;
				if (!level.passable[cell] || Actor.findChar(cell) != null && cell != hero.pos) continue;
				int away = Grid.distance(hero.pos, cell);
				if (away < bestDistance) {
					bestDistance = away;
					best = cell;
				}
			}
		}
		return best;
	}

	/**
	 * Moves [item] from the hero's bags into the chest. Returns false when the chest is full.
	 */
	static synchronized boolean store(Item item) {
		Hero hero = Dungeon.hero;
		if (hero == null || item == null) return false;
		List<Item> stored = items();
		Item match = null;
		if (item.stackable) {
			for (Item candidate : stored) {
				if (candidate.isSimilar(item)) {
					match = candidate;
					break;
				}
			}
		}
		if (match == null && stored.size() >= capacity()) return false;
		item.detachAll(hero.belongings.backpack);
		if (match != null) {
			match.quantity(match.quantity() + item.quantity());
		} else {
			stored.add(item);
		}
		Item.updateQuickslot();
		return true;
	}

	/**
	 * Moves [item] from the chest into the hero's bags. Returns false when there is no room.
	 */
	static synchronized boolean take(Item item) {
		Hero hero = Dungeon.hero;
		List<Item> stored = items();
		if (hero == null || !stored.contains(item)) return false;
		stored.remove(item);
		if (item.doPickUp(hero)) return true;
		stored.add(item);
		return false;
	}
}
