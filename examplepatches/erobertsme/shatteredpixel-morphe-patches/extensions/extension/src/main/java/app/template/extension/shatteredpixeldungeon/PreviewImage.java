package app.template.extension.shatteredpixeldungeon;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import com.watabou.gltextures.TextureCache;
import com.watabou.noosa.Image;

import java.io.File;

/**
 * A saved picture of the dungeon, shown in a save's preview. Only the one being shown is kept in memory.
 */
final class PreviewImage {

	private static final String TAG = "PreviewImage";

	private static Key shown;

	/**
	 * The texture cache's key for a picture file. Not a String, because the cache treats String keys it doesn't hold as files to load.
	 */
	private static final class Key {
		private final String path;
		private final long modified;

		Key(File file) {
			this.path = file.getAbsolutePath();
			this.modified = file.lastModified();
		}

		@Override
		public boolean equals(Object other) {
			return other instanceof Key && ((Key) other).path.equals(path) && ((Key) other).modified == modified;
		}

		@Override
		public int hashCode() {
			return path.hashCode() * 31 + (int) (modified ^ (modified >>> 32));
		}
	}

	private PreviewImage() {
	}

	/**
	 * The picture in [file], or null when there is none or it can't be read.
	 */
	static synchronized Image load(File file) {
		if (file == null || !file.isFile()) return null;
		Key key = new Key(file);
		if (!key.equals(shown)) {
			forget();
			if (!decode(key, file)) return null;
			shown = key;
		}
		return new Image(key);
	}

	private static boolean decode(Key key, File file) {
		Bitmap bitmap = BitmapFactory.decodeFile(file.getAbsolutePath());
		if (bitmap == null) return false;
		try {
			int width = bitmap.getWidth();
			int height = bitmap.getHeight();
			int[] pixels = new int[width * height];
			bitmap.getPixels(pixels, 0, width, 0, 0, width, height);
			return PixelTexture.create(key, width, height, pixels);
		} catch (Throwable e) {
			Log.e(TAG, "Could not show the dungeon picture", e);
			TextureCache.remove(key);
			return false;
		} finally {
			bitmap.recycle();
		}
	}

	private static void forget() {
		if (shown == null) return;
		TextureCache.remove(shown);
		shown = null;
	}
}
