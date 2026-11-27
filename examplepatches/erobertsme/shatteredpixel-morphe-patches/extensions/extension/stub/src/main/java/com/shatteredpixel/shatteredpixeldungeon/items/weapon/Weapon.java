package com.shatteredpixel.shatteredpixeldungeon.items.weapon;

import com.shatteredpixel.shatteredpixeldungeon.items.KindOfWeapon;

public class Weapon extends KindOfWeapon {
	public enum Augment { SPEED, DAMAGE, NONE }

	public Augment augment;
	public Enchantment enchantment;

	public Weapon enchant(Enchantment ench) { throw new RuntimeException("Stub"); }

	public static abstract class Enchantment {
		public static final Class<?>[] common = null;
		public static final Class<?>[] uncommon = null;
		public static final Class<?>[] rare = null;
		public static final Class<?>[] curses = null;

		public String name() { throw new RuntimeException("Stub"); }
		public String name(String itemName) { throw new RuntimeException("Stub"); }
		public String desc() { throw new RuntimeException("Stub"); }
		public static float genericProcChanceMultiplier(com.shatteredpixel.shatteredpixeldungeon.actors.Char attacker) { throw new RuntimeException("Stub"); }
	}
	public boolean curseInfusionBonus;
	public boolean masteryPotionBonus;
	public int STRReq() { throw new RuntimeException("Stub"); }
	public int STRReq(int lvl) { throw new RuntimeException("Stub"); }
}
