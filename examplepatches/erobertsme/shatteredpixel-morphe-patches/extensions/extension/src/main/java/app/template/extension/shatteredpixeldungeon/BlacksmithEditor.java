package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;

/**
 * An Edit button in the troll blacksmith's window, for how much favor you have with him and whether he lets you down into the mine,
 * even after his quest is done.
 */
public final class BlacksmithEditor {

	private static final String TAG = "BlacksmithEditor";
	private static final String QUEST = "com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs.Blacksmith$Quest";
	private static final String WINDOW = "com.shatteredpixel.shatteredpixeldungeon.windows.WndBlacksmith";
	private static final int FAVOR_STEP = 500;
	private static final String KEY_MINE_OPEN = "blacksmith_mine_open";

	private static Object pendingTroll;

	private BlacksmithEditor() {
	}

	/**
	 * Called at the start of the WndBlacksmith constructor with the blacksmith.
	 */
	public static void beforeWindow(Object troll) {
		pendingTroll = troll;
	}

	/**
	 * Called at the end of the WndBlacksmith constructor. Adds the Edit button.
	 */
	public static void afterWindow(Object window) {
		Object troll = pendingTroll;
		pendingTroll = null;
		if (!(window instanceof Window) || troll == null || !EditorSwitches.floor()) return;
		try {
			WindowHeader.addEdit((Window) window, () -> {
				((Window) window).hide();
				EditorWindow.show(new BlacksmithWindow(() -> reopen(troll)));
			});
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the Edit button", e);
		}
	}

	private static void reopen(Object troll) {
		try {
			Class<?> type = Reflect.require(WINDOW);
			Object window = type.getConstructors()[0].newInstance(troll, Dungeon.hero);
			EditorWindow.show((Window) window);
		} catch (Throwable e) {
			Log.e(TAG, "Could not reopen the blacksmith", e);
		}
	}

	static int favor() {
		try {
			return Reflect.field(Reflect.require(QUEST), "favor").getInt(null);
		} catch (Throwable e) {
			return 0;
		}
	}

	/**
	 * Sets the favor, rounded up to a whole step of 500.
	 */
	static void favor(int value) {
		int rounded = (Math.max(0, value) + FAVOR_STEP - 1) / FAVOR_STEP * FAVOR_STEP;
		try {
			Reflect.field(Reflect.require(QUEST), "favor").setInt(null, rounded);
		} catch (Throwable e) {
			Log.e(TAG, "Could not set the favor", e);
		}
	}

	static boolean mineOpen() {
		return GameSettings.override(KEY_MINE_OPEN) == Boolean.TRUE;
	}

	static void mineOpen(boolean open) {
		GameSettings.store(KEY_MINE_OPEN, open);
	}

	/**
	 * Called with whether the blacksmith still has services to offer when you talk to him after his quest. With the Floor editor on, his
	 * window opens even once your favor is used up, so its Edit button can add more.
	 */
	public static boolean servicesShown(boolean available) {
		return available || EditorSwitches.floor();
	}

	/**
	 * Called with each answer the caves floor checks before letting you down into the mine: whether the quest was given, started or
	 * completed. While the blacksmith lets you down, the way is open as during his quest.
	 */
	public static boolean questGiven(boolean given) {
		return given || mineOpen();
	}

	public static boolean questStarted(boolean started) {
		return started || mineOpen();
	}

	public static boolean questCompleted(boolean completed) {
		return completed && !mineOpen();
	}

	/**
	 * Favor and the way down into the mine.
	 */
	static final class BlacksmithWindow extends EditorWindow {

		private static final String INFO = "Blacksmith\n\n"
			+ "_Favor:_ what the blacksmith's services cost you. It changes in steps of 500. Long-press - or + to change it by 10 steps, or tap it to type it; a typed amount rounds up to the next 500.\n"
			+ "_Allow mine access:_ he lets you down into the mine below, even once his quest is done. Leaving the mine doesn't end the quest again.";

		private final Runnable back;

		BlacksmithWindow(Runnable back) {
			super();
			this.back = back;
			addTitle("Blacksmith", INFO);
			int favor = favor();
			addStepper("Favor", String.valueOf(favor), favor, FAVOR_STEP, 0, 99999, BlacksmithEditor::favor);
			addCheckBox("Allow mine access", mineOpen(), () -> mineOpen(!mineOpen()));
			pos += GAP;
			finishWithBack(back);
		}

		@Override
		protected void reopen() {
			show(new BlacksmithWindow(back));
		}
	}
}
