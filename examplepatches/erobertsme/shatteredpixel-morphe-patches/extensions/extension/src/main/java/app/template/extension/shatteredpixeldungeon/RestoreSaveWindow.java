package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;

import java.io.File;
import java.util.List;

/**
 * Picks a Game Save or an undo step of a finished or damaged game to put back into its slot, so the game can be continued from it.
 */
public class RestoreSaveWindow extends EditorWindow {

	private static final String SAVES_INFO = "Restore a Save\n\n"
		+ "Put one of this game's saves back into its slot, then continue from the title screen as usual. The other saves are kept.\n\n"
		+ "_Damaged game:_ if the slot still holds one, a copy of it is moved to the app's cache first.";
	private static final String UNDO_INFO = "Restore an Undo Step\n\n"
		+ "Put one of this game's kept undo steps back into its slot, then continue from the title screen as usual. The newest step is first.\n\n"
		+ "_Other floors:_ floors you weren't on at that step come from the game's own files in the slot.\n_What's there now_ is copied to the app's cache first.";
	private static final int PER_PAGE = 6;

	private final boolean undo;
	private final File folder;
	private final int slot;
	private final long seed;
	private final int page;
	private final Runnable onBack;

	private RestoreSaveWindow(boolean undo, File folder, int slot, long seed, int page, Runnable onBack) {
		super();
		this.undo = undo;
		this.folder = folder;
		this.slot = slot;
		this.seed = seed;
		this.page = page;
		this.onBack = onBack;
		addTitle("Restore to slot " + slot, undo ? UNDO_INFO : SAVES_INFO);
		List<GameSaves.Save> saves = undo ? UndoHistory.storedSteps(slot, seed) : GameSaves.savesOf(folder);
		if (saves.isEmpty()) addHint(undo ? "This game has no kept undo steps." : "This game has no saves.");
		addPagedList(saves.size(), PER_PAGE, page, index -> {
			GameSaves.Save save = saves.get(index);
			addListRow(save.title(), save.locked ? new ItemSprite(ItemSpriteSheet.IRON_KEY) : null, undo && index == 0, true, () -> confirm(save), null);
		}, newPage -> replaceWith(new RestoreSaveWindow(undo, folder, slot, seed, newPage, onBack)));
		finishWithBack(onBack);
	}

	/**
	 * The Game Saves of a finished or damaged game's saves [folder]. Back asks about the game again.
	 */
	static RestoreSaveWindow saves(File folder, int slot) {
		return new RestoreSaveWindow(false, folder, slot, 0, 0, () -> GameSaves.askAgain(folder));
	}

	/**
	 * The kept undo steps of the damaged game in [slot] with [seed]. Back runs [onBack], when there is one.
	 */
	static RestoreSaveWindow undoSteps(int slot, long seed, Runnable onBack) {
		return new RestoreSaveWindow(true, UndoHistory.storedFolder(slot, seed), slot, seed, 0, onBack);
	}

	private void confirm(GameSaves.Save save) {
		hide();
		show(new RestorePreviewWindow(save, () -> {
			String error = GameSaves.restoreToSlot(save, folder, slot);
			if (error != null) GLog.w(error);
		}, this::reopen));
	}

	@Override
	protected void reopen() {
		show(new RestoreSaveWindow(undo, folder, slot, seed, page, onBack));
	}
}
