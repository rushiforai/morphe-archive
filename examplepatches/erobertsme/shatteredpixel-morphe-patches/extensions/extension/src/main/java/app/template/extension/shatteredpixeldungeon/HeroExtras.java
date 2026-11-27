package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.ShieldBuff;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroSubClass;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;
import com.watabou.utils.Bundle;

/**
 * Per-run character edits that are stored inside the hero's save data.
 */
@SuppressWarnings("unused")
public final class HeroExtras {

	public static final int TIERS = 4;

	/**
	 * The pages the modifiers are split into in the character editor.
	 */
	public enum Group {
		COMBAT("Combat"),
		SURVIVAL("Survival"),
		SENSES("Senses"),
		REWARDS("Rewards"),
		RINGS("Rings");

		public final String label;

		Group(String label) {
			this.label = label;
		}
	}

	public enum Mod {
		ACCURACY("Accuracy", Group.COMBAT, false),
		EVASION("Evasion", Group.COMBAT, false),
		DAMAGE("Damage", Group.COMBAT, false),
		ARMOR("Armor", Group.COMBAT, false),
		ATTACK_SPEED("Attack speed", Group.COMBAT, true),
		MOVE_SPEED("Move speed", Group.COMBAT, true),
		DAMAGE_DEALT("Damage dealt", Group.COMBAT, true),
		SURPRISE_DAMAGE("Surprise hits", Group.COMBAT, true),
		ENCHANT_POWER("Enchant power", Group.COMBAT, "RingOfArcana$Arcana"),
		REGEN("HP regen", Group.SURVIVAL, true),
		HEALING("Healing", Group.SURVIVAL, true),
		SHIELDING("Shielding", Group.SURVIVAL, true),
		DAMAGE_TAKEN("Damage taken", Group.SURVIVAL, true),
		TRAP_FALL("Trap & fall", Group.SURVIVAL, true),
		DEBUFF_TIME("Debuff time", Group.SURVIVAL, true),
		BUFF_TIME("Buff time", Group.SURVIVAL, true),
		VISION("Vision", Group.SENSES, false, -7, 12),
		SEARCH_RANGE("Search range", Group.SENSES, false, -2, 10),
		SEARCH_CHANCE("Search chance", Group.SENSES, true),
		STEALTH("Stealth", Group.SENSES, false, -10, 20),
		LUCK("Luck", Group.REWARDS, "RingOfWealth$Wealth"),
		EXPERIENCE("XP gain", Group.REWARDS, true),
		GOLD("Gold found", Group.REWARDS, true),
		SHOP_DEALS("Shop deals", Group.REWARDS, true),
		ENERGY("Energize", Group.REWARDS, true),
		THROWN_DURABILITY("Thrown life", Group.REWARDS, true),
		IDENTIFY_SPEED("Identify speed", Group.REWARDS, true),
		RING_ACCURACY("Accuracy", Group.RINGS, "RingOfAccuracy$Accuracy"),
		RING_ELEMENTS("Elements", Group.RINGS, "RingOfElements$Resistance"),
		RING_ENERGY("Energy", Group.RINGS, "RingOfEnergy$Energy"),
		RING_EVASION("Evasion", Group.RINGS, "RingOfEvasion$Evasion"),
		RING_FORCE("Force", Group.RINGS, "RingOfForce$Force"),
		RING_FUROR("Furor", Group.RINGS, "RingOfFuror$Furor"),
		RING_HASTE("Haste", Group.RINGS, "RingOfHaste$Haste"),
		RING_MIGHT("Might", Group.RINGS, "RingOfMight$Might"),
		RING_SHARPSHOOTING("Sharpshot", Group.RINGS, "RingOfSharpshooting$Aim"),
		RING_TENACITY("Tenacity", Group.RINGS, "RingOfTenacity$Tenacity");

		private static final String RING_PACKAGE = "com.shatteredpixel.shatteredpixeldungeon.items.rings.";
		private static final int RING_MIN = -10;
		private static final int RING_MAX = 20;

		public final String label;
		public final Group group;
		public final boolean percent;
		/**
		 * The ring buff this modifier adds levels to, or null for one that isn't a ring.
		 */
		public final String ring;
		private final int min;
		private final int max;

		Mod(String label, Group group, boolean percent) {
			this(label, group, percent, percent ? -90 : -999, percent ? 1000 : 999, null);
		}

		Mod(String label, Group group, boolean percent, int min, int max) {
			this(label, group, percent, min, max, null);
		}

		Mod(String label, Group group, String ring) {
			this(label, group, false, RING_MIN, RING_MAX, RING_PACKAGE + ring);
		}

		Mod(String label, Group group, boolean percent, int min, int max, String ring) {
			this.label = label;
			this.group = group;
			this.percent = percent;
			this.min = min;
			this.max = max;
			this.ring = ring;
		}

		public int step() {
			return percent ? 5 : 1;
		}

		public int min() {
			return min;
		}

		public int max() {
			return max;
		}

		/**
		 * The modifier that adds levels to [ringBuff], or null.
		 */
		static Mod forRing(Class<?> ringBuff) {
			String name = ringBuff.getName();
			for (Mod mod : values()) {
				if (name.equals(mod.ring)) return mod;
			}
			return null;
		}

		/**
		 * The modifiers in [group], in order.
		 */
		public static java.util.List<Mod> in(Group group) {
			java.util.List<Mod> list = new java.util.ArrayList<>();
			for (Mod mod : values()) {
				if (mod.group == group) list.add(mod);
			}
			return list;
		}
	}

	/**
	 * Kinds of harm the hero can resist, each with the effects the game uses for it.
	 */
	public enum Element {
		FIRE("Fire", StatIcons.BUFF_FIRE, "actors.buffs.Burning", "actors.blobs.Fire", "items.wands.WandOfFireblast"),
		COLD("Cold", StatIcons.BUFF_FROST, "actors.buffs.Chill", "actors.buffs.Frost", "actors.blobs.Freezing", "items.wands.WandOfFrost"),
		LIGHTNING("Lightning", StatIcons.BUFF_RECHARGING, "actors.blobs.Electricity", "items.wands.WandOfLightning", "actors.mobs.DM100$LightningBolt",
			"actors.mobs.Shaman$EarthenBolt", "actors.mobs.Elemental$ShockElemental", "levels.traps.ShockingTrap", "levels.traps.StormTrap"),
		POISON("Poison", StatIcons.BUFF_CORRUPT, "actors.buffs.Poison", "actors.blobs.ToxicGas"),
		CORROSION("Corrosion", StatIcons.BUFF_OOZE, "actors.buffs.Corrosion", "actors.blobs.CorrosiveGas"),
		OOZE("Ooze", StatIcons.BUFF_OOZE, "actors.buffs.Ooze"),
		PARALYSIS("Paralysis", StatIcons.BUFF_PARALYSIS, "actors.buffs.Paralysis", "actors.blobs.ParalyticGas"),
		MAGIC("Magic", StatIcons.BUFF_IMMUNITY, "items.wands.WandOfMagicMissile");

		public final String label;
		public final int icon;
		private final String[] names;
		private Class<?>[] types;

		/**
		 * The main effect of this element, used to show how strongly a character resists it.
		 */
		public Class<?> primary() {
			Class<?>[] all = types();
			return all.length == 0 ? null : all[0];
		}

		Element(String label, int icon, String... names) {
			this.label = label;
			this.icon = icon;
			this.names = names;
		}

		/**
		 * Whether harm from [effect] counts as this element.
		 */
		boolean covers(Class<?> effect) {
			if (effect == null) return false;
			for (Class<?> type : types()) {
				if (type.isAssignableFrom(effect)) return true;
			}
			return false;
		}

		private synchronized Class<?>[] types() {
			if (types != null) return types;
			java.util.List<Class<?>> found = new java.util.ArrayList<>();
			for (String name : names) {
				try {
					found.add(Reflect.require(GAME_PACKAGE + name));
				} catch (Throwable ignored) {
				}
			}
			if (this == MAGIC) found.addAll(magicEffects());
			types = found.toArray(new Class<?>[0]);
			return types;
		}

		/**
		 * Everything the Glyph of Anti-Magic protects against: wands, magical attacks, magic traps and bombs, and magical debuffs.
		 */
		@SuppressWarnings("unchecked")
		private static java.util.Collection<Class<?>> magicEffects() {
			try {
				return (java.util.Collection<Class<?>>) Reflect.getStatic(Reflect.require(GAME_PACKAGE + "items.armor.glyphs.AntiMagic"), "RESISTS");
			} catch (Throwable e) {
				return java.util.Collections.emptyList();
			}
		}
	}

	public static final int IMMUNE = 100;
	private static final int MAX_DISTANCE = 20;
	private static final int[] resistances = new int[Element.values().length];
	private static final ThreadLocal<Object> ringTarget = new ThreadLocal<>();
	private static final ThreadLocal<Class<?>> resistTarget = new ThreadLocal<>();
	private static final ThreadLocal<Boolean> surpriseHit = new ThreadLocal<>();
	private static final java.util.Map<Class<?>, Buff.buffType> buffTypes = new java.util.HashMap<>();
	private static final String GAME_PACKAGE = "com.shatteredpixel.shatteredpixeldungeon.";
	private static Object healHero;
	private static int healHP;
	private static int healHT;
	private static float healCarry;

	private static final String PREFIX = "morphe_extras_";
	private static final int[] bonusTalentPoints = new int[TIERS + 1];
	private static final int[] mods = new int[Mod.values().length];
	private static final int INFINITE_EVASION = 1_000_000;

	private static Object bonusHero;
	private static int bonusTier;

	private HeroExtras() {
	}

	public static int bonusTalentPoints(int tier) {
		return bonusTalentPoints[tier];
	}

	public static void bonusTalentPoints(int tier, int value) {
		bonusTalentPoints[tier] = Math.max(0, Math.min(99, value));
	}

	public static int mod(Mod mod) {
		return mods[mod.ordinal()];
	}

	public static void mod(Mod mod, int value) {
		mods[mod.ordinal()] = Math.max(mod.min(), Math.min(mod.max(), value));
	}

	public static void resetMods() {
		for (int i = 0; i < mods.length; i++) mods[i] = 0;
		for (int i = 0; i < resistances.length; i++) resistances[i] = 0;
	}

	public static int resistance(Element element) {
		return resistances[element.ordinal()];
	}

	public static void resistance(Element element, int value) {
		resistances[element.ordinal()] = Math.max(0, Math.min(IMMUNE, value));
	}

	public static boolean isTierLocked(Hero hero, int tier) {
		if (hero.lvl < Talent.tierLevelThresholds[tier] - 1) return true;
		if (tier == 3 && hero.subClass == HeroSubClass.NONE) return true;
		return tier == 4 && hero.armorAbility == null;
	}

	/**
	 * Called at the start of the Hero constructor.
	 */
	public static void reset() {
		for (int i = 0; i < bonusTalentPoints.length; i++) bonusTalentPoints[i] = 0;
		resetMods();
		InfiniteStatuses.reset();
	}

	/**
	 * Called at the start of Hero.storeInBundle.
	 */
	public static void store(Bundle bundle) {
		for (int tier = 1; tier <= TIERS; tier++) bundle.put(PREFIX + "talents_" + tier, bonusTalentPoints[tier]);
		for (Mod mod : Mod.values()) bundle.put(PREFIX + mod.name().toLowerCase(), mods[mod.ordinal()]);
		for (Element element : Element.values()) bundle.put(PREFIX + "resist_" + element.name().toLowerCase(), resistances[element.ordinal()]);
		InfiniteStatuses.store(bundle);
	}

	/**
	 * Called at the start of Hero.restoreFromBundle.
	 */
	public static void restore(Bundle bundle) {
		reset();
		for (int tier = 1; tier <= TIERS; tier++) bonusTalentPoints[tier] = bundle.getInt(PREFIX + "talents_" + tier);
		for (Mod mod : Mod.values()) mods[mod.ordinal()] = bundle.getInt(PREFIX + mod.name().toLowerCase());
		for (Element element : Element.values()) resistances[element.ordinal()] = bundle.getInt(PREFIX + "resist_" + element.name().toLowerCase());
		InfiniteStatuses.restore(bundle);
	}

	/**
	 * Called at the start of Hero.bonusTalentPoints, which reuses its parameter registers before returning.
	 */
	public static void beforeBonusTalentPoints(Object hero, int tier) {
		bonusHero = hero;
		bonusTier = tier;
	}

	/**
	 * Called before each return of Hero.bonusTalentPoints.
	 */
	public static int adjustBonusTalentPoints(int value) {
		Object hero = bonusHero;
		int tier = bonusTier;
		bonusHero = null;
		if (!(hero instanceof Hero) || hero != Dungeon.hero) return value;
		if (tier < 1 || tier > TIERS) return value;
		if (isTierLocked((Hero) hero, tier)) return value;
		return value + bonusTalentPoints[tier];
	}

	public static int adjustAccuracy(int value) {
		return Math.max(1, value + mod(Mod.ACCURACY));
	}

	public static int adjustEvasion(int value) {
		if (value >= INFINITE_EVASION) return value;
		return Math.max(0, value + mod(Mod.EVASION));
	}

	public static int adjustDamage(int value) {
		return Math.max(0, value + mod(Mod.DAMAGE));
	}

	public static int adjustArmor(int value) {
		return Math.max(0, value + mod(Mod.ARMOR));
	}

	public static float adjustAttackDelay(float value) {
		return value / multiplier(Mod.ATTACK_SPEED);
	}

	public static float adjustMoveSpeed(float value) {
		return value * multiplier(Mod.MOVE_SPEED);
	}

	public static float adjustRegen(float value) {
		return value * multiplier(Mod.REGEN);
	}

	private static float multiplier(Mod mod) {
		return 1f + mod(mod) / 100f;
	}

	/**
	 * Called at the start of Ring.getBonus and Ring.getBuffedBonus, which reuse the character's register before returning.
	 */
	public static void beforeRingBonus(Object target, Class<?> ring) {
		ringTarget.set(target);
	}

	/**
	 * Called when Ring.getBonus or Ring.getBuffedBonus returns. Ring modifiers add levels of their ring for the hero, as if wearing it,
	 * unless magic is blocked: Luck for Ring of Wealth, Enchant power for Ring of Arcana, and one for each other ring.
	 */
	public static int adjustRingBonus(int value, Class<?> ring) {
		Object target = ringTarget.get();
		ringTarget.remove();
		if (ring == null || target == null || target != Dungeon.hero) return value;
		Mod mod = Mod.forRing(ring);
		if (mod == null || mod(mod) == 0 || magicBlocked(target)) return value;
		return value + mod(mod);
	}

	private static boolean magicBlocked(Object target) {
		Class<?> immune = Reflect.type("com.shatteredpixel.shatteredpixeldungeon.actors.buffs.MagicImmune");
		if (immune == null) return false;
		for (Object buff : ((Hero) target).buffs()) {
			if (immune.isInstance(buff)) return true;
		}
		return false;
	}

	/**
	 * Called with how far a character sees, before the field of view is cast: its sight with light, talents and trinkets already counted.
	 * Adds the Vision modifier for the hero on top.
	 */
	public static float adjustViewDistance(Object character, float distance) {
		if (character != Dungeon.hero || mod(Mod.VISION) == 0) return distance;
		return Math.max(1, Math.min(MAX_DISTANCE, distance + mod(Mod.VISION)));
	}

	/**
	 * Called with how far the hero searches, once talents and Foresight have set it. Adds the Search range modifier on top.
	 */
	public static int adjustSearchDistance(int distance) {
		if (mod(Mod.SEARCH_RANGE) == 0) return distance;
		return Math.max(1, Math.min(MAX_DISTANCE, distance + mod(Mod.SEARCH_RANGE)));
	}

	/**
	 * Called with the roll for spotting a hidden door or trap while searching, which succeeds when it is below the chance. Shrinking the
	 * roll raises the chance by the Search chance modifier.
	 */
	public static float adjustSearchRoll(float roll) {
		return roll / multiplier(Mod.SEARCH_CHANCE);
	}

	/**
	 * Called when Char.stealth returns. Adds the Stealth modifier for the hero; enemies notice a stealthier hero less often.
	 */
	public static float adjustStealth(float value, Object character) {
		if (character != Dungeon.hero) return value;
		return value + mod(Mod.STEALTH);
	}

	/**
	 * Called at the start of Char.resist, which reuses the effect's register before returning.
	 */
	public static void beforeResist(Object character, Class<?> effect) {
		resistTarget.set(character == Dungeon.hero ? effect : null);
	}

	/**
	 * Called when Char.resist returns. Lowers how much an element affects the hero.
	 */
	public static float adjustResist(float value) {
		Class<?> effect = resistTarget.get();
		resistTarget.remove();
		if (effect == null) return value;
		for (Element element : Element.values()) {
			int percent = resistance(element);
			if (percent > 0 && element.covers(effect)) value *= 1f - percent / 100f;
		}
		return value;
	}

	/**
	 * Called at the start of Char.isImmune. Returns true when the hero is fully resistant to [effect].
	 */
	public static boolean isImmune(Object character, Class<?> effect) {
		if (character != Dungeon.hero) return false;
		for (Element element : Element.values()) {
			if (resistance(element) >= IMMUNE && element.covers(effect)) return true;
		}
		return false;
	}

	/**
	 * Called at the start of Hero.damage with the damage and what caused it. Applies Damage taken, and Trap & fall for traps and falls.
	 */
	public static int adjustDamageTaken(int damage, Object source) {
		if (damage <= 0) return damage;
		float scale = multiplier(Mod.DAMAGE_TAKEN);
		if (isTrapOrFall(source)) scale *= multiplier(Mod.TRAP_FALL);
		if (scale == 1f) return damage;
		return Math.max(0, Math.round(damage * scale));
	}

	private static boolean isTrapOrFall(Object source) {
		if (source == null) return false;
		String name = source.getClass().getName();
		return name.startsWith(GAME_PACKAGE + "levels.traps.") || name.equals(GAME_PACKAGE + "levels.features.Chasm");
	}

	/**
	 * Called at the start of Hero.attackProc, before the enemy reacts to the hit. Notes whether the enemy was caught by surprise.
	 */
	public static void beforeAttackProc(Object enemy) {
		boolean surprised = false;
		try {
			surprised = enemy instanceof Mob && ((Mob) enemy).surprisedBy(Dungeon.hero);
		} catch (Throwable ignored) {
		}
		surpriseHit.set(surprised);
	}

	/**
	 * Called when Hero.attackProc returns. Applies Damage dealt, and Surprise hits when the enemy was caught by surprise.
	 */
	public static int adjustDamageDealt(int damage) {
		Boolean surprised = surpriseHit.get();
		surpriseHit.remove();
		if (damage <= 0) return damage;
		float scale = multiplier(Mod.DAMAGE_DEALT);
		if (Boolean.TRUE.equals(surprised)) scale *= multiplier(Mod.SURPRISE_DAMAGE);
		if (scale == 1f) return damage;
		return Math.max(0, Math.round(damage * scale));
	}

	/**
	 * Called at the start of Hero.act. Healing the game gave the hero since its last turn is scaled by the Healing modifier, keeping the
	 * fraction for next time so small heals such as natural regeneration add up. A turn where max health also changed, such as a level up,
	 * is skipped.
	 */
	public static void onHeroAct(Object actor) {
		if (!(actor instanceof Hero)) return;
		Hero hero = (Hero) actor;
		if (healHero != hero) {
			healHero = hero;
			healCarry = 0;
		} else if (hero.HT == healHT && hero.HP > healHP && mod(Mod.HEALING) != 0 && hero.isAlive()) {
			float extra = (hero.HP - healHP) * mod(Mod.HEALING) / 100f + healCarry;
			int whole = (int) extra;
			healCarry = extra - whole;
			hero.HP = Math.max(1, Math.min(hero.HT, hero.HP + whole));
		}
		healHP = hero.HP;
		healHT = hero.HT;
	}

	/**
	 * Called at the start of ShieldBuff.incShield. Scales a shield the hero gains by the Shielding modifier.
	 */
	public static int adjustShieldGain(Object buff, int amount) {
		if (amount <= 0 || !(buff instanceof Buff) || ((Buff) buff).target != Dungeon.hero) return amount;
		return Math.max(0, Math.round(amount * multiplier(Mod.SHIELDING)));
	}

	/**
	 * Called at the start of ShieldBuff.setShield. When the hero's shield is raised, the rise is scaled by the Shielding modifier.
	 */
	public static int adjustShieldSet(Object buff, int value) {
		if (!(buff instanceof ShieldBuff) || ((Buff) buff).target != Dungeon.hero) return value;
		int current = ((ShieldBuff) buff).shielding();
		if (value <= current) return value;
		return current + Math.max(0, Math.round((value - current) * multiplier(Mod.SHIELDING)));
	}

	/**
	 * Called at the start of Buff.affect and Buff.prolong with a timed effect's length. Lengthens or shortens the hero's positive effects by
	 * Buff time and negative ones by Debuff time.
	 */
	public static float adjustBuffDuration(Object target, Class<?> type, float duration) {
		if (target != Dungeon.hero || duration <= 0 || type == null) return duration;
		Buff.buffType kind = buffType(type);
		if (kind == Buff.buffType.POSITIVE) return duration * multiplier(Mod.BUFF_TIME);
		if (kind == Buff.buffType.NEGATIVE) return duration * multiplier(Mod.DEBUFF_TIME);
		return duration;
	}

	private static synchronized Buff.buffType buffType(Class<?> type) {
		if (buffTypes.containsKey(type)) return buffTypes.get(type);
		Buff.buffType kind = null;
		try {
			java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor();
			constructor.setAccessible(true);
			kind = ((Buff) constructor.newInstance()).type;
		} catch (Throwable ignored) {
		}
		buffTypes.put(type, kind);
		return kind;
	}

	/**
	 * Called at the start of Hero.earnExp. Scales experience by the XP gain modifier.
	 */
	public static int adjustExperience(int amount) {
		if (amount <= 0) return amount;
		return Math.max(0, Math.round(amount * multiplier(Mod.EXPERIENCE)));
	}

	/**
	 * Called at the start of Gold.doPickUp. Scales gold the hero picks up by the Gold found modifier.
	 */
	public static void beforeGoldPickup(Object gold, Object hero) {
		if (hero != Dungeon.hero || mod(Mod.GOLD) == 0 || !(gold instanceof Item)) return;
		Item item = (Item) gold;
		item.quantity(Math.max(1, Math.round(item.quantity() * multiplier(Mod.GOLD))));
	}

	/**
	 * Called when Shopkeeper.sellPrice returns, the price of buying an item. Shop deals lowers it.
	 */
	public static int adjustBuyPrice(int price) {
		if (price <= 0 || mod(Mod.SHOP_DEALS) == 0) return price;
		return Math.max(1, Math.round(price / multiplier(Mod.SHOP_DEALS)));
	}

	/**
	 * What selling an item worth [value] pays. Shop deals raises it.
	 */
	public static int sellValue(int value) {
		if (value <= 0 || mod(Mod.SHOP_DEALS) == 0) return value;
		return Math.max(0, Math.round(value * multiplier(Mod.SHOP_DEALS)));
	}

	/**
	 * Called with the energy an item gives when energized. Scales it by the Energize modifier.
	 */
	public static int adjustEnergy(int energy) {
		if (energy <= 0 || mod(Mod.ENERGY) == 0) return energy;
		return Math.max(0, Math.round(energy * multiplier(Mod.ENERGY)));
	}

	/**
	 * Called when MissileWeapon.durabilityPerUse returns. Thrown life makes thrown weapons wear out more slowly.
	 */
	public static float adjustThrownWear(float wear) {
		return wear / multiplier(Mod.THROWN_DURABILITY);
	}

	/**
	 * Called at the end of Talent.itemIDSpeedFactor, which sets how fast weapons, armor, rings and wands become identified as you use
	 * them or gain experience. Applies the Identify speed modifier.
	 */
	public static float adjustIdentifySpeed(float factor) {
		return factor * multiplier(Mod.IDENTIFY_SPEED);
	}
}
