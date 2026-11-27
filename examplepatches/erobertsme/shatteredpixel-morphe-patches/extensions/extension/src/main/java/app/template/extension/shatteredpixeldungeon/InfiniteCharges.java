package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.artifacts.Artifact;
import com.shatteredpixel.shatteredpixeldungeon.items.wands.Wand;
import com.watabou.utils.Bundle;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Wands and artifacts marked in the item editor as having infinite charges. They are topped up at the start of
 * every hero turn, and the mark is saved with the item.
 */
@SuppressWarnings("unused")
public final class InfiniteCharges {

	private static final String TAG = "InfiniteCharges";
	private static final String KEY = "morphe_infinite_charges";
	private static final Set<Item> marked = Collections.newSetFromMap(new WeakHashMap<>());

	private InfiniteCharges() {
	}

	static boolean supports(Item item) {
		if (item instanceof Wand) return true;
		return item instanceof Artifact && InventoryEditor.artifactChargeMax((Artifact) item) > 0;
	}

	static synchronized boolean isOn(Item item) {
		return marked.contains(item);
	}

	static synchronized void setOn(Item item, boolean on) {
		if (on) {
			marked.add(item);
			refill(item);
			return;
		}
		marked.remove(item);
	}

	static synchronized void onStore(Object item, Bundle bundle) {
		if (marked.contains(item)) bundle.put(KEY, true);
	}

	static synchronized void onRestore(Object item, Bundle bundle) {
		try {
			if (item instanceof Item && bundle.getBoolean(KEY)) marked.add((Item) item);
		} catch (Throwable e) {
			Log.e(TAG, "Could not read the infinite charges mark", e);
		}
	}

	/**
	 * Called at the start of Hero.act.
	 */
	public static void onHeroAct(Object hero) {
		if (!InventoryWindow.isAvailable() || !(hero instanceof Hero)) return;
		Item[] items;
		synchronized (InfiniteCharges.class) {
			if (marked.isEmpty()) return;
			items = marked.toArray(new Item[0]);
		}
		try {
			for (Item item : ((Hero) hero).belongings) {
				for (Item candidate : items) {
					if (candidate == item) refill(item);
				}
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not refill charges", e);
		}
	}

	private static void refill(Item item) {
		if (item instanceof Wand) {
			Wand wand = (Wand) item;
			if (wand.curCharges < wand.maxCharges) {
				wand.curCharges = wand.maxCharges;
				Item.updateQuickslot();
			}
			return;
		}
		if (!(item instanceof Artifact)) return;
		Artifact artifact = (Artifact) item;
		int max = InventoryEditor.artifactChargeMax(artifact);
		if (InventoryEditor.artifactValue(artifact, "charge") < max) InventoryEditor.setArtifactCharge(artifact, max);
	}
}
