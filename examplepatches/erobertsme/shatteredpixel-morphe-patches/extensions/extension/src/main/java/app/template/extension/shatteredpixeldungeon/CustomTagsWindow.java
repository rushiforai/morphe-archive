package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndBag;
import com.watabou.noosa.Image;

import java.util.List;

/**
 * The Item Tags page in Extras, QoL: the tags you've made, and Add Tag.
 */
public class CustomTagsWindow extends EditorWindow {

	private static final String INFO = "Item Tags\n\n"
		+ "Screen-edge tags that use an item when tapped, like a quickslot. Each game keeps its own item tags.\n\n"
		+ "## Adding\n_Add Tag:_ pick an item from your backpack. Its tag follows the kind of item, using the first one you carry, and hides while you carry none.\n\n"
		+ "## Changing\n_Tap a tag in the list_ to change its position, size, color, icon and opacity, or to delete it.\n_Default Icon_ on the Icon tab shows the item again.";

	public CustomTagsWindow() {
		super();
		addTitle("Item Tags", INFO);
		List<Integer> ids = CustomItemTags.LIST.ids();
		if (ids.isEmpty()) addHint("No item tags yet.");
		for (int id : ids) {
			addListRow(CustomItemTags.LIST.name(id), icon(id), false, true, () -> {
				hide();
				openTag(id);
			}, null);
		}
		pos += GAP;
		boolean inGame = Dungeon.hero != null && Dungeon.hero.isAlive() && GameSettings.inGame();
		addRowButton("Add Tag", null, this::addTag).enable(inGame);
		if (!inGame) addHint("Open this during a game to add tags.");
		finishWithBack(() -> CloverlordMenu.show());
	}

	private static Image icon(int id) {
		String className = CustomItemTags.LIST.target(id);
		Item item = CustomItemTags.held(className);
		if (item == null) item = CustomItemTags.sample(className);
		try {
			return item == null ? Icons.get(Icons.BACKPACK_LRG) : new ItemSprite(item);
		} catch (Throwable e) {
			return null;
		}
	}

	static void openTag(int id) {
		show(new TagSettingsWindow(CustomItemTags.LIST.tag(id), CustomItemTags.LIST.name(id) + " Tag", () -> show(new CustomTagsWindow())));
	}

	private void addTag() {
		hide();
		GameScene.selectItem(new WndBag.ItemSelector() {
			@Override
			public String textPrompt() {
				return "Choose an item for the tag";
			}

			@Override
			public boolean itemSelectable(Item item) {
				return item.defaultAction() != null;
			}

			@Override
			public void onSelect(Item item) {
				if (item == null) {
					show(new CustomTagsWindow());
					return;
				}
				openTag(CustomItemTags.add(item));
			}
		});
	}

	@Override
	protected void reopen() {
		show(new CustomTagsWindow());
	}
}
