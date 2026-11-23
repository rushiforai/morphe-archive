package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.util.TypedValue;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.GridView;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Modern album viewer: a counter pill, the caption over a fade, a thumbnail strip, and the grid
 * overview. Drawn over Joey's pages, under its toolbar. Joey still pages, zooms and closes.
 */
public final class AlbumChrome {
    private static final int TAG = 0x4d4f0046;
    private static final int CELL = 0x4d4f0047;
    private static final String[] JOEY_EXTRAS = {
            "album_photo_counter", "album_photo_description", "album_desc_collapse", "album_desc_expand"};

    /** Where each recently opened album was left, by album URL. Memory only, cleared on restart. */
    private static final java.util.LinkedHashMap<String, Integer> PLACES = new java.util.LinkedHashMap<String, Integer>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(java.util.Map.Entry<String, Integer> eldest) {
            return size() > 50;
        }
    };

    private AlbumChrome() {
    }

    private static final class State {
        final Activity activity;
        View pager;
        View toolbar;
        Method current;
        Method jump;
        FrameLayout root;
        View topFade;
        View bottomFade;
        TextView pill;
        TextView caption;
        HorizontalScrollView scroller;
        LinearLayout strip;
        List<String> thumbs;
        List<Boolean> animated;
        boolean dirty = true;
        boolean shown = true;
        boolean expanded;
        int index = -1;
        long openedAt;
        String key;
        int restore = -1;
        int tries;
        int gap = -1;
        int toolbarBottom = -1;
        CharSequence text;
        final List<View> pages = new ArrayList<>();
        final Rect rect = new Rect();

        State(Activity activity) {
            this.activity = activity;
        }
    }

    /**
     * Joey remembers whether the media controls were last hidden (media_prefs
     * MEDIA_CONTROLS_VISIBILITY) and opens albums that way. Single pictures in Modern often end
     * hidden, so albums opened bare. A Modern album always opens with its controls: Joey's state
     * is set back to shown, so its own tap toggle stays in step, and its top bar is shown again.
     */
    public static void showOnOpen(Activity activity) {
        if (activity == null || !ModernUi.albumViewer(activity)) return;
        try {
            android.content.SharedPreferences media = activity.getSharedPreferences("media_prefs", Context.MODE_PRIVATE);
            if (!media.getBoolean("MEDIA_CONTROLS_VISIBILITY", true)) {
                media.edit().putBoolean("MEDIA_CONTROLS_VISIBILITY", true).apply();
            }
            View decor = activity.getWindow().getDecorView();
            View toolbar = find(decor, "toolbar");
            if (toolbar != null && toolbar.getVisibility() != View.VISIBLE) toolbar.setVisibility(View.VISIBLE);
            View appbar = find(decor, "appbar");
            if (appbar != null) appbar.getClass().getMethod("setExpanded", boolean.class).invoke(appbar, true);
        } catch (Throwable ignored) {
        }
    }

    public static void attach(Activity activity) {
        if (activity == null || !ModernUi.albumViewer(activity)) return;
        try {
            View decor = activity.getWindow().getDecorView();
            if (decor.getTag(TAG) != null) return;
            State state = new State(activity);
            decor.setTag(TAG, state);
            decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> state.dirty = true);
            decor.getViewTreeObserver().addOnPreDrawListener(() -> {
                try {
                    update(state);
                } catch (Throwable ignored) {
                }
                return true;
            });
        } catch (Throwable ignored) {
        }
    }

    private static State state(Activity activity) {
        Object tag = activity.getWindow().getDecorView().getTag(TAG);
        return tag instanceof State ? (State) tag : null;
    }

    private static final java.util.Map<String, Integer> IDS = new java.util.HashMap<>();

    /** Asked on every frame while an album is open, so each name is looked up once. */
    private static int id(Context context, String name) {
        Integer cached = IDS.get(name);
        if (cached != null) return cached;
        int found = context.getResources().getIdentifier(name, "id", context.getPackageName());
        IDS.put(name, found);
        return found;
    }

    private static View find(View root, String name) {
        int id = id(root.getContext(), name);
        return id == 0 ? null : root.findViewById(id);
    }

    private static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static void update(State s) throws Exception {
        if (s.activity.isFinishing()) return;
        if (s.root == null && !build(s)) return;
        if (s.pager.getVisibility() != View.VISIBLE) {
            if (s.root.getVisibility() != View.GONE) s.root.setVisibility(View.GONE);
            return;
        }
        // Joey keeps the pager hidden while an album loads. Once it shows, the layer comes back
        // in the state it should be in, instead of waiting for the next tap.
        if (s.root.getVisibility() == View.GONE) {
            s.root.setVisibility(s.shown ? View.VISIBLE : View.INVISIBLE);
            s.root.setAlpha(s.shown ? 1f : 0f);
        }
        if (s.thumbs == null) loadItems(s);
        int count = s.thumbs == null ? 0 : s.thumbs.size();
        if (count > 1 && s.strip.getChildCount() != count) fillStrip(s);

        if (s.key == null) s.key = albumKey(s.activity);
        int index = (Integer) s.current.invoke(s.pager);
        if (s.restore < 0 && count > 0) {
            Integer saved = s.key == null ? null : PLACES.get(s.key);
            s.restore = saved != null && saved > 0 && saved < count ? saved : 0;
        }
        // Reopening an album goes back to the picture it was left on. Joey may still be filling
        // its pages, so the jump is tried for a few frames until it holds.
        if (s.restore > 0 && index != s.restore && s.tries < 30) {
            s.tries++;
            s.jump.invoke(s.pager, s.restore, false);
            index = (Integer) s.current.invoke(s.pager);
        }
        if (s.restore > 0 && (index == s.restore || s.tries >= 30)) s.restore = 0;
        boolean moved = index != s.index;
        if (moved && s.key != null && count > 0 && s.restore <= 0) {
            if (index > 0) PLACES.put(s.key, index);
            else PLACES.remove(s.key);
        }
        if (moved) {
            s.index = index;
            select(s);
        }
        if (s.dirty || moved) {
            s.dirty = false;
            tidyPages(s);
            View page = currentPage(s);
            setCaption(s, page);
            placeBottom(s, page);
            placeTop(s);
        }
        follow(s);
    }

    private static String albumKey(Activity activity) {
        try {
            for (Class<?> type = activity.getClass(); type != null; type = type.getSuperclass()) {
                if (!type.getName().endsWith(".BaseAlbumActivity")) continue;
                Object url = field(type, "S0").get(activity);
                return url instanceof String && !((String) url).isEmpty() ? (String) url : null;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** The layer sits in Joey's album frame, above the pages and below the toolbar. */
    private static boolean build(State s) throws Exception {
        View pager = find(s.activity.getWindow().getDecorView(), "viewPager");
        if (pager == null || !(pager.getParent() instanceof ViewGroup)) return false;
        Context context = s.activity;
        s.pager = pager;
        s.current = pager.getClass().getMethod("getCurrentItem");
        s.jump = pager.getClass().getMethod("setCurrentItem", int.class, boolean.class);

        ViewGroup frame = (ViewGroup) pager.getParent();
        FrameLayout root = new FrameLayout(context);
        root.setClipChildren(false);

        View topFade = new View(context);
        topFade.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{0x99000000, 0x00000000}));
        root.addView(topFade, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 96), Gravity.TOP));

        View bottomFade = new View(context);
        bottomFade.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{0x00000000, 0x8C000000, 0xB3000000}));
        root.addView(bottomFade, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 160), Gravity.BOTTOM));

        TextView pill = new TextView(context);
        pill.setTextColor(Color.WHITE);
        pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        pill.setPadding(dp(context, 10), dp(context, 3), dp(context, 10), dp(context, 3));
        GradientDrawable pillBack = new GradientDrawable();
        pillBack.setColor(0x80000000);
        pillBack.setCornerRadius(dp(context, 12));
        pill.setBackground(pillBack);
        pill.setVisibility(View.GONE);
        FrameLayout.LayoutParams pillPlace = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START);
        pillPlace.leftMargin = dp(context, 16);
        root.addView(pill, pillPlace);

        TextView caption = new TextView(context);
        caption.setTextColor(0xE6FFFFFF);
        caption.setLinkTextColor(0xFFFFFFFF);
        caption.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        caption.setGravity(Gravity.CENTER_HORIZONTAL);
        caption.setShadowLayer(4, 0, 1, 0xCC000000);
        caption.setMaxWidth(dp(context, 560));
        caption.setMaxLines(2);
        caption.setEllipsize(TextUtils.TruncateAt.END);
        caption.setMovementMethod(LinkMovementMethod.getInstance());
        caption.setPadding(0, dp(context, 6), 0, dp(context, 6));
        caption.setVisibility(View.GONE);
        caption.setOnClickListener(v -> {
            s.expanded = !s.expanded;
            caption.setMaxLines(s.expanded ? 12 : 2);
        });
        FrameLayout.LayoutParams captionPlace = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        captionPlace.leftMargin = dp(context, 16);
        captionPlace.rightMargin = dp(context, 16);
        root.addView(caption, captionPlace);

        HorizontalScrollView scroller = new HorizontalScrollView(context);
        scroller.setHorizontalScrollBarEnabled(false);
        scroller.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroller.setClipToPadding(false);
        scroller.setPadding(dp(context, 8), 0, dp(context, 8), 0);
        LinearLayout strip = new LinearLayout(context);
        strip.setOrientation(LinearLayout.HORIZONTAL);
        strip.setGravity(Gravity.CENTER_VERTICAL);
        scroller.addView(strip, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(context, 56)));
        scroller.setVisibility(View.GONE);
        root.addView(scroller, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(context, 56), Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL));

        int at = frame.indexOfChild(pager) + 1;
        View appbar = find(frame, "appbar");
        if (appbar != null && appbar.getParent() == frame) at = frame.indexOfChild(appbar);
        frame.addView(root, at, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        s.root = root;
        s.openedAt = android.os.SystemClock.uptimeMillis();
        s.topFade = topFade;
        s.bottomFade = bottomFade;
        s.pill = pill;
        s.caption = caption;
        s.scroller = scroller;
        s.strip = strip;
        return true;
    }

    /** Joey's thumbnail list for the grid, from the album it already loaded. */
    private static void loadItems(State s) {
        try {
            ClassLoader loader = s.activity.getClassLoader();
            List<?> items = null;
            Method convert = null;
            for (Class<?> type = s.activity.getClass(); type != null; type = type.getSuperclass()) {
                String name = type.getName();
                if (name.endsWith(".RedditGalleryActivity")) {
                    items = (List<?>) field(type, "d1").get(s.activity);
                    convert = Class.forName("a9.d", true, loader).getMethod("d", List.class);
                    break;
                }
                if (name.endsWith(".IAActivity")) {
                    items = (List<?>) field(type, "e1").get(s.activity);
                    convert = Class.forName("z8.d", true, loader).getMethod("g", List.class);
                    break;
                }
            }
            if (items == null || convert == null || items.isEmpty()) return;
            @SuppressWarnings("unchecked")
            List<String> thumbs = (List<String>) convert.invoke(null, items);
            if (thumbs == null || thumbs.size() != items.size()) return;
            List<Boolean> animated = new ArrayList<>();
            for (Object item : items) animated.add(animated(item));
            s.animated = animated;
            s.thumbs = thumbs;
        } catch (Throwable ignored) {
        }
    }

    private static Field field(Class<?> type, String name) throws NoSuchFieldException {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    /** A GIF or a clip: one of the item's links points at a moving file. */
    private static boolean animated(Object item) {
        if (item == null) return false;
        for (Class<?> type = item.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != String.class) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(item);
                    if (!(value instanceof String)) continue;
                    String text = ((String) value).toLowerCase(Locale.ROOT);
                    if (text.contains(".mp4") || text.contains(".gif") || text.equals("animatedimage")) return true;
                } catch (Throwable ignored) {
                }
            }
        }
        return false;
    }

    /** Joey's own grid adapter loads the thumbnails, so they come from its image cache. */
    private static BaseAdapter joeyThumbs(State s) throws Exception {
        Class<?> type = Class.forName("z8.a", true, s.activity.getClassLoader());
        return (BaseAdapter) type.getConstructor(List.class).newInstance(s.thumbs);
    }

    private static void fillStrip(State s) throws Exception {
        Context context = s.activity;
        s.strip.removeAllViews();
        BaseAdapter thumbs = joeyThumbs(s);
        int size = dp(context, 44);
        for (int i = 0; i < s.thumbs.size(); i++) {
            FrameLayout cell = cell(context, dp(context, 8));
            View image = thumbs.getView(i, null, cell);
            styleThumb(image);
            cell.addView(image, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            if (s.animated != null && i < s.animated.size() && s.animated.get(i)) cell.addView(badge(context, 8));
            LinearLayout.LayoutParams place = new LinearLayout.LayoutParams(size, size);
            place.leftMargin = dp(context, 3);
            place.rightMargin = dp(context, 3);
            final int page = i;
            cell.setOnClickListener(v -> {
                try {
                    s.jump.invoke(s.pager, page, true);
                } catch (Throwable ignored) {
                }
            });
            s.strip.addView(cell, place);
        }
        s.scroller.setVisibility(View.VISIBLE);
        s.pill.setVisibility(View.VISIBLE);
        s.index = -1;
        s.dirty = true;
    }

    private static FrameLayout cell(Context context, int radius) {
        FrameLayout cell = new FrameLayout(context);
        GradientDrawable back = new GradientDrawable();
        back.setColor(0x26FFFFFF);
        back.setCornerRadius(radius);
        cell.setBackground(back);
        cell.setClipToOutline(true);
        return cell;
    }

    private static void styleThumb(View image) {
        if (image instanceof ImageView) {
            ((ImageView) image).setScaleType(ImageView.ScaleType.CENTER_CROP);
            image.setBackgroundColor(Color.TRANSPARENT);
        }
    }

    private static TextView badge(Context context, int sp) {
        TextView badge = new TextView(context);
        badge.setText("GIF");
        badge.setTextColor(Color.WHITE);
        badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        badge.setPadding(dp(context, 3), 0, dp(context, 3), 0);
        GradientDrawable back = new GradientDrawable();
        back.setColor(0xA6000000);
        back.setCornerRadius(dp(context, 3));
        badge.setBackground(back);
        FrameLayout.LayoutParams place = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
        place.rightMargin = dp(context, 2);
        place.bottomMargin = dp(context, 2);
        badge.setLayoutParams(place);
        return badge;
    }

    private static GradientDrawable ring(Context context, int radius) {
        GradientDrawable ring = new GradientDrawable();
        ring.setColor(Color.TRANSPARENT);
        ring.setCornerRadius(radius);
        ring.setStroke(dp(context, 2), Color.WHITE);
        return ring;
    }

    private static void select(State s) {
        int count = s.thumbs == null ? 0 : s.thumbs.size();
        if (count > 1) s.pill.setText(String.format(Locale.getDefault(), "%d of %d", s.index + 1, count));
        Context context = s.activity;
        for (int i = 0; i < s.strip.getChildCount(); i++) {
            View cell = s.strip.getChildAt(i);
            boolean on = i == s.index;
            cell.setAlpha(on ? 1f : 0.6f);
            if (Build.VERSION.SDK_INT >= 23) cell.setForeground(on ? ring(context, dp(context, 8)) : null);
        }
        View target = s.index >= 0 && s.index < s.strip.getChildCount() ? s.strip.getChildAt(s.index) : null;
        if (target != null) {
            s.scroller.post(() -> s.scroller.smoothScrollTo(
                    target.getLeft() + target.getWidth() / 2 - s.scroller.getWidth() / 2 + s.scroller.getPaddingLeft(), 0));
        }
        s.expanded = false;
        s.caption.setMaxLines(2);
    }

    /** Joey's counter, caption and caption arrows on each page are replaced by the layer. */
    private static void tidyPages(State s) {
        s.pages.clear();
        int pageId = id(s.activity, "ablum_photo_top_container");
        collect(s.pager, pageId, s.pages);
        for (View page : s.pages) {
            for (String name : JOEY_EXTRAS) {
                View extra = find(page, name);
                if (extra != null && extra.getVisibility() != View.GONE) extra.setVisibility(View.GONE);
            }
        }
    }

    private static void collect(View view, int id, List<View> out) {
        if (id == 0) return;
        if (view.getId() == id) {
            out.add(view);
            return;
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), id, out);
    }

    /** The page with the most of itself on screen. */
    private static View currentPage(State s) {
        View best = null;
        long most = 0;
        for (View page : s.pages) {
            if (!page.isShown() || !page.getGlobalVisibleRect(s.rect)) continue;
            long area = (long) s.rect.width() * s.rect.height();
            if (area > most) {
                most = area;
                best = page;
            }
        }
        return best;
    }

    private static void setCaption(State s, View page) {
        CharSequence text = null;
        if (page != null) {
            View description = find(page, "album_photo_description");
            if (description instanceof TextView) text = ((TextView) description).getText();
        }
        if (text != null && text.toString().trim().isEmpty()) text = null;
        if (text == null) {
            s.text = null;
            if (s.caption.getVisibility() != View.GONE) s.caption.setVisibility(View.GONE);
            return;
        }
        if (!text.equals(s.text)) {
            s.text = text;
            s.caption.setText(text);
        }
        if (s.caption.getVisibility() != View.VISIBLE) s.caption.setVisibility(View.VISIBLE);
    }

    private static int topIn(View view, View root) {
        int[] a = new int[2];
        int[] b = new int[2];
        view.getLocationInWindow(a);
        root.getLocationInWindow(b);
        return a[1] - b[1];
    }

    /** The strip sits on Joey's icon row, or on the seek row when a clip is playing. */
    private static void placeBottom(State s, View page) {
        int height = s.root.getHeight();
        if (height <= 0) return;
        int top = height;
        if (page != null) {
            View actions = find(page, "media_viewer_controls_container");
            if (actions != null && actions.isShown() && actions.getHeight() > 0) top = Math.min(top, topIn(actions, s.root));
            View progress = find(page, "exo_progress");
            if (progress != null && progress.isShown() && progress.getHeight() > 0) {
                View row = progress.getParent() instanceof View ? (View) progress.getParent() : progress;
                top = Math.min(top, topIn(row, s.root));
            }
        }
        int gap = Math.max(0, height - top);
        Context context = s.activity;
        boolean strip = s.scroller.getVisibility() == View.VISIBLE;
        int stripHeight = strip ? dp(context, 56) : 0;
        int captionBottom = gap + stripHeight + dp(context, strip ? 2 : 8);
        if (gap == s.gap && ((FrameLayout.LayoutParams) s.caption.getLayoutParams()).bottomMargin == captionBottom) return;
        s.gap = gap;
        FrameLayout.LayoutParams stripPlace = (FrameLayout.LayoutParams) s.scroller.getLayoutParams();
        stripPlace.bottomMargin = gap;
        s.scroller.setLayoutParams(stripPlace);
        FrameLayout.LayoutParams captionPlace = (FrameLayout.LayoutParams) s.caption.getLayoutParams();
        captionPlace.bottomMargin = captionBottom;
        s.caption.setLayoutParams(captionPlace);
        FrameLayout.LayoutParams fadePlace = (FrameLayout.LayoutParams) s.bottomFade.getLayoutParams();
        fadePlace.height = captionBottom + dp(context, 96);
        s.bottomFade.setLayoutParams(fadePlace);
    }

    /** The pill lines up with Joey's toolbar icons; the fade covers the toolbar. */
    private static void placeTop(State s) {
        View toolbar = find(s.activity.getWindow().getDecorView(), "toolbar");
        if (toolbar == null || toolbar.getHeight() <= 0) return;
        int bottom = topIn(toolbar, s.root) + toolbar.getHeight();
        if (bottom == s.toolbarBottom && s.pill.getHeight() > 0) return;
        s.toolbarBottom = bottom;
        int pillHeight = s.pill.getHeight() > 0 ? s.pill.getHeight() : dp(s.activity, 22);
        FrameLayout.LayoutParams pillPlace = (FrameLayout.LayoutParams) s.pill.getLayoutParams();
        pillPlace.topMargin = Math.max(0, bottom - toolbar.getHeight() / 2 - pillHeight / 2);
        pillPlace.leftMargin = Math.max(dp(s.activity, 16), toolbar.getLeft() + dp(s.activity, 16));
        s.pill.setLayoutParams(pillPlace);
        FrameLayout.LayoutParams fadePlace = (FrameLayout.LayoutParams) s.topFade.getLayoutParams();
        fadePlace.height = Math.max(dp(s.activity, 64), bottom + dp(s.activity, 24));
        s.topFade.setLayoutParams(fadePlace);
    }

    /** The layer shows and hides with Joey's toolbar, so one tap moves everything together. */
    private static void follow(State s) {
        View toolbar = s.toolbar;
        if (toolbar == null || !toolbar.isAttachedToWindow()) {
            toolbar = find(s.activity.getWindow().getDecorView(), "toolbar");
            s.toolbar = toolbar;
        }
        // Joey can apply its remembered hidden state again while the album is still loading.
        // For the first moments the album stays open with everything showing.
        if (android.os.SystemClock.uptimeMillis() - s.openedAt < 1200 && toolbar != null
                && (toolbar.getVisibility() != View.VISIBLE || toolbar.getAlpha() < 0.5f
                || !toolbar.getGlobalVisibleRect(s.rect))) {
            showOnOpen(s.activity);
            if (toolbar.getAlpha() < 0.5f) toolbar.setAlpha(1f);
        }
        boolean shown = toolbar == null || toolbar.isShown() && toolbar.getAlpha() > 0.5f
                && toolbar.getGlobalVisibleRect(s.rect);
        if (shown == s.shown) return;
        s.shown = shown;
        View root = s.root;
        root.animate().cancel();
        if (shown) {
            root.setVisibility(View.VISIBLE);
            root.animate().alpha(1f).setDuration(180).start();
        } else {
            root.animate().alpha(0f).setDuration(180).withEndAction(() -> {
                if (!s.shown) root.setVisibility(View.INVISIBLE);
            }).start();
        }
    }

    /**
     * Joey's grid overview (BaseAlbumActivity.J3), shown full screen instead: square thumbnails,
     * the current one ringed, columns from the width. Joey's own tap handler still picks the page.
     * Returns true when the Modern grid is shown, so Joey's dialog is not.
     */
    public static boolean grid(Activity activity, Dialog joey, GridView grid) {
        if (activity == null || grid == null || !ModernUi.albumViewer(activity)) return false;
        try {
            State s = state(activity);
            int current = s != null ? Math.max(0, s.index) : 0;
            List<Boolean> animated = s != null ? s.animated : null;
            Context context = activity;
            if (grid.getParent() instanceof ViewGroup) ((ViewGroup) grid.getParent()).removeView(grid);
            ListAdapter joeyAdapter = grid.getAdapter();
            if (joeyAdapter == null) return false;

            Dialog dialog = new Dialog(activity, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
            LinearLayout page = new LinearLayout(context);
            page.setOrientation(LinearLayout.VERTICAL);
            page.setBackgroundColor(0xF2101010);

            LinearLayout header = new LinearLayout(context);
            header.setOrientation(LinearLayout.HORIZONTAL);
            header.setGravity(Gravity.CENTER_VERTICAL);
            header.setPadding(dp(context, 16), dp(context, 12), dp(context, 8), dp(context, 4));
            TextView title = new TextView(context);
            int count = joeyAdapter.getCount();
            title.setText(count == 1 ? "1 item" : count + " items");
            title.setTextColor(0xE6FFFFFF);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            ImageView close = new ImageView(context);
            close.setImageResource(android.R.drawable.ic_menu_close_clear_cancel);
            close.setColorFilter(Color.WHITE, PorterDuff.Mode.SRC_IN);
            close.setPadding(dp(context, 10), dp(context, 10), dp(context, 10), dp(context, 10));
            close.setContentDescription("Close");
            close.setOnClickListener(v -> dialog.dismiss());
            header.addView(close, new LinearLayout.LayoutParams(dp(context, 44), dp(context, 44)));
            page.addView(header, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            int gap = dp(context, 6);
            grid.setBackgroundColor(Color.TRANSPARENT);
            grid.setPadding(dp(context, 12), dp(context, 12), dp(context, 12), dp(context, 12));
            grid.setClipToPadding(false);
            grid.setHorizontalSpacing(gap);
            grid.setVerticalSpacing(gap);
            grid.setStretchMode(GridView.NO_STRETCH);
            grid.setSelector(new ColorDrawable(Color.TRANSPARENT));
            grid.setNumColumns(columns(context, context.getResources().getDisplayMetrics().widthPixels));
            final int ringed = current;
            grid.setAdapter(new BaseAdapter() {
                @Override
                public int getCount() {
                    return joeyAdapter.getCount();
                }

                @Override
                public Object getItem(int position) {
                    return joeyAdapter.getItem(position);
                }

                @Override
                public long getItemId(int position) {
                    return joeyAdapter.getItemId(position);
                }

                @Override
                public View getView(int position, View convert, ViewGroup parent) {
                    FrameLayout cell;
                    View old = null;
                    if (convert instanceof FrameLayout && convert.getTag(CELL) != null) {
                        cell = (FrameLayout) convert;
                        old = cell.getChildAt(0);
                    } else {
                        cell = new FrameLayout(context) {
                            @Override
                            protected void onMeasure(int width, int height) {
                                super.onMeasure(width, width);
                            }
                        };
                        cell.setTag(CELL, Boolean.TRUE);
                        GradientDrawable back = new GradientDrawable();
                        back.setColor(0x26FFFFFF);
                        back.setCornerRadius(dp(context, 10));
                        cell.setBackground(back);
                        cell.setClipToOutline(true);
                        cell.setLayoutParams(new AbsListView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                    }
                    View image = joeyAdapter.getView(position, old, cell);
                    if (image != old) {
                        cell.removeAllViews();
                        cell.addView(image, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                    } else {
                        while (cell.getChildCount() > 1) cell.removeViewAt(1);
                        image.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                    }
                    styleThumb(image);
                    if (animated != null && position < animated.size() && animated.get(position)) cell.addView(badge(context, 10));
                    if (Build.VERSION.SDK_INT >= 23) cell.setForeground(position == ringed ? ring(context, dp(context, 10)) : null);
                    return cell;
                }
            });
            AdapterView.OnItemClickListener joeyClick = grid.getOnItemClickListener();
            grid.setOnItemClickListener((parent, view, position, rowId) -> {
                if (joeyClick != null) joeyClick.onItemClick(parent, view, position, rowId);
                dialog.dismiss();
            });
            // The thumbnails are sized for a full row and the block is centred, so a short album
            // sits in the middle and a long one fills out from there. Redone on fold and unfold.
            FrameLayout area = new FrameLayout(context);
            area.addView(grid, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT, Gravity.CENTER));
            area.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                if (r - l == or - ol && b - t == ob - ot) return;
                area.post(() -> centreGrid(grid, r - l, b - t, gap));
            });
            page.addView(area, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
            grid.setSelection(current);

            page.setOnApplyWindowInsetsListener((v, insets) -> {
                int left = 0, top = 0, right = 0;
                if (Build.VERSION.SDK_INT >= 28) {
                    DisplayCutout cutout = insets.getDisplayCutout();
                    if (cutout != null) {
                        left = cutout.getSafeInsetLeft();
                        top = cutout.getSafeInsetTop();
                        right = cutout.getSafeInsetRight();
                    }
                }
                v.setPadding(left, top, right, 0);
                return insets;
            });
            dialog.setContentView(page);
            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                window.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
                if (Build.VERSION.SDK_INT >= 28) {
                    WindowManager.LayoutParams attrs = window.getAttributes();
                    attrs.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                    window.setAttributes(attrs);
                }
                window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
            }
            dialog.show();
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void centreGrid(GridView grid, int width, int height, int gap) {
        if (width <= 0 || height <= 0 || grid.getAdapter() == null) return;
        int count = Math.max(1, grid.getAdapter().getCount());
        int most = columns(grid.getContext(), width);
        int across = Math.min(count, most);
        int sidePad = grid.getPaddingLeft() + grid.getPaddingRight();
        int endPad = grid.getPaddingTop() + grid.getPaddingBottom();
        int size = (width - sidePad - gap * (most - 1)) / most;
        int rows = (count + across - 1) / across;
        int wide = across * size + gap * (across - 1) + sidePad;
        int tall = Math.min(height, rows * size + gap * (rows - 1) + endPad);
        grid.setColumnWidth(size);
        grid.setNumColumns(across);
        FrameLayout.LayoutParams place = (FrameLayout.LayoutParams) grid.getLayoutParams();
        if (place.width == wide && place.height == tall) return;
        place.width = wide;
        place.height = tall;
        place.gravity = Gravity.CENTER;
        grid.setLayoutParams(place);
    }

    /** About 120dp a column: 3 on a folded phone, 5 or 6 unfolded, more in landscape. */
    private static int columns(Context context, int width) {
        float density = context.getResources().getDisplayMetrics().density;
        return Math.max(3, Math.round(width / density / 120f));
    }
}
