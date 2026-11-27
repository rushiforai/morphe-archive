package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;

/**
 * A save or undo step about to be put back into its slot, shown in full first, with Restore and Back buttons.
 */
public class RestorePreviewWindow extends PreviewWindow {

	private final GameSaves.Save save;
	private final Runnable onRestore;
	private final Runnable onBack;

	RestorePreviewWindow(GameSaves.Save save, Runnable onRestore, Runnable onBack) {
		super();
		this.save = save;
		this.onRestore = onRestore;
		this.onBack = onBack;
		layout(save);
	}

	@Override
	protected StatLink statLink() {
		return seedLink(save);
	}

	@Override
	protected void addActions() {
		backTo(onBack);
		addGameButtons("Restore", Icons.get(Icons.ENTER), this::restore, "Back", Icons.get(Icons.EXIT), this::goBack);
		pos -= 1;
	}

	private void restore() {
		ConfirmPrompt.ask("Restore", "Restore this to its slot and continue the game from it?\n\n" + save.title(), "Restore", () -> {
			hide();
			onRestore.run();
		});
	}

	@Override
	protected void reopen() {
		show(new RestorePreviewWindow(save, onRestore, onBack));
	}
}
