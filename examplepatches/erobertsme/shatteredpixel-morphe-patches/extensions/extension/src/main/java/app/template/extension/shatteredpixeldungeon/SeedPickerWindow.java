package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.plants.Plant;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;

import java.util.ArrayList;
import java.util.List;

public class SeedPickerWindow extends EditorWindow {

	private static final String INFO = "Plant seed\n\n"
		+ "Tap a seed to plant it on this tile. The plant works just like one grown from a seed you throw.\n\n"
		+ "{INFO}Tap i or long-press to read one.";

	private final int cell;
	private final int page;

	public SeedPickerWindow(int cell, int page) {
		super();
		this.cell = cell;
		this.page = page;

		addTitle("Plant a seed", INFO);
		List<InventoryEditor.Entry> seeds = new ArrayList<>();
		for (InventoryEditor.Entry entry : InventoryEditor.catalog()) {
			if (Plant.Seed.class.isAssignableFrom(entry.type)) seeds.add(entry);
		}
		addPagedList(seeds.size(), perPage(7, 3), page, index -> {
			InventoryEditor.Entry entry = seeds.get(index);
			Item sample = sample(entry);
			addListRow(entry.name, sample == null ? null : new ItemSprite(sample), false, true, () -> {
				FloorEditor.plant(entry.type, cell);
				goBack();
			}, sample == null ? null : () -> InventoryWindow.showInfo(sample));
		}, newPage -> replaceWith(new SeedPickerWindow(cell, newPage)));

		finishWithBack(this::back);
	}

	private static Item sample(InventoryEditor.Entry entry) {
		try {
			return entry.type.getConstructor().newInstance();
		} catch (Throwable e) {
			return null;
		}
	}

	private void back() {
		TileWindow.open(cell);
	}

	@Override
	protected void reopen() {
		show(new SeedPickerWindow(cell, page));
	}
}
