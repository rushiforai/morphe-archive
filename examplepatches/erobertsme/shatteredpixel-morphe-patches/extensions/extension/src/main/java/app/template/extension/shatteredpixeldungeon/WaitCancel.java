package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.watabou.noosa.Game;
import com.watabou.noosa.ui.Component;

/**
 * While the hero rests or walks somewhere more than a step away, the wait button turns into a Cancel button that stops them.
 */
public final class WaitCancel {

	private static final String TAG = "WaitCancel";

	private static volatile boolean shown;
	private static TintedButton button;

	private WaitCancel() {
	}

	/**
	 * Called at the start of Hero.act, once each turn the hero takes. Shows or hides the Cancel button when that changes.
	 */
	public static void onHeroAct(Object hero) {
		if (!QolSettings.isAvailable() || !(hero instanceof Hero)) return;
		boolean wanted = isRestingOrWalking((Hero) hero);
		if (wanted == shown) return;
		shown = wanted;
		Game.runOnRenderThread(WaitCancel::refresh);
	}

	/**
	 * Called on the render thread when the hero waits for your next action. Hides the Cancel button.
	 */
	static void onHeroReady() {
		if (!shown) return;
		shown = false;
		refresh();
	}

	private static boolean isRestingOrWalking(Hero hero) {
		if (hero.resting) return true;
		return hero.curAction != null && Dungeon.level != null && Grid.distance(hero.pos, hero.curAction.dst) > 1;
	}

	private static void refresh() {
		if (button != null) {
			button.killAndErase();
			button.destroy();
			button = null;
		}
		if (!shown) return;
		try {
			Object toolbar = Reflect.gameScenePart("toolbar");
			Object wait = toolbar == null ? null : Reflect.get(toolbar.getClass(), toolbar, "btnWait");
			if (!(wait instanceof Component) || Game.scene() == null) return;
			Component tool = (Component) wait;
			button = TintedButton.cancel("", WaitCancel::cancel);
			button.camera = PixelScene.uiCamera;
			button.setRect(tool.left(), tool.top(), tool.width(), tool.height());
			Game.scene().add(button);
		} catch (Throwable e) {
			Log.e(TAG, "Could not show the Cancel button", e);
		}
	}

	private static void cancel() {
		Hero hero = Dungeon.hero;
		if (hero != null) hero.interrupt();
		shown = false;
		refresh();
	}
}
