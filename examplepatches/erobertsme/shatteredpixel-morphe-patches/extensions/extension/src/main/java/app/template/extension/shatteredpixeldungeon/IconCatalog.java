package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.items.KindOfWeapon;
import com.shatteredpixel.shatteredpixeldungeon.items.weapon.Weapon;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.TalentIcon;
import com.watabou.noosa.Image;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Every icon a toolbar tag can show, by category. Each icon is a token: an Icons name, SPRITE:id for an item
 * sprite, ITEM:id for a small item icon, BUFF:id for a status icon or TALENT:name for a talent icon.
 */
final class IconCatalog {

	static final String[] CATEGORIES = { "All", "Interface", "Items", "Item Icons", "Status", "Talents" };

	private static final int[] ITEM_SPRITES = {
		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
		21, 22, 23, 24, 26, 27, 28, 32, 33, 34, 35, 36, 37, 38, 39, 48, 49, 50, 51, 52,
		53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 80, 81,
		82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 96, 97, 98, 99, 100, 101, 104, 105, 106, 107,
		108, 109, 112, 113, 114, 115, 116, 117, 120, 121, 122, 123, 124, 125, 126, 128, 129, 130, 131, 132,
		133, 134, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161,
		162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 176, 177, 178, 179, 180, 181, 182, 183, 184,
		185, 186, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 224, 225, 226, 227, 228,
		229, 230, 231, 232, 233, 234, 235, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252,
		253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 272, 273, 274, 275, 276, 277, 278, 279,
		280, 281, 282, 283, 284, 285, 286, 287, 288, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314,
		315, 317, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 336, 337, 338, 339, 340, 341,
		342, 343, 344, 345, 346, 347, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 365, 368,
		369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 384, 385, 386, 387, 388, 389, 390, 391, 392,
		393, 394, 395, 400, 401, 402, 403, 404, 405, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418,
		419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 432, 433, 434, 435, 436, 437, 438, 439,
		440, 441, 442, 443, 444, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 465, 466, 467, 468, 469,
		470, 471, 472, 473, 474, 480, 481, 482, 483, 484, 485, 486, 496, 497, 498, 499, 500, 501, 502,
	};
	private static final int[] ITEM_ICONS = {
		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 32, 33, 34, 35, 36, 37, 38, 39,
		40, 41, 42, 43, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 80, 81, 82, 83,
		84, 85, 86, 87, 88, 89, 90, 91, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107,
	};
	private static final int[] STATUS_ICONS = {
		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
		20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
		40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
		60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
		80, 81, 82, 83, 84, 85,
	};
	private static final Set<String> SKIPPED_INTERFACE = new HashSet<>(Arrays.asList(
		"LIBGDX", "ALEKS", "WATA", "PUMPKINVOLT", "CELESTI", "LUMINE", "CUBE_CODE", "PURIGRO", "ARCNOR", "ALASTAIR"));

	/**
	 * Shows the weapon your hero attacks with, or a target when unarmed.
	 */
	static final String WEAPON = "WEAPON";

	private static List<List<String>> categories;

	private IconCatalog() {
	}

	static synchronized List<String> tokens(int category) {
		if (categories == null) build();
		return categories.get(Math.max(0, Math.min(categories.size() - 1, category)));
	}

	private static void build() {
		List<String> interfaceIcons = new ArrayList<>();
		interfaceIcons.add(WEAPON);
		for (Object value : enumValues("com.shatteredpixel.shatteredpixeldungeon.ui.Icons")) {
			String name = ((Enum<?>) value).name();
			if (!SKIPPED_INTERFACE.contains(name)) interfaceIcons.add(name);
		}
		List<String> items = new ArrayList<>();
		for (int id : ITEM_SPRITES) items.add("SPRITE:" + id);
		List<String> itemIcons = new ArrayList<>();
		for (int id : ITEM_ICONS) itemIcons.add("ITEM:" + id);
		List<String> status = new ArrayList<>();
		for (int id : STATUS_ICONS) status.add("BUFF:" + id);
		List<String> talents = new ArrayList<>();
		for (Object value : enumValues("com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent")) talents.add("TALENT:" + ((Enum<?>) value).name());

		List<String> all = new ArrayList<>();
		all.addAll(interfaceIcons);
		all.addAll(items);
		all.addAll(itemIcons);
		all.addAll(status);
		all.addAll(talents);
		categories = new ArrayList<>();
		categories.add(all);
		categories.add(interfaceIcons);
		categories.add(items);
		categories.add(itemIcons);
		categories.add(status);
		categories.add(talents);
	}

	private static Object[] enumValues(String className) {
		try {
			Object[] values = Reflect.require(className).getEnumConstants();
			return values == null ? new Object[0] : values;
		} catch (Throwable e) {
			return new Object[0];
		}
	}

	/**
	 * Changes whenever the image for [token] would look different, for icons that follow the game, like your weapon.
	 */
	static String look(String token) {
		if (token.startsWith(CustomItemTags.HELD_PREFIX)) {
			Item item = CustomItemTags.held(token.substring(CustomItemTags.HELD_PREFIX.length()));
			return item == null ? token : token + ":" + System.identityHashCode(item) + ":" + item.image();
		}
		if (!token.equals(WEAPON)) return token;
		try {
			KindOfWeapon weapon = Dungeon.hero == null ? null : Dungeon.hero.belongings.attackingWeapon();
			if (weapon == null) return WEAPON + ":none";
			Object enchantment = weapon instanceof Weapon ? ((Weapon) weapon).enchantment : null;
			return WEAPON + ":" + System.identityHashCode(weapon) + ":" + weapon.image() + ":" + (enchantment == null ? "" : enchantment.getClass().getName());
		} catch (Throwable e) {
			return WEAPON;
		}
	}

	/**
	 * The image for [token], or the arrow icon when it can't be made.
	 */
	static Image image(String token) {
		try {
			if (token.equals(WEAPON)) {
				KindOfWeapon weapon = Dungeon.hero == null ? null : Dungeon.hero.belongings.attackingWeapon();
				return weapon == null ? Icons.get(Icons.TARGET) : new ItemSprite(weapon);
			}
			if (token.startsWith(CustomItemTags.HELD_PREFIX)) {
				String className = token.substring(CustomItemTags.HELD_PREFIX.length());
				Item item = CustomItemTags.held(className);
				if (item == null) item = CustomItemTags.sample(className);
				return item == null ? Icons.get(Icons.BACKPACK_LRG) : new ItemSprite(item);
			}
			if (token.startsWith(EmojiIcon.PREFIX)) {
				Image emoji = EmojiIcon.image(token.substring(EmojiIcon.PREFIX.length()));
				if (emoji != null) return emoji;
			}
			if (token.startsWith(CustomIcons.PREFIX)) {
				Image custom = CustomIcons.image(token.substring(CustomIcons.PREFIX.length()));
				if (custom != null) return custom;
			}
			if (token.startsWith("SPRITE:")) return new ItemSprite(Integer.parseInt(token.substring(7)));
			if (token.startsWith("TALENT:")) return new TalentIcon(Talent.valueOf(token.substring(7)));
			Image stat = StatIcons.fromToken(token);
			if (stat != null) return stat;
			Image icon = Icons.get(Icons.valueOf(token));
			if (icon != null) return icon;
		} catch (Throwable ignored) {
		}
		return Icons.get(Icons.ARROW);
	}
}
