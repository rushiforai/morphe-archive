package com.shatteredpixel.shatteredpixeldungeon.levels.traps;

public class Trap {
	public int pos;
	public boolean visible;
	public boolean active;
	public boolean canBeHidden;

	public Trap reveal() { throw new RuntimeException("Stub"); }
	public Trap hide() { throw new RuntimeException("Stub"); }
	public void trigger() { throw new RuntimeException("Stub"); }
	public String name() { throw new RuntimeException("Stub"); }
	public String desc() { throw new RuntimeException("Stub"); }
}
