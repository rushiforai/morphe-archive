package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.SPDSettings;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Fire;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Freezing;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroAction;
import com.shatteredpixel.shatteredpixeldungeon.items.KindOfWeapon;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.Weapon;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.enchantments.Blazing;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.enchantments.Blooming;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.enchantments.Chilling;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.enchantments.Shocking;
import com.shatteredpixel.shatteredpixeldungeon.effects.Lightning;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.scenes.CellSelector;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Scene;
import com.watabou.noosa.audio.Sample;
import com.watabou.noosa.ui.Component;
import com.watabou.utils.PathFinder;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * The Attack Tile button: attack any tile in reach of your weapon, including a creature that is hiding, such as a
 * mimic, or an empty tile.
 */
@SuppressWarnings("unused")
public final class ForceAttack {

	private static final String LOG_TAG = "ForceAttack";
	private static final int TILE_SIZE = 16;
	private static final int MARKER_SIZE = 10;
	private static final int MARKER_COLOR = 0xFFE06A5A;
	private static final String MISS_SOUND = "sounds/miss.mp3";
	private static final String LIGHTNING_SOUND = "sounds/lightning.mp3";
	private static final Random random = new Random();

	static final TagPlacement PLACEMENT = new TagPlacement("qol_attack_tag", TagPlacement.Side.LEFT, 0.5f, 1, IconCatalog.WEAPON, 0, TagPlacement.DEFAULT_COLOR, true).defaultOffset(com.shatteredpixel.shatteredpixeldungeon.ui.Tag.SIZE).defaultOpacity(70);

	/**
	 * The Attack Tile tag. Tapping it chooses a tile to attack.
	 */
	static final ScreenTag TAG = new ScreenTag("Attack Tile", PLACEMENT, () -> true, tag -> choose())
		.enabledWhen(ForceAttack::isOn)
		.removable("Remove the Attack Tile tag? This switches Attack Tile off. Switch it back on in Extras, under Toolbar.", () -> ForceAttack.setOn(false));

	private static final List<Gizmo> markers = new ArrayList<>();

	private ForceAttack() {
	}

	static boolean isOn() {
		return QolSettings.forceAttack();
	}

	static void setOn(boolean on) {
		QolSettings.forceAttack(on);
		TAG.refresh();
	}

	/**
	 * Called at the end of GameScene.layoutTags. Puts the Attack Tile button just above the toolbar while it keeps its automatic place.
	 */
	static void afterLayoutTags() {
		IconTag current = TAG.view();
		if (current == null || !current.visible || !PLACEMENT.isAuto()) return;
		try {
			Object scene = Reflect.getStatic(GameScene.class, "scene");
			if (scene == null) return;

			boolean onLeft = SPDSettings.flipTags();
			float inset = sideInset(onLeft);
			float width = PLACEMENT.tagWidth() + inset;
			float height = PLACEMENT.tagHeight();
			float left = onLeft ? 0 : PixelScene.uiCamera.width - width;
			Component base = (Component) field(scene, onLeft && SPDSettings.interfaceSize() > 0 ? "status" : "toolbar");
			float bottom = base.top();

			current.onTop(false);
			current.setRect(left, bottom - height, width, height);
			current.flip(onLeft);
			current.style(PLACEMENT);

		} catch (Throwable e) {
			Log.e(LOG_TAG, "Could not place the Attack Tile button", e);
		}
	}

	private static Object field(Object scene, String name) throws ReflectiveOperationException {
		return Reflect.get(GameScene.class, scene, name);
	}


	private static float sideInset(boolean left) {
		return ScreenLayout.insets()[left ? 0 : 2];
	}


	private static KindOfWeapon weapon(Hero hero) {
		try {
			return hero.belongings.attackingWeapon();
		} catch (Throwable e) {
			return null;
		}
	}

	private static boolean inReach(Hero hero, Level level, int cell) {
		if (cell < 0 || cell >= level.length() || cell == hero.pos) return false;
		if (!hero.fieldOfView[cell]) return false;
		Char ch = Actor.findChar(cell);
		if (level.pit[cell] && ch == null) return false;
		if (level.adjacent(hero.pos, cell)) return true;
		KindOfWeapon weapon = weapon(hero);
		return weapon != null && weapon.canReach(hero, cell);
	}

	private static List<Integer> reachableCells(Hero hero, Level level) {
		List<Integer> cells = new ArrayList<>();
		KindOfWeapon weapon = weapon(hero);
		int reach = Math.max(1, weapon == null ? 1 : weapon.reachFactor(hero));
		int width = level.width();
		int x = hero.pos % width;
		int y = hero.pos / width;
		for (int dy = -reach; dy <= reach; dy++) {
			for (int dx = -reach; dx <= reach; dx++) {
				int cx = x + dx;
				int cy = y + dy;
				if (cx < 0 || cx >= width || cy < 0) continue;
				int cell = cy * width + cx;
				if (inReach(hero, level, cell)) cells.add(cell);
			}
		}
		return cells;
	}

	private static CellSelector.Listener activeListener;

	private static boolean isSelecting() {
		return activeListener != null && Reflect.cellListener() == activeListener;
	}

	private static void choose() {
		if (isSelecting()) {
			GameScene.cancelCellSelector();
			clearMarkers();
			activeListener = null;
			return;
		}
		Hero hero = Dungeon.hero;
		Level level = Dungeon.level;
		if (hero == null || level == null || !hero.isAlive() || !hero.ready) return;
		PathPreview.clear();
		List<Integer> cells = reachableCells(hero, level);
		if (cells.isEmpty()) {
			GLog.w("There is nothing in reach to attack.");
			return;
		}
		showMarkers(cells, level.width());
		activeListener = CellPicker.pick("Choose a tile to attack", cell -> {
			endChoosing();
			attack(cell);
		}, ForceAttack::endChoosing);
	}

	private static void endChoosing() {
		activeListener = null;
		clearMarkers();
	}

	private static void attack(int cell) {
		Hero hero = Dungeon.hero;
		Level level = Dungeon.level;
		if (hero == null || level == null || !hero.isAlive() || !hero.ready) return;
		if (!inReach(hero, level, cell)) {
			GLog.w("That tile is out of reach.");
			return;
		}
		try {
			Char ch = Actor.findChar(cell);
			if (ch != null && ch != hero && ch.invisible == 0 && hero.canAttack(ch)) {
				hero.curAction = new HeroAction.Attack(ch);
				hero.next();
				return;
			}
			swingAt(hero, cell);
		} catch (Throwable e) {
			Log.e(LOG_TAG, "Could not attack tile " + cell, e);
		}
	}

	private static void swingAt(Hero hero, int cell) {
		hero.curAction = null;
		hero.busy();
		hero.sprite.attack(cell, () -> {
			try {
				Sample.INSTANCE.play(MISS_SOUND);
				if (QolSettings.forceAttackEnchants()) applyEnchantment(hero, cell);
			} catch (Throwable e) {
				Log.e(LOG_TAG, "Could not apply the enchantment to tile " + cell, e);
			}
			hero.spendAndNext(hero.attackDelay());
		});
	}

	private static void applyEnchantment(Hero hero, int cell) throws ReflectiveOperationException {
		KindOfWeapon kind = weapon(hero);
		if (!(kind instanceof Weapon)) return;
		Weapon weapon = (Weapon) kind;
		Weapon.Enchantment enchantment = weapon.enchantment;
		if (enchantment == null) return;
		int level = Math.max(0, weapon.buffedLvl());
		if (enchantment instanceof Blazing) {
			if (!procs((level + 1f) / (level + 3f), hero)) return;
			GameScene.add(Blob.seed(cell, 2, Fire.class, Dungeon.level));
		} else if (enchantment instanceof Chilling) {
			if (!procs((level + 1f) / (level + 4f), hero)) return;
			Freezing.affect(cell);
		} else if (enchantment instanceof Blooming) {
			if (!procs((level + 1f) / (level + 3f), hero)) return;
			Reflect.method(Blooming.class, "plantGrass", int.class).invoke(enchantment, cell);
		} else if (enchantment instanceof Shocking) {
			float chance = (1 / 3f) * Weapon.Enchantment.genericProcChanceMultiplier(hero);
			if (random.nextFloat() >= chance) return;
			shock(hero, cell, enchantment, Math.max(1f, chance));
		}
	}

	private static void shock(Hero hero, int cell, Weapon.Enchantment enchantment, float powerMulti) {
		Level level = Dungeon.level;
		boolean[] open = new boolean[level.length()];
		for (int i = 0; i < open.length; i++) open[i] = !level.solid[i];
		PathFinder.buildDistanceMap(cell, open, 2);

		ArrayList<Char> affected = new ArrayList<>();
		ArrayList<Lightning.Arc> arcs = new ArrayList<>();
		List<Char> first = new ArrayList<>();
		for (int i = 0; i < PathFinder.distance.length; i++) {
			if (PathFinder.distance[i] == Integer.MAX_VALUE) continue;
			Char ch = Actor.findChar(i);
			if (ch != null && ch != hero && !affected.contains(ch)) first.add(ch);
		}
		affected.addAll(first);
		for (Char ch : first) {
			arcs.add(new Lightning.Arc(cell, ch.pos));
			Shocking.arc(hero, ch, level.water[ch.pos] && !ch.flying ? 2 : 1, affected, arcs);
		}

		int damage = Math.round(hero.damageRoll() * 0.5f * powerMulti);
		for (Char ch : affected) {
			if (ch.alignment != hero.alignment && ch.isAlive()) ch.damage(damage, enchantment);
		}
		if (arcs.isEmpty()) arcs.add(new Lightning.Arc(hero.pos, cell));
		hero.sprite.parent.addToFront(new Lightning(arcs, null));
		Sample.INSTANCE.play(LIGHTNING_SOUND);
	}

	private static boolean procs(float chance, Hero hero) {
		return random.nextFloat() < chance * Weapon.Enchantment.genericProcChanceMultiplier(hero);
	}

	private static void showMarkers(List<Integer> cells, int width) {
		clearMarkers();
		Scene scene = Game.scene();
		if (scene == null) return;
		for (int cell : cells) {
			ColorBlock block = new ColorBlock(MARKER_SIZE, MARKER_SIZE, MARKER_COLOR);
			block.x = (cell % width) * TILE_SIZE + (TILE_SIZE - MARKER_SIZE) / 2f;
			block.y = (cell / width) * TILE_SIZE + (TILE_SIZE - MARKER_SIZE) / 2f;
			block.alpha(0.6f);
			scene.add(block);
			markers.add(block);
		}
	}

	private static void clearMarkers() {
		for (Gizmo gizmo : markers) {
			gizmo.killAndErase();
			gizmo.destroy();
		}
		markers.clear();
	}
}
