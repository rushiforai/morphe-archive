package com.shatteredpixel.shatteredpixeldungeon.actors.hero;

import com.shatteredpixel.shatteredpixeldungeon.actors.Char;

public class HeroAction {
	public int dst;

	public static class Attack extends HeroAction {
		public Char target;

		public Attack(Char target) { throw new RuntimeException("Stub"); }
	}
}
