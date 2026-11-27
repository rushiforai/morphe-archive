package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.items.scrolls.ScrollOfTeleportation;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.levels.features.LevelTransition;
import com.shatteredpixel.shatteredpixeldungeon.Statistics;
import com.shatteredpixel.shatteredpixeldungeon.scenes.InterlevelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.watabou.noosa.Image;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.noosa.Game;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndJournal;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.ui.Component;

import java.lang.reflect.Field;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * The Teleport patch: teleporting the hero and other creatures from the editors, and a Teleport to... button in
 * the Adventuring Notes for traveling to any floor.
 */
@SuppressWarnings("unused")
public final class Teleport {

	private static final String TAG = "Teleport";
	static final int MAX_DEPTH = 26;
	private static final int BUTTON_HEIGHT = 18;
	private static final int GAP = 2;
	static final int ENTRANCE = -1;
	static final int EXIT = -2;

	private static int pendingArrival;

	private static final Map<Object, RedButton> buttons = Collections.synchronizedMap(new WeakHashMap<>());
	private static final Map<Object, Boolean> notesGrids = Collections.synchronizedMap(new WeakHashMap<>());
	private static final String GRID_CLASS = "com.shatteredpixel.shatteredpixeldungeon.ui.ScrollingGridPane";

	private Teleport() {
	}

	/**
	 * The teleport icon at the size of the game's menu icons.
	 */
	static Image largeIcon() {
		Image icon = icon();
		if (icon.width() < 10) icon.scale.set(2f, 2f);
		return icon;
	}

	static Image icon() {
		Image icon = StatIcons.item(StatIcons.SCROLL_PASSAGE);
		return icon != null ? icon : Icons.get(Icons.BUFFS);
	}

	/**
	 * Replaced by the Teleport patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	/**
	 * Called at the end of WndJournal.NotesTab.updateList and layout. Adds a Teleport to... button below the notes.
	 */
	public static void afterNotesLayout(Object tab) {
		if (!EditorSwitches.teleport() || !(tab instanceof Component) || Dungeon.hero == null) return;
		try {
			Component notes = (Component) tab;
			Field gridField = Reflect.field(notes.getClass(), "grid");
			Object grid = gridField.get(notes);
			if (!(grid instanceof Component)) return;
			notesGrids.put(grid, Boolean.TRUE);

			RedButton button = buttons.get(notes);
			if (button == null) {
				button = new RedButton("Teleport to...", 7) {
					@Override
					public void onClick() {
						Window window = windowOf(this);
						if (window != null) window.hide();
						DepthPickerWindow.open(() -> GameScene.show(new WndJournal()));
					}
				};
				button.icon(icon());
				notes.add(button);
				buttons.put(notes, button);
			}
			float bottom = notes.top() + notes.height();
			((Component) grid).setRect(notes.left(), notes.top(), notes.width(), notes.height() - BUTTON_HEIGHT - GAP);
			button.setRect(notes.left(), bottom - BUTTON_HEIGHT, notes.width(), BUTTON_HEIGHT);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the Teleport to button", e);
		}
	}

	/**
	 * Called at the start of ScrollingGridPane.onClick. Tapping a floor header in the Adventuring Notes asks to
	 * teleport to that floor. Returns true when the tap was handled.
	 */
	public static boolean onGridClick(Object grid, float x, float y) {
		if (!EditorSwitches.teleport() || Dungeon.hero == null || !notesGrids.containsKey(grid)) return false;
		try {
			int floor = floorHeaderAt(grid, x, y);
			if (floor <= 0) return false;
			ConfirmPrompt.ask("Floor " + floor, "Teleport to floor " + floor + "?", new String[] { "Arrive at Entrance", "Arrive at Exit" }, new Runnable[] {
				() -> toDepth(floor, ENTRANCE),
				() -> toDepth(floor, EXIT),
			});
			return true;
		} catch (Throwable e) {
			Log.e(TAG, "Could not handle the notes tap", e);
			return false;
		}
	}

	private static int floorHeaderAt(Object grid, float x, float y) throws ReflectiveOperationException {
		Field itemsField = Reflect.field(Reflect.require(GRID_CLASS), "items");
		Field textField = Reflect.field(Reflect.require(GRID_CLASS + "$GridHeader"), "text");
		for (Object item : (List<?>) itemsField.get(grid)) {
			if (!item.getClass().getName().equals(GRID_CLASS + "$GridHeader")) continue;
			Component header = (Component) item;
			if (x < header.left() || x >= header.right() || y < header.top() || y >= header.bottom()) continue;
			Object text = textField.get(header);
			if (!(text instanceof RenderedTextBlock)) return 0;
			return floorNumber(((RenderedTextBlock) text).text());
		}
		return 0;
	}

	/**
	 * The floor number in a floor header such as "Floor 8", or 0 if the header holds no single floor number.
	 */
	private static int floorNumber(String text) {
		Matcher matcher = Pattern.compile("\\d+").matcher(text == null ? "" : text);
		if (!matcher.find()) return 0;
		int floor = Integer.parseInt(matcher.group());
		if (matcher.find()) return 0;
		return floor >= 1 && floor <= Statistics.deepestFloor ? floor : 0;
	}

	private static Window windowOf(Gizmo gizmo) {
		for (Gizmo current = gizmo; current != null; current = current.parent) {
			if (current instanceof Window) return (Window) current;
		}
		return null;
	}

	/**
	 * Takes the hero to [depth], arriving at its entrance or its exit.
	 */
	static void toDepth(int depth, int arrival) {
		if (Dungeon.hero == null || !Dungeon.hero.isAlive()) return;
		try {
			InterlevelScene.mode = InterlevelScene.Mode.RETURN;
			InterlevelScene.returnDepth = Math.max(1, Math.min(MAX_DEPTH, depth));
			InterlevelScene.returnBranch = 0;
			InterlevelScene.returnPos = arrival;
			pendingArrival = arrival;
			Game.switchScene(InterlevelScene.class);
		} catch (Throwable e) {
			Log.e(TAG, "Could not teleport to depth " + depth, e);
		}
	}

	/**
	 * Lets the player tap a tile on this floor and teleports the hero there.
	 */
	static void pickTile() {
		Hero hero = Dungeon.hero;
		if (hero == null || !hero.isAlive()) return;
		CellPicker.pick("Choose where to teleport", cell -> {
			if (hero.isAlive()) toCell(hero, cell);
		});
	}

	/**
	 * Teleports [ch] to [cell] on this floor, the way a Scroll of Teleportation does, or to the closest tile it can stand on.
	 */
	static void toCell(Char ch, int cell) {
		try {
			ScrollOfTeleportation.teleportToLocation(ch, cell);
		} catch (Throwable e) {
			Log.e(TAG, "Could not teleport to tile " + cell, e);
		}
	}

	/**
	 * Called at the start of Dungeon.switchLevel. After a teleport, puts the hero on the stairs to the floor above (Entrance) or below (Exit).
	 */
	public static int arrivalCell(Object target, int pos) {
		int arrival = pendingArrival;
		pendingArrival = 0;
		if (arrival == 0 || !(target instanceof Level)) return pos;
		Level level = (Level) target;
		if (level.transitions == null) return pos;
		for (LevelTransition transition : level.transitions) {
			boolean up = transition.destDepth < Dungeon.depth;
			boolean down = transition.destDepth > Dungeon.depth;
			if (arrival == ENTRANCE && up || arrival == EXIT && down) return transition.cell();
		}
		return pos;
	}
}
