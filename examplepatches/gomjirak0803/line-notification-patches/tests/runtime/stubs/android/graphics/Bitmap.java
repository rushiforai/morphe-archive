package android.graphics;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.IOException;
import java.io.OutputStream;

public final class Bitmap implements Parcelable {
    public enum Config { ARGB_8888 }
    public enum CompressFormat { PNG, JPEG }

    private final int width;
    private final int height;
    private boolean recycled;

    private Bitmap(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public static Bitmap createBitmap(int width, int height, Config config) {
        return new Bitmap(Math.max(1, width), Math.max(1, height));
    }

    public static Bitmap createBitmap(Bitmap src, int x, int y, int width, int height, Matrix m, boolean filter) {
        return new Bitmap(width, height);
    }

    public static Bitmap createScaledBitmap(Bitmap src, int dstWidth, int dstHeight, boolean filter) {
        if (src != null && src.width == dstWidth && src.height == dstHeight) return src;
        return new Bitmap(Math.max(1, dstWidth), Math.max(1, dstHeight));
    }

    public int getWidth() { return width; }
    public int getHeight() { return height; }
    public boolean isRecycled() { return recycled; }
    public void recycle() { recycled = true; }
    public Bitmap copy(Config config, boolean isMutable) { return new Bitmap(width, height); }
    public boolean compress(CompressFormat format, int quality, OutputStream stream) {
        if (stream == null) return false;
        try {
            stream.write(new byte[]{1, 2, 3, 4});
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    @Override public int describeContents() { return 0; }
    @Override public void writeToParcel(Parcel dest, int flags) {}
}
