package com.shatteredpixel.shatteredpixeldungeon.scenes;

public class CellSelector {
	public static abstract class Listener {
		public abstract void onSelect(Integer cell);

		public abstract String prompt();
	}
}
