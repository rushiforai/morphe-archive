package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.ShatteredPixelDungeon;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.watabou.noosa.Camera;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Game;
import com.watabou.utils.RectF;

/**
 * Display margins: shrinks the game inward from each screen edge by a number of pixels, for screens whose rounded corners or features cover
 * part of the game. The margins are added to the space the game already keeps clear for notches, so its buttons and windows move inward, and
 * the margins themselves are painted black.
 */
@SuppressWarnings("unused")
public final class DisplayMargins {

	enum Edge {
		TOP("Top"), BOTTOM("Bottom"), LEFT("Left"), RIGHT("Right");

		final String label;

		Edge(String label) {
			this.label = label;
		}

		String key() {
			return "display_margin_" + name().toLowerCase(java.util.Locale.US);
		}
	}

	static final int MAX = 300;
	static final int STEP = 2;
	private static final float OUTSIDE = 10000f;
	private static final int BLACK = 0xFF000000;

	private static ColorBlock[] bars;
	private static int[] margins;

	private DisplayMargins() {
	}

	/**
	 * The margins, read from the settings once and kept until they change.
	 */
	private static int[] margins() {
		int[] current = margins;
		if (current != null) return current;
		current = new int[Edge.values().length];
		if (QolSettings.isAvailable()) {
			for (Edge edge : Edge.values()) current[edge.ordinal()] = Math.max(0, Math.min(MAX, CloverlordSettings.getInt(edge.key())));
		}
		margins = current;
		return current;
	}

	static int get(Edge edge) {
		return margins()[edge.ordinal()];
	}

	static void set(Edge edge, int pixels) {
		CloverlordSettings.setInt(edge.key(), Math.max(0, Math.min(MAX, pixels)));
		margins = null;
		apply();
	}

	static void reset() {
		for (Edge edge : Edge.values()) CloverlordSettings.setInt(edge.key(), 0);
		margins = null;
		apply();
	}

	private static boolean any() {
		for (int margin : margins()) {
			if (margin > 0) return true;
		}
		return false;
	}

	/**
	 * Lays the current screen out again so the new margins take effect.
	 */
	private static void apply() {
		Game.runOnRenderThread(() -> {
			try {
				ShatteredPixelDungeon.seamlessResetScene();
			} catch (Throwable e) {
				Log.e("DisplayMargins", "Could not lay the screen out again", e);
			}
		});
	}

	/**
	 * Called with the space the game keeps clear at each screen edge. Returns it with the margins added.
	 */
	public static RectF adjustInsets(RectF insets) {
		if (insets == null) return null;
		try {
			insets.top += get(Edge.TOP);
			insets.bottom += get(Edge.BOTTOM);
			insets.left += get(Edge.LEFT);
			insets.right += get(Edge.RIGHT);
		} catch (Throwable e) {
			Log.e("DisplayMargins", "Could not add the margins", e);
		}
		return insets;
	}

	/**
	 * Called at the end of every screen's drawing. Paints the margins black over everything.
	 */
	public static void afterDraw(Object scene) {
		if (!any()) return;
		try {
			Camera ui = PixelScene.uiCamera;
			if (ui == null || ui.zoom <= 0) return;
			if (bars == null) {
				bars = new ColorBlock[4];
				for (int i = 0; i < bars.length; i++) bars[i] = new ColorBlock(1, 1, BLACK);
			}
			float zoom = ui.zoom;
			float top = (get(Edge.TOP) - ui.y) / zoom;
			float bottom = (Game.height - get(Edge.BOTTOM) - ui.y) / zoom;
			float left = (get(Edge.LEFT) - ui.x) / zoom;
			float right = (Game.width - get(Edge.RIGHT) - ui.x) / zoom;
			paint(bars[0], ui, -OUTSIDE, -OUTSIDE, 2 * OUTSIDE, OUTSIDE + top, get(Edge.TOP) > 0);
			paint(bars[1], ui, -OUTSIDE, bottom, 2 * OUTSIDE, OUTSIDE, get(Edge.BOTTOM) > 0);
			paint(bars[2], ui, -OUTSIDE, -OUTSIDE, OUTSIDE + left, 2 * OUTSIDE, get(Edge.LEFT) > 0);
			paint(bars[3], ui, right, -OUTSIDE, OUTSIDE, 2 * OUTSIDE, get(Edge.RIGHT) > 0);
		} catch (Throwable e) {
			Log.e("DisplayMargins", "Could not paint the margins", e);
		}
	}

	private static void paint(ColorBlock bar, Camera camera, float x, float y, float width, float height, boolean shown) {
		if (!shown) return;
		bar.camera = camera;
		bar.x = x;
		bar.y = y;
		bar.scale.x = width;
		bar.scale.y = height;
		bar.draw();
	}
}
