package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Belongings;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndBag;
import com.watabou.noosa.Game;
import com.watabou.noosa.Image;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Unlimited inventory space, the Equipment and Rings backpack tabs, and pages for bags that hold more than
 * fit on screen.
 */
@SuppressWarnings("unused")
public final class InventorySpace {

	private static final String TAG = "InventorySpace";
	private static final String KEY_UNLIMITED = "qol_unlimited_inventory";
	private static final int EQUIPMENT_SLOTS = 5;
	private static final int MAX_ITEM_ROWS = 8;
	private static final int COLUMNS = 5;
	private static final int DEFAULT_ITEM_SLOTS = 20;
	private static final int SLOT_MARGIN = 1;
	private static final int TITLE_HEIGHT = 14;
	private static final int SCREEN_MARGIN = 32;
	private static final int MIN_SLOT_SIZE = 16;
	private static final int ROW_GAP = 2;
	private static final int PAGER_HEIGHT = 16;
	private static final int ARROW_WIDTH = 30;
	private static final int BACK_HEIGHT = 18;

	private static final String[] BAG_ORDER = { "VelvetPouch", "ScrollHolder", "PotionBandolier", "MagicalHolster" };
	private static final Map<String, Integer> savedPages = new HashMap<>();

	private static Page current;

	private InventorySpace() {
	}

	private static final class Page {
		Bag bag;
		int fixed;
		int bags;
		int index;
		int pages;
		int free;
		int itemRows;
		List<Item> shown = new ArrayList<>();
		Set<Item> hidden = Collections.newSetFromMap(new IdentityHashMap<>());
	}

	static boolean isOn() {
		return InventoryWindow.isAvailable() && CloverlordSettings.get(KEY_UNLIMITED);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_UNLIMITED, on);
	}

	/**
	 * Wraps the returns of Bag.capacity and the capacity of each special bag.
	 */
	public static int capacity(int original, Bag bag) {
		if (bag instanceof Belongings.Backpack) return original;
		return expand(original, bag);
	}

	/**
	 * Wraps the returns of Belongings.Backpack.capacity.
	 */
	public static int backpackCapacity(int original, Bag bag) {
		Page page = current;
		if ((page != null && page.bag == bag) || isOn()) return expand(original, bag);
		int capacity = original + QolSettings.extraBagSlots();
		if (!FilterBag.anyOn()) return capacity;
		return capacity + FilterBag.allHeld().size();
	}

	/**
	 * Called at the start of Bag.canHold. Returns true when [item] goes in a Equipment or Rings tab that still
	 * has room, even if the rest of the backpack is full.
	 */
	public static boolean tabHolds(Bag bag, Item item) {
		try {
			Hero hero = Dungeon.hero;
			if (hero == null || bag == null || item == null || item instanceof Bag) return false;
			if (bag != hero.belongings.backpack) return false;
			int kind = FilterBag.kindOf(item);
			if (kind < 0) return false;
			return FilterBag.held(kind).size() < FilterBag.tabCapacity();
		} catch (Throwable e) {
			return false;
		}
	}

	private static int expand(int original, Bag bag) {
		Page page = current;
		if (page != null && page.bag == bag) return page.bags + page.shown.size() + page.free;
		if (bag == null || bag.items == null) return original;
		if (!isOn()) return original + QolSettings.extraBagSlots();
		return Math.max(original, bag.items.size() + 1);
	}

	static int filterCapacity(FilterBag bag) {
		Page page = current;
		if (page != null && page.bag == bag) return page.shown.size() + page.free - 1;
		return bag.items == null ? 0 : bag.items.size();
	}

	/**
	 * Called with the bag list in the WndBag constructor. Adds the Equipment and Rings tabs that are switched on.
	 */
	public static ArrayList<Bag> bagTabs(ArrayList<Bag> bags) {
		if (bags == null || !InventoryWindow.isAvailable()) return bags;
		ArrayList<Bag> real = withoutDuplicates(bags);
		ArrayList<Bag> result = new ArrayList<>();
		for (Bag bag : real) {
			if (bag instanceof Belongings.Backpack) result.add(bag);
		}
		if (FilterBag.isOn(FilterBag.EQUIPMENT)) result.add(FilterBag.get(FilterBag.EQUIPMENT));
		for (String name : BAG_ORDER) {
			for (Bag bag : real) {
				if (bag.getClass().getSimpleName().equals(name)) result.add(bag);
			}
		}
		for (Bag bag : real) {
			if (!result.contains(bag)) result.add(bag);
		}
		if (FilterBag.isOn(FilterBag.RINGS)) result.add(FilterBag.get(FilterBag.RINGS));
		return result;
	}

	/**
	 * Called at the start of Bag.collect. Returns true to refuse a second copy of a bag the hero already carries,
	 * such as a second potion bandolier, so extra copies never add tabs or hold items.
	 */
	public static boolean refuseBag(Bag bag, Bag container) {
		try {
			if (!InventoryWindow.isAvailable() || bag == null || container == null) return false;
			if (bag instanceof Belongings.Backpack || bag instanceof FilterBag) return false;
			Hero hero = Dungeon.hero;
			if (hero == null || container != hero.belongings.backpack || container.items == null) return false;
			for (Item item : container.items) {
				if (item != bag && item.getClass() == bag.getClass()) {
					GLog.w("You already have a " + bag.name() + ". Only one of each bag can be carried.");
					return true;
				}
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not check for a duplicate bag", e);
		}
		return false;
	}

	/**
	 * Keeps the first bag of each kind. Any extra copy already carried hands its items to the first one and is
	 * dropped at the hero's feet.
	 */
	private static ArrayList<Bag> withoutDuplicates(ArrayList<Bag> bags) {
		ArrayList<Bag> result = new ArrayList<>();
		Map<Class<?>, Bag> firsts = new HashMap<>();
		List<Bag> extras = new ArrayList<>();
		for (Bag bag : bags) {
			if (bag instanceof Belongings.Backpack) {
				result.add(bag);
				continue;
			}
			Bag first = firsts.get(bag.getClass());
			if (first == null) {
				firsts.put(bag.getClass(), bag);
				result.add(bag);
				continue;
			}
			extras.add(bag);
		}
		for (Bag extra : extras) dropExtra(extra, firsts.get(extra.getClass()));
		return result;
	}

	private static void dropExtra(Bag extra, Bag first) {
		try {
			Hero hero = Dungeon.hero;
			if (hero == null || Dungeon.level == null) return;
			if (extra.items != null && first != null && first.items != null) {
				first.items.addAll(extra.items);
				extra.items.clear();
			}
			extra.detachAll(hero.belongings.backpack);
			Heap heap = Dungeon.level.drop(extra, hero.pos);
			if (heap != null && heap.sprite != null) heap.sprite.drop();
			GLog.w("You can only carry one " + extra.name() + ". The extra one was dropped.");
			Item.updateQuickslot();
		} catch (Throwable e) {
			Log.e(TAG, "Could not drop an extra bag", e);
		}
	}

	/**
	 * Called at the start of WndBag.icon. Returns the tab icon for the Equipment and Rings tabs, or null.
	 */
	public static Image tabIcon(Bag bag) {
		if (!(bag instanceof FilterBag)) return null;
		try {
			if (((FilterBag) bag).kind() == FilterBag.EQUIPMENT) {
				Image icon = CustomIcons.image(CustomIcons.EQUIPMENT);
				if (icon != null) return icon;
			}
			return new ItemSprite(bag);
		} catch (Throwable e) {
			return null;
		}
	}

	/**
	 * Called in the WndBag constructor once the rows are known. Works out the page to show, and returns the number
	 * of rows to lay out, shrinking the slots so they fit on screen.
	 */
	public static int rows(Object window, Bag bag, int columns, int rows) {
		current = null;
		try {
			if (bag instanceof FilterBag) ((FilterBag) bag).refresh();
			Page page = page(bag);
			if (page == null || columns <= 0) return rows;
			current = page;

			int slots = EQUIPMENT_SLOTS + page.fixed + page.shown.size() + page.free;
			int needed = Math.max(rows, divideUp(slots, columns));
			if (page.pages > 1) needed = Math.max(needed, 1 + page.itemRows);

			int reserved = (page.pages > 1 ? PAGER_HEIGHT + ROW_GAP : 0) + (BackpackEditor.isOpeningEditWindow() ? BACK_HEIGHT : 0);
			int available = PixelScene.uiCamera.height - SCREEN_MARGIN - TITLE_HEIGHT - reserved - (needed - 1) * SLOT_MARGIN;
			int fit = Math.max(MIN_SLOT_SIZE, available / needed);
			if (fit < getInt(window, "slotHeight")) setInt(window, "slotHeight", fit);
			return needed;
		} catch (Throwable e) {
			Log.e(TAG, "Could not lay out the bag", e);
			current = null;
			return rows;
		}
	}

	private static Page page(Bag bag) {
		Hero hero = Dungeon.hero;
		if (bag == null || bag.items == null || hero == null) return null;
		boolean filter = bag instanceof FilterBag;
		boolean backpack = bag == hero.belongings.backpack;
		boolean unlimited = isOn();
		boolean tabs = backpack && FilterBag.anyOn();
		boolean custom = QolSettings.extraBagSlots() > 0;
		if (!filter && !unlimited && !tabs && !custom) return null;

		Page page = new Page();
		page.bag = bag;
		page.fixed = filter ? 0 : backpack ? (hero.belongings.secondWep != null ? 1 : 0) : 1;

		Set<Item> held = tabs ? FilterBag.allHeld() : Collections.newSetFromMap(new IdentityHashMap<>());
		List<Item> all = new ArrayList<>();
		for (Item item : bag.items) {
			if (item instanceof Bag) {
				page.bags++;
				continue;
			}
			if (held.contains(item)) {
				page.hidden.add(item);
				continue;
			}
			all.add(item);
		}

		boolean growing = unlimited && !filter;
		page.itemRows = unlimited ? MAX_ITEM_ROWS : QolSettings.bagRows();
		int perPage = page.itemRows * COLUMNS - page.fixed;
		int total = all.size() + (growing ? 1 : 0);
		int minimumPages = !unlimited && QolSettings.extraBagPage() ? 2 : 1;
		page.pages = Math.max(minimumPages, divideUp(total, perPage));
		Integer saved = savedPages.get(key(bag));
		page.index = saved == null ? 0 : Math.max(0, Math.min(page.pages - 1, saved));

		int start = page.index * perPage;
		int end = Math.min(all.size(), start + perPage);
		for (int i = 0; i < all.size(); i++) {
			if (i >= start && i < end) {
				page.shown.add(all.get(i));
			} else {
				page.hidden.add(all.get(i));
			}
		}
		int used = page.fixed + page.shown.size();
		int target;
		if (page.pages > 1) {
			target = page.itemRows * COLUMNS;
		} else if (unlimited) {
			target = divideUp(Math.max(DEFAULT_ITEM_SLOTS, used + (growing ? 1 : 0)), COLUMNS) * COLUMNS;
		} else {
			target = divideUp(Math.max(page.itemRows * COLUMNS, used), COLUMNS) * COLUMNS;
		}
		page.free = Math.max(0, target - used);
		return page;
	}

	private static String key(Bag bag) {
		if (bag instanceof FilterBag) return ((FilterBag) bag).key();
		Hero hero = Dungeon.hero;
		if (hero != null && bag == hero.belongings.backpack) return "backpack";
		return bag.getClass().getName();
	}

	/**
	 * Called at the start of WndBag.placeItem. Returns true to leave out an item that is on another page, or the
	 * Equipment or Rings tab itself.
	 */
	/**
	 * Called at the start of WndBag.lastBag. The game only reopens the last bag when it is inside the backpack, so after selling or
	 * choosing an item from a Equipment or Rings tab it would go back to the backpack. Returns that tab's window instead, or null to
	 * let the game decide.
	 */
	public static WndBag reopenTab(WndBag.ItemSelector selector) {
		try {
			Object last = Reflect.getStatic(WndBag.class, "lastBag");
			if (!(last instanceof FilterBag)) return null;
			FilterBag tab = (FilterBag) last;
			if (!FilterBag.isOn(tab.kind())) return null;
			return new WndBag(tab, selector);
		} catch (Throwable e) {
			Log.e(TAG, "Could not reopen the tab", e);
			return null;
		}
	}

	public static boolean skipSlot(Item item) {
		if (item == null) return false;
		if (item instanceof FilterBag) return true;
		Page page = current;
		return page != null && page.hidden.contains(item);
	}

	/**
	 * Called at the end of the WndBag constructor, before the backpack editor adds its own buttons.
	 */
	public static void afterBagCreated(Window window) {
		Page page = current;
		current = null;
		if (page == null || page.pages <= 1) return;
		try {
			addPager(window, page);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the page buttons", e);
		}
	}

	private static void addPager(Window window, Page page) throws ReflectiveOperationException {
		int width = Reflect.width(window);
		int height = Reflect.height(window);
		float top = height + ROW_GAP;

		RedButton previous = new RedButton("", 7) {
			@Override
			public void onClick() {
				turn(window, page, -1);
			}
		};
		previous.icon(StatIcons.arrow(true));
		previous.setRect(0, top, ARROW_WIDTH, PAGER_HEIGHT);
		window.add(previous);

		RedButton next = new RedButton("", 7) {
			@Override
			public void onClick() {
				turn(window, page, 1);
			}
		};
		next.icon(StatIcons.arrow(false));
		next.setRect(width - ARROW_WIDTH, top, ARROW_WIDTH, PAGER_HEIGHT);
		window.add(next);

		RenderedTextBlock label = PixelScene.renderTextBlock((page.index + 1) + "/" + page.pages, 8);
		label.setPos((width - label.width()) / 2f, top + (PAGER_HEIGHT - label.height()) / 2f);
		window.add(label);

		window.resize(width, (int) (top + PAGER_HEIGHT));
	}

	private static void turn(Window window, Page page, int step) {
		int index = ((page.index + step) % page.pages + page.pages) % page.pages;
		savedPages.put(key(page.bag), index);
		try {
			WndBag.ItemSelector selector = Reflect.bagSelector(window);
			BackpackEditor.beforeTabSwitch(window);
			window.hide();
			WndBag reopened = new WndBag(page.bag, selector);
			if (Game.scene() instanceof GameScene) {
				GameScene.show(reopened);
			} else {
				Game.scene().addToFront(reopened);
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not change the page", e);
		}
	}

	private static int divideUp(int value, int divisor) {
		return (value + divisor - 1) / divisor;
	}

	private static int getInt(Object target, String name) throws ReflectiveOperationException {
		return field(target, name).getInt(target);
	}

	private static void setInt(Object target, String name, int value) throws ReflectiveOperationException {
		field(target, name).setInt(target, value);
	}

	private static Field field(Object target, String name) throws NoSuchFieldException {
		return Reflect.field(target.getClass(), name);
	}
}
