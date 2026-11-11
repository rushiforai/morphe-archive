package e.e.a;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.RadialGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.SweepGradient;
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
import android.widget.ImageButton;
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

    private static final class Toggle extends ImageButton implements SharedPreferences.OnSharedPreferenceChangeListener {
        final SharedPreferences p;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final View playerRoot;
        final int accent;
        Toggle(View playerRoot) {
            super(playerRoot.getContext());
            this.playerRoot = playerRoot;
            p = prefs(playerRoot.getContext());
            accent = accent(playerRoot.getContext());
            // Use the same widget type as other controls so player gestures
            // exclude this hit target. The icon remains custom drawn.
            setBackground(null);
            setPadding(0, 0, 0, 0);
            setFocusable(true);
            setOnClickListener(v -> {
                final boolean next = !enabled(p);
                showState(next);
                // apply() updates shared preferences in memory immediately.
                // Each active Layer observes the change and queues its refresh.
                p.edit().putBoolean(ENABLED, next).apply();
                AmbientGeometryTrace.record("ambient button accepted enabled=" + next);
                if (next && layer(playerRoot) == null) MAIN.post(this::rebind);
            });
            refresh();
        }
        private void rebind() {
            if (!isAttachedToWindow() || !enabled(p) || layer(playerRoot) != null) return;
            try {
                View output = video(null, playerRoot);
                if (output != null) bind(playerRoot, output, NORMAL);
            } catch (Exception error) {
                android.util.Log.w("nicoid-ambient", "Cannot rebind ambient playback", error);
            }
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
        final Glow tabGlow = new Glow();
        final Glow pageGlow = new Glow();
        final DetailPlane detailContent = new DetailPlane("detail-content");
        final DetailPlane detailHeader = new DetailPlane("detail-header");
        final Runnable queuedRefresh = this::refresh;
        final Rect frame = new Rect(), content = new Rect(), window = new Rect();
        final Point windowOrigin = new Point();
        final int[] origin = new int[2], position = new int[2];
        final int[] palette = new int[SEGMENTS * 4];
        View host, installed, lastSource;
        Drawable previousBackground, installedBackground;
        final int[] previousPadding = new int[4];
        View perimeterInstalled;
        View normalOverlayHost, normalTabView, normalPageView;
        ViewGroup normalPagePager;
        Drawable normalTabOriginal, normalTabBackground;
        Drawable normalPageOriginal, normalPageBackground;
        final int[] normalTabPadding = new int[4];
        final int[] normalPagePadding = new int[4];
        final int[] normalEdgeLimits = new int[4];
        final AmbientGeometryTrace trace = new AmbientGeometryTrace();
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
            glow.seamWidth = 0;
            removePageGlow();
            removeTabGlow();
            if (normalOverlayHost != null)
                normalOverlayHost.getOverlay().remove(perimeterGlow);
            normalOverlayHost = null;
            perimeterGlow.edgeLimits = null;
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

        // The native PagerSlidingTabStrip is immediately below the video
        // in portrait playback. Its background is drawn BEFORE its tab
        // labels and indicator, unlike a window overlay. This permits the
        // vivid preset to use the available ~48dp tab strip without
        // recoloring text, icons or other panels.
        void removeTabGlow() {
            if (normalTabView != null && normalTabView.getBackground() == normalTabBackground) {
                normalTabView.setBackground(normalTabOriginal);
                normalTabView.setPadding(normalTabPadding[0], normalTabPadding[1],
                        normalTabPadding[2], normalTabPadding[3]);
            }
            normalTabView = null;
            normalTabOriginal = null;
            normalTabBackground = null;
        }

        View findVideoTabStrip(View node, int depth) {
            if (node == null || depth > 16) return null;
            if ("com.astuetz.PagerSlidingTabStrip".equals(node.getClass().getName()))
                return node;
            if (node instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) node;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View found = findVideoTabStrip(group.getChildAt(i), depth + 1);
                    if (found != null) return found;
                }
            }
            return null;
        }

        boolean installTabGlow(View decor, View target, boolean split) {
            if ((glow.sides & (split ? 8 : 2)) == 0) {
                removeTabGlow();
                return false;
            }
            View tab = split ? findId(root, "pager_title_strip") : findVideoTabStrip(decor, 0);
            if (tab == null || !tab.isShown() || tab.getWidth() < 2 || tab.getHeight() < 2) {
                removeTabGlow();
                return false;
            }
            target.getLocationOnScreen(position);
            int pictureBottom = position[1] + glow.video.bottom;
            int pictureRight = position[0] + glow.video.right;
            tab.getLocationOnScreen(origin);
            int stripTop = origin[1];
            int stripBottom = stripTop + tab.getHeight();
            // Only decorate the tab strip adjoining the native video, not
            // the global navigation or unrelated tabs elsewhere in the UI.
            boolean adjacent = split
                    ? Math.abs(origin[0] - pictureRight) <= dp(root, 12)
                    : stripTop >= pictureBottom - dp(root, 12)
                      && stripTop <= pictureBottom + dp(root, 24)
                      && stripBottom > pictureBottom
                      && tab.getWidth() >= target.getWidth() * .70f;
            if (!adjacent) {
                removeTabGlow();
                return false;
            }
            if (normalTabView != tab || tab.getBackground() != normalTabBackground) {
                removeTabGlow();
                normalTabOriginal = tab.getBackground();
                normalTabPadding[0] = tab.getPaddingLeft();
                normalTabPadding[1] = tab.getPaddingTop();
                normalTabPadding[2] = tab.getPaddingRight();
                normalTabPadding[3] = tab.getPaddingBottom();
                Drawable base = normalTabOriginal == null
                        ? new ColorDrawable(Color.TRANSPARENT) : normalTabOriginal;
                LayerDrawable background = new LayerDrawable(new Drawable[]{base, tabGlow});
                tab.setBackground(background);
                tab.setPadding(normalTabPadding[0], normalTabPadding[1],
                        normalTabPadding[2], normalTabPadding[3]);
                normalTabView = tab;
                normalTabBackground = background;
            }
            tabGlow.colors = glow.colors;
            tabGlow.sides = split ? 8 : 2;
            tabGlow.cornerSources = glow.sides;
            tabGlow.inner = false;
            tabGlow.corners = split;
            tabGlow.normalFade = true;
            tabGlow.sharedFade = true;
            tabGlow.tracePlane = "tab";
            tabGlow.edgeLimits = null;
            tabGlow.spread = glow.spread;
            tabGlow.softness = glow.softness;
            tabGlow.alpha = glow.alpha;
            tabGlow.video.set(glow.video);
            tabGlow.video.offset(position[0] - origin[0], position[1] - origin[1]);
            tabGlow.setBounds(0, 0, tab.getWidth(), tab.getHeight());
            tabGlow.invalidateSelf();
            return true;
        }

        // Draw the continuation of the halo into the native detail page's
        // BACKGROUND. Children (title, thumbnails, icons and cards) are
        // rendered afterward, preserving their own opacity and Z-order.
        void removePageGlow() {
            detailHeader.remove();
            detailContent.remove();
            if (normalPageView != null
                    && normalPageView.getBackground() == normalPageBackground) {
                normalPageView.setBackground(normalPageOriginal);
                normalPageView.setPadding(normalPagePadding[0], normalPagePadding[1],
                        normalPagePadding[2], normalPagePadding[3]);
            }
            normalPageView = null;
            normalPageOriginal = null;
            normalPageBackground = null;
        }

        ViewGroup locateVideoPager(View node, int depth) {
            if (node == null || depth > 18) return null;
            if ("com.sauzask.nicoid.NicoidViewPager".equals(node.getClass().getName())
                    && node instanceof ViewGroup) return (ViewGroup) node;
            if (node instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) node;
                for (int i = 0; i < group.getChildCount(); i++) {
                    ViewGroup result = locateVideoPager(group.getChildAt(i), depth + 1);
                    if (result != null) return result;
                }
            }
            return null;
        }

        boolean detailPageAdjoinsVideo(View page, View decor, boolean split) {
            if (page == null || !page.isShown() || page.getWidth() < dp(root, 70)
                    || page.getHeight() < dp(root, 64)) return false;
            page.getLocationOnScreen(position);
            decor.getLocationOnScreen(origin);
            int x = position[0] - origin[0], y = position[1] - origin[1];
            Rect picture = perimeterGlow.video;
            if (split) {
                return x >= picture.right - dp(root, 20)
                        && x <= picture.right + dp(root, 64)
                        && y < picture.bottom - dp(root, 24)
                        && y + page.getHeight() > picture.top + dp(root, 24)
                        && page.getWidth() >= dp(root, 100);
            }
            return y >= picture.bottom - dp(root, 16)
                    && y <= picture.bottom + dp(root, 110)
                    && x < picture.right - dp(root, 28)
                    && x + page.getWidth() > picture.left + dp(root, 28)
                    && page.getWidth() > picture.width() * .6f;
        }

        View findId(View parent, String name) {
            int id = parent.getResources().getIdentifier(name, "id", parent.getContext().getPackageName());
            return id == 0 ? null : parent.findViewById(id);
        }

        // The native videoinfo_fragment has an opaque LinearLayout inside
        // infoscroll and a separate opaque buttonlay in its header include.
        // Draw on those backgrounds so Android draws the actual UI ink last.
        void installDetailPlanes(View page) {
            View scroll = findId(page, "infoscroll");
            View content = scroll instanceof ViewGroup ? ((ViewGroup) scroll).getChildAt(0) : null;
            detailContent.update(content, page, pageGlow);
            detailHeader.update(content == null ? null : findId(content, "buttonlay"), page, pageGlow);
        }

        private final class DetailPlane {
            final Glow detail = new Glow();
            final int[] padding = new int[4];
            View view;
            Drawable original, installed;

            DetailPlane(String name) { detail.tracePlane = name; }

            void remove() {
                if (view != null && view.getBackground() == installed) {
                    view.setBackground(original);
                    view.setPadding(padding[0], padding[1], padding[2], padding[3]);
                }
                view = null;
                original = installed = null;
            }

            void update(View next, View page, Glow reference) {
                if (next == null || next.getBackground() == null || !next.isShown()) {
                    remove();
                    return;
                }
                if (view != next || next.getBackground() != installed) {
                    remove();
                    original = next.getBackground();
                    padding[0] = next.getPaddingLeft();
                    padding[1] = next.getPaddingTop();
                    padding[2] = next.getPaddingRight();
                    padding[3] = next.getPaddingBottom();
                    installed = new LayerDrawable(new Drawable[]{original, detail});
                    view = next;
                    next.setBackground(installed);
                    next.setPadding(padding[0], padding[1], padding[2], padding[3]);
                }
                detail.colors = reference.colors;
                detail.sides = reference.sides;
                detail.corners = reference.corners;
                detail.cornerSources = reference.cornerSources;
                detail.normalFade = detail.sharedFade = true;
                detail.spread = reference.spread;
                detail.softness = reference.softness;
                detail.alpha = reference.alpha;
                detail.video.set(reference.video);
                page.getLocationOnScreen(origin);
                next.getLocationOnScreen(position);
                detail.video.offset(origin[0] - position[0], origin[1] - position[1]);
                detail.setBounds(0, 0, next.getWidth(), next.getHeight());
                detail.invalidateSelf();
            }
        }

        boolean installPageGlow(View decor, boolean split) {
            if ((glow.sides & (split ? 8 : 2)) == 0) {
                removePageGlow();
                return false;
            }
            if (normalPagePager == null || !normalPagePager.isAttachedToWindow())
                normalPagePager = locateVideoPager(decor, 0);
            if (normalPagePager == null || !normalPagePager.isShown()) {
                removePageGlow();
                return false;
            }
            View matched = null;
            for (int i = 0; i < normalPagePager.getChildCount(); i++) {
                View page = normalPagePager.getChildAt(i);
                if (detailPageAdjoinsVideo(page, decor, split)) {
                    matched = page;
                    break;
                }
            }
            if (matched == null) {
                removePageGlow();
                return false;
            }
            // The page's own background must not be temporarily replaced
            // with another page's cached drawable during a tab switch.
            if (matched != normalPageView
                    || matched.getBackground() != normalPageBackground) {
                removePageGlow();
                normalPageOriginal = matched.getBackground();
                normalPagePadding[0] = matched.getPaddingLeft();
                normalPagePadding[1] = matched.getPaddingTop();
                normalPagePadding[2] = matched.getPaddingRight();
                normalPagePadding[3] = matched.getPaddingBottom();
                Drawable base = normalPageOriginal == null
                        ? new ColorDrawable(Color.TRANSPARENT) : normalPageOriginal;
                LayerDrawable layer = new LayerDrawable(new Drawable[]{base, pageGlow});
                matched.setBackground(layer);
                matched.setPadding(normalPagePadding[0], normalPagePadding[1],
                        normalPagePadding[2], normalPagePadding[3]);
                normalPageView = matched;
                normalPageBackground = layer;
            }
            pageGlow.colors = glow.colors;
            pageGlow.sides = split ? 8 : 2;  // Right side / portrait bottom.
            pageGlow.inner = false;
            pageGlow.cornerSources = glow.sides;
            pageGlow.corners = split;       // Also right-upper/right-lower.
            pageGlow.normalFade = true;
            pageGlow.sharedFade = true;
            pageGlow.tracePlane = "page";
            pageGlow.edgeLimits = null;
            pageGlow.spread = glow.spread;
            pageGlow.softness = glow.softness;
            pageGlow.alpha = glow.alpha;
            pageGlow.video.set(perimeterGlow.video);
            decor.getLocationOnScreen(origin);
            matched.getLocationOnScreen(position);
            pageGlow.video.offset(origin[0] - position[0],
                    origin[1] - position[1]);
            pageGlow.setBounds(0, 0, matched.getWidth(), matched.getHeight());
            pageGlow.invalidateSelf();
            installDetailPlanes(matched);
            return true;
        }

        /**
         * The videoLayout is clipped at the picture edges. The halo must
         * reach the adjacent app gutter, but never wash over controls or
         * the detail panel. Compose ONLY narrow, fully faded OUTSIDE bands
         * on the decor overlay. No glyph cutouts and no rectangle masks.
         */
        void installNormalExterior(View target) {
            View decor = root.getRootView();
            if (decor == null || !decor.isShown() || decor.getWidth() < 2
                    || decor.getHeight() < 2) {
                removePerimeter();
                return;
            }
            if (normalOverlayHost != null && normalOverlayHost != decor) removePerimeter();
            perimeterGlow.colors = glow.colors;
            perimeterGlow.sides = glow.sides;
            perimeterGlow.inner = false;
            perimeterGlow.corners = true;
            perimeterGlow.normalFade = true;
            perimeterGlow.tracePlane = "normal-overlay";
            perimeterGlow.spread = glow.spread;
            perimeterGlow.softness = glow.softness;
            perimeterGlow.alpha = glow.alpha;
            perimeterGlow.video.set(glow.video);
            decor.getLocationOnScreen(origin);
            target.getLocationOnScreen(position);
            perimeterGlow.video.offset(position[0] - origin[0], position[1] - origin[1]);
            perimeterGlow.setBounds(0, 0, decor.getWidth(), decor.getHeight());

            // Preserve the preset spread wherever the normal player has
            // unobstructed area. dev.7 capped even Vivid to 9-24dp and made
            // it barely distinguishable from the power-saving preset.
            boolean split = perimeterGlow.video.right < decor.getWidth() * .78f;
            int topSafe = dp(root, split ? Math.min(72f, config[1] * .62f)
                    : Math.min(20f, config[1] * .32f));
            int bottomSafe = dp(root, split ? Math.min(64f, config[1] * .52f)
                    : Math.min(25f, config[1] * .30f));
            // Do not wash over the nearby right-side thumbnail or title.
            int sideSafe = dp(root, split ? 8 : 10);
            boolean tabGlowActive = installTabGlow(decor, target, split);
            boolean pageGlowActive = installPageGlow(decor, split);
            updateSplitSeam(target, split && pageGlowActive);
            int topInset = 0, bottomInset = 0, leftInset = 0, rightInset = 0;
            if (Build.VERSION.SDK_INT >= 23 && decor.getRootWindowInsets() != null) {
                android.view.WindowInsets insets = decor.getRootWindowInsets();
                topInset = insets.getSystemWindowInsetTop();
                bottomInset = insets.getSystemWindowInsetBottom();
                leftInset = insets.getSystemWindowInsetLeft();
                rightInset = insets.getSystemWindowInsetRight();
            }
            Rect r = perimeterGlow.video;
            // Zero means do not draw the edge. Each band fades to fully
            // transparent at its computed limit; no straight color seams.
            normalEdgeLimits[0] = Math.max(0, Math.min(topSafe, r.top - topInset));
            // The portrait tab strip has its own BACKGROUND glow, so keep
            // the window foreground overlay away from its labels entirely.
            normalEdgeLimits[1] = tabGlowActive ? 0 : Math.max(0, Math.min(bottomSafe,
                    decor.getHeight() - bottomInset - r.bottom));
            normalEdgeLimits[2] = Math.max(0, Math.min(sideSafe, r.left - leftInset));
            // The detail page background now carries the long-lived right
            // halo, while the window overlay avoids washing over its labels.
            normalEdgeLimits[3] = pageGlowActive && split ? 0 : Math.max(0,
                    Math.min(sideSafe, decor.getWidth() - rightInset - r.right));
            perimeterGlow.edgeLimits = normalEdgeLimits;
            // In split playback the left comment backdrop already covers
            // both player bands. A decor overlay there would sit over icons.
            if (split) {
                if (normalOverlayHost != null) normalOverlayHost.getOverlay().remove(perimeterGlow);
                normalOverlayHost = null;
                Arrays.fill(normalEdgeLimits, 0);
            } else {
                if (normalOverlayHost == null) {
                    decor.getOverlay().add(perimeterGlow);
                    normalOverlayHost = decor;
                }
                perimeterGlow.invalidateSelf();
            }
            if (trace.begin()) {
                trace.layout(root, host, decor, target, lastSource, findVideoTabStrip(decor, 0),
                        normalPagePager, normalPageView, frame, glow.video, r, normalEdgeLimits,
                        config[0], config[1], split, tabGlowActive, pageGlowActive);
            }
        }

        private void updateSplitSeam(View target, boolean adjoiningPage) {
            glow.seamWidth = 0;
            if (!adjoiningPage || (glow.sides & 8) == 0
                    || Math.abs(glow.video.right - target.getWidth()) > 1) return;
            Drawable base = detailContent.original != null ? detailContent.original : normalPageOriginal;
            if (!(base instanceof ColorDrawable)) return;
            int color = ((ColorDrawable) base).getColor();
            if (Color.alpha(color) != 255) return;
            glow.seamColor = color;
            glow.seamWidth = Math.min(dp(root, 24), glow.spread / 3);
        }

        void installPerimeter(View target) {
            if (mode == NORMAL) {
                installNormalExterior(target);
                return;
            }
            if (mode != FULL || host == target || host.getWidth() < 2
                    || host.getHeight() < 2) {
                removePerimeter();
                return;
            }
            // The existing FULLSCREEN path is intentionally unchanged.
            perimeterGlow.edgeLimits = null;
            perimeterGlow.normalFade = false;
            perimeterGlow.tracePlane = null;
            perimeterGlow.corners = false;
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
                Drawable underlay = perimeterPrevious == null
                        ? new ColorDrawable(Color.TRANSPARENT) : perimeterPrevious;
                LayerDrawable background = new LayerDrawable(
                        new Drawable[]{underlay, perimeterGlow});
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
                if (mode == NORMAL) trace.unavailable("backdrop", target);
                // A missing backdrop must never fall back to colorizing UI.
                remove();
                MAIN.postDelayed(this, 350);
                return;
            }
            View surface = source(video);
            if (surface == null || surface.getWidth() < 2 || surface.getHeight() < 2) {
                if (mode == NORMAL) trace.unavailable("surface", surface);
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
            glow.normalFade = glow.sharedFade = mode == NORMAL;
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
        int sides = 15, cornerSources, spread, softness, alpha;
        int seamWidth, seamColor;
        boolean inner, corners, normalFade, sharedFade;
        String tracePlane;
        long nextTrace;
        int lastTraceHash;
        final Rect traceClip = new Rect();
        int[] edgeLimits;
        private final int[] edgeColors = new int[SEGMENTS];
        private static final float[] STOPS = {.125f, .375f, .625f, .875f};

        @Override public void draw(Canvas c) {
            if (spread <= 0 || video.isEmpty() || alpha == 0) return;
            int save = sharedFade ? c.save() : -1;
            if (sharedFade) c.clipRect(getBounds());
            if (tracePlane != null && SystemClock.uptimeMillis() >= nextTrace) {
                nextTrace = SystemClock.uptimeMillis() + 1000;
                c.getClipBounds(traceClip);
                String message = "draw " + tracePlane + " clip=" + traceClip.toShortString()
                        + " bounds=" + getBounds().toShortString() + " video=" + video.toShortString()
                        + " spreadPx=" + spread + " sides=" + sides
                        + " limitsPx=" + Arrays.toString(edgeLimits);
                int hash = message.hashCode();
                if (hash != lastTraceHash) {
                    lastTraceHash = hash;
                    AmbientGeometryTrace.record(message);
                }
            }
            if (seamWidth > 0) drawSplitSeam(c);
            for (int edge = 0; edge < 4; edge++)
                if ((sides & (1 << edge)) != 0) drawEdge(c, edge);
            if (corners && !inner) {
                if (sharedFade) drawSharedCorners(c);
                else drawCorners(c);
            }
            if (sharedFade) c.restoreToCount(save);
        }

        // Draw a softly decaying elliptical halo in each outer corner.
        // The transparency reaches zero exactly at the narrow gutter cap,
        // so landscape split panes have no abrupt rectangular boundaries.
        private void drawCorners(Canvas c) {
            final int[][] samples = {{0, 8}, {3, 12}, {4, 11}, {7, 15}};
            final int[][] positions = {
                    {video.left, video.top, -1, -1},
                    {video.right, video.top, 1, -1},
                    {video.left, video.bottom, -1, 1},
                    {video.right, video.bottom, 1, 1}
            };
            for (int i = 0; i < 4; i++) {
                int side = (i & 1) == 0 ? 2 : 3;
                int vertical = i < 2 ? 0 : 1;
                if ((sides & (1 << side)) == 0 && (sides & (1 << vertical)) == 0)
                    continue;
                int xRadius = sharedFade ? spread : Math.min(spread, Math.max(0, videoDepth(side)));
                int yRadius = sharedFade ? spread : Math.min(spread, Math.max(0, videoDepth(vertical)));
                if (xRadius < 1 || yRadius < 1) continue;
                int colorA = colors[samples[i][0]];
                int colorB = colors[samples[i][1]];
                int r = (Color.red(colorA) + Color.red(colorB)) / 2;
                int g = (Color.green(colorA) + Color.green(colorB)) / 2;
                int b = (Color.blue(colorA) + Color.blue(colorB)) / 2;
                int rgb = Color.rgb(r, g, b) & 0xffffff;
                int startAlpha = Math.min(255,
                        Math.round(alpha * (normalFade ? .82f : .5f)));
                int middleAlpha = Math.round(startAlpha * (normalFade ? .64f : .33f));
                paint.setShader(new RadialGradient(0, 0, 1f,
                        new int[]{(startAlpha << 24) | rgb,
                                (middleAlpha << 24) | rgb, rgb},
                        new float[]{0f, .4f, 1f}, Shader.TileMode.CLAMP));
                int save = c.save();
                c.translate(positions[i][0], positions[i][1]);
                c.scale(xRadius, yRadius);
                int sx = positions[i][2], sy = positions[i][3];
                c.drawRect(sx < 0 ? -1f : 0f, sy < 0 ? -1f : 0f,
                        sx < 0 ? 0f : 1f, sy < 0 ? 0f : 1f, paint);
                c.restoreToCount(save);
            }
        }

        // Match the neighboring background under the halo, only in the
        // player bands. Fade the backing color into the native dark pane.
        private void drawSplitSeam(Canvas c) {
            float right = video.right;
            float left = Math.max(video.left, right - seamWidth);
            int rgb = seamColor & 0xffffff;
            Shader across = new LinearGradient(left, 0, right, 0,
                    new int[]{rgb, rgb | 0xff000000}, null, Shader.TileMode.CLAMP);
            for (int edge = 0; edge < 2; edge++) {
                if ((sides & (1 << edge)) == 0) continue;
                float from = edge == 0 ? video.top : video.bottom;
                float to = from + (edge == 0 ? -spread : spread);
                Shader depth = new LinearGradient(0, from, 0, to,
                        new int[]{0xff000000, 0xff000000, 0},
                        new float[]{0f, .72f, 1f}, Shader.TileMode.CLAMP);
                paint.setShader(new ComposeShader(across, depth, PorterDuff.Mode.DST_IN));
                c.drawRect(left, Math.min(from, to), right, Math.max(from, to), paint);
            }
        }

        // Match the adjacent straight edges at both axes of each quadrant.
        private void drawSharedCorners(Canvas c) {
            for (int corner = 0; corner < 4; corner++) {
                boolean right = (corner & 1) != 0;
                boolean bottom = corner >= 2;
                int side = right ? 3 : 2;
                if ((sides & (1 << side)) == 0) continue;
                int vertical = bottom ? 1 : 0;
                int sideRgb = colors[side * SEGMENTS + (bottom ? SEGMENTS - 1 : 0)] & 0xffffff;
                int verticalRgb = colors[vertical * SEGMENTS + (right ? SEGMENTS - 1 : 0)] & 0xffffff;
                int xColor = sideRgb == 0 ? verticalRgb : sideRgb | 0xff000000;
                int yColor = (cornerSources & (1 << vertical)) == 0 || verticalRgb == 0
                        ? sideRgb : verticalRgb | 0xff000000;
                Shader angle = new SweepGradient(0, 0, new int[]{xColor, yColor, xColor},
                        new float[]{0f, .25f, 1f});
                Shader fade = new RadialGradient(0, 0, 1f, normalAlphaStops(),
                        new float[]{0f, .72f, 1f}, Shader.TileMode.CLAMP);
                paint.setShader(new ComposeShader(angle, fade, PorterDuff.Mode.DST_IN));
                int save = c.save();
                c.translate(right ? video.right : video.left, bottom ? video.bottom : video.top);
                c.scale(right ? spread : -spread, bottom ? spread : -spread);
                c.drawRect(0f, 0f, 1f, 1f, paint);
                c.restoreToCount(save);
            }
        }

        private int[] normalAlphaStops() {
            return new int[]{alpha << 24, Math.min(255, Math.round(alpha * .76f)) << 24, 0};
        }

        private int videoDepth(int edge) {
            if (edgeLimits != null) return edgeLimits[edge];
            Rect bounds = getBounds();
            switch (edge) {
                case 0: return video.top - bounds.top;
                case 1: return bounds.bottom - video.bottom;
                case 2: return video.left - bounds.left;
                default: return bounds.right - video.right;
            }
        }

        private void drawEdge(Canvas c, int edge) {
            boolean horizontal = edge < 2;
            boolean start = (edge & 1) == 0;
            float from = horizontal ? (start ? video.top : video.bottom) : (start ? video.left : video.right);
            int depthLimit = edgeLimits == null ? spread : Math.min(spread, edgeLimits[edge]);
            if (depthLimit < 1) return;
            float to = from + (start == inner ? depthLimit : -depthLimit);
            if (!inner && !sharedFade) {
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
            // Normal mode uses more of the selected preset's spread. The
            // original falloff remains for FULL and POPUP for compatibility.
            float middleAt = normalFade ? .72f
                    : .25f + .45f * softness / 100;
            Shader fade = new LinearGradient(0, 0, 0, depth,
                    normalFade ? normalAlphaStops() : new int[]{alpha << 24, (alpha / 3) << 24, 0},
                    new float[]{0, middleAt, 1}, Shader.TileMode.CLAMP);
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
