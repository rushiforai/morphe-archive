package app.template.extension.shatteredpixeldungeon;

import java.util.ArrayList;
import java.util.List;

/**
 * Picks what a quick tag does, for a new tag or to change one: open a window, or run an action. Only what your patches include is listed.
 */
public class QuickActionPickerWindow extends EditorWindow {

	private static final String[] KINDS = { "Windows", "Actions" };

	private static Integer changing;

	private final int kind;
	private final int page;

	/**
	 * Opens the picker for a new quick tag.
	 */
	static void openToAdd() {
		changing = null;
		show(new QuickActionPickerWindow(0));
	}

	/**
	 * Opens the picker to change what the quick tag [id] does.
	 */
	static void openToChange(int id) {
		changing = id;
		show(new QuickActionPickerWindow(0));
	}

	public QuickActionPickerWindow(int kind) {
		this(kind, 0);
	}

	public QuickActionPickerWindow(int kind, int page) {
		super();
		this.kind = kind;
		this.page = page;
		addTitle(changing == null ? "Add Quick Tag" : "Change Action");
		addButtonRow(KINDS, kind, index -> {
			if (index != kind) replaceWith(new QuickActionPickerWindow(index));
		});

		if (kind == 1 && EditorSwitches.character()) {
			addRowButton("Apply a chosen status", StatIcons.buff(StatIcons.BUFF_BARKSKIN), () -> {
				hide();
				StatusPickerWindow.openToChoose(recipe -> picked(recipe.id()),
					() -> show(new QuickActionPickerWindow(1)));
			});
		}
		List<QuickActions.Action> choices = choices(kind == 0);
		if (choices.isEmpty()) addHint("Nothing here. The patches or editors these need aren't included or are switched off.");
		addPagedList(choices.size(), perPage(8, 4), page, index -> {
			QuickActions.Action action = choices.get(index);
			addListRow(action.name, IconCatalog.image(action.icon), false, true, () -> {
				hide();
				picked(action.id);
			}, null);
		}, newPage -> replaceWith(new QuickActionPickerWindow(kind, newPage)));

		finishWithBack(QuickActionPickerWindow::back);
	}

	/**
	 * Gives the tag being changed the action [actionId], or makes a new tag for it, and opens that tag's settings.
	 */
	private static void picked(String actionId) {
		Integer id = changing;
		changing = null;
		if (id != null) {
			QuickTags.LIST.setTarget(id, actionId);
			QuickTagsWindow.openTag(id);
			return;
		}
		QuickTagsWindow.openTag(QuickTags.LIST.add(actionId));
	}

	private static void back() {
		Integer id = changing;
		changing = null;
		if (id != null) {
			QuickTagsWindow.openTag(id);
			return;
		}
		show(new QuickTagsWindow());
	}

	/**
	 * The windows, or the actions, whose patch and editor are included and switched on. Checked the same way the tags check before running,
	 * except that being in a game isn't needed to make a tag.
	 */
	private static List<QuickActions.Action> choices(boolean windows) {
		List<QuickActions.Action> list = new ArrayList<>();
		for (QuickActions.Action action : QuickActions.all()) {
			if (action.opensWindow == windows && action.isIncluded()) list.add(action);
		}
		return list;
	}

	@Override
	protected void reopen() {
		show(new QuickActionPickerWindow(kind, page));
	}
}
