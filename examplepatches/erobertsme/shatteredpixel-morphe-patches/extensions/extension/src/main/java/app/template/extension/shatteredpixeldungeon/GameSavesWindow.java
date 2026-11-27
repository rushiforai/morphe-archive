package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;

import java.util.List;

public class GameSavesWindow extends EditorWindow {

	private static final String INFO = "Game Saves\n\n"
		+ "Up to 10 saves of the game you're playing, to load later. Saves belong to this game only.\n\n"
		+ "## Saving\n_Save Now:_ saves and keeps a copy. At 10, saving again deletes the oldest unlocked save, after asking.\n_Locked saves_ (key icon) don't count toward the 10 and can't be deleted until unlocked.\n_Auto save on new floors:_ saves on arriving at each floor, including side areas like the Blacksmith's mine. Auto saves start with \"Auto:\", keep the latest 5 (locked aside) and don't count toward your 10. The switch in Extras on the main menu is the default for new games.\n\n"
		+ "## Loading\n_Tap a save_ for a picture of the dungeon then, the last game messages, and buttons to load or delete it.\nLoading replaces where you are now, so save first if you want to come back.\n\n"
		+ "## Files\nKept in the save folder, a folder per game named after its slot and seed, so the first slot's start with game1. Included when you export saves from the main menu.\nWhen this game ends, the title screen asks whether to keep its saves.";
	private static final int PER_PAGE = 5;

	private final int page;
	private final boolean fromGameMenu;

	public GameSavesWindow(int page) {
		this(page, false);
	}

	public GameSavesWindow(int page, boolean fromGameMenu) {
		super();
		this.page = page;
		this.fromGameMenu = fromGameMenu;
		addTitle("Game Saves", INFO);

		List<GameSaves.Save> saves = GameSaves.list();
		if (saves.isEmpty()) addHint("No saves for this game yet.");
		addPagedList(saves.size(), PER_PAGE, page, index -> {
			GameSaves.Save save = saves.get(index);
			addListRow(save.title(), save.locked ? new ItemSprite(ItemSpriteSheet.IRON_KEY) : null, false, true, () -> choose(save), null);
		}, newPage -> replaceWith(new GameSavesWindow(newPage, fromGameMenu)));

		addCheckBox("Auto save on new floors", GameSaves.autoSaves(), () -> GameSaves.autoSaves(!GameSaves.autoSaves()));
		int counted = GameSaves.unlockedCount();
		addButton("Save Now (" + counted + "/" + GameSaves.MAX_SAVES + ")", 0, WIDTH, this::saveNow);
		pos += ROW_HEIGHT + 2 * GAP;

		finishWithBack(fromGameMenu ? CloverlordMenu::showGameMenu : CloverlordMenu::show);
	}

	private void saveNow() {
		GameSaves.Save oldest = GameSaves.unlockedCount() >= GameSaves.MAX_SAVES ? GameSaves.oldestUnlocked() : null;
		if (oldest == null) {
			save();
			return;
		}
		ConfirmPrompt.ask("Replace oldest save", "This game already has " + GameSaves.MAX_SAVES + " unlocked saves. Saving now deletes the oldest one:\n\n" + oldest.title()
			+ "\n\nLock a save to keep it.", "Save", this::save);
	}

	private void save() {
		String error = GameSaves.create();
		if (error != null) GLog.w(error);
		refresh();
	}

	private void choose(GameSaves.Save save) {
		hide();
		show(new SavePreviewWindow(save, page, fromGameMenu));
	}

	@Override
	protected void reopen() {
		show(new GameSavesWindow(page, fromGameMenu));
	}
}
