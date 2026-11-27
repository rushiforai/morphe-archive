package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.Statistics;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs.Shopkeeper;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.missiles.MissileWeapon;
import com.shatteredpixel.shatteredpixeldungeon.messages.Messages;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.InventorySlot;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.CurrencyIndicator;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoItem;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndTitledMessage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The shopkeeper's menu: sell, talk, and buy back sold items, newest first, each with its price and an i button to examine it.
 */
public class ShopWindow extends EditorWindow {

	private static final String TAG = "ShopWindow";
	private static final int PER_PAGE = 7;
	private static final int PER_PAGE_LANDSCAPE = 3;
	private static final int BUYBACK_ROW_HEIGHT = 20;
	private static final int SLOT_SIZE = 18;
	private static final int SLOT_INSET = 1;
	private static final int PRICE_WIDTH = 30;
	private static final int ROW_PADDING = 3;
	private static final float GOLD_SCALE = 0.75f;
	private static final int SHORT_COLOR = 0xFF5555;

	private final Shopkeeper shopkeeper;
	private final int page;

	public ShopWindow(Shopkeeper shopkeeper, int page) {
		super();
		this.shopkeeper = shopkeeper;
		this.page = page;
		CurrencyIndicator.showGold = true;

		addTitle(InventoryEditor.capitalize(shopkeeper.name()));
		RenderedTextBlock description = PixelScene.renderTextBlock(shopkeeper.description(), 6);
		description.maxWidth(WIDTH);
		description.setPos(0, pos);
		add(description);
		pos = description.bottom() + 2 * GAP;

		float half = (WIDTH - GAP) / 2f;
		addButton("Sell", 0, half, () -> {
			hide();
			Shopkeeper.sell();
		});
		addButton("Talk", half + GAP, half, () -> {
			hide();
			show(new WndTitledMessage(shopkeeper.sprite(), Messages.titleCase(shopkeeper.name()), shopkeeper.chatText()));
		});
		pos += ROW_HEIGHT + GAP;

		List<Item> sold = shopkeeper.buybackItems;
		int limit = ShopkeeperRules.buybackLimit();
		if (sold != null && !sold.isEmpty() && limit > 0) {
			List<Item> items = new ArrayList<>(sold);
			Collections.reverse(items);
			if (items.size() > limit) items = new ArrayList<>(items.subList(0, limit));
			List<Item> offered = items;
			addBuybackHeader(offered.size(), limit);
			int perPage = Math.min(perPage(PER_PAGE, PER_PAGE_LANDSCAPE), offered.size());
			addPagedList(offered.size(), perPage, page, index -> addBuybackRow(offered.get(index)),
				newPage -> replaceWith(new ShopWindow(shopkeeper, newPage)));
		}
		finish();
	}

	/**
	 * The Buy Back heading, with how many sold items the shop is holding out of the most it keeps.
	 */
	private void addBuybackHeader(int count, int limit) {
		float top = pos;
		addSection("Buy Back");
		RenderedTextBlock counter = PixelScene.renderTextBlock(count + "/" + limit + " items sold", 6);
		counter.hardlight(count >= limit ? SHORT_COLOR : EditorWindow.DIM_COLOR);
		counter.setPos(WIDTH - counter.width(), top + 2 * GAP + 1);
		PixelScene.align(counter);
		add(counter);
	}

	/**
	 * A sold item: a button with the item in an inventory slot, tinted the way the backpack shows cursed and unidentified items, and its
	 * name, then its price and an i button. Tapping it buys the item back.
	 */
	private void addBuybackRow(Item item) {
		int price = HeroExtras.sellValue(item.value());
		boolean affordable = Dungeon.gold >= price;
		Runnable buy = () -> buyBack(item);
		Runnable info = () -> show(new WndInfoItem(item));
		float buttonWidth = WIDTH - PRICE_WIDTH - INFO_SIZE - 2 * GAP;

		RedButton button = new RedButton("") {
			@Override
			public void onClick() {
				buy.run();
			}

			@Override
			public boolean onLongClick() {
				info.run();
				return true;
			}
		};
		button.setRect(0, pos, buttonWidth, BUYBACK_ROW_HEIGHT);
		button.enable(affordable);
		add(button);

		InventorySlot slot = new InventorySlot(item) {
			@Override
			public void onClick() {
				if (affordable) buy.run();
			}

			@Override
			public boolean onLongClick() {
				info.run();
				return true;
			}
		};
		slot.setRect(SLOT_INSET, pos + SLOT_INSET, SLOT_SIZE, SLOT_SIZE);
		add(slot);

		float textLeft = SLOT_INSET + SLOT_SIZE + ROW_PADDING;
		RenderedTextBlock name = PixelScene.renderTextBlock(InventoryEditor.capitalize(item.title()), 6);
		name.maxWidth((int) (buttonWidth - textLeft - ROW_PADDING));
		if (!affordable) name.alpha(0.3f);
		name.setPos(textLeft, pos + (BUYBACK_ROW_HEIGHT - name.height()) / 2f);
		PixelScene.align(name);
		add(name);

		ItemSprite gold = new ItemSprite(ItemSpriteSheet.GOLD);
		gold.scale.set(GOLD_SCALE, GOLD_SCALE);
		gold.x = buttonWidth + GAP;
		gold.y = pos + (BUYBACK_ROW_HEIGHT - gold.height()) / 2f;
		PixelScene.align(gold);
		add(gold);
		RenderedTextBlock amount = PixelScene.renderTextBlock(String.valueOf(price), 7);
		amount.hardlight(affordable ? 0xFFFFFF : SHORT_COLOR);
		amount.setPos(gold.x + gold.width() + 1, pos + (BUYBACK_ROW_HEIGHT - amount.height()) / 2f);
		PixelScene.align(amount);
		add(amount);

		IconButton infoButton = new IconButton(Icons.get(Icons.INFO)) {
			@Override
			public void onClick() {
				info.run();
			}
		};
		infoButton.setRect(WIDTH - INFO_SIZE, pos, INFO_SIZE, BUYBACK_ROW_HEIGHT);
		add(infoButton);
		pos += BUYBACK_ROW_HEIGHT + GAP;
	}

	private void buyBack(Item item) {
		hide();
		buyBack(shopkeeper, item);
	}

	/**
	 * Buys [item] back from [shopkeeper] when the hero can afford it, putting it in the backpack or at the hero's feet.
	 */
	private static void buyBack(Shopkeeper shopkeeper, Item item) {
		Hero hero = Dungeon.hero;
		int price = HeroExtras.sellValue(item.value());
		if (hero == null || !shopkeeper.buybackItems.contains(item) || Dungeon.gold < price) return;
		try {
			GLog.i(Messages.get(shopkeeper, "buyback"));
			shopkeeper.buybackItems.remove(item);
			Dungeon.gold -= price;
			Statistics.goldCollected -= price;
			if (item instanceof MissileWeapon && item.isUpgradable()) {
				Buff.affect(hero, MissileWeapon.UpgradedSetTracker.class).levelThresholds.put(((MissileWeapon) item).setID, item.level());
			}
			if (!item.doPickUp(hero)) {
				Heap heap = Dungeon.level.drop(item, hero.pos);
				if (heap != null && heap.sprite != null) heap.sprite.drop();
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not buy back " + item.getClass().getName(), e);
		}
	}

	@Override
	public void hide() {
		super.hide();
		CurrencyIndicator.showGold = false;
	}

	@Override
	protected void reopen() {
		show(new ShopWindow(shopkeeper, page));
	}
}
