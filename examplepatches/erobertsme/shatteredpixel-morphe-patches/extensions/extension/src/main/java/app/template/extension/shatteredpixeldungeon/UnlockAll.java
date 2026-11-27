package app.template.extension.shatteredpixeldungeon;

@SuppressWarnings("unused")
public final class UnlockAll {

	public static final String HEROES = "unlock_heroes";
	public static final String GUIDES = "unlock_guides";
	public static final String LORE = "unlock_lore";
	public static final String ITEMS = "unlock_items";
	public static final String BESTIARY = "unlock_bestiary";

	private UnlockAll() {
	}

	/**
	 * Replaced by the Unlock all patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	public static boolean unlockHeroes() {
		return CloverlordSettings.get(HEROES);
	}

	public static boolean unlockItems() {
		return CloverlordSettings.get(ITEMS);
	}

	public static boolean unlockBestiary() {
		return CloverlordSettings.get(BESTIARY);
	}

	public static boolean isDocumentUnlocked(Object document) {
		if (!(document instanceof Enum)) return false;
		String name = ((Enum<?>) document).name();
		boolean guide = name.equals("ADVENTURERS_GUIDE") || name.equals("ALCHEMY_GUIDE");
		return CloverlordSettings.get(guide ? GUIDES : LORE);
	}
}
