package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndMessage;

import java.util.List;

public class TrapPickerWindow extends EditorWindow {

	private static final String[] KINDS = { "Favorites", "All traps" };
	private static final String INFO = "Place trap\n\n"
		+ "Tap a trap to place it on this tile, replacing any trap already there.\n\n"
		+ "_Hidden:_ places it hidden, the way the dungeon does.\n\n"
		+ "{HEART}The heart adds a trap to Favorites.\n\n"
		+ "{INFO}Tap i or long-press to read one.";

	private static boolean hidden;

	private final int cell;
	private final int kind;
	private final int page;
	private final Trap replacing;

	public TrapPickerWindow(int cell, int kind, int page, Trap replacing) {
		super();
		this.cell = cell;
		this.kind = kind;
		this.page = page;
		this.replacing = replacing;

		addTitle(replacing == null ? "Place trap" : "Change trap", INFO);
		addButtonRow(KINDS, kind, index -> {
			if (index != kind) replaceWith(new TrapPickerWindow(cell, index, 0, replacing));
		});
		addCheckBox("Hidden", hidden, () -> hidden = !hidden);
		pos += GAP;

		List<FloorEditor.TrapKind> traps = kind == 0 ? CatalogTabs.live(FloorEditor.trapKinds(), trap -> Favorites.isTrap(trap.className)) : FloorEditor.trapKinds();
		if (traps.isEmpty()) addHint("No favorites yet. Tap the heart next to a trap to add it here.");
		addPagedList(traps.size(), perPage(7, 3), page, index -> {
			String className = traps.get(index).className;
			String name = traps.get(index).name;
			addListRow(name, null, replacing != null && replacing.getClass().getName().equals(className), true, () -> {
				FloorEditor.placeTrap(className, cell, hidden);
				goBack();
			}, () -> showInfo(className, name), new Favorite() {
				@Override
				public boolean isFavorite() {
					return Favorites.isTrap(className);
				}

				@Override
				public void toggle() {
					Favorites.toggleTrap(className);
				}
			});
		}, newPage -> replaceWith(new TrapPickerWindow(cell, kind, newPage, replacing)));

		finishWithBack(this::back);
	}

	private static void showInfo(String className, String name) {
		Trap sample = FloorEditor.trapSample(className);
		if (sample == null) return;
		try {
			show(new WndMessage(name + "\n\n" + sample.desc()));
		} catch (Throwable ignored) {
		}
	}

	private void back() {
		TileWindow.open(cell);
	}

	@Override
	protected void reopen() {
		show(new TrapPickerWindow(cell, kind, page, replacing));
	}
}
