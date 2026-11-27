package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.watabou.noosa.audio.Sample;

/**
 * A pouch sold in shops that unlocks the Equipment or Rings backpack tab for the rest of the game.
 * Buying it unlocks the tab straight away instead of going into your backpack, and it is never saved: shops get
 * it back from TabPouches when their floor loads.
 */
class TabPouch extends Item {

	private static final int BACKPACK_SPRITE = 481;
	private static final String PICKUP_SOUND = "sounds/item.mp3";
	private static final String[] NAMES = { "weapon pouch", "armor pouch", "ring pouch" };

	final int kind;

	TabPouch(int kind) {
		this.kind = kind;
		this.image = BACKPACK_SPRITE;
	}

	@Override
	public String name() {
		return NAMES[kind];
	}

	@Override
	public String desc() {
		return "A pouch for your backpack. Buying it adds a " + FilterBag.label(kind) + " tab that holds your "
			+ FilterBag.label(kind).toLowerCase() + " like the potion bandolier holds potions, so they don't use backpack space."
			+ " Once you own one, the other shops stop selling it.";
	}

	@Override
	public boolean isIdentified() {
		return true;
	}

	@Override
	public boolean isUpgradable() {
		return false;
	}

	@Override
	public int value() {
		return TabPouches.PRICE;
	}

	@Override
	public boolean doPickUp(Hero hero, int pos) {
		TabPouches.own(kind);
		Sample.INSTANCE.play(PICKUP_SOUND);
		GLog.i("You now have a " + FilterBag.label(kind) + " tab in your backpack.");
		hero.spendAndNext(1f);
		return true;
	}
}
