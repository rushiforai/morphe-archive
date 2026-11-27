package com.shatteredpixel.shatteredpixeldungeon.actors;

import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;

import java.util.LinkedHashSet;

public class Char {
	public enum Alignment { ENEMY, NEUTRAL, ALLY }

	public enum Property {
		BOSS, MINIBOSS, BOSS_MINION, UNDEAD, DEMONIC, INORGANIC, FIERY, ICY, ACIDIC, ELECTRIC, LARGE, IMMOVABLE, OBJECT, STATIC;

		public java.util.HashSet<Class> resistances() { throw new RuntimeException("Stub"); }
		public java.util.HashSet<Class> immunities() { throw new RuntimeException("Stub"); }
	}

	public int viewDistance;
	public java.util.HashSet<Property> properties() { throw new RuntimeException("Stub"); }
	public int damageRoll() { throw new RuntimeException("Stub"); }
	public int drRoll() { throw new RuntimeException("Stub"); }

	public Alignment alignment;
	public int pos;
	public boolean[] fieldOfView;
	public com.shatteredpixel.shatteredpixeldungeon.sprites.CharSprite sprite;
	public int invisible;
	public int HP;
	public int HT;
	public boolean flying;
	public int paralysed;
	public boolean rooted;

	public boolean interact(Char c) { throw new RuntimeException("Stub"); }
	public final void move(int step) { throw new RuntimeException("Stub"); }

	public boolean isImmune(Class effect) { throw new RuntimeException("Stub"); }
	public float resist(Class effect) { throw new RuntimeException("Stub"); }
	public float stealth() { throw new RuntimeException("Stub"); }

	public void damage(int dmg, Object src) { throw new RuntimeException("Stub"); }
	public void die(Object src) { throw new RuntimeException("Stub"); }
	public String name() { throw new RuntimeException("Stub"); }
	public boolean isAlive() { throw new RuntimeException("Stub"); }
	public int attackSkill(Char target) { throw new RuntimeException("Stub"); }
	public int defenseSkill(Char enemy) { throw new RuntimeException("Stub"); }
	public float speed() { throw new RuntimeException("Stub"); }
	public synchronized LinkedHashSet<Buff> buffs() { throw new RuntimeException("Stub"); }
	public synchronized <T extends Buff> T buff(Class<T> c) { throw new RuntimeException("Stub"); }
	public int shielding() { throw new RuntimeException("Stub"); }
}
