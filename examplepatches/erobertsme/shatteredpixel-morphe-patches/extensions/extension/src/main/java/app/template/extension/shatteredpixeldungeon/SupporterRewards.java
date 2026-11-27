package app.template.extension.shatteredpixeldungeon;

@SuppressWarnings("unused")
public final class SupporterRewards {

	public static final String[] TIER_NAMES = { "None", "Silver", "Golden", "Shattered" };
	private static final String KEY_TIER = "supporter_tier";

	private SupporterRewards() {
	}

	/**
	 * Replaced by the Supporter rewards patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	public static int tier() {
		return CloverlordSettings.getInt(KEY_TIER);
	}

	public static void tier(int value) {
		CloverlordSettings.setInt(KEY_TIER, Math.max(0, Math.min(TIER_NAMES.length - 1, value)));
	}

	/**
	 * Called at the start of Payment.isTierUnlocked. Tiers are cumulative, so Golden also unlocks Silver.
	 */
	public static boolean isTierUnlocked(int tier) {
		return tier >= 1 && tier <= tier();
	}
}
