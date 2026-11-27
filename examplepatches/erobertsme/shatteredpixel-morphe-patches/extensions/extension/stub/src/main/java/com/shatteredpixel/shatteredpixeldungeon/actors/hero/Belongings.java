package com.shatteredpixel.shatteredpixeldungeon.actors.hero;

import com.shatteredpixel.shatteredpixeldungeon.items.KindOfWeapon;
import com.shatteredpixel.shatteredpixeldungeon.items.KindofMisc;
import com.shatteredpixel.shatteredpixeldungeon.items.armor.Armor;
import com.shatteredpixel.shatteredpixeldungeon.items.artifacts.Artifact;
import com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag;
import com.shatteredpixel.shatteredpixeldungeon.items.rings.Ring;

public class Belongings implements Iterable<com.shatteredpixel.shatteredpixeldungeon.items.Item> {
	public static boolean bundleRestoring;
	public java.util.Iterator<com.shatteredpixel.shatteredpixeldungeon.items.Item> iterator() { throw new RuntimeException("Stub"); }
	public <T extends com.shatteredpixel.shatteredpixeldungeon.items.Item> T getItem(Class<T> itemClass) { throw new RuntimeException("Stub"); }
	public java.util.ArrayList<Bag> getBags() { throw new RuntimeException("Stub"); }
	public KindOfWeapon weapon;
	public Armor armor;
	public Artifact artifact;
	public KindofMisc misc;
	public Ring ring;
	public KindOfWeapon secondWep;
	public KindOfWeapon thrownWeapon;
	public Backpack backpack;

	public KindOfWeapon weapon() { throw new RuntimeException("Stub"); }
	public KindOfWeapon attackingWeapon() { throw new RuntimeException("Stub"); }
	public Armor armor() { throw new RuntimeException("Stub"); }
	public void identify() { throw new RuntimeException("Stub"); }

	public static class Backpack extends Bag {
	}
}
