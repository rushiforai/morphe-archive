package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.watabou.noosa.Image;

/**
 * Small icons for stats, taken from the game's item and status icon sheets.
 */
final class StatIcons {

	private static final String ITEM_ICONS = "sprites/item_icons.png";

	static final int RING_ACCURACY = 0;
	static final int RING_ARCANA = 1;
	static final int RING_ELEMENTS = 2;
	static final int RING_ENERGY = 3;
	static final int RING_EVASION = 4;
	static final int RING_FORCE = 5;
	static final int RING_FUROR = 6;
	static final int RING_HASTE = 7;
	static final int RING_MIGHT = 8;
	static final int RING_SHARPSHOOTING = 9;
	static final int RING_TENACITY = 10;
	static final int RING_WEALTH = 11;
	static final int SCROLL_UPGRADE = 32;
	static final int SCROLL_IDENTIFY = 33;
	static final int POTION_STRENGTH = 80;
	static final int POTION_HEALING = 81;
	static final int POTION_MINDVIS = 82;
	static final int POTION_EXP = 91;
	static final int POTION_SHIELDING = 97;

	static final int BUFF_MIND_VISION = 0;
	static final int BUFF_LEVITATION = 1;
	static final int BUFF_FIRE = 2;
	static final int BUFF_PARALYSIS = 4;
	static final int BUFF_TIME = 7;
	static final int BUFF_COMBO = 17;
	static final int BUFF_OOZE = 8;
	static final int BUFF_TERROR = 10;
	static final int BUFF_ROOTS = 11;
	static final int BUFF_FROST = 15;
	static final int BUFF_ARMOR = 20;
	static final int BUFF_HEART = 21;
	static final int BUFF_BARKSKIN = 24;
	static final int BUFF_IMMUNITY = 25;
	static final int BUFF_DROWSY = 29;
	static final int BUFF_RECHARGING = 34;
	static final int BUFF_CORRUPT = 36;
	static final int BUFF_BERSERK = 40;
	static final int BUFF_HEALING = 44;
	static final int BUFF_TARGETED = 54;
	static final int BUFF_INVISIBLE = 12;
	static final int BUFF_LIGHT = 22;
	static final int BUFF_FORESIGHT = 32;

	static final String HEALTH = "ITEM:" + POTION_HEALING;

	private StatIcons() {
	}

	static Image item(int id) {
		try {
			Image image = new Image(ITEM_ICONS);
			image.frame(ItemSpriteSheet.Icons.film.get(id));
			return image;
		} catch (Throwable e) {
			return null;
		}
	}

	static Image buff(int id) {
		try {
			return new BuffIcon(id, false);
		} catch (Throwable e) {
			return null;
		}
	}

	static Image largeBuff(int id) {
		try {
			return new BuffIcon(id, true);
		} catch (Throwable e) {
			return null;
		}
	}

	static final int SCROLL_PASSAGE = 53;
	static final int POTION_HASTE = 86;

	/**
	 * The game's arrow icon, pointing left when [left] is true.
	 */
	static Image arrow(boolean left) {
		Image image = Icons.get(Icons.ARROW);
		if (left) {
			image.origin.set(image.width() / 2f, image.height() / 2f);
			image.angle = 180;
		}
		return image;
	}

	static Image icon(Icons icon) {
		try {
			return Icons.get(icon);
		} catch (Throwable e) {
			return null;
		}
	}

	/**
	 * An icon from a token: ITEM:id for an item icon, BUFF:id for a status icon.
	 */
	static Image fromToken(String token) {
		try {
			if (token.startsWith("ITEM:")) return item(Integer.parseInt(token.substring(5)));
			if (token.startsWith("BUFF:")) return largeBuff(Integer.parseInt(token.substring(5)));
		} catch (Throwable ignored) {
		}
		return null;
	}
}
