package app.template.extension.shatteredpixeldungeon;

/**
 * The quality of life toggles in the Extras menu.
 */
final class QolSettings {


	private QolSettings() {
	}

	static final int DEFAULT_BAG_ROWS = 4;
	static final int MAX_BAG_ROWS = 8;
	private static final int BAG_COLUMNS = 5;
	private static final int DEFAULT_BAG_SLOTS = DEFAULT_BAG_ROWS * BAG_COLUMNS;
	private static final String KEY_BAG_ROWS = "qol_bag_rows";
	private static final String KEY_EXTRA_PAGE = "qol_bag_extra_page";

	/**
	 * Rows of items on each page of the backpack and every bag. The game shows 4.
	 */
	static int bagRows() {
		if (!isAvailable()) return DEFAULT_BAG_ROWS;
		int rows = CloverlordSettings.getInt(KEY_BAG_ROWS);
		return rows <= 0 ? DEFAULT_BAG_ROWS : Math.max(DEFAULT_BAG_ROWS, Math.min(MAX_BAG_ROWS, rows));
	}

	static void bagRows(int rows) {
		CloverlordSettings.setInt(KEY_BAG_ROWS, Math.max(DEFAULT_BAG_ROWS, Math.min(MAX_BAG_ROWS, rows)));
	}

	static boolean extraBagPage() {
		return isAvailable() && CloverlordSettings.get(KEY_EXTRA_PAGE);
	}

	static void extraBagPage(boolean on) {
		CloverlordSettings.set(KEY_EXTRA_PAGE, on);
	}

	/**
	 * Item slots in each bag across its pages.
	 */
	static int bagSlots() {
		return bagRows() * BAG_COLUMNS * (extraBagPage() ? 2 : 1);
	}

	/**
	 * How many more items each bag holds than in the normal game.
	 */
	static int extraBagSlots() {
		return Math.max(0, bagSlots() - DEFAULT_BAG_SLOTS);
	}

	static boolean isAvailable() {
		return PathPreview.isAvailable();
	}

	private static final String KEY_RESUME_PATH_OFF = "qol_resume_path_off";
	private static final String KEY_FORCE_ATTACK_OFF = "qol_force_attack_off";
	private static final String KEY_FORCE_ATTACK_ENCHANTS_OFF = "qol_force_attack_enchants_off";

	/**
	 * Whether the rest of an interrupted walk is drawn while the game's resume button shows.
	 */
	static boolean resumePath() {
		return isAvailable() && !CloverlordSettings.get(KEY_RESUME_PATH_OFF);
	}

	static void resumePath(boolean on) {
		CloverlordSettings.set(KEY_RESUME_PATH_OFF, !on);
		com.watabou.noosa.Game.runOnRenderThread(ResumePath::refresh);
	}

	/**
	 * Whether the Attack Tile button shows above the backpack button.
	 */
	static boolean forceAttack() {
		return isAvailable() && !CloverlordSettings.get(KEY_FORCE_ATTACK_OFF);
	}

	static void forceAttack(boolean on) {
		CloverlordSettings.set(KEY_FORCE_ATTACK_OFF, !on);
	}

	/**
	 * Whether attacking an empty tile can set off the weapon's enchantment on that tile.
	 */
	static boolean forceAttackEnchants() {
		return isAvailable() && !CloverlordSettings.get(KEY_FORCE_ATTACK_ENCHANTS_OFF);
	}

	private static final String KEY_BESTIARY_OFF = "qol_enhanced_bestiary_off";
	private static final String KEY_HERO_STATS_OFF = "qol_hero_stats_off";

	/**
	 * Whether the hero info window has a button that shows your hero's stats.
	 */
	static boolean heroStatsButton() {
		return isAvailable() && !CloverlordSettings.get(KEY_HERO_STATS_OFF);
	}

	static void heroStatsButton(boolean on) {
		CloverlordSettings.set(KEY_HERO_STATS_OFF, !on);
	}

	/**
	 * Whether creature info windows get the Enhanced Bestiary's Stats and [i] buttons.
	 */
	static boolean enhancedBestiary() {
		return isAvailable() && !CloverlordSettings.get(KEY_BESTIARY_OFF);
	}

	static void enhancedBestiary(boolean on) {
		CloverlordSettings.set(KEY_BESTIARY_OFF, !on);
	}

	static void forceAttackEnchants(boolean on) {
		CloverlordSettings.set(KEY_FORCE_ATTACK_ENCHANTS_OFF, !on);
	}


}
