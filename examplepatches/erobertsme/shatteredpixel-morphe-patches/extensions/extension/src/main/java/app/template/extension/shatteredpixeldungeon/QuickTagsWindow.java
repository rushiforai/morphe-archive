package app.template.extension.shatteredpixeldungeon;

import java.util.List;

/**
 * The Quick Tags page in Extras, QoL: the quick tags you've made, and Add Tag.
 */
public class QuickTagsWindow extends EditorWindow {

	private static final String INFO = "Quick Tags\n\n"
		+ "Screen-edge tags that open an editor window or run an action when tapped. Each game keeps its own quick tags; the main menu set is the start for new games.\n\n"
		+ "## Adding\n_Add Tag:_ pick a window, opened straight to one of its tabs where it has them, or an action like revealing the map, healing or defeating every enemy.\n\n"
		+ "## Changing\n_Tap a tag in the list_ to change its action, position, size, color, icon and opacity, or to remove it.\n_Tags editor_ on the QoL tab moves every tag at once.\n\n"
		+ "## When it can't run\nA tag whose editor is switched off, or that only works in a game, does nothing until it can.";

	public QuickTagsWindow() {
		super();
		addTitle("Quick Tags", INFO);
		List<Integer> ids = QuickTags.LIST.ids();
		if (ids.isEmpty()) addHint("No quick tags yet.");
		for (int id : ids) {
			QuickActions.Action action = QuickTags.action(id);
			addListRow(QuickTags.LIST.name(id), IconCatalog.image(QuickTags.LIST.placement(id).icon()), false, action != null, () -> {
				hide();
				openTag(id);
			}, null);
		}
		pos += GAP;
		addButton("Add Tag", 0, WIDTH, () -> {
			hide();
			QuickActionPickerWindow.openToAdd();
		});
		pos += ROW_HEIGHT + GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	static void openTag(int id) {
		show(new TagSettingsWindow(QuickTags.LIST.tag(id), QuickTags.LIST.name(id) + " Tag", () -> show(new QuickTagsWindow())));
	}

	@Override
	protected void reopen() {
		show(new QuickTagsWindow());
	}
}
