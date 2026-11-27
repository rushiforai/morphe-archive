package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.noosa.Game;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Reroll Catalyst: a button on the alchemy table's trinket choice window that spends energy on a new set of trinkets.
 */
@SuppressWarnings("unused")
public final class RerollCatalyst {

	private static final String KEY_OFF = "qol_reroll_catalyst_off";
	private static final String ALCHEMY_SCENE = "com.shatteredpixel.shatteredpixeldungeon.scenes.AlchemyScene";
	private static final int COST = 5;
	private static final int BTN_HEIGHT = 18;
	private static final int GAP = 2;

	private static Object pendingCatalyst;

	private RerollCatalyst() {
	}

	static boolean isOn() {
		return QolSettings.isAvailable() && !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
	}

	/**
	 * Called at the start of the trinket choice window's constructor with the catalyst being transformed.
	 */
	public static void beforeTrinketWindow(Object catalyst) {
		pendingCatalyst = catalyst;
	}

	/**
	 * Called at the end of the trinket choice window's constructor.
	 */
	public static void afterTrinketWindow(Object window) {
		Object catalyst = pendingCatalyst;
		pendingCatalyst = null;
		if (catalyst == null || !isOn() || !(window instanceof Window)) return;
		if (Game.scene() == null || !Game.scene().getClass().getName().equals(ALCHEMY_SCENE)) return;
		try {
			Window target = (Window) window;
			int width = Reflect.width(target);
			int height = Reflect.height(target);
			RedButton reroll = new RedButton("Reroll " + COST) {
				@Override
				public void onClick() {
					reroll(target, catalyst);
				}

				@Override
				public void layout() {
					super.layout();
					if (icon() == null || text == null) return;
					float start = icon().x;
					text.setPos(start, text.top());
					icon().x = text.right() + 1;
				}
			};
			reroll.icon(Icons.get(Icons.ENERGY_SML));
			reroll.enable(Dungeon.energy >= COST);
			reroll.setRect(0, height + GAP, width, BTN_HEIGHT);
			target.add(reroll);
			target.resize(width, height + GAP + BTN_HEIGHT);
		} catch (Throwable e) {
			Log.e("RerollCatalyst", "Could not add the reroll button", e);
		}
	}

	private static void reroll(Window window, Object catalyst) {
		if (Dungeon.energy < COST) return;
		try {
			Field rolled = Reflect.field(catalyst.getClass(), "rolledTrinkets");
			((List<?>) rolled.get(catalyst)).clear();
			Dungeon.energy -= COST;
			window.hide();
			Object next = window.getClass().getConstructor(catalyst.getClass()).newInstance(catalyst);
			Game.scene().addToFront((Window) next);
			Object scene = Game.scene();
			if (scene.getClass().getName().equals(ALCHEMY_SCENE)) Reflect.method(scene.getClass(), "createEnergy").invoke(scene);
		} catch (Throwable e) {
			Log.e("RerollCatalyst", "Could not reroll the catalyst", e);
		}
	}
}
