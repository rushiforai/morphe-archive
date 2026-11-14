package semicoloncolonel.mobilestream.extension.checkout51;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.LruCache;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * A small OpenStreetMap view: raster tiles, pins, drag to pan, and zoom
 * buttons. Checkout 51's Google map cannot draw in a patched app, so this
 * takes its place.
 *
 * Tiles come from tile.openstreetmap.org, following its tile usage policy:
 * an identifying User-Agent, at most two downloads at a time, and a cache of
 * seven days on the device (in memory and in the app's cache folder). The
 * tile server sees the device's IP address and which tiles it asks for, which
 * shows the area on screen. Nothing else is sent.
 */
@SuppressWarnings("unused")
public final class OsmMapView extends View {
    private static final String TAG = "MSP-C51-MAP";
    private static final String TILE_URL = "https://tile.openstreetmap.org/%d/%d/%d.png";
    private static final String USER_AGENT = "MobileStreamPatches-Checkout51/1.0 (+https://github.com/semicoloncolonel/mobile-morphe-patches)";
    private static final long CACHE_MS = 7L * 24 * 60 * 60 * 1000;
    private static final int MIN_ZOOM = 3;
    private static final int MAX_ZOOM = 18;

    private static final LruCache<String, Bitmap> MEMORY = new LruCache<String, Bitmap>(48);
    private static final ExecutorService DOWNLOADS = Executors.newFixedThreadPool(2);
    private static final Set<String> LOADING = new HashSet<>();

    /** A pin: position, short label, and whatever the listener needs back. */
    public static final class Pin {
        final double lat;
        final double lon;
        final String label;
        final Object tag;

        public Pin(double lat, double lon, String label, Object tag) {
            this.lat = lat;
            this.lon = lon;
            this.label = label;
            this.tag = tag;
        }
    }

    public interface OnPinClick {
        void onPinClick(Object tag);
    }

    private final Handler main = new Handler(Looper.getMainLooper());
    private final float density;
    private final int tilePx;
    private final int touchSlop;
    private final List<Pin> pins = new ArrayList<>();
    private Object selected;
    private OnPinClick listener;

    private int zoom = 14;
    /** The world point at the center of the view, in pixels at {@link #zoom}. */
    private double centerX;
    private double centerY;
    private boolean fitPending;

    private final Paint tilePaint = new Paint(Paint.FILTER_BITMAP_FLAG);
    private final Paint emptyPaint = new Paint();
    private final Paint pinPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pinTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint creditPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint creditBackPaint = new Paint();
    private final Paint buttonPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint buttonTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    private float downX;
    private float downY;
    private float lastX;
    private float lastY;
    private boolean dragging;
    private final RectF zoomIn = new RectF();
    private final RectF zoomOut = new RectF();

    public OsmMapView(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        tilePx = Math.round(256 * Math.max(1f, density / 1.75f));
        touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        emptyPaint.setColor(0xFFE8E4DC);
        pinTextPaint.setColor(Color.WHITE);
        pinTextPaint.setTextSize(12 * density);
        pinTextPaint.setFakeBoldText(true);
        pinTextPaint.setTextAlign(Paint.Align.CENTER);
        creditPaint.setColor(0xFF333333);
        creditPaint.setTextSize(10 * density);
        creditBackPaint.setColor(0xCCFFFFFF);
        buttonPaint.setColor(Color.WHITE);
        buttonPaint.setShadowLayer(2 * density, 0, density, 0x55000000);
        buttonTextPaint.setColor(0xFF333333);
        buttonTextPaint.setTextSize(22 * density);
        buttonTextPaint.setTextAlign(Paint.Align.CENTER);
        setLayerType(LAYER_TYPE_SOFTWARE, null); // for the button shadow
    }

    public void setOnPinClick(OnPinClick listener) {
        this.listener = listener;
    }

    /** Replaces the pins and zooms to fit them. */
    public void setPins(List<Pin> newPins) {
        pins.clear();
        pins.addAll(newPins);
        fitPending = true;
        if (getWidth() > 0) {
            fit();
        }
        invalidate();
    }

    public void setSelected(Object tag) {
        selected = tag;
        invalidate();
    }

    // ── Projection ─────────────────────────────────────────────────────────

    private double worldX(double lon, int z) {
        return (lon + 180) / 360 * worldSize(z);
    }

    private double worldY(double lat, int z) {
        double rad = Math.toRadians(Math.max(-85, Math.min(85, lat)));
        return (1 - Math.log(Math.tan(rad) + 1 / Math.cos(rad)) / Math.PI) / 2 * worldSize(z);
    }

    private double worldSize(int z) {
        return (double) tilePx * (1L << z);
    }

    private void fit() {
        fitPending = false;
        if (pins.isEmpty()) {
            return;
        }
        double minLat = 90, maxLat = -90, minLon = 180, maxLon = -180;
        for (Pin pin : pins) {
            minLat = Math.min(minLat, pin.lat);
            maxLat = Math.max(maxLat, pin.lat);
            minLon = Math.min(minLon, pin.lon);
            maxLon = Math.max(maxLon, pin.lon);
        }
        float pad = 36 * density;
        int z = pins.size() == 1 ? 16 : MAX_ZOOM;
        for (; z > MIN_ZOOM; z--) {
            double w = worldX(maxLon, z) - worldX(minLon, z);
            double h = worldY(minLat, z) - worldY(maxLat, z);
            if (w <= getWidth() - 2 * pad && h <= getHeight() - 2 * pad) {
                break;
            }
        }
        zoom = Math.min(z, 17);
        centerX = (worldX(minLon, zoom) + worldX(maxLon, zoom)) / 2;
        centerY = (worldY(minLat, zoom) + worldY(maxLat, zoom)) / 2;
    }

    private void zoomBy(int delta) {
        int next = Math.max(MIN_ZOOM, Math.min(MAX_ZOOM, zoom + delta));
        if (next == zoom) {
            return;
        }
        double scale = Math.pow(2, next - zoom);
        centerX *= scale;
        centerY *= scale;
        zoom = next;
        invalidate();
    }

    // ── Drawing ────────────────────────────────────────────────────────────

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (fitPending && w > 0 && h > 0) {
            fit();
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        int h = getHeight();
        canvas.drawRect(0, 0, w, h, emptyPaint);

        double left = centerX - w / 2.0;
        double top = centerY - h / 2.0;
        int count = 1 << zoom;
        int firstX = (int) Math.floor(left / tilePx);
        int firstY = (int) Math.floor(top / tilePx);
        int lastX = (int) Math.floor((left + w) / tilePx);
        int lastY = (int) Math.floor((top + h) / tilePx);
        Rect dst = new Rect();
        for (int ty = firstY; ty <= lastY; ty++) {
            if (ty < 0 || ty >= count) continue;
            for (int tx = firstX; tx <= lastX; tx++) {
                int wrapped = ((tx % count) + count) % count;
                int px = (int) Math.round(tx * (double) tilePx - left);
                int py = (int) Math.round(ty * (double) tilePx - top);
                dst.set(px, py, px + tilePx, py + tilePx);
                Bitmap tile = tile(zoom, wrapped, ty);
                if (tile != null) {
                    canvas.drawBitmap(tile, null, dst, tilePaint);
                }
            }
        }

        // Pins: the selected one last, so it is on top.
        Pin chosen = null;
        for (Pin pin : pins) {
            if (pin.tag != null && pin.tag == selected) {
                chosen = pin;
                continue;
            }
            drawPin(canvas, pin, left, top, false);
        }
        if (chosen != null) {
            drawPin(canvas, chosen, left, top, true);
        }

        // Attribution, as the OpenStreetMap licence requires.
        String credit = "© OpenStreetMap contributors";
        float cw = creditPaint.measureText(credit);
        float pad = 4 * density;
        canvas.drawRect(w - cw - 2 * pad, h - creditPaint.getTextSize() - 2 * pad, w, h, creditBackPaint);
        canvas.drawText(credit, w - cw - pad, h - pad - 2, creditPaint);

        // Zoom buttons, bottom left.
        float size = 40 * density;
        float margin = 12 * density;
        zoomIn.set(margin, h - margin - 2 * size - 8 * density, margin + size, h - margin - size - 8 * density);
        zoomOut.set(margin, h - margin - size, margin + size, h - margin);
        drawButton(canvas, zoomIn, "+");
        drawButton(canvas, zoomOut, "−");
    }

    private void drawPin(Canvas canvas, Pin pin, double left, double top, boolean isSelected) {
        float x = (float) (worldX(pin.lon, zoom) - left);
        float y = (float) (worldY(pin.lat, zoom) - top);
        float r = (isSelected ? 18 : 14) * density;
        pinPaint.setColor(Color.WHITE);
        canvas.drawCircle(x, y, r + 2 * density, pinPaint);
        pinPaint.setColor(isSelected ? 0xFF0B5E4C : 0xFF14866D);
        canvas.drawCircle(x, y, r, pinPaint);
        if (pin.label != null) {
            canvas.drawText(pin.label, x, y + pinTextPaint.getTextSize() / 3, pinTextPaint);
        }
    }

    private void drawButton(Canvas canvas, RectF rect, String text) {
        canvas.drawRoundRect(rect, 6 * density, 6 * density, buttonPaint);
        canvas.drawText(text, rect.centerX(), rect.centerY() + buttonTextPaint.getTextSize() / 3, buttonTextPaint);
    }

    // ── Touch ──────────────────────────────────────────────────────────────

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = lastX = event.getX();
                downY = lastY = event.getY();
                dragging = false;
                getParent().requestDisallowInterceptTouchEvent(true);
                return true;
            case MotionEvent.ACTION_MOVE:
                if (!dragging && Math.hypot(event.getX() - downX, event.getY() - downY) > touchSlop) {
                    dragging = true;
                }
                if (dragging) {
                    centerX -= event.getX() - lastX;
                    centerY -= event.getY() - lastY;
                    double world = worldSize(zoom);
                    centerY = Math.max(0, Math.min(world, centerY));
                    invalidate();
                }
                lastX = event.getX();
                lastY = event.getY();
                return true;
            case MotionEvent.ACTION_UP:
                if (!dragging) {
                    tap(event.getX(), event.getY());
                }
                return true;
            default:
                return true;
        }
    }

    private void tap(float x, float y) {
        if (zoomIn.contains(x, y)) {
            zoomBy(1);
            return;
        }
        if (zoomOut.contains(x, y)) {
            zoomBy(-1);
            return;
        }
        double left = centerX - getWidth() / 2.0;
        double top = centerY - getHeight() / 2.0;
        Pin best = null;
        double bestDistance = 28 * density;
        for (Pin pin : pins) {
            double d = Math.hypot(worldX(pin.lon, zoom) - left - x, worldY(pin.lat, zoom) - top - y);
            if (d < bestDistance) {
                bestDistance = d;
                best = pin;
            }
        }
        if (best != null) {
            selected = best.tag;
            invalidate();
            if (listener != null) {
                listener.onPinClick(best.tag);
            }
        }
    }

    // ── Tiles ──────────────────────────────────────────────────────────────

    private Bitmap tile(int z, int x, int y) {
        String key = z + "/" + x + "/" + y;
        Bitmap cached = MEMORY.get(key);
        if (cached != null) {
            return cached;
        }
        synchronized (LOADING) {
            if (!LOADING.add(key)) {
                return null;
            }
        }
        File cacheDir = new File(getContext().getCacheDir(), "osm-tiles");
        DOWNLOADS.execute(() -> {
            try {
                Bitmap bitmap = load(cacheDir, z, x, y);
                if (bitmap != null) {
                    MEMORY.put(key, bitmap);
                    main.post(this::invalidate);
                }
            } finally {
                synchronized (LOADING) {
                    LOADING.remove(key);
                }
            }
        });
        return null;
    }

    private static Bitmap load(File cacheDir, int z, int x, int y) {
        File file = new File(cacheDir, z + "-" + x + "-" + y + ".png");
        if (file.exists() && System.currentTimeMillis() - file.lastModified() < CACHE_MS) {
            Bitmap bitmap = BitmapFactory.decodeFile(file.getPath());
            if (bitmap != null) {
                return bitmap;
            }
        }
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(String.format(Locale.US, TILE_URL, z, x, y)).openConnection();
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setConnectTimeout(8000);
            connection.setReadTimeout(8000);
            if (connection.getResponseCode() != 200) {
                Log.w(TAG, "tile " + z + "/" + x + "/" + y + ": HTTP " + connection.getResponseCode());
                return file.exists() ? BitmapFactory.decodeFile(file.getPath()) : null;
            }
            cacheDir.mkdirs();
            File part = new File(cacheDir, file.getName() + ".part");
            try (InputStream in = connection.getInputStream(); OutputStream out = new FileOutputStream(part)) {
                byte[] buffer = new byte[8192];
                int n;
                while ((n = in.read(buffer)) > 0) {
                    out.write(buffer, 0, n);
                }
            }
            if (!part.renameTo(file)) {
                part.delete();
                return null;
            }
            return BitmapFactory.decodeFile(file.getPath());
        } catch (Throwable t) {
            Log.w(TAG, "tile " + z + "/" + x + "/" + y + " failed: " + t);
            return file.exists() ? BitmapFactory.decodeFile(file.getPath()) : null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }
}
