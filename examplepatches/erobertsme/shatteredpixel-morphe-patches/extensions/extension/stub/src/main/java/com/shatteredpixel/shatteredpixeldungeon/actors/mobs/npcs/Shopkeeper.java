package com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs;

import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;

public class Shopkeeper extends Mob {
	public static int MAX_BUYBACK_HISTORY;
	public java.util.ArrayList<Item> buybackItems;

	public String chatText() { throw new RuntimeException("Stub"); }
	public static com.shatteredpixel.shatteredpixeldungeon.windows.WndBag sell() { throw new RuntimeException("Stub"); }

	public static int sellPrice(Item item) { throw new RuntimeException("Stub"); }
}
