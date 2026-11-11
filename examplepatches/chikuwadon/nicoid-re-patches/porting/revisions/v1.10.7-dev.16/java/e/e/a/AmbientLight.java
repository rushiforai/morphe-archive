package e.e.a;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.view.PixelCopy;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import org.json.JSONArray;

public final class AmbientLight {
    static final String ID = "ambient";
    static final String ENABLED = "nicoid_ambient_enabled";
    static final String PREFIX = "nicoid_ambient_";
    static final int NORMAL = 0, FULL = 1, POPUP = 2;
    static final String[] KEYS = {"intensity", "spread", "softness", "brightness", "contrast",
            "saturation", "vibrance", "response", "rate", "resolution"};
    static final int[] MAX = {100, 120, 100, 150, 150, 150, 100, 100, 24, 48};
    static final int[] MIN = {0, 4, 0, 0, 50, 0, 0, 5, 2, 12};
    static final int[][] PRESETS = {
            {24, 26, 78, 85, 95, 90, 0, 28, 4, 16},
            {27, 34, 86, 90, 100, 90, 5, 28, 8, 24},
            {43, 52, 72, 100, 100, 105, 10, 42, 10, 24},
            {62, 76, 60, 110, 110, 122, 25, 58, 16, 32}
    };
    private static final int SEGMENTS = 4;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View, WeakReference<Layer>> LAYERS = new WeakHashMap<>();

    private AmbientLight() {}

    static SharedPreferences prefs(Context c) {
        return PreferenceManager.getDefaultSharedPreferences(c);
    }

    static int[] values(SharedPreferences p) {
        int[] v = PRESETS[2].clone();
        for (int i = 0; i < v.length; i++) {
            v[i] = Math.max(MIN[i], Math.min(MAX[i], p.getInt(PREFIX + KEYS[i], v[i])));
        }
        return v;
    }

    public static String[] appendId(String[] values) { return append(values, ID); }
    public static String[] appendLabel(String[] values) { return append(values, "アンビエントモード"); }

    private static String[] append(String[] values, String text) {
        String[] result = Arrays.copyOf(values, values.length + 1);
        result[values.length] = text;
        return result;
    }

    public static void defaultHidden(Set<String> hidden, SharedPreferences p) {
        try {
            JSONArray order = new JSONArray(p.getString("player_button_order_v1", "[]"));
            for (int i = 0; i < order.length(); i++) if (ID.equals(order.optString(i))) return;
        } catch (Exception ignored) { }
        hidden.add(ID);
    }

    public static void resetHidden(Set<String> hidden) { hidden.add(ID); }

    static String title(Context c) {
        return Dev112.tr(c, "アンビエントモード", "Ambient mode", "環境光模式");
    }

    static int accent(Context c) {
        try {
            return (Integer) Dev112.staticCall("e.e.a.UiDialogs", "accent", new Class<?>[]{Context.class}, c);
        } catch (Exception ignored) {
            android.util.TypedValue value = new android.util.TypedValue();
            return c.getTheme().resolveAttribute(android.R.attr.colorAccent, value, true) ? value.data : Color.WHITE;
        }
    }

    private static final class Toggle extends View implements SharedPreferences.OnSharedPreferenceChangeListener {
        final SharedPreferences p;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final int accent;
        Toggle(Context c) {
            super(c);
            p = prefs(c);
            accent = accent(c);
            setFocusable(true);
            setOnClickListener(v -> p.edit().putBoolean(ENABLED, !p.getBoolean(ENABLED, false)).apply());
            refresh();
        }
        void refresh() {
            boolean on = p.getBoolean(ENABLED, false);
            setSelected(on);
            setContentDescription(title(getContext()) + (on ? " ON" : " OFF"));
            invalidate();
        }
        @Override protected void onAttachedToWindow() { super.onAttachedToWindow(); p.registerOnSharedPreferenceChangeListener(this); refresh(); }
        @Override protected void onDetachedFromWindow() { p.unregisterOnSharedPreferenceChangeListener(this); super.onDetachedFromWindow(); }
        @Override public void onSharedPreferenceChanged(SharedPreferences p, String key) {
            if (key == null || ENABLED.equals(key)) refresh();
        }
        @Override protected void onDraw(Canvas c) {
            super.onDraw(c);
            float size = Math.min(getWidth(), getHeight()) * .25f;
            if (size <= 0) return;
            float x = getWidth() * .5f, y = getHeight() * .5f;
            paint.setColor(isSelected() ? accent : Color.WHITE);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Math.max(1f, size * .14f));
            c.drawRoundRect(x - size, y - size * .63f, x + size, y + size * .63f, size * .18f, size * .18f, paint);
            c.drawLine(x - size * 1.22f, y, x - size * 1.51f, y, paint);
            c.drawLine(x + size * 1.22f, y, x + size * 1.51f, y, paint);
            c.drawLine(x, y - size * .85f, x, y - size * 1.12f, paint);
            c.drawLine(x, y + size * .85f, x, y + size * 1.12f, paint);
        }
    }

    public static void foreground(Object owner, View root, LinearLayout row) {
        if (root.findViewWithTag("player-ambient") == null) {
            Toggle button = new Toggle(root.getContext());
            button.setTag("player-ambient");
            button.setVisibility(View.GONE);
            row.addView(button, new LinearLayout.LayoutParams(dp(root, 36), dp(root, 36)));
        }
        try {
            View video = video(owner, root);
            if (video != null) bind(root, video, NORMAL);
        } catch (Exception ignored) { }
    }

    @SuppressWarnings("unchecked")
    public static void popup(Object binding) {
        try {
            View root = (View) Dev112.get(binding, "root");
            View video = (View) Dev112.get(binding, "video");
            Map<String, View> buttons = (Map<String, View>) Dev112.get(binding, "buttons");
            Toggle button = new Toggle(root.getContext());
            int size = dp(root, 32);
            button.setLayoutParams(new LinearLayout.LayoutParams(size, size));
            buttons.put(ID, button);
            if (video != null) bind(root, video, POPUP);
        } catch (Exception ignored) { }
    }

    private static View video(Object owner, View root) throws Exception {
        int id = root.getResources().getIdentifier("video", "id", root.getContext().getPackageName());
        View found = id != 0 ? root.findViewById(id) : null;
        if (found != null) return found;
        Object player = owner == null ? null : Dev112.get(owner, "a0");
        return player instanceof View ? (View) player : null;
    }

    public static void fullscreen(View root, View decor) {
        if (root == null || decor == null) return;
        Layer layer = layer(root);
        if (layer == null) {
            try {
                View video = video(null, root);
                if (video != null) layer = bind(root, video, NORMAL);
            } catch (Exception ignored) { }
        }
        if (layer != null) layer.mode(FULL, decor);
    }

    public static void restore(View root) {
        Layer layer = layer(root);
        if (layer != null) layer.mode(NORMAL, root);
    }

    private static Layer layer(View root) {
        WeakReference<Layer> reference = LAYERS.get(root);
        return reference == null ? null : reference.get();
    }

    private static Layer bind(View root, View video, int mode) {
        Layer layer = layer(root);
        if (layer == null || layer.video != video) {
            if (layer != null) layer.dispose();
            layer = new Layer(root, video, mode);
            LAYERS.put(root, new WeakReference<>(layer));
        }
        return layer;
    }

    private static int dp(View v, float n) {
        return Math.round(v.getResources().getDisplayMetrics().density * n);
    }

    private static View source(View view) {
        if (view instanceof TextureView || view instanceof SurfaceView) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = source(group.getChildAt(i));
                if (child != null && child.isShown()) return child;
            }
        }
        return null;
    }

    private static final class Layer implements Runnable, View.OnAttachStateChangeListener,
            SharedPreferences.OnSharedPreferenceChangeListener {
        final View root, video;
        final SharedPreferences prefs;
        final Glow glow = new Glow();
        final Rect frame = new Rect();
        final int[] origin = new int[2], position = new int[2];
        final int[] palette = new int[SEGMENTS * 4];
        View host, installed, lastSource;
        int mode, generation, failures;
        Method isPlaying;
        long nextPlaybackCheck;
        boolean playing = true;
        Bitmap sample;
        int[] config;
        boolean copying, attached, haveColor;

        Layer(View root, View video, int mode) {
            this.root = root;
            this.video = video;
            this.mode = mode;
            host = mode == POPUP ? video : root;
            prefs = prefs(root.getContext());
            try {
                isPlaying = video.getClass().getMethod("isPlaying");
            } catch (NoSuchMethodException ignored) { }
            root.addOnAttachStateChangeListener(this);
            if (root.isAttachedToWindow()) onViewAttachedToWindow(root);
        }

        void mode(int next, View target) {
            if (mode == next && host == target) return;
            mode = next;
            host = target;
            refresh();
        }

        void refresh() {
            generation++;
            failures = 0;
            haveColor = false;
            lastSource = null;
            MAIN.removeCallbacks(this);
            remove();
            config = values(prefs);
            glow.sides = prefs.getInt(PREFIX + "sides", 15);
            if (attached && prefs.getBoolean(ENABLED, false)
                    && prefs.getBoolean(PREFIX + "mode_" + mode, true)) MAIN.post(this);
        }

        void remove() {
            if (installed != null) installed.getOverlay().remove(glow);
            installed = null;
        }

        void dispose() {
            onViewDetachedFromWindow(root);
            root.removeOnAttachStateChangeListener(this);
        }

        @Override public void onViewAttachedToWindow(View v) {
            attached = true;
            prefs.registerOnSharedPreferenceChangeListener(this);
            refresh();
        }

        @Override public void onViewDetachedFromWindow(View v) {
            attached = false;
            prefs.unregisterOnSharedPreferenceChangeListener(this);
            generation++;
            MAIN.removeCallbacks(this);
            remove();
            if (!copying) sample = null;
        }

        @Override public void onSharedPreferenceChanged(SharedPreferences p, String key) {
            if (key == null || key.startsWith(PREFIX)) refresh();
        }

        @Override public void run() {
            if (!attached) return;
            if (!host.isShown() || root.getWindowVisibility() != View.VISIBLE) {
                remove();
                haveColor = false;
                MAIN.postDelayed(this, 350);
                return;
            }
            View surface = source(video);
            if (surface == null || surface.getWidth() < 2 || surface.getHeight() < 2) {
                failed();
                return;
            }
            if (surface != lastSource) {
                lastSource = surface;
                haveColor = false;
                remove();
            }
            host.getLocationOnScreen(origin);
            surface.getLocationOnScreen(position);
            frame.set(position[0] - origin[0], position[1] - origin[1],
                    position[0] - origin[0] + surface.getWidth(), position[1] - origin[1] + surface.getHeight());
            if (mode != POPUP && frame.left <= 0 && frame.top <= 0
                    && frame.right >= host.getWidth() && frame.bottom >= host.getHeight()) {
                remove();
                MAIN.postDelayed(this, 350);
                return;
            }
            long now = SystemClock.uptimeMillis();
            if (isPlaying != null && now >= nextPlaybackCheck) {
                nextPlaybackCheck = now + 350;
                try {
                    playing = Boolean.TRUE.equals(isPlaying.invoke(video));
                } catch (ReflectiveOperationException ignored) {
                    isPlaying = null;
                    playing = true;
                }
            }
            if (!playing && haveColor) {
                glow.video.set(frame);
                glow.setBounds(0, 0, host.getWidth(), host.getHeight());
                glow.invalidateSelf();
                MAIN.postDelayed(this, 350);
                return;
            }
            if (copying) {
                MAIN.postDelayed(this, 100);
                return;
            }
            int size = config[9];
            if (sample == null || sample.getWidth() != size) {
                sample = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            }
            try {
                if (surface instanceof TextureView && ((TextureView) surface).isAvailable()) {
                    sample.eraseColor(Color.TRANSPARENT);
                    ((TextureView) surface).getBitmap(sample);
                    if (Color.alpha(sample.getPixel(size / 2, size / 2)) == 0) failed();
                    else publish();
                } else if (surface instanceof SurfaceView && Build.VERSION.SDK_INT >= 24) {
                    copying = true;
                    final int ticket = generation;
                    PixelCopy.request((SurfaceView) surface, sample, result -> {
                        copying = false;
                        if (ticket != generation || !attached) {
                            if (!attached) sample = null;
                            return;
                        }
                        if (result == PixelCopy.SUCCESS && surface.isShown()) publish();
                        else failed();
                    }, MAIN);
                } else failed();
            } catch (RuntimeException failure) {
                copying = false;
                failed();
            }
        }

        void failed() {
            if (++failures >= 2) {
                remove();
                haveColor = false;
            }
            MAIN.postDelayed(this, 350);
        }

        void publish() {
            failures = 0;
            for (int edge = 0; edge < 4; edge++) {
                for (int cell = 0; cell < SEGMENTS; cell++) {
                    int i = edge * SEGMENTS + cell;
                    int color = edgeColor(sample, edge, cell, config);
                    palette[i] = haveColor ? blend(palette[i], color, config[7]) : color;
                }
            }
            haveColor = true;
            glow.video.set(frame);
            glow.colors = palette;
            glow.inner = mode == POPUP;
            glow.spread = dp(host, glow.inner ? Math.min(14, config[1] * .23f) : config[1]);
            glow.softness = config[2];
            glow.alpha = config[0] * (mode == POPUP ? 120 : 180) / 100;
            glow.setBounds(0, 0, host.getWidth(), host.getHeight());
            if (installed != host) {
                remove();
                host.getOverlay().add(glow);
                installed = host;
            }
            glow.invalidateSelf();
            MAIN.postDelayed(this, 1000 / config[8]);
        }
    }

    private static int edgeColor(Bitmap b, int edge, int cell, int[] config) {
        int n = b.getWidth();
        int r = 0, g = 0, blue = 0, count = 0;
        for (int offset = 0; offset < 3; offset++) {
            int axis = Math.min(n - 1, (cell * 3 + offset) * n / (SEGMENTS * 3));
            for (int depth = 1; depth <= 3; depth++) {
                int inset = Math.min(n - 1, depth * n / 16);
                int x = edge == 2 ? inset : edge == 3 ? n - 1 - inset : axis;
                int y = edge == 0 ? inset : edge == 1 ? n - 1 - inset : axis;
                int color = b.getPixel(x, y);
                if (Math.max(Color.red(color), Math.max(Color.green(color), Color.blue(color))) < 12) continue;
                r += Color.red(color);
                g += Color.green(color);
                blue += Color.blue(color);
                count++;
            }
        }
        if (count == 0) return Color.BLACK;
        r /= count;
        g /= count;
        blue /= count;
        return adjust(Color.rgb(r, g, blue), config);
    }

    static int adjust(int color, int[] config) {
        int r = Color.red(color), g = Color.green(color), blue = Color.blue(color);
        float luminance = .2126f * r + .7152f * g + .0722f * blue;
        float chroma = (Math.max(r, Math.max(g, blue)) - Math.min(r, Math.min(g, blue))) / 255f;
        float saturation = config[5] / 100f + config[6] * (1 - chroma) / 160f;
        return Color.rgb(channel(r, luminance, saturation, config),
                channel(g, luminance, saturation, config), channel(blue, luminance, saturation, config));
    }

    private static int channel(int value, float luminance, float saturation, int[] c) {
        float adjusted = (luminance + (value - luminance) * saturation) * c[3] / 100;
        return Math.max(0, Math.min(255, Math.round(128 + (adjusted - 128) * c[4] / 100)));
    }

    private static int blend(int old, int next, int percent) {
        return Color.rgb(mix(Color.red(old), Color.red(next), percent),
                mix(Color.green(old), Color.green(next), percent), mix(Color.blue(old), Color.blue(next), percent));
    }

    private static int mix(int old, int next, int percent) {
        return Math.round(old + (next - old) * percent / 100f);
    }

    static final class Glow extends Drawable {
        final Rect video = new Rect();
        final Paint paint = new Paint();
        int[] colors = new int[SEGMENTS * 4];
        int sides = 15, spread, softness, alpha;
        boolean inner;
        @Override public void draw(Canvas c) {
            if (spread <= 0 || video.isEmpty() || alpha == 0) return;
            for (int edge = 0; edge < 4; edge++) {
                if ((sides & (1 << edge)) == 0) continue;
                for (int cell = 0; cell < SEGMENTS; cell++) drawBand(c, edge, cell);
            }
        }
        private void drawBand(Canvas c, int edge, int cell) {
            boolean horizontal = edge < 2;
            boolean start = (edge & 1) == 0;
            float step = (horizontal ? video.width() : video.height()) / (float) SEGMENTS;
            float position = (horizontal ? video.left : video.top) + cell * step;
            float from = horizontal ? (start ? video.top : video.bottom) : (start ? video.left : video.right);
            float to = from + (start == inner ? spread : -spread);
            int rgb = colors[edge * SEGMENTS + cell] & 0xffffff;
            if (rgb == 0) return;
            paint.setShader(new LinearGradient(horizontal ? 0 : from, horizontal ? from : 0,
                    horizontal ? 0 : to, horizontal ? to : 0,
                    new int[]{rgb | (alpha << 24), rgb | ((alpha / 3) << 24), rgb},
                    new float[]{0, .2f + .55f * (100 - softness) / 100, 1}, Shader.TileMode.CLAMP));
            if (horizontal) c.drawRect(position, Math.min(from, to), position + step, Math.max(from, to), paint);
            else c.drawRect(Math.min(from, to), position, Math.max(from, to), position + step, paint);
        }
        @Override public void setAlpha(int value) { alpha = value; }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
