package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.scrolls.ScrollOfTeleportation;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.plants.Plant;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Edits the gases, area effects and traps on the current floor.
 */
@SuppressWarnings("unused")
public final class FloorEditor {

	private static final String TAG = "FloorEditor";
	private static final String BLOBS = "com.shatteredpixel.shatteredpixeldungeon.actors.blobs.";
	private static final int EMPTY = 1;
	static final int EMPTY_TILE = EMPTY;
	private static final int SECRET_TRAP = 17;
	private static final int TRAP = 18;
	private static final int INACTIVE_TRAP = 19;
	static final int DOOR = 5;
	static final int OPEN_DOOR = 6;
	static final int LOCKED_DOOR = 10;
	static final int SECRET_DOOR = 16;
	static final int CRYSTAL_DOOR = 31;
	static final int HERO_LOCKED_DOOR = 38;
	private static final int BUTTON_HEIGHT = 16;
	private static final int GAP = 3;

	static final int GASES = 1;
	static final int OTHER = 2;

	static final class Effect {
		final String className;
		final String name;
		final boolean gas;

		Effect(String className, String name, boolean gas) {
			this.className = className;
			this.name = name;
			this.gas = gas;
		}

		@SuppressWarnings("unchecked")
		Class<? extends Blob> type() {
			try {
				return (Class<? extends Blob>) Reflect.require(BLOBS + className);
			} catch (ClassNotFoundException e) {
				return null;
			}
		}
	}

	static final Effect[] EFFECTS = {
		new Effect("ToxicGas", "Toxic gas", true),
		new Effect("CorrosiveGas", "Corrosive gas", true),
		new Effect("ParalyticGas", "Paralytic gas", true),
		new Effect("ConfusionGas", "Confusion gas", true),
		new Effect("StenchGas", "Stench gas", true),
		new Effect("SmokeScreen", "Smoke screen", true),
		new Effect("StormCloud", "Storm cloud", true),
		new Effect("Blizzard", "Blizzard", true),
		new Effect("Inferno", "Inferno", true),
		new Effect("Fire", "Fire", false),
		new Effect("Freezing", "Freezing", false),
		new Effect("Electricity", "Electricity", false),
		new Effect("Web", "Web", false),
		new Effect("Regrowth", "Regrowth", false),
	};

	private static final String[] TRAPS = {
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.AlarmTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.BlazingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.BurningTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.ChillingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.ConfusionTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.CorrosionTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.CursingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.DisarmingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.DisintegrationTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.DistortionTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.ExplosiveTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.FlashingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.FlockTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.FrostTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.GatewayTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.GeyserTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.GnollRockfallTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.GrimTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.GrippingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.GuardianTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.OozeTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.PitfallTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.PoisonDartTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.RockfallTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.ShockingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.StormTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.SummoningTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.TeleportationTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.TenguDartTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.ToxicTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.WarpingTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.WeakeningTrap",
		"com.shatteredpixel.shatteredpixeldungeon.levels.traps.WornDartTrap",
	};


	private static final CatalogTabs<Effect> effectTabs = new CatalogTabs<>();
	private static List<TrapKind> trapKinds;

	private FloorEditor() {
	}

	static Level level() {
		return Dungeon.level;
	}

	static String effectName(Class<?> type) {
		for (Effect effect : EFFECTS) {
			if (effect.className.equals(type.getSimpleName())) return effect.name;
		}
		String name = type.getSimpleName().replaceAll("([a-z])([A-Z])", "$1 $2").toLowerCase();
		return InventoryEditor.capitalize(name);
	}

	/**
	 * The effects in the picker tab [kind]: gases, other effects, or favorites.
	 */
	static List<Effect> effects(int kind) {
		List<Effect> available = effectTabs.tab("available", Arrays.asList(EFFECTS), effect -> effect.type() != null);
		if (kind == GASES) return effectTabs.tab(kind, available, effect -> effect.gas);
		if (kind == OTHER) return effectTabs.tab(kind, available, effect -> !effect.gas);
		return CatalogTabs.live(available, effect -> Favorites.isEffect(effect.className));
	}

	/**
	 * A kind of trap the floor editor can place: its class name and its name, read from the game once.
	 */
	static final class TrapKind {
		final String className;
		final String name;

		TrapKind(String className, String name) {
			this.className = className;
			this.name = name;
		}
	}

	/**
	 * Every trap this version of the game has, by name.
	 */
	static synchronized List<TrapKind> trapKinds() {
		if (trapKinds != null) return trapKinds;
		List<TrapKind> found = new ArrayList<>();
		for (String className : TRAPS) {
			Trap sample = trapSample(className);
			if (sample != null) found.add(new TrapKind(className, trapName(sample)));
		}
		found.sort((a, b) -> a.name.compareToIgnoreCase(b.name));
		trapKinds = Collections.unmodifiableList(found);
		return trapKinds;
	}

	/**
	 * A new trap of [className], placed nowhere, or null when this version of the game has none.
	 */
	@SuppressWarnings("unchecked")
	static Trap trapSample(String className) {
		Class<?> type = Reflect.type(className);
		if (type == null) return null;
		try {
			return ((Class<? extends Trap>) type).getConstructor().newInstance();
		} catch (Throwable e) {
			return null;
		}
	}

	static List<Blob> activeEffects() {
		List<Blob> result = new ArrayList<>();
		Level level = level();
		if (level == null || level.blobs == null) return result;
		for (Blob blob : level.blobs.values()) {
			if (blob != null && blob.volume > 0) result.add(blob);
		}
		return result;
	}

	static int strengthAt(Blob blob, int cell) {
		if (blob.cur == null || cell < 0 || cell >= blob.cur.length) return 0;
		return blob.cur[cell];
	}

	static void clearHere(Blob blob, int cell) {
		blob.clear(cell);
	}

	static void clearAll(Blob blob) {
		blob.fullyClear();
	}

	static void clearAllEffects() {
		for (Blob blob : activeEffects()) blob.fullyClear();
		for (Mob lotus : lotuses()) EnemyEditor.defeat(lotus);
	}

	private static final String LOTUS_CLASS = "com.shatteredpixel.shatteredpixeldungeon.items.wands.WandOfRegrowth$Lotus";

	/**
	 * Lotuses planted by a Wand of Regrowth. Each covers the tiles in its range with falling leaves.
	 */
	static List<Mob> lotuses() {
		List<Mob> result = new ArrayList<>();
		for (Mob mob : creatures()) {
			if (mob.getClass().getName().equals(LOTUS_CLASS)) result.add(mob);
		}
		return result;
	}

	static int lotusRange(Mob lotus) {
		try {
			Field field = Reflect.field(lotus.getClass(), "wandLvl");
			return field.getInt(lotus);
		} catch (Throwable e) {
			return 0;
		}
	}

	static void addEffect(Effect effect, int cell, int amount) {
		Class<? extends Blob> type = effect.type();
		if (type == null || level() == null) return;
		try {
			GameScene.add(Blob.seed(cell, amount, type, level()));
		} catch (Throwable e) {
			Log.e(TAG, "Could not add " + effect.className, e);
		}
	}

	static Trap trapAt(int cell) {
		Level level = level();
		return level == null || level.traps == null ? null : level.traps.get(cell, null);
	}

	static List<Trap> traps() {
		Level level = level();
		if (level == null || level.traps == null) return Collections.emptyList();
		return new ArrayList<>(level.traps.valueList());
	}

	static String trapName(Trap trap) {
		try {
			return InventoryEditor.capitalize(trap.name());
		} catch (Throwable e) {
			return trap.getClass().getSimpleName();
		}
	}

	static void setActive(Trap trap, boolean active) {
		trap.active = active;
		retile(trap);
	}

	static void setVisible(Trap trap, boolean visible) {
		if (visible) {
			trap.reveal();
		} else if (trap.canBeHidden) {
			trap.hide();
		}
		retile(trap);
	}

	static void trigger(Trap trap) {
		try {
			trap.active = true;
			trap.trigger();
		} catch (Throwable e) {
			Log.e(TAG, "Could not trigger " + trap.getClass().getName(), e);
		}
	}

	static boolean canPlaceTrap(int cell) {
		Level level = level();
		return level != null && level.passable != null && cell >= 0 && cell < level.passable.length && level.passable[cell];
	}

	static void placeTrap(String className, int cell, boolean hidden) {
		if (!canPlaceTrap(cell)) return;
		Trap trap = trapSample(className);
		if (trap == null) return;
		try {
			level().setTrap(trap, cell);
			trap.active = true;
			trap.visible = !hidden || !trap.canBeHidden;
			retile(trap);
		} catch (Throwable e) {
			Log.e(TAG, "Could not place " + className, e);
		}
	}

	static void removeTrap(Trap trap) {
		Level level = level();
		if (level == null) return;
		level.traps.remove(trap.pos);
		Level.set(trap.pos, EMPTY);
		GameScene.updateMap(trap.pos);
	}

	static void revealAll() {
		for (Trap trap : traps()) setVisible(trap, true);
	}

	static void hideAll() {
		for (Trap trap : traps()) setVisible(trap, false);
	}

	static void disarmAll() {
		for (Trap trap : traps()) setActive(trap, false);
	}

	static void rearmAll() {
		for (Trap trap : traps()) setActive(trap, true);
	}

	static void removeAllTraps() {
		for (Trap trap : traps()) removeTrap(trap);
	}

	private static void retile(Trap trap) {
		int tile = !trap.active ? INACTIVE_TRAP : trap.visible ? TRAP : SECRET_TRAP;
		Level.set(trap.pos, tile);
		GameScene.updateMap(trap.pos);
	}

	static int tileAt(int cell) {
		Level level = level();
		return level == null || level.map == null ? -1 : level.map[cell];
	}

	static boolean isDoor(int cell) {
		int tile = tileAt(cell);
		return tile == DOOR || tile == OPEN_DOOR || tile == LOCKED_DOOR || tile == SECRET_DOOR || tile == CRYSTAL_DOOR || tile == HERO_LOCKED_DOOR;
	}

	static String doorState(int cell) {
		switch (tileAt(cell)) {
			case OPEN_DOOR: return "Open door";
			case LOCKED_DOOR: return "Locked door";
			case SECRET_DOOR: return "Hidden door";
			case CRYSTAL_DOOR: return "Crystal door";
			case HERO_LOCKED_DOOR: return "Door locked by the skeleton key";
			default: return "Door";
		}
	}

	static void setDoor(int cell, int tile) {
		Level.set(cell, tile);
		GameScene.updateMap(cell);
		Dungeon.observe();
		GameScene.updateFog();
	}

	static final String[] TERRAIN_NAMES = { "Floor", "Wall", "Door", "Water", "Grass", "Tall grass", "Chasm", "Embers", "Barricade" };
	static final int[] TERRAINS = { EMPTY, 4, DOOR, 29, 2, 15, 0, 9, 13 };
	private static final int[] BLOCKING_TERRAINS = { 4, 0, 13 };

	/**
	 * A short name for the tile's current terrain, such as "Water" or "Locked door".
	 */
	static String terrainName(int cell) {
		if (isDoor(cell)) return doorState(cell);
		int tile = tileAt(cell);
		for (int i = 0; i < TERRAINS.length; i++) {
			if (TERRAINS[i] == tile) return TERRAIN_NAMES[i];
		}
		if (tile == SECRET_TRAP || tile == TRAP || tile == INACTIVE_TRAP) return "Trap";
		return null;
	}

	static final int WALL = 4;
	static final int CHASM = 0;

	/**
	 * Removes everything from a tile and turns it into an empty pit.
	 */
	static void deleteTile(int cell) {
		Level level = level();
		if (level == null || hasCharacter(cell)) return;
		try {
			for (Blob blob : activeEffects()) blob.clear(cell);
			Heap heap = level.heaps == null ? null : level.heaps.get(cell, null);
			if (heap != null) heap.destroy();
		} catch (Throwable e) {
			Log.e(TAG, "Could not clear the tile", e);
		}
		setTerrain(cell, CHASM);
	}

	static boolean isBlocking(int terrain) {
		for (int blocking : BLOCKING_TERRAINS) if (blocking == terrain) return true;
		return false;
	}

	static boolean hasCharacter(int cell) {
		return Actor.findChar(cell) != null;
	}

	static void setTerrain(int cell, int terrain) {
		Level level = level();
		if (level == null) return;
		if (isBlocking(terrain) && hasCharacter(cell)) return;
		try {
			if (terrain != EMPTY) {
				Trap trap = trapAt(cell);
				if (trap != null) level.traps.remove(cell);
				if (plantAt(cell) != null) level.uproot(cell);
			}
			Level.set(cell, terrain);
			GameScene.updateMap(cell);
			Dungeon.observe();
			GameScene.updateFog();
		} catch (Throwable e) {
			Log.e(TAG, "Could not change terrain", e);
		}
	}

	static boolean canStandOn(int cell) {
		Level level = level();
		return level != null && level.passable[cell] && !hasCharacter(cell) && tileAt(cell) != 0;
	}

	static void teleportHero(int cell) {
		if (!canStandOn(cell)) return;
		try {
			ScrollOfTeleportation.appear(Dungeon.hero, cell);
			Dungeon.observe();
			GameScene.updateFog();
		} catch (Throwable e) {
			Log.e(TAG, "Could not teleport", e);
		}
	}

	static void spawn(Class<? extends Mob> type, int cell, boolean ally) {
		if (!canStandOn(cell)) return;
		try {
			Mob mob = type.getConstructor().newInstance();
			mob.pos = cell;
			prepare(mob);
			GameScene.add(mob);
			if (ally) EnemyEditor.setAlignment(mob, Char.Alignment.ALLY);
		} catch (Throwable e) {
			Log.e(TAG, "Could not spawn " + type.getName(), e);
		}
	}

	private static final String[] LEVEL_METHODS = { "setLevel", "adjustStats", "spawn" };
	static final int MAX_SPAWN_LEVEL = 30;

	private static int spawnLevel;

	/**
	 * The level that spawned creatures which scale are set to. 0 follows the current floor.
	 */
	static int spawnLevel() {
		return spawnLevel;
	}

	static void spawnLevel(int level) {
		spawnLevel = Math.max(0, Math.min(MAX_SPAWN_LEVEL, level));
	}

	static int effectiveSpawnLevel() {
		return spawnLevel > 0 ? spawnLevel : currentLevel();
	}

	static int currentLevel() {
		try {
			return Math.max(1, Dungeon.scalingDepth());
		} catch (Throwable e) {
			return Math.max(1, Dungeon.depth);
		}
	}

	/**
	 * Whether creatures of [type] keep a level that their stats scale with.
	 */
	static boolean scales(Class<?> type) {
		for (Class<?> current = type; current != null && current != Mob.class; current = current.getSuperclass()) {
			for (String name : LEVEL_METHODS) {
				try {
					Reflect.declaredMethod(current, name, int.class);
					return true;
				} catch (NoSuchMethodException ignored) {
				}
			}
		}
		return false;
	}

	private static void prepare(Mob mob) {
		int depth = currentLevel();
		if (scales(mob.getClass())) callWithLevel(mob, effectiveSpawnLevel(), LEVEL_METHODS);
		if (mob.HT <= 0) mob.HT = 10 + depth * 5;
		if (mob.HP <= 0) mob.HP = mob.HT;
		if (isMimic(mob)) mob.alignment = Char.Alignment.ENEMY;
		mob.state = mob.WANDERING;
	}

	private static void callWithLevel(Mob mob, int level, String... names) {
		for (String name : names) {
			for (Class<?> type = mob.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
				try {
					java.lang.reflect.Method method = Reflect.declaredMethod(type, name, int.class);
					if (java.lang.reflect.Modifier.isStatic(method.getModifiers())) continue;
					method.invoke(mob, level);
					return;
				} catch (NoSuchMethodException ignored) {
				} catch (Throwable e) {
					Log.e(TAG, "Could not set up " + mob.getClass().getName(), e);
					return;
				}
			}
		}
	}

	static boolean isMimic(Char ch) {
		for (Class<?> type = ch.getClass(); type != null; type = type.getSuperclass()) {
			if (type.getName().equals("com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mimic")) return true;
		}
		return false;
	}

	static boolean isHiddenMimic(Char ch) {
		return ch.alignment == Char.Alignment.NEUTRAL && isMimic(ch);
	}

	static Char.Alignment groupOf(Mob mob) {
		return isHiddenMimic(mob) ? Char.Alignment.ENEMY : mob.alignment;
	}

	/**
	 * Drops [item] on [cell] without setting off a trap there. With [keepTrapActive] the trap stays armed,
	 * otherwise it is deactivated.
	 */
	static Heap dropWithoutTrigger(Item item, int cell, boolean keepTrapActive) {
		Trap trap = trapAt(cell);
		boolean armed = trap != null && trap.active;
		if (armed) trap.active = false;
		try {
			return level().drop(item, cell);
		} finally {
			if (armed && keepTrapActive) trap.active = true;
			if (armed && !keepTrapActive) setActive(trap, false);
		}
	}

	static boolean hasActiveTrap(int cell) {
		Trap trap = trapAt(cell);
		return trap != null && trap.active;
	}

	static Plant plantAt(int cell) {
		Level level = level();
		return level == null || level.plants == null ? null : level.plants.get(cell, null);
	}

	static String plantName(Plant plant) {
		try {
			return InventoryEditor.capitalize(plant.name());
		} catch (Throwable e) {
			return plant.getClass().getSimpleName();
		}
	}

	static boolean canPlant(int cell) {
		return canPlaceTrap(cell) && trapAt(cell) == null;
	}

	static void plant(Class<? extends Item> seedType, int cell) {
		if (!canPlant(cell)) return;
		try {
			level().plant((Plant.Seed) seedType.getConstructor().newInstance(), cell);
			GameScene.updateMap(cell);
		} catch (Throwable e) {
			Log.e(TAG, "Could not plant " + seedType.getName(), e);
		}
	}

	static void uproot(int cell) {
		try {
			level().uproot(cell);
			GameScene.updateMap(cell);
		} catch (Throwable e) {
			Log.e(TAG, "Could not remove the plant", e);
		}
	}

	static void revealMap() {
		Level level = level();
		if (level == null) return;
		for (int i = 0; i < level.length(); i++) {
			if (level.discoverable[i]) level.mapped[i] = true;
			if (level.secret[i]) level.discover(i);
		}
		Dungeon.observe();
		GameScene.updateFog();
	}

	static void exploreMap() {
		Level level = level();
		if (level == null) return;
		for (int i = 0; i < level.length(); i++) {
			if (!level.discoverable[i]) continue;
			level.mapped[i] = true;
			level.visited[i] = true;
		}
		Dungeon.observe();
		GameScene.updateFog();
	}

	static void forgetMap() {
		Level level = level();
		if (level == null) return;
		for (int i = 0; i < level.length(); i++) {
			level.mapped[i] = false;
			level.visited[i] = false;
		}
		Dungeon.observe();
		GameScene.updateFog();
	}

	static int countCreatures(Char.Alignment alignment) {
		int count = 0;
		for (Mob mob : creatures()) if (groupOf(mob) == alignment) count++;
		return count;
	}

	static void defeatCreatures(Char.Alignment alignment) {
		for (Mob mob : creatures()) {
			if (groupOf(mob) == alignment) EnemyEditor.defeat(mob);
		}
	}

	private static List<Mob> creatures() {
		Level level = level();
		if (level == null || level.mobs == null) return Collections.emptyList();
		return new ArrayList<>(level.mobs);
	}

	static String trapState(Trap trap) {
		return (trap.visible ? "visible" : "hidden") + " - " + (trap.active ? "active" : "disarmed");
	}

	/**
	 * Adds buttons for the common changes to a tile, trap or pile on the floor, and an Edit button, to its info window when the Floor
	 * editor is on, and Teleport Here when Teleport is on.
	 */
	static void decorateInfo(Window window, Object target) {
		if (!(target instanceof Integer || target instanceof Trap || target instanceof Heap)) return;
		boolean floor = EditorSwitches.floor();
		if ((!floor && !EditorSwitches.teleport()) || Dungeon.hero == null) return;
		int cell = target instanceof Trap ? ((Trap) target).pos : target instanceof Heap ? ((Heap) target).pos : (Integer) target;
		try {
			int width = Reflect.width(window);
			int height = Reflect.height(window);

			float y = height + GAP;
			for (QuickAction[] row : quickActions(target, cell)) {
				if (!floor && !isTeleportRow(row)) continue;
				float buttonWidth = (width - (row.length - 1) * GAP) / (float) row.length;
				for (int i = 0; i < row.length; i++) {
					QuickAction action = row[i];
					com.shatteredpixel.shatteredpixeldungeon.ui.RedButton button = new com.shatteredpixel.shatteredpixeldungeon.ui.RedButton(action.label, action.textSize) {
						@Override
						public void onClick() {
							window.hide();
							try {
								action.run.run();
							} catch (Throwable e) {
								Log.e(TAG, "Could not " + action.label, e);
							}
							if (action.reopens) reopenInfo(target);
						}
					};
					if (action.label.startsWith("Teleport")) button.icon(Teleport.icon());
					button.enable(action.enabled);
					button.setRect(i * (buttonWidth + GAP), y, buttonWidth, BUTTON_HEIGHT);
					window.add(button);
				}
				y += BUTTON_HEIGHT + GAP;
			}
			if (floor && target instanceof Integer && FloorEditSession.isActive()) y = addContentButtons(window, cell, width, y);
			if (y > height + GAP) window.resize(width, (int) (y - GAP));
			if (!floor) return;
			WindowHeader.addEdit(window, () -> {
				window.hide();
				TileWindow.open(cell, () -> reopenInfo(target));
			});
		} catch (Exception e) {
			Log.e(TAG, "Could not add the edit tile button", e);
		}
	}

	/**
	 * In Edit Floor mode, a button for each thing on the tile, opening its own info window.
	 */
	private static float addContentButtons(Window window, int cell, int width, float y) {
		List<Object> contents = new ArrayList<>();
		Char ch = Actor.findChar(cell);
		if (ch != null) contents.add(ch);
		Level level = level();
		Heap heap = level.heaps.get(cell, null);
		if (heap != null) contents.add(heap);
		Plant plant = level.plants.get(cell, null);
		if (plant != null) contents.add(plant);
		Trap trap = level.traps.get(cell, null);
		if (trap != null) contents.add(trap);
		for (Object object : contents) {
			com.shatteredpixel.shatteredpixeldungeon.ui.RedButton button = new com.shatteredpixel.shatteredpixeldungeon.ui.RedButton(contentName(object), 6) {
				@Override
				public void onClick() {
					window.hide();
					GameScene.examineObject(object);
				}
			};
			button.setRect(0, y, width, BUTTON_HEIGHT);
			window.add(button);
			y += BUTTON_HEIGHT + GAP;
		}
		return y;
	}

	private static String contentName(Object object) {
		try {
			if (object instanceof Hero) return "You";
			if (object instanceof Char) return InventoryEditor.capitalize(((Char) object).name());
			if (object instanceof Heap) return InventoryEditor.capitalize(((Heap) object).title());
			if (object instanceof Plant) return InventoryEditor.capitalize(((Plant) object).name());
			if (object instanceof Trap) return InventoryEditor.capitalize(((Trap) object).name());
		} catch (Throwable ignored) {
		}
		return "Unknown";
	}

	private static final class QuickAction {
		final String label;
		final boolean enabled;
		final Runnable run;
		final boolean reopens;
		final int textSize;

		QuickAction(String label, boolean enabled, Runnable run) {
			this(label, enabled, run, true);
		}

		QuickAction(String label, boolean enabled, Runnable run, boolean reopens) {
			this(label, enabled, run, reopens, 6);
		}

		QuickAction(String label, boolean enabled, Runnable run, boolean reopens, int textSize) {
			this.label = label;
			this.enabled = enabled;
			this.run = run;
			this.reopens = reopens;
			this.textSize = textSize;
		}
	}

	private static boolean isWalkable(int cell) {
		Level level = level();
		return level != null && level.passable[cell] && tileAt(cell) != CHASM && Dungeon.hero != null && Dungeon.hero.pos != cell;
	}

	private static boolean isTeleportRow(QuickAction[] row) {
		return row.length == 1 && row[0].label.startsWith("Teleport");
	}

	private static void addTeleport(List<QuickAction[]> rows, int cell) {
		if (EditorSwitches.teleport()) rows.add(new QuickAction[] { teleportAction(cell) });
	}

	private static QuickAction teleportAction(int cell) {
		return new QuickAction("Teleport Here", canStandOn(cell), () -> {
			Trap trap = trapAt(cell);
			if (trap == null || !trap.active) {
				teleportHero(cell);
				return;
			}
			ConfirmPrompt.ask("Active trap", "There is an active " + trapName(trap).toLowerCase() + " here. Teleporting onto it will set it off.", "Teleport", () -> teleportHero(cell));
		}, false, 7);
	}

	private static final int GRASS = 2;
	private static final int HIGH_GRASS = 15;
	private static final int FURROWED_GRASS = 30;
	private static final int BARRICADE = 13;
	private static final int LOCKED_EXIT = 21;
	private static final int UNLOCKED_EXIT = 22;

	private static List<QuickAction[]> quickActions(Object target, int cell) {
		List<QuickAction[]> rows = new ArrayList<>();
		if (target instanceof Heap) {
			Heap heap = (Heap) target;
			rows.add(new QuickAction[] { new QuickAction(heap.size() > 1 ? "Move Pile" : "Move Item", true, () -> FloorItemMover.moveHeap(heap), false) });
			return rows;
		}
		if (target instanceof Trap) {
			Trap trap = (Trap) target;
			rows.add(new QuickAction[] {
				new QuickAction("Activate", !trap.active, () -> setActive(trap, true)),
				new QuickAction("Deactivate", trap.active, () -> setActive(trap, false)),
			});
			if (trap.canBeHidden) {
				rows.add(new QuickAction[] {
					new QuickAction("Hidden", trap.visible, () -> setVisible(trap, false)),
					new QuickAction("Visible", !trap.visible, () -> setVisible(trap, true)),
				});
			}
			addTeleport(rows, cell);
			return rows;
		}

		int tile = tileAt(cell);
		boolean occupied = hasCharacter(cell);
		if (isDoor(cell) && tile != SECRET_DOOR) {
			boolean locked = tile == LOCKED_DOOR || tile == HERO_LOCKED_DOOR || tile == CRYSTAL_DOOR;
			rows.add(new QuickAction[] {
				new QuickAction("Open", tile != OPEN_DOOR, () -> setDoor(cell, OPEN_DOOR)),
				new QuickAction("Close", tile != DOOR && !occupied, () -> setDoor(cell, DOOR)),
				new QuickAction("Lock", !locked && !occupied, () -> setDoor(cell, LOCKED_DOOR)),
				new QuickAction("Unlock", locked, () -> setDoor(cell, DOOR)),
			});
			if (tile == OPEN_DOOR) addTeleport(rows, cell);
			return rows;
		}
		if (tile == GRASS || tile == HIGH_GRASS || tile == FURROWED_GRASS) {
			rows.add(new QuickAction[] {
				new QuickAction("Unfurrowed", tile != HIGH_GRASS && !occupied, () -> setDoor(cell, HIGH_GRASS)),
				new QuickAction("Furrowed", tile != FURROWED_GRASS && !occupied, () -> setDoor(cell, FURROWED_GRASS)),
				new QuickAction("Trampled", tile != GRASS, () -> setDoor(cell, GRASS)),
			});
			addTeleport(rows, cell);
			return rows;
		}
		if (tile == LOCKED_EXIT || tile == UNLOCKED_EXIT) {
			rows.add(new QuickAction[] {
				new QuickAction("Lock", tile != LOCKED_EXIT, () -> setDoor(cell, LOCKED_EXIT)),
				new QuickAction("Unlock", tile != UNLOCKED_EXIT, () -> setDoor(cell, UNLOCKED_EXIT)),
			});
			if (tile == UNLOCKED_EXIT) addTeleport(rows, cell);
			return rows;
		}
		if (tile == CHASM) {
			rows.add(new QuickAction[] { new QuickAction("Fill In", true, () -> setDoor(cell, EMPTY)) });
			return rows;
		}
		if (tile == BARRICADE) {
			rows.add(new QuickAction[] { new QuickAction("Break", true, () -> setDoor(cell, EMPTY)) });
		}
		if (isWalkable(cell)) addTeleport(rows, cell);
		return rows;
	}

	private static void reopenInfo(Object target) {
		try {
			if (target instanceof Heap) {
				Heap heap = (Heap) target;
				Level level = level();
				if (level != null && level.heaps.get(heap.pos, null) == heap && !heap.isEmpty()) {
					EditorWindow.show(new com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoItem(heap));
					return;
				}
				EditorWindow.show(new com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoCell(heap.pos));
				return;
			}
			if (target instanceof Trap) {
				Trap trap = (Trap) target;
				if (trapAt(trap.pos) == trap) {
					EditorWindow.show(new com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoTrap(trap));
					return;
				}
				EditorWindow.show(new com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoCell(trap.pos));
				return;
			}
			EditorWindow.show(new com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoCell((Integer) target));
		} catch (Throwable e) {
			Log.e(TAG, "Could not reopen the tile info", e);
		}
	}
}
