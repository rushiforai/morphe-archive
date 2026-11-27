package app.template.extension.shatteredpixeldungeon;

/**
 * Equipping and taking off equipment without using a turn, the way the Duelist swaps weapons instantly, while the Inventory editor takes
 * off an equipped item to delete it or change its type or tier.
 */
public final class InstantEquip {

	private static boolean editing;

	private InstantEquip() {
	}

	/**
	 * Called at the end of EquipableItem.timeToEquip, which weapons, armor, rings and artifacts all use. Returns no time while equipping
	 * is instant.
	 */
	public static float adjustEquipTime(float time) {
		return editing ? 0 : time;
	}

	/**
	 * Runs [change], an editor's change to equipped items, without it using a turn.
	 */
	static void whileEditing(Runnable change) {
		editing = true;
		try {
			change.run();
		} finally {
			editing = false;
		}
	}
}
