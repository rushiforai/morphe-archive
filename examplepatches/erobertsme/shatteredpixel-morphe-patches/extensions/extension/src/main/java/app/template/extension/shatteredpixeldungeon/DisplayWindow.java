package app.template.extension.shatteredpixeldungeon;

/**
 * Display settings: how many pixels to keep clear at each screen edge.
 */
public class DisplayWindow extends EditorWindow {

	private static final String INFO = "Display\n\n"
		+ "These settings apply to every game. The Tags editor is on the QoL tab.\n\n"
		+ "## Margins\nShrink the game in from each screen edge, in screen pixels, when a rounded corner, camera hole or gesture bar covers part of it.\nThe margins are painted black, and the game's buttons and windows move inward like they do for a notch. The screen is laid out again after each change. Tags always stay inside the margins.";

	public DisplayWindow() {
		super();
		addTitle("Display", INFO);
		for (DisplayMargins.Edge edge : DisplayMargins.Edge.values()) {
			int value = DisplayMargins.get(edge);
			addStepper(edge.label, value + " px", value, DisplayMargins.STEP, 0, DisplayMargins.MAX, pixels -> DisplayMargins.set(edge, pixels), true, () -> DisplayMargins.set(edge, 0));
		}
		pos += 2 * GAP;
		addButton("Reset all", 0, WIDTH, () -> {
			DisplayMargins.reset();
			refresh();
		});
		pos += ROW_HEIGHT + GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new DisplayWindow());
	}
}
