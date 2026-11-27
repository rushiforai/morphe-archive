package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.plants.Plant;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.tiles.TerrainFeaturesTilemap;
import com.watabou.noosa.Image;

import java.util.ArrayList;

public class TileContentsWindow extends EditorWindow {

	private static final String INFO = "On this tile\n\n"
		+ "Everything on the tile you examined. Tap a row to see its details.\n\n"
		+ "## Piles\nEach item in a pile is listed. Pick one and use _Pick Up_ to take that item instead of the top one.\nWith the Floor editor on, _Move Item_ lets you tap another tile to move just that item.\n\n"
		+ "## Containers\nItems that ended up inside a grave, skeleton or chest after the floor was made, like gold dropped by a creature defeated on a grave, are listed under it. What the container held from the start stays hidden until you open it.";

	private final int cell;

	public TileContentsWindow(int cell) {
		super();
		this.cell = cell;
		addTitle("On this tile", INFO);
		for (Object object : TileContents.objectsAt(cell)) addObject(object);
		finish();
	}

	private void addObject(Object object) {
		if (object instanceof Heap) {
			addHeap((Heap) object);
			return;
		}
		if (object instanceof Hero) {
			addListRow("You (" + InventoryEditor.capitalize(((Hero) object).className()) + ")", null, false, true, () -> examine(object), null);
			return;
		}
		if (object instanceof Mob) {
			Mob mob = (Mob) object;
			addListRow(InventoryEditor.capitalize(mob.name()), mobIcon(mob), false, true, () -> examine(object), null);
			return;
		}
		if (object instanceof Plant) {
			addListRow(InventoryEditor.capitalize(((Plant) object).name()), featureIcon(), false, true, () -> examine(object), null);
			return;
		}
		if (object instanceof Trap) {
			addListRow(InventoryEditor.capitalize(((Trap) object).name()), featureIcon(), false, true, () -> examine(object), null);
		}
	}

	private void addHeap(Heap heap) {
		if (heap.type != Heap.Type.HEAP || heap.items == null) {
			addListRow(InventoryEditor.capitalize(heap.title()), heapIcon(heap), false, true, () -> examine(heap), null);
			for (Item item : TileContents.absorbedIn(heap)) {
				addListRow("  " + InventoryEditor.capitalize(item.title()) + " (inside)", new ItemSprite(item), false, true, () -> replaceWith(new PileItemWindow(cell, item)), null);
			}
			return;
		}
		for (Item item : new ArrayList<>(heap.items)) {
			addListRow(InventoryEditor.capitalize(item.title()), new ItemSprite(item), false, true, () -> replaceWith(new PileItemWindow(cell, item)), null);
		}
	}

	private void examine(Object object) {
		hide();
		GameScene.examineObject(object);
	}

	private static Image mobIcon(Mob mob) {
		try {
			return mob.sprite();
		} catch (Throwable e) {
			return null;
		}
	}

	private static Image heapIcon(Heap heap) {
		try {
			return new ItemSprite(heap);
		} catch (Throwable e) {
			return null;
		}
	}

	private Image featureIcon() {
		try {
			return TerrainFeaturesTilemap.tile(cell, Dungeon.level.map[cell]);
		} catch (Throwable e) {
			return null;
		}
	}

	@Override
	protected void reopen() {
		show(new TileContentsWindow(cell));
	}
}
