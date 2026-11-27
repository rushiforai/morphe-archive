package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Mageroyal cures everything: stepping on one removes every harmful status effect, not just the few the game cures.
 */
@SuppressWarnings("unused")
public final class MageroyalCure {

	private static final String KEY_OFF = "qol_mageroyal_cure_off";
	private static final Set<String> KEPT = new HashSet<>(Arrays.asList("LostInventory", "Corruption"));

	private MageroyalCure() {
	}

	static boolean isOn() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
	}

	/**
	 * Called at the start of Mageroyal.activate with whoever stepped on it.
	 */
	public static void beforeActivate(Object target) {
		if (!(target instanceof Char) || !isOn()) return;
		try {
			for (Buff buff : new ArrayList<>(((Char) target).buffs())) {
				if (buff == null || buff.type != Buff.buffType.NEGATIVE) continue;
				if (KEPT.contains(buff.getClass().getSimpleName())) continue;
				buff.detach();
			}
		} catch (Throwable e) {
			Log.e("MageroyalCure", "Could not clear the status effects", e);
		}
	}
}
