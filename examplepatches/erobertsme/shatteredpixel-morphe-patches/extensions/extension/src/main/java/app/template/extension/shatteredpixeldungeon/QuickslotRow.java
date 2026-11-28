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
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Extra quickslots: a full-width row below the toolbar, or more pages for the quickslot swapper. Items in the extra row are saved under their own key, so a
 * save still loads normally if the patch is removed.
 */
@SuppressWarnings("unused")
public final class QuickslotRow {

	private static final String TAG = "QuickslotRow";
	private static final String KEY = "qol_extra_quickslots";
	private static final String KEY_SEPARATE = "qol_extra_quickslots_separate";
	private static final String BUNDLE_SLOT = "morphe_quickslot";
	private static final int GAME_SLOTS = 6;
	private static final int SWAPPER_SLOTS = GAME_SLOTS * 2;
	private static final int TOTAL_SLOTS = 30;
	static final int ROW_HEIGHT = 24;
	private static final int TOOL_HEIGHT = 26;
	private static final int PITCH = 18;
	private static final int BEZEL = 2;
	private static final int LIGHT_LINE = 1;
	private static final int CORNER_ROW = 20;
	private static final String TOOLBAR = "interfaces/toolbar.png";
	private static final int[] FIRST_FRAME = { 86, 20, 2, 1 };
	private static final int[] MIDDLE_FRAME = { 88, 18, 0, 1 };
	private static final int[] LAST_FRAME = { 106, 19, 0, 2 };

	private static final Map<Object, Integer> storing = Collections.synchronizedMap(new IdentityHashMap<>());
	private static final Map<Object, Integer> restoring = Collections.synchronizedMap(new IdentityHashMap<>());
	private static final Map<Object, Integer> grown = Collections.synchronizedMap(new WeakHashMap<>());
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
	 * Whether the extra row is joined to the quickslots above it, sharing one border where they meet. Otherwise each row has its own.
	 */
	static boolean isJoined() {
		return !CloverlordSettings.get(KEY_SEPARATE);
	}

	static void setJoined(boolean joined) {
		CloverlordSettings.set(KEY_SEPARATE, !joined);
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
			int extra = wantedExtra();
			if (extra == 0) return;
			Component bar = (Component) toolbar;
			grown.put(toolbar, extra);
			bar.setSize(bar.width(), bar.height() + extra);
		} catch (Throwable e) {
			Log.e(TAG, "Could not make room for the extra quickslots", e);
		}
	}

	static boolean wantsRow() {
		return isOn() && QuickSlot.SIZE >= SWAPPER_SLOTS && SPDSettings.interfaceSize() == 0 && !SPDSettings.quickSwapper();
	}

	/**
	 * The part of the slot frame an extra slot draws, as its first line, its height and how far it sits above the row's line. A slot that
	 * [meets] a quickslot joins it like slots in a row do, at one dark line: it leaves out its top light line and covers the quickslot's
	 * bottom bezel, so its own dark line divides them. A slot under no quickslot keeps its whole frame, lined up with the others. Unless the
	 * row is joined, every slot keeps its whole frame.
	 */
	private static int[] rowFrame(boolean meets) {
		if (!isJoined()) return new int[] { 0, ROW_HEIGHT, 0 };
		return meets ? new int[] { LIGHT_LINE, ROW_HEIGHT - LIGHT_LINE, 0 } : new int[] { 0, ROW_HEIGHT, LIGHT_LINE };
	}

	/**
	 * Whether the slot from [left] to [right] sits against one of the quickslots spanning [spans], by most of a slot's width.
	 */
	private static boolean meets(float left, float right, List<float[]> spans) {
		for (float[] span : spans) {
			if (Math.min(right, span[1]) - Math.max(left, span[0]) > PITCH / 2f) return true;
		}
		return false;
	}

	/**
	 * How much taller than normal the toolbar should be: the extra row, less the bezel where it covers the quickslots, and how far the
	 * quickslots drop.
	 */
	private static int wantedExtra() {
		if (!wantsRow()) return 0;
		return rowFrame(true)[1] - rowOverlap() + quickslotDrop();
	}

	/**
	 * How far the extra row reaches up over the quickslots: their bottom bezel when joined, nothing otherwise.
	 */
	private static int rowOverlap() {
		return isJoined() ? BEZEL : 0;
	}

	/**
	 * How far the quickslots sit lower than the game puts them, below the wait, search and backpack buttons' tops. They drop by as much as
	 * the whole frames of the extra slots under those buttons reach above the row, so the buttons clear them.
	 */
	static int quickslotDrop() {
		if (!wantsRow() || !isJoined()) return 0;
		return rowFrame(false)[2] + BEZEL;
	}

	private static boolean resizing;

	/**
	 * How tall the toolbar is: its real height in a game, or outside one the height it will have.
	 */
	static float toolbarHeight() {
		Object bar = Reflect.gameScenePart("toolbar");
		if (bar instanceof Component) return ((Component) bar).height();
		return TOOL_HEIGHT + wantedExtra();
	}

	/**
	 * A stand-in for the extra row of quickslots, [width] wide from [left] with its line at [y], framed like the real one where it meets the
	 * quickslots spanning [quickLeft] to [quickRight]. Above the toolbar, [width] ends at the backpack button.
	 */
	static List<Image> standInRow(float left, float width, float y, float quickLeft, float quickRight) {
		List<Image> parts = new ArrayList<>();
		List<Float> cells = new ArrayList<>();
		for (float c = left + FIRST_FRAME[2]; c <= left + width - LAST_FRAME[1]; c += PITCH) cells.add(c);
		List<float[]> spans = Collections.singletonList(new float[] { quickLeft, quickRight });
		for (int k = 0; k < cells.size(); k++) {
			int[] frame = cells.size() == 1 ? MIDDLE_FRAME : k == 0 ? FIRST_FRAME : k == cells.size() - 1 ? LAST_FRAME : MIDDLE_FRAME;
			float x = cells.get(k) - (frame == FIRST_FRAME ? FIRST_FRAME[2] : 0);
			int[] part = rowFrame(meets(x, x + frame[1], spans));
			Image image = new Image(TOOLBAR, frame[0], part[0], frame[1], part[1]);
			image.x = x;
			image.y = y - part[2];
			parts.add(image);
		}
		return parts;
	}

	/**
	 * How much taller the toolbar is than normal right now.
	 */
	static int extraHeight() {
		Object bar = Reflect.gameScenePart("toolbar");
		Integer extra = bar == null ? null : grown.get(bar);
		return extra == null ? 0 : extra;
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

	/**
	 * Grows or shrinks the toolbar when the setting, where the row goes or the quickslot swapper changes during a game, keeping its bottom
	 * edge in place, and moves the game log and other indicators to match.
	 */
	private static void matchHeight(Component bar) {
		int wanted = wantedExtra();
		Integer current = grown.get(bar);
		int now = current == null ? 0 : current;
		if (wanted == now) return;
		float bottom = bar.bottom();
		float height = bar.height() + wanted - now;
		if (wanted == 0) grown.remove(bar);
		else grown.put(bar, wanted);
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
				clearRow();
				return;
			}
			Object[] quick = (Object[]) field(bar, "btnQuick").get(bar);
			if (SPDSettings.quickSwapper() && SPDSettings.interfaceSize() == 0) {
				clearRow();
				pageWithSwapper(bar, quick);
				return;
			}
			if (grown.containsKey(toolbar)) {
				addExtraRow(bar, quick);
			} else {
				clearRow();
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not lay out the extra quickslots", e);
		}
	}

	/**
	 * Fills a row below the toolbar, across the whole width of the screen, with extra quickslots on the same columns as the quickslots above,
	 * so the two rows line up. Joined, it is drawn in front of them and meets them at one dark line, like slots within a row, and the
	 * quickslots drop a little so the wait, search and backpack buttons clear the row.
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
		List<float[]> spans = new ArrayList<>();
		int drop = quickslotDrop();
		for (int i = 0; i < GAME_SLOTS && i < quick.length; i++) {
			Component slot = (Component) quick[i];
			if (!slot.visible) continue;
			slot.setPos(slot.left(), slot.top() + drop);
			spans.add(new float[] { slot.left(), slot.right() });
		}
		float y = anchor.bottom() - rowOverlap();
		rowSlots.clear();
		for (int k = 0; k < count; k++) {
			Component slot = (Component) quick[GAME_SLOTS + k];
			int[] frame = count == 1 ? MIDDLE_FRAME : k == 0 ? FIRST_FRAME : k == count - 1 ? LAST_FRAME : MIDDLE_FRAME;
			float x = cells.get(k) - (frame == FIRST_FRAME ? FIRST_FRAME[2] : 0);
			int[] part = rowFrame(meets(x, x + frame[1], spans));
			call(slot, "frame", new Class<?>[] { int.class, int.class, int.class, int.class }, frame[0], part[0], frame[1], part[1]);
			call(slot, "border", new Class<?>[] { int.class, int.class }, frame[2], frame[3]);
			slot.setPos(x, y - part[2]);
			slot.visible = true;
			enable(slot, enabled);
			bar.bringToFront(slot);
			rowSlots.put(slot, y - part[2]);
		}
		if (count > 0) addCorners(bar, spans, cells.get(0) - FIRST_FRAME[2], y);
	}

	private static final List<Image> corners = new ArrayList<>();

	/**
	 * Forgets the extra row and takes away its corners, when the row is no longer shown.
	 */
	private static void clearRow() {
		rowSlots.clear();
		for (Image corner : corners) corner.killAndErase();
		corners.clear();
	}

	/**
	 * Where a joined row reaches past the left end of the quickslots, finishes the corner there: the quickslots' inner border carries on
	 * down to the line dividing the rows, instead of being cut off by the top edge of the extra slot beside them. The row starts at
	 * [rowLeft] with its dividing line at [line].
	 */
	private static void addCorners(Component bar, List<float[]> spans, float rowLeft, float line) {
		for (Image corner : corners) corner.killAndErase();
		corners.clear();
		if (!isJoined() || spans.isEmpty()) return;
		float left = Float.MAX_VALUE;
		for (float[] span : spans) left = Math.min(left, span[0]);
		if (rowLeft < left) addCorner(bar, FIRST_FRAME[0] + 1, left + 1, line - 1);
	}

	private static void addCorner(Component bar, int column, float x, float y) {
		Image corner = new Image(TOOLBAR, column, CORNER_ROW, 1, 1);
		corner.x = x;
		corner.y = y;
		bar.add(corner);
		corners.add(corner);
	}

	private static final Map<Component, Float> rowSlots = new LinkedHashMap<>();
	private static int repairs;

	/**
	 * Called when the hero's items change and when the game lays out its buttons. Lays the toolbar out again if a slot in the extra row went
	 * missing or moved.
	 */
	static void verifyRow() {
		if (rowSlots.isEmpty() || resizing) return;
		boolean intact = true;
		for (Map.Entry<Component, Float> entry : rowSlots.entrySet()) {
			Component slot = entry.getKey();
			if (!slot.visible || slot.parent == null || Math.abs(slot.top() - entry.getValue()) >= 0.5f) intact = false;
		}
		if (intact) {
			repairs = 0;
			return;
		}
		if (++repairs > 3) {
			clearRow();
			repairs = 0;
			return;
		}
		for (Map.Entry<Component, Float> entry : rowSlots.entrySet()) {
			Component slot = entry.getKey();
			if (slot.visible && slot.parent != null && Math.abs(slot.top() - entry.getValue()) < 0.5f) continue;
			if (slot.parent == null) {
				clearRow();
				return;
			}
			try {
				Reflect.method(Reflect.require("com.shatteredpixel.shatteredpixeldungeon.ui.Toolbar"), "updateLayout").invoke(null);
			} catch (Throwable e) {
				Log.e(TAG, "Could not restore the extra quickslots", e);
				clearRow();
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
