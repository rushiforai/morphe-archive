package app.template.extension.shatteredpixeldungeon;

/**
 * Lists every undo step kept for this game, newest first, so you can jump straight to one.
 */
public class UndoListWindow extends EditorWindow {

	private static final String INFO = "Undo History\n\n"
		+ "Every step kept for this game, newest first.\n\n"
		+ "_(now)_ marks the step you're on. The step you've picked is highlighted.\n_Each row:_ the step's depth (D), turn (T) and first game message.\n_Tap a step_ to pick it and see the dungeon then. Tap Done in undo mode to load it.\n_Later steps_ stay in the list until you take a new action, so you can still return to them.";
	private final int page;

	public UndoListWindow() {
		this(pageOf(UndoHistory.selected()));
	}

	public UndoListWindow(int page) {
		super();
		this.page = page;
		addTitle("Undo History", INFO);

		int count = UndoHistory.count();
		if (count == 0) addHint("No undo steps yet.");
		addPagedList(count, perPage(), page, row -> {
			int position = count - 1 - row;
			boolean current = position == UndoHistory.current();
			String label = UndoHistory.listLabel(position) + (current ? " (now)" : "");
			addListRow(label, null, position == UndoHistory.selected(), UndoHistory.canSelect(position), () -> {
				hide();
				UndoHistory.select(position);
			}, null);
		}, newPage -> replaceWith(new UndoListWindow(newPage)));

		addButton("Close", 0, WIDTH, this::hide);
		pos += ROW_HEIGHT;
		finish();
	}

	private static int pageOf(int position) {
		if (position < 0) return 0;
		return (UndoHistory.count() - 1 - position) / perPage();
	}

	private static int perPage() {
		return perPage(8, 4);
	}

	@Override
	protected void reopen() {
		show(new UndoListWindow(page));
	}
}
