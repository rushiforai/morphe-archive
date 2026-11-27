package com.shatteredpixel.shatteredpixeldungeon.actors.hero.abilities;

import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;

public abstract class ArmorAbility {
	public String name() { throw new RuntimeException("Stub"); }
	public abstract Talent[] talents();
}
