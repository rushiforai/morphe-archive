package com.shatteredpixel.shatteredpixeldungeon.scenes;

public class InterlevelScene extends PixelScene {
	public enum Mode { DESCEND, ASCEND, CONTINUE, RESURRECT, RETURN, FALL, RESET, NONE }

	public static Mode mode;
	public static int returnDepth;
	public static int returnBranch;
	public static int returnPos;
}
