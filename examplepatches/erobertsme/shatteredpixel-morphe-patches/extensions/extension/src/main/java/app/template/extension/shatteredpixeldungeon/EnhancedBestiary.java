package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.journal.Bestiary;
import com.shatteredpixel.shatteredpixeldungeon.messages.Messages;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.utils.Random;

import java.lang.reflect.Field;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * The Enhanced Bestiary: a Stats button and an [i] button with abilities on creature info windows, both when
 * examining a creature and in the bestiary.
 */
@SuppressWarnings("unused")
public final class EnhancedBestiary {

	private static final String TAG = "EnhancedBestiary";
	private static final String MOB_PREFIX = "com.shatteredpixel.shatteredpixeldungeon.";
	private static final int SAMPLES = 400;
	private static final Map<String, String> NOTES = new HashMap<>();
	private static Map<String, Class<?>> bestiaryTitles;

	static {
		NOTES.put("Rat", "No special abilities.");
		NOTES.put("Albino", "A rare white rat. Its bites can make you bleed.");
		NOTES.put("Snake", "Very hard to hit, but has little health. Surprise attacks and magic are the best way to hit it.");
		NOTES.put("Gnoll", "No special abilities.");
		NOTES.put("Swarm", "Splits in two when it takes damage and there's room nearby, sharing its remaining health with the copy. Flies.");
		NOTES.put("Crab", "Moves twice as fast as you.");
		NOTES.put("HermitCrab", "A rarer crab with heavier armor. Moves at normal speed.");
		NOTES.put("Slime", "Big hits are softened: damage above a few points is greatly reduced, so many small hits work better than one large one.");
		NOTES.put("CausticSlime", "Like a slime, but its attacks cover you in caustic ooze, which burns until you wash it off in water.");
		NOTES.put("FetidRat", "A ghost quest miniboss. Its attacks cover you in caustic ooze and it gives off a cloud of stench gas.");
		NOTES.put("GnollTrickster", "A ghost quest miniboss. Keeps its distance and throws darts that poison you from up to {V} tiles away, as long as nothing blocks the shot. Hitting you again while you're poisoned can set you on fire.");
		NOTES.put("GreatCrab", "A ghost quest miniboss. Blocks every melee and thrown attack it can see coming. Surprise it, or use wands or magic, to hurt it.");
		NOTES.put("Goo", "Sewers boss. Every few turns it pumps itself up and then unleashes a huge attack that reaches 2 tiles, so step further away when it glows. Heals while standing in water and fights harder at low health.");
		NOTES.put("Skeleton", "Bursts into bone shrapnel when it dies, hurting everything next to it. Armor reduces the shrapnel damage.");
		NOTES.put("Thief", "Steals an item and runs away. Defeat it to get the item back.");
		NOTES.put("Bandit", "A crazed thief. Steals an item and runs, and its attacks can blind, poison and cripple you.");
		NOTES.put("DM100", "Shoots lightning at you from up to {V} tiles away, as long as nothing blocks the shot. Water spreads the shock.");
		NOTES.put("Guard", "Throws a chain at you from up to 4 tiles away to pull you next to it. Only does this once.");
		NOTES.put("Necromancer", "Raises a skeleton to fight for it once you're within 4 tiles, and can pull the skeleton to its side. Keeps its distance.");
		NOTES.put("SpectralNecromancer", "Raises wraiths to fight for it instead of skeletons. Keeps its distance.");
		NOTES.put("Necromancer$NecroSkeleton", "Raised by a necromancer. Bursts into bone shrapnel when it dies.");
		NOTES.put("Tengu", "Prison boss. Throws shurikens from up to {V} tiles away, as long as nothing blocks the shot and teleports away when hurt. In the second phase it fills the arena with bombs, fire and shocking traps.");
		NOTES.put("Bat", "Flies and moves fast. Heals itself with each bite and darts away after attacking.");
		NOTES.put("Brute", "When it would die it flies into a rage: it keeps fighting behind a shield that drains away each turn.");
		NOTES.put("ArmoredBrute", "An armored brute. Its rage shield drains more slowly, so it fights on longer.");
		NOTES.put("Shaman$RedShaman", "Fires magic bolts from up to {V} tiles away, as long as nothing blocks the shot that make you weak.");
		NOTES.put("Shaman$BlueShaman", "Fires magic bolts from up to {V} tiles away, as long as nothing blocks the shot that make you vulnerable, so you take more damage.");
		NOTES.put("Shaman$PurpleShaman", "Fires magic bolts from up to {V} tiles away, as long as nothing blocks the shot that hex you, lowering your accuracy and evasion.");
		NOTES.put("Spinner", "Shoots webs that stick you in place from up to {V} tiles away, and its bite poisons. Backs off after biting.");
		NOTES.put("DM200", "Large. Vents toxic gas at you from up to {V} tiles away.");
		NOTES.put("DM201", "Large. Lobs caustic gas canisters at you from up to {V} tiles away.");
		NOTES.put("Ghoul", "Travels in pairs. When one falls next to its partner it gets back up after a few turns, unless the other one is also defeated.");
		NOTES.put("Elemental$FireElemental", "Flies. Its attacks set you on fire, and every few turns it can launch fire from up to {V} tiles away, as long as nothing blocks the shot. Fiery.");
		NOTES.put("Elemental$FrostElemental", "Flies. Its attacks chill or freeze you, and every few turns it can strike from up to {V} tiles away, as long as nothing blocks the shot. Icy.");
		NOTES.put("Elemental$ShockElemental", "Flies. Its attacks shock you and anything near you. Electric.");
		NOTES.put("Elemental$ChaosElemental", "Flies. Its attacks cause random effects like a cursed wand.");
		NOTES.put("Elemental$NewbornFireElemental", "A Wandmaker quest miniboss. Takes a moment to charge an area attack of fire, so move out of the marked tiles.");
		NOTES.put("Elemental$AllyNewBornElemental", "A friendly fire elemental that fights for you.");
		NOTES.put("Monk", "Attacks quickly. Builds up focus over time and parries the next attack while focused.");
		NOTES.put("Senior", "A stronger monk with heavier hits and the same parrying focus.");
		NOTES.put("Warlock", "Fires shadow bolts from up to {V} tiles away, as long as nothing blocks the shot that degrade your equipment, lowering its level for a while.");
		NOTES.put("Golem", "Large and very tough. Teleports you next to it from up to {V} tiles away.");
		NOTES.put("DM300", "Caves boss. Vents toxic gas, causes rockfalls and gets supercharged by power pylons, digging through walls while charged.");
		NOTES.put("Pylon", "Powers DM-300. Immune to most effects; destroy it to stop the supercharge.");
		NOTES.put("Succubus", "Its attacks charm you. Blinks next to you when you're 3 to {V} tiles away, and heals itself with a shield when it hits a charmed target.");
		NOTES.put("Eye", "Flies. Charges up a disintegration beam that it fires at you from up to {V} tiles away, hitting everything in a line, so step out of its line of sight when it starts glowing.");
		NOTES.put("Scorpio", "Stings you from up to {V} tiles away, as long as nothing blocks the shot, crippling you. Prefers to keep its distance.");
		NOTES.put("Acidic", "An acidic scorpio. Its stings and anything hitting it in melee spread caustic ooze. Acidic.");
		NOTES.put("RipperDemon", "Leaps at you from 3 to {V} tiles away, making you bleed when it lands.");
		NOTES.put("DemonSpawner", "Doesn't move. Keeps spawning ripper demons until it's destroyed.");
		NOTES.put("DwarfKing", "City boss. Summons ghouls, monks and golems, and drains life from his minions. Becomes much stronger in his final phase.");
		NOTES.put("DwarfKing$DKGhoul", "Summoned by the Dwarf King. Behaves like a ghoul.");
		NOTES.put("DwarfKing$DKMonk", "Summoned by the Dwarf King. Behaves like a monk.");
		NOTES.put("DwarfKing$DKGolem", "Summoned by the Dwarf King. Behaves like a golem.");
		NOTES.put("DwarfKing$DKWarlock", "Summoned by the Dwarf King. Behaves like a warlock.");
		NOTES.put("YogDzewa", "The final boss. Can't be harmed while its fists are alive, and summons larvae and demons. Its gaze fires beams that sweep the arena.");
		NOTES.put("YogDzewa$Larva", "Summoned by Yog-Dzewa. Weak but numerous.");
		NOTES.put("YogDzewa$YogRipper", "Summoned by Yog-Dzewa. Leaps at you like a ripper demon.");
		NOTES.put("YogDzewa$YogEye", "Summoned by Yog-Dzewa. Fires a disintegration beam like an evil eye.");
		NOTES.put("YogDzewa$YogScorpio", "Summoned by Yog-Dzewa. Crippling ranged stings like a scorpio.");
		NOTES.put("YogFist$BurningFist", "Sets the ground around it on fire and its attacks burn you. Water stops the fire spreading.");
		NOTES.put("YogFist$SoiledFist", "Grows grass around itself and is protected while standing in grass, and its attacks can root you. Burn the grass away.");
		NOTES.put("YogFist$RottingFist", "Gives off toxic gas, heals while standing in water, and its attacks cover you in caustic ooze.");
		NOTES.put("YogFist$RustedFist", "Very tough. Damage to it is delayed and taken a little at a time, and its attacks cripple you.");
		NOTES.put("YogFist$BrightFist", "Fires beams of light that blind you, and teleports away in a blinding flash when badly hurt.");
		NOTES.put("YogFist$DarkFist", "Fires bolts of darkness that snuff out your light, and teleports away when badly hurt.");
		NOTES.put("Mimic", "Pretends to be a chest. Attacks when you get close or try to open it, and is harder to hit at first.");
		NOTES.put("GoldenMimic", "A stronger mimic that pretends to be a golden chest.");
		NOTES.put("CrystalMimic", "Pretends to be a crystal chest. When revealed it steals an item and runs off.");
		NOTES.put("EbonyMimic", "Almost impossible to spot, and hits hard when it reveals itself.");
		NOTES.put("Statue", "A living statue carrying a real weapon, with that weapon's enchantment. Drops the weapon when defeated.");
		NOTES.put("ArmoredStatue", "A living statue with a real weapon and armor, both with their enchantment and glyph. Drops both when defeated.");
		NOTES.put("Wraith", "Flies. Appears from cursed objects and graves.");
		NOTES.put("TormentedSpirit", "A cursed spirit. Defeating it with a cleansing effect frees it and earns a reward.");
		NOTES.put("Bee", "Flies. Guards its honeypot and attacks anything within 3 tiles of it.");
		NOTES.put("Piranha", "Only lives in water and dies on land. Very fast and immune to most status effects.");
		NOTES.put("PhantomPiranha", "A ghostly piranha. Takes half damage and teleports to other water when hurt.");
		NOTES.put("CrystalWisp", "Flies. Shoots beams of light from up to {V} tiles away, as long as nothing blocks the shot.");
		NOTES.put("CrystalGuardian", "A blacksmith quest miniboss. Very tough, recovers when it sleeps, and smashes through crystal.");
		NOTES.put("CrystalSpire", "A blacksmith quest boss. Doesn't move, and calls crystal guardians when hit. Breaking it ends the quest.");
		NOTES.put("GnollGuard", "A blacksmith quest enemy. Hits hard with a spear that reaches two tiles, and is protected by a nearby sapper.");
		NOTES.put("GnollSapper", "A blacksmith quest miniboss. Throws rocks and calls in rockfalls when you're within 3 tiles, and shields its guard.");
		NOTES.put("GnollGeomancer", "A blacksmith quest boss. Hides in a boulder, then hurls rocks and causes rockfalls and earthquakes.");
		NOTES.put("GnollExile", "A peaceful gnoll that won't fight unless you attack it.");
		NOTES.put("FungalSentry", "A blacksmith quest miniboss. Doesn't move, and shoots poison spores at you from up to {V} tiles away, as long as nothing blocks the shot.");
		NOTES.put("FungalSpinner", "Shoots clumps of fungus that grow into thick plant growth around you, and its bite poisons.");
		NOTES.put("FungalCore", "A blacksmith quest boss. Doesn't move, and is guarded by sentries and spinners.");
		NOTES.put("RotHeart", "Doesn't move. Releases toxic gas when hit.");
		NOTES.put("RotLasher", "Doesn't move. Lashes and cripples anything next to it.");
		NOTES.put("TransmogRat", "A creature turned into a rat by Ratmogrify. Fights for you.");
		NOTES.put("WandOfRegrowth$Lotus", "Grown by a Wand of Regrowth. Covers every tile within its range with falling leaves and helps plants drop more seeds and dew. Can't be harmed and fades over time.");
		NOTES.put("WandOfWarding$Ward", "A ward placed by a Wand of Warding. Zaps nearby enemies, growing stronger each time you add to it.");
		NOTES.put("WandOfWarding$Ward$WardSentry", "A fully grown ward. Zaps nearby enemies with strong bolts.");
		NOTES.put("WandOfLivingEarth$EarthGuardian", "Summoned by a Wand of Living Earth. Takes hits for you and heals over time.");
		NOTES.put("DriedRose$GhostHero", "The Sad Ghost, summoned by the Dried Rose. Uses the weapon and armor you give it.");
		NOTES.put("CorpseDust$DustWraith", "Released by corpse dust. Keeps appearing until the dust is used.");
		NOTES.put("SentryRoom$Sentry", "Watches its room and shoots anything it sees moving there.");
		NOTES.put("GuardianTrap$Guardian", "Summoned by a guardian trap. Chases you down and disappears after a while.");
		NOTES.put("MirrorImage", "An illusion of you made by a Scroll of Mirror Image. Copies your weapon's damage and disappears after one hit.");
		NOTES.put("PrismaticImage", "An image of you made by the Prismatic glyph or wand. Copies your armor.");
		NOTES.put("Sheep", "Created by magic. Harmless and disappears after a while.");
		NOTES.put("Shopkeeper", "Sells and buys items. Runs away if you attack it.");
		NOTES.put("ImpShopkeeper", "Runs the shop in the demon halls.");
		NOTES.put("Ghost", "The Sad Ghost asks you to defeat a creature on this floor.");
		NOTES.put("Wandmaker", "The Old Wandmaker asks for a quest item in exchange for a wand.");
		NOTES.put("Blacksmith", "The Troll Blacksmith can reforge and upgrade items, and has a quest in the caves.");
		NOTES.put("Imp", "The Ambitious Imp wants you to defeat a group of creatures on this floor.");
		NOTES.put("RatKing", "A sleepy rat with a crown. Doesn't fight.");
	}

	private EnhancedBestiary() {
	}

	static boolean isOn() {
		return QolSettings.enhancedBestiary();
	}

	private static String pendingTitle;

	/**
	 * Adds the Stats and abilities buttons to a creature's info window.
	 */
	static void decorateInfo(Window window, Object subject) {
		if (!QolSettings.isAvailable() || !isOn() || !(subject instanceof Mob)) return;
		decorate(window, (Mob) subject);
	}

	/**
	 * Called at the start of the WndJournalItem constructor, which reuses its parameter registers before returning.
	 */
	public static void beforeJournalItem(String title) {
		pendingTitle = title;
	}

	/**
	 * Called at the end of the WndJournalItem constructor. Bestiary entries are matched to their creature by title.
	 */
	public static void afterJournalItem(Object window) {
		String title = pendingTitle;
		pendingTitle = null;
		if (!isOn() || !(window instanceof Window) || title == null) return;
		Class<?> type = bestiaryClass(title);
		if (type == null) return;
		try {
			Object instance = type.getDeclaredConstructor().newInstance();
			if (instance instanceof Mob) decorate((Window) window, (Mob) instance);
		} catch (Throwable e) {
			Log.e(TAG, "Could not create " + type.getName(), e);
		}
	}

	private static synchronized Class<?> bestiaryClass(String title) {
		if (bestiaryTitles == null) {
			bestiaryTitles = new HashMap<>();
			try {
				for (Bestiary group : Bestiary.values()) {
					for (Class<?> type : group.entities()) {
						if (!Mob.class.isAssignableFrom(type)) continue;
						try {
							Mob mob = (Mob) type.getDeclaredConstructor().newInstance();
							bestiaryTitles.put(Messages.titleCase(mob.name()), type);
						} catch (Throwable ignored) {
						}
					}
				}
			} catch (Throwable e) {
				Log.e(TAG, "Could not read the bestiary", e);
			}
		}
		Class<?> type = bestiaryTitles.get(title);
		if (type == null) return null;
		try {
			return Bestiary.isSeen(type) ? type : null;
		} catch (Throwable e) {
			return null;
		}
	}

	private static void decorate(Window window, Mob mob) {
		try {
			WindowHeader.add(window, InfoButton.create(abilities(mob)), InfoButton.SIZE, InfoButton.SIZE, WindowHeader.PRIORITY_INFO);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the abilities button", e);
		}
		try {
			RedButton stats = new RedButton("Stats", 7) {
				@Override
				public void onClick() {
					StatsWindow.open(mob);
				}
			};
			BottomRow.add(window, stats);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add the stats button", e);
		}
	}

	static String key(Object mob) {
		String name = mob.getClass().getName();
		if (name.startsWith(MOB_PREFIX + "actors.mobs.npcs.")) return name.substring((MOB_PREFIX + "actors.mobs.npcs.").length());
		if (name.startsWith(MOB_PREFIX + "actors.mobs.")) return name.substring((MOB_PREFIX + "actors.mobs.").length());
		int dot = name.lastIndexOf('.');
		return dot < 0 ? name : name.substring(dot + 1);
	}

	static String abilities(Mob mob) {
		StringBuilder text = new StringBuilder();
		text.append(title(mob));
		String note = NOTES.get(key(mob));
		if (note == null && mob.getClass().getSuperclass() != null) note = NOTES.get(key(mob.getClass().getSuperclass()));
		if (note != null) note = note.replace("{V}", String.valueOf(mob.viewDistance));
		paragraph(text, "MAGNIFY", "Vision: sees up to " + mob.viewDistance + (mob.viewDistance == 1 ? " tile" : " tiles") + " away, if nothing blocks its view.");
		paragraph(text, "BUFFS", "Abilities: " + (note == null ? "No special abilities known." : note));

		Set<Char.Property> properties = properties(mob);
		for (Char.Property property : properties) {
			String trait = traitText(property);
			if (trait != null) paragraph(text, traitIcon(property), trait);
		}
		if (mob.flying) paragraph(text, "BUFF:" + StatIcons.BUFF_LEVITATION, "Flies over chasms, water and traps.");

		Set<String> immune = names(classes(mob, "immunities", properties, true));
		Set<String> resist = names(classes(mob, "resistances", properties, false));
		if (!immune.isEmpty()) paragraph(text, "BUFF:" + StatIcons.BUFF_IMMUNITY, "Immune to: " + join(immune) + ".");
		if (!resist.isEmpty()) paragraph(text, "BUFF:" + StatIcons.BUFF_ARMOR, "Resists: " + join(resist) + ". Resisted effects do half as much.");
		return text.toString();
	}

	private static void paragraph(StringBuilder text, String icon, String body) {
		text.append("\n\n");
		if (icon != null) text.append('{').append(icon).append('}');
		text.append(body);
	}

	private static String traitIcon(Char.Property property) {
		switch (property) {
			case BOSS:
			case MINIBOSS:
			case BOSS_MINION: return "SKULL";
			case UNDEAD: return "BUFF:" + StatIcons.BUFF_CORRUPT;
			case DEMONIC: return "BUFF:" + StatIcons.BUFF_BERSERK;
			case INORGANIC: return "BUFF:" + StatIcons.BUFF_BARKSKIN;
			case FIERY: return "BUFF:" + StatIcons.BUFF_FIRE;
			case ICY: return "BUFF:" + StatIcons.BUFF_FROST;
			case ACIDIC: return "BUFF:" + StatIcons.BUFF_OOZE;
			case ELECTRIC: return "BUFF:" + StatIcons.BUFF_RECHARGING;
			case LARGE: return "ITEM:" + StatIcons.RING_MIGHT;
			case IMMOVABLE: return "BUFF:" + StatIcons.BUFF_ROOTS;
			case OBJECT: return "ITEM:" + StatIcons.SCROLL_IDENTIFY;
			case STATIC: return "BUFF:" + StatIcons.BUFF_PARALYSIS;
			default: return null;
		}
	}

	private static String title(Mob mob) {
		try {
			return Messages.titleCase(mob.name());
		} catch (Throwable e) {
			return key(mob);
		}
	}

	private static String key(Class<?> type) {
		String name = type.getName();
		if (name.startsWith(MOB_PREFIX + "actors.mobs.")) return name.substring((MOB_PREFIX + "actors.mobs.").length());
		int dot = name.lastIndexOf('.');
		return dot < 0 ? name : name.substring(dot + 1);
	}

	static Set<Char.Property> properties(Mob mob) {
		try {
			return new LinkedHashSet<>(mob.properties());
		} catch (Throwable e) {
			return new LinkedHashSet<>();
		}
	}

	private static String traitText(Char.Property property) {
		switch (property) {
			case BOSS: return "Boss: can't be charmed, made an ally or filled with dread, and resists Grim, Retribution and Psionic Blast.";
			case MINIBOSS: return "Miniboss: can't be charmed into an ally or filled with dread.";
			case BOSS_MINION: return "Boss minion: summoned to help a boss.";
			case UNDEAD: return "Undead.";
			case DEMONIC: return "Demonic: hurt more by effects that punish demons.";
			case INORGANIC: return "Inorganic: immune to bleeding, poison and toxic gas.";
			case FIERY: return "Fiery: immune to burning and the Blazing enchantment, resists fire magic.";
			case ICY: return "Icy: immune to freezing and chill, resists frost magic.";
			case ACIDIC: return "Acidic: immune to caustic ooze, resists corrosion.";
			case ELECTRIC: return "Electric: resists lightning and shocking effects.";
			case LARGE: return "Large: too big to fit through narrow passages.";
			case IMMOVABLE: return "Immovable: can't be pushed or pulled, immune to vertigo.";
			case OBJECT: return "Object: more an object than a creature.";
			case STATIC: return "Static: always acts the same way, immune to charm, terror, sleep, paralysis, freezing, slowing and similar effects.";
			default: return null;
		}
	}

	@SuppressWarnings("unchecked")
	private static Set<Class<?>> classes(Mob mob, String fieldName, Set<Char.Property> properties, boolean immunities) {
		Set<Class<?>> result = new LinkedHashSet<>();
		try {
			Field field = Reflect.field(Char.class, fieldName);
			Collection<Class<?>> own = (Collection<Class<?>>) field.get(mob);
			if (own != null) result.addAll(own);
		} catch (Throwable ignored) {
		}
		for (Char.Property property : properties) {
			try {
				result.addAll((Collection) (immunities ? property.immunities() : property.resistances()));
			} catch (Throwable ignored) {
			}
		}
		return result;
	}

	private static Set<String> names(Set<Class<?>> classes) {
		Set<String> names = new LinkedHashSet<>();
		for (Class<?> type : classes) names.add(readable(type.getSimpleName()));
		return names;
	}

	static String readable(String simpleName) {
		StringBuilder out = new StringBuilder();
		for (int i = 0; i < simpleName.length(); i++) {
			char c = simpleName.charAt(i);
			if (i > 0 && Character.isUpperCase(c) && !Character.isUpperCase(simpleName.charAt(i - 1))) out.append(' ');
			out.append(out.length() == 0 ? c : Character.toLowerCase(c));
		}
		return out.toString();
	}

	private static String join(Set<String> parts) {
		StringBuilder out = new StringBuilder();
		for (String part : parts) {
			if (out.length() > 0) out.append(", ");
			out.append(part);
		}
		return out.toString();
	}

	/**
	 * The lowest and highest results of a random roll, found by rolling it many times on a separate random
	 * generator so the game's own random results are not changed.
	 */
	static int[] range(IntRoll roll) {
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		Random.pushGenerator(12345L);
		try {
			for (int i = 0; i < SAMPLES; i++) {
				int value = roll.roll();
				min = Math.min(min, value);
				max = Math.max(max, value);
			}
		} catch (Throwable e) {
			return null;
		} finally {
			Random.popGenerator();
		}
		return min > max ? null : new int[] { min, max };
	}

	interface IntRoll {
		int roll();
	}

	static String lootText(Mob mob) {
		try {
			Field lootField = Reflect.field(Mob.class, "loot");
			Field chanceField = Reflect.field(Mob.class, "lootChance");
			Object loot = lootField.get(mob);
			float chance = chanceField.getFloat(mob);
			if (loot == null || chance <= 0) return "None";
			String name;
			if (loot instanceof Item) name = ((Item) loot).name();
			else if (loot instanceof Class) name = readable(((Class<?>) loot).getSimpleName());
			else name = loot.toString().toLowerCase(Locale.ROOT).replace('_', ' ');
			return name + " (" + Math.round(chance * 100) + "%)";
		} catch (Throwable e) {
			return "Unknown";
		}
	}

	static String stateText(Mob mob) {
		if (mob.state == null) return "Unknown";
		String name = mob.state.getClass().getSimpleName();
		return name.isEmpty() ? "Unknown" : name;
	}

	static boolean isLive(Mob mob) {
		try {
			return Dungeon.level != null && Dungeon.level.mobs != null && Dungeon.level.mobs.contains(mob);
		} catch (Throwable e) {
			return false;
		}
	}
}
