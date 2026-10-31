package X;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Typeface;

import java.io.File;
import java.io.FileWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

import dalvik.system.DexFile;
import dalvik.system.PathClassLoader;

import com.moblica.common.xmob.ui.WindowManager;

/**
 * Replacement for Facebook Lite's server glyph rasterizer (X.0eF). Keeps the glyph boxes the
 * server sends, but fills them with the system font instead of the server's vector outlines.
 *
 * Icons (private use characters) and characters the system font lacks still go to the original X.0eF,
 * loaded from the app's own secondary dex in a separate class loader (see {@link #originalClass()}).
 */
public final class ZZeF {
    private final ZZe1 atlasHolder;
    private final WindowManager windowManager;
    private final int charHeight;
    private final int underlineY;
    private final boolean underline;
    private final Object lock = new Object();
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
    private final Paint linePaint = new Paint();
    private final char[] one = new char[1];
    private static int logged;
    private static Class<?> originalClass;
    private static boolean originalFailed;

    private final Object[] args;
    private Object original;
    private Method originalA03;

    // ColorOS hides app logs, so the probe also writes to the app's external cache dir, which adb can read.
    // Creating cache/fblite-serif switches to serif, so it is visible at a glance whether the feed uses this class.
    private static final String DEBUG_DIR = "/storage/emulated/0/Android/data/com.facebook.lite/cache/";
    private static final boolean SERIF = new File(DEBUG_DIR + "fblite-serif").exists();
    // The server font is Roboto with an em of about 0.755 x the glyph box height (measured from the glyph
    // widths the server sends against Roboto's advances). Using the same em keeps the system font's own
    // proportions; only glyphs wider than their box get squeezed. cache/fblite-scale overrides it for tuning.
    private static final float EM_PER_HEIGHT = readScale(0.755f);

    public ZZeF(ZZe1 atlasHolder, WindowManager windowManager, int charHeight, int unused1, int unused2,
                int underlineY, boolean bold, boolean unused3, boolean underline) {
        this.atlasHolder = atlasHolder;
        this.windowManager = windowManager;
        this.charHeight = charHeight;
        this.underlineY = underlineY;
        this.underline = underline;
        this.args = new Object[] {atlasHolder, windowManager, charHeight, unused1, unused2, underlineY, bold, unused3, underline};
        paint.setColor(0xFF000000);
        Typeface base = SERIF ? Typeface.SERIF : Typeface.DEFAULT;
        paint.setTypeface(Typeface.create(base, bold ? Typeface.BOLD : Typeface.NORMAL));
        probe("rasterizer created h=" + charHeight + " underlineY=" + underlineY + " bold=" + bold
                + " unused=" + unused1 + "," + unused2 + "," + unused3 + " underline=" + underline + " serif=" + SERIF);
        linePaint.setColor(0xFF000000);
        linePaint.setStyle(Paint.Style.STROKE);
        linePaint.setStrokeWidth(Math.min(charHeight / 18.0f, 3.0f));
    }

    public final ZZIn A03(byte[] data, char c) {
        synchronized (lock) {
            if (data == null || data.length < 2) return null;
            int type = data[0];
            int width = data[1];
            int pos = 2;
            if (type == 8) pos += 4;
            int height = charHeight;
            if ((type == 3 || type == 6) && data.length >= pos + 2) {
                height = (short) ((data[pos] << 8) | (data[pos + 1] & 0xFF));
            }
            if (width <= 0 || height <= 0) return null;
            boolean system = c == ' ' || canDraw(c);
            if (logged < 80) {
                logged++;
                probe("glyph U+" + Integer.toHexString(c) + " '" + c + "' type=" + type + " w=" + width + " h=" + height
                        + " len=" + data.length + (system ? "" : " -> original"));
            }
            if (!system) {
                Object glyph = drawOriginal(data, c);
                if (glyph != null) return (ZZIn) glyph;
            }

            ZZIk atlas;
            ZZIm slot;
            synchronized (atlasHolder.A02) {
                atlas = atlasHolder.A00;
                slot = atlas != null ? atlas.A01(width, height) : null;
                if (atlas == null || slot == null) {
                    int side = Math.max(windowManager.A0C, windowManager.A0B);
                    int rows = (Math.min(ZZFD.A01(92, 8) * height, side) / height) * height;
                    Integer flags = ZZe1.A04;
                    atlas = new ZZIk(side, rows, atlasHolder.A03, flags != null ? flags : 0);
                    atlasHolder.A00 = atlas;
                    slot = atlas.A01(width, height);
                    if (slot == null) return null;
                }
            }

            Canvas canvas = atlas.A00().A04;
            int left = slot.A01, top = slot.A03, right = slot.A02, bottom = slot.A00;
            canvas.save();
            canvas.clipRect(left, top, right, bottom);
            canvas.drawColor(0, PorterDuff.Mode.CLEAR);
            if (c != ' ') drawChar(canvas, c, left, top, width, height);
            if (underline) canvas.drawLine(left, top + underlineY, right, top + underlineY, linePaint);
            canvas.restore();
            return new ZZIn(atlas, slot);
        }
    }

    private boolean canDraw(char c) {
        if (Character.isSurrogate(c) || (c >= 0xE000 && c <= 0xF8FF)) return false;
        one[0] = c;
        return paint.hasGlyph(new String(one));
    }

    private Object drawOriginal(byte[] data, char c) {
        try {
            if (original == null) {
                Class<?> cls = originalClass();
                if (cls == null) return null;
                Constructor<?> ctor = cls.getConstructor(ZZe1.class, WindowManager.class, int.class, int.class,
                        int.class, int.class, boolean.class, boolean.class, boolean.class);
                original = ctor.newInstance(args);
                originalA03 = cls.getMethod("A03", byte[].class, char.class);
            }
            return originalA03.invoke(original, data, c);
        } catch (Throwable t) {
            probe("original A03 failed: " + t);
            return null;
        }
    }

    /**
     * Loads the original X.0eF from the secondary dex, in a PathClassLoader whose parent hides only X.0eF.
     * Every other class it uses resolves through the app's class loader, so it shares the atlas classes.
     */
    private static synchronized Class<?> originalClass() {
        if (originalClass != null || originalFailed) return originalClass;
        originalFailed = true;
        try {
            final ClassLoader app = ZZeF.class.getClassLoader();
            ClassLoader hideSelf = new ClassLoader(app) {
                @Override
                protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
                    if (name.equals("X.0eF")) throw new ClassNotFoundException(name);
                    return super.loadClass(name, resolve);
                }
            };
            Class<?> loaderClass = Class.forName("X.09K", false, app);
            Object loader = loaderClass.getField("A0A").get(null);
            DexFile[] dexFiles = (DexFile[]) loaderClass.getField("A02").get(loader);
            for (DexFile dex : dexFiles) {
                if (dex == null || dex.getName().endsWith(".apk")) continue;
                try {
                    Class<?> cls = new PathClassLoader(dex.getName(), hideSelf).loadClass("X.0eF");
                    probe("original X.0eF from " + dex.getName());
                    originalClass = cls;
                    originalFailed = false;
                    return cls;
                } catch (Throwable t) {
                    probe("no X.0eF in " + dex.getName() + ": " + t);
                }
            }
        } catch (Throwable t) {
            probe("loading original X.0eF failed: " + t);
        }
        return null;
    }

    private void drawChar(Canvas canvas, char c, int left, int top, int width, int height) {
        paint.setTextScaleX(1f);
        paint.setTextSize(height * EM_PER_HEIGHT);
        Paint.FontMetrics fm = paint.getFontMetrics();
        one[0] = c;
        float advance = paint.measureText(one, 0, 1);
        if (advance > width && advance > 0) {
            paint.setTextScaleX(width / advance);
            advance = width;
        }
        float x = left + (width - advance) / 2f;
        float baseline = top + (height - (fm.descent - fm.ascent)) / 2f - fm.ascent;
        canvas.drawText(one, 0, 1, x, baseline, paint);
    }

    private static float readScale(float fallback) {
        try {
            java.io.BufferedReader r = new java.io.BufferedReader(new java.io.FileReader(DEBUG_DIR + "fblite-scale"));
            float v = Float.parseFloat(r.readLine().trim());
            r.close();
            return v;
        } catch (Throwable t) {
            return fallback;
        }
    }

    private static void probe(String msg) {
        android.util.Log.i("FbLiteSysFont", msg);
        try {
            new File(DEBUG_DIR).mkdirs();
            FileWriter w = new FileWriter(DEBUG_DIR + "fblite-sysfont.txt", true);
            w.write(System.currentTimeMillis() + " " + msg + "\n");
            w.close();
        } catch (Throwable ignored) {
        }
    }
}
