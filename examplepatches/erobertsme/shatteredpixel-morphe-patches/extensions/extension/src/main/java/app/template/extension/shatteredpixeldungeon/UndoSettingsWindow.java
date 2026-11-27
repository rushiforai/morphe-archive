package app.template.extension.shatteredpixeldungeon;

/**
 * The Undo / Redo page in Extras, QoL.
 */
public class UndoSettingsWindow extends EditorWindow {

	private static final String INFO = "Undo / Redo\n\n"
		+ "Each time your hero is ready for a new action, the game is saved and a copy kept.\n\n"
		+ "## Undo mode\nTap the Undo / Redo tag to open it.\n_Undo_ (left) goes back one action, _Redo_ (right) goes forward, each with a short loading screen. _Done_ closes undo mode.\nThe line above the buttons shows where you are. A walk of many steps counts as one action. A new action after an undo clears Redo.\nRandom rolls aren't saved, so repeating an action can turn out differently. Redo always restores exactly what happened.\n\n"
		+ "## Settings\n_Keep:_ Last actions keeps the number you choose, This floor keeps every action since you arrived, Unlimited keeps everything until you leave the game.\n_Keep history across floors:_ when off, history starts over on each floor.\n_Allow during boss fights:_ when off, Undo and Redo can't be used while a boss has the floor locked.\n_Tag Style:_ the tag's edge, position, color, icon, icon color and rotation.\n_Performance:_ how long each copy takes. Save is the game's own saving, copy is keeping it in memory.";

	public UndoSettingsWindow() {
		super();
		addTitle("Undo / Redo", INFO);
		addCheckBox("Undo and Redo", UndoHistory.isOn(), () -> UndoHistory.setOn(!UndoHistory.isOn()));
		boolean on = UndoHistory.isOn();

		addSection("Keep");
		int mode = UndoHistory.mode();
		addButtonRow(UndoHistory.MODES, mode, index -> {
			UndoHistory.mode(index);
			refresh();
		});
		if (mode == UndoHistory.MODE_LAST) {
			int size = UndoHistory.size();
			addStepper("Actions", String.valueOf(size), size, 1, 1, UndoHistory.MAX_SIZE, UndoHistory::size, on, () -> UndoHistory.size(UndoHistory.DEFAULT_SIZE));
		}
		addCheckBox("Keep history across floors", UndoHistory.acrossFloors(), () -> UndoHistory.acrossFloors(!UndoHistory.acrossFloors()), on && mode != UndoHistory.MODE_FLOOR);
		addCheckBox("Allow during boss fights", UndoHistory.duringBosses(), () -> UndoHistory.duringBosses(!UndoHistory.duringBosses()), on);

		addSection("Tags");
		addRowButton("Tag Style", null, () -> replaceWith(new TagSettingsWindow(UndoTags.TAG, "Undo / Redo Tag", () -> show(new UndoSettingsWindow()))));

		addSection("Performance");
		addIconRow(null, "Last copy", UndoHistory.lastTiming());
		addIconRow(null, "Average", UndoHistory.averageTiming());
		addIconRow(null, "Slowest", UndoHistory.slowestTiming());
		addIconRow(null, "History", UndoHistory.memoryText());
		float half = (WIDTH - GAP) / 2f;
		addButton("Reset Timing", 0, half, () -> {
			UndoHistory.resetTiming();
			refresh();
		});
		addButton("Clear History", half + GAP, half, () -> {
			UndoHistory.clear();
			refresh();
		});
		pos += ROW_HEIGHT + GAP;

		pos += GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new UndoSettingsWindow());
	}
}
