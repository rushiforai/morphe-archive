package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.QuickSlot;
import com.shatteredpixel.shatteredpixeldungeon.SPDSettings;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Belongings;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Image;
import com.watabou.noosa.ui.Component;
import com.watabou.utils.Bundle;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Extra quickslots: a full-width row below the toolbar, or more pages for the quickslot swapper. Items in the extra row are saved under their own key, so a
 * save still loads normally if the patch is removed.
 */
@SuppressWarnings("unused")
public final class QuickslotRow {

	private static final String TAG = "QuickslotRow";
	private static final String KEY = "qol_extra_quickslots";
	private static final String BUNDLE_SLOT = "morphe_quickslot";
	private static final int GAME_SLOTS = 6;
	private static final int SWAPPER_SLOTS = GAME_SLOTS * 2;
	private static final int TOTAL_SLOTS = 30;
	private static final int ROW_HEIGHT = 24;
	private static final int TOOL_HEIGHT = 26;
	private static final int PITCH = 18;
	private static final String TOOLBAR = "interfaces/toolbar.png";
	private static final int[] FIRST_FRAME = { 86, 20, 2, 1 };
	private static final int[] MIDDLE_FRAME = { 88, 18, 0, 1 };
	private static final int[] LAST_FRAME = { 106, 19, 0, 2 };

	private static final Map<Object, Integer> storing = Collections.synchronizedMap(new IdentityHashMap<>());
	private static final Map<Object, Integer> restoring = Collections.synchronizedMap(new IdentityHashMap<>());
	private static final Set<Object> tallToolbars = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
	private static int savedSize = GAME_SLOTS;

	private QuickslotRow() {
	}

	static boolean isOn() {
		return QolSettings.isAvailable() && CloverlordSettings.get(KEY);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY, on);
		try {
			Reflect.method(Reflect.require("com.shatteredpixel.shatteredpixeldungeon.ui.Toolbar"), "updateLayout").invoke(null);
		} catch (Throwable e) {
			Log.e(TAG, "Could not update the toolbar", e);
		}
	}

	/**
	 * Called at the start of AndroidLauncher.onCreate, before any quickslots exist.
	 */
	public static void onLaunch() {
		if (QolSettings.isAvailable()) QuickSlot.SIZE = TOTAL_SLOTS;
	}

	/**
	 * Called at the start of Item.storeInBundle. Keeps an extra-row slot out of the game's own quickslot key.
	 */
	public static void beforeItemStore(Object item, Bundle bundle) {
		try {
			QuickSlot quickslot = Dungeon.quickslot;
			if (quickslot == null || bundle == null || !(item instanceof Item)) return;
			int slot = quickslot.getSlot((Item) item);
			if (slot < GAME_SLOTS) return;
			bundle.put(BUNDLE_SLOT, slot);
			quickslot.clearSlot(slot);
			storing.put(item, slot);
		} catch (Throwable e) {
			Log.e(TAG, "Could not save a quickslot", e);
		}
	}

	/**
	 * Called at the end of Item.storeInBundle.
	 */
	public static void afterItemStore(Object item) {
		Integer slot = storing.remove(item);
		if (slot == null || Dungeon.quickslot == null) return;
		Dungeon.quickslot.setSlot(slot, (Item) item);
	}

	/**
	 * Called at the start of Item.restoreFromBundle. Like the game's own slots, only items loaded with the hero's belongings take their slot back, so a
	 * copy made when a stack is split never steals the slot.
	 */
	public static void beforeItemRestore(Object item, Bundle bundle) {
		try {
			if (bundle == null || !Belongings.bundleRestoring || !bundle.contains(BUNDLE_SLOT)) return;
			restoring.put(item, bundle.getInt(BUNDLE_SLOT));
		} catch (Throwable e) {
			Log.e(TAG, "Could not read a quickslot", e);
		}
	}

	/**
	 * Called at the end of Item.restoreFromBundle.
	 */
	public static void afterItemRestore(Object item) {
		Integer slot = restoring.remove(item);
		if (slot == null || Dungeon.quickslot == null || slot >= QuickSlot.SIZE) return;
		Dungeon.quickslot.setSlot(slot, (Item) item);
	}

	/**
	 * Called at the start of QuickSlot.storePlaceholders. Only the game's own six slots keep placeholders.
	 */
	public static void beforePlaceholders() {
		savedSize = QuickSlot.SIZE;
		QuickSlot.SIZE = Math.min(savedSize, GAME_SLOTS);
	}

	/**
	 * Called at the end of QuickSlot.storePlaceholders.
	 */
	public static void afterPlaceholders() {
		QuickSlot.SIZE = savedSize;
	}

	/**
	 * Called at the end of the Toolbar constructor. Makes room for the extra row above the toolbar, unless the
	 * quickslot swapper is in use, where the swap button cycles through all twelve slots instead.
	 */
	public static void afterToolbarCreated(Object toolbar) {
		try {
			if (!wantsRow()) return;
			Component bar = (Component) toolbar;
			tallToolbars.add(toolbar);
			bar.setSize(bar.width(), bar.height() + ROW_HEIGHT);
		} catch (Throwable e) {
			Log.e(TAG, "Could not make room for the extra quickslots", e);
		}
	}

	static boolean wantsRow() {
		return isOn() && QuickSlot.SIZE >= SWAPPER_SLOTS && SPDSettings.interfaceSize() == 0 && !SPDSettings.quickSwapper();
	}

	private static boolean resizing;

	/**
	 * Grows or shrinks the toolbar by a row when the setting or the quickslot swapper changes during a game, keeping
	 * its bottom edge in place, and moves the game log and other indicators to match.
	 */
	/**
	 * How tall the toolbar is: its real height in a game, or outside one the height it will have.
	 */
	static float toolbarHeight() {
		Object bar = Reflect.gameScenePart("toolbar");
		if (bar instanceof Component) return ((Component) bar).height();
		return TOOL_HEIGHT + (wantsRow() ? ROW_HEIGHT : 0);
	}

	/**
	 * A stand-in for the extra row of quickslots, [width] wide from [left] with its top at [y], framed like the real one.
	 */
	static List<Image> standInRow(float left, float width, float y) {
		List<Image> parts = new ArrayList<>();
		List<Float> cells = new ArrayList<>();
		for (float c = left + FIRST_FRAME[2]; c <= left + width - LAST_FRAME[1]; c += PITCH) cells.add(c);
		for (int k = 0; k < cells.size(); k++) {
			int[] frame = cells.size() == 1 ? MIDDLE_FRAME : k == 0 ? FIRST_FRAME : k == cells.size() - 1 ? LAST_FRAME : MIDDLE_FRAME;
			Image image = new Image(TOOLBAR, frame[0], 0, frame[1], ROW_HEIGHT);
			image.x = cells.get(k) - (frame == FIRST_FRAME ? FIRST_FRAME[2] : 0);
			image.y = y;
			parts.add(image);
		}
		return parts;
	}

	/**
	 * How much taller the toolbar is than normal right now.
	 */
	static int extraHeight() {
		Object bar = Reflect.gameScenePart("toolbar");
		return bar != null && tallToolbars.contains(bar) ? ROW_HEIGHT : 0;
	}

	/**
	 * Called at the end of GameScene.prompt. Moves the prompt above the extra toolbar row.
	 */
	public static void afterPrompt(Object scene) {
		int extra = extraHeight();
		if (extra == 0) return;
		try {
			java.lang.reflect.Field field = Reflect.field(com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene.class, "prompt");
			Object prompt = field.get(scene);
			if (!(prompt instanceof Component)) return;
			Component toast = (Component) prompt;
			toast.setPos(toast.left(), toast.top() - extra);
		} catch (Throwable e) {
			Log.e(TAG, "Could not move the prompt", e);
		}
	}

	/**
	 * Called at the end of the WndQuickBag constructor. Moves the quick bag above the extra toolbar row.
	 */
	public static void afterQuickBag(Object window) {
		int extra = extraHeight();
		if (extra == 0 || !(window instanceof com.shatteredpixel.shatteredpixeldungeon.ui.Window)) return;
		try {
			com.shatteredpixel.shatteredpixeldungeon.ui.Window bag = (com.shatteredpixel.shatteredpixeldungeon.ui.Window) window;
			java.lang.reflect.Field x = Reflect.field(com.shatteredpixel.shatteredpixeldungeon.ui.Window.class, "xOffset");
			java.lang.reflect.Field y = Reflect.field(com.shatteredpixel.shatteredpixeldungeon.ui.Window.class, "yOffset");
			bag.offset(x.getInt(bag), y.getInt(bag) - extra);
		} catch (Throwable e) {
			Log.e(TAG, "Could not move the quick bag", e);
		}
	}

	private static void matchHeight(Component bar) {
		boolean wanted = wantsRow();
		boolean tall = tallToolbars.contains(bar);
		if (wanted == tall) return;
		float bottom = bar.bottom();
		float height = bar.height() + (wanted ? ROW_HEIGHT : -ROW_HEIGHT);
		if (wanted) {
			tallToolbars.add(bar);
		} else {
			tallToolbars.remove(bar);
		}
		resizing = true;
		try {
			bar.setRect(bar.left(), bottom - height, bar.width(), height);
		} finally {
			resizing = false;
		}
		try {
			com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene.layoutTags();
		} catch (Throwable e) {
			Log.e(TAG, "Could not move the game log", e);
		}
	}

	/**
	 * Called at the end of Toolbar.layout. With the quickslot swapper on, the swap button pages through twelve
	 * slots in place. Otherwise a full-width row of extra quickslots goes below the toolbar.
	 */
	public static void afterToolbarLayout(Object toolbar) {
		if (resizing) return;
		try {
			Component bar = (Component) toolbar;
			matchHeight(bar);
			if (!isOn() || QuickSlot.SIZE < SWAPPER_SLOTS) {
				rowSlots.clear();
				return;
			}
			Object[] quick = (Object[]) field(bar, "btnQuick").get(bar);
			if (SPDSettings.quickSwapper() && SPDSettings.interfaceSize() == 0) {
				rowSlots.clear();
				pageWithSwapper(bar, quick);
				return;
			}
			if (tallToolbars.contains(toolbar)) {
				addExtraRow(bar, quick);
			} else {
				rowSlots.clear();
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not lay out the extra quickslots", e);
		}
	}

	/**
	 * Fills a row below the toolbar, across the whole width of the screen, with extra quickslots. The slots sit on
	 * the same columns as the quickslots above, so the two rows line up.
	 */
	private static void addExtraRow(Component bar, Object[] quick) throws ReflectiveOperationException {
		Component anchor = null;
		boolean enabled = true;
		for (int i = 0; i < GAME_SLOTS && i < quick.length; i++) {
			Component slot = (Component) quick[i];
			if (!slot.visible) continue;
			anchor = slot;
			enabled = slot.active;
			break;
		}
		for (int i = GAME_SLOTS; i < quick.length; i++) hide((Component) quick[i]);
		if (anchor == null) return;

		float cell = anchor.left() + (anchor.width() >= FIRST_FRAME[1] ? FIRST_FRAME[2] : 0);
		float minimum = bar.left() + FIRST_FRAME[2];
		float maximum = bar.right() - LAST_FRAME[1];
		while (cell - PITCH >= minimum) cell -= PITCH;
		List<Float> cells = new ArrayList<>();
		for (float c = cell; c <= maximum; c += PITCH) cells.add(c);

		int count = Math.min(cells.size(), quick.length - GAME_SLOTS);
		float y = anchor.top() - 2 + TOOL_HEIGHT;
		rowSlots.clear();
		rowY = y;
		for (int k = 0; k < count; k++) {
			Component slot = (Component) quick[GAME_SLOTS + k];
			int[] frame = count == 1 ? MIDDLE_FRAME : k == 0 ? FIRST_FRAME : k == count - 1 ? LAST_FRAME : MIDDLE_FRAME;
			call(slot, "frame", new Class<?>[] { int.class, int.class, int.class, int.class }, frame[0], 0, frame[1], ROW_HEIGHT);
			call(slot, "border", new Class<?>[] { int.class, int.class }, frame[2], frame[3]);
			float x = cells.get(k) - (frame == FIRST_FRAME ? FIRST_FRAME[2] : 0);
			slot.setPos(x, y);
			slot.visible = true;
			enable(slot, enabled);
			rowSlots.add(slot);
		}
	}

	private static final List<Component> rowSlots = new ArrayList<>();
	private static float rowY;
	private static int repairs;

	/**
	 * Called when the hero's items change and when the game lays out its buttons. Lays the toolbar out again if a slot in the extra row went
	 * missing or moved.
	 */
	static void verifyRow() {
		if (rowSlots.isEmpty() || resizing) return;
		boolean intact = true;
		for (Component slot : rowSlots) {
			if (!slot.visible || slot.parent == null || Math.abs(slot.top() - rowY) >= 0.5f) intact = false;
		}
		if (intact) {
			repairs = 0;
			return;
		}
		if (++repairs > 3) {
			rowSlots.clear();
			repairs = 0;
			return;
		}
		for (Component slot : rowSlots) {
			if (slot.visible && slot.parent != null && Math.abs(slot.top() - rowY) < 0.5f) continue;
			if (slot.parent == null) {
				rowSlots.clear();
				return;
			}
			try {
				Reflect.method(Reflect.require("com.shatteredpixel.shatteredpixeldungeon.ui.Toolbar"), "updateLayout").invoke(null);
			} catch (Throwable e) {
				Log.e(TAG, "Could not restore the extra quickslots", e);
				rowSlots.clear();
			}
			return;
		}
	}

	private static void call(Object target, String name, Class<?>[] types, Object... args) throws ReflectiveOperationException {
		Reflect.call(target, name, types, args);
	}

	private static int swapPage;
	private static Boolean lastSwapped;

	/**
	 * Shows the swap button beside the quickslots, making room by setting the last slot aside if needed, and fills
	 * the visible spots with the page of slots the swap button has reached. Only whole pages are used, so every page
	 * fills every spot: with five spots that is two pages of five.
	 */
	private static void pageWithSwapper(Component bar, Object[] quick) throws ReflectiveOperationException {
		Component swap = (Component) field(bar, "btnSwap").get(bar);
		List<Component> spots = new ArrayList<>();
		for (Object tool : quick) {
			Component slot = (Component) tool;
			if (slot.visible) spots.add(slot);
		}
		if (spots.isEmpty()) return;
		spots.sort((a, b) -> Float.compare(a.left(), b.left()));
		boolean flipped = SPDSettings.flipToolbar();
		if (!flipped) Collections.reverse(spots);

		if (!swap.visible) {
			float needed = swap.width() - 2;
			if (roomBeside(bar, spots.get(spots.size() - 1), flipped) < needed && spots.size() > 1) {
				Component removed = spots.remove(spots.size() - 1);
				Component newEnd = spots.get(spots.size() - 1);
				float x = flipped ? newEnd.left() : newEnd.right() - removed.width();
				copyLook(removed, newEnd, x, newEnd.top());
				hide(removed);
			}
			Component end = spots.get(spots.size() - 1);
			float x = flipped ? end.right() - 2 : end.left() - needed;
			swap.setPos(x, end.top() + 1);
			swap.visible = true;
			enable(swap, end.active);
		}

		Field swappedField = Reflect.field(Reflect.require("com.shatteredpixel.shatteredpixeldungeon.ui.Toolbar"), "swappedQuickslots");
		boolean swapped = swappedField.getBoolean(null);
		int size = spots.size();
		int usable = Math.min(quick.length, SWAPPER_SLOTS);
		int pages = Math.max(1, usable / size);
		if (lastSwapped == null) {
			swapPage = 0;
		} else if (swapped != lastSwapped) {
			swapPage = (swapPage + 1) % pages;
		}
		lastSwapped = swapped;
		swapPage = Math.min(swapPage, pages - 1);

		float[][] places = new float[size][];
		for (int k = 0; k < size; k++) places[k] = new float[] { spots.get(k).left(), spots.get(k).top() };
		int start = swapPage * size;
		boolean[] used = new boolean[quick.length];
		for (int k = 0; k < size && start + k < pages * size; k++) {
			Component target = (Component) quick[start + k];
			copyLook(spots.get(k), target, places[k][0], places[k][1]);
			target.visible = true;
			enable(target, spots.get(k).active);
			used[start + k] = true;
		}
		for (int i = 0; i < quick.length; i++) {
			if (!used[i]) hide((Component) quick[i]);
		}
	}

	/**
	 * The free space beside [end], on the side the swap button goes, up to the next toolbar button or the edge.
	 */
	@SuppressWarnings("unchecked")
	private static float roomBeside(Component bar, Component end, boolean flipped) throws ReflectiveOperationException {
		float limit = flipped ? bar.right() : bar.left();
		for (Gizmo member : Reflect.members(bar)) {
			if (!(member instanceof Component) || member == end || !member.visible) continue;
			Component other = (Component) member;
			if (other.top() >= PixelScene.uiCamera.height - 1) continue;
			if (flipped && other.left() >= end.right() - 1) limit = Math.min(limit, other.left());
			if (!flipped && other.right() <= end.left() + 1) limit = Math.max(limit, other.right());
		}
		return flipped ? limit - end.right() : end.left() - limit;
	}

	private static void hide(Component tool) {
		tool.visible = false;
		enable(tool, false);
		tool.setPos(tool.left(), PixelScene.uiCamera.height);
	}

	/**
	 * Gives [target] the same background frame, borders and size as [source], at the given position.
	 */
	private static void copyLook(Component source, Component target, float x, float y) {
		try {
			Field baseField = field(source, "base");
			Object sourceBase = baseField.get(source);
			Object targetBase = baseField.get(target);
			Method getFrame = Reflect.method(sourceBase.getClass(), "frame");
			Object frame = getFrame.invoke(sourceBase);
			Reflect.method(targetBase.getClass(), "frame", getFrame.getReturnType()).invoke(targetBase, frame);
			for (String border : new String[] { "borderLeft", "borderRight" }) {
				Field borderField = field(source, border);
				borderField.setInt(target, borderField.getInt(source));
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not copy a quickslot's look", e);
		}
		target.setRect(x, y, source.width(), source.height());
	}

	private static Field field(Object target, String name) throws NoSuchFieldException {
		return Reflect.field(target.getClass(), name);
	}

	private static void enable(Object tool, boolean value) {
		try {
			Reflect.call(tool, "enable", new Class<?>[] { boolean.class }, value);
		} catch (Throwable ignored) {
		}
	}
}
