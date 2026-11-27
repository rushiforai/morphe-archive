package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * A status to give a character, with everything it keeps: how many turns it lasts, whether it lasts forever for your hero, and every
 * other setting such as Healing's healing left and heal per turn. Adding a status and a quick tag that applies one both use it, so they
 * offer the same settings.
 */
final class StatusRecipe {

	private static final String TAG = "StatusRecipe";
	private static final String PREFIX = "status:";
	private static final String INFINITE = "infinite";
	private static final String OLD_AMOUNT = "amount";
	private static final int DEFAULT_TURNS = 20;

	private static int lastTurns = DEFAULT_TURNS;
	private static boolean lastInfinite;

	final StatusEditor.Entry entry;
	final Buff sample;
	private int turns;
	private boolean infinite;

	/**
	 * A new recipe for [entry], starting from the turns and Infinite last chosen.
	 */
	StatusRecipe(StatusEditor.Entry entry) {
		this(entry, lastTurns, lastInfinite);
	}

	private StatusRecipe(StatusEditor.Entry entry, int turns, boolean infinite) {
		this.entry = entry;
		this.turns = turns;
		this.infinite = infinite;
		this.sample = StatusEditor.prepared(entry.type, turns);
	}

	int turns() {
		return turns;
	}

	void turns(int value) {
		turns = Math.max(1, Math.min(9999, value));
		lastTurns = turns;
	}

	boolean infinite() {
		return infinite;
	}

	void infinite(boolean value) {
		infinite = value;
		lastInfinite = value;
	}

	/**
	 * Gives [ch] the status with every setting, as if it had just been added and then edited.
	 */
	void apply(Char ch) {
		StatusEditor.add(ch, entry.type, turns);
		if (infinite && ch == Dungeon.hero) InfiniteStatuses.pin(entry.type, turns);
		Buff buff = ch.buff(entry.type);
		if (buff == null) return;
		for (StatusEditor.Setting setting : StatusEditor.settings(sample)) {
			if (setting.isSwitch()) {
				StatusEditor.setOn(buff, setting.field, StatusEditor.isOn(sample, setting.field));
			} else {
				StatusEditor.setNumber(buff, setting.field, StatusEditor.number(sample, setting.field));
			}
		}
	}

	/**
	 * What the recipe gives, like "Haste (20 turns)" or "Healing (healing left 30)".
	 */
	String describe() {
		List<String> parts = new ArrayList<>();
		if (infinite) parts.add("infinite");
		else if (StatusEditor.isTurnsEditable(sample)) parts.add(turns + " turns");
		String amount = StatusEditor.amountLabel(entry.type);
		if (amount != null) parts.add(amount.toLowerCase(Locale.ENGLISH) + " " + Math.round(StatusEditor.amount(sample)));
		return parts.isEmpty() ? entry.name : entry.name + " (" + String.join(", ", parts) + ")";
	}

	/**
	 * The recipe written as a quick tag action id, read back with [parse].
	 */
	String id() {
		StringBuilder id = new StringBuilder(PREFIX).append(entry.type.getName()).append(':').append(turns);
		if (infinite) id.append(':').append(INFINITE);
		for (StatusEditor.Setting setting : StatusEditor.settings(sample)) {
			id.append(':').append(setting.field.getName()).append('=');
			if (setting.isSwitch()) {
				id.append(StatusEditor.isOn(sample, setting.field));
			} else if (setting.isDecimal()) {
				id.append(StatusEditor.number(sample, setting.field));
			} else {
				id.append(Math.round(StatusEditor.number(sample, setting.field)));
			}
		}
		return id.toString();
	}

	static boolean isId(String id) {
		return id != null && id.startsWith(PREFIX);
	}

	/**
	 * The recipe an [id] stands for, or null when it is broken or its status no longer exists.
	 */
	static StatusRecipe parse(String id) {
		if (!isId(id)) return null;
		String[] parts = id.substring(PREFIX.length()).split(":");
		StatusEditor.Entry entry = parts.length < 2 ? null : StatusEditor.entry(parts[0]);
		if (entry == null) return null;
		try {
			StatusRecipe recipe = new StatusRecipe(entry, Math.max(1, Integer.parseInt(parts[1])), false);
			for (int i = 2; i < parts.length; i++) recipe.read(parts[i]);
			return recipe;
		} catch (Throwable e) {
			Log.e(TAG, "Could not read " + id, e);
			return null;
		}
	}

	private void read(String part) {
		if (part.equals(INFINITE)) {
			infinite = true;
			return;
		}
		int equals = part.indexOf('=');
		if (equals < 0) {
			if (part.startsWith(OLD_AMOUNT)) StatusEditor.setAmount(sample, Integer.parseInt(part.substring(OLD_AMOUNT.length())));
			return;
		}
		String name = part.substring(0, equals);
		String value = part.substring(equals + 1);
		for (StatusEditor.Setting setting : StatusEditor.settings(sample)) {
			if (!setting.field.getName().equals(name)) continue;
			if (setting.isSwitch()) {
				StatusEditor.setOn(sample, setting.field, Boolean.parseBoolean(value));
			} else {
				StatusEditor.setNumber(sample, setting.field, Float.parseFloat(value));
			}
			return;
		}
	}
}
