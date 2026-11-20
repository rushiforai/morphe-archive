package app.southstar21.extension.spotify.liquidglass;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.SystemClock;
import android.util.Log;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;

import java.util.ArrayList;
import java.util.List;

/**
 * Spotify's tabs, which are not views: the whole bar is one Compose view inside the
 * {@code navigation_bar} container, with the tabs side by side at equal widths.
 * <p>
 * Each tab gets a stand-in view that is never attached, laid out over its slice of the
 * Compose view, so the lens can measure, select and click tabs as it does on Instagram.
 * Compose tells accessibility neither which tab is selected nor anything a patch could ask
 * cheaply, so the selected tab is read off the bar itself: Spotify draws the selected tab's
 * icon and label white and the others grey.
 */
final class ComposeTabs implements Tabs {
    /** Spotify's usual tabs (Home, Search, Your Library, Create) when they can't be counted. */
    private static final int DEFAULT_COUNT = 4;
    /** Don't look at the bar more often than this while it redraws, right after a touch... */
    private static final long SAMPLE_INTERVAL_MS = 120;
    /** ...and otherwise (a tab changed some other way, e.g. by going back). */
    private static final long IDLE_SAMPLE_INTERVAL_MS = 1000;
    /** The bar is looked at in a bitmap this much smaller than it. */
    private static final float SAMPLE_SCALE = 0.25f;

    /** Spotify green, for the selected tab's icon and label. */
    private static final int ACCENT = 0xFF1ED760;
    /**
     * Turns white into the accent and leaves everything else alone. Spotify draws only the
     * selected tab white (the others grey, about 70%), so this colors exactly the selected
     * tab, and switches the moment Spotify does.
     */
    private static final String ACCENT_SHADER =
            "uniform shader content;\n" +
            "uniform half3 accent;\n" +
            "half4 main(float2 coord) {\n" +
            "  half4 col = content.eval(coord);\n" +
            "  if (col.a <= 0.0) return col;\n" +
            "  half3 rgb = col.rgb / col.a;\n" +
            "  half w = smoothstep(0.82, 0.95, min(rgb.r, min(rgb.g, rgb.b)));\n" +
            "  return half4(mix(rgb, accent, w) * col.a, col.a);\n" +
            "}\n";

    private final ViewGroup bar;
    private final Context context;
    private final ArrayList<View> tabs = new ArrayList<>();
    private final ArrayList<View> transformed = new ArrayList<>();
    private View content;
    /** The Compose view the accent is applied to. */
    private View accented;
    private int countedForWidth = -1;
    private int count = DEFAULT_COUNT;
    private int selected = -1;

    private Bitmap bitmap;
    private final Canvas canvas = new Canvas();
    private int[] pixels;
    private long lastSample;
    private boolean samplePending;
    private final Runnable sampleLater = () -> {
        samplePending = false;
        sample();
    };
    private final int[] location = new int[2];

    ComposeTabs(ViewGroup bar) {
        this.bar = bar;
        this.context = bar.getContext();
    }

    @Override
    public List<View> views() {
        return tabs;
    }

    @Override
    public List<View> transformed() {
        return transformed;
    }

    @Override
    public void update() {
        View now = bar.getChildCount() > 0 ? bar.getChildAt(0) : null;
        if (now != content) {
            content = now;
            countedForWidth = -1;
            rebuildTransformed();
        }
        if (content == null || content.getWidth() == 0 || content.getHeight() == 0) {
            setCount(0);
            return;
        }
        if (countedForWidth != content.getWidth()) {
            countedForWidth = content.getWidth();
            int counted = countTabs();
            if (counted > 0) count = counted;
            Log.d(LiquidGlassNavBarPatch.TAG, "Tabs: " + count + (counted > 0 ? " (counted)" : " (assumed)"));
        }
        setCount(count);
        applyAccent();
        layoutTabs();
        scheduleSample();
    }

    private void setCount(int n) {
        if (tabs.size() == n) return;
        while (tabs.size() > n) tabs.remove(tabs.size() - 1);
        while (tabs.size() < n) tabs.add(new Tab(context, this, tabs.size()));
        if (selected >= n) selected = -1;
        rebuildTransformed();
    }

    /** The stand-ins shrink with the bar so they stay over the tabs Compose draws. */
    private void rebuildTransformed() {
        transformed.clear();
        transformed.addAll(tabs);
        if (content != null) transformed.add(content);
    }

    /** Lays each stand-in over its slice of the Compose view, in the bar's coordinates. */
    private void layoutTabs() {
        int n = tabs.size();
        if (n == 0) return;
        float slice = content.getWidth() / (float) n;
        for (int i = 0; i < n; i++) {
            View tab = tabs.get(i);
            int left = content.getLeft() + Math.round(i * slice);
            int right = content.getLeft() + Math.round((i + 1) * slice);
            if (tab.getLeft() != left || tab.getRight() != right
                    || tab.getTop() != content.getTop() || tab.getBottom() != content.getBottom()) {
                tab.layout(left, content.getTop(), right, content.getBottom());
            }
            tab.setSelected(i == selected);
        }
    }

    /**
     * Counts the clickable tab-sized nodes Compose gives accessibility, or 0 if it gives none
     * (then the usual 4 are assumed).
     */
    private int countTabs() {
        try {
            AccessibilityNodeProvider provider = content.getAccessibilityNodeProvider();
            if (provider == null) return 0;
            content.getLocationOnScreen(location);
            Rect area = new Rect(location[0], location[1],
                    location[0] + content.getWidth(), location[1] + content.getHeight());
            Rect bounds = new Rect();
            int n = 0;
            for (int id = 0; id < 400; id++) {
                AccessibilityNodeInfo info = provider.createAccessibilityNodeInfo(id);
                if (info == null || !info.isClickable()) continue;
                info.getBoundsInScreen(bounds);
                if (Rect.intersects(bounds, area) && bounds.height() > area.height() / 2
                        && bounds.width() < area.width() * 0.6f) {
                    n++;
                }
            }
            return n >= 2 && n <= 6 ? n : 0;
        } catch (Throwable t) {
            Log.w(LiquidGlassNavBarPatch.TAG, "Couldn't count tabs", t);
            return 0;
        }
    }

    /** Colors the selected tab green: a shader on the Compose view, Android 13+. */
    private void applyAccent() {
        if (content == accented || android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.TIRAMISU) return;
        accented = content;
        try {
            android.graphics.RuntimeShader shader = new android.graphics.RuntimeShader(ACCENT_SHADER);
            shader.setFloatUniform("accent", Color.red(ACCENT) / 255f, Color.green(ACCENT) / 255f,
                    Color.blue(ACCENT) / 255f);
            content.setRenderEffect(android.graphics.RenderEffect.createRuntimeShaderEffect(shader, "content"));
        } catch (Throwable t) {
            // A shader the GPU driver rejects leaves the tabs white.
            Log.w(LiquidGlassNavBarPatch.TAG, "Couldn't color the selected tab", t);
        }
    }

    // region Selected tab

    private void scheduleSample() {
        long now = SystemClock.uptimeMillis();
        long interval = Interaction.recent(now) ? SAMPLE_INTERVAL_MS : IDLE_SAMPLE_INTERVAL_MS;
        long wait = interval - (now - lastSample);
        if (wait <= 0) {
            sample();
        } else if (!samplePending) {
            // The bar may stop redrawing before the next frame: look once more after it has.
            samplePending = true;
            bar.postDelayed(sampleLater, wait);
        }
    }

    /** Draws the bar into a small bitmap and finds the tab drawn whitest. */
    private void sample() {
        lastSample = SystemClock.uptimeMillis();
        View view = content;
        int n = tabs.size();
        if (view == null || n == 0 || view.getWidth() == 0) return;
        int w = Math.max(1, Math.round(view.getWidth() * SAMPLE_SCALE));
        int h = Math.max(1, Math.round(view.getHeight() * SAMPLE_SCALE));
        if (bitmap == null || bitmap.getWidth() != w || bitmap.getHeight() != h) {
            bitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
            pixels = new int[w * h];
        }
        bitmap.eraseColor(Color.TRANSPARENT);
        canvas.setBitmap(bitmap);
        int save = canvas.save();
        canvas.scale(SAMPLE_SCALE, SAMPLE_SCALE);
        view.draw(canvas);
        canvas.restoreToCount(save);
        canvas.setBitmap(null);
        bitmap.getPixels(pixels, 0, w, 0, 0, w, h);

        int[] white = new int[n];
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                int c = pixels[y * w + x];
                if (Color.alpha(c) < 110) continue;
                if (Math.min(Color.red(c), Math.min(Color.green(c), Color.blue(c))) < 225) continue;
                white[Math.min(n - 1, x * n / w)]++;
            }
        }
        int best = -1, bestCount = 0, second = 0;
        for (int i = 0; i < n; i++) {
            if (white[i] > bestCount) {
                second = bestCount;
                bestCount = white[i];
                best = i;
            } else if (white[i] > second) {
                second = white[i];
            }
        }
        // A clear winner, or nothing changes (e.g. halfway through Spotify's own transition).
        if (best < 0 || bestCount < 4 || bestCount < second * 2) return;
        if (best != selected) {
            selected = best;
            for (int i = 0; i < n; i++) tabs.get(i).setSelected(i == selected);
            // Bring the lens over in the next frame, also when nothing else redraws.
            bar.invalidate();
        }
    }

    // endregion

    /** Opens tab {@code index} with a tap on its middle, as a finger would. */
    private void click(int index) {
        View view = content;
        int n = tabs.size();
        if (view == null || index >= n || !view.isAttachedToWindow()) return;
        View root = view.getRootView();
        view.getLocationInWindow(location);
        float x = location[0] + (index + 0.5f) * view.getWidth() / n * view.getScaleX();
        float y = location[1] + view.getHeight() / 2f * view.getScaleY();
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 1, MotionEvent.ACTION_UP, x, y, 0);
        down.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        up.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try {
            root.dispatchTouchEvent(down);
            root.dispatchTouchEvent(up);
        } finally {
            down.recycle();
            up.recycle();
        }
        lastSample = 0;
    }

    /** A tab's stand-in: never attached, only measured, selected and clicked. */
    @SuppressLint("ViewConstructor")
    private static final class Tab extends View {
        private final ComposeTabs owner;
        private final int index;

        Tab(Context context, ComposeTabs owner, int index) {
            super(context);
            this.owner = owner;
            this.index = index;
        }

        @Override
        public boolean performClick() {
            owner.click(index);
            return true;
        }
    }
}
