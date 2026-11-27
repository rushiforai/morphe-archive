package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.GamesInProgress;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.watabou.noosa.Game;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.Set;

/**
 * Undo and Redo. Each time your hero is ready for a new action the game is saved and an undo step is kept: a partial Game Save of the game
 * file and the current floor, with the same details, preview, hero and picture, kept in the app's own storage apart from Game Saves. Undo
 * and Redo load a step the way a Game Save is loaded.
 */
@SuppressWarnings("unused")
public final class UndoHistory {

	private static final String TAG = "UndoHistory";

	static final int MODE_LAST = 0;
	static final int MODE_FLOOR = 1;
	static final int MODE_UNLIMITED = 2;
	static final String[] MODES = { "Last actions", "This floor", "Unlimited" };
	static final int DEFAULT_SIZE = 20;
	static final int MAX_SIZE = 200;
	private static final int LIST_LINE_LENGTH = 24;

	private static final String KEY_ON = "qol_undo_on";
	private static final String KEY_MODE = "qol_undo_mode";
	private static final String KEY_SIZE = "qol_undo_size";
	private static final String KEY_FLOOR_ONLY = "qol_undo_floor_only";
	private static final String KEY_NO_BOSS = "qol_undo_no_boss";

	/**
	 * One undo step: a partial save, with its picture kept in memory once read. Its folder is written on the writer thread after it is taken.
	 */
	private static final class Step {
		final GameSaves.Save save;
		final long id;
		private UndoScene scene;
		private boolean sceneRead;
		volatile boolean written;

		Step(long id, GameSaves.Save save, UndoScene scene, boolean written) {
			this.id = id;
			this.save = save;
			this.scene = scene;
			this.sceneRead = scene != null;
			this.written = written;
		}

		UndoScene scene() {
			if (sceneRead) return scene;
			sceneRead = true;
			scene = save.preview();
			return scene;
		}
	}

	private static final List<Step> history = new ArrayList<>();
	private static int index = -1;
	private static int selected = -1;
	private static Runnable listener;

	/**
	 * Runs [listener] whenever the history or the chosen step changes. Replaces any earlier listener.
	 */
	static void onChange(Runnable listener) {
		UndoHistory.listener = listener;
	}

	private static void changed() {
		Runnable current = listener;
		if (current != null) current.run();
	}
	private static String gameId;
	private static boolean skipNext;
	private static boolean pending;

	private static long lastSaveNanos;
	private static long lastCopyNanos;
	private static long slowestNanos;
	private static long totalNanos;
	private static int timedSnapshots;

	private UndoHistory() {
	}

	static boolean isAvailable() {
		return SaveBackupActivity.isAvailable();
	}

	static boolean isOn() {
		return isAvailable() && CloverlordSettings.get(KEY_ON);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_ON, on);
		UndoTags.TAG.refresh();
		if (on) return;
		clear();
		deleteStored(gameId);
	}

	static int mode() {
		int mode = CloverlordSettings.getInt(KEY_MODE);
		return mode < MODE_LAST || mode > MODE_UNLIMITED ? MODE_LAST : mode;
	}

	static void mode(int mode) {
		CloverlordSettings.setInt(KEY_MODE, mode);
		trim();
	}

	static int size() {
		int size = CloverlordSettings.getInt(KEY_SIZE);
		return size <= 0 ? DEFAULT_SIZE : Math.min(MAX_SIZE, size);
	}

	static void size(int size) {
		CloverlordSettings.setInt(KEY_SIZE, Math.max(1, Math.min(MAX_SIZE, size)));
		trim();
	}

	static boolean acrossFloors() {
		return !CloverlordSettings.get(KEY_FLOOR_ONLY);
	}

	static void acrossFloors(boolean on) {
		CloverlordSettings.set(KEY_FLOOR_ONLY, !on);
	}

	static boolean duringBosses() {
		return !CloverlordSettings.get(KEY_NO_BOSS);
	}

	static void duringBosses(boolean on) {
		CloverlordSettings.set(KEY_NO_BOSS, !on);
	}

	/**
	 * Called at the end of Hero.ready, when the hero waits for your next action. The snapshot is taken on the
	 * render thread, while the game waits for input.
	 */
	public static void onHeroReady() {
		if (!isOn() || pending) return;
		pending = true;
		Game.runOnRenderThread(() -> {
			pending = false;
			capture();
		});
	}

	private static void capture() {
		Hero hero = Dungeon.hero;
		if (!isOn() || hero == null || !hero.isAlive() || !hero.ready) return;
		String id = GamesInProgress.curSlot + ":" + Dungeon.seed;
		if (!id.equals(gameId)) {
			clear();
			gameId = id;
			loadStored();
		}
		if (skipNext) {
			skipNext = false;
			UndoScene.discardLines();
			return;
		}
		try {
			File folder = storeFolder(gameId);
			File root = SaveLocation.currentRoot();
			if (folder == null || root == null) return;
			long start = System.nanoTime();
			GameSaves.saveForCopy();
			long saved = System.nanoTime();
			File gameFile = new File(root, GamesInProgress.gameFile(GamesInProgress.curSlot));
			File levelFile = new File(root, GamesInProgress.depthFile(GamesInProgress.curSlot, Dungeon.depth, Dungeon.branch));
			byte[] game = FileHelpers.read(gameFile);
			byte[] level = FileHelpers.read(levelFile);
			long copied = System.nanoTime();
			long stepId = nextId++;
			File target = new File(folder, String.valueOf(stepId));
			if (!target.isDirectory() && !target.mkdirs()) return;
			Properties info = GameSaves.details("", true);
			UndoScene scene = UndoScene.capture();
			Step step = new Step(stepId, GameSaves.Save.of(target, info), scene, false);
			GameSaves.requestPicture(target);
			push(step);
			writer.execute(() -> {
				try {
					FileHelpers.write(new File(target, gameFile.getName()), game);
					FileHelpers.write(new File(target, levelFile.getName()), level);
					GameSaves.writeExtras(target, info, scene);
					step.written = true;
				} catch (Throwable e) {
					Log.e(TAG, "Could not keep the undo step", e);
				}
			});
			storeAsync();
			recordTiming(saved - start, copied - saved);
		} catch (Throwable e) {
			Log.e(TAG, "Could not take an undo step", e);
		}
	}

	private static void push(Step step) {
		while (history.size() > index + 1) history.remove(history.size() - 1);
		GameSaves.Save last = index >= 0 ? history.get(index).save : null;
		boolean newFloor = last != null && (last.depth != step.save.depth || last.branch != step.save.branch);
		if (newFloor && (mode() == MODE_FLOOR || !acrossFloors())) history.clear();
		history.add(step);
		index = history.size() - 1;
		trim();
		selected = index;
		changed();
	}

	private static void trim() {
		if (mode() != MODE_LAST) return;
		while (history.size() > size()) {
			history.remove(0);
			index--;
		}
		if (index < -1) index = -1;
		selected = index;
	}

	private static boolean allowedNow() {
		Hero hero = Dungeon.hero;
		if (!isOn() || hero == null || !hero.isAlive() || !hero.ready) return false;
		return duringBosses() || Dungeon.level == null || !Dungeon.level.locked;
	}

	private static void restore(int target) {
		Step step = history.get(target);
		if (!step.written) flush();
		if (!step.written) return;
		int was = index;
		index = target;
		selected = target;
		skipNext = true;
		String error = GameSaves.load(step.save);
		if (error == null) {
			storeAsync();
			return;
		}
		Log.e(TAG, error);
		index = was;
		selected = was;
		skipNext = false;
	}

	/**
	 * Waits for the steps still being written.
	 */
	private static void flush() {
		try {
			writer.submit(() -> { }).get();
		} catch (Throwable e) {
			Log.e(TAG, "Could not wait for the undo history", e);
		}
	}

	static int count() {
		return history.size();
	}

	static int current() {
		return index;
	}

	static int selected() {
		return selected;
	}

	/**
	 * Starts choosing from the step the game is on now.
	 */
	static void resetSelection() {
		selected = index;
		changed();
	}

	static boolean canSelect(int position) {
		return position >= 0 && position < history.size() && allowedNow();
	}

	static void select(int position) {
		if (!canSelect(position) || position == selected) return;
		selected = position;
		changed();
	}

	static boolean canSelectPrevious() {
		return canSelect(selected - 1);
	}

	static boolean canSelectNext() {
		return selected >= 0 && canSelect(selected + 1);
	}

	static void selectPrevious() {
		select(selected - 1);
	}

	static void selectNext() {
		select(selected + 1);
	}

	/**
	 * Whether the chosen step is a different one from where the game is now.
	 */
	static boolean selectionPending() {
		return selected >= 0 && selected != index && selected < history.size();
	}

	/**
	 * Loads the chosen step, if it isn't the one the game is on.
	 */
	static void loadSelected() {
		if (selectionPending() && allowedNow()) restore(selected);
	}

	/**
	 * A short label for the History list: the step's number, depth, turn and first log line.
	 */
	static String listLabel(int position) {
		Step step = history.get(position);
		GameSaves.Save save = step.save;
		String label = (position + 1) + ". D" + save.depth + " T" + save.turn;
		UndoScene scene = step.scene();
		String line = scene == null ? null : scene.firstLine();
		if (line == null) return label + " HP " + save.hp + "/" + save.ht;
		if (line.length() > LIST_LINE_LENGTH) line = line.substring(0, LIST_LINE_LENGTH - 1) + "..";
		return label + " - " + line;
	}

	/**
	 * What the preview shows about the hero at a step, or null when it isn't known.
	 */
	static HeroCard hero(int position) {
		UndoScene scene = scene(position);
		return scene == null ? null : scene.hero;
	}

	static UndoScene scene(int position) {
		if (position < 0 || position >= history.size()) return null;
		return history.get(position).scene();
	}

	/**
	 * The picture of the dungeon taken from the game's drawing at a step, or null when there is none yet.
	 */
	static File picture(int position) {
		if (position < 0 || position >= history.size()) return null;
		return history.get(position).save.picture();
	}

	/**
	 * Depth, turn, HP and max HP of a step, or null if there is no such step.
	 */
	static int[] stats(int position) {
		if (position < 0 || position >= history.size()) return null;
		GameSaves.Save save = history.get(position).save;
		return new int[] { save.depth, save.turn, save.hp, save.ht };
	}

	private static final String DEATH_BACKUP = "undo-death-backup";
	private static boolean deathBackup;

	/**
	 * Called at the start of Dungeon.deleteGame, which removes the floors of a game that has ended. When the hero
	 * has just died, the game's folder is copied first so Undo can bring it back.
	 */
	public static void beforeDeleteGame(int slot) {
		deathBackup = false;
		if (gameId != null && gameId.startsWith(slot + ":") && Dungeon.hero != null && Dungeon.hero.isAlive()) deleteStored(gameId);
		Hero hero = Dungeon.hero;
		if (!isOn() || hero == null || hero.isAlive() || index < 0 || slot != GamesInProgress.curSlot) return;
		try {
			File root = SaveLocation.currentRoot();
			File cache = SaveLocation.cacheDir();
			if (root == null || cache == null) return;
			File backup = new File(cache, DEATH_BACKUP);
			FileHelpers.delete(backup);
			FileHelpers.copy(new File(root, GamesInProgress.gameFolder(slot)), backup);
			deathBackup = true;
		} catch (Throwable e) {
			Log.e(TAG, "Could not back up the game before it was deleted", e);
		}
	}

	static boolean canUndoDeath() {
		if (!deathBackup || index < 0 || index >= history.size()) return false;
		return duringBosses() || Dungeon.level == null || !Dungeon.level.locked;
	}

	/**
	 * Brings the game back to the moment before the action that killed the hero.
	 */
	static void undoDeath() {
		if (!canUndoDeath()) return;
		try {
			File root = SaveLocation.currentRoot();
			File cache = SaveLocation.cacheDir();
			if (root == null || cache == null) return;
			File backup = new File(cache, DEATH_BACKUP);
			File folder = new File(root, GamesInProgress.gameFolder(GamesInProgress.curSlot));
			FileHelpers.copy(backup, folder);
			FileHelpers.delete(backup);
			deathBackup = false;
			restore(index);
		} catch (Throwable e) {
			Log.e(TAG, "Could not undo the death", e);
		}
	}

	/**
	 * Called at the end of GameScene.gameOver. Adds an Undo button below the game's own buttons.
	 */
	public static void afterGameOver() {
		UndoTags.TAG.refresh();
		if (!canUndoDeath()) return;
		try {
			UndoTags.addDeathButton();
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the Undo button", e);
		}
	}

	static void clear() {
		history.clear();
		index = -1;
		selected = -1;
		changed();
		skipNext = false;
	}

	private static final String STORE_FOLDER = "morphe_undo";
	private static final String INDEX_FILE = "index";
	private static final String INDEX_TEMP = "index.tmp";
	private static final int STORE_FORMAT = 2;
	private static long nextId;

	private static final ExecutorService writer = Executors.newSingleThreadExecutor(task -> {
		Thread thread = new Thread(task, "undo-history-writer");
		thread.setDaemon(true);
		thread.setPriority(Thread.MIN_PRIORITY);
		return thread;
	});

	/**
	 * Writes the list of steps on the writer thread, after the steps queued before it, and removes the folders of steps no longer in it. The
	 * list is replaced in one move, so a half-written list is never read.
	 */
	private static void storeAsync() {
		if (!isOn() || gameId == null) return;
		String id = gameId;
		long currentId = index >= 0 ? history.get(index).id : -1;
		List<Long> ids = new ArrayList<>();
		for (Step step : history) ids.add(step.id);
		writer.execute(() -> store(id, currentId, ids));
	}

	private static void store(String id, long currentId, List<Long> ids) {
		try {
			File folder = storeFolder(id);
			if (folder == null) return;
			if (ids.isEmpty()) {
				FileHelpers.delete(folder);
				return;
			}
			if (!folder.isDirectory() && !folder.mkdirs()) return;
			File temp = new File(folder, INDEX_TEMP);
			try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(temp)))) {
				out.writeInt(STORE_FORMAT);
				out.writeUTF(id);
				out.writeLong(currentId);
				out.writeInt(ids.size());
				for (long stepId : ids) out.writeLong(stepId);
			}
			if (!temp.renameTo(new File(folder, INDEX_FILE))) return;
			Set<Long> keep = new HashSet<>(ids);
			long newest = ids.get(ids.size() - 1);
			File[] files = folder.listFiles();
			if (files == null) return;
			for (File file : files) {
				if (file.getName().equals(INDEX_FILE)) continue;
				long stepId = parseId(file.getName());
				if (!keep.contains(stepId) && stepId <= newest) FileHelpers.delete(file);
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not keep the undo history", e);
		}
	}

	/**
	 * The id a step's folder is named after, or -1 for anything else, such as a file left by an older version.
	 */
	private static long parseId(String name) {
		try {
			return Long.parseLong(name);
		} catch (NumberFormatException e) {
			return -1;
		}
	}

	/**
	 * The ids of the kept steps of game [id] in order, then the current step's id last, or null when there are none.
	 */
	private static long[] readIndex(String id) {
		File folder = storeFolder(id);
		File indexFile = folder == null ? null : new File(folder, INDEX_FILE);
		if (indexFile == null || !indexFile.isFile()) return null;
		try (DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(indexFile)))) {
			if (in.readInt() != STORE_FORMAT || !id.equals(in.readUTF())) return null;
			long currentId = in.readLong();
			int count = in.readInt();
			long[] ids = new long[count + 1];
			for (int i = 0; i < count; i++) ids[i] = in.readLong();
			ids[count] = currentId;
			return ids;
		} catch (Throwable e) {
			Log.e(TAG, "Could not read the kept undo history", e);
			return null;
		}
	}

	private static void loadStored() {
		long[] ids = readIndex(gameId);
		File folder = storeFolder(gameId);
		if (ids == null) return;
		long currentId = ids[ids.length - 1];
		List<Step> loaded = new ArrayList<>();
		int current = -1;
		for (int i = 0; i < ids.length - 1; i++) {
			GameSaves.Save save = GameSaves.Save.read(new File(folder, String.valueOf(ids[i])));
			nextId = Math.max(nextId, ids[i] + 1);
			if (save == null) continue;
			if (ids[i] == currentId) current = loaded.size();
			loaded.add(new Step(ids[i], save, null, true));
		}
		history.clear();
		history.addAll(loaded);
		index = current >= 0 ? current : history.size() - 1;
		selected = index;
		changed();
	}

	/**
	 * The kept undo steps of the game in [slot] with [seed], newest first, read the way Game Saves are.
	 */
	static List<GameSaves.Save> storedSteps(int slot, long seed) {
		List<GameSaves.Save> steps = new ArrayList<>();
		String id = slot + ":" + seed;
		long[] ids = readIndex(id);
		File folder = storeFolder(id);
		if (ids == null) return steps;
		for (int i = 0; i < ids.length - 1; i++) {
			GameSaves.Save save = GameSaves.Save.read(new File(folder, String.valueOf(ids[i])));
			if (save != null) steps.add(0, save);
		}
		return steps;
	}

	/**
	 * The folder holding the kept undo steps of the game in [slot] with [seed].
	 */
	static File storedFolder(int slot, long seed) {
		return storeFolder(slot + ":" + seed);
	}

	/**
	 * The slot and seed of each game with kept undo steps.
	 */
	static List<long[]> storedGames() {
		List<long[]> games = new ArrayList<>();
		File base = SaveLocation.privateDir();
		File[] folders = base == null ? null : new File(base, STORE_FOLDER).listFiles();
		if (folders == null) return games;
		for (File folder : folders) {
			String name = folder.getName();
			int split = name.indexOf('_');
			if (!folder.isDirectory() || split < 0) continue;
			try {
				games.add(new long[] { Integer.parseInt(name.substring(0, split)), Long.parseLong(name.substring(split + 1)) });
			} catch (NumberFormatException ignored) {
			}
		}
		return games;
	}

	private static File storeFolder(String id) {
		File base = SaveLocation.privateDir();
		if (base == null || id == null) return null;
		return new File(new File(base, STORE_FOLDER), id.replace(':', '_'));
	}

	private static void deleteStored(String id) {
		File folder = storeFolder(id);
		if (folder != null) writer.execute(() -> FileHelpers.delete(folder));
	}

	/**
	 * Deletes the kept history of the game in [slot] with [seed].
	 */
	static void deleteStored(int slot, long seed) {
		deleteStored(slot + ":" + seed);
	}

	private static void recordTiming(long saveNanos, long copyNanos) {
		lastSaveNanos = saveNanos;
		lastCopyNanos = copyNanos;
		long total = saveNanos + copyNanos;
		slowestNanos = Math.max(slowestNanos, total);
		totalNanos += total;
		timedSnapshots++;
	}

	static void resetTiming() {
		lastSaveNanos = lastCopyNanos = slowestNanos = totalNanos = 0;
		timedSnapshots = 0;
	}

	static String lastTiming() {
		if (timedSnapshots == 0) return "None yet";
		return ms(lastSaveNanos + lastCopyNanos) + " (save " + ms(lastSaveNanos) + ", copy " + ms(lastCopyNanos) + ")";
	}

	static String averageTiming() {
		return timedSnapshots == 0 ? "None yet" : ms(totalNanos / timedSnapshots) + " over " + timedSnapshots;
	}

	static String slowestTiming() {
		return timedSnapshots == 0 ? "None yet" : ms(slowestNanos);
	}

	static String memoryText() {
		long bytes = 0;
		for (Step step : history) bytes += sizeOf(step.save.folder);
		return history.size() + " kept, " + Math.round(bytes / 1024f) + " KB";
	}

	private static long sizeOf(File file) {
		File[] children = file.listFiles();
		if (children == null) return file.length();
		long total = 0;
		for (File child : children) total += sizeOf(child);
		return total;
	}

	private static String ms(long nanos) {
		return Math.round(nanos / 100_000f) / 10f + " ms";
	}

}
