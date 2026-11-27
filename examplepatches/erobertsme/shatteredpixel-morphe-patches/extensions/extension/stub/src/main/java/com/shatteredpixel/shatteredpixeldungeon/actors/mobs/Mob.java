package com.shatteredpixel.shatteredpixeldungeon.actors.mobs;

import com.shatteredpixel.shatteredpixeldungeon.actors.Char;

public class Mob extends Char {
	public static void clearHeldAllies() { throw new RuntimeException("Stub"); }
	public Class<? extends com.shatteredpixel.shatteredpixeldungeon.sprites.CharSprite> spriteClass;
	public interface AiState {
	}

	public final boolean surprisedBy(com.shatteredpixel.shatteredpixeldungeon.actors.Char attacker) { throw new RuntimeException("Stub"); }
	public AiState SLEEPING;
	public AiState HUNTING;
	public AiState WANDERING;
	public AiState FLEEING;
	public AiState PASSIVE;
	public AiState state;
	public int EXP;
	public int defenseSkill;
	public int maxLvl;
	public float attackDelay() { throw new RuntimeException("Stub"); }

	public com.shatteredpixel.shatteredpixeldungeon.sprites.CharSprite sprite() { throw new RuntimeException("Stub"); }
	public boolean heroShouldInteract() { throw new RuntimeException("Stub"); }
	public void clearEnemy() { throw new RuntimeException("Stub"); }
	public String description() { throw new RuntimeException("Stub"); }
	public void yell(String str) { throw new RuntimeException("Stub"); }
}
