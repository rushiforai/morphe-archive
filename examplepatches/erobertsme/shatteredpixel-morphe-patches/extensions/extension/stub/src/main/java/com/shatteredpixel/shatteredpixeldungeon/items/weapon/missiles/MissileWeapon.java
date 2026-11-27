package com.shatteredpixel.shatteredpixeldungeon.items.weapon.missiles;

import com.shatteredpixel.shatteredpixeldungeon.items.weapon.Weapon;

public class MissileWeapon extends Weapon {
	public int tier;
	public boolean spawnedForEffect;
	public long setID;

	public static class UpgradedSetTracker extends com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff {
		public java.util.HashMap<Long, Integer> levelThresholds;
	}
	public float durabilityLeft() { throw new RuntimeException("Stub"); }
	public final float durabilityPerUse() { throw new RuntimeException("Stub"); }
}
