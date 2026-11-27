package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;

/**
 * A game save in the Game Saves list, with buttons to load, lock, delete or go back.
 */
public class SavePreviewWindow extends PreviewWindow {

	private final GameSaves.Save save;
	private final int page;
	private final boolean fromGameMenu;

	public SavePreviewWindow(GameSaves.Save save, int page, boolean fromGameMenu) {
		super();
		this.save = save;
		this.page = page;
		this.fromGameMenu = fromGameMenu;
		layout(save);
	}

	@Override
	protected StatLink statLink() {
		return seedLink(save);
	}

	@Override
	protected void addActions() {
		addGameButtons("Load", Icons.get(Icons.ENTER), this::load, save.locked ? "Unlock" : "Lock", new ItemSprite(ItemSpriteSheet.IRON_KEY), this::toggleLock);
		backTo(this::back);
		RedButton[] row = addGameButtons("Delete", Icons.get(Icons.CLOSE), this::delete, "Back", Icons.get(Icons.EXIT), this::goBack);
		row[0].enable(!save.locked);
		pos -= 1;
	}

	private void load() {
		hide();
		String error = GameSaves.load(save);
		if (error != null) GLog.w(error);
	}

	private void toggleLock() {
		String error = GameSaves.setLocked(save, !save.locked);
		if (error != null) {
			GLog.w(error);
			return;
		}
		GameSaves.Save updated = save;
		for (GameSaves.Save candidate : GameSaves.list()) {
			if (candidate.folder.equals(save.folder)) updated = candidate;
		}
		hide();
		show(new SavePreviewWindow(updated, page, fromGameMenu));
	}

	private void delete() {
		if (save.locked) return;
		ConfirmPrompt.ask("Delete save", "Delete this save? This can't be undone.", "Delete", () -> {
			GameSaves.delete(save);
			hide();
			show(new GameSavesWindow(page, fromGameMenu));
		});
	}

	private void back() {
		show(new GameSavesWindow(page, fromGameMenu));
	}

	@Override
	protected void reopen() {
		show(new SavePreviewWindow(save, page, fromGameMenu));
	}

}
