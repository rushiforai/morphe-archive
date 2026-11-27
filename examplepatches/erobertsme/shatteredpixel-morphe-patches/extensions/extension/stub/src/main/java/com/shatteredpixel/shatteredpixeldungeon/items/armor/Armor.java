package com.shatteredpixel.shatteredpixeldungeon.items.armor;

import com.shatteredpixel.shatteredpixeldungeon.items.EquipableItem;

public class Armor extends EquipableItem {
	public enum Augment { EVASION, DEFENSE, NONE }

	public Augment augment;
	public Glyph glyph;

	public final int DRMin() { throw new RuntimeException("Stub"); }
	public final int DRMax() { throw new RuntimeException("Stub"); }
	public Armor inscribe(Glyph glyph) { throw new RuntimeException("Stub"); }

	public static abstract class Glyph {
		public static final Class<?>[] common = null;
		public static final Class<?>[] uncommon = null;
		public static final Class<?>[] rare = null;
		public static final Class<?>[] curses = null;

		public String name() { throw new RuntimeException("Stub"); }
		public String name(String itemName) { throw new RuntimeException("Stub"); }
		public String desc() { throw new RuntimeException("Stub"); }
	}
	public boolean curseInfusionBonus;
	public boolean masteryPotionBonus;
	public int STRReq() { throw new RuntimeException("Stub"); }
	public int STRReq(int lvl) { throw new RuntimeException("Stub"); }
}
