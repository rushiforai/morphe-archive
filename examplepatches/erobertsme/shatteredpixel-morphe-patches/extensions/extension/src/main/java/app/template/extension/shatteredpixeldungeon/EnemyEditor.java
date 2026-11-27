package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.AllyBuff;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.utils.Bundle;

import java.lang.reflect.Field;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Edits enemies, NPCs and other characters, and keeps alignment changes in their save data.
 */
@SuppressWarnings("unused")
public final class EnemyEditor {

	private static final String TAG = "EnemyEditor";
	private static final String KEY_ALIGNMENT = "morphe_extras_alignment";

	private static final Set<Char> editedAlignment = Collections.newSetFromMap(new WeakHashMap<>());
	private static final ArrayDeque<Object[]> restoring = new ArrayDeque<>();

	private EnemyEditor() {
	}

	static void setAlignment(Mob mob, Char.Alignment alignment) {
		if (alignment != Char.Alignment.ALLY) {
			for (Buff buff : new ArrayList<>(mob.buffs())) {
				if (buff instanceof AllyBuff) StatusEditor.remove(buff);
			}
		}
		mob.alignment = alignment;
		editedAlignment.add(mob);
	}

	static void setState(Mob mob, Mob.AiState state) {
		mob.state = state;
	}

	/**
	 * Lets the player pick a tile and sends [mob] there.
	 */
	static void chooseDestination(Mob mob) {
		CellPicker.pick("Choose where " + mob.name() + " should go", cell -> {
			if (mob.isAlive()) moveTo(mob, cell);
		});
	}

	private static void moveTo(Mob mob, int cell) {
		try {
			mob.clearEnemy();
			mob.state = mob.WANDERING;
			Field target = Reflect.field(Mob.class, "target");
			target.setInt(mob, cell);
		} catch (Throwable e) {
			Log.e(TAG, "Could not move " + mob.getClass().getName(), e);
		}
	}

	/**
	 * Lets the player pick a tile and teleports [mob] there.
	 */
	static void chooseTeleport(Mob mob) {
		CellPicker.pick("Choose where to teleport " + mob.name(), cell -> {
			if (mob.isAlive()) Teleport.toCell(mob, cell);
		});
	}

	static void defeat(Mob mob) {
		try {
			mob.die(null);
		} catch (Throwable e) {
			Log.e(TAG, "Could not defeat " + mob.getClass().getName(), e);
		}
	}

	/**
	 * Called at the end of Char.storeInBundle.
	 */
	public static void store(Object character, Bundle bundle) {
		if (!(character instanceof Char) || !editedAlignment.contains(character)) return;
		Char.Alignment alignment = ((Char) character).alignment;
		if (alignment != null) bundle.put(KEY_ALIGNMENT, alignment.name());
	}

	/**
	 * Called at the start of Char.restoreFromBundle, which reuses its parameter registers before returning.
	 */
	public static void beforeRestore(Object character, Bundle bundle) {
		restoring.push(new Object[] { character, bundle });
	}

	/**
	 * Called at the end of Char.restoreFromBundle.
	 */
	public static void afterRestore() {
		if (restoring.isEmpty()) return;
		Object[] entry = restoring.pop();
		restore(entry[0], (Bundle) entry[1]);
	}

	private static void restore(Object character, Bundle bundle) {
		if (!(character instanceof Mob)) return;
		String value = bundle.getString(KEY_ALIGNMENT);
		if (value == null || value.isEmpty()) return;
		try {
			((Mob) character).alignment = Char.Alignment.valueOf(value);
			editedAlignment.add((Char) character);
		} catch (IllegalArgumentException ignored) {
		}
	}

	/**
	 * Adds an Edit button to a creature's info window.
	 */
	static void decorateInfo(Window window, Object mob) {
		if (!EditorSwitches.enemy() || !(mob instanceof Mob)) return;
		try {
			WindowHeader.addEdit(window, () -> {
				window.hide();
				EnemyWindow.open((Mob) mob, EnemyWindow.TAB_STATS, 0);
			});
		} catch (Exception e) {
			Log.e(TAG, "Could not add the edit button", e);
		}
	}
}
