package com.shatteredpixel.shatteredpixeldungeon.items;

import com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag;

public class Item {
	public void storeInBundle(com.watabou.utils.Bundle bundle) { throw new RuntimeException("Stub"); }
	public void restoreFromBundle(com.watabou.utils.Bundle bundle) { throw new RuntimeException("Stub"); }
	public boolean cursed;
	public boolean cursedKnown;
	public boolean levelKnown;
	public boolean stackable;
	protected int image;
	public boolean usesTargeting;
	public int image() { throw new RuntimeException("Stub"); }
	public String defaultAction() { throw new RuntimeException("Stub"); }
	public void execute(com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero hero) { throw new RuntimeException("Stub"); }

	public String name() { throw new RuntimeException("Stub"); }
	public String desc() { throw new RuntimeException("Stub"); }
	public final Item detach(Bag container) { throw new RuntimeException("Stub"); }
	public final boolean doPickUp(com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero hero) { throw new RuntimeException("Stub"); }
	public boolean doPickUp(com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero hero, int pos) { throw new RuntimeException("Stub"); }
	public boolean isEquipped(com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero hero) { throw new RuntimeException("Stub"); }
	public boolean isSimilar(Item item) { throw new RuntimeException("Stub"); }
	public int value() { throw new RuntimeException("Stub"); }

	public static void updateQuickslot() { throw new RuntimeException("Stub"); }
	public boolean collect(Bag container) { throw new RuntimeException("Stub"); }
	public final Item detachAll(Bag container) { throw new RuntimeException("Stub"); }
	public Item duplicate() { throw new RuntimeException("Stub"); }
	public final Item identify() { throw new RuntimeException("Stub"); }
	public boolean isIdentified() { throw new RuntimeException("Stub"); }
	public boolean isUpgradable() { throw new RuntimeException("Stub"); }
	public int level() { throw new RuntimeException("Stub"); }
	public int trueLevel() { throw new RuntimeException("Stub"); }
	public int buffedLvl() { throw new RuntimeException("Stub"); }
	public Item level(int value) { throw new RuntimeException("Stub"); }
	public int quantity() { throw new RuntimeException("Stub"); }
	public Item quantity(int value) { throw new RuntimeException("Stub"); }
	public String info() { throw new RuntimeException("Stub"); }
	public String title() { throw new RuntimeException("Stub"); }
	public final String trueName() { throw new RuntimeException("Stub"); }
	public final Item upgrade(int n) { throw new RuntimeException("Stub"); }
	public int icon;
	public int visiblyUpgraded() { throw new RuntimeException("Stub"); }
	public int buffedVisiblyUpgraded() { throw new RuntimeException("Stub"); }
	public com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite.Glowing glowing() { throw new RuntimeException("Stub"); }
	public String status() { throw new RuntimeException("Stub"); }
}
