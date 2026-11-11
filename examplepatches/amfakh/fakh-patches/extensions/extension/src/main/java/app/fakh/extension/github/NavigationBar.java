package app.fakh.extension.github;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.RectF;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

import app.fakh.extension.shared.GlassCapsule;
import app.fakh.extension.shared.GlassTabs;
import app.fakh.extension.shared.SlidingPill;
import app.fakh.extension.shared.TabSlide;
import app.fakh.extension.shared.AppRuntime;

/**
 * Shapes GitHub's bottom bar, a Compose NavigationBar inside the {@code navigation_bar} ComposeView: whether its
 * tabs show a label, and the glass look, drawn by the shared {@link GlassCapsule} behind the ComposeView while the
 * Compose container turns transparent. Both are read from the settings.
 */
@SuppressWarnings("unused")
public final class NavigationBar {
    public static final String GLASS = "fakh_glass_navbar";
    public static final String HIDE_LABELS = "fakh_hide_nav_labels";
    /** The Liquid Glass switch, on until turned off: the settings row shows it on before it is ever saved. */
    public static final String LIQUID = "fakh_liquid_glass";
    private static final float LANDSCAPE_HEIGHT_DP = 272f;
    public static final String NAV_RIGHT = "fakh_nav_right";
    /** Prefix of the switch that hides each tab, which {@link ChoiceSheets} sets from the tab sheet. */
    static final String HIDE_TAB = "fakh_hide_tab_";
    /** The name of the label of the Home tab. */
    static final String HOME_TAB = "menu_home";
    /** Every tab the app lists, before the hidden ones are dropped, for the sheet. */
    static List<Object> allTabs = new ArrayList<>();

    private static final int SIDE_MARGIN_DP = 12;
    private static final int INNER_PADDING_DP = 8;
    private static final int VERTICAL_MARGIN_DP = 6;
    /** Opaque enough to hide the text behind the bar, as on LinkedIn. */
    private static final float FILL_ALPHA = 0.85f;
    /** Height of the tabs without and with a label, lower than Material 3's 80dp so the pill isn't a tall block. */
    private static final int ICON_ONLY_HEIGHT_DP = 56;
    private static final int LABELED_HEIGHT_DP = 56;
    /** Space the bar keeps between its tabs. */
    private static final int TAB_GAP_DP = 8;
    /** How many tabs the bar shows, from the tab list; 0 until the app lists them. */
    private static int tabCount;
    /** How far the pill stays in from the capsule's edges, and how far past its tab it reaches on either side. */
    private static final int PILL_INSET_DP = 4;
    private static final int PILL_GROW_DP = 4;
    /** The rail's tabs are 56dp squares, 4dp apart, centered in the rail. */
    private static final int RAIL_TAB_DP = 56;
    private static final int RAIL_GAP_DP = 4;

    /** The icon composable of each tab of the portrait bar, in the order the tabs first appeared: it stays the same for a tab. */
    private static final java.util.List<Object> tabIcons = new java.util.ArrayList<>();
    /** The click lambda of each tab, at the index of its icon in {@link #tabIcons}. */
    private static final java.util.List<Object> tabClicks = new java.util.ArrayList<>();
    /** Whether a tab was drawn since the last time the pill was placed. */
    private static boolean drawn;
    /** Which of the tabs of the portrait bar is selected. */
    private static int selectedIndex = -1;
    /** The pill behind the selected tab, or null while the bar is not glass. */
    private static SlidingPill slider;
    private static View pillBar;
    /** Whether the bar is the landscape rail, whose pill slides from top to bottom. */
    private static boolean vertical;

    /** The color of the page behind the bar, which the capsule takes so it blends in; 0 until it is read. */
    private static int pageColor;

    /** The container color the bar had before it turned transparent. */
    private static int barColor = Color.DKGRAY;
    private static GlassCapsule capsule;

    private NavigationBar() {
    }

    /** Injected before the call that draws a tab: its label composable, or null while labels are hidden. */
    public static Object label(Object label) {
        return MaterialYou.flag(HIDE_LABELS) ? null : label;
    }

    /**
     * Injected at the start of the NavigationBar composable: the container color, which is transparent while the
     * glass look is on so the capsule behind the ComposeView shows through.
     *
     * @param color the container color as a packed Compose Color
     * @return the color to draw
     */
    public static long containerColor(long color) {
        if (!glass()) return color;
        barColor = (int) (color >>> 32);
        if (capsule != null && pageColor == 0) capsule.setColor(barColor);
        return 0L;
    }

    /**
     * Injected before each tab is drawn. A tab is told apart by its icon, the same object every time it is drawn, so
     * the position of the selected one is known even when only some of the tabs are drawn again. The label is the
     * accessibility action of the selected tab, not its text. The pill behind the selected tab is drawn by the
     * capsule, which slides it between tabs.
     */
    public static void tab(boolean selected, Object onClick, Object icon, Object modifier, Object onLongClick, String label) {
        if (slider == null || pillBar == null || icon == null || !glass()) return;
        int index = tabIcons.indexOf(icon);
        if (index < 0) {
            if (tabIcons.size() >= 8) {
                tabIcons.clear();
                tabClicks.clear();
            }
            tabIcons.add(icon);
            tabClicks.add(onClick);
            index = tabIcons.indexOf(icon);
        }
        tabClicks.set(index, onClick);
        if (!drawn) pillBar.post(NavigationBar::finishDraw);
        drawn = true;
        if (selected) selectedIndex = index;
    }

    /** Injected before each tab of the landscape rail is drawn, which takes no label. */
    public static void railTab(boolean selected, Object onClick, Object icon) {
        tab(selected, onClick, icon, null, null, null);
    }

    /** Places the pill once the tabs of a frame are drawn. */
    private static void finishDraw() {
        drawn = false;
        syncPill();
    }

    /**
     * Injected before GitHub copies a tab label's text style, whose color would win over the label's content color.
     * On the glass bar the copy takes an unspecified color instead, so the label shows its content color: the accent
     * on the selected tab and gray on the others, like the icons.
     *
     * @param mask which of the copy's arguments keep the style's own value; bit 0 is the color
     * @return the mask, with the color taken from the arguments while the bar is glass
     */
    public static int labelStyleMask(int mask) {
        return glass() ? mask & ~1 : mask;
    }

    /** The indicator the app draws behind the selected tab: none where the capsule draws its own pill. */
    public static long indicatorColor(long color) {
        return slider == null || !glass() ? color : 0L;
    }

    /**
     * The space Material 3 puts between a tab's icon indicator and its label, in dp: none on the glass bar, whose pill
     * holds both and is too low for Material's 4dp on top of the indicator's own.
     */
    public static float labelGap(float gap) {
        return slider == null || !glass() ? gap : 0f;
    }

    /** The ripple a pressed tab shows behind its icon, or none on the glass bar, where the pill marks the tab. */
    public static Object tabIndication(Object indication) {
        return slider == null || !glass() ? indication : null;
    }

    /**
     * Moves the pill to the selected tab: on the portrait bar the tabs share its padded width, 8dp apart; on the
     * rail they are stacked in its middle.
     */
    private static void syncPill() {
        if (slider == null || selectedIndex < 0) return;
        float[] span = span(selectedIndex);
        if (span != null) slider.select(span[0], span[1]);
    }

    /** Where tab {@code index} spans along the bar, or down the rail; null before the bar is laid out. */
    private static float[] span(int index) {
        View bar = pillBar;
        int count = tabIcons.size();
        if (bar == null || count == 0 || index < 0) return null;
        float density = bar.getResources().getDisplayMetrics().density;
        if (vertical) {
            float step = (RAIL_TAB_DP + RAIL_GAP_DP) * density;
            float top = (bar.getHeight() - count * step + RAIL_GAP_DP * density) / 2 + index * step;
            return new float[] {top, top + RAIL_TAB_DP * density};
        }
        float gap = 8 * density;
        float region = bar.getWidth() - bar.getPaddingLeft() - bar.getPaddingRight();
        if (region <= 0) return null;
        float width = (region - gap * (count - 1)) / count;
        float left = bar.getPaddingLeft() + index * (width + gap);
        return new float[] {left, left + width};
    }

    /** The tabs for {@link TabSlide}: spans from {@link #span}, opened through their own click lambda. */
    private static final TabSlide.Tabs SLIDE_TABS = new TabSlide.Tabs() {
        @Override
        public int count() {
            return tabIcons.size();
        }

        @Override
        public float start(int index) {
            float[] span = span(index);
            return span == null ? 0 : span[0];
        }

        @Override
        public float end(int index) {
            float[] span = span(index);
            return span == null ? 0 : span[1];
        }

        @Override
        public int selected() {
            return selectedIndex;
        }

        @Override
        public void open(int index) {
            Object click = index < tabClicks.size() ? tabClicks.get(index) : null;
            if (click == null) return;
            // A Kotlin () -> Unit, called as a tap on the tab would. R8 renames invoke() along with Kotlin's
            // Function0, so it is the lambda's one method that takes nothing and returns an Object.
            for (java.lang.reflect.Method invoke : click.getClass().getDeclaredMethods()) {
                if (invoke.getParameterTypes().length != 0 || invoke.getReturnType() != Object.class
                        || Modifier.isStatic(invoke.getModifiers())) continue;
                try {
                    invoke.setAccessible(true);
                    invoke.invoke(click);
                } catch (ReflectiveOperationException ignored) {
                }
                return;
            }
        }
    };

    /** The color of the background the landscape rail draws behind itself: none while the bar is glass. */
    public static long railBackground(long color) {
        return glass() ? 0L : color;
    }

    /** Whether the activities are watched for their bottom bar. */
    private static boolean watching;

    /**
     * Injected at the start of every activity's attachBaseContext by the glass and landscape position patches: from
     * then on each activity that comes to the front has its bottom bar shaped by {@link #install}.
     *
     * @param base the activity's base context, which reaches the application
     */
    public static void watch(Context base) {
        if (watching || !(base.getApplicationContext() instanceof Application)) return;
        watching = true;
        ((Application) base.getApplicationContext()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                install(activity);
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /** Called when an activity comes to the front: gives its bottom bar the capsule. */
    static void install(Activity activity) {
        boolean glass = glass();
        boolean right = MaterialYou.flag(NAV_RIGHT);
        if (!glass && !right) return;
        boolean portrait = activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_PORTRAIT;
        View bar = activity.findViewById(activity.getResources().getIdentifier(
                "navigation_bar", "id", activity.getPackageName()));
        if (bar == null || bar.getTag(bar.getId()) != null) return;
        bar.setTag(bar.getId(), Boolean.TRUE);
        if (!portrait) {
            slider = null;
            pillBar = null;
            if (right) moveRight(activity, bar);
            if (glass) installLandscapeGlass(activity, bar);
            return;
        }
        if (!glass) return;
        float density = bar.getResources().getDisplayMetrics().density;
        int side = Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density);
        int vertical = Math.round(VERTICAL_MARGIN_DP * density);
        bar.setPadding(side, vertical, side, vertical);
        // The tabs are at least 80dp tall; a bar that is shorter clamps them and centers the icon and label.
        ViewGroup.LayoutParams size = bar.getLayoutParams();
        size.height = Math.round((MaterialYou.flag(HIDE_LABELS) ? ICON_ONLY_HEIGHT_DP : LABELED_HEIGHT_DP) * density)
                + 2 * vertical;
        bar.setLayoutParams(size);
        GlassCapsule.clearSystemBar(activity);
        capsule = new GlassCapsule(barColor, density, new GlassCapsule.Layout() {
            private final RectF shape = new RectF();

            @Override
            public boolean capsule(RectF out) {
                // The padding of the bar is the margin around the tabs, so the capsule hugs them.
                out.set(bar.getPaddingLeft() - INNER_PADDING_DP * density, bar.getPaddingTop(),
                        bar.getWidth() - bar.getPaddingRight() + INNER_PADDING_DP * density,
                        bar.getHeight() - bar.getPaddingBottom());
                return out.height() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                if (slider == null || !slider.has() || !capsule(shape)) return false;
                // The whole tab, icon and label, a little wider than the tab, with a thin rim of the capsule all around.
                float inset = PILL_INSET_DP * density;
                float grow = PILL_GROW_DP * density;
                out.set(Math.max(shape.left + inset, slider.start() - grow), shape.top + inset,
                        Math.min(shape.right - inset, slider.end() + grow), shape.bottom - inset);
                return true;
            }
        }, FILL_ALPHA);
        bar.setBackground(capsule);
        capsule.setLiquid(MaterialYou.prefs(activity).getBoolean(LIQUID, true));
        startPill(bar, false);
        matchPage(activity);
        // The bar floats over the screen like a glass bar should: the screen above it reaches down behind it.
        bar.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (!(v.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) || v.getHeight() == 0) return;
            ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) v.getLayoutParams();
            fitWidth(v);
            syncPill();
            if (params.topMargin == -v.getHeight()) return;
            params.topMargin = -v.getHeight();
            v.setLayoutParams(params);
        });
        // The lists of the screen scroll behind the bar; their last item has to be able to come out above it.
        View host = activity.findViewById(activity.getResources().getIdentifier(
                "nav_host_fragment", "id", activity.getPackageName()));
        if (host != null) {
            host.getViewTreeObserver().addOnGlobalLayoutListener(() -> padScrollers(host, host, bar.getHeight()));
        }
    }

    /** Whether the view is a scrolling list: a framework one, or an androidx RecyclerView or NestedScrollView. */
    private static boolean isScroller(View view) {
        if (view instanceof android.widget.ScrollView || view instanceof android.widget.AbsListView) return true;
        for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass()) {
            String name = type.getName();
            if (name.equals("androidx.recyclerview.widget.RecyclerView")
                    || name.equals("androidx.core.widget.NestedScrollView")) return true;
        }
        return false;
    }

    /** Whether the view is the ComposeView of a whole screen, as opposed to a small one inside a row. */
    private static boolean isScreenCompose(View view, int hostHeight) {
        return view.getClass().getName().equals("androidx.compose.ui.platform.ComposeView")
                && hostHeight > 0 && view.getHeight() >= hostHeight * 0.8f;
    }

    /** Whether the view is a short, visible one whose bottom edge is the bottom edge of the host: a pinned button or bar. */
    private static boolean isBottomAnchored(View view, View host) {
        if (view.getVisibility() != View.VISIBLE || view.getHeight() == 0 || view.getHeight() >= host.getHeight() * 0.4f
                || isScroller(view)) return false;
        int bottom = view.getHeight();
        for (View v = view; v != host; v = (View) v.getParent()) {
            bottom += v.getTop();
            if (!(v.getParent() instanceof View)) return false;
        }
        return Math.abs(bottom - host.getHeight()) <= 4 * host.getResources().getDisplayMetrics().density;
    }

    /** Sets the part of a view's bottom padding that belongs to the bar, keeping the padding the app gave it. */
    private static void addBottomPadding(ViewGroup view, int extra) {
        Integer added = (Integer) view.getTag(PADDED);
        if (added != null && added == extra) return;
        int own = view.getPaddingBottom() - (added == null ? 0 : added);
        view.setClipToPadding(false);
        view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), own + extra);
        view.setTag(PADDED, extra);
    }

    /** Tag of a scroller that already has the bar's height added to its bottom padding, with that height. */
    private static final int PADDED = 0x46616b68;

    /**
     * Keeps the bottom padding of every scrolling list under {@code root} at its own padding plus the height of
     * the bar, so the content stops above the bar and does not clip when it scrolls behind it. The height follows
     * the bar, which is shorter without labels.
     *
     * @param host the nav host, to tell a whole-screen ComposeView from a small one and to find what is pinned to its bottom
     */
    private static void padScrollers(View root, View host, int barHeight) {
        if (barHeight <= 0) return;
        int hostHeight = host.getHeight();
        if (isScroller(root)) {
            addBottomPadding((ViewGroup) root, barHeight);
            return;
        }
        if (isScreenCompose(root, hostHeight)) {
            // A Compose list cannot take padding inside itself, so the whole screen is padded from outside: its
            // content, and buttons such as the floating one, stay above the bar and the feed ends in a cut there.
            addBottomPadding((ViewGroup) root, barHeight);
            return;
        }
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (isBottomAnchored(child, host)) {
                // A button or bar pinned to the bottom of the screen would sit behind the glass bar.
                child.setTranslationY(-barHeight);
            } else {
                padScrollers(child, host, barHeight);
            }
        }
    }

    /**
     * Landscape: moves the rail from the left edge to the right one. The rail sits at the start of a
     * ConstraintLayout and the nav host fills the rest, so translating the rail to the far edge and the host
     * by the rail's width the other way swaps them without touching the (obfuscated) constraint fields.
     */
    private static void moveRight(Activity activity, View bar) {
        View host = activity.findViewById(activity.getResources().getIdentifier(
                "nav_host_fragment", "id", activity.getPackageName()));
        if (host == null || !(bar.getParent() instanceof View)) return;
        View parent = (View) bar.getParent();
        View.OnLayoutChangeListener listener = (v, l, t, r, b, ol, ot, or, ob) -> {
            int width = bar.getWidth();
            bar.setTranslationX(parent.getWidth() - bar.getLeft() - width);
            host.setTranslationX(-width);
        };
        bar.addOnLayoutChangeListener(listener);
        host.addOnLayoutChangeListener(listener);
    }

    /** Landscape: the same capsule, upright around the rail's tabs. */
    private static void installLandscapeGlass(Activity activity, View bar) {
        float density = bar.getResources().getDisplayMetrics().density;
        // The rail is 80dp wide on its own; the capsule hugs it and is only as tall as the four tabs.
        bar.setPadding(0, 0, 0, 0);
        GlassCapsule.clearSystemBar(activity);
        capsule = new GlassCapsule(barColor, density, new GlassCapsule.Layout() {
            private final RectF shape = new RectF();

            @Override
            public boolean capsule(RectF out) {
                float height = Math.min(bar.getHeight() - 2 * VERTICAL_MARGIN_DP * density, LANDSCAPE_HEIGHT_DP * density);
                float top = (bar.getHeight() - height) / 2f;
                out.set(8 * density, top, bar.getWidth() - 8 * density, top + height);
                return out.width() > 0 && out.height() > 0;
            }

            @Override
            public boolean pill(RectF out) {
                if (slider == null || !slider.has() || !capsule(shape)) return false;
                // The whole tab, a little taller than it, with a thin rim of the capsule all around.
                float inset = PILL_INSET_DP * density;
                float grow = PILL_GROW_DP * density;
                out.set(shape.left + inset, Math.max(shape.top + inset, slider.start() - grow),
                        shape.right - inset, Math.min(shape.bottom - inset, slider.end() + grow));
                return true;
            }
        }, FILL_ALPHA);
        bar.setBackground(capsule);
        capsule.setLiquid(MaterialYou.prefs(activity).getBoolean(LIQUID, true));
        startPill(bar, true);
        bar.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> syncPill());
        matchPage(activity);
    }

    /**
     * Gives a new bar its pill, as on the other glass bars: a wash of the wallpaper's accent with Material You, and
     * neutral gray without it. The app's own indicator is a pale container color that vanishes on the light capsule.
     */
    private static void startPill(View bar, boolean rail) {
        if (app.fakh.extension.shared.MaterialYou.wallpaper(MaterialYou.isMaterialYou(bar.getContext()))) {
            capsule.setAccent(app.fakh.extension.shared.MaterialYou.accent(bar.getContext(), true, 0, 0));
        }
        tabIcons.clear();
        tabClicks.clear();
        drawn = false;
        selectedIndex = -1;
        vertical = rail;
        slider = capsule.slider();
        pillBar = bar;
        syncPill();
        TabSlide.install(bar, capsule, rail, SLIDE_TABS);
    }

    /**
     * Gives the capsule the color of the page: the nav host is drawn once and a pixel of its left edge, where
     * screens keep a margin, is read. The container color of the bar is a darker surface that would turn the
     * capsule gray.
     */
    private static void matchPage(Activity activity) {
        View host = activity.findViewById(activity.getResources().getIdentifier(
                "nav_host_fragment", "id", activity.getPackageName()));
        if (host == null) return;
        host.getViewTreeObserver().addOnGlobalLayoutListener(new android.view.ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (host.getWidth() == 0 || host.getHeight() == 0) return;
                host.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                host.postDelayed(() -> {
                    if (!host.isAttachedToWindow()) return;
                    // One pixel copied from what the window shows: drawing the page into a software canvas throws
                    // on the hardware bitmaps some pages hold, such as avatars on Explore.
                    int[] place = new int[2];
                    host.getLocationInWindow(place);
                    int x = place[0] + 2;
                    int y = place[1] + host.getHeight() / 2;
                    android.graphics.Bitmap pixel = android.graphics.Bitmap.createBitmap(1, 1, android.graphics.Bitmap.Config.ARGB_8888);
                    android.view.PixelCopy.request(activity.getWindow(), new android.graphics.Rect(x, y, x + 1, y + 1), pixel, result -> {
                        int color = pixel.getPixel(0, 0);
                        if (result == android.view.PixelCopy.SUCCESS && Color.alpha(color) == 255 && capsule != null) {
                            pageColor = color;
                            capsule.setColor(color);
                        }
                    }, host.getHandler());
                }, 600);
            }
        });
    }

    private static boolean glass() {
        return MaterialYou.flag(GLASS);
    }

    /**
     * Injected at the return of the method that lists the tabs of the bar, which both the bar and the start tab
     * read: drops the tabs switched off in the sheet, and keeps them all when none would be left.
     */
    public static List<Object> tabs(List<Object> tabs) {
        allTabs = new ArrayList<>(tabs);
        List<Object> shown = new ArrayList<>();
        for (Object tab : tabs) {
            if (!hidden(labelName(tab))) shown.add(tab);
        }
        List<Object> result = shown.isEmpty() ? tabs : shown;
        tabCount = result.size();
        return result;
    }

    /**
     * Pads the portrait bar so its tabs are at most {@link GlassTabs#MAX_TAB_DP} wide and centered, as on LinkedIn: the
     * capsule hugs the padding, so fewer tabs give a shorter capsule. Changes the padding only when it moves, since
     * setting it lays the bar out again.
     */
    private static void fitWidth(View bar) {
        int count = tabCount > 0 ? tabCount : tabIcons.size();
        if (count == 0 || bar.getWidth() == 0) return;
        float density = bar.getResources().getDisplayMetrics().density;
        int side = GlassTabs.sidePadding(bar.getWidth(), count, Math.round(TAB_GAP_DP * density),
                Math.round((SIDE_MARGIN_DP + INNER_PADDING_DP) * density), density);
        if (bar.getPaddingLeft() != side || bar.getPaddingRight() != side) {
            bar.setPadding(side, bar.getPaddingTop(), side, bar.getPaddingBottom());
        }
    }

    /** Whether the user switched the tab named [name] off; the Home tab never is, as the app starts on it. */
    static boolean hidden(String name) {
        return !HOME_TAB.equals(name) && MaterialYou.flag(HIDE_TAB + name);
    }

    /**
     * The label of a tab, as a string resource id. The tab keeps it in one of its int fields, next to its icons,
     * so it is the one that names a string; 0 when none does.
     */
    static int labelId(Object tab) {
        Context context = AppRuntime.application();
        if (context == null) return 0;
        for (Class<?> type = tab.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != int.class || Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    int id = field.getInt(tab);
                    if (id != 0 && "string".equals(context.getResources().getResourceTypeName(id))) return id;
                } catch (ReflectiveOperationException | Resources.NotFoundException ignored) {
                }
            }
        }
        return 0;
    }

    /** The resource name of a tab's label, such as menu_home, which names its setting across app versions. */
    static String labelName(Object tab) {
        int id = labelId(tab);
        Context context = AppRuntime.application();
        return id == 0 || context == null ? String.valueOf(tab) : context.getResources().getResourceEntryName(id);
    }
}
