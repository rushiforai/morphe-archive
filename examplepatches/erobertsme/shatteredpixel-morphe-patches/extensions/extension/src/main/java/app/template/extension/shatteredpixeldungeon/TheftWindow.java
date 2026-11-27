package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs.Shopkeeper;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;

/**
 * Shown when a Lenient shopkeeper catches the hero stealing: pay for the item, or be thrown out of the shop.
 * Closing the window counts as leaving.
 */
public class TheftWindow extends EditorWindow {

	private final Mob shopkeeper;
	private final Heap heap;
	private boolean chose;

	public TheftWindow(Mob shopkeeper, Heap heap) {
		super();
		this.shopkeeper = shopkeeper;
		this.heap = heap;
		Item item = heap.peek();
		int price = price(item);

		addTitle("Caught Stealing!");
		RenderedTextBlock text = PixelScene.renderTextBlock("\"Pay for that or get out!\"\n\nPay for the " + item.title() + ", or leave the shop until you apologize.", 6);
		text.maxWidth(WIDTH);
		text.setPos(0, pos);
		add(text);
		pos = text.bottom() + 2 * GAP;

		RedButton pay = addButton("Pay " + price, 0, WIDTH, () -> {
			chose = true;
			hide();
			pay(price);
		});
		pay.icon(Icons.get(Icons.COIN_SML));
		pay.enable(Dungeon.gold >= price);
		pos += ROW_HEIGHT + GAP;

		addButton("Leave the Shop", 0, WIDTH, this::hide);
		pos += ROW_HEIGHT;
		finish();
	}

	private static int price(Item item) {
		try {
			return Math.max(1, Shopkeeper.sellPrice(item));
		} catch (Throwable e) {
			return Math.max(1, item.value());
		}
	}

	private void pay(int price) {
		Hero hero = Dungeon.hero;
		if (hero == null || Dungeon.gold < price || heap.isEmpty()) return;
		Dungeon.gold -= price;
		Item item = heap.pickUp();
		if (!item.doPickUp(hero)) {
			Heap dropped = Dungeon.level.drop(item, heap.pos);
			if (dropped != null && dropped.sprite != null) dropped.sprite.drop();
		}
	}

	@Override
	public void hide() {
		super.hide();
		if (chose) return;
		chose = true;
		ShopkeeperRules.banishHero(shopkeeper);
	}

	@Override
	protected void reopen() {
		show(new TheftWindow(shopkeeper, heap));
	}
}
