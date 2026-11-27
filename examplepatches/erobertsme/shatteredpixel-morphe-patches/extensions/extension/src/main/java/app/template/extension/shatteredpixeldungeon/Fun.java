package app.template.extension.shatteredpixeldungeon;

/**
 * The Fun patch: options that change how the game looks or plays just for fun.
 */
public final class Fun {

	private Fun() {
	}

	/**
	 * Whether the Fun patch is included. The patch makes this return true.
	 */
	public static boolean isAvailable() {
		return false;
	}
}
