package app.template.extension.shatteredpixeldungeon;

import com.watabou.utils.Bundle;

/**
 * Extra data the editors keep with an item in its save: infinite charges and a changed tier.
 */
@SuppressWarnings("unused")
public final class ItemData {

	private ItemData() {
	}

	/**
	 * Called at the start of Item.storeInBundle.
	 */
	public static void onStore(Object item, Bundle bundle) {
		if (bundle == null) return;
		InfiniteCharges.onStore(item, bundle);
	}

	/**
	 * Called at the start of Item.restoreFromBundle.
	 */
	public static void onRestore(Object item, Bundle bundle) {
		if (bundle == null) return;
		InfiniteCharges.onRestore(item, bundle);
	}
}
