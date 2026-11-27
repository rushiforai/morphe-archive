package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Game;
import com.watabou.noosa.PointerArea;
import com.watabou.noosa.Scene;

/**
 * A quick fade of the whole screen toward or back from black, over everything in the scene.
 */
final class ScreenFade extends ColorBlock {

	private static final int BLACK = 0xFF000000;

	private final float from;
	private final float to;
	private final float seconds;
	private Runnable whenDone;
	private float time;

	private ScreenFade(float from, float to, float seconds, Runnable whenDone) {
		super(PixelScene.uiCamera.width, PixelScene.uiCamera.height, BLACK);
		this.from = from;
		this.to = to;
		this.seconds = seconds;
		this.whenDone = whenDone;
		camera = PixelScene.uiCamera;
		alpha(from);
	}

	/**
	 * Darkens [scene] over [seconds] until black covers it at [darkness], from 0 to 1, ignoring taps meanwhile, then runs [whenDone]. The
	 * screen stays that dark afterwards.
	 */
	static void out(Scene scene, float seconds, float darkness, Runnable whenDone) {
		PointerArea blocker = new PointerArea(0, 0, PixelScene.uiCamera.width, PixelScene.uiCamera.height);
		blocker.blockLevel = PointerArea.ALWAYS_BLOCK;
		blocker.camera = PixelScene.uiCamera;
		scene.addToFront(blocker);
		scene.addToFront(new ScreenFade(0, darkness, seconds, whenDone));
	}

	/**
	 * Brightens [scene] over [seconds], from black covering it at [darkness] to none.
	 */
	static void in(Scene scene, float seconds, float darkness) {
		scene.addToFront(new ScreenFade(darkness, 0, seconds, null));
	}

	@Override
	public void update() {
		super.update();
		time = Math.min(seconds, time + Game.elapsed);
		alpha(from + (to - from) * time / seconds);
		if (time < seconds) return;
		Runnable done = whenDone;
		whenDone = null;
		if (done != null) {
			done.run();
			return;
		}
		if (to == 0) killAndErase();
	}
}
