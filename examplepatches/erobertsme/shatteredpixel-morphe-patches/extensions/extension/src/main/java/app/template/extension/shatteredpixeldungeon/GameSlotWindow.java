package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.GamesInProgress;
import com.shatteredpixel.shatteredpixeldungeon.ShatteredPixelDungeon;
import com.shatteredpixel.shatteredpixeldungeon.scenes.InterlevelScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.StartScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.ActionIndicator;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.watabou.noosa.Game;

/**
 * A game in progress picked from the main menu, shown the way Game Saves are, with its deepest floor and seed, and Continue and Erase.
 */
public class GameSlotWindow extends PreviewWindow {

	private final int slot;
	private final GamesInProgress.Info info;
	private final GameSaves.Save save;

	GameSlotWindow(int slot, GamesInProgress.Info info, GameSaves.Save save) {
		super();
		this.slot = slot;
		this.info = info;
		this.save = save;
		layout(InventoryEditor.capitalize(info.heroClass.title()) + " Lv " + info.level + "\n" + save.date(), save);
	}

	@Override
	protected boolean showsLog() {
		return false;
	}

	@Override
	protected String[] extraStats() {
		String deepest = "Deepest " + info.maxDepth;
		return GameSlots.seedCode(info) == null ? new String[] { deepest, "Daily seed" } : new String[] { deepest };
	}

	@Override
	protected StatLink statLink() {
		String seed = GameSlots.seedCode(info);
		return seed == null ? null : new StatLink("Seed", seed, () -> GameSlots.seedChoices(seed));
	}

	@Override
	protected void addActions() {
		addGameButtons("Continue", Icons.get(Icons.ENTER), this::continueGame, "Erase", Icons.get(Icons.CLOSE), this::erase);
		pos -= 1;
	}

	private void continueGame() {
		hide();
		GamesInProgress.curSlot = slot;
		Dungeon.hero = null;
		Dungeon.daily = false;
		Dungeon.dailyReplay = false;
		ActionIndicator.clearAction();
		InterlevelScene.mode = InterlevelScene.Mode.CONTINUE;
		Game.switchScene(InterlevelScene.class);
	}

	private void erase() {
		ConfirmPrompt.ask("Erase", "Erase this game? This can't be undone.\n\n" + save.title(), "Erase", () -> {
			hide();
			Dungeon.deleteGame(slot, true);
			ShatteredPixelDungeon.switchNoFade(StartScene.class);
		});
	}

	@Override
	protected void reopen() {
		show(new GameSlotWindow(slot, info, save));
	}
}
