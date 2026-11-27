package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.SPDSettings;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.watabou.noosa.Game;
import com.watabou.noosa.Visual;
import com.watabou.noosa.ui.Component;
import com.watabou.utils.PlatformSupport;
import com.watabou.utils.RectF;

/**
 * Where on-screen buttons can go without covering the game's toolbar.
 */
final class ScreenLayout {

	private static final int GAP = 4;

	private static Object cachedScene;
	private static int cachedWidth;
	private static int cachedHeight;
	private static float[] cachedInsets;
	private static float cachedStatusTop;
	private static final int STATUS_SPACE = 40;

	private ScreenLayout() {
	}

	/**
	 * The lowest y on the UI camera that buttons can reach, just above the toolbar and any extra quickslot row.
	 */
	static float aboveToolbar() {
		return toolbarTop() - GAP;
	}

	/**
	 * The top of the toolbar on the UI camera, including any extra quickslot row.
	 */
	static float toolbarTop() {
		float fallback = PixelScene.uiCamera.height - insets()[3] - QuickslotRow.toolbarHeight();
		Object toolbar = Reflect.gameScenePart("toolbar");
		return toolbar instanceof Component ? Math.min(fallback, ((Component) toolbar).top()) : fallback;
	}

	/**
	 * The highest y on the UI camera below the hero's status pane.
	 */
	static float belowStatus() {
		Object status = Reflect.gameScenePart("status");
		return status instanceof Component ? ((Component) status).bottom() + GAP : STATUS_SPACE;
	}

	/**
	 * Where the game puts the top of its status pane: just below large cutouts and the top display margin, the same rule
	 * GameScene uses.
	 */
	static float statusTop() {
		refresh();
		return cachedStatusTop;
	}

	/**
	 * Where [event] is, in the interface camera's coordinates.
	 */
	static com.watabou.utils.PointF toUi(com.watabou.input.PointerEvent event) {
		return PixelScene.uiCamera.screenToCamera((int) event.current.x, (int) event.current.y);
	}

	static final int ORIGIN_GAP = 2;
	private static final float[] FALLBACK_ORIGINS = { 54, 86, 44 };
	private static final String ORIGINS_KEY = "display_tag_origins_";
	private static float[] lastOrigins;

	/**
	 * Where a tag's position 0 is along each edge, on the UI camera, as left, top and right: 2 pixels past the game's interface there. On
	 * the left that is below the turn timer circle under the hero's portrait, along the top it is past the end of the health bar, and on
	 * the right it is below the visible enemies counter. They are measured from the game screen, and the last measurement is kept for
	 * the main menu.
	 */
	static float[] tagOrigins() {
		float[] measured = measureOrigins();
		if (measured != null) {
			rememberOrigins(measured);
			return measured;
		}
		if (lastOrigins != null) return lastOrigins.clone();
		float[] stored = parseOrigins(CloverlordSettings.getString(ORIGINS_KEY + SPDSettings.interfaceSize()));
		lastOrigins = stored != null ? stored : FALLBACK_ORIGINS.clone();
		return lastOrigins.clone();
	}

	private static float[] measureOrigins() {
		try {
			Object status = Reflect.gameScenePart("status");
			Object menu = Reflect.gameScenePart("menu");
			if (!(status instanceof Component) || !(menu instanceof Component) || ((Component) status).width() <= 0) return null;
			float left = 0;
			Object busy = Reflect.get(status.getClass(), status, "busy");
			if (busy instanceof Visual) left = ((Visual) busy).y + ((Visual) busy).height();
			Object timer = Reflect.get(status.getClass(), status, "counter");
			if (timer instanceof Visual) left = Math.max(left, ((Visual) timer).y + (Float) Reflect.get(timer.getClass(), timer, "rad"));
			float top = 0;
			Object bar = Reflect.get(status.getClass(), status, "hpCutout");
			if (bar instanceof Visual) top = ((Visual) bar).x + ((Visual) bar).width();
			Object hp = Reflect.get(status.getClass(), status, "hp");
			Object barWidth = Reflect.getStatic(status.getClass(), "hpBarMaxWidth");
			if (hp instanceof Visual && barWidth instanceof Integer) top = Math.max(top, ((Visual) hp).x + (Integer) barWidth);
			Object danger = Reflect.get(menu.getClass(), menu, "danger");
			float right = danger instanceof Component ? ((Component) danger).bottom() : ((Component) menu).bottom();
			if (left <= 0 || top <= 0 || right <= 0) return null;
			return new float[] { left + ORIGIN_GAP, top + ORIGIN_GAP, right + ORIGIN_GAP };
		} catch (Throwable e) {
			return null;
		}
	}

	private static void rememberOrigins(float[] origins) {
		if (lastOrigins != null && java.util.Arrays.equals(lastOrigins, origins)) return;
		lastOrigins = origins.clone();
		CloverlordSettings.setString(ORIGINS_KEY + SPDSettings.interfaceSize(), Math.round(origins[0]) + "," + Math.round(origins[1]) + "," + Math.round(origins[2]));
	}

	private static float[] parseOrigins(String text) {
		if (text == null) return null;
		String[] parts = text.split(",");
		if (parts.length != 3) return null;
		try {
			return new float[] { Float.parseFloat(parts[0]), Float.parseFloat(parts[1]), Float.parseFloat(parts[2]) };
		} catch (NumberFormatException e) {
			return null;
		}
	}

	/**
	 * How far in from each screen edge buttons and tags must stay on the UI camera, as left, top, right and bottom. It covers the phone's
	 * notches and bars and the display margins. The top uses large cutouts only, the same as the game's status pane and menu buttons, so a
	 * small camera hole doesn't push top tags down; the other edges follow the game's getCommonInsets, like its own tags.
	 */
	static float[] insets() {
		refresh();
		return cachedInsets.clone();
	}

	/**
	 * Works out the insets again when the screen has been laid out since last time. Android looks them up from the window each time it's
	 * asked, and they only change when the screen is laid out again: a new scene, which rotating, resizing, fullscreen and the display
	 * margins all cause, or a new screen size.
	 */
	private static synchronized void refresh() {
		Object scene = Game.scene();
		if (cachedInsets != null && scene == cachedScene && Game.width == cachedWidth && Game.height == cachedHeight) return;
		cachedScene = scene;
		cachedWidth = Game.width;
		cachedHeight = Game.height;
		float zoom = PixelScene.defaultZoom;
		float largeTop = 0;
		try {
			largeTop = Game.platform.getSafeInsets(PlatformSupport.INSET_LRG).top / zoom;
			cachedStatusTop = largeTop > 0 ? largeTop : SPDSettings.interfaceSize() == 0 ? -1 : 0;
		} catch (Throwable e) {
			cachedStatusTop = 0;
		}
		try {
			RectF all = Game.platform.getSafeInsets(PlatformSupport.INSET_ALL);
			RectF blocking = Game.platform.getSafeInsets(PlatformSupport.INSET_BLK);
			cachedInsets = new float[] { blocking.left / zoom, largeTop, blocking.right / zoom, all.bottom / zoom };
		} catch (Throwable e) {
			cachedInsets = new float[4];
		}
	}
}
