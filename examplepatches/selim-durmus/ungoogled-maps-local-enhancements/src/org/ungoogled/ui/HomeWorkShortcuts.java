package org.ungoogled.ui;

import android.app.Activity;
import android.graphics.Rect;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.WeakHashMap;

/** Local destinations alongside Maps' existing category carousel. No data writes or network calls. */
public final class HomeWorkShortcuts {
    private static final WeakHashMap<Activity, Controller> active = new WeakHashMap<>();
    private static final String MAPS = "com.google.android.maps.MapsActivity";
    private static RouteSession shortcutRoute;
    private HomeWorkShortcuts() {}

    public static void resume(Activity activity) {
        if (!MAPS.equals(activity.getClass().getName())) return;
        pause(activity);
        try {
            SavedStore.load(activity);
            Controller c = new Controller(activity);
            active.put(activity, c);
            c.root.post(c);
        } catch (Throwable error) {
            android.util.Log.w("UA-HomeWork", "Could not attach shortcuts", error);
        }
    }

    public static void pause(Activity activity) {
        Controller old = active.remove(activity);
        if (old != null) old.close();
    }

    /** In-memory ownership of the temporary pin created by one shortcut. Never persisted. */
    static final class RouteSession {
        private static final java.util.regex.Pattern COORDINATES = java.util.regex.Pattern.compile(
                "^\\s*([+-]?\\d{1,3}(?:\\.\\d+)?)\\s*,\\s*([+-]?\\d{1,3}(?:\\.\\d+)?)\\s*$");
        final int taskId;
        final double lat, lng;
        final long launchedAt;
        boolean directionsOpened;

        RouteSession(int taskId, double lat, double lng, long launchedAt) {
            this.taskId = taskId; this.lat = lat; this.lng = lng; this.launchedAt = launchedAt;
        }

        boolean matches(CharSequence text) {
            if (text == null) return false;
            java.util.regex.Matcher m = COORDINATES.matcher(text);
            if (!m.matches()) return false;
            try {
                // The deep link uses seven decimals; Maps displays its pin with six.
                return Math.abs(Double.parseDouble(m.group(1)) - lat) <= 0.00000055
                        && Math.abs(Double.parseDouble(m.group(2)) - lng) <= 0.00000055;
            } catch (NumberFormatException ignored) { return false; }
        }
    }

    private static void openShortcut(Activity activity, SavedStore.Place destination) {
        shortcutRoute = new RouteSession(activity.getTaskId(), destination.lat, destination.lng,
                android.os.SystemClock.elapsedRealtime());
        SavedPlaces.directions(activity, destination);
    }

    private static boolean shown(View view) { return view != null && view.isShown(); }

    private static boolean matchesQuery(View view, RouteSession route) {
        if (view == null) return false;
        if (route.matches(view.getContentDescription())) return true;
        if (view instanceof TextView && route.matches(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++)
                if (matchesQuery(group.getChildAt(i), route)) return true;
        }
        return false;
    }

    private static final class Controller implements Runnable {
        final Activity activity;
        final ViewGroup root;
        final LinearLayout chips;
        ViewGroup carousel;
        int left, top, right, bottom, reserved;
        boolean clip, closed;
        SavedStore.Place lastHome, lastWork;
        int lastInk, lastHeight;
        boolean loggedFallback;
        final int[] origin = new int[2], anchor = new int[2];
        // Looked up by name: numeric resource IDs change with every Maps release.
        final int containerId, navId, modeTabsId, queryId, clearId, homeIcon, workIcon, chipText;

        Controller(Activity activity) {
            this.activity = activity;
            root = (ViewGroup) activity.getWindow().getDecorView();
            containerId = resource(activity, "id", "below_search_omnibox_container");
            navId = resource(activity, "id", "nav_container");
            modeTabsId = resource(activity, "id", "directions_mode_tabs");
            queryId = resource(activity, "id", "search_omnibox_text_box");
            clearId = resource(activity, "id", "search_omnibox_text_clear"); // Maps' native clear-selection action
            homeIcon = resource(activity, "drawable", "gs_home_vd_theme_24");
            workIcon = resource(activity, "drawable", "gs_work_vd_theme_24");
            chipText = resource(activity, "style", "gmm_chip_text_appearance");
            chips = new LinearLayout(activity);
            chips.setOrientation(LinearLayout.HORIZONTAL);
            chips.setGravity(Gravity.CENTER_VERTICAL);
            chips.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            chips.setVisibility(View.GONE);
            root.addView(chips, new FrameLayout.LayoutParams(1, 1));
        }

        int dp(float value) { return Math.round(value * activity.getResources().getDisplayMetrics().density); }

        public void run() {
            if (closed) return;
            try { update(); }
            catch (Throwable error) {
                android.util.Log.w("UA-HomeWork", "Shortcuts disabled for this screen", error);
                close();
                return;
            }
            // Only alive while MapsActivity is resumed. No background service or per-frame traversal.
            root.postDelayed(this, 250);
        }

        void update() throws Exception {
            updateShortcutReturn();
            View container = root.findViewById(containerId);
            View nav = root.findViewById(navId);
            Rect visible = new Rect();
            boolean front = activity.hasWindowFocus() && container != null && container.isShown()
                    && container.getGlobalVisibleRect(visible) && visible.height() >= dp(32)
                    && (nav == null || !nav.isShown());
            ViewGroup found = front ? findCarousel(container) : null;
            SavedStore.Place home = SavedStore.home, work = SavedStore.work;
            if (found == null || (home == null && work == null)) {
                chips.setVisibility(View.GONE);
                releaseCarousel();
                return;
            }
            if (carousel != found) {
                releaseCarousel();
                carousel = found;
                left = found.getPaddingLeft(); top = found.getPaddingTop();
                right = found.getPaddingRight(); bottom = found.getPaddingBottom();
                clip = found.getClipToPadding();
                lastHeight = -1;
            }
            int height = carousel.getHeight();
            if (height < dp(32) || carousel.getWidth() < dp(220)) {
                chips.setVisibility(View.GONE);
                releaseCarousel();
                return;
            }
            TextView sample = findText(carousel);
            // Wait for the real category chip to finish binding before constructing ours.
            if (sample == null) { chips.setVisibility(View.GONE); return; }
            int ink = sample.getCurrentTextColor();
            if (home != lastHome || work != lastWork || ink != lastInk || height != lastHeight) {
                chips.removeAllViews();
                if (home != null) addChip("Home", home, false, ink, height, sample);
                if (work != null) addChip("Work", work, true, ink, height, sample);
                chips.measure(View.MeasureSpec.makeMeasureSpec(carousel.getWidth(), View.MeasureSpec.AT_MOST),
                        View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
                reserved = chips.getMeasuredWidth();
                lastHome = home; lastWork = work; lastInk = ink; lastHeight = height;
            }
            boolean rtl = carousel.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
            int wantLeft = left + (rtl ? 0 : reserved), wantRight = right + (rtl ? reserved : 0);
            if (carousel.getPaddingLeft() != wantLeft || carousel.getPaddingRight() != wantRight) {
                carousel.setPadding(wantLeft, top, wantRight, bottom);
                final ViewGroup adjusted = carousel;
                // RecyclerView otherwise retains its old first-item anchor beneath the new padding.
                adjusted.post(() -> {
                    if (!closed && carousel == adjusted) adjusted.scrollBy(rtl ? 100000 : -100000, 0);
                });
            }
            if (!carousel.getClipToPadding()) carousel.setClipToPadding(true);
            root.getLocationOnScreen(origin);
            carousel.getLocationOnScreen(anchor);
            FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) chips.getLayoutParams();
            int x = anchor[0] - origin[0] + (rtl ? carousel.getWidth() - right - reserved : left);
            int y = anchor[1] - origin[1];
            if (p.width != reserved || p.height != height || p.leftMargin != x || p.topMargin != y) {
                p.gravity = Gravity.TOP | Gravity.LEFT;
                p.width = reserved; p.height = height; p.leftMargin = x; p.topMargin = y;
                chips.setLayoutParams(p);
            }
            chips.setLayoutDirection(carousel.getLayoutDirection());
            chips.setVisibility(View.VISIBLE);
        }

        void addChip(String label, SavedStore.Place destination, boolean work, int ink, int height, TextView sample) {
            TextView button = null;
            if (ChipNames.applies(activity)) {
                try { button = materialChip(work, sample); }
                catch (Throwable error) {
                    // Wrong names for this build: fall back instead of losing the shortcuts.
                    if (!loggedFallback) android.util.Log.w("UA-HomeWork", "Pinned chip style failed; using a copy of Maps' chip background", error);
                    loggedFallback = true;
                }
            }
            if (button == null) button = plainChip(work, ink, sample, height);
            button.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, sample.getTextSize());
            button.setTypeface(sample.getTypeface());
            button.setTextColor(sample.getTextColors());
            button.setLetterSpacing(sample.getLetterSpacing());
            button.setIncludeFontPadding(sample.getIncludeFontPadding());
            button.setFontFeatureSettings(sample.getFontFeatureSettings());
            String variation = sample.getFontVariationSettings();
            if (variation != null) button.setFontVariationSettings(variation);
            button.setElevation(sample.getElevation());
            button.setText(label);
            button.setContentDescription("Directions to " + label);
            button.setClickable(true);
            button.setFocusable(true);
            button.setOnClickListener(v -> openShortcut(activity, destination));
            LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, height);
            int gap = dp(6);
            if (carousel.getChildCount() >= 2) {
                int measured = carousel.getChildAt(1).getLeft() - carousel.getChildAt(0).getRight();
                if (measured > 0 && measured < dp(24)) gap = measured;
            }
            p.setMarginEnd(gap);
            chips.addView(button, p);
        }

        /**
         * Any Maps version: a plain TextView whose background is measured from the category chip
         * as drawn (fill, outline, corner radius and touch-target insets) and whose icon is tinted
         * like the chip's text. No obfuscated names involved.
         */
        TextView plainChip(boolean work, int ink, TextView sample, int height) {
            TextView button = new TextView(sample.getContext());
            android.graphics.drawable.Drawable background = null;
            try { background = measuredBackground(sample, height); }
            catch (Throwable error) { android.util.Log.w("UA-HomeWork", "Could not measure the category chip", error); }
            if (background == null) {
                android.graphics.drawable.GradientDrawable pill = new android.graphics.drawable.GradientDrawable();
                pill.setCornerRadius(dp(8));
                pill.setStroke(dp(1), (ink & 0x00ffffff) | 0x55000000);
                background = new android.graphics.drawable.InsetDrawable(pill, 0, dp(6), 0, dp(6));
            }
            button.setBackground(background);
            android.graphics.drawable.Drawable icon = activity.getDrawable(work ? workIcon : homeIcon);
            if (icon != null) {
                icon = icon.mutate();
                icon.setTint(ink);
                icon.setBounds(0, 0, dp(18), dp(18));
                button.setCompoundDrawablesRelative(icon, null, null, null);
                button.setCompoundDrawablePadding(dp(8));
            }
            button.setTextAppearance(chipText);
            button.setGravity(Gravity.CENTER_VERTICAL);
            button.setSingleLine(true);
            button.setPaddingRelative(dp(12), 0, dp(16), 0);
            return button;
        }

        /** Draws [sample]'s background off screen and rebuilds it as a rounded rectangle for a view [height] tall. */
        android.graphics.drawable.Drawable measuredBackground(TextView sample, int height) {
            android.graphics.drawable.Drawable source = sample.getBackground();
            int w = sample.getWidth(), h = sample.getHeight();
            if (source == null || w < dp(24) || h < dp(16)) return null;
            android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(w, h, android.graphics.Bitmap.Config.ARGB_8888);
            android.graphics.Rect bounds = source.copyBounds();
            source.setBounds(0, 0, w, h);
            source.draw(new android.graphics.Canvas(bitmap));
            source.setBounds(bounds);
            int x = w / 2, top = -1, bottom = -1;
            for (int y = 0; y < h; y++)
                if (android.graphics.Color.alpha(bitmap.getPixel(x, y)) > 8) { if (top < 0) top = y; bottom = y; }
            if (top < 0 || bottom - top < dp(12)) { bitmap.recycle(); return null; }
            int middle = (top + bottom) / 2, left = -1;
            for (int i = 0; i < x && left < 0; i++) if (android.graphics.Color.alpha(bitmap.getPixel(i, middle)) > 8) left = i;
            int corner = left;
            for (int i = Math.max(0, left); i < x; i++) if (android.graphics.Color.alpha(bitmap.getPixel(i, top)) > 8) { corner = i; break; }
            int fill = bitmap.getPixel(x, middle), edge = bitmap.getPixel(x, top);
            bitmap.recycle();
            android.graphics.drawable.GradientDrawable pill = new android.graphics.drawable.GradientDrawable();
            pill.setColor(fill);
            if (edge != fill) pill.setStroke(Math.max(1, dp(1)), edge);
            pill.setCornerRadius(Math.max(dp(2), corner - Math.max(0, left) + 1));
            int insetTop = top + (height - h) / 2, insetBottom = (h - 1 - bottom) + (height - h + 1) / 2;
            return new android.graphics.drawable.InsetDrawable(pill, 0, Math.max(0, insetTop), 0, Math.max(0, insetBottom));
        }

        /**
         * Maps 26.44.06: Maps' own Material Chip with the category chip's live style values. R8
         * strips most of Chip's public setters, so the style goes through obfuscated names pinned
         * to that build (see ChipNames).
         */
        TextView materialChip(boolean work, TextView sample) throws Exception {
            Class<?> chipClass = Class.forName("com.google.android.material.chip.Chip");
            if (!chipClass.isInstance(sample)) throw new IllegalStateException("Unsupported category chip");
            TextView button = (TextView) chipClass.getConstructor(android.content.Context.class).newInstance(sample.getContext());
            Object source = field(sample, ChipNames.DRAWABLE), target = field(button, ChipNames.DRAWABLE);
            // Surface color is separate from the foreground fill in Material ChipDrawable.
            java.lang.reflect.Field surface = source.getClass().getDeclaredField(ChipNames.SURFACE);
            surface.setAccessible(true);
            surface.set(target, surface.get(source));
            for (String[] color : ChipNames.COLORS)
                declared(target.getClass(), color[1], android.content.res.ColorStateList.class)
                        .invoke(target, field(source, color[0]));
            call(button, ChipNames.RIPPLE_REFRESH);
            for (String[] size : ChipNames.SIZES)
                chipClass.getMethod(size[0], float.class).invoke(button, field(source, size[1]));
            call(target, ChipNames.SHAPE_SET, call(source, ChipNames.SHAPE_GET));
            call(button, ChipNames.TOUCH_TARGET_SET, field(sample, ChipNames.TOUCH_TARGET));
            call(target, ChipNames.CHECKABLE_SET, false);
            call(button, ChipNames.CLOSE_ICON_VISIBLE_SET, false);
            chipClass.getMethod("setChipIconResource", int.class).invoke(button, work ? workIcon : homeIcon);
            call(target, ChipNames.ICON_VISIBLE_SET, true);
            button.setTextAppearance(chipText);
            button.setGravity(sample.getGravity());
            return button;
        }

        void updateShortcutReturn() {
            RouteSession route = shortcutRoute;
            if (route == null || route.taskId != activity.getTaskId() || !activity.hasWindowFocus()) return;
            // Both route preview and active guidance own their UI. Never clear during either.
            if (shown(root.findViewById(modeTabsId)) || shown(root.findViewById(navId))) {
                route.directionsOpened = true;
                return;
            }
            if (!route.directionsOpened) {
                // A failed/deferred launch must not adopt a later, unrelated directions session.
                if (android.os.SystemClock.elapsedRealtime() - route.launchedAt > 30000)
                    shortcutRoute = null;
                return;
            }
            View query = root.findViewById(queryId);
            if (!shown(query)) return;
            if (query.hasFocus()) { shortcutRoute = null; return; } // User is editing/searching.
            View clear = root.findViewById(clearId);
            if (matchesQuery(query, route)) {
                if (shown(clear) && clear.isEnabled()) {
                    // Consume before invoking native UI code, so this happens at most once.
                    shortcutRoute = null;
                    clear.performClick();
                }
            } else {
                // Main map or a different query: this shortcut no longer owns the selection.
                shortcutRoute = null;
            }
        }

        void releaseCarousel() {
            if (carousel != null) {
                carousel.setPadding(left, top, right, bottom);
                carousel.setClipToPadding(clip);
                carousel = null;
            }
        }

        void close() {
            if (closed) return;
            closed = true;
            root.removeCallbacks(this);
            releaseCarousel();
            root.removeView(chips);
        }
    }

    /** A Maps resource by name; throws if this Maps version no longer has it. */
    static int resource(Activity activity, String type, String name) {
        int id = activity.getResources().getIdentifier(name, type, activity.getPackageName());
        if (id == 0) throw new IllegalStateException("Maps resource missing: " + type + "/" + name);
        return id;
    }

    /**
     * Obfuscated Material Chip internals in Maps 26.44.06, derived from the APK with
     * tools/chip-names.py. Used only on that build (by version code); any other Maps version gets
     * the name-free plainChip. Rerun the script and update these together with MAPS_VERSION_CODE.
     */
    static final class ChipNames {
        static final long MAPS_VERSION_CODE = 1068856906L;  // 26.44.06.1006895251
        /** Testing: `adb shell setprop log.tag.UA-ChipFallback DEBUG` forces the name-free chip. */
        static boolean applies(Activity activity) {
            if (android.util.Log.isLoggable("UA-ChipFallback", android.util.Log.DEBUG)) return false;
            try {
                return activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).getLongVersionCode()
                        == MAPS_VERSION_CODE;
            } catch (Throwable error) { return false; }
        }
        static final String DRAWABLE = "i";              // Chip's ChipDrawable
        static final String SURFACE = "b";               // ChipDrawable chipSurfaceColor (no setter)
        /** {ChipDrawable field, ChipDrawable setter}: background, stroke, ripple and icon tint. */
        static final String[][] COLORS = {{"c", "l"}, {"e", "v"}, {"g", "G"}, {"T", "r"}};
        static final String RIPPLE_REFRESH = "J";        // Chip: rebuilds its ripple after a new color
        /** {Chip float setter, ChipDrawable field}. */
        static final String[][] SIZES = {
            {"setChipStrokeWidth", "f"}, {"setChipMinHeight", "d"},
            {"setChipStartPadding", "o"}, {"setChipEndPadding", "v"},
            {"setIconStartPadding", "p"}, {"setIconEndPadding", "q"},
            {"setTextStartPadding", "r"}, {"setTextEndPadding", "s"}, {"setChipIconSize", "i"}
        };
        static final String SHAPE_GET = "ad", SHAPE_SET = "n";   // MaterialShapeDrawable
        static final String TOUCH_TARGET = "o", TOUCH_TARGET_SET = "y";  // Chip ensureMinTouchTargetSize
        static final String CHECKABLE_SET = "h", ICON_VISIBLE_SET = "s"; // ChipDrawable
        static final String CLOSE_ICON_VISIBLE_SET = "x";       // Chip
    }

    private static Object field(Object object, String name) throws Exception {
        for (Class<?> type = object.getClass(); type != null; type = type.getSuperclass()) {
            try {
                java.lang.reflect.Field f = type.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(object);
            } catch (NoSuchFieldException next) {}
        }
        throw new NoSuchFieldException(object.getClass().getName() + "." + name);
    }

    private static java.lang.reflect.Method declared(Class<?> type, String name, Class<?> param) throws Exception {
        for (Class<?> t = type; t != null; t = t.getSuperclass()) {
            try {
                java.lang.reflect.Method m = t.getDeclaredMethod(name, param);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException next) {}
        }
        throw new NoSuchMethodException(type.getName() + "." + name + "(" + param.getName() + ")");
    }

    /** Calls [name] on [target] or a superclass with no argument or one matching [args]. */
    private static Object call(Object target, String name, Object... args) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            for (java.lang.reflect.Method m : type.getDeclaredMethods()) {
                Class<?>[] params = m.getParameterTypes();
                if (!m.getName().equals(name) || params.length != args.length) continue;
                if (args.length == 1 && !accepts(params[0], args[0])) continue;
                m.setAccessible(true);
                return m.invoke(target, args);
            }
        }
        throw new NoSuchMethodException(target.getClass().getName() + "." + name);
    }

    private static boolean accepts(Class<?> param, Object arg) {
        if (param == boolean.class) return arg instanceof Boolean;
        if (param == float.class) return arg instanceof Float;
        return !param.isPrimitive() && param.isInstance(arg);
    }

    private static ViewGroup findCarousel(View view) {
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass())
            if (type.getName().equals("android.support.v7.widget.RecyclerView")) return (ViewGroup) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                ViewGroup found = findCarousel(group.getChildAt(i));
                if (found != null && found.isShown()) return found;
            }
        }
        return null;
    }

    private static TextView findText(View view) {
        if (view instanceof TextView) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findText(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

}
