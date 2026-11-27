package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;
import com.shatteredpixel.shatteredpixeldungeon.items.EquipableItem;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.armor.Armor;
import com.shatteredpixel.shatteredpixeldungeon.items.bags.Bag;
import com.shatteredpixel.shatteredpixeldungeon.items.rings.Ring;
import com.shatteredpixel.shatteredpixeldungeon.items.wands.Wand;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.Weapon;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.missiles.MissileWeapon;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.watabou.noosa.Image;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Everything a save's preview shows about the hero, copied as plain values when the save is made and kept with it: class, level, health,
 * experience, statuses, talents and belongings, with the names and descriptions their details show. Showing a save never rebuilds the hero.
 */
final class HeroCard {

	static final int NO_COLOR = -1;
	private static final int DEGRADED = 0xFF4444;
	private static final int UPGRADED = 0x44FF44;
	private static final int WARNING = 0xFF8800;
	private static final int ENHANCED = 0x3399FF;
	private static final int MASTERED = 0xFFFF44;
	private static final int CURSE_INFUSED = 0x8800FF;
	private static final int BUFF_NONE = 127;
	static final int SLOT_NONE = 0;
	static final int SLOT_PLAIN = 1;
	static final int SLOT_CURSED = 2;
	static final int SLOT_UNCURSED = 3;
	static final int SLOT_UNKNOWN = 4;

	String heroClass = "";
	String title = "";
	int tier;
	int level;
	int hp;
	int ht;
	int shield;
	int exp;
	int maxExp;
	final List<Status> statuses = new ArrayList<>();
	final List<List<TalentEntry>> talents = new ArrayList<>();
	final List<Thing> belongings = new ArrayList<>();

	/**
	 * A status icon: the buff sheet's [icon], tinted by [red], [green] and [blue] when [tinted], greyed from the top by [fade] of its height.
	 */
	static final class Status {
		int icon;
		float fade;
		boolean tinted;
		float red;
		float green;
		float blue;
		String name = "";
		String description = "";
	}

	static final class TalentEntry {
		int icon;
		int points;
		int maxPoints;
		String name = "";
		String description = "";
	}

	/**
	 * An item as its slot shows it: the sprite, its glow, the texts in its corners and their colors, its item icon, or -1, and its
	 * background: whether it is worn, and one of the SLOT kinds for what is known about it.
	 */
	static final class Thing {
		int image;
		boolean equipped;
		int slot = SLOT_PLAIN;
		int glow = NO_COLOR;
		float glowPeriod;
		String status = "";
		int statusColor = NO_COLOR;
		int icon = -1;
		String extra = "";
		int extraColor = NO_COLOR;
		String level = "";
		int levelColor = NO_COLOR;
		String name = "";
		String info = "";
	}

	/**
	 * The card of the hero as they are now. Read in a game, on the render thread.
	 */
	static HeroCard of(Hero hero) {
		HeroCard card = new HeroCard();
		try {
			card.heroClass = hero.heroClass.name();
			card.title = text(hero.className());
			card.tier = hero.tier();
			card.level = hero.lvl;
			card.hp = hero.HP;
			card.ht = hero.HT;
			card.shield = hero.shielding();
			card.exp = hero.exp;
			card.maxExp = hero.maxExp();
			for (Buff buff : hero.buffs()) addStatus(card, buff);
			for (LinkedHashMap<Talent, Integer> tier : hero.talents) {
				List<TalentEntry> entries = new ArrayList<>();
				for (Map.Entry<Talent, Integer> entry : tier.entrySet()) entries.add(talent(entry.getKey(), entry.getValue()));
				card.talents.add(entries);
			}
			for (Item item : belongings(hero)) {
				Thing thing = thing(item, hero);
				thing.equipped = worn(item, hero);
				card.belongings.add(thing);
			}
		} catch (Throwable e) {
			Log.e("HeroCard", "Could not copy the hero", e);
		}
		return card;
	}

/**
	 * Everything the hero carried: equipped items first, then the backpack, then the contents of each bag.
	 */
	private static List<Item> belongings(Hero hero) {
		List<Item> items = new ArrayList<>();
		if (hero.belongings == null) return items;
		for (Item worn : new Item[] { hero.belongings.weapon, hero.belongings.armor, hero.belongings.artifact, hero.belongings.misc, hero.belongings.ring, hero.belongings.secondWep }) {
			if (worn != null) items.add(worn);
		}
		if (hero.belongings.backpack == null) return items;
		List<Bag> bags = new ArrayList<>();
		for (Item item : hero.belongings.backpack.items) {
			items.add(item);
			if (item instanceof Bag) bags.add((Bag) item);
		}
		for (Bag bag : bags) items.addAll(bag.items);
		return items;
	}

	private static void addStatus(HeroCard card, Buff buff) {
		try {
			int icon = buff.icon();
			if (icon == BUFF_NONE) return;
			Status status = new Status();
			status.icon = icon;
			status.fade = Math.max(0, Math.min(1, buff.iconFadePercent()));
			Image probe = new Image();
			buff.tintIcon(probe);
			status.red = probe.rm;
			status.green = probe.gm;
			status.blue = probe.bm;
			status.tinted = probe.rm != 1 || probe.gm != 1 || probe.bm != 1;
			status.name = text(buff.name());
			status.description = text(buff.desc());
			card.statuses.add(status);
		} catch (Throwable e) {
			Log.e("HeroCard", "Could not copy a status", e);
		}
	}

	private static TalentEntry talent(Talent talent, int points) {
		TalentEntry entry = new TalentEntry();
		entry.icon = talent.icon();
		entry.points = points;
		entry.maxPoints = talent.maxPoints();
		entry.name = text(talent.title());
		entry.description = text(talent.desc(false));
		return entry;
	}

	/**
	 * [item] as the game's item slot shows it, worked out the same way.
	 */
	private static Thing thing(Item item, Hero hero) {
		Thing thing = new Thing();
		thing.image = item.image();
		ItemSprite.Glowing glowing = item.glowing();
		if (glowing != null) {
			thing.glow = glowing.color;
			thing.glowPeriod = glowing.period;
		}
		thing.status = text(item.status());
		if (item instanceof MissileWeapon && ((MissileWeapon) item).durabilityLeft() <= 50f
			&& ((MissileWeapon) item).durabilityLeft() <= ((MissileWeapon) item).durabilityPerUse()) {
			thing.statusColor = WARNING;
		}
		if (item.icon != -1 && (item.isIdentified() || item instanceof Ring && ((Ring) item).isKnown())) {
			thing.icon = item.icon;
		} else if (item instanceof Weapon || item instanceof Armor) {
			boolean weapon = item instanceof Weapon;
			if (item.levelKnown) {
				int strength = weapon ? ((Weapon) item).STRReq() : ((Armor) item).STRReq();
				thing.extra = ":" + strength;
				boolean mastered = weapon ? ((Weapon) item).masteryPotionBonus : ((Armor) item).masteryPotionBonus;
				thing.extraColor = strength > hero.STR() ? DEGRADED : mastered ? MASTERED : NO_COLOR;
			} else {
				thing.extra = (weapon ? ((Weapon) item).STRReq(0) : ((Armor) item).STRReq(0)) + "?";
				thing.extraColor = WARNING;
			}
		}
		int trueLevel = item.visiblyUpgraded();
		int buffedLevel = item.buffedVisiblyUpgraded();
		if (trueLevel != 0 || buffedLevel != 0) {
			thing.level = (buffedLevel > 0 ? "+" : "") + buffedLevel;
			if (trueLevel == buffedLevel || buffedLevel <= 0) {
				boolean infused = item instanceof Weapon && ((Weapon) item).curseInfusionBonus || item instanceof Armor && ((Armor) item).curseInfusionBonus
					|| item instanceof Wand && ((Wand) item).curseInfusionBonus;
				thing.levelColor = buffedLevel > 0 ? (infused ? CURSE_INFUSED : UPGRADED) : DEGRADED;
			} else {
				thing.levelColor = buffedLevel > trueLevel ? ENHANCED : WARNING;
			}
		}
		thing.slot = slot(item);
		thing.name = text(item.title());
		thing.info = text(item.info());
		return thing;
	}

	/**
	 * Whether [item] is worn, checked the way the game's inventory does.
	 */
	private static boolean worn(Item item, Hero hero) {
		if (item.isEquipped(hero)) return true;
		for (Item worn : new Item[] { hero.belongings.weapon, hero.belongings.armor, hero.belongings.artifact, hero.belongings.misc, hero.belongings.ring, hero.belongings.secondWep }) {
			if (item == worn) return true;
		}
		return false;
	}

	private static int slot(Item item) {
		if (item instanceof Bag) return SLOT_NONE;
		if (item.cursed && item.cursedKnown) return SLOT_CURSED;
		if (item.isIdentified()) return SLOT_PLAIN;
		return (item instanceof EquipableItem || item instanceof Wand) && item.cursedKnown ? SLOT_UNCURSED : SLOT_UNKNOWN;
	}

	private static String text(String value) {
		return value == null ? "" : value;
	}

	void write(DataOutputStream out) throws IOException {
		out.writeUTF(heroClass);
		out.writeUTF(title);
		out.writeInt(tier);
		out.writeInt(level);
		out.writeInt(hp);
		out.writeInt(ht);
		out.writeInt(shield);
		out.writeInt(exp);
		out.writeInt(maxExp);
		out.writeInt(statuses.size());
		for (Status status : statuses) {
			out.writeInt(status.icon);
			out.writeFloat(status.fade);
			out.writeBoolean(status.tinted);
			out.writeFloat(status.red);
			out.writeFloat(status.green);
			out.writeFloat(status.blue);
			out.writeUTF(status.name);
			out.writeUTF(status.description);
		}
		out.writeInt(talents.size());
		for (List<TalentEntry> tier : talents) {
			out.writeInt(tier.size());
			for (TalentEntry entry : tier) {
				out.writeInt(entry.icon);
				out.writeInt(entry.points);
				out.writeInt(entry.maxPoints);
				out.writeUTF(entry.name);
				out.writeUTF(entry.description);
			}
		}
		out.writeInt(belongings.size());
		for (Thing thing : belongings) {
			out.writeInt(thing.image);
			out.writeBoolean(thing.equipped);
			out.writeInt(thing.slot);
			out.writeInt(thing.glow);
			out.writeFloat(thing.glowPeriod);
			out.writeUTF(thing.status);
			out.writeInt(thing.statusColor);
			out.writeInt(thing.icon);
			out.writeUTF(thing.extra);
			out.writeInt(thing.extraColor);
			out.writeUTF(thing.level);
			out.writeInt(thing.levelColor);
			out.writeUTF(thing.name);
			out.writeUTF(thing.info);
		}
	}

	/**
	 * Reads a card written by [write] in the preview's [format]; cards before format 6 have no slot backgrounds.
	 */
	static HeroCard read(DataInputStream in, int format) throws IOException {
		HeroCard card = new HeroCard();
		card.heroClass = in.readUTF();
		card.title = in.readUTF();
		card.tier = in.readInt();
		card.level = in.readInt();
		card.hp = in.readInt();
		card.ht = in.readInt();
		card.shield = in.readInt();
		card.exp = in.readInt();
		card.maxExp = in.readInt();
		for (int i = in.readInt(); i > 0; i--) {
			Status status = new Status();
			status.icon = in.readInt();
			status.fade = in.readFloat();
			status.tinted = in.readBoolean();
			status.red = in.readFloat();
			status.green = in.readFloat();
			status.blue = in.readFloat();
			status.name = in.readUTF();
			status.description = in.readUTF();
			card.statuses.add(status);
		}
		for (int i = in.readInt(); i > 0; i--) {
			List<TalentEntry> tier = new ArrayList<>();
			for (int j = in.readInt(); j > 0; j--) {
				TalentEntry entry = new TalentEntry();
				entry.icon = in.readInt();
				entry.points = in.readInt();
				entry.maxPoints = in.readInt();
				entry.name = in.readUTF();
				entry.description = in.readUTF();
				tier.add(entry);
			}
			card.talents.add(tier);
		}
		for (int i = in.readInt(); i > 0; i--) {
			Thing thing = new Thing();
			thing.image = in.readInt();
			if (format >= 6) {
				thing.equipped = in.readBoolean();
				thing.slot = in.readInt();
			}
			thing.glow = in.readInt();
			thing.glowPeriod = in.readFloat();
			thing.status = in.readUTF();
			thing.statusColor = in.readInt();
			thing.icon = in.readInt();
			thing.extra = in.readUTF();
			thing.extraColor = in.readInt();
			thing.level = in.readUTF();
			thing.levelColor = in.readInt();
			thing.name = in.readUTF();
			thing.info = in.readUTF();
			card.belongings.add(thing);
		}
		return card;
	}
}
