package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;

/**
 * One item from a pile, with a button to pick up that item rather than the one on top.
 */
public class PileItemWindow extends EditorWindow {

	private static final String TAG = "PileItemWindow";

	private final int cell;
	private final Item item;

	public PileItemWindow(int cell, Item item) {
		super();
		this.cell = cell;
		this.item = item;
		addItemDetails(item);

		float half = (WIDTH - GAP) / 2f;
		backTo(() -> show(new TileContentsWindow(cell)));
		addBackButton(0, half);
		addButton(Dungeon.hero != null && Dungeon.hero.pos == cell ? "Pick up" : "Go pick up", half + GAP, half, this::pickUp).enable(heap() != null);
		pos += ROW_HEIGHT;
		if (EditorSwitches.floor()) {
			pos += GAP;
			addButton("Move Item", 0, WIDTH, () -> {
				hide();
				FloorItemMover.moveItem(cell, item);
			}).enable(heap() != null);
			pos += ROW_HEIGHT;
		}
		finish();
	}

	private Heap heap() {
		Heap heap = Dungeon.level == null ? null : Dungeon.level.heaps.get(cell, null);
		if (heap == null || heap.type != Heap.Type.HEAP || heap.items == null || !heap.items.contains(item)) return null;
		return heap;
	}

	private void pickUp() {
		hide();
		try {
			Heap heap = heap();
			Hero hero = Dungeon.hero;
			if (heap == null || hero == null || !hero.ready) return;
			heap.items.remove(item);
			heap.items.addFirst(item);
			if (heap.sprite != null) heap.sprite.view(heap);
			if (hero.handle(cell)) hero.next();
		} catch (Throwable e) {
			Log.e(TAG, "Could not pick up " + item.getClass().getName(), e);
		}
	}

	@Override
	protected void reopen() {
		show(new PileItemWindow(cell, item));
	}
}
