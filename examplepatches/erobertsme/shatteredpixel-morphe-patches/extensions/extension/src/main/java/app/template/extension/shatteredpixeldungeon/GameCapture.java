package app.template.extension.shatteredpixeldungeon;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.watabou.noosa.Camera;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Group;
import com.watabou.utils.Point;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Keeps a picture of the dungeon around the hero, taken from the game's own drawing as it happens. A marker sits in the game scene just
 * after the fog and spell effects, before the floating text, health bars and emote icons, so when it is drawn only the dungeon is on the
 * game's drawing surface: no damage numbers, status pane, toolbar, windows or margins, and nothing outside the game. The pixels are read back from the game's own surface, scaled back to one pixel per game pixel, and saved.
 */
public final class GameCapture {

	private static final String TAG = "GameCapture";
	static final int AREA_TILES = 11;
	private static final int TILE = 16;
	private static final int SIZE = AREA_TILES * TILE;
	private static final int OPAQUE_BLACK = 0xFF000000;

	private static final List<File> pending = new ArrayList<>();
	private static final ExecutorService writer = Executors.newSingleThreadExecutor(task -> {
		Thread thread = new Thread(task, "dungeon-picture");
		thread.setDaemon(true);
		thread.setPriority(Thread.MIN_PRIORITY);
		return thread;
	});

	private GameCapture() {
	}

	/**
	 * Called at the end of GameScene.create. Puts the marker just before the floating text.
	 */
	@SuppressWarnings("unchecked")
	public static void onSceneCreated(Object scene) {
		if (!(scene instanceof Group)) return;
		try {
			Object floatingText = Reflect.gameScenePart("statuses");
			Group group = (Group) scene;
			List<Gizmo> members = Reflect.members(group);
			int index = members.indexOf(floatingText);
			if (index < 0) return;
			Gizmo marker = new Gizmo() {
				@Override
				public void draw() {
					if (pending.isEmpty()) return;
					List<File> targets = new ArrayList<>(pending);
					pending.clear();
					capture(targets);
				}
			};
			group.add(marker);
			members.remove(marker);
			members.add(index, marker);
		} catch (Throwable e) {
			Log.e(TAG, "Could not set up the dungeon picture", e);
		}
	}

	/**
	 * Saves a picture of the dungeon around the hero to [target] the next time the game draws. Called on the render thread.
	 */
	static void request(File target) {
		pending.add(target);
	}

	private static void capture(List<File> targets) {
		try {
			int[] pixels = read();
			if (pixels == null) return;
			writer.execute(() -> write(pixels, targets));
		} catch (Throwable e) {
			Log.e(TAG, "Could not take the dungeon picture", e);
		}
	}

	/**
	 * The dungeon around the hero as drawn so far this frame, one pixel per game pixel, black where it is off screen.
	 */
	private static int[] read() {
		Hero hero = Dungeon.hero;
		Level level = Dungeon.level;
		Camera camera = Camera.main;
		if (hero == null || level == null || camera == null) return null;
		int width = level.width();
		float worldLeft = (hero.pos % width - AREA_TILES / 2) * TILE;
		float worldTop = (hero.pos / width - AREA_TILES / 2) * TILE;
		Point corner = camera.cameraToScreen(worldLeft, worldTop);
		float zoom = camera.zoom;
		int screenSize = Math.round(SIZE * zoom);
		int left = Math.max(0, corner.x);
		int top = Math.max(0, corner.y);
		int right = Math.min(Game.width, corner.x + screenSize);
		int bottom = Math.min(Game.height, corner.y + screenSize);
		if (right <= left || bottom <= top) return null;

		int readWidth = right - left;
		ByteBuffer buffer = ByteBuffer.allocateDirect(readWidth * (bottom - top) * 4).order(ByteOrder.nativeOrder());
		GLES20.glReadPixels(left, Game.height - bottom, readWidth, bottom - top, GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE, buffer);

		int[] pixels = new int[SIZE * SIZE];
		for (int y = 0; y < SIZE; y++) {
			int screenY = (int) (corner.y + (y + 0.5f) * zoom);
			for (int x = 0; x < SIZE; x++) {
				int screenX = (int) (corner.x + (x + 0.5f) * zoom);
				if (screenX < left || screenX >= right || screenY < top || screenY >= bottom) {
					pixels[y * SIZE + x] = OPAQUE_BLACK;
					continue;
				}
				int at = ((bottom - 1 - screenY) * readWidth + (screenX - left)) * 4;
				pixels[y * SIZE + x] = OPAQUE_BLACK | (buffer.get(at) & 0xFF) << 16 | (buffer.get(at + 1) & 0xFF) << 8 | buffer.get(at + 2) & 0xFF;
			}
		}
		return pixels;
	}

	private static void write(int[] pixels, List<File> targets) {
		Bitmap bitmap = Bitmap.createBitmap(pixels, SIZE, SIZE, Bitmap.Config.ARGB_8888);
		try {
			ByteArrayOutputStream png = new ByteArrayOutputStream();
			bitmap.compress(Bitmap.CompressFormat.PNG, 100, png);
			byte[] data = png.toByteArray();
			for (File target : targets) {
				File folder = target.getParentFile();
				if (folder == null || !folder.isDirectory()) continue;
				try (OutputStream out = new FileOutputStream(target)) {
					out.write(data);
				}
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not save the dungeon picture", e);
		} finally {
			bitmap.recycle();
		}
	}
}
