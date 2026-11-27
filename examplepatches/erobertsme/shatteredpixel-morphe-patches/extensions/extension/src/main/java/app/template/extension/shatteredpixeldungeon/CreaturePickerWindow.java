package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.watabou.noosa.Image;

import java.util.List;

public class CreaturePickerWindow extends EditorWindow {

	private static final String[] KINDS = { "Favs", "Enemies", "NPCs", "Other" };
	private static final String INFO = "Spawn creature\n\n"
		+ "Tap a creature to place it on this tile.\n\n"
		+ "## Options\n_Ally:_ makes it fight for you.\n_Level:_ some creatures, like mimics, bees and wraiths, grow stronger deeper down. They show their level in the list and spawn at the level set here. _Auto_ uses the current floor.\n{CHANGES}The reset button goes back to Auto.\n\n"
		+ "## Finding one\nEnemies are sorted by the first area they appear in. The area buttons jump to where each starts: Sewers, Prison, Caves, City (Dwarven City), Vault (vault enemies) and Halls (Demon Halls).\n{HEART}The heart adds a creature to Favorites.\n{INFO}Tap i or long-press to read one.\n\n"
		+ "## Note\nBosses and level-specific creatures can behave oddly away from their own floor.";

	private static boolean ally;

	private final int cell;
	private final int kind;
	private final int page;

	public CreaturePickerWindow(int cell, int kind, int page) {
		super();
		this.cell = cell;
		this.kind = kind;
		this.page = page;

		addTitle("Spawn creature", INFO);
		addButtonRow(KINDS, kind, index -> {
			if (index != kind) replaceWith(new CreaturePickerWindow(cell, index, 0));
		});
		addCheckBox("Ally", ally, () -> ally = !ally);
		int level = FloorEditor.effectiveSpawnLevel();
		String display = FloorEditor.spawnLevel() == 0 ? "Auto " + level : String.valueOf(level);
		addStepper("Level", display, level, 1, 1, FloorEditor.MAX_SPAWN_LEVEL, value -> FloorEditor.spawnLevel(Math.max(1, value)), true, () -> FloorEditor.spawnLevel(0));
		pos += GAP;

		List<CreatureCatalog.Entry> entries = CreatureCatalog.catalog(kind);
		boolean byArea = kind == CreatureCatalog.ENEMIES;
		int perPage = byArea ? perPage(5, 2) : perPage(7, 3);
		if (byArea) addAreaButtons(entries, perPage);
		if (entries.isEmpty()) addHint("No favorites yet. Tap the heart next to a creature to add it here.");
		addPagedList(entries.size(), perPage, page, index -> {
			CreatureCatalog.Entry entry = entries.get(index);
			String name = FloorEditor.scales(entry.type) ? entry.name + " (Lv " + level + ")" : entry.name;
			addListRow(name, sprite(entry), false, true, () -> {
				FloorEditor.spawn(entry.type, cell, ally);
				hide();
			}, () -> showInfo(entry), new Favorite() {
				@Override
				public boolean isFavorite() {
					return Favorites.isCreature(entry.type.getName());
				}

				@Override
				public void toggle() {
					Favorites.toggleCreature(entry.type.getName());
				}
			});
		}, newPage -> replaceWith(new CreaturePickerWindow(cell, kind, newPage)));

		finishWithBack(this::back);
	}

	/**
	 * A button for each area of the dungeon that jumps to the page where its creatures start.
	 */
	private void addAreaButtons(List<CreatureCatalog.Entry> entries, int perPage) {
		String[] labels = CreatureCatalog.AREA_LABELS;
		int perRow = 3;
		for (int first = 0; first < labels.length; first += perRow) {
			int rowStart = first;
			String[] rowLabels = new String[perRow];
			for (int i = 0; i < perRow; i++) rowLabels[i] = rowStart + i < labels.length && CreatureCatalog.firstInArea(entries, rowStart + i) >= 0 ? labels[rowStart + i] : "";
			addButtonRow(rowLabels, -1, index -> {
				int start = CreatureCatalog.firstInArea(entries, rowStart + index);
				if (start >= 0) replaceWith(new CreaturePickerWindow(cell, kind, start / perPage));
			});
		}
	}

	private static Image sprite(CreatureCatalog.Entry entry) {
		try {
			return entry.type.getConstructor().newInstance().sprite();
		} catch (Throwable e) {
			return null;
		}
	}

	private static void showInfo(CreatureCatalog.Entry entry) {
		try {
			Mob mob = entry.type.getConstructor().newInstance();
			show(new com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoMob(mob));
		} catch (Throwable ignored) {
		}
	}

	private void back() {
		TileWindow.open(cell);
	}

	@Override
	protected void reopen() {
		show(new CreaturePickerWindow(cell, kind, page));
	}
}
