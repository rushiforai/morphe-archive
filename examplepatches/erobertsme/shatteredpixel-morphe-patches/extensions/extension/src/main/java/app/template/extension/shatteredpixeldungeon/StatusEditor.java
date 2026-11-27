package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Barrier;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Burning;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.FlavourBuff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Hunger;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.ShieldBuff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.WellFed;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIndicator;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale;

final class StatusEditor {

	private static final String TAG = "StatusEditor";
	private static final int NO_ICON = 127;

	static final String[] HUNGER_STATES = { "Well Fed", "Normal", "Hungry", "Starving" };
	private static final float[] HUNGER_LEVELS = { 0f, 0f, 300f, 450f };

	static final class Entry {
		final Class<? extends Buff> type;
		final Buff sample;
		final String name;
		final Buff.buffType kind;

		Entry(Class<? extends Buff> type, Buff sample, String name, Buff.buffType kind) {
			this.type = type;
			this.sample = sample;
			this.name = name;
			this.kind = kind;
		}
	}

	private static List<Entry> catalog;
	private static final CatalogTabs<Entry> tabs = new CatalogTabs<>();

	private StatusEditor() {
	}

	static synchronized List<Entry> catalog() {
		if (catalog != null) return catalog;
		Map<String, Entry> byName = new LinkedHashMap<>();
		for (String className : BuffClasses.NAMES) {
			Entry entry = load(className);
			if (entry == null) continue;
			String key = entry.name.toLowerCase(Locale.ENGLISH);
			Entry existing = byName.get(key);
			if (existing == null || preferred(entry, existing)) byName.put(key, entry);
		}
		List<Entry> entries = new ArrayList<>(byName.values());
		Collections.sort(entries, (a, b) -> a.name.compareToIgnoreCase(b.name));
		catalog = entries;
		return catalog;
	}

	@SuppressWarnings("unchecked")
	private static Entry load(String className) {
		try {
			Class<?> type = Reflect.require(className);
			if (!Buff.class.isAssignableFrom(type) || type == Hunger.class) return null;
			Buff sample = (Buff) type.getConstructor().newInstance();
			if (sample.icon() == NO_ICON) return null;
			String name = nameOf(sample);
			if (isCooldown(type, name)) return null;
			return new Entry((Class<? extends Buff>) type, sample, name, sample.type);
		} catch (Throwable e) {
			return null;
		}
	}

	private static boolean preferred(Entry candidate, Entry existing) {
		boolean candidateMob = candidate.type.getName().contains(".actors.mobs.");
		boolean existingMob = existing.type.getName().contains(".actors.mobs.");
		if (candidateMob != existingMob) return !candidateMob;
		return candidate.type.getName().length() < existing.type.getName().length();
	}

	private static boolean isCooldown(Class<?> type, String name) {
		String lowerName = name.toLowerCase(Locale.ENGLISH);
		return type.getName().contains("Cooldown") || lowerName.contains("cooldown") || lowerName.contains("cool down");
	}

	static List<Entry> catalog(int kind) {
		if (kind == StatusPickerWindow.FAVORITES) return CatalogTabs.live(catalog(), entry -> matches(entry, kind));
		return tabs.tab(kind, catalog(), entry -> matches(entry, kind));
	}

	private static boolean matches(Entry entry, int kind) {
		if (kind == StatusPickerWindow.FAVORITES) return Favorites.isStatus(entry.type);
		Buff.buffType entryKind = entry.kind == null ? Buff.buffType.NEUTRAL : entry.kind;
		if (kind == StatusPickerWindow.POSITIVE) return entryKind == Buff.buffType.POSITIVE;
		if (kind == StatusPickerWindow.NEGATIVE) return entryKind == Buff.buffType.NEGATIVE;
		return entryKind == Buff.buffType.NEUTRAL;
	}

	static List<Buff> active(Char hero) {
		List<Buff> result = new ArrayList<>();
		for (Buff buff : new ArrayList<>(hero.buffs())) {
			if (buff instanceof Hunger) continue;
			if (iconOf(buff) == NO_ICON) continue;
			result.add(buff);
		}
		return result;
	}

	static boolean isActive(Char hero, Class<? extends Buff> type) {
		for (Buff buff : hero.buffs()) {
			if (buff.getClass() == type) return true;
		}
		return false;
	}

	static void remove(Buff buff) {
		try {
			buff.detach();
		} catch (Throwable e) {
			Log.e(TAG, "Could not remove " + buff.getClass().getName(), e);
		}
		refreshIndicator();
	}

	static void removeNegative(Char hero) {
		for (Buff buff : active(hero)) {
			if (buff.type == Buff.buffType.NEGATIVE) InfiniteStatuses.removeForever(buff);
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	static void add(Char hero, Class<? extends Buff> type, int duration) {
		try {
			if (FlavourBuff.class.isAssignableFrom(type)) {
				Buff.affect(hero, (Class) type, (float) duration);
				refreshIndicator();
				return;
			}

			Buff buff = Buff.affect(hero, type);
			if (buff instanceof Burning) {
				((Burning) buff).reignite(hero, duration);
				refreshIndicator();
				return;
			}
			applyDuration(buff, duration);
		} catch (Throwable e) {
			Log.e(TAG, "Could not add " + type.getName(), e);
		}
		refreshIndicator();
	}

	/**
	 * A status of [type] given to no one, set up the way adding it for [turns] turns sets it up, so it can hold settings until it is given.
	 */
	static Buff prepared(Class<? extends Buff> type, int turns) {
		try {
			Buff buff = type.getConstructor().newInstance();
			if (!(buff instanceof FlavourBuff) && !(buff instanceof Burning)) applyDuration(buff, turns);
			if (hasSeparateAmount(type)) setAmount(buff, turns);
			return buff;
		} catch (ReflectiveOperationException e) {
			throw new IllegalStateException("Could not make " + type.getName(), e);
		}
	}

	private static void applyDuration(Buff buff, int duration) {
		for (Class<?> type = buff.getClass(); type != null && type != Buff.class; type = type.getSuperclass()) {
			if (invoke(buff, type, "set", float.class, (float) duration)) return;
			if (invoke(buff, type, "set", int.class, duration)) return;
		}
	}

	private static boolean invoke(Buff buff, Class<?> type, String name, Class<?> parameter, Object value) {
		try {
			Reflect.declaredMethod(type, name, parameter).invoke(buff, value);
			return true;
		} catch (Throwable e) {
			return false;
		}
	}

	static void setShield(Hero hero, int target) {
		int current = hero.shielding();
		try {
			if (target > current) {
				Buff.affect(hero, Barrier.class).incShield(target - current);
			} else if (target < current) {
				int remaining = current - target;
				for (Buff buff : new ArrayList<>(hero.buffs())) {
					if (remaining <= 0) break;
					if (buff instanceof ShieldBuff) remaining = ((ShieldBuff) buff).absorbDamage(remaining);
				}
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not set shield", e);
		}
		refreshIndicator();
	}

	static int hungerState(Hero hero) {
		float level = hungerLevel(hero);
		if (level >= HUNGER_LEVELS[3]) return 3;
		if (level >= HUNGER_LEVELS[2]) return 2;
		if (hero.buff(WellFed.class) != null) return 0;
		return 1;
	}

	static void setHungerState(Hero hero, int state) {
		Hunger hunger = hunger(hero);
		if (hunger == null) return;
		int index = Math.max(0, Math.min(HUNGER_LEVELS.length - 1, state));
		try {
			Field field = Reflect.field(Hunger.class, "level");
			field.setFloat(hunger, HUNGER_LEVELS[index]);
			WellFed wellFed = hero.buff(WellFed.class);
			if (index == 0) {
				if (wellFed == null) wellFed = Buff.affect(hero, WellFed.class);
				wellFed.reset();
			} else if (wellFed != null) {
				wellFed.detach();
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not set hunger", e);
		}
		refreshIndicator();
	}

	static float hungerLevel(Hero hero) {
		Hunger hunger = hunger(hero);
		if (hunger == null) return 0;
		try {
			Field field = Reflect.field(Hunger.class, "level");
			return field.getFloat(hunger);
		} catch (Throwable e) {
			return 0;
		}
	}

	private static Hunger hunger(Hero hero) {
		for (Buff buff : hero.buffs()) {
			if (buff instanceof Hunger) return (Hunger) buff;
		}
		return null;
	}

	static String nameOf(Buff buff) {
		try {
			String name = buff.name();
			if (name != null && !name.isEmpty() && !name.startsWith("!!!")) return capitalize(name);
		} catch (Throwable ignored) {
		}
		return buff.getClass().getSimpleName();
	}

	private static final String[] DURATION_FIELDS = { "left", "level" };

	static boolean hasDurationField(Buff buff) {
		return durationField(buff) != null;
	}

	static void keepScheduled(Buff buff) {
		try {
			Field time = Reflect.field(Actor.class, "time");
			time.setFloat(buff, Math.max(time.getFloat(buff), Actor.now() + 1));
		} catch (Throwable ignored) {
		}
	}

	/**
	 * Whether a status's turns can be changed. A status whose only number is its amount, like Barkskin's armor, has its amount edited
	 * instead.
	 */
	static boolean isTurnsEditable(Buff buff) {
		return shape(buff.getClass()).turnsEditable;
	}

	static int turnsValue(Buff buff) {
		if (amountField(buff) == null) {
			try {
				return Math.round(Float.parseFloat(buff.iconTextDisplay().trim()));
			} catch (Throwable ignored) {
			}
		}
		Field field = durationField(buff);
		if (field == null) return 0;
		try {
			return Math.round(field.getType() == int.class ? field.getInt(buff) : field.getFloat(buff));
		} catch (Throwable e) {
			return 0;
		}
	}

	static void setTurns(Buff buff, int turns) {
		int value = Math.max(1, turns);
		try {
			if (buff instanceof FlavourBuff) {
				Field time = Reflect.field(Actor.class, "time");
				time.setFloat(buff, Actor.now() + value);
			} else {
				Field field = durationField(buff);
				if (field == null) return;
				if (field.getType() == int.class) field.setInt(buff, value);
				else field.setFloat(buff, value);
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not set turns for " + buff.getClass().getName(), e);
		}
		refreshIndicator();
	}

	private static Field durationField(Buff buff) {
		return shape(buff.getClass()).duration;
	}

	/**
	 * What a kind of status keeps and how it is edited, worked out from its class once and remembered: the field holding its turns, its
	 * extra number and what that is called, and every setting it has.
	 */
	private static final class Shape {
		final Field duration;
		final String[] amount;
		final Field amountField;
		final boolean turnsEditable;
		final List<Setting> settings;

		Shape(Class<?> type) {
			duration = findDurationField(type);
			amount = findAmount(type);
			amountField = findAmountField(type, amount);
			turnsEditable = FlavourBuff.class.isAssignableFrom(type) || duration != null && !duration.equals(amountField);
			settings = Collections.unmodifiableList(findSettings(type, turnsEditable ? duration : null, amountField, amount));
		}
	}

	private static final Map<Class<?>, Shape> shapes = new HashMap<>();

	private static synchronized Shape shape(Class<?> type) {
		Shape shape = shapes.get(type);
		if (shape != null) return shape;
		shape = new Shape(type);
		shapes.put(type, shape);
		return shape;
	}

	private static Field findDurationField(Class<?> buffType) {
		for (Class<?> type = buffType; type != null && type != Buff.class; type = type.getSuperclass()) {
			for (String name : DURATION_FIELDS) {
				try {
					Field field = Reflect.declaredField(type, name);
					if (field.getType() != float.class && field.getType() != int.class) continue;
					return field;
				} catch (NoSuchFieldException ignored) {
				}
			}
		}
		return null;
	}

	private static final String GAME_PACKAGE = "com.shatteredpixel.shatteredpixeldungeon.";

	/**
	 * Statuses that keep a number besides how long they last: the class, the field and what the number is called. A class also covers the
	 * statuses based on it, so ShieldBuff covers Barrier and the other shields.
	 */
	private static final String[][] AMOUNTS = {
		{ "actors.buffs.Healing", "healingLeft", "Healing left" },
		{ "actors.buffs.Combo", "count", "Combo" },
		{ "actors.buffs.ShieldBuff", "shielding", "Shield" },
		{ "actors.buffs.Momentum", "momentumStacks", "Momentum" },
		{ "actors.buffs.MonkEnergy", "energy", "Energy" },
		{ "actors.buffs.AdrenalineSurge", "boost", "Strength" },
		{ "actors.buffs.ArcaneArmor", "level", "Armor" },
		{ "actors.buffs.Barkskin", "level", "Armor" },
		{ "actors.buffs.Bleeding", "level", "Damage" },
		{ "actors.buffs.Corrosion", "damage", "Damage" },
		{ "actors.buffs.PhysicalEmpower", "dmgBoost", "Damage boost" },
		{ "actors.buffs.WandEmpower", "dmgBoost", "Damage boost" },
		{ "actors.buffs.PrismaticGuard", "HP", "Health" },
		{ "items.wands.WandOfLivingEarth$RockArmor", "armor", "Armor" },
		{ "plants.Earthroot$Armor", "level", "Armor" },
		{ "plants.Sungrass$Health", "level", "Healing" },
		{ "items.weapon.enchantments.Kinetic$ConservedDamage", "preservedDamage", "Stored damage" },
		{ "items.weapon.melee.Sai$ComboStrikeTracker", "hits", "Hits" },
		{ "items.armor.glyphs.Viscosity$DeferedDamage", "damage", "Damage" },
	};

	private static String[] amountOf(Class<?> type) {
		return shape(type).amount;
	}

	private static String[] findAmount(Class<?> type) {
		for (String[] amount : AMOUNTS) {
			Class<?> owner = Reflect.type(GAME_PACKAGE + amount[0]);
			if (owner != null && owner.isAssignableFrom(type)) return amount;
		}
		return null;
	}

	/**
	 * What the extra number of statuses of [type] is called, or null for a status without one.
	 */
	static String amountLabel(Class<?> type) {
		String[] amount = amountOf(type);
		return amount == null ? null : amount[2];
	}

	/**
	 * Whether statuses of [type] keep an extra number apart from their duration, so adding one asks for both.
	 */
	static boolean hasSeparateAmount(Class<?> type) {
		String[] amount = amountOf(type);
		return amount != null && !java.util.Arrays.asList(DURATION_FIELDS).contains(amount[1]);
	}

	private static Field amountField(Buff buff) {
		return shape(buff.getClass()).amountField;
	}

	private static Field findAmountField(Class<?> type, String[] amount) {
		if (amount == null) return null;
		try {
			return Reflect.field(type, amount[1]);
		} catch (NoSuchFieldException e) {
			return null;
		}
	}

	/**
	 * The extra number [buff] keeps, such as healing left, or 0 for a status without one.
	 */
	static float amount(Buff buff) {
		Field field = amountField(buff);
		return field == null ? 0 : number(buff, field);
	}

	static void setAmount(Buff buff, int amount) {
		Field field = amountField(buff);
		if (field != null) setNumber(buff, field, Math.max(0, amount));
	}

	/**
	 * One setting a status keeps, such as Healing's healing left or heal per turn: a number or an on/off field of the status itself.
	 */
	static final class Setting {
		final Field field;
		final String label;

		Setting(Field field, String label) {
			this.field = field;
			this.label = label;
		}

		boolean isSwitch() {
			return field.getType() == boolean.class;
		}

		boolean isDecimal() {
			return field.getType() == float.class;
		}
	}

	/**
	 * Every setting [buff] keeps, its amount first, leaving out its turns when those are edited on their own.
	 */
	static List<Setting> settings(Buff buff) {
		return shape(buff.getClass()).settings;
	}

	private static List<Setting> findSettings(Class<?> buffType, Field duration, Field amount, String[] amountDef) {
		List<Setting> settings = new ArrayList<>();
		for (Class<?> type = buffType; type != null && type != Buff.class; type = type.getSuperclass()) {
			for (Field field : type.getDeclaredFields()) {
				int modifiers = field.getModifiers();
				Class<?> kind = field.getType();
				if (java.lang.reflect.Modifier.isStatic(modifiers) || java.lang.reflect.Modifier.isFinal(modifiers) || field.isSynthetic()) continue;
				if (kind != int.class && kind != float.class && kind != boolean.class || field.equals(duration)) continue;
				field.setAccessible(true);
				Setting setting = new Setting(field, field.equals(amount) ? amountDef[2] : words(field.getName()));
				if (field.equals(amount)) {
					settings.add(0, setting);
				} else {
					settings.add(setting);
				}
			}
		}
		return settings;
	}

	/**
	 * A field name written as words: percentHealPerTick becomes "Percent heal per tick".
	 */
	private static String words(String name) {
		String spaced = name.replaceAll("([a-z0-9])([A-Z])", "$1 $2").replace('_', ' ').toLowerCase(Locale.ENGLISH);
		return capitalize(spaced);
	}

	static float number(Buff buff, Field field) {
		try {
			return field.getType() == int.class ? field.getInt(buff) : field.getFloat(buff);
		} catch (Throwable e) {
			return 0;
		}
	}

	static void setNumber(Buff buff, Field field, float value) {
		try {
			if (field.getType() == int.class) {
				field.setInt(buff, Math.round(value));
			} else {
				field.setFloat(buff, value);
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not set " + field.getName() + " of " + buff.getClass().getName(), e);
		}
		refreshIndicator();
	}

	static boolean isOn(Buff buff, Field field) {
		try {
			return field.getBoolean(buff);
		} catch (Throwable e) {
			return false;
		}
	}

	static void setOn(Buff buff, Field field, boolean on) {
		try {
			field.setBoolean(buff, on);
		} catch (Throwable e) {
			Log.e(TAG, "Could not set " + field.getName() + " of " + buff.getClass().getName(), e);
		}
		refreshIndicator();
	}

	static String turnsOf(Buff buff) {
		try {
			String text = buff.iconTextDisplay();
			if (text != null && !text.isEmpty()) return text;
		} catch (Throwable ignored) {
		}
		return "";
	}

	/**
	 * The status of class [className] in the catalog, or null when there is none.
	 */
	static Entry entry(String className) {
		for (Entry entry : catalog()) {
			if (entry.type.getName().equals(className)) return entry;
		}
		return null;
	}

	static int iconOf(Buff buff) {
		try {
			return buff.icon();
		} catch (Throwable e) {
			return NO_ICON;
		}
	}

	private static String capitalize(String text) {
		return Character.toUpperCase(text.charAt(0)) + text.substring(1);
	}

	private static void refreshIndicator() {
		try {
			BuffIndicator.refreshHero();
		} catch (Throwable ignored) {
		}
	}
}
