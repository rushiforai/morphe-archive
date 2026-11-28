package com.shatteredpixel.shatteredpixeldungeon.actors.hero;

import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.abilities.ArmorAbility;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class Hero extends Char {
	public HeroClass heroClass;
	public int tier() { throw new RuntimeException("Stub"); }
	public HeroSubClass subClass;
	public ArmorAbility armorAbility;
	public int lvl;
	public int exp;
	public int STR;
	public int HTBoost;
	public Belongings belongings;
	public ArrayList<LinkedHashMap<Talent, Integer>> talents;
	public LinkedHashMap<Talent, Talent> metamorphedTalents;

	public boolean ready;
	public boolean resting;
	public HeroAction lastAction;
	public HeroAction curAction;
	public float attackDelay() { throw new RuntimeException("Stub"); }
	public int damageRoll() { throw new RuntimeException("Stub"); }
	public void busy() { throw new RuntimeException("Stub"); }
	public void spendAndNext(float time) { throw new RuntimeException("Stub"); }
	public void next() { throw new RuntimeException("Stub"); }
	public boolean canAttack(com.shatteredpixel.shatteredpixeldungeon.actors.Char enemy) { throw new RuntimeException("Stub"); }

	public boolean handle(int cell) { throw new RuntimeException("Stub"); }
	public void updateHT(boolean boostHP) { throw new RuntimeException("Stub"); }
	public int STR() { throw new RuntimeException("Stub"); }
	public int maxExp() { throw new RuntimeException("Stub"); }
	public Hero() { throw new RuntimeException("Stub"); }
	public void restoreFromBundle(com.watabou.utils.Bundle bundle) { throw new RuntimeException("Stub"); }
	public static int maxExp(int lvl) { throw new RuntimeException("Stub"); }
	public String className() { throw new RuntimeException("Stub"); }
	public void interrupt() { throw new RuntimeException("Stub"); }
	public int talentPointsAvailable(int tier) { throw new RuntimeException("Stub"); }
	public int pointsInTalent(Talent talent) { throw new RuntimeException("Stub"); }
	public boolean hasTalent(Talent talent) { throw new RuntimeException("Stub"); }
	public void upgradeTalent(Talent talent) { throw new RuntimeException("Stub"); }
	public java.util.ArrayList<com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob> mindVisionEnemies;
}
