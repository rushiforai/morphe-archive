package app.template.extension.shatteredpixeldungeon;

/**
 * Where a window goes back to. It is kept while the window reopens itself, such as for another tab or page, and used once when you go
 * back, whether by its Back button, the device's back button or a tap outside the window.
 */
final class BackAction {

	private Runnable action;

	void set(Runnable back) {
		action = back;
	}

	/**
	 * Goes back, then forgets where to. Runs [fallback] when nothing was set.
	 */
	void run(Runnable fallback) {
		Runnable back = action;
		action = null;
		if (back != null) {
			back.run();
			return;
		}
		if (fallback != null) fallback.run();
	}

	void run() {
		run(null);
	}
}
