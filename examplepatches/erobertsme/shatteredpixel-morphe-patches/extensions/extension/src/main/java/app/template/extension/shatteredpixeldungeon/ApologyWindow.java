package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs.Shopkeeper;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.potions.PotionOfHealing;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;

/**
 * Shown when the hero tries to walk back into a shop they were thrown out of.
 */
public class ApologyWindow extends EditorWindow {

	private final Mob shopkeeper;

	public ApologyWindow(Mob shopkeeper) {
		super();
		this.shopkeeper = shopkeeper;
		Hero hero = Dungeon.hero;

		addTitle("Banned");
		RenderedTextBlock text = PixelScene.renderTextBlock("The shopkeeper won't let you back in until you apologize.", 6);
		text.maxWidth(WIDTH);
		text.setPos(0, pos);
		add(text);
		pos = text.bottom() + 2 * GAP;

		addRowButton("Nevermind", null, this::hide);

		PotionOfHealing sample = new PotionOfHealing();
		int price = goldPrice(sample);
		RedButton gold = addIconRightButton("Apologize: Give " + price, () -> {
			if (Dungeon.gold < price) return;
			Dungeon.gold -= price;
			apologize();
		});
		gold.icon(Icons.get(Icons.COIN_SML));
		gold.enable(Dungeon.gold >= price);
		pos += ROW_HEIGHT + GAP;

		if (isKnown(sample)) {
			Item potion = hero == null ? null : hero.belongings.getItem(PotionOfHealing.class);
			RedButton give = addIconRightButton("Apologize: Give Health Potion", () -> {
				Item carried = Dungeon.hero.belongings.getItem(PotionOfHealing.class);
				if (carried == null) return;
				carried.detach(Dungeon.hero.belongings.backpack);
				Item.updateQuickslot();
				apologize();
			});
			give.icon(new ItemSprite(sample));
			give.enable(potion != null);
			pos += ROW_HEIGHT;
		} else {
			pos -= GAP;
		}
		finish();
	}

	private RedButton addIconRightButton(String label, Runnable action) {
		RedButton button = new IconRightButton(label, action);
		button.setRect(0, pos, WIDTH, ROW_HEIGHT);
		add(button);
		return button;
	}

	private static int goldPrice(Item potion) {
		try {
			return Math.max(1, Shopkeeper.sellPrice(potion));
		} catch (Throwable e) {
			return 150;
		}
	}

	private static boolean isKnown(PotionOfHealing potion) {
		try {
			return potion.isKnown();
		} catch (Throwable e) {
			return false;
		}
	}

	private void apologize() {
		hide();
		ShopkeeperRules.forgive(shopkeeper);
	}

	@Override
	protected void reopen() {
		show(new ApologyWindow(shopkeeper));
	}
}
