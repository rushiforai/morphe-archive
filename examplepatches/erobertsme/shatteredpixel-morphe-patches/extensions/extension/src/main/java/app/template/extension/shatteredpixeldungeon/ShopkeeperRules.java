package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs.Shopkeeper;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.missiles.MissileWeapon;
import com.shatteredpixel.shatteredpixeldungeon.messages.Messages;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.shatteredpixel.shatteredpixeldungeon.items.scrolls.ScrollOfTeleportation;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.watabou.noosa.Game;
import com.watabou.utils.Bundle;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * The Shopkeeper options in the QoL enhancements patch: banishing enemies from the shop, staying put through
 * fights, area effects and attacks, a lenient three strikes rule, and how many sold items can be bought back.
 */
@SuppressWarnings("unused")
public final class ShopkeeperRules {

	private static final String TAG = "ShopkeeperRules";
	private static final String KEY_BANISH = "shop_banish";
	private static final String KEY_FEARLESS_OFF = "qol_fearless_shopkeeper_off";
	private static final String KEY_IMMUNE_OFF = "shop_immune_off";
	private static final String KEY_PASSIVE_OFF = "shop_passive_off";
	private static final String KEY_LENIENT = "shop_lenient";
	private static final String KEY_SOLD_ITEMS = "shop_sold_items";
	private static final String KEY_SOLD_ITEMS_SET = "shop_sold_items_set";
	private static final String BUNDLE_STRIKES = "morphe_shop_strikes";
	private static final String BUNDLE_BANNED = "morphe_shop_banned";

	static final int DEFAULT_SOLD_ITEMS = 3;
	static final int MAX_SOLD_ITEMS = 24;
	private static final float BANISH_TURNS = 20f;
	private static final float AREA_REMARK_TURNS = 8f;
	private static final float REMARK_TURNS = 1f;
	private static final int MAX_SHOP_CELLS = 300;

	private static final String[] FIRE = { "Fire", "Inferno" };
	private static final String[] COLD = { "Freezing", "Blizzard" };
	private static final String[] HARMFUL = {
		"Fire", "Inferno", "Freezing", "Blizzard", "ToxicGas", "CorrosiveGas", "ParalyticGas", "ConfusionGas", "StenchGas", "Electricity", "SmokeScreen",
	};
	private static final String[] GAS_REMARKS = { "What's that smell?", "Does anyone else smell that?" };

	private static final Map<Object, State> states = Collections.synchronizedMap(new WeakHashMap<>());
	private static final Map<Object, Float> banishedUntil = Collections.synchronizedMap(new WeakHashMap<>());
	private static final Random random = new Random();

	private static java.lang.ref.WeakReference<Heap> tradeHeap;
	private static Level regionLevel;
	private static int regionShopPos = -1;
	private static Region region;

	private enum Harm { AREA, PLAYER, FIGHT }

	private static final class State {
		int strikes;
		boolean banned;
		boolean ejectPending;
		boolean theftPending;
		float lastStrike = -100;
		float lastPlayerHarm = -100;
		final List<Item> forSale = new ArrayList<>();
		final Map<String, Float> lastRemark = new HashMap<>();
	}

	private static final class Region {
		final Set<Integer> cells = new HashSet<>();
		final List<Integer> doors = new ArrayList<>();
	}

	private ShopkeeperRules() {
	}

	static boolean isAvailable() {
		return QolSettings.isAvailable();
	}

	static boolean banish() {
		return isAvailable() && CloverlordSettings.get(KEY_BANISH);
	}

	static void banish(boolean on) {
		CloverlordSettings.set(KEY_BANISH, on);
	}

	static boolean fearless() {
		return isAvailable() && !CloverlordSettings.get(KEY_FEARLESS_OFF);
	}

	static void fearless(boolean on) {
		CloverlordSettings.set(KEY_FEARLESS_OFF, !on);
	}

	static boolean immune() {
		return isAvailable() && !CloverlordSettings.get(KEY_IMMUNE_OFF);
	}

	static void immune(boolean on) {
		CloverlordSettings.set(KEY_IMMUNE_OFF, !on);
	}

	static boolean passive() {
		return isAvailable() && !CloverlordSettings.get(KEY_PASSIVE_OFF);
	}

	static void passive(boolean on) {
		CloverlordSettings.set(KEY_PASSIVE_OFF, !on);
		if (on) CloverlordSettings.set(KEY_LENIENT, false);
	}

	static boolean lenient() {
		return isAvailable() && CloverlordSettings.get(KEY_LENIENT);
	}

	static void lenient(boolean on) {
		CloverlordSettings.set(KEY_LENIENT, on);
		if (on) CloverlordSettings.set(KEY_PASSIVE_OFF, true);
	}

	static int soldItems() {
		if (!CloverlordSettings.get(KEY_SOLD_ITEMS_SET)) return DEFAULT_SOLD_ITEMS;
		return CloverlordSettings.getInt(KEY_SOLD_ITEMS);
	}

	static void soldItems(int value) {
		CloverlordSettings.setInt(KEY_SOLD_ITEMS, Math.max(0, Math.min(MAX_SOLD_ITEMS, value)));
		CloverlordSettings.set(KEY_SOLD_ITEMS_SET, true);
		applySoldItems();
	}

	private static Object soldItemsLevel;

	/**
	 * How many of the most recently sold items can be bought back.
	 */
	static int buybackLimit() {
		applySoldItems();
		return soldItems();
	}

	/**
	 * Stops the game dropping old sold items, so a shop's save keeps everything sold there and raising the Sold Items setting later
	 * brings older items back. The shop window only offers the most recent ones.
	 */
	static void applySoldItems() {
		if (!isAvailable()) return;
		try {
			Shopkeeper.MAX_BUYBACK_HISTORY = Integer.MAX_VALUE;
		} catch (Throwable e) {
			Log.e(TAG, "Could not set the buyback history", e);
		}
	}

	private static State state(Object shopkeeper) {
		synchronized (states) {
			State state = states.get(shopkeeper);
			if (state == null) {
				state = new State();
				states.put(shopkeeper, state);
			}
			return state;
		}
	}

	/**
	 * Called at the start of Shopkeeper.damage. Returns true when the harm was handled and the shopkeeper stays.
	 */
	public static boolean onDamage(Object shopkeeper, Object source) {
		try {
			if (!isAvailable() || !(shopkeeper instanceof Mob)) return false;
			Mob mob = (Mob) shopkeeper;
			Harm harm = classify(mob, source);
			if (harm == Harm.PLAYER) return handlePlayer(mob, thrownWeapon(source));
			return handle(mob, harm, areaName(mob, source));
		} catch (Throwable e) {
			Log.e(TAG, "Could not handle harm to the shopkeeper", e);
			return false;
		}
	}

	/**
	 * Called at the start of Shopkeeper.add. Returns true when a harmful status was handled and the shopkeeper stays.
	 */
	public static boolean onBuff(Object shopkeeper, Object buff) {
		try {
			if (!isAvailable() || !(shopkeeper instanceof Mob) || !(buff instanceof Buff)) return false;
			if (((Buff) buff).type != Buff.buffType.NEGATIVE) return false;
			Mob mob = (Mob) shopkeeper;
			String area = areaName(mob, null);
			if (area != null) return handle(mob, Harm.AREA, area);
			if (Actor.now() - state(mob).lastPlayerHarm < 1) return passive() || lenient();
			return handle(mob, Harm.FIGHT, null);
		} catch (Throwable e) {
			Log.e(TAG, "Could not handle a status on the shopkeeper", e);
			return false;
		}
	}

	private static Harm classify(Mob shopkeeper, Object source) {
		if (source instanceof Blob) return Harm.AREA;
		if (source != null && source == Dungeon.hero) return Harm.PLAYER;
		if (source instanceof Item) return Harm.PLAYER;
		if (source instanceof Char) return Harm.FIGHT;
		return areaName(shopkeeper, source) != null ? Harm.AREA : Harm.FIGHT;
	}

	private static MissileWeapon thrownWeapon(Object source) {
		Hero hero = Dungeon.hero;
		if (source != hero || hero == null || hero.belongings == null) return null;
		if (!(hero.belongings.thrownWeapon instanceof MissileWeapon)) return null;
		MissileWeapon weapon = (MissileWeapon) hero.belongings.thrownWeapon;
		return weapon.spawnedForEffect ? null : weapon;
	}

	private static String areaName(Mob shopkeeper, Object source) {
		if (source instanceof Blob) return source.getClass().getSimpleName();
		for (Blob blob : FloorEditor.activeEffects()) {
			if (FloorEditor.strengthAt(blob, shopkeeper.pos) <= 0) continue;
			String name = blob.getClass().getSimpleName();
			if (contains(HARMFUL, name)) return name;
		}
		return null;
	}

	private static boolean handlePlayer(Mob shopkeeper, MissileWeapon thrown) {
		if (!passive() && !lenient()) return false;
		State state = state(shopkeeper);
		state.lastPlayerHarm = Actor.now();
		if (thrown != null) state.forSale.add(thrown);
		if (!heroInShop(shopkeeper)) {
			remark(shopkeeper, "outside", REMARK_TURNS, "What the hell was that?");
			return true;
		}
		if (passive()) {
			remark(shopkeeper, "passive", REMARK_TURNS, thrown != null ? "Ooh. Free item!" : "Was that supposed to hurt?");
			return true;
		}
		strike(shopkeeper);
		return true;
	}

	private static boolean handle(Mob shopkeeper, Harm harm, String area) {
		if (harm == Harm.AREA) {
			if (!immune()) return false;
			if (heroInShop(shopkeeper)) remark(shopkeeper, "area_" + areaKind(area), AREA_REMARK_TURNS, areaRemark(area));
			return true;
		}
		if (!fearless()) return false;
		remark(shopkeeper, "fearless", REMARK_TURNS, "C'mon... Really?");
		return true;
	}

	private static boolean heroInShop(Mob shopkeeper) {
		Hero hero = Dungeon.hero;
		Region shop = region(shopkeeper);
		if (hero == null || shop == null) return false;
		return shop.cells.contains(hero.pos) || shop.doors.contains(hero.pos);
	}

	private static String areaKind(String area) {
		if (area == null) return "gas";
		if (contains(FIRE, area)) return "fire";
		if (contains(COLD, area)) return "cold";
		return "gas";
	}

	private static String areaRemark(String area) {
		String kind = areaKind(area);
		if (kind.equals("fire")) return "It's kinda warm in here.";
		if (kind.equals("cold")) return "It's kinda cold in here.";
		return GAS_REMARKS[random.nextInt(GAS_REMARKS.length)];
	}

	private static void remark(Mob shopkeeper, String key, float every, String text) {
		State state = state(shopkeeper);
		float now = Actor.now();
		Float last = state.lastRemark.get(key);
		if (last != null && now - last < every) return;
		state.lastRemark.put(key, now);
		yell(shopkeeper, text);
	}

	private static void yell(Mob shopkeeper, String text) {
		try {
			Level level = Dungeon.level;
			if (level != null && level.heroFOV != null && !level.heroFOV[shopkeeper.pos]) return;
			shopkeeper.yell(text);
		} catch (Throwable e) {
			Log.e(TAG, "Could not speak", e);
		}
	}

	private static void strike(Mob shopkeeper) {
		State state = state(shopkeeper);
		float now = Actor.now();
		if (now - state.lastStrike < 1) return;
		state.lastStrike = now;
		state.strikes++;
		if (state.strikes == 1) {
			yell(shopkeeper, "Hey! Knock it off!");
			return;
		}
		if (state.strikes == 2) {
			yell(shopkeeper, "I'm warning you...");
			return;
		}
		yell(shopkeeper, "Fine! No shop for you!");
		state.banned = true;
		state.ejectPending = true;
	}

	/**
	 * Called at the start of Shopkeeper.act.
	 */
	public static void onAct(Object shopkeeper) {
		if (!isAvailable() || !(shopkeeper instanceof Mob)) return;
		if (Dungeon.level != soldItemsLevel) {
			soldItemsLevel = Dungeon.level;
			applySoldItems();
		}
		try {
			Mob mob = (Mob) shopkeeper;
			Region shop = region(mob);
			if (shop == null) return;
			stockThrownItems(mob, shop);
			ejectHero(mob, shop);
			if (banish()) banishEnemies(mob, shop);
		} catch (Throwable e) {
			Log.e(TAG, "Could not look after the shop", e);
		}
	}

	private static void ejectHero(Mob shopkeeper, Region shop) {
		State state = state(shopkeeper);
		Hero hero = Dungeon.hero;
		if (hero == null || !hero.isAlive()) return;
		boolean inside = shop.cells.contains(hero.pos);
		boolean walkedIn = state.banned && !state.ejectPending && inside;
		if (!state.ejectPending && !walkedIn) return;
		state.ejectPending = false;
		if (!inside) return;
		int outside = outsideCell(shop);
		if (outside < 0) return;
		hero.interrupt();
		ScrollOfTeleportation.appear(hero, outside);
		Dungeon.observe();
		GameScene.updateFog();
		if (walkedIn) Game.runOnRenderThread(() -> showApology(shopkeeper));
	}

	private static void banishEnemies(Mob shopkeeper, Region shop) {
		Level level = Dungeon.level;
		boolean spoke = false;
		for (Mob mob : new ArrayList<>(level.mobs)) {
			if (mob == shopkeeper || mob.alignment != Char.Alignment.ENEMY || !mob.isAlive()) continue;
			if (!shop.cells.contains(mob.pos)) continue;
			int outside = outsideCell(shop);
			if (outside < 0) return;
			if (!spoke) {
				if (level.heroFOV != null && level.heroFOV[shopkeeper.pos]) {
					shopkeeper.yell("Hey! Get out of here!");
				} else {
					GLog.i("You hear an odd booming sound in the distance.");
				}
				spoke = true;
			}
			ScrollOfTeleportation.appear(mob, outside);
			banishedUntil.put(mob, Actor.now() + BANISH_TURNS);
		}
	}

	/**
	 * Puts weapons the hero threw at the shopkeeper up for sale. A thrown weapon lands at the shopkeeper's feet, or
	 * breaks; a broken one is skipped.
	 */
	private static void stockThrownItems(Mob shopkeeper, Region shop) {
		State state = state(shopkeeper);
		if (state.forSale.isEmpty()) return;
		Level level = Dungeon.level;
		List<Item> items = new ArrayList<>(state.forSale);
		state.forSale.clear();
		for (Item item : items) {
			Heap from = heapHolding(level, item);
			if (from == null) continue;
			int cell = saleCell(level, shopkeeper, shop);
			if (cell < 0) return;
			from.items.remove(item);
			if (from.isEmpty()) {
				from.destroy();
			} else if (from.sprite != null) {
				from.sprite.view(from);
			}
			Heap heap = level.drop(item, cell);
			if (heap == null) continue;
			heap.type = Heap.Type.FOR_SALE;
			if (heap.sprite != null) heap.sprite.view(heap);
		}
	}

	private static Heap heapHolding(Level level, Item item) {
		if (level.heaps == null) return null;
		for (Heap heap : level.heaps.valueList()) {
			if (heap.items != null && heap.items.contains(item)) return heap;
		}
		return null;
	}

	private static int saleCell(Level level, Mob shopkeeper, Region shop) {
		int width = level.width();
		int best = -1;
		int bestDistance = Integer.MAX_VALUE;
		for (int cell : shop.cells) {
			if (cell == shopkeeper.pos || !level.passable[cell] || Actor.findChar(cell) != null) continue;
			if (level.heaps.get(cell, null) != null || FloorEditor.trapAt(cell) != null) continue;
			int distance = Grid.distance(cell, shopkeeper.pos, width);
			if (distance >= bestDistance) continue;
			best = cell;
			bestDistance = distance;
		}
		return best;
	}

	/**
	 * Called at the start of the WndTradeItem constructor for an item in the shop.
	 */
	public static void onTradeWindow(Object heap) {
		if (heap instanceof Heap) tradeHeap = new java.lang.ref.WeakReference<>((Heap) heap);
	}

	/**
	 * Called at the start of Mob.yell. Returns true to stay quiet: a Passive or Lenient shopkeeper has his own words
	 * when he catches a thief.
	 */
	public static boolean onYell(Object mob, String text) {
		try {
			if (!(mob instanceof Shopkeeper) || text == null) return false;
			if (!passive() && !lenient()) return false;
			if (!text.equals(Messages.get(mob, "thief"))) return false;
			state(mob).theftPending = true;
			return true;
		} catch (Throwable e) {
			return false;
		}
	}

	/**
	 * Called at the start of Shopkeeper.flee. Returns true to keep the shopkeeper and the shop.
	 */
	public static boolean onFlee(Object shopkeeper) {
		try {
			if (!isAvailable() || !(shopkeeper instanceof Mob)) return false;
			Mob mob = (Mob) shopkeeper;
			State state = state(mob);
			if (state.theftPending) {
				state.theftPending = false;
				caughtStealing(mob);
				return true;
			}
			return fearless() && ascending();
		} catch (Throwable e) {
			Log.e(TAG, "Could not keep the shopkeeper", e);
			return false;
		}
	}

	private static boolean ascending() {
		Hero hero = Dungeon.hero;
		if (hero == null) return false;
		for (Buff buff : hero.buffs()) {
			if (buff.getClass().getSimpleName().equals("AscensionChallenge")) return true;
		}
		return false;
	}

	private static void caughtStealing(Mob shopkeeper) {
		if (passive()) {
			yell(shopkeeper, "I saw that, you know. Rude.");
			return;
		}
		yell(shopkeeper, "Pay for that or get out!");
		Heap heap = tradeHeap == null ? null : tradeHeap.get();
		Level level = Dungeon.level;
		if (heap == null || heap.isEmpty() || level == null || level.heaps.get(heap.pos, null) != heap) {
			banishHero(shopkeeper);
			return;
		}
		EditorWindow.show(new TheftWindow(shopkeeper, heap));
	}

	/**
	 * Throws the hero out of the shop and bans them until they apologize.
	 */
	static void banishHero(Mob shopkeeper) {
		State state = state(shopkeeper);
		state.banned = true;
		state.ejectPending = false;
		Region shop = region(shopkeeper);
		Hero hero = Dungeon.hero;
		if (shop == null || hero == null || !shop.cells.contains(hero.pos)) return;
		int outside = outsideCell(shop);
		if (outside < 0) return;
		ScrollOfTeleportation.appear(hero, outside);
		Dungeon.observe();
		GameScene.updateFog();
	}

	/**
	 * Called at the start of Shopkeeper.interact. Returns true when the shop window was shown instead of the game's.
	 */
	public static boolean onInteract(Object shopkeeper, Object character) {
		if (!isAvailable() || !(shopkeeper instanceof Shopkeeper) || character == null || character != Dungeon.hero) return false;
		Game.runOnRenderThread(() -> EditorWindow.show(new ShopWindow((Shopkeeper) shopkeeper, 0)));
		return true;
	}

	/**
	 * Called at the start of Mob.getCloser. Returns true to stop a banished enemy heading back into the shop.
	 */
	public static boolean blockStep(Object mob, int target) {
		if (banishedUntil.isEmpty() || !banish()) return false;
		Float until = banishedUntil.get(mob);
		if (until == null) return false;
		if (until < Actor.now()) {
			banishedUntil.remove(mob);
			return false;
		}
		Mob shopkeeper = findShopkeeper();
		if (shopkeeper == null) return false;
		Region shop = region(shopkeeper);
		return shop != null && shop.cells.contains(target);
	}

	/**
	 * Called before a tap moves the hero. Returns true when the hero is banned from the shop and the tap would
	 * walk into it, after asking for an apology instead.
	 */
	static boolean interceptTap(int cell) {
		if (!lenient()) return false;
		Mob shopkeeper = findShopkeeper();
		Hero hero = Dungeon.hero;
		if (shopkeeper == null || hero == null) return false;
		State state = states.get(shopkeeper);
		if (state == null || !state.banned) return false;
		Region shop = region(shopkeeper);
		if (shop == null || !shop.cells.contains(cell) || shop.cells.contains(hero.pos)) return false;
		showApology(shopkeeper);
		return true;
	}

	private static void showApology(Mob shopkeeper) {
		EditorWindow.show(new ApologyWindow(shopkeeper));
	}

	static void forgive(Mob shopkeeper) {
		State state = state(shopkeeper);
		state.banned = false;
		state.strikes = 0;
		state.ejectPending = false;
		yell(shopkeeper, "Apology accepted. Come on in.");
	}

	/**
	 * Called at the start of Shopkeeper.storeInBundle.
	 */
	public static void onStore(Object shopkeeper, Bundle bundle) {
		State state = states.get(shopkeeper);
		if (state == null || bundle == null) return;
		bundle.put(BUNDLE_STRIKES, state.strikes);
		bundle.put(BUNDLE_BANNED, state.banned);
	}

	/**
	 * Called at the start of Shopkeeper.restoreFromBundle.
	 */
	public static void onRestore(Object shopkeeper, Bundle bundle) {
		try {
			if (bundle == null) return;
			int strikes = bundle.getInt(BUNDLE_STRIKES);
			boolean banned = bundle.getBoolean(BUNDLE_BANNED);
			if (strikes == 0 && !banned) return;
			State state = state(shopkeeper);
			state.strikes = strikes;
			state.banned = banned;
		} catch (Throwable e) {
			Log.e(TAG, "Could not read the shopkeeper's mood", e);
		}
	}

	private static Mob findShopkeeper() {
		Level level = Dungeon.level;
		if (level == null || level.mobs == null) return null;
		for (Mob mob : level.mobs) {
			if (mob instanceof Shopkeeper) return mob;
		}
		return null;
	}

	private static synchronized Region region(Mob shopkeeper) {
		Level level = Dungeon.level;
		if (level == null) return null;
		if (level == regionLevel && shopkeeper.pos == regionShopPos) return region;
		regionLevel = level;
		regionShopPos = shopkeeper.pos;
		region = buildRegion(level, shopkeeper.pos);
		return region;
	}

	private static Region buildRegion(Level level, int start) {
		Region shop = new Region();
		int width = level.width();
		int length = level.length();
		ArrayDeque<Integer> queue = new ArrayDeque<>();
		queue.add(start);
		shop.cells.add(start);
		while (!queue.isEmpty()) {
			int cell = queue.poll();
			for (int dx = -1; dx <= 1; dx++) {
				for (int dy = -1; dy <= 1; dy++) {
					if (dx == 0 && dy == 0) continue;
					int x = cell % width + dx;
					int y = cell / width + dy;
					if (x < 0 || y < 0 || x >= width) continue;
					int next = x + y * width;
					if (next < 0 || next >= length || shop.cells.contains(next) || shop.doors.contains(next)) continue;
					if (isDoor(level.map[next])) {
						shop.doors.add(next);
						continue;
					}
					if (!level.passable[next]) continue;
					shop.cells.add(next);
					if (shop.cells.size() > MAX_SHOP_CELLS) return null;
					queue.add(next);
				}
			}
		}
		return shop.doors.isEmpty() ? null : shop;
	}

	private static boolean isDoor(int tile) {
		return tile == FloorEditor.DOOR || tile == FloorEditor.OPEN_DOOR || tile == FloorEditor.LOCKED_DOOR
			|| tile == FloorEditor.SECRET_DOOR || tile == FloorEditor.CRYSTAL_DOOR || tile == FloorEditor.HERO_LOCKED_DOOR;
	}

	private static int outsideCell(Region shop) {
		Level level = Dungeon.level;
		int width = level.width();
		for (int door : shop.doors) {
			for (int dx = -1; dx <= 1; dx++) {
				for (int dy = -1; dy <= 1; dy++) {
					int next = door + dx + dy * width;
					if (next < 0 || next >= level.length() || next == door) continue;
					if (Math.abs((door % width) - (next % width)) > 1) continue;
					if (shop.cells.contains(next) || shop.doors.contains(next)) continue;
					if (!level.passable[next] || Actor.findChar(next) != null) continue;
					return next;
				}
			}
		}
		return -1;
	}

	private static boolean contains(String[] names, String name) {
		for (String candidate : names) {
			if (candidate.equals(name)) return true;
		}
		return false;
	}
}
