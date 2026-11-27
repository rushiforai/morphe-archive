package com.shatteredpixel.shatteredpixeldungeon.windows;

import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.npcs.Shopkeeper;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;

public class WndTradeItem extends WndInfoItem {
	public WndTradeItem(Item item, WndBag owner) { super(item); }
	public static void sell(Item item, Shopkeeper shop) { throw new RuntimeException("Stub"); }
	public static void sellOne(Item item, Shopkeeper shop) { throw new RuntimeException("Stub"); }
}
