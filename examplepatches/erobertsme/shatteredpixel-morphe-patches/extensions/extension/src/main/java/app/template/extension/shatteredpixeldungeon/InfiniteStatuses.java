package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.FlavourBuff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.ShieldBuff;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.watabou.utils.Bundle;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Statuses marked infinite never run out, and are put back straight away if anything removes them.
 */
@SuppressWarnings("unused")
public final class InfiniteStatuses {

	private static final String TAG = "InfiniteStatuses";
	private static final String KEY = "morphe_extras_infinite_statuses";
	private static final int FLAVOUR_TURNS = 9999;

	private static final Map<Class<? extends Buff>, Integer> pinned = new LinkedHashMap<>();
	private static boolean bypass;
	private static boolean restoring;
	private static Object removingTarget;
	private static Object removingBuff;

	private InfiniteStatuses() {
	}

	static boolean isInfinite(Class<?> type) {
		return pinned.containsKey(type);
	}

	static void setInfinite(Buff buff, boolean infinite) {
		if (!infinite) {
			pinned.remove(buff.getClass());
			return;
		}
		int value = buff instanceof ShieldBuff ? ((ShieldBuff) buff).shielding() : StatusEditor.turnsValue(buff);
		pinned.put(buff.getClass(), Math.max(1, value));
		refresh(buff);
	}

	static void pin(Class<? extends Buff> type, int value) {
		pinned.put(type, Math.max(1, value));
	}

	static void removeForever(Buff buff) {
		pinned.remove(buff.getClass());
		bypass = true;
		try {
			StatusEditor.remove(buff);
		} finally {
			bypass = false;
		}
	}

	static void reset() {
		pinned.clear();
	}

	static void store(Bundle bundle) {
		StringBuilder builder = new StringBuilder();
		for (Map.Entry<Class<? extends Buff>, Integer> entry : pinned.entrySet()) {
			if (builder.length() > 0) builder.append(';');
			builder.append(entry.getKey().getName()).append('=').append(entry.getValue());
		}
		bundle.put(KEY, builder.toString());
	}

	@SuppressWarnings("unchecked")
	static void restore(Bundle bundle) {
		pinned.clear();
		String value = bundle.getString(KEY);
		if (value == null || value.isEmpty()) return;
		for (String part : value.split(";")) {
			String[] pair = part.split("=");
			if (pair.length != 2) continue;
			try {
				Class<?> type = Reflect.require(pair[0]);
				if (Buff.class.isAssignableFrom(type)) pinned.put((Class<? extends Buff>) type, Integer.parseInt(pair[1]));
			} catch (Throwable ignored) {
			}
		}
	}

	/**
	 * Called at the start of Hero.act. Tops up infinite statuses and puts back any that are missing.
	 */
	public static void onHeroAct(Object hero) {
		if (pinned.isEmpty() || hero != Dungeon.hero) return;
		Hero h = (Hero) hero;
		if (!h.isAlive()) return;
		for (Map.Entry<Class<? extends Buff>, Integer> entry : new ArrayList<>(pinned.entrySet())) {
			Buff buff = find(h, entry.getKey());
			if (buff == null) buff = reapply(h, entry.getKey());
			if (buff != null) refresh(buff);
		}
	}

	/**
	 * Called at the start of Char.remove(Buff).
	 */
	public static void beforeRemove(Object target, Object buff) {
		removingTarget = target;
		removingBuff = buff;
	}

	/**
	 * Called before Char.remove(Buff) returns. Puts an infinite status back on the hero straight away.
	 */
	public static boolean afterRemove(boolean removed) {
		Object target = removingTarget;
		Object buff = removingBuff;
		removingTarget = null;
		removingBuff = null;
		if (bypass || restoring || target != Dungeon.hero || !(buff instanceof Buff)) return removed;
		Hero hero = (Hero) target;
		if (!hero.isAlive() || !pinned.containsKey(buff.getClass())) return removed;
		if (find(hero, ((Buff) buff).getClass()) != null) return removed;

		Buff replacement = reapply(hero, ((Buff) buff).getClass());
		if (replacement != null) refresh(replacement);
		return removed;
	}

	private static Buff find(Hero hero, Class<? extends Buff> type) {
		for (Buff buff : hero.buffs()) {
			if (buff.getClass() == type) return buff;
		}
		return null;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private static Buff reapply(Hero hero, Class<? extends Buff> type) {
		restoring = true;
		try {
			return Buff.affect(hero, (Class) type);
		} catch (Throwable e) {
			Log.e(TAG, "Could not reapply " + type.getName(), e);
			return null;
		} finally {
			restoring = false;
		}
	}

	private static void refresh(Buff buff) {
		Integer value = pinned.get(buff.getClass());
		if (value == null) return;
		if (buff instanceof ShieldBuff) {
			((ShieldBuff) buff).setShield(value);
			StatusEditor.keepScheduled(buff);
			return;
		}
		if (buff instanceof FlavourBuff) {
			StatusEditor.setTurns(buff, FLAVOUR_TURNS);
			return;
		}
		if (StatusEditor.hasDurationField(buff)) {
			StatusEditor.setTurns(buff, value);
			return;
		}
		StatusEditor.keepScheduled(buff);
	}
}
