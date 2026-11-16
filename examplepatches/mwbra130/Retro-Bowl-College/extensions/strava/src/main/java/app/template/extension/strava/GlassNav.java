package app.template.extension.strava;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Liquid Glass bottom navigation for Strava — runtime half.
 *
 * Rebuilt after studying how the official Morphe YouTube / YouTube
 * Music glass navigation bar and hxreborn's Proton VPN floating bar
 * are implemented. The method is the opposite of the earlier
 * attempts: the bar view is never moved. Nothing touches its
 * LayoutParams, margins or constraints — the layout system (here a
 * ConstraintLayout with a barrier tied to the bar) overwrites or
 * ignores that from the outside, which is why the margin and anchor
 * versions never floated.
 *
 * Instead, like Morphe:
 *
 *   - The bar keeps its exact box. A capsule drawable becomes its
 *     background and paints a rounded glass capsule INSET inside
 *     that box (shadow, blurred backdrop, tint, sheen, rim, bevel);
 *     everything outside the capsule stays transparent.
 *   - The float comes from the bar's own PADDING: side padding
 *     narrows the tab row to the capsule's width, and the top and
 *     bottom padding are adjusted a few dp per frame so the capsule
 *     sits the wanted distance above the bottom of the screen. The
 *     bar grows through its padding, and the app's own layout (the
 *     barrier, the banner, the content) follows the bar's height.
 *   - A PreDraw listener re-asserts all of it every frame: if the
 *     app hands the bar its own background again, the capsule goes
 *     back; if the geometry drifted, the padding deltas are
 *     recomputed from the tab row's real position.
 *   - The backdrop is a RenderNode recording of the page content
 *     with a RenderEffect blur (Android 14+, the range Morphe
 *     considers safe; older versions get the page background color
 *     under the tint instead of a blur). The page content is
 *     re-constrained to the bottom of the screen so it scrolls
 *     underneath the capsule, and lists that reach the bottom of
 *     the page get bottom padding so their last item can scroll
 *     clear of the bar.
 *
 * Tweaks live in Strava's own preferences file (the Liquid Glass
 * section of the Extra Settings screen writes them; with no
 * settings UI present the defaults rule):
 *   morphe.glass.enabled   master switch            (default true)
 *   morphe.glass.floating  floating pill vs docked  (default true)
 *   morphe.glass.blur      backdrop blur vs tint    (default true)
 *   morphe.glass.opacity   tint opacity, percent    (default 45)
 * Changes apply on the next app start.
 *
 * Everything is failure-swallowing: worst case the bar keeps its
 * stock look, and the activity never breaks.
 */
public final class GlassNav {

    public static final String KEY_ENABLED = "morphe.glass.enabled";
    public static final String KEY_FLOATING = "morphe.glass.floating";
    public static final String KEY_BLUR = "morphe.glass.blur";
    public static final String KEY_OPACITY = "morphe.glass.opacity";

    private GlassNav() {
    }

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences("com.strava_preferences", Context.MODE_PRIVATE);
    }

    public static void apply(final Activity activity) {
        try {
            SharedPreferences prefs = prefs(activity);
            if (!prefs.getBoolean(KEY_ENABLED, true)) {
                return;
            }
            String pkg = activity.getPackageName();
            int navId = activity.getResources().getIdentifier("bottom_navigation", "id", pkg);
            if (navId == 0) {
                return;
            }
            View nav = activity.findViewById(navId);
            if (nav == null) {
                return;
            }
            int containerId = activity.getResources()
                    .getIdentifier("toolbar_container", "id", pkg);
            View content = containerId != 0 ? activity.findViewById(containerId) : null;

            Capsule capsule = new Capsule(
                    activity, nav, content,
                    prefs.getBoolean(KEY_FLOATING, true),
                    prefs.getBoolean(KEY_BLUR, true),
                    prefs.getInt(KEY_OPACITY, 45));
            capsule.install();
        } catch (Throwable ignored) {
            // Never let a styling failure break the activity.
        }
    }

    // ------------------------------------------------------------------
    // Capsule controller: installs the drawable + per-frame upkeep.
    // ------------------------------------------------------------------

    private static final class Capsule implements ViewTreeObserver.OnPreDrawListener {
        private final WeakReference<Activity> activityRef;
        private final WeakReference<View> barRef;
        private final WeakReference<View> contentRef;
        private final boolean floating;
        private int measuredSidePad = -1;
        private int measuredForWidth = -1;
        private final int topRoomPx;
        private final int minBottomRoomPx;
        private final float density;
        private final CapsuleDrawable glass;
        private final ListPadding listPadding = new ListPadding();

        private Drawable appBackground;
        private int[] appPadding; // left, top, right, bottom as the app set them
        private boolean active;
        private int skippedFrames;

        Capsule(Activity activity, View bar, View content,
                boolean floating, boolean blur, int opacityPct) {
            this.activityRef = new WeakReference<>(activity);
            this.barRef = new WeakReference<>(bar);
            this.contentRef = new WeakReference<>(content);
            this.floating = floating;
            this.density = activity.getResources().getDisplayMetrics().density;
            this.topRoomPx = floating ? Math.round(6 * density) : 0;
            this.minBottomRoomPx = floating ? Math.round(10 * density) : 0;
            this.glass = new CapsuleDrawable(bar, content, surfaceColor(activity),
                    opacityPct, blur, density);
        }

        void install() {
            View bar = barRef.get();
            if (bar == null) {
                return;
            }
            bar.getViewTreeObserver().addOnPreDrawListener(this);
            bar.getViewTreeObserver().addOnScrollChangedListener(() -> {
                View b = barRef.get();
                if (b != null && active) {
                    b.invalidate();
                }
            });
            View content = contentRef.get();
            if (content != null) {
                // Pages scroll underneath the capsule.
                setContentConstraint(content, true);
                if (content instanceof ViewGroup) {
                    ViewGroup group = (ViewGroup) content;
                    group.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                        View b = barRef.get();
                        if (b != null && active) {
                            listPadding.update(group, b.getHeight());
                        }
                    });
                }
            }
        }

        @Override
        public boolean onPreDraw() {
            try {
                View bar = barRef.get();
                Activity activity = activityRef.get();
                if (bar == null || activity == null) {
                    return true;
                }
                ViewGroup tabs = tabsOf(bar);
                boolean eligible = bar.getVisibility() == View.VISIBLE
                        && bar.getWidth() > 2 * bar.getHeight()
                        && tabs != null && tabs.getChildCount() > 0;
                if (!eligible) {
                    if (active) {
                        restore(bar);
                    }
                    return true;
                }

                boolean layoutChanged = false;

                // Background: the app re-hands the bar its own
                // background on theme changes; put the capsule back.
                if (bar.getBackground() != glass) {
                    appBackground = bar.getBackground();
                    if (appPadding == null) {
                        appPadding = new int[]{bar.getPaddingLeft(), bar.getPaddingTop(),
                                bar.getPaddingRight(), bar.getPaddingBottom()};
                    }
                    bar.setBackground(glass);
                }
                active = true;

                // Pages scroll underneath the capsule; Strava can
                // re-constrain them, so re-assert while active.
                View contentNow = contentRef.get();
                if (contentNow != null) {
                    setContentConstraint(contentNow, true);
                }

                // Geometry from the tab row's real position.
                int capsuleTopWanted = topRoomPx + Math.round(2 * density);
                int roomWanted = Math.max(minBottomRoomPx,
                        systemBottomRoom(bar) - Math.round(4 * density));

                int padLeft = sidePadFor(bar, tabs);
                int padRight = padLeft;
                int padTop = bar.getPaddingTop()
                        + (capsuleTopWanted - (tabs.getTop() + Math.round(3 * density)));
                int capsuleBottom = tabs.getBottom() - Math.round(3 * density);
                int padBottom = bar.getPaddingBottom()
                        + (roomWanted - (bar.getHeight() - capsuleBottom));
                padTop = Math.max(0, padTop);
                padBottom = Math.max(0, padBottom);

                if (bar.getPaddingLeft() != padLeft || bar.getPaddingTop() != padTop
                        || bar.getPaddingRight() != padRight
                        || bar.getPaddingBottom() != padBottom) {
                    bar.setPadding(padLeft, padTop, padRight, padBottom);
                    layoutChanged = true;
                }

                // Capsule hugs the tab row inside the padded box.
                glass.setCapsule(
                        padLeft,
                        tabs.getTop() + Math.round(3 * density),
                        bar.getWidth() - padRight,
                        tabs.getBottom() - Math.round(3 * density));

                // Skip a frame after a layout change so no frame is
                // drawn with stale geometry (Morphe does the same,
                // capped so drawing can never stall).
                if (layoutChanged && skippedFrames < 2) {
                    skippedFrames++;
                    return false;
                }
                skippedFrames = 0;
                return true;
            } catch (Throwable ignored) {
                return true;
            }
        }

        private void restore(View bar) {
            try {
                if (bar.getBackground() == glass) {
                    bar.setBackground(appBackground);
                }
                if (appPadding != null) {
                    bar.setPadding(appPadding[0], appPadding[1], appPadding[2], appPadding[3]);
                }
                View content = contentRef.get();
                if (content != null) {
                    setContentConstraint(content, false);
                }
            } catch (Throwable ignored) {
            }
            active = false;
        }

        /**
         * The side padding that makes the capsule hug the tabs,
         * centered — Morphe's layout rule: the capsule is as wide as
         * the buttons need (their content width plus spacing), not
         * the full width of the bar. Falls back to 16dp.
         */
        private int sidePadFor(View bar, ViewGroup tabs) {
            if (!floating) {
                return 0;
            }
            int w = bar.getWidth();
            if (measuredSidePad >= 0 && measuredForWidth == w) {
                return measuredSidePad;
            }
            int pad = Math.round(16 * density);
            try {
                java.util.List<Integer> widths = new java.util.ArrayList<>();
                for (int i = 0; i < tabs.getChildCount(); i++) {
                    View item = tabs.getChildAt(i);
                    if (item.getVisibility() == View.GONE) {
                        continue;
                    }
                    int cw = contentWidth(item, 0);
                    if (cw > 0) {
                        widths.add(cw);
                    }
                }
                if (!widths.isEmpty()) {
                    java.util.Collections.sort(widths);
                    int median = widths.get(widths.size() / 2);
                    int button = Math.max(Math.round(56 * density),
                            median + Math.round(20 * density));
                    int capsuleWidth = widths.size() * button + Math.round(20 * density);
                    int maxWidth = w - Math.round(24 * density);
                    if (capsuleWidth > maxWidth) {
                        capsuleWidth = maxWidth;
                    }
                    pad = Math.max(Math.round(12 * density), (w - capsuleWidth) / 2);
                }
            } catch (Throwable ignored) {
            }
            measuredSidePad = pad;
            measuredForWidth = w;
            return pad;
        }

        /** The width of a tab's content: its widest visible icon or label. */
        private static int contentWidth(View view, int depth) {
            if (view.getVisibility() != View.VISIBLE) {
                return 0;
            }
            if (view instanceof android.widget.TextView) {
                android.widget.TextView label = (android.widget.TextView) view;
                CharSequence text = label.getText();
                if (text == null || text.length() == 0) {
                    return 0;
                }
                return (int) Math.ceil(label.getPaint().measureText(text.toString()))
                        + label.getPaddingLeft() + label.getPaddingRight();
            }
            if (view instanceof android.widget.ImageView) {
                Drawable icon = ((android.widget.ImageView) view).getDrawable();
                int intrinsic = icon != null ? icon.getIntrinsicWidth() : 0;
                return Math.max(view.getWidth(), intrinsic);
            }
            if (view instanceof ViewGroup && depth < 3) {
                int max = 0;
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    max = Math.max(max, contentWidth(group.getChildAt(i), depth + 1));
                }
                return max;
            }
            return 0;
        }

        private static ViewGroup tabsOf(View bar) {
            if (bar instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) bar;
                for (int i = 0; i < group.getChildCount(); i++) {
                    if (group.getChildAt(i) instanceof ViewGroup) {
                        return (ViewGroup) group.getChildAt(i);
                    }
                }
            }
            return null;
        }

        private int systemBottomRoom(View view) {
            try {
                WindowInsets insets = view.getRootWindowInsets();
                if (insets == null) {
                    return 0;
                }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    return insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
                }
                return insets.getSystemWindowInsetBottom();
            } catch (Throwable ignored) {
                return 0;
            }
        }
    }

    // ------------------------------------------------------------------
    // List bottom padding: lists that end at the bottom of the page
    // get room below their last item, so it can scroll above the bar
    // (the app set padding is kept and re-based if the app resets it).
    // ------------------------------------------------------------------

    private static final class ListPadding {
        private final Map<View, int[]> room = new WeakHashMap<>();
        private final Map<Class<?>, Boolean> listClasses = new WeakHashMap<>();

        void update(ViewGroup content, int barHeight) {
            try {
                walk(content, content, barHeight, 0);
            } catch (Throwable ignored) {
            }
        }

        private void walk(ViewGroup content, View view, int barHeight, int depth) {
            if (view.getVisibility() == View.GONE || depth > 12) {
                return;
            }
            if (view != content && isList(view)) {
                boolean atBottom = bottomIn(view, content) >= content.getHeight() - 2
                        && view.getHeight() > content.getHeight() / 3;
                setRoom(view, atBottom ? barHeight : 0);
                return; // Items inside the list are not walked.
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    walk(content, group.getChildAt(i), barHeight, depth + 1);
                }
            }
        }

        private boolean isList(View view) {
            Class<?> type = view.getClass();
            Boolean cached = listClasses.get(type);
            if (cached != null) {
                return cached;
            }
            boolean list = false;
            for (Class<?> t = type; t != null && t != View.class; t = t.getSuperclass()) {
                if (t.getSimpleName().equals("RecyclerView")) {
                    list = true;
                    break;
                }
            }
            listClasses.put(type, list);
            return list;
        }

        private void setRoom(View view, int extra) {
            int current = view.getPaddingBottom();
            int[] state = room.get(view);
            if (state == null) {
                if (extra <= 0) {
                    return;
                }
                state = new int[]{current, current};
                room.put(view, state);
            } else if (current != state[1]) {
                state[0] = current; // The app set its padding again.
            }
            int target = state[0] + extra;
            state[1] = target;
            if (current != target) {
                view.setPadding(view.getPaddingLeft(), view.getPaddingTop(),
                        view.getPaddingRight(), target);
            }
        }

        private static int bottomIn(View view, View ancestor) {
            int top = 0;
            View current = view;
            while (current != ancestor) {
                top += current.getTop();
                ViewParent parent = current.getParent();
                if (!(parent instanceof View)) {
                    break;
                }
                current = (View) parent;
            }
            return top + view.getHeight();
        }
    }

    // ------------------------------------------------------------------
    // Content constraint: pages extend to the bottom of the screen,
    // behind the bar (ConstraintLayout fields set reflectively — the
    // extension compiles against the stock Android SDK only).
    // ------------------------------------------------------------------

    private static void setContentConstraint(View container, boolean under) {
        try {
            ViewGroup.LayoutParams raw = container.getLayoutParams();
            if (raw == null) {
                return;
            }
            boolean changed = false;
            if (under) {
                changed |= setIntField(raw, "bottomToBottom", 0); // PARENT_ID
                changed |= setIntField(raw, "bottomToTop", -1);   // UNSET
            } else {
                String pkg = container.getContext().getPackageName();
                int barrierId = container.getResources()
                        .getIdentifier("bottom_navigation_barrier", "id", pkg);
                if (barrierId != 0) {
                    changed |= setIntField(raw, "bottomToBottom", -1);
                    changed |= setIntField(raw, "bottomToTop", barrierId);
                }
            }
            if (changed) {
                container.setLayoutParams(raw);
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean setIntField(Object target, String name, int value) {
        try {
            Field field = target.getClass().getField(name);
            if (field.getInt(target) != value) {
                field.setInt(target, value);
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    // ------------------------------------------------------------------
    // Colors
    // ------------------------------------------------------------------

    private static int surfaceColor(Activity activity) {
        try {
            String pkg = activity.getPackageName();
            int colorId = activity.getResources()
                    .getIdentifier("navbar_background", "color", pkg);
            if (colorId != 0) {
                return activity.getResources().getColor(colorId, activity.getTheme());
            }
        } catch (Throwable ignored) {
        }
        boolean night = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return night ? Color.rgb(20, 20, 19) : Color.WHITE;
    }

    private static int pageBackgroundColor(View from) {
        for (ViewParent parent = from.getParent(); parent instanceof View;
             parent = ((View) parent).getParent()) {
            Drawable bg = ((View) parent).getBackground();
            if (bg instanceof ColorDrawable
                    && Color.alpha(((ColorDrawable) bg).getColor()) == 255) {
                return ((ColorDrawable) bg).getColor();
            }
        }
        return Color.BLACK;
    }

    // ------------------------------------------------------------------
    // Capsule drawable: shadow, blurred backdrop, tint, sheen, rim.
    // ------------------------------------------------------------------

    static final class CapsuleDrawable extends Drawable {
        private final WeakReference<View> barRef;
        private final WeakReference<View> contentRef;
        private final int surface;
        private final int opacityPct;
        private final boolean blurEnabled;
        private final float rimWidth;
        private final RectF capsule = new RectF();
        private final Path capsulePath = new Path();
        private float shaderTop = Float.NaN;
        private float shaderBottom = Float.NaN;

        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint sheenPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint bevelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        private Backdrop backdrop;
        private boolean recordingBackdrop;

        CapsuleDrawable(View bar, View content, int surface,
                        int opacityPct, boolean blurEnabled, float density) {
            this.barRef = new WeakReference<>(bar);
            this.contentRef = new WeakReference<>(content);
            this.surface = surface;
            this.opacityPct = Math.max(10, Math.min(95, opacityPct));
            this.blurEnabled = blurEnabled;
            this.rimWidth = Math.max(1f, 1.5f * density);
            double luminance = (0.299 * Color.red(surface) + 0.587 * Color.green(surface)
                    + 0.114 * Color.blue(surface)) / 255.0;
            boolean dark = luminance <= 0.5;
            fillPaint.setColor(Color.argb(
                    Math.round(255f * this.opacityPct / 100f),
                    Color.red(surface), Color.green(surface), Color.blue(surface)));
            shadowPaint.setColor(Color.argb(dark ? 90 : 40, 0, 0, 0));
            bevelPaint.setStyle(Paint.Style.STROKE);
            bevelPaint.setColor(Color.argb(dark ? 64 : 20, 0, 0, 0));
            rimPaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(Math.max(1f, density));
        }

        void setCapsule(float left, float top, float right, float bottom) {
            if (capsule.left != left || capsule.top != top
                    || capsule.right != right || capsule.bottom != bottom) {
                capsule.set(left, top, right, bottom);
                shaderTop = Float.NaN;
                invalidateSelf();
            }
        }

        private void updateShaders() {
            if (capsule.top == shaderTop && capsule.bottom == shaderBottom) {
                return;
            }
            shaderTop = capsule.top;
            shaderBottom = capsule.bottom;
            float radius = capsule.height() / 2;
            capsulePath.reset();
            capsulePath.addRoundRect(capsule, radius, radius, Path.Direction.CW);
            sheenPaint.setShader(new LinearGradient(
                    0, capsule.top, 0, capsule.bottom,
                    Color.argb(46, 255, 255, 255), Color.argb(0, 255, 255, 255),
                    Shader.TileMode.CLAMP));
            strokePaint.setShader(new LinearGradient(
                    0, capsule.top, 0, capsule.bottom,
                    Color.argb(140, 255, 255, 255), Color.argb(18, 255, 255, 255),
                    Shader.TileMode.CLAMP));
            float end = Math.min(0.5f, radius / Math.max(1f, capsule.width()));
            rimPaint.setShader(new LinearGradient(
                    capsule.left, 0, capsule.right, 0,
                    new int[]{Color.argb(128, 255, 255, 255), Color.argb(56, 255, 255, 255),
                            Color.argb(56, 255, 255, 255), Color.argb(128, 255, 255, 255)},
                    new float[]{0, end, 1 - end, 1}, Shader.TileMode.CLAMP));
        }

        @Override
        public void draw(Canvas canvas) {
            try {
                if (capsule.width() <= 0 || capsule.height() <= 0) {
                    return;
                }
                updateShaders();
                float radius = capsule.height() / 2;

                // Soft shadow below the capsule.
                RectF scratch = new RectF();
                for (int i = 3; i >= 1; i--) {
                    scratch.set(capsule);
                    scratch.inset(-i * 0.5f, -i * 0.5f);
                    scratch.offset(0, i * 1f);
                    shadowPaint.setAlpha(30 / i + 20);
                    canvas.drawRoundRect(scratch, radius, radius, shadowPaint);
                }

                // Backdrop + tint, clipped to the capsule.
                int save = canvas.save();
                try {
                    canvas.clipPath(capsulePath);
                    drawBackdrop(canvas);
                    canvas.drawRect(capsule, fillPaint);
                    canvas.drawRoundRect(capsule, radius, radius, sheenPaint);
                } finally {
                    canvas.restoreToCount(save);
                }

                // Bevel: the dark line inside the rim.
                float bevelInset = rimWidth + 0.5f;
                scratch.set(capsule);
                scratch.inset(bevelInset, bevelInset);
                bevelPaint.setStrokeWidth(1f);
                canvas.drawRoundRect(scratch, Math.max(0, radius - bevelInset),
                        Math.max(0, radius - bevelInset), bevelPaint);

                // Rim: lit from outside, brighter at the ends and top.
                scratch.set(capsule);
                scratch.inset(rimWidth / 2, rimWidth / 2);
                float rimRadius = Math.max(0, radius - rimWidth / 2);
                rimPaint.setStrokeWidth(rimWidth);
                canvas.drawRoundRect(scratch, rimRadius, rimRadius, rimPaint);
                strokePaint.setStrokeWidth(Math.max(1f, rimWidth * 0.66f));
                canvas.drawRoundRect(scratch, rimRadius, rimRadius, strokePaint);
            } catch (Throwable ignored) {
            }
        }

        private void drawBackdrop(Canvas canvas) {
            View bar = barRef.get();
            View content = contentRef.get();
            if (bar == null || content == null || recordingBackdrop) {
                return;
            }
            int background = pageBackgroundColor(content);
            if (!blurEnabled) {
                // Sharp page under the tint: draw the page itself.
                drawPage(canvas, bar, content, background);
                return;
            }
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE
                    || !canvas.isHardwareAccelerated()) {
                canvas.drawColor(background);
                return;
            }
            if (backdrop == null) {
                backdrop = new Backdrop(24f * bar.getResources().getDisplayMetrics().density);
            }
            recordingBackdrop = true;
            try {
                backdrop.draw(canvas, bar, content, background);
            } finally {
                recordingBackdrop = false;
            }
        }

        private void drawPage(Canvas canvas, View bar, View content, int background) {
            int[] barLoc = new int[2];
            int[] contentLoc = new int[2];
            bar.getLocationInWindow(barLoc);
            content.getLocationInWindow(contentLoc);
            canvas.save();
            try {
                canvas.translate(contentLoc[0] - barLoc[0], contentLoc[1] - barLoc[1]);
                canvas.drawColor(background);
                content.draw(canvas);
            } finally {
                canvas.restore();
            }
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    // ------------------------------------------------------------------
    // Backdrop: the page behind the capsule, recorded into a render
    // node with a frosted-glass color filter and a blur, Android 14+.
    // ------------------------------------------------------------------

    private static final class Backdrop {
        private static final ColorMatrix FROSTED = createFrostedColors();

        private static ColorMatrix createFrostedColors() {
            ColorMatrix colors = new ColorMatrix();
            colors.setSaturation(1.5f);
            colors.postConcat(new ColorMatrix(new float[]{
                    1, 0, 0, 0, 15,
                    0, 1, 0, 0, 15,
                    0, 0, 1, 0, 15,
                    0, 0, 0, 1, 0
            }));
            return colors;
        }

        private final RenderNode node;
        private final int[] targetLocation = new int[2];
        private final int[] sourceLocation = new int[2];

        Backdrop(float blurRadius) {
            node = new RenderNode("strava glass backdrop");
            node.setRenderEffect(RenderEffect.createChainEffect(
                    RenderEffect.createColorFilterEffect(new ColorMatrixColorFilter(FROSTED)),
                    RenderEffect.createBlurEffect(blurRadius, blurRadius, Shader.TileMode.CLAMP)));
        }

        void draw(Canvas canvas, View target, View source, int background) {
            int width = target.getWidth();
            int height = target.getHeight();
            if (width <= 0 || height <= 0) {
                return;
            }
            target.getLocationInWindow(targetLocation);
            source.getLocationInWindow(sourceLocation);
            node.setPosition(0, 0, width, height);
            RecordingCanvas recording = node.beginRecording(width, height);
            try {
                recording.drawColor(background);
                recording.translate(sourceLocation[0] - targetLocation[0],
                        sourceLocation[1] - targetLocation[1]);
                source.draw(recording);
            } finally {
                node.endRecording();
            }
            canvas.drawRenderNode(node);
        }
    }
}
