package com.shatteredpixel.shatteredpixeldungeon.actors.buffs;

import com.shatteredpixel.shatteredpixeldungeon.actors.Char;

public class Buff {
	public enum buffType { POSITIVE, NEGATIVE, NEUTRAL }

	public buffType type;

	public int icon() { throw new RuntimeException("Stub"); }
	public String name() { throw new RuntimeException("Stub"); }
	public String desc() { throw new RuntimeException("Stub"); }
	public String iconTextDisplay() { throw new RuntimeException("Stub"); }
	public void detach() { throw new RuntimeException("Stub"); }
	public Char target;
	public static <T extends Buff> T affect(Char target, Class<T> buffClass) { throw new RuntimeException("Stub"); }
	public static <T extends FlavourBuff> T affect(Char target, Class<T> buffClass, float duration) { throw new RuntimeException("Stub"); }
	public void tintIcon(com.watabou.noosa.Image icon) { throw new RuntimeException("Stub"); }
	public float iconFadePercent() { throw new RuntimeException("Stub"); }
	public float visualcooldown() { throw new RuntimeException("Stub"); }
}
