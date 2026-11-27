package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.GamesInProgress;
import com.shatteredpixel.shatteredpixeldungeon.Statistics;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.scenes.InterlevelScene;
import com.watabou.noosa.Game;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

/**
 * Extra saves of the game in progress. Each game gets its own folder in the save folder, named after its save slot
 * and seed (game1_1a2b3c), next to the game's own folder, so saves of one game can never be loaded into another and backups include them.
 */
public final class GameSaves {

	private static final String TAG = "GameSaves";
	private static final String OLD_ROOT = "morphe_saves";
	private static final String KEPT_PREFIX = "gamesave_kept_";
	private static final java.util.regex.Pattern FOLDER = java.util.regex.Pattern.compile("game(\\d+)_([0-9a-f]+)");
	private static final java.util.regex.Pattern UNDO_FOLDER = java.util.regex.Pattern.compile("(\\d+)_(-?\\d+)");
	private static final String INFO_FILE = "morphe_save_info.properties";
	private static final String PREVIEW_FILE = "morphe_save_preview.bin";
	private static final String PICTURE_FILE = "morphe_save_picture.png";
	private static final String HERO_FILE = "morphe_save_hero.dat";
	private static final String[] SAVE_ONLY_FILES = { INFO_FILE, PREVIEW_FILE, PICTURE_FILE, HERO_FILE };
	private static final String GAME_FILE = "game.dat";
	static final int MAX_SAVES = 10;
	static final int MAX_AUTO_SAVES = 5;

	/**
	 * A saved moment of a game: a Game Save, or an undo step. Both are a folder with a copy of the game's files and the same files about the
	 * moment. An undo step is partial: it only holds the game file and the floor the hero was on, and the slot keeps its other floors.
	 */
	static final class Save {
		final File folder;
		final String label;
		final long time;
		final boolean locked;
		final boolean auto;
		final boolean partial;
		final int depth;
		final int branch;
		final int turn;
		final int hp;
		final int ht;

		private Save(File folder, Properties info) {
			this.folder = folder;
			label = info.getProperty("label", folder.getName());
			time = parseLong(info.getProperty("time"), folder.lastModified());
			locked = Boolean.parseBoolean(info.getProperty("locked"));
			auto = Boolean.parseBoolean(info.getProperty("auto"));
			partial = Boolean.parseBoolean(info.getProperty("partial"));
			depth = (int) parseLong(info.getProperty("depth"), -1);
			branch = (int) parseLong(info.getProperty("branch"), 0);
			turn = (int) parseLong(info.getProperty("turn"), -1);
			hp = (int) parseLong(info.getProperty("hp"), -1);
			ht = (int) parseLong(info.getProperty("ht"), -1);
		}

		/**
		 * The save in [folder] described by [info], for one still being written.
		 */
		static Save of(File folder, Properties info) {
			return new Save(folder, info);
		}

		/**
		 * The save in [folder], read from its details, or null when it has none yet.
		 */
		static Save read(File folder) {
			File infoFile = new File(folder, INFO_FILE);
			if (!infoFile.isFile()) return null;
			Properties info = new Properties();
			try (InputStream in = new FileInputStream(infoFile)) {
				info.load(in);
			} catch (IOException e) {
				return null;
			}
			return new Save(folder, info);
		}

		/**
		 * What the game looked like when this save was made, or null for saves made before previews were kept.
		 */
		UndoScene preview() {
			File file = new File(folder, PREVIEW_FILE);
			if (!file.isFile()) return null;
			try (DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(file)))) {
				return UndoScene.read(in);
			} catch (IOException e) {
				return null;
			}
		}

		/**
		 * The picture of the dungeon around the hero taken from the game's own drawing when this save was made, or null for older saves.
		 */
		File picture() {
			File file = new File(folder, PICTURE_FILE);
			return file.isFile() ? file : null;
		}

		String title() {
			if (partial) return "Depth " + depth + ", turn " + turn + ", HP " + hp + "/" + ht;
			return label + " - " + date();
		}

		/**
		 * The save's heading for its preview: the hero's class and level, and under it when the save was made, or "Undo step" for an
		 * undo step. The hero is read from the save's [preview].
		 */
		String heading(UndoScene preview) {
			HeroCard hero = preview == null ? null : preview.hero;
			String who = hero == null || hero.title.isEmpty() ? null : InventoryEditor.capitalize(hero.title) + " Lv " + hero.level;
			if (partial) return who == null ? "Undo step" : who + "\nUndo step";
			if (who == null) return title();
			return (auto ? "Auto: " : "") + who + "\n" + date();
		}

		/**
		 * The seed of the game this save belongs to, read from the name of the folder its game's saves or undo steps are kept in, or -1
		 * when it can't be told.
		 */
		long seed() {
			File parent = folder.getParentFile();
			if (parent == null) return -1;
			java.util.regex.Matcher saves = FOLDER.matcher(parent.getName());
			if (saves.matches()) return Long.parseUnsignedLong(saves.group(2), 16);
			java.util.regex.Matcher steps = UNDO_FOLDER.matcher(parent.getName());
			return steps.matches() ? Long.parseLong(steps.group(2)) : -1;
		}

		String date() {
			return new SimpleDateFormat("MMM d, HH:mm", Locale.US).format(new Date(time));
		}
	}

	private GameSaves() {
	}

	static boolean isAvailable() {
		return SaveBackupActivity.isAvailable() && GameSettings.inGame();
	}

	private static File saveRoot() {
		return SaveLocation.currentRoot();
	}

	private static File gameFolder() {
		return slotFolder(GamesInProgress.curSlot);
	}

	/**
	 * The folder the game keeps the game in [slot] in, or null when the save folder can't be found.
	 */
	static File slotFolder(int slot) {
		File root = saveRoot();
		if (root == null) return null;
		return new File(root, GamesInProgress.gameFolder(slot));
	}

	private static volatile boolean copying;

	/**
	 * Saves the game to copy it, for a Game Save or an undo step. The game in progress's own preview is only kept when the game saves itself.
	 */
	static void saveForCopy() throws IOException {
		copying = true;
		try {
			Dungeon.saveAll();
		} finally {
			copying = false;
		}
	}

	static boolean isCopying() {
		return copying;
	}

	private static File savesFolder() {
		File root = saveRoot();
		if (root == null) return null;
		moveOldFolders(root);
		String name = GamesInProgress.gameFolder(GamesInProgress.curSlot) + "_" + Long.toHexString(Dungeon.seed);
		return new File(root, name);
	}

	/**
	 * Earlier versions kept game saves inside a morphe_saves folder. Moves them next to the game folders.
	 */
	private static void moveOldFolders(File root) {
		File old = new File(root, OLD_ROOT);
		File[] children = old.listFiles();
		if (children == null) return;
		for (File child : children) {
			File target = new File(root, child.getName());
			if (!target.exists()) child.renameTo(target);
		}
		String[] left = old.list();
		if (left == null || left.length == 0) old.delete();
	}

	/**
	 * Called when the title screen opens. Asks what to do with the saves of each game that has ended, one game at
	 * a time.
	 */
	static void checkFinishedGames(com.watabou.noosa.Group scene) {
		try {
			if (!SaveBackupActivity.isAvailable()) return;
			if (CrashLog.showIfAny(scene)) return;
			File finished = nextFinished();
			if (finished != null) {
				scene.addToFront(prompt(finished));
				return;
			}
			ConfirmPrompt undoOnly = damagedWithUndoSteps();
			if (undoOnly != null) scene.addToFront(undoOnly);
		} catch (Throwable e) {
			Log.e(TAG, "Could not check for finished games", e);
		}
	}

	private static ConfirmPrompt prompt(File folder) {
		java.util.regex.Matcher matcher = FOLDER.matcher(folder.getName());
		int slot = matcher.matches() ? Integer.parseInt(matcher.group(1)) : -1;
		List<Save> saves = savesIn(folder);
		boolean damaged = slot > 0 && isDamaged(slot);
		boolean canRestore = slot > 0 && !saves.isEmpty() && slotFree(slot);
		String latest = saves.isEmpty() ? "" : " Its latest save: " + saves.get(0).title() + ".";
		String count = saves.size() + (saves.size() == 1 ? " save" : " saves");
		String message = damaged
			? "Your game in slot " + slot + " can't be read. Its save file may have been damaged, for example if the phone shut down while the game was saving. It has " + count + "." + latest
				+ "\n\nRestore a save to keep playing from it, keep the saves for later, or delete them."
			: "Your game in slot " + (slot > 0 ? String.valueOf(slot) : "?") + " has ended. It has " + count + " left over." + latest
				+ "\n\nDelete them, or keep them? If any are locked, you'll be asked about those next. Kept saves can be removed later with Clean Up Saves in Extras on the main menu.";
		Runnable delete = () -> {
			deleteStoredHistory(folder);
			if (deleteUnlocked(folder)) {
				EditorWindow.show(lockedPrompt(folder));
			} else {
				askNext();
			}
		};
		Runnable keep = () -> {
			CloverlordSettings.set(KEPT_PREFIX + folder.getName(), true);
			askNext();
		};
		String title = damaged ? "Damaged Game" : "Finished Game";
		long seed = matcher.matches() ? new java.math.BigInteger(matcher.group(2), 16).longValue() : 0;
		boolean hasUndo = damaged && !UndoHistory.storedSteps(slot, seed).isEmpty();
		Runnable restoreUndo = () -> EditorWindow.show(RestoreSaveWindow.undoSteps(slot, seed, () -> askAgain(folder)));
		if (!canRestore && hasUndo) return new ConfirmPrompt(title, message, new String[] { "Restore an Undo Step", "Keep Saves", "Delete Saves" }, new Runnable[] { restoreUndo, keep, delete });
		if (!canRestore) return new ConfirmPrompt(title, message, new String[] { "Delete Saves", "Keep Saves" }, new Runnable[] { delete, keep });
		Runnable restore = () -> EditorWindow.show(RestoreSaveWindow.saves(folder, slot));
		if (hasUndo) return new ConfirmPrompt(title, message, new String[] { "Restore a Save", "Restore an Undo Step", "Keep Saves", "Delete Saves" }, new Runnable[] { restore, restoreUndo, keep, delete });
		if (damaged) return new ConfirmPrompt(title, message, new String[] { "Restore a Save", "Keep Saves", "Delete Saves" }, new Runnable[] { restore, keep, delete });
		return new ConfirmPrompt(title, message, new String[] { "Delete Saves", "Keep Saves", "Restore a Save" }, new Runnable[] { delete, keep, restore });
	}

	/**
	 * A prompt for a damaged game that has kept undo steps but no Game Saves, or null when there is none.
	 */
	private static ConfirmPrompt damagedWithUndoSteps() {
		for (long[] game : UndoHistory.storedGames()) {
			int slot = (int) game[0];
			long seed = game[1];
			if (!isDamaged(slot) || CloverlordSettings.get(KEPT_PREFIX + "undo_" + slot + "_" + seed)) continue;
			List<Save> steps = UndoHistory.storedSteps(slot, seed);
			if (steps.isEmpty()) continue;
			String message = "Your game in slot " + slot + " can't be read. Its save file may have been damaged, for example if the phone shut down while the game was saving. It has "
				+ steps.size() + (steps.size() == 1 ? " undo step" : " undo steps") + " kept. The latest: " + steps.get(0).title() + "."
				+ "\n\nRestore an undo step to keep playing from it.";
			return new ConfirmPrompt("Damaged Game", message, new String[] { "Restore an Undo Step", "Not Now" }, new Runnable[] {
				() -> EditorWindow.show(RestoreSaveWindow.undoSteps(slot, seed, null)),
				() -> CloverlordSettings.set(KEPT_PREFIX + "undo_" + slot + "_" + seed, true),
			});
		}
		return null;
	}

	/**
	 * Whether the game in [slot] has files, but its main save file can't be read.
	 */
	static boolean isDamaged(int slot) {
		File root = saveRoot();
		if (root == null) return false;
		File[] files = new File(root, GamesInProgress.gameFolder(slot)).listFiles();
		return files != null && files.length > 0 && GamesInProgress.check(slot) == null;
	}

	private static boolean slotFree(int slot) {
		try {
			return GamesInProgress.check(slot) == null;
		} catch (Throwable e) {
			return false;
		}
	}

	/**
	 * The saves of a finished game's [folder], newest first.
	 */
	static List<Save> savesOf(File folder) {
		return savesIn(folder);
	}

	/**
	 * Puts [save] back into [slot] as the game in progress there. Anything already in the slot is moved to the app's cache first, so nothing
	 * is lost. Returns an error message, or null when it worked.
	 */
	static String restoreToSlot(Save save, File folder, int slot) {
		try {
			File root = saveRoot();
			if (root == null || !save.folder.isDirectory()) return "That save could not be found.";
			if (!slotFree(slot)) return "Slot " + slot + " already has a game in it.";
			File target = new File(root, GamesInProgress.gameFolder(slot));
			File[] current = target.listFiles();
			File cache = SaveLocation.cacheDir();
			if (current != null && current.length > 0 && cache != null) FileHelpers.copy(target, new File(cache, "replaced_" + target.getName() + "_" + System.currentTimeMillis()));
			putInSlot(save, target);
			GamesInProgress.setUnknown(slot);
			CloverlordSettings.set(KEPT_PREFIX + folder.getName(), false);
			Game.resetScene();
			return null;
		} catch (Throwable e) {
			Log.e(TAG, "Could not restore the save", e);
			return "Restoring failed: " + e.getMessage();
		}
	}

	/**
	 * Deletes the kept undo history of the game a finished [folder] belongs to.
	 */
	private static void deleteStoredHistory(File folder) {
		java.util.regex.Matcher matcher = FOLDER.matcher(folder.getName());
		if (!matcher.matches()) return;
		try {
			UndoHistory.deleteStored(Integer.parseInt(matcher.group(1)), new java.math.BigInteger(matcher.group(2), 16).longValue());
		} catch (Throwable e) {
			Log.e(TAG, "Could not delete the undo history", e);
		}
	}

	/**
	 * Asks whether the locked saves left in a finished game's [folder] should go too.
	 */
	private static ConfirmPrompt lockedPrompt(File folder) {
		int locked = savesIn(folder).size();
		String message = (locked == 1 ? "1 locked save is" : locked + " locked saves are") + " left from this game. Delete "
			+ (locked == 1 ? "it" : "them") + " too, or keep " + (locked == 1 ? "it" : "them") + "?";
		return new ConfirmPrompt("Locked Saves", message, new String[] { "Delete Locked Saves", "Keep Locked Saves" }, new Runnable[] {
			() -> {
				FileHelpers.delete(folder);
				CloverlordSettings.set(KEPT_PREFIX + folder.getName(), false);
				askNext();
			},
			() -> {
				CloverlordSettings.set(KEPT_PREFIX + folder.getName(), true);
				askNext();
			},
		});
	}

	/**
	 * Shows the finished game prompt for [folder] again.
	 */
	static void askAgain(File folder) {
		EditorWindow.show(prompt(folder));
	}

	private static void askNext() {
		File next = nextFinished();
		if (next != null) EditorWindow.show(prompt(next));
	}

	private static File nextFinished() {
		for (File folder : finishedFolders()) {
			if (!CloverlordSettings.get(KEPT_PREFIX + folder.getName())) return folder;
		}
		return null;
	}

	/**
	 * Game save folders whose game has ended: the slot is empty, or now holds a different game.
	 */
	static List<File> finishedFolders() {
		List<File> finished = new ArrayList<>();
		File root = saveRoot();
		if (root == null) return finished;
		moveOldFolders(root);
		File[] children = root.listFiles();
		if (children == null) return finished;
		Arrays.sort(children);
		for (File child : children) {
			if (!child.isDirectory()) continue;
			java.util.regex.Matcher matcher = FOLDER.matcher(child.getName());
			if (!matcher.matches()) continue;
			if (isRunning(Integer.parseInt(matcher.group(1)), matcher.group(2))) continue;
			finished.add(child);
		}
		return finished;
	}

	private static boolean isRunning(int slot, String seed) {
		try {
			GamesInProgress.Info info = GamesInProgress.check(slot);
			return info != null && Long.toHexString(info.seed).equals(seed);
		} catch (Throwable e) {
			return true;
		}
	}

	/**
	 * Deletes the saves of every finished game.
	 */
	static int cleanUp() {
		int count = 0;
		for (File folder : finishedFolders()) {
			boolean kept = deleteUnlocked(folder);
			CloverlordSettings.set(KEPT_PREFIX + folder.getName(), kept);
			count++;
		}
		return count;
	}

	/**
	 * This game's saves, newest first.
	 */
	static List<Save> list() {
		return savesIn(savesFolder());
	}

	private static List<Save> savesIn(File folder) {
		List<Save> saves = new ArrayList<>();
		File[] children = folder == null ? null : folder.listFiles();
		if (children == null) return saves;
		for (File child : children) {
			if (!child.isDirectory()) continue;
			Save save = Save.read(child);
			saves.add(save != null ? save : new Save(child, new Properties()));
		}
		saves.sort((a, b) -> Long.compare(b.time, a.time));
		return saves;
	}

	/**
	 * How many saves count toward the limit. Locked saves don't.
	 */
	static int unlockedCount() {
		return unlockedCount(false);
	}

	/**
	 * How many unlocked saves of one kind there are: auto saves, or saves you made.
	 */
	private static int unlockedCount(boolean auto) {
		int count = 0;
		for (Save save : list()) {
			if (!save.locked && save.auto == auto) count++;
		}
		return count;
	}

	/**
	 * The oldest save that isn't locked, which a new save replaces once the limit is reached, or null if there is none.
	 */
	static Save oldestUnlocked() {
		return oldestUnlocked(false);
	}

	private static Save oldestUnlocked(boolean auto) {
		Save oldest = null;
		for (Save save : list()) {
			if (!save.locked && save.auto == auto && (oldest == null || save.time < oldest.time)) oldest = save;
		}
		return oldest;
	}

	/**
	 * Locks or unlocks [save]. Returns an error message, or null when it worked.
	 */
	static String setLocked(Save save, boolean locked) {
		File infoFile = new File(save.folder, INFO_FILE);
		Properties info = new Properties();
		try {
			if (infoFile.isFile()) {
				try (InputStream in = new FileInputStream(infoFile)) {
					info.load(in);
				}
			} else {
				info.setProperty("time", String.valueOf(save.time));
				info.setProperty("label", save.label);
			}
			info.setProperty("locked", String.valueOf(locked));
			try (OutputStream out = new FileOutputStream(infoFile)) {
				info.store(out, null);
			}
			return null;
		} catch (IOException e) {
			Log.e(TAG, "Could not lock the save", e);
			return "Could not change the lock: " + e.getMessage();
		}
	}

	/**
	 * Saves the game, then copies it into a new save of this game. Once the limit is reached, the oldest save that isn't locked is removed
	 * first. Returns an error message, or null when it worked.
	 */
	static String create() {
		return create(false);
	}

	private static String create(boolean auto) {
		try {
			int limit = auto ? MAX_AUTO_SAVES : MAX_SAVES;
			while (unlockedCount(auto) >= limit) {
				Save oldest = oldestUnlocked(auto);
				if (oldest == null) break;
				delete(oldest);
			}
			saveForCopy();
			File source = gameFolder();
			File folder = savesFolder();
			if (source == null || folder == null || !source.isDirectory()) return "The game's save folder could not be found.";
			Properties info = details(auto ? "Auto: " : "", false);
			if (auto) info.setProperty("auto", "true");
			File target = new File(folder, info.getProperty("time"));
			FileHelpers.copy(source, target);
			requestPicture(target);
			writeExtras(target, info, UndoScene.capture(false));
			return null;
		} catch (Throwable e) {
			Log.e(TAG, "Could not save", e);
			return "Saving failed: " + e.getMessage();
		}
	}

	/**
	 * The side area the hero is in, such as the Blacksmith's mine, or nothing on the main floors.
	 */
	private static String place() {
		if (Dungeon.branch == 0) return "";
		if (Dungeon.branch == 1 && Dungeon.depth >= 11 && Dungeon.depth <= 14) return " (mine)";
		if (Dungeon.branch == 1 && Dungeon.depth >= 16 && Dungeon.depth <= 19) return " (vault)";
		return " (side area)";
	}

	private static final String KEY_AUTO = "save_auto_on";
	private static volatile boolean autoPending;

	static boolean autoSaves() {
		return CloverlordSettings.get(KEY_AUTO);
	}

	static void autoSaves(boolean on) {
		CloverlordSettings.set(KEY_AUTO, on);
	}

	/**
	 * Called at the start of Dungeon.switchLevel. Notes that the hero is arriving on a floor, or entering or leaving a side area like the
	 * Blacksmith's mine, so the game is saved once they are ready to move there. Loading a game doesn't count.
	 */
	public static void onLevelSwitch() {
		if (!isAvailable() || !autoSaves()) return;
		InterlevelScene.Mode mode = InterlevelScene.mode;
		if (mode == InterlevelScene.Mode.DESCEND || mode == InterlevelScene.Mode.ASCEND || mode == InterlevelScene.Mode.FALL
			|| mode == InterlevelScene.Mode.RETURN) {
			autoPending = true;
		}
	}

	/**
	 * Called at the end of Hero.ready. Makes the auto save noted by [onLevelSwitch].
	 */
	public static void onHeroReady() {
		if (!autoPending) return;
		autoPending = false;
		Game.runOnRenderThread(() -> {
			Hero hero = Dungeon.hero;
			if (hero == null || !hero.isAlive()) return;
			String error = create(true);
			if (error != null) Log.e(TAG, "Auto save failed: " + error);
		});
	}

	/**
	 * What a save says about the game as it is now, labeled with [prefix] before the depth and the hero. Read on the render thread, just
	 * after the game was saved, so it matches the saved game.
	 */
	static Properties details(String prefix, boolean partial) {
		Hero hero = Dungeon.hero;
		long time = System.currentTimeMillis();
		Properties info = new Properties();
		info.setProperty("time", String.valueOf(time));
		info.setProperty("label", prefix + "Depth " + Dungeon.depth + place() + ", " + InventoryEditor.capitalize(hero.className()) + " Lv " + hero.lvl);
		info.setProperty("depth", String.valueOf(Dungeon.depth));
		info.setProperty("branch", String.valueOf(Dungeon.branch));
		info.setProperty("turn", String.valueOf((int) (Statistics.duration + Actor.now())));
		info.setProperty("hp", String.valueOf(hero.HP));
		info.setProperty("ht", String.valueOf(hero.HT));
		if (partial) info.setProperty("partial", "true");
		return info;
	}

	/**
	 * Saves the picture of the dungeon around the hero into the save in [target] the next time the game draws. Called on the render thread
	 * when the save is made.
	 */
	static void requestPicture(File target) {
		GameCapture.request(new File(target, PICTURE_FILE));
	}

	/**
	 * Writes the files only a save has into [target], which already holds its copy of the game: the preview [scene] and, last, its details
	 * [info], so a save with details is always whole. Safe to call off the render thread.
	 */
	static void writeExtras(File target, Properties info, UndoScene scene) throws IOException {
		writePreview(new File(target, PREVIEW_FILE), scene);
		File temp = new File(target, INFO_FILE + ".tmp");
		try (OutputStream out = new FileOutputStream(temp)) {
			info.store(out, null);
		}
		if (!temp.renameTo(new File(target, INFO_FILE))) throw new IOException("Could not write the save's details");
	}

	/**
	 * Copies [save] into a game's [slot] folder. A whole save replaces what is there; a partial one, an undo step, goes over it, so the
	 * floors it doesn't hold stay.
	 */
	private static void putInSlot(Save save, File slot) throws IOException {
		File[] current = save.partial ? null : slot.listFiles();
		if (current != null) {
			for (File file : current) FileHelpers.delete(file);
		}
		FileHelpers.copy(save.folder, slot);
		stripSaveOnlyFiles(slot);
	}

	/**
	 * Removes the files only a save has from [folder], a game's own slot that a save was just copied into.
	 */
	static void stripSaveOnlyFiles(File folder) {
		for (String name : SAVE_ONLY_FILES) new File(folder, name).delete();
	}

	private static void writePreview(File file, UndoScene scene) {
		if (scene == null) return;
		try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)))) {
			scene.write(out);
		} catch (Throwable e) {
			Log.e(TAG, "Could not keep a preview of the save", e);
			file.delete();
		}
	}

	/**
	 * Replaces the game in progress with [save] and continues from it. Returns an error message, or null when the
	 * game is reloading.
	 */
	static String load(Save save) {
		try {
			File target = gameFolder();
			if (target == null || !save.folder.isDirectory()) return "That save could not be found.";
			putInSlot(save, target);
			GamesInProgress.setUnknown(GamesInProgress.curSlot);
			QuickContinue.start();
			return null;
		} catch (Throwable e) {
			Log.e(TAG, "Could not load", e);
			return "Loading failed: " + e.getMessage();
		}
	}

	/**
	 * Saves the game and keeps a copy of it in [folder], to put back later with [restoreSnapshot].
	 */
	static boolean snapshot(File folder) {
		try {
			saveForCopy();
			File source = gameFolder();
			if (source == null || !source.isDirectory()) return false;
			FileHelpers.delete(folder);
			FileHelpers.copy(source, folder);
			return true;
		} catch (Throwable e) {
			Log.e(TAG, "Could not take a snapshot", e);
			return false;
		}
	}

	/**
	 * Replaces the game in progress with the copy in [folder], loading it like a save, then deletes the copy.
	 */
	static boolean restoreSnapshot(File folder) {
		String error = load(new Save(folder, new Properties()));
		if (error != null) return false;
		FileHelpers.delete(folder);
		return true;
	}

	static void discardSnapshot(File folder) {
		FileHelpers.delete(folder);
	}

	static void delete(Save save) {
		if (save.locked) return;
		FileHelpers.delete(save.folder);
	}

	/**
	 * Deletes the saves in a finished game's [folder] that aren't locked. Returns true when locked saves were left behind.
	 */
	private static boolean deleteUnlocked(File folder) {
		boolean kept = false;
		for (Save save : savesIn(folder)) {
			if (save.locked) {
				kept = true;
			} else {
				FileHelpers.delete(save.folder);
			}
		}
		if (!kept) FileHelpers.delete(folder);
		return kept;
	}

	private static long parseLong(String text, long fallback) {
		try {
			return text == null ? fallback : Long.parseLong(text);
		} catch (NumberFormatException e) {
			return fallback;
		}
	}
}
