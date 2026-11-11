package e.e.a;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.LayerDrawable;
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
import android.widget.TextView;
import android.widget.ImageView;
import android.widget.SeekBar;
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
    static final int[] MAX = {140, 160, 100, 180, 180, 180, 100, 100, 24, 48};
    static final int[] MIN = {0, 4, 0, 0, 50, 0, 0, 5, 2, 12};
    static final int[][] PRESETS = {
            {34, 37, 82, 90, 95, 95, 4, 28, 4, 16},
            {41, 49, 88, 100, 100, 96, 8, 28, 8, 24},
            {61, 72, 78, 110, 100, 112, 14, 42, 10, 24},
            {90, 108, 72, 132, 110, 136, 33, 58, 16, 32}
    };
    private static final int[][] PREVIOUS_PRESETS = {
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

    static boolean enabled(SharedPreferences p) {
        return p.getBoolean(ENABLED, true);
    }

    static boolean appliesTo(SharedPreferences p, int mode) {
        return p.getBoolean(PREFIX + "mode_" + mode, mode != POPUP);
    }

    static int[] values(SharedPreferences p) {
        int[] v = PRESETS[1].clone();
        for (int i = 0; i < v.length; i++) {
            v[i] = Math.max(MIN[i], Math.min(MAX[i], p.getInt(PREFIX + KEYS[i], v[i])));
        }
        // Existing exact preset values follow the updated preset; custom combinations keep their values.
        for (int i = 0; i < PREVIOUS_PRESETS.length; i++) {
            if (Arrays.equals(v, PREVIOUS_PRESETS[i])) return PRESETS[i].clone();
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
        final View playerRoot;
        final int accent;
        int toggleSerial;
        Toggle(View playerRoot) {
            super(playerRoot.getContext());
            this.playerRoot = playerRoot;
            p = prefs(playerRoot.getContext());
            accent = accent(playerRoot.getContext());
            setFocusable(true);
            setOnClickListener(v -> {
                // Show the new state before any sampling or background changes.
                final boolean next = !isSelected();
                showState(next);
                final int ticket = ++toggleSerial;
                MAIN.post(() -> {
                    if (ticket != toggleSerial) return;
                    p.edit().putBoolean(ENABLED, next).apply();
                    Layer current = layer(playerRoot);
                    if (current != null) current.scheduleRefresh();
                    else if (next) {
                        try {
                            View output = video(null, playerRoot);
                            if (output != null) bind(playerRoot, output, NORMAL);
                        } catch (Exception error) {
                            android.util.Log.w("nicoid-ambient", "Cannot rebind ambient playback", error);
                        }
                    }
                });
            });
            refresh();
        }
        void showState(boolean on) {
            setSelected(on);
            setContentDescription(title(getContext()) + (on ? " ON" : " OFF"));
            invalidate();
        }
        void refresh() { showState(enabled(p)); }
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
            Toggle button = new Toggle(root);
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
            Toggle button = new Toggle(root);
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
        // A separate perimeter glow reaches the uncovered fullscreen strips
        // outside the native video parent, but remains behind all controls.
        final Glow perimeterGlow = new Glow();
        final Runnable queuedRefresh = this::refresh;
        final Rect frame = new Rect(), content = new Rect(), window = new Rect();
        final Point windowOrigin = new Point();
        final int[] origin = new int[2], position = new int[2];
        final int[] palette = new int[SEGMENTS * 4];
        View host, installed, lastSource;
        Drawable previousBackground, installedBackground;
        final int[] previousPadding = new int[4];
        View perimeterInstalled, normalOverlayHost;
        Drawable perimeterPrevious, perimeterBackground;
        final int[] perimeterPadding = new int[4];
        int mode, generation, failures;
        Method isPlaying;
        long nextPlaybackCheck;
        boolean playing = true;
        Bitmap sample;
        int[] config;
        boolean copying, attached, haveColor, sampling;

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

        void scheduleRefresh() {
            MAIN.removeCallbacks(queuedRefresh);
            MAIN.post(queuedRefresh);
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
            perimeterGlow.sides = glow.sides;
            sampling = AmbientSampling148.shouldSample(enabled(prefs),
                    appliesTo(prefs, mode), config[0], glow.sides);
            if (attached && sampling) MAIN.post(this);
            else if (!copying) sample = null;
        }

        // Draw illumination as the comment layer background, not as a
        // ViewOverlay painted above captions and playback controls.
        View backdrop() {
            // Both normal and popup need a visible plane ABOVE the video
            // surface and BELOW comments/controls. Using the popup root
            // background puts the light behind its opaque video surface.
            int id = root.getResources().getIdentifier("commentlay", "id",
                    root.getContext().getPackageName());
            return id == 0 ? null : root.findViewById(id);
        }

        void remove() {
            if (installed != null && installed.getBackground() == installedBackground) {
                installed.setBackground(previousBackground);
                installed.setPadding(previousPadding[0], previousPadding[1],
                        previousPadding[2], previousPadding[3]);
            }
            installed = null;
            installedBackground = null;
            previousBackground = null;
            removePerimeter();
        }

        void removePerimeter() {
            if (normalOverlayHost != null) normalOverlayHost.getOverlay().remove(perimeterGlow);
            normalOverlayHost = null;
            perimeterGlow.protectUi = null;
            if (perimeterInstalled != null && perimeterInstalled.getBackground() == perimeterBackground) {
                perimeterInstalled.setBackground(perimeterPrevious);
                perimeterInstalled.setPadding(perimeterPadding[0], perimeterPadding[1],
                        perimeterPadding[2], perimeterPadding[3]);
            }
            perimeterInstalled = null;
            perimeterPrevious = null;
            perimeterBackground = null;
        }

        void install(View target) {
            if (installed == target && target.getBackground() == installedBackground) {
                installPerimeter(target);
                return;
            }
            remove();
            previousBackground = target.getBackground();
            previousPadding[0] = target.getPaddingLeft();
            previousPadding[1] = target.getPaddingTop();
            previousPadding[2] = target.getPaddingRight();
            previousPadding[3] = target.getPaddingBottom();
            Drawable base = previousBackground == null
                    ? new ColorDrawable(Color.TRANSPARENT) : previousBackground;
            LayerDrawable background = new LayerDrawable(new Drawable[]{base, glow});
            target.setBackground(background);
            target.setPadding(previousPadding[0], previousPadding[1],
                    previousPadding[2], previousPadding[3]);
            installed = target;
            installedBackground = background;
            installPerimeter(target);
        }

        // The normal player ViewGroup is exactly video-sized and clips exterior
        // illumination. Draw an outward-only halo on window decor, while
        // excluding foreground captions, text and control icons.
        void installNormalExterior(View target) {
            View decor = root.getRootView();
            if (decor == null || !decor.isShown() || decor.getWidth() < 2 || decor.getHeight() < 2) {
                removePerimeter();
                return;
            }
            if (normalOverlayHost != null && normalOverlayHost != decor) removePerimeter();
            perimeterGlow.colors = glow.colors;
            perimeterGlow.sides = glow.sides;
            perimeterGlow.inner = false;
            perimeterGlow.spread = glow.spread;
            perimeterGlow.softness = glow.softness;
            perimeterGlow.alpha = glow.alpha;
            perimeterGlow.video.set(glow.video);
            decor.getLocationOnScreen(origin);
            target.getLocationOnScreen(position);
            perimeterGlow.video.offset(position[0] - origin[0], position[1] - origin[1]);
            perimeterGlow.protectUi = decor;
            perimeterGlow.setBounds(0, 0, decor.getWidth(), decor.getHeight());
            if (normalOverlayHost == null) {
                decor.getOverlay().add(perimeterGlow);
                normalOverlayHost = decor;
            }
            perimeterGlow.invalidateSelf();
        }

        // Fullscreen's outer margins remain a background beneath controls.
        void installPerimeter(View target) {
            if (mode == NORMAL) {
                installNormalExterior(target);
                return;
            }
            if (mode != FULL || host == target || host.getWidth() < 2 || host.getHeight() < 2) {
                removePerimeter();
                return;
            }
            perimeterGlow.protectUi = null;
            perimeterGlow.colors = glow.colors;
            perimeterGlow.sides = glow.sides;
            perimeterGlow.inner = false;
            perimeterGlow.spread = glow.spread;
            perimeterGlow.softness = glow.softness;
            perimeterGlow.alpha = glow.alpha;
            perimeterGlow.video.set(glow.video);
            host.getLocationOnScreen(origin);
            target.getLocationOnScreen(position);
            perimeterGlow.video.offset(position[0] - origin[0], position[1] - origin[1]);
            perimeterGlow.setBounds(0, 0, host.getWidth(), host.getHeight());
            if (perimeterInstalled != host || host.getBackground() != perimeterBackground) {
                removePerimeter();
                perimeterPrevious = host.getBackground();
                perimeterPadding[0] = host.getPaddingLeft();
                perimeterPadding[1] = host.getPaddingTop();
                perimeterPadding[2] = host.getPaddingRight();
                perimeterPadding[3] = host.getPaddingBottom();
                Drawable base = perimeterPrevious == null
                        ? new ColorDrawable(Color.TRANSPARENT) : perimeterPrevious;
                LayerDrawable background = new LayerDrawable(new Drawable[]{base, perimeterGlow});
                host.setBackground(background);
                host.setPadding(perimeterPadding[0], perimeterPadding[1],
                        perimeterPadding[2], perimeterPadding[3]);
                perimeterInstalled = host;
                perimeterBackground = background;
            }
            perimeterGlow.invalidateSelf();
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
            MAIN.removeCallbacks(queuedRefresh);
            remove();
            if (!copying) sample = null;
        }

        @Override public void onSharedPreferenceChanged(SharedPreferences p, String key) {
            if (key == null || key.startsWith(PREFIX)) {
                if (ENABLED.equals(key) && !enabled(p)) {
                    // Stop sampling without doing heavy drawable surgery inline
                    // with the click callback.
                    generation++;
                    sampling = false;
                    MAIN.removeCallbacks(this);
                }
                scheduleRefresh();
            }
        }

        @Override public void run() {
            // Cancel queued work if a concurrent settings change has made
            // the effect invisible (0% strength / no selected sides).
            if (!attached || !sampling) return;
            if (!host.isShown() || root.getWindowVisibility() != View.VISIBLE) {
                remove();
                haveColor = false;
                MAIN.postDelayed(this, 350);
                return;
            }
            View target = backdrop();
            if (target == null || !target.isShown() || target.getWidth() < 2
                    || target.getHeight() < 2) {
                // A missing backdrop must never fall back to colorizing UI.
                remove();
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
            if (mode == FULL) {
                // Both rectangles use the same root coordinates and include parent transforms and clipping.
                if (!target.getGlobalVisibleRect(window, windowOrigin) || !surface.getGlobalVisibleRect(frame)
                        || !frame.intersect(window)) {
                    failed();
                    return;
                }
                frame.offset(-windowOrigin.x, -windowOrigin.y);
            } else {
                target.getLocationOnScreen(origin);
                surface.getLocationOnScreen(position);
                frame.set(position[0] - origin[0], position[1] - origin[1],
                        position[0] - origin[0] + surface.getWidth(), position[1] - origin[1] + surface.getHeight());
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
                updateGlowFrame();
                glow.setBounds(0, 0, target.getWidth(), target.getHeight());
                install(target);
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
                        if (ticket != generation || !attached || !sampling) {
                            // An in-flight PixelCopy cannot be cancelled: discard
                            // its result after disable/mode switch, never publish
                            // and never restart the sampling loop.
                            if (!attached || !sampling) sample = null;
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
            View target = backdrop();
            if (target == null || !target.isShown() || target.getWidth() < 2
                    || target.getHeight() < 2) {
                remove();
                MAIN.postDelayed(this, 350);
                return;
            }
            failures = 0;
            int size = sample.getWidth();
            content.set(0, 0, size, size);
            if (mode == FULL) {
                content.left = darkMargin(sample, 2);
                content.right -= darkMargin(sample, 3);
                content.top = darkMargin(sample, 0);
                content.bottom -= darkMargin(sample, 1);
            }
            for (int edge = 0; edge < 4; edge++) {
                for (int cell = 0; cell < SEGMENTS; cell++) {
                    int i = edge * SEGMENTS + cell;
                    int color = edgeColor(sample, content, edge, cell, config);
                    palette[i] = haveColor ? blend(palette[i], color, config[7]) : color;
                }
            }
            haveColor = true;
            updateGlowFrame();
            glow.colors = palette;
            // Normal and fullscreen glow only OUTSIDE the video; popup uses
            // its requested limited INNER edge. Never illuminate comment ink.
            glow.inner = mode == POPUP;
            glow.spread = dp(host, mode == POPUP ? Math.min(32, config[1] * .24f) : config[1]);
            glow.softness = config[2];
            glow.alpha = config[0] * (mode == POPUP ? 120 : 180) / 100;
            glow.setBounds(0, 0, target.getWidth(), target.getHeight());
            install(target);
            glow.invalidateSelf();
            MAIN.postDelayed(this, 1000 / config[8]);
        }

        private void updateGlowFrame() {
            int size = sample.getWidth();
            glow.video.set(frame.left + Math.round(frame.width() * content.left / (float) size),
                    frame.top + Math.round(frame.height() * content.top / (float) size),
                    frame.left + Math.round(frame.width() * content.right / (float) size),
                    frame.top + Math.round(frame.height() * content.bottom / (float) size));
        }
    }

    // Some fullscreen sources contain their own black bars inside the sampled surface.
    // Require near-black runs across the edge followed by two clearly lit lines.
    private static int darkMargin(Bitmap b, int edge) {
        int size = b.getWidth();
        int margin = 0;
        int noise = (size - 2) / 12;
        while (margin <= size / 4 && litPixels(b, edge, margin, 16) <= noise) margin++;
        if (margin == 0 || margin > size / 4) return 0;
        int minimum = Math.max(2, size / 5);
        return litPixels(b, edge, margin, 32) >= minimum
                && litPixels(b, edge, margin + 1, 32) >= minimum ? margin : 0;
    }

    private static int litPixels(Bitmap b, int edge, int inset, int threshold) {
        int size = b.getWidth(), lit = 0;
        for (int axis = 1; axis < size - 1; axis++) {
            int x = edge == 2 ? inset : edge == 3 ? size - 1 - inset : axis;
            int y = edge == 0 ? inset : edge == 1 ? size - 1 - inset : axis;
            int color = b.getPixel(x, y);
            if (Math.max(Color.red(color), Math.max(Color.green(color), Color.blue(color))) >= threshold) lit++;
        }
        return lit;
    }

    private static int edgeColor(Bitmap b, Rect bounds, int edge, int cell, int[] config) {
        int along = edge < 2 ? bounds.width() : bounds.height();
        int across = edge < 2 ? bounds.height() : bounds.width();
        int r = 0, g = 0, blue = 0, count = 0;
        for (int offset = 0; offset < 3; offset++) {
            int axis = (edge < 2 ? bounds.left : bounds.top)
                    + (cell * 3 + offset) * along / (SEGMENTS * 3);
            for (int depth = 1; depth <= 3; depth++) {
                int inset = depth * across / 16;
                int x = edge == 2 ? bounds.left + inset : edge == 3 ? bounds.right - 1 - inset : axis;
                int y = edge == 0 ? bounds.top + inset : edge == 1 ? bounds.bottom - 1 - inset : axis;
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
        View protectUi;
        private final Rect shieldRect = new Rect();
        private final int[] shieldOrigin = new int[2];
        private int shieldCount;
        private final int[] edgeColors = new int[SEGMENTS];
        private static final float[] STOPS = {.125f, .375f, .625f, .875f};

        @Override public void draw(Canvas c) {
            if (spread <= 0 || video.isEmpty() || alpha == 0) return;
            int save = c.save();
            if (protectUi != null) {
                protectUi.getLocationOnScreen(shieldOrigin);
                shieldCount = 0;
                shield(c, protectUi, 0);
            }
            for (int edge = 0; edge < 4; edge++) {
                if ((sides & (1 << edge)) != 0) drawEdge(c, edge);
            }
            c.restoreToCount(save);
        }

        // ViewOverlay paints above children: mask foreground glyphs and
        // interactive icon surfaces so their original colors never change.
        private void shield(Canvas canvas, View v, int depth) {
            if (depth > 18 || shieldCount++ > 400 || !v.isShown()) return;
            boolean glyph = v instanceof TextView || v instanceof ImageView || v instanceof SeekBar;
            boolean icon = v.isClickable() && !(v instanceof ViewGroup)
                    && v.getWidth() <= dp(v, 128) && v.getHeight() <= dp(v, 128);
            if ((glyph || icon) && v.getGlobalVisibleRect(shieldRect)) {
                shieldRect.offset(-shieldOrigin[0], -shieldOrigin[1]);
                canvas.clipRect(shieldRect, Region.Op.DIFFERENCE);
            }
            if (v instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) v;
                for (int i = 0; i < group.getChildCount() && shieldCount <= 400; i++)
                    shield(canvas, group.getChildAt(i), depth + 1);
            }
        }

        private void drawEdge(Canvas c, int edge) {
            boolean horizontal = edge < 2;
            boolean start = (edge & 1) == 0;
            float from = horizontal ? (start ? video.top : video.bottom) : (start ? video.left : video.right);
            float to = from + (start == inner ? spread : -spread);
            if (!inner) {
                Rect bounds = getBounds();
                float limit = horizontal ? (start ? bounds.top : bounds.bottom) : (start ? bounds.left : bounds.right);
                to = start ? Math.max(to, limit) : Math.min(to, limit);
                if (start ? to >= from : to <= from) return;
            }
            int base = edge * SEGMENTS;
            for (int i = 0; i < SEGMENTS; i++) {
                int rgb = colors[base + i] & 0xffffff;
                if (rgb != 0) edgeColors[i] = rgb | 0xff000000;
                else {
                    // Fade to transparent without inventing a dark band between colored samples.
                    int neighbor = colors[base + (i == 0 ? 1 : i - 1)];
                    edgeColors[i] = neighbor & 0xffffff;
                }
            }
            float length = horizontal ? video.width() : video.height();
            float depth = Math.abs(to - from);
            Shader along = new LinearGradient(0, 0, length, 0, edgeColors, STOPS, Shader.TileMode.CLAMP);
            Shader fade = new LinearGradient(0, 0, 0, depth,
                    new int[]{alpha << 24, (alpha / 3) << 24, 0},
                    new float[]{0, .25f + .45f * softness / 100, 1}, Shader.TileMode.CLAMP);
            paint.setShader(new ComposeShader(along, fade, PorterDuff.Mode.DST_IN));
            int save = c.save();
            if (horizontal) {
                c.translate(video.left, from);
                c.scale(1, Math.signum(to - from));
            } else {
                c.translate(from, video.top);
                c.rotate(90);
                c.scale(1, -Math.signum(to - from));
            }
            c.drawRect(0, 0, length, depth, paint);
            c.restoreToCount(save);
        }
        @Override public void setAlpha(int value) { alpha = value; }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
