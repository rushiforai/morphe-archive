package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;

import java.util.List;

public class StatusPickerWindow extends EditorWindow {

	static final int FAVORITES = 0;
	static final int POSITIVE = 1;
	static final int NEGATIVE = 2;
	static final int OTHER = 3;
	private static final String[] KIND_NAMES = { "Favs", "Positive", "Negative", "Other" };

	private static Char target;
	private static final BackAction backAction = new BackAction();
	private static Chooser chooser;

	interface Chooser {
		void chosen(StatusRecipe recipe);
	}

	/**
	 * Opens the picker for [character]. [back] reopens the window the picker was opened from.
	 */
	static void openFor(Char character, Runnable back) {
		target = character;
		backAction.set(back);
		chooser = null;
		show(new StatusPickerWindow(FAVORITES, 0));
	}

	/**
	 * Opens the picker to set up a status for later, for the hero, and passes it to [onChosen] instead of adding it. [back] reopens the
	 * window the picker was opened from.
	 */
	static void openToChoose(Chooser onChosen, Runnable back) {
		target = null;
		backAction.set(back);
		chooser = onChosen;
		show(new StatusPickerWindow(FAVORITES, 0));
	}

	private final int kind;
	private final int page;

	public StatusPickerWindow(int kind, int page) {
		super();
		this.kind = kind;
		this.page = page;
		Char hero = target != null ? target : Dungeon.hero;

		addTitle(chooser == null ? "Add status" : "Choose status", "Add status\n\nTap a status to choose how long it lasts and every other setting it keeps, then add it.\n\n_Yellow statuses_ are already active; adding them again extends them.\n\n{HEART}The heart adds a status to Favorites.\n\n{INFO}Tap i or long-press to read one.");
		addButtonRow(KIND_NAMES, kind, index -> {
			if (index != kind) replaceWith(new StatusPickerWindow(index, 0));
		});
		pos += GAP;

		List<StatusEditor.Entry> entries = StatusEditor.catalog(kind);
		if (entries.isEmpty()) addHint("No favorites yet. Tap the heart next to a status to add it here.");
		addPagedList(entries.size(), perPage(7, 4), page, index -> {
			StatusEditor.Entry entry = entries.get(index);
			addListRow(entry.name, statusIcon(entry), StatusEditor.isActive(hero, entry.type), true, () -> choose(hero, entry), () -> CharacterWindow.showBuffInfo(entry.sample), new Favorite() {
				@Override
				public boolean isFavorite() {
					return Favorites.isStatus(entry.type);
				}

				@Override
				public void toggle() {
					Favorites.toggleStatus(entry.type);
				}
			});
		}, newPage -> replaceWith(new StatusPickerWindow(kind, newPage)));

		finishWithBack(() -> backAction.run(StatusPickerWindow::backToEditor));
	}

	/**
	 * Sets up [entry] with every setting it keeps, then adds it to [hero], or passes it on when choosing one for later.
	 */
	private void choose(Char hero, StatusEditor.Entry entry) {
		Chooser onChosen = chooser;
		hide();
		StatusWindow.Done done = onChosen != null ? recipe -> {
			chooser = null;
			onChosen.chosen(recipe);
		} : recipe -> {
			recipe.apply(hero);
			backAction.run(StatusPickerWindow::backToEditor);
		};
		show(new StatusWindow(new StatusRecipe(entry), hero == Dungeon.hero, onChosen != null ? "Choose" : "Add Status", done, this::reopen));
	}

	private static void backToEditor() {
		CharacterWindow.open(CharacterWindow.TAB_STATUS, 1);
	}

	private static BuffIcon statusIcon(StatusEditor.Entry entry) {
		try {
			return new BuffIcon(entry.sample, true);
		} catch (Throwable e) {
			return null;
		}
	}

	@Override
	protected void reopen() {
		show(new StatusPickerWindow(kind, page));
	}
}
