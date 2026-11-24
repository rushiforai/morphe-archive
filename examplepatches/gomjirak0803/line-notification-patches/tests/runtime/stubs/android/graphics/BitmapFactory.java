package android.graphics;

public final class BitmapFactory {
    public static final class Options {
        public boolean inJustDecodeBounds;
        public int outWidth;
        public int outHeight;
        public int inSampleSize = 1;
        public Bitmap.Config inPreferredConfig;
    }

    public static Bitmap decodeFile(String pathName, Options opts) {
        if (opts != null && opts.inJustDecodeBounds) {
            opts.outWidth = 64;
            opts.outHeight = 64;
            return null;
        }
        return Bitmap.createBitmap(64, 64, Bitmap.Config.ARGB_8888);
    }
}
