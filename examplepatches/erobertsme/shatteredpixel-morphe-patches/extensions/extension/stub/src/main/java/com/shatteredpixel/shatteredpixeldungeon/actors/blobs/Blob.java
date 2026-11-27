package com.shatteredpixel.shatteredpixeldungeon.actors.blobs;

import com.shatteredpixel.shatteredpixeldungeon.levels.Level;

public class Blob {
	public int[] cur;
	public int volume;
	public boolean alwaysVisible;

	public void clear(int cell) { throw new RuntimeException("Stub"); }
	public void fullyClear() { throw new RuntimeException("Stub"); }
	public String tileDesc() { throw new RuntimeException("Stub"); }
	public static <T extends Blob> T seed(int cell, int amount, Class<T> type, Level level) { throw new RuntimeException("Stub"); }
}
