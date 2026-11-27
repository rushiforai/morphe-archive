package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag;
import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndBag;
import com.watabou.noosa.BitmapText;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;

import java.lang.reflect.Field;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Adds an Edit action to items while the backpack was opened from the inventory editor.
 */
@SuppressWarnings("unused")
public final class BackpackEditor {

	public static final String ACTION_EDIT = "MORPHE_EDIT";

	private static final String TAG = "BackpackEditor";
	private static final int EDIT_COLOR = 0xFF9944;
	private static final int BACK_HEIGHT = 16;
	private static final int SHORTCUT_WIDTH = 24;
	private static final int SHORTCUT_HEIGHT = 12;
	private static final int TITLE_HEIGHT = 14;
	private static final int HEADER_SPACE = 2;

	private static final Set<Window> editWindows = Collections.newSetFromMap(new WeakHashMap<>());
	private static boolean pendingEditWindow;
	private static boolean openingEditWindow;
	private static boolean switchingEditTab;
	private static final BackAction backAction = new BackAction();
	private static Bag editBag;

	private BackpackEditor() {
	}

	/**
	 * Opens the backpack editor and remembers where its Back button returns to.
	 */
	public static void open(Runnable back) {
		backAction.set(back);
		open();
	}

	static void open(Runnable back, Bag bag) {
		backAction.set(back);
		editBag = bag;
		open();
	}

	public static void open() {
		if (Dungeon.hero == null) return;
		Bag bag = editBag != null ? editBag : Dungeon.hero.belongings.backpack;
		openingEditWindow = true;
		try {
			Game.scene().addToFront(new WndBag(bag));
		} finally {
			openingEditWindow = false;
		}
	}

	private static boolean isOpenEditWindow(Window window) {
		return window != null && window.parent != null && editWindows.contains(window);
	}

	/**
	 * Called at the start of WndBag.onClick(Tab), which closes the bag before opening the new tab.
	 */
	public static void beforeTabSwitch(Window window) {
		switchingEditTab = editWindows.contains(window);
	}

	/**
	 * Called at the end of the WndBag constructor for edit windows, to remember which bag tab is open.
	 */
	private static void rememberBag() {
		try {
			Field field = Reflect.field(WndBag.class, "lastBag");
			Bag bag = (Bag) field.get(null);
			if (bag != null) editBag = bag;
		} catch (Throwable ignored) {
		}
	}

	/**
	 * Called at the start of the WndBag constructor, before it replaces the open bag window.
	 */
	public static void beforeBagCreated() {
		pendingEditWindow = openingEditWindow || switchingEditTab || isOpenEditWindow(WndBag.INSTANCE);
		switchingEditTab = false;
	}

	/**
	 * Whether the bag window being built right now opens in edit mode.
	 */
	static boolean isOpeningEditWindow() {
		return pendingEditWindow;
	}

	/**
	 * Called at the end of the WndBag constructor. Switching bag tabs keeps edit mode.
	 */
	public static void afterBagCreated(Window window) {
		if (pendingEditWindow) {
			editWindows.add(window);
			decorate(window);
			rememberBag();
		}
		addShortcut(window, pendingEditWindow);
		pendingEditWindow = false;
	}

	private static void decorate(Window window) {
		try {
			addBackButton(window);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the backpack editor back button", e);
		}
		try {
			markTitle(window);
		} catch (Throwable e) {
			Log.e(TAG, "Could not mark the backpack editor title", e);
		}
	}

	private static void addShortcut(Window window, boolean editing) {
		if (!EditorSwitches.inventory() || Dungeon.hero == null || !Dungeon.hero.isAlive()) return;
		try {
			if (Reflect.bagSelector(window) != null) return;

			RedButton shortcut = new RedButton(editing ? "Add" : "Edit", 6) {
				@Override
				public void onClick() {
					window.hide();
					if (editing) {
						ItemPickerWindow.openFromBackpack();
					} else {
						Bag current = currentBag();
						open(() -> Game.scene().addToFront(new WndBag(current)), current);
					}
				}
			};
			shortcut.setRect(counterLeft(window) - SHORTCUT_WIDTH - 3, 1, SHORTCUT_WIDTH, SHORTCUT_HEIGHT);
			window.add(shortcut);
			spaceBelowHeader(window);

			if (!editing) return;
			IconButton settings = new IconButton(Icons.get(Icons.PREFS)) {
				@Override
				public void onClick() {
					window.hide();
					InventoryWindow.open();
				}
			};
			settings.setRect(shortcut.left() - SHORTCUT_HEIGHT - 2, 1, SHORTCUT_HEIGHT, SHORTCUT_HEIGHT);
			window.add(settings);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the backpack shortcut", e);
		}
	}

	/**
	 * Moves everything below the header down a little, so the Edit and Add buttons have as much space below them
	 * as above them.
	 */
	@SuppressWarnings("unchecked")
	private static void spaceBelowHeader(Window window) {
		try {
			for (Gizmo member : new ArrayList<>(Reflect.members(window))) {
				if (!(member instanceof com.watabou.noosa.ui.Component)) continue;
				com.watabou.noosa.ui.Component component = (com.watabou.noosa.ui.Component) member;
				if (component.top() < TITLE_HEIGHT - 1) continue;
				component.setPos(component.left(), component.top() + HEADER_SPACE);
			}
			window.resize(Reflect.width(window), Reflect.height(window) + HEADER_SPACE);
		} catch (Throwable e) {
			Log.e(TAG, "Could not space the backpack header", e);
		}
	}

	private static Bag currentBag() {
		try {
			Field field = Reflect.field(WndBag.class, "lastBag");
			Bag bag = (Bag) field.get(null);
			if (bag != null) return bag;
		} catch (Throwable ignored) {
		}
		return Dungeon.hero.belongings.backpack;
	}

	@SuppressWarnings("unchecked")
	private static float counterLeft(Window window) throws ReflectiveOperationException {
		float left = Reflect.width(window);
		for (Gizmo member : Reflect.members(window)) {
			if (member instanceof BitmapText) left = Math.min(left, ((BitmapText) member).x);
		}
		return left;
	}

	@SuppressWarnings("unchecked")
	private static RenderedTextBlock findTitle(Window window) throws ReflectiveOperationException {
		RenderedTextBlock title = null;
		for (Gizmo member : Reflect.members(window)) {
			if (!(member instanceof RenderedTextBlock)) continue;
			RenderedTextBlock block = (RenderedTextBlock) member;
			if (title == null || block.left() < title.left()) title = block;
		}
		return title;
	}

	private static void markTitle(Window window) throws ReflectiveOperationException {
		RenderedTextBlock title = findTitle(window);
		if (title == null) return;
		title.text(title.text() + " [Editing]");
		title.hardlight(EDIT_COLOR);
	}

	private static void addBackButton(Window window) throws ReflectiveOperationException {
		int width = Reflect.width(window);
		int height = Reflect.height(window);

		RedButton back = new RedButton("Back", 7) {
			@Override
			public void onClick() {
				window.hide();
				backAction.run(InventoryWindow::open);
			}
		};
		back.setRect(0, height + 2, width, BACK_HEIGHT);
		window.add(back);
		window.resize(width, height + 2 + BACK_HEIGHT);
	}

	/**
	 * Called before Item.actions returns.
	 */
	public static ArrayList<String> addEditAction(ArrayList<String> actions) {
		if (actions == null || !EditorSwitches.inventory()) return actions;
		if (!isOpenEditWindow(WndBag.INSTANCE)) return actions;
		if (!actions.contains(ACTION_EDIT)) actions.add(ACTION_EDIT);
		return actions;
	}

	/**
	 * Called at the start of Item.actionName. Returns null for actions it doesn't handle.
	 */
	public static String actionName(String action) {
		return ACTION_EDIT.equals(action) ? "Edit" : null;
	}

	/**
	 * Called at the start of Item.execute. Returns true when the action was handled.
	 */
	public static boolean execute(Object item, String action) {
		if (!ACTION_EDIT.equals(action) || !(item instanceof Item)) return false;
		ItemEditWindow.openFrom((Item) item, BackpackEditor::open);
		return true;
	}

	/**
	 * Called at the end of the WndUseItem constructor. In the backpack editor, tapping an item goes straight to its
	 * edit window. Anywhere else, an Edit button is added to the header.
	 */
	public static void afterUseItemCreated(Object window, Object owner, Object item) {
		if (!(window instanceof Window) || !(item instanceof Item) || !EditorSwitches.inventory()) return;
		Window useWindow = (Window) window;
		Item target = (Item) item;
		if (owner instanceof Window && isOpenEditWindow((Window) owner)) {
			useWindow.visible = false;
			Game.runOnRenderThread(() -> {
				useWindow.hide();
				ItemEditWindow.openFrom(target, BackpackEditor::open);
			});
			return;
		}
		if (Dungeon.hero == null || !Dungeon.hero.isAlive()) return;
		try {
			addHeaderEdit(useWindow, owner instanceof WndBag ? (WndBag) owner : null, target);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the Edit button to the item window", e);
		}
	}

	@SuppressWarnings("unchecked")
	private static void addHeaderEdit(Window window, WndBag owner, Item item) throws ReflectiveOperationException {
		int width = Reflect.width(window);
		int height = Reflect.height(window);

		com.watabou.noosa.ui.Component title = null;
		for (Gizmo member : Reflect.members(window)) {
			if (member.getClass().getName().endsWith(".IconTitle")) title = (com.watabou.noosa.ui.Component) member;
		}
		if (title == null) return;

		float titleWidth = title.width() - SHORTCUT_WIDTH - 4;
		float oldBottom = title.bottom();
		title.setRect(title.left(), title.top(), titleWidth, 0);
		float shift = Math.max(0, title.bottom() - oldBottom);
		if (shift > 0) {
			for (Gizmo member : new ArrayList<>(Reflect.members(window))) {
				if (member == title || !(member instanceof com.watabou.noosa.ui.Component)) continue;
				com.watabou.noosa.ui.Component component = (com.watabou.noosa.ui.Component) member;
				if (component.top() < oldBottom - 1) continue;
				component.setPos(component.left(), component.top() + shift);
			}
		}

		RedButton edit = new RedButton("Edit", 6) {
			@Override
			public void onClick() {
				window.hide();
				if (owner != null && owner.parent != null) owner.hide();
				Bag bag = currentBag();
				ItemEditWindow.openFrom(item, owner == null ? null : () -> Game.scene().addToFront(new WndBag(bag)));
			}
		};
		edit.setRect(title.right() + 3, 2, SHORTCUT_WIDTH, SHORTCUT_HEIGHT);
		window.add(edit);
		if (shift > 0) window.resize(width, (int) (height + shift));
	}
}
