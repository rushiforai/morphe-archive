package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Chrome;
import com.shatteredpixel.shatteredpixeldungeon.ui.StyledButton;
import com.watabou.noosa.Image;

public class BackpackSettingsWindow extends EditorWindow {

	private static final String INFO = "Backpack\n\n"
		+ "## Rows and pages\n_Rows of items:_ rows on each page of the backpack and every bag, from the game's 4 up to 8. Each extra row is 5 more slots.\n_Extra page for each tab:_ gives every bag a second page of the same size.\nWith unlimited inventory space on, bags show 8 rows and grow as needed instead.\n\n"
		+ "## Tabs\n_Equipment, Rings:_ hold melee weapons and armor (not thrown weapons, bombs or the spirit bow), or rings, like the potion bandolier holds potions, 19 each, without using backpack space. Needs the Inventory editor patch.\n\n"
		+ "## Buying tabs\n_Shopkeeper button_ beside each tab: red means that tab has to be bought first. Every shop sells a pouch for it for 1000 gold, and once bought the other shops stop selling it. Grey means the tab is free.\nPouches are only sold while the tab is switched on.";

	public BackpackSettingsWindow() {
		super();
		addTitle("Backpack", INFO);
		addHint("Rows of items");
		int count = QolSettings.MAX_BAG_ROWS - QolSettings.DEFAULT_BAG_ROWS + 1;
		String[] labels = new String[count];
		for (int i = 0; i < count; i++) labels[i] = i == 0 ? "Default" : String.valueOf(QolSettings.DEFAULT_BAG_ROWS + i);
		addButtonRow(labels, QolSettings.bagRows() - QolSettings.DEFAULT_BAG_ROWS, index -> {
			QolSettings.bagRows(QolSettings.DEFAULT_BAG_ROWS + index);
			refresh();
		});
		addCheckBox("Extra page for each tab", QolSettings.extraBagPage(), () -> QolSettings.extraBagPage(!QolSettings.extraBagPage()));
		if (InventoryWindow.isAvailable()) {
			pos += GAP;
			addSection("Tabs");
			for (int kind = 0; kind < FilterBag.count(); kind++) {
				final int tab = kind;
				checkBoxSideButton(shopToggle(tab));
				addCheckBox(FilterBag.label(kind) + " tab", FilterBag.enabled(kind), () -> FilterBag.setOn(tab, !FilterBag.enabled(tab)));
			}
		}
		pos += GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	private static final String SHOPKEEPER = "sprites/shopkeeper.png";
	private static final int SHOPKEEPER_SIZE = 14;

	/**
	 * The shopkeeper button beside a tab: red with the shopkeeper solid when the tab has to be bought from a shop,
	 * grey with the shopkeeper faded when it doesn't.
	 */
	private StyledButton shopToggle(int tab) {
		boolean on = TabPouches.soldInShops(tab);
		StyledButton button = new StyledButton(on ? Chrome.Type.RED_BUTTON : Chrome.Type.GREY_BUTTON, "") {
			@Override
			public void onClick() {
				TabPouches.soldInShops(tab, !TabPouches.soldInShops(tab));
				refresh();
			}
		};
		Image keeper = new Image(SHOPKEEPER, SHOPKEEPER_SIZE, 0, SHOPKEEPER_SIZE, SHOPKEEPER_SIZE);
		keeper.alpha(on ? 1f : 0.45f);
		button.icon(keeper);
		return button;
	}

	@Override
	protected void reopen() {
		show(new BackpackSettingsWindow());
	}
}
