package com.shatteredpixel.shatteredpixeldungeon;

public class GamesInProgress {
	public static int curSlot;

	public static com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass selectedClass;

	public static class Info {
		public long seed;
		public String customSeed;
		public boolean daily;
		public int depth;
		public int maxDepth;
		public int level;
		public int hp;
		public int ht;
		public com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass heroClass;
	}

	public static int firstEmpty() { throw new RuntimeException("Stub"); }

	public static String gameFolder(int slot) { throw new RuntimeException("Stub"); }
	public static String gameFile(int slot) { throw new RuntimeException("Stub"); }
	public static String depthFile(int slot, int depth, int branch) { throw new RuntimeException("Stub"); }
	public static void setUnknown(int slot) { throw new RuntimeException("Stub"); }
	public static Info check(int slot) { throw new RuntimeException("Stub"); }
}
