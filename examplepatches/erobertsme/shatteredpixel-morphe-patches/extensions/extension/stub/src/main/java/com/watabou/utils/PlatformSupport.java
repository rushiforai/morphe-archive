package com.watabou.utils;

public abstract class PlatformSupport {
	public static final int INSET_BLK = 1;
	public static final int INSET_LRG = 2;
	public static final int INSET_ALL = 3;

	public RectF getSafeInsets(int level) { throw new RuntimeException("Stub"); }
}
