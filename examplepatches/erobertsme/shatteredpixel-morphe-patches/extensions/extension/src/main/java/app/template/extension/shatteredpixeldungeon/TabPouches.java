package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Scene;
import com.watabou.utils.Bundle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Pouches for the Equipment and Rings tabs, sold in every shop for 1000 gold when the tab's shop toggle is
 * on. Until bought, that tab stays locked. Pouches are taken out of a floor's save and put back when it loads, so
 * saves never hold them, and a pouch that has been bought is not put back in any other shop.
 */
@SuppressWarnings("unused")
public final class TabPouches {

	static final int PRICE = 1000;
	private static final String[] SHOP_KEYS = { "inv_tab_weapons_shop", "inv_tab_rings_shop" };
	private static final String[] OWNED_KEYS = { "inv_tab_weapons_owned", "inv_tab_rings_owned" };
	private static final String OLD_ARMOR_OWNED = "inv_tab_armor_owned";
	private static final String BUNDLE_KEY = "morphe_tab_pouches";
	private static final float BADGE_SCALE = 0.5f;

	private static final List<Heap> stripped = new ArrayList<>();
	private static Object restoringBundle;
	private static Object pricedItem;

	private TabPouches() {
	}

	/**
	 * Whether the tab for [kind] has to be bought from a shop.
	 */
	static boolean soldInShops(int kind) {
		return CloverlordSettings.get(SHOP_KEYS[kind]);
	}

	static void soldInShops(int kind, boolean on) {
		CloverlordSettings.set(SHOP_KEYS[kind], on);
	}

	static boolean owned(int kind) {
		if (kind == FilterBag.EQUIPMENT && CloverlordSettings.get(OLD_ARMOR_OWNED)) return true;
		return CloverlordSettings.get(OWNED_KEYS[kind]);
	}

	static void own(int kind) {
		CloverlordSettings.set(OWNED_KEYS[kind], true);
	}

	/**
	 * Whether a shop should offer the pouch for [kind] now.
	 */
	static boolean forSale(int kind) {
		return FilterBag.enabled(kind) && soldInShops(kind) && !owned(kind);
	}

	/**
	 * Called when ShopRoom.generateItems returns. Adds a pouch for each tab that is for sale.
	 */
	public static ArrayList<Item> addToShop(ArrayList<Item> items) {
		if (items == null) return null;
		try {
			for (int kind = 0; kind < FilterBag.count(); kind++) {
				if (forSale(kind)) items.add(new TabPouch(kind));
			}
		} catch (Throwable e) {
			Log.e("TabPouches", "Could not add pouches to the shop", e);
		}
		return items;
	}
	/**
	 * Called at the start of Shopkeeper.sellPrice.
	 */
	public static void beforePrice(Object item) {
		pricedItem = item;
	}

	/**
	 * Called when Shopkeeper.sellPrice returns. Pouches always cost 1000 gold.
	 */
	public static int adjustPrice(int price) {
		Object item = pricedItem;
		pricedItem = null;
		return item instanceof TabPouch ? PRICE : price;
	}

	/**
	 * Called at the start of Level.storeInBundle. Takes pouch heaps out of the floor and records where they were.
	 */
	public static void beforeStore(Object level, Object bundle) {
		stripped.clear();
		if (!(level instanceof Level) || !(bundle instanceof Bundle)) return;
		Level target = (Level) level;
		List<Integer> saved = new ArrayList<>();
		for (Heap heap : new ArrayList<>(target.heaps.valueList())) {
			TabPouch pouch = pouchIn(heap);
			if (pouch == null) continue;
			target.heaps.remove(heap.pos);
			stripped.add(heap);
			saved.add(heap.pos);
			saved.add(pouch.kind);
		}
		if (saved.isEmpty()) return;
		int[] data = new int[saved.size()];
		for (int i = 0; i < data.length; i++) data[i] = saved.get(i);
		((Bundle) bundle).put(BUNDLE_KEY, data);
	}

	/**
	 * Called at the end of Level.storeInBundle. Puts the pouch heaps back.
	 */
	public static void afterStore(Object level) {
		if (!(level instanceof Level)) return;
		for (Heap heap : stripped) ((Level) level).heaps.put(heap.pos, heap);
		stripped.clear();
	}

	/**
	 * Called at the start of Level.restoreFromBundle, which reuses its parameter register before returning.
	 */
	public static void beforeRestore(Object bundle) {
		restoringBundle = bundle;
	}

	/**
	 * Called at the end of Level.restoreFromBundle. Puts back the pouches that are still for sale.
	 */
	public static void afterRestore(Object level) {
		Object bundle = restoringBundle;
		restoringBundle = null;
		if (!(level instanceof Level) || !(bundle instanceof Bundle)) return;
		try {
			if (!((Bundle) bundle).contains(BUNDLE_KEY)) return;
			int[] data = ((Bundle) bundle).getIntArray(BUNDLE_KEY);
			Level target = (Level) level;
			for (int i = 0; i + 1 < data.length; i += 2) {
				int cell = data[i];
				int kind = data[i + 1];
				if (kind < 0 || kind >= FilterBag.count() || !forSale(kind)) continue;
				if (target.heaps.get(cell, null) != null) continue;
				Heap heap = new Heap();
				heap.pos = cell;
				heap.type = Heap.Type.FOR_SALE;
				heap.items.add(new TabPouch(kind));
				target.heaps.put(cell, heap);
			}
		} catch (Throwable e) {
			Log.e("TabPouches", "Could not put the pouches back", e);
		}
	}

	private static TabPouch pouchIn(Heap heap) {
		if (heap == null || heap.items == null || heap.items.isEmpty()) return null;
		Item top = heap.items.peek();
		return top instanceof TabPouch ? (TabPouch) top : null;
	}

	private static final Map<Heap, ItemSprite> badges = new HashMap<>();
	private static Scene badgeScene;
	private static Gizmo follower;

	/**
	 * Called at the end of GameScene.create. Adds a badge to each pouch for sale already on the floor.
	 */
	public static void onSceneCreated(Object scene) {
		badges.clear();
		follower = null;
		badgeScene = scene instanceof Scene ? (Scene) scene : null;
		Level level = Dungeon.level;
		if (badgeScene == null || level == null) return;
		try {
			for (Heap heap : level.heaps.valueList()) track(heap);
		} catch (Throwable e) {
			Log.e("TabPouches", "Could not badge the pouches", e);
		}
	}

	/**
	 * Called at the start of ItemSprite.view(Heap), whenever a heap's look changes, such as when items are dropped or picked up.
	 */
	public static void onHeapViewed(Object heap) {
		if (!(heap instanceof Heap) || badgeScene == null) return;
		com.watabou.noosa.Game.runOnRenderThread(() -> track((Heap) heap));
	}

	/**
	 * Gives [heap] the small picture of its tab's item when it is a pouch for sale, or takes it away when it no longer is.
	 */
	private static void track(Heap heap) {
		if (heap == null) return;
		TabPouch pouch = pouchIn(heap);
		ItemSprite badge = badges.get(heap);
		if (pouch == null) {
			if (badge != null) removeBadge(heap);
			return;
		}
		if (badge != null || heap.sprite == null || heap.sprite.parent == null) return;
		badge = new ItemSprite(FilterBag.get(pouch.kind).image());
		badge.scale.set(BADGE_SCALE, BADGE_SCALE);
		heap.sprite.parent.addToFront(badge);
		badges.put(heap, badge);
		follow();
	}

	private static void removeBadge(Heap heap) {
		ItemSprite badge = badges.remove(heap);
		if (badge != null) {
			badge.killAndErase();
			badge.destroy();
		}
		if (badges.isEmpty() && follower != null) {
			follower.killAndErase();
			follower = null;
		}
	}

	/**
	 * Keeps each badge on its pouch, which can move as it drops. Only runs while there is a badge.
	 */
	private static void follow() {
		if (follower != null || badgeScene == null) return;
		follower = new Gizmo() {
			@Override
			public void update() {
				super.update();
				for (Heap heap : new ArrayList<>(badges.keySet())) {
					ItemSprite badge = badges.get(heap);
					if (heap.sprite == null || heap.sprite.parent == null) {
						removeBadge(heap);
						continue;
					}
					badge.visible = heap.sprite.visible;
					badge.x = heap.sprite.x + heap.sprite.width() - badge.width();
					badge.y = heap.sprite.y + heap.sprite.height() - badge.height();
				}
			}
		};
		badgeScene.add(follower);
	}
}
