package com.shatteredpixel.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;

public class Dungeon {
	public static Hero hero;
	public static Level level;
	public static int gold;
	public static int depth;
	public static int branch;
	public static long seed;
	public static String customSeedText;
	public static boolean daily;
	public static boolean dailyReplay;
	public static void deleteGame(int save, boolean deleteLevels) { throw new RuntimeException("Stub"); }
	public static QuickSlot quickslot;

	public static void saveAll() throws java.io.IOException { throw new RuntimeException("Stub"); }

	public static boolean[] findPassable(com.shatteredpixel.shatteredpixeldungeon.actors.Char ch, boolean[] pass, boolean[] vis, boolean chars) { throw new RuntimeException("Stub"); }
	public static com.watabou.utils.PathFinder.Path findPath(com.shatteredpixel.shatteredpixeldungeon.actors.Char ch, int to, boolean[] pass, boolean[] vis, boolean chars) { throw new RuntimeException("Stub"); }
	public static boolean bossLevel() { throw new RuntimeException("Stub"); }
	public static int scalingDepth() { throw new RuntimeException("Stub"); }
	public static void observe() { throw new RuntimeException("Stub"); }
	public static int energy;
	public static void loadGame(int save) throws java.io.IOException { throw new RuntimeException("Stub"); }
	public static Level loadLevel(int save) throws java.io.IOException { throw new RuntimeException("Stub"); }
	public static void switchLevel(Level level, int pos) { throw new RuntimeException("Stub"); }
	public static boolean levelHasBeenGenerated(int depth, int branch) { throw new RuntimeException("Stub"); }
}
