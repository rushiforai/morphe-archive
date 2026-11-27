package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;

/**
 * The game's own Backup & Restore, from 4.0.3 on, deletes every game in progress when it restores a backup. Before it does, you choose
 * whether to keep your games in progress or remove them as the game would.
 */
public final class BackupRestore {

	private static final String TAG = "BackupRestore";

	private static boolean chosen;
	private static boolean keepGames;

	private BackupRestore() {
	}

	/**
	 * Called at the start of the game's restore, once you confirm it. Returns true the first time, after asking about your games in
	 * progress; your answer runs the restore again.
	 */
	public static boolean beforeRestore(Object confirmation) {
		if (chosen) {
			chosen = false;
			return false;
		}
		ConfirmPrompt.ask("Games in progress", "Restoring the backup brings back your rankings, badges and journal. What should happen to your games in progress?",
			new String[] { "Keep My Games", "Remove My Games" },
			new Runnable[] { () -> restore(confirmation, true), () -> restore(confirmation, false) });
		return true;
	}

	private static void restore(Object confirmation, boolean keep) {
		chosen = true;
		keepGames = keep;
		try {
			Reflect.call(confirmation, "buttonPressed", new Class<?>[0]);
		} catch (Throwable e) {
			chosen = false;
			Log.e(TAG, "Could not restore the backup", e);
		}
	}

	/**
	 * Called in place of Dungeon.deleteGame while the backup is restored. Leaves the game in [slot] alone when you chose to keep your games.
	 */
	public static void deleteGame(int slot, boolean deleteLevels) {
		if (keepGames) return;
		Dungeon.deleteGame(slot, deleteLevels);
	}
}
