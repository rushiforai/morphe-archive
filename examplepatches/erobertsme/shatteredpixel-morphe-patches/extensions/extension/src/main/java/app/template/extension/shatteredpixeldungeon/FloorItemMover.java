package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Game;
import com.watabou.noosa.Scene;

import java.util.ArrayList;
import java.util.List;

/**
 * Moves an item, or a whole pile, lying on the floor to another tile. The chosen tile is highlighted while the
 * move is confirmed.
 */
final class FloorItemMover {

	private static final String TAG = "FloorItemMover";
	private static final int TILE_SIZE = 16;
	private static final int HIGHLIGHT_COLOR = 0xFFFFFF44;
	private static final float HIGHLIGHT_ALPHA = 0.45f;

	interface Mover {
		void moveTo(int cell, boolean keepTrapActive);
	}

	private FloorItemMover() {
	}

	static void moveHeap(Heap heap) {
		String name = heap.size() > 1 ? "this pile" : InventoryEditor.capitalize(heap.title());
		choose(heap.pos, name, (cell, keep) -> moveHeapTo(heap, cell, keep));
	}

	static void moveItem(int from, Item item) {
		choose(from, InventoryEditor.capitalize(item.title()), (cell, keep) -> moveItemTo(from, item, cell, keep));
	}

	private static void choose(int from, String name, Mover mover) {
		CellPicker.pick("Choose where to move " + name, cell -> {
			if (cell == from) return;
			if (!canReceive(cell)) {
				GLog.w("Items can't be moved there.");
				return;
			}
			confirm(cell, name, mover);
		});
	}

	private static boolean canReceive(int cell) {
		Level level = Dungeon.level;
		if (level == null || cell < 0 || cell >= level.length()) return false;
		return level.passable[cell] && level.map[cell] != FloorEditor.CHASM;
	}

	private static void confirm(int cell, String name, Mover mover) {
		ColorBlock highlight = highlight(cell);
		Runnable clear = () -> {
			if (highlight == null) return;
			highlight.killAndErase();
			highlight.destroy();
		};
		String message = "Move " + name + " to the highlighted tile?";
		Trap trap = FloorEditor.trapAt(cell);
		if (trap == null || !trap.active) {
			ConfirmPrompt.askAboutTile(cell, "Move item", message, "Move", () -> mover.moveTo(cell, true), clear);
			return;
		}
		message += " There is an active " + FloorEditor.trapName(trap).toLowerCase() + " there. Moving the item won't set it off.";
		ConfirmPrompt.askAboutTile(cell, "Move item", message,
			new String[] { "Move, Keep Trap Active", "Move, Deactivate Trap" },
			new Runnable[] { () -> mover.moveTo(cell, true), () -> mover.moveTo(cell, false) },
			clear);
	}

	private static ColorBlock highlight(int cell) {
		try {
			Scene scene = Game.scene();
			int width = Dungeon.level.width();
			ColorBlock block = new ColorBlock(TILE_SIZE, TILE_SIZE, HIGHLIGHT_COLOR);
			block.x = (cell % width) * TILE_SIZE;
			block.y = (cell / width) * TILE_SIZE;
			block.alpha(HIGHLIGHT_ALPHA);
			scene.add(block);
			return block;
		} catch (Throwable e) {
			Log.e(TAG, "Could not highlight the tile", e);
			return null;
		}
	}

	private static void moveHeapTo(Heap heap, int cell, boolean keepTrapActive) {
		Level level = Dungeon.level;
		if (level == null || heap.items == null || level.heaps.get(heap.pos, null) != heap) return;
		try {
			Heap.Type type = heap.type;
			boolean wasEmpty = level.heaps.get(cell, null) == null;
			List<Item> items = new ArrayList<>(heap.items);
			heap.destroy();
			Heap moved = null;
			for (int i = items.size() - 1; i >= 0; i--) moved = FloorEditor.dropWithoutTrigger(items.get(i), cell, keepTrapActive);
			if (moved == null) return;
			if (wasEmpty && moved.pos == cell) moved.type = type;
			if (moved.sprite != null) {
				moved.sprite.view(moved);
				moved.sprite.drop();
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not move the pile", e);
		}
	}

	private static void moveItemTo(int from, Item item, int cell, boolean keepTrapActive) {
		Level level = Dungeon.level;
		if (level == null) return;
		Heap heap = level.heaps.get(from, null);
		if (heap == null || heap.items == null || !heap.items.contains(item)) return;
		try {
			heap.items.remove(item);
			if (heap.isEmpty()) {
				heap.destroy();
			} else if (heap.sprite != null) {
				heap.sprite.view(heap);
			}
			Heap moved = FloorEditor.dropWithoutTrigger(item, cell, keepTrapActive);
			if (moved != null && moved.sprite != null) moved.sprite.drop();
		} catch (Throwable e) {
			Log.e(TAG, "Could not move " + item.getClass().getName(), e);
		}
	}
}
