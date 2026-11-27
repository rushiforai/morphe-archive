package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs.Shopkeeper;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.missiles.MissileWeapon;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.ui.CurrencyIndicator;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndBag;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoItem;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndTradeItem;
import com.watabou.noosa.Game;

/**
 * An item's details when selling it, with its price and buttons to sell it or go back.
 */
public class ShopItemWindow extends WndInfoItem {

	private static final String TAG = "ShopItemWindow";
	private static final int GAP = 2;
	private static final int BUTTON_HEIGHT = 18;
	private static final int PRICE_HEIGHT = 16;
	private static final int TEXT_COLOR = 0xFFFFFF;
	private static final int DIM_COLOR = 0x999999;
	private static final int SHORT_COLOR = 0xFF5555;

	private Runnable onBack;
	private float bottom;

	private ShopItemWindow(Item item) {
		super(item);
		CurrencyIndicator.showGold = true;
		bottom = height;
	}

	/**
	 * Called at the start of the shopkeeper's item selector onSelect. Shows this window for the chosen item instead of the game's.
	 */
	public static boolean onSellSelected(Item item) {
		if (item == null || !ShopkeeperRules.isAvailable() || Dungeon.hero == null || !Dungeon.hero.isAlive()) return false;
		try {
			WndBag bag = Shopkeeper.sell();
			forSale(item, bag);
			return true;
		} catch (Throwable e) {
			Log.e(TAG, "Could not show the item for sale", e);
			return false;
		}
	}

	private static void forSale(Item item, WndBag bag) {
		ShopItemWindow window = new ShopItemWindow(item);
		Shopkeeper shop = shopkeeperHere();
		boolean wholeOnly = item.quantity() == 1 || item instanceof MissileWeapon && item.isUpgradable();
		int total = HeroExtras.sellValue(item.value());
		int each = HeroExtras.sellValue(item.value() / Math.max(1, item.quantity()));
		window.addPrice("Sells for", total, wholeOnly ? null : each + " each", true);
		Runnable reopen = () -> {
			window.hide();
			if (bag != null) bag.hide();
			Shopkeeper.sell();
		};
		if (wholeOnly) {
			window.addButtons(new String[] { "Sell", "Back" }, new boolean[] { true, true }, new Runnable[] {
				() -> {
					WndTradeItem.sell(item, shop);
					reopen.run();
				},
				window::hide,
			});
		} else {
			window.addButtons(new String[] { "Sell 1", "Sell all", "Back" }, new boolean[] { true, true, true }, new Runnable[] {
				() -> {
					WndTradeItem.sellOne(item, shop);
					reopen.run();
				},
				() -> {
					WndTradeItem.sell(item, shop);
					reopen.run();
				},
				window::hide,
			});
		}
		window.finish(window::hide);
	}

	private void addPrice(String label, int price, String note, boolean affordable) {
		float top = bottom + GAP;
		RenderedTextBlock left = PixelScene.renderTextBlock(note == null ? label : label + " (" + note + ")", 6);
		left.hardlight(DIM_COLOR);
		left.setPos(0, top + (PRICE_HEIGHT - left.height()) / 2f);
		PixelScene.align(left);
		add(left);

		RenderedTextBlock amount = PixelScene.renderTextBlock(String.valueOf(price), 8);
		amount.hardlight(affordable ? TEXT_COLOR : SHORT_COLOR);
		amount.setPos(width - amount.width(), top + (PRICE_HEIGHT - amount.height()) / 2f);
		PixelScene.align(amount);
		add(amount);

		ItemSprite gold = new ItemSprite(ItemSpriteSheet.GOLD);
		gold.x = amount.left() - gold.width() - 1;
		gold.y = top + (PRICE_HEIGHT - gold.height()) / 2f;
		PixelScene.align(gold);
		add(gold);
		bottom = top + PRICE_HEIGHT;
	}

	private void addButtons(String[] labels, boolean[] enabled, Runnable[] actions) {
		float top = bottom + GAP;
		float buttonWidth = (width - (labels.length - 1) * GAP) / (float) labels.length;
		for (int i = 0; i < labels.length; i++) {
			Runnable action = actions[i];
			RedButton button = new RedButton(labels[i]) {
				@Override
				public void onClick() {
					action.run();
				}
			};
			button.setRect(i * (buttonWidth + GAP), top, buttonWidth, BUTTON_HEIGHT);
			button.enable(enabled[i]);
			add(button);
		}
		bottom = top + BUTTON_HEIGHT;
	}

	private void finish(Runnable back) {
		onBack = back;
		resize(width, (int) Math.ceil(bottom));
		Game.scene().addToFront(this);
	}

	@Override
	public void onBackPressed() {
		if (onBack != null) {
			onBack.run();
			return;
		}
		super.onBackPressed();
	}

	@Override
	public void hide() {
		super.hide();
		CurrencyIndicator.showGold = false;
	}

	private static Shopkeeper shopkeeperHere() {
		if (Dungeon.level == null || Dungeon.level.mobs == null) return null;
		for (Mob mob : Dungeon.level.mobs) {
			if (mob instanceof Shopkeeper) return (Shopkeeper) mob;
		}
		return null;
	}
}
