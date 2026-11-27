package com.shatteredpixel.shatteredpixeldungeon.items;

import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;

import java.util.LinkedList;

public class Heap {
	public enum Type { HEAP, FOR_SALE, CHEST, LOCKED_CHEST, CRYSTAL_CHEST, TOMB, SKELETON, REMAINS }

	public Type type;
	public int pos;
	public boolean seen;
	public ItemSprite sprite;
	public LinkedList<Item> items;

	public void destroy() { throw new RuntimeException("Stub"); }
	public Item pickUp() { throw new RuntimeException("Stub"); }
	public Item peek() { throw new RuntimeException("Stub"); }
	public int size() { throw new RuntimeException("Stub"); }
	public int image() { throw new RuntimeException("Stub"); }
	public boolean isEmpty() { throw new RuntimeException("Stub"); }
	public String title() { throw new RuntimeException("Stub"); }
}
