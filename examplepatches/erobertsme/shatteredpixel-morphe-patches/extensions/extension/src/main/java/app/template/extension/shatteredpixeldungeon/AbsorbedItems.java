package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.watabou.utils.Bundle;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Remembers items that landed in a grave, skeleton, chest or other container after the floor was made, such as
 * gold dropped by a creature defeated on a grave, so the tile list can show them.
 */
@SuppressWarnings("unused")
public final class AbsorbedItems {

	private static final String KEY = "morphe_absorbed";
	private static final Map<Item, Boolean> absorbed = Collections.synchronizedMap(new WeakHashMap<>());

	private AbsorbedItems() {
	}

	static boolean isAbsorbed(Item item) {
		return absorbed.containsKey(item);
	}

	static boolean isContainer(Heap heap) {
		return heap.type != Heap.Type.HEAP && heap.type != Heap.Type.FOR_SALE;
	}

	/**
	 * Called at the start of Heap.drop.
	 */
	public static void onDrop(Object heap, Object item) {
		if (!(heap instanceof Heap) || !(item instanceof Item)) return;
		Heap target = (Heap) heap;
		if (target.type != null && isContainer(target)) absorbed.put((Item) item, Boolean.TRUE);
	}

	/**
	 * Called at the start of Item.storeInBundle.
	 */
	public static void store(Object item, Object bundle) {
		if (!(bundle instanceof Bundle) || !absorbed.containsKey(item)) return;
		((Bundle) bundle).put(KEY, true);
	}

	/**
	 * Called at the start of Item.restoreFromBundle.
	 */
	public static void restore(Object item, Object bundle) {
		if (!(item instanceof Item) || !(bundle instanceof Bundle)) return;
		if (((Bundle) bundle).getBoolean(KEY)) absorbed.put((Item) item, Boolean.TRUE);
	}
}
