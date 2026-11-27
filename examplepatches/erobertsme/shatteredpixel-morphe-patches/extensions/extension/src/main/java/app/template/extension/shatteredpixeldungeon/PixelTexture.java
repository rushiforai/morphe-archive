package app.template.extension.shatteredpixeldungeon;

import com.watabou.gltextures.SmartTexture;
import com.watabou.gltextures.TextureCache;
import com.watabou.glwrap.Texture;

import java.lang.reflect.Method;
import java.nio.ByteBuffer;

/**
 * Game textures made from pixels the patches drew or loaded themselves, scaled up crisp like the game's own sprites.
 */
final class PixelTexture {

	private static final int BYTES_PER_PIXEL = 4;

	private PixelTexture() {
	}

	/**
	 * Makes the texture for [key] from [argb], [width] by [height] unpremultiplied pixels row by row. Use a key that isn't a String: the
	 * game's texture cache treats String keys it doesn't hold as files to load. Returns false when it can't be made.
	 */
	static boolean create(Object key, int width, int height, int[] argb) throws ReflectiveOperationException {
		SmartTexture texture = TextureCache.create(key, width, height);
		texture.filter(Texture.NEAREST, Texture.NEAREST);
		ByteBuffer buffer = pixelBuffer(Reflect.get(SmartTexture.class, texture, "bitmap"), width * height * BYTES_PER_PIXEL);
		buffer.rewind();
		for (int pixel : argb) {
			buffer.put((byte) (pixel >> 16));
			buffer.put((byte) (pixel >> 8));
			buffer.put((byte) pixel);
			buffer.put((byte) (pixel >>> 24));
		}
		buffer.rewind();
		return true;
	}

	/**
	 * The pixel memory of a texture's picture, found by what it returns since the picture class is renamed in the game. The texture is only
	 * sent to the graphics card the first time it's drawn, so filling it before then is enough.
	 */
	private static ByteBuffer pixelBuffer(Object pixmap, int bytes) throws ReflectiveOperationException {
		for (Method method : pixmap.getClass().getMethods()) {
			if (method.getParameterTypes().length == 0 && method.getReturnType() == ByteBuffer.class) {
				ByteBuffer buffer = (ByteBuffer) method.invoke(pixmap);
				if (buffer != null && buffer.capacity() >= bytes) return buffer;
			}
		}
		throw new NoSuchMethodException("No pixel buffer on " + pixmap.getClass().getName());
	}
}
