package app.southstar21.extension.instagram.liquidglass;

import android.app.Activity;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/**
 * Liquid Glass for two of Instagram's bottom sheets: the share menu, which opens from a post's or
 * reel's paper plane, and the comments, which open from its speech bubble (on Reels, the feed,
 * profiles, anywhere in the main activity). Each has its own setting.
 * <p>
 * Instagram shows every bottom sheet in the same two views, created once: the activity's
 * bottom_sheet_container holds a dimmer and a panel, and only the content inside the panel is
 * new for each sheet. The visible sheet is that content root, which Instagram slides with
 * translationY. So a pre-draw listener on the window checks, cheaply each frame, which content
 * the panel holds. When it is a share sheet or the comments, a {@link Session} styles it before
 * its first frame is drawn: the content root gets the glass ({@link ShareGlassDrawable}) and the
 * opaque backgrounds inside are cleared. On the share sheet the search field becomes a glass
 * capsule and the action row sits on the same glass; on the comments the field you type in
 * becomes the capsule. Everything changed is saved first and put back when the content changes
 * or the container hides, so other bottom sheets (the three dot menu and the rest) stay stock.
 */
final class ShareSheetGlass {
    /** How often to look again for the activity's bottom sheet container while it is missing. */
    private static final long HOST_LOOKUP_MS = 1000;
    /** Frames to keep looking for the share sheet inside new content that isn't one (yet). */
    private static final int MAX_CHECKS = 20;

    private static final WeakHashMap<Activity, Boolean> watched = new WeakHashMap<>();

    private ShareSheetGlass() {
    }

    /** Starts watching an activity's window for the share sheet. Safe to call repeatedly. */
    static void watch(Activity activity) {
        if (watched.containsKey(activity)) return;
        watched.put(activity, Boolean.TRUE);
        View decor = activity.getWindow().getDecorView();
        decor.getViewTreeObserver().addOnPreDrawListener(new Watcher(activity, decor));
    }

    /** Resource ids, resolved once. 0 when Instagram doesn't have one. */
    static final class Ids {
        final int host, hostParent, dimmer, panel, share, recycler, stickySearch, searchRow, bottomControl,
                reshareRow, reshareRowTop, buttonContainer, comments, commentField;
        final int[] dividers;

        Ids(Activity activity) {
            Resources res = activity.getResources();
            String pkg = activity.getPackageName();
            host = id(res, pkg, "bottom_sheet_container");
            hostParent = id(res, pkg, "activity_and_camera_shared_views_main_container");
            dimmer = id(res, pkg, "background_dimmer");
            panel = id(res, pkg, "layout_container_bottom_sheet");
            share = id(res, pkg, "direct_private_share_container_view");
            recycler = id(res, pkg, "direct_private_share_recipients_recycler_view");
            stickySearch = id(res, pkg, "direct_private_share_sticky_search_box");
            searchRow = id(res, pkg, "search_row");
            bottomControl = id(res, pkg, "direct_private_share_bottom_control_container");
            reshareRow = id(res, pkg, "direct_external_reshare_row");
            reshareRowTop = id(res, pkg, "direct_external_reshare_row_top");
            buttonContainer = id(res, pkg, "button_container");
            // The comment list's pull-to-dismiss frame: only the comments sheet has one.
            comments = id(res, pkg, "comment_overswipe_dismiss_container");
            commentField = id(res, pkg, "comment_composer_text_parent");
            dividers = new int[]{
                    id(res, pkg, "direct_private_share_title_divider"),
                    id(res, pkg, "direct_private_share_bottom_control_container_divider"),
                    id(res, pkg, "direct_private_share_message_view_divider"),
                    id(res, pkg, "direct_private_share_warning_bottom_divider"),
                    id(res, pkg, "divider_view"),
            };
        }

        private static int id(Resources res, String pkg, String name) {
            int id = res.getIdentifier(name, "id", "com.instagram.android");
            return id != 0 ? id : res.getIdentifier(name, "id", pkg);
        }
    }

    private static final class Watcher implements ViewTreeObserver.OnPreDrawListener {
        private final Activity activity;
        private final View decor;
        private Ids ids;
        private WeakReference<ViewGroup> host;
        private WeakReference<ViewGroup> hostParent;
        private long hostLookupAt;
        private Session session;
        private WeakReference<View> checked;
        private int checks;

        Watcher(Activity activity, View decor) {
            this.activity = activity;
            this.decor = decor;
        }

        @Override
        public boolean onPreDraw() {
            try {
                frame();
            } catch (Throwable t) {
                decor.getViewTreeObserver().removeOnPreDrawListener(this);
                Log.e(LiquidGlassNavBarPatch.TAG, "Sheet glass failed", t);
                Session s = session;
                session = null;
                if (s != null) {
                    try {
                        s.end();
                    } catch (Throwable ignored) {
                        // Already failing: leave the sheet as it is.
                    }
                }
            }
            return true;
        }

        /**
         * The bottom sheet container, which Instagram only adds when the first sheet opens. Its
         * parent is there from the start, so once that is found a glance at its few children
         * each frame finds the container on the very frame it is added.
         */
        private ViewGroup host() {
            ViewGroup h = host == null ? null : host.get();
            if (h != null && h.isAttachedToWindow()) return h;
            host = null;
            ViewGroup p = hostParent == null ? null : hostParent.get();
            if (p == null || !p.isAttachedToWindow()) {
                long now = SystemClock.uptimeMillis();
                if (now - hostLookupAt < HOST_LOOKUP_MS) return null;
                hostLookupAt = now;
                if (ids == null) ids = new Ids(activity);
                View v = ids.host != 0 ? decor.findViewById(ids.host) : null;
                if (v instanceof ViewGroup && v.getParent() instanceof ViewGroup) {
                    p = (ViewGroup) v.getParent();
                } else {
                    v = ids.hostParent != 0 ? decor.findViewById(ids.hostParent) : null;
                    p = v instanceof ViewGroup ? (ViewGroup) v : null;
                }
                hostParent = p == null ? null : new WeakReference<>(p);
                if (p == null) return null;
            }
            for (int i = 0, n = p.getChildCount(); i < n; i++) {
                View c = p.getChildAt(i);
                if (c.getId() == ids.host && c instanceof ViewGroup) {
                    host = new WeakReference<>((ViewGroup) c);
                    return (ViewGroup) c;
                }
            }
            return null;
        }

        /**
         * The sheet's panel: layout_container_bottom_sheet, or (Instagram sometimes changes its
         * id) the container's child that isn't the dimmer and holds content over its full height.
         */
        private ViewGroup panelOf(ViewGroup h) {
            ViewGroup best = null;
            for (int i = 0, n = h.getChildCount(); i < n; i++) {
                View c = h.getChildAt(i);
                if (!(c instanceof ViewGroup) || c.getId() == ids.dimmer) continue;
                if (ids.panel != 0 && c.getId() == ids.panel) return (ViewGroup) c;
                if (best == null && ((ViewGroup) c).getChildCount() > 0 && c.getHeight() >= h.getHeight() / 2) {
                    best = (ViewGroup) c;
                }
            }
            return best;
        }


        private void frame() {
            boolean share = LiquidGlassNavBarPatch.effect(LiquidGlassNavBarPatch.GLASS_SHARE_MENU);
            boolean comments = LiquidGlassNavBarPatch.effect(LiquidGlassNavBarPatch.GLASS_COMMENTS);
            ViewGroup h = share || comments ? host() : null;
            ViewGroup panel = null;
            View content = null;
            if (h != null && h.getVisibility() == View.VISIBLE) {
                panel = panelOf(h);
                if (panel != null && panel.getVisibility() == View.VISIBLE && panel.getChildCount() > 0) {
                    content = panel.getChildAt(0);
                }
            }
            if (session != null && (!session.isFor(panel, content) || !(session.comments ? comments : share))) {
                Session s = session;
                session = null;
                s.end();
            }
            if (content == null) {
                // Hidden: look again when it shows, even if it is the same content.
                checked = null;
                return;
            }
            if (session == null) {
                if (checked == null || checked.get() != content) {
                    checked = new WeakReference<>(content);
                    checks = 0;
                }
                if (checks >= MAX_CHECKS) return;
                checks++;
                boolean isComments = false;
                View found = share && ids.share != 0 ? content.findViewById(ids.share) : null;
                if (found == null && comments && ids.comments != 0) {
                    found = content.findViewById(ids.comments);
                    isComments = found != null;
                }
                if (found == null) return;
                checks = MAX_CHECKS;
                session = new Session(activity, ids, h, panel, content, isComments);
            }
            session.frame();
        }
    }

    /** What a view looked like before the sheet was styled. */
    private static final class Saved {
        final View view;
        final Drawable background;
        final ViewOutlineProvider outline;
        final boolean clip;
        final float alpha;

        Saved(View v) {
            view = v;
            background = v.getBackground();
            outline = v.getOutlineProvider();
            clip = v.getClipToOutline();
            alpha = v.getAlpha();
        }

        void restore() {
            if (view.getBackground() != background) view.setBackground(background);
            if (view.getOutlineProvider() != outline) view.setOutlineProvider(outline);
            if (view.getClipToOutline() != clip) view.setClipToOutline(clip);
            if (view.getAlpha() != alpha) view.setAlpha(alpha);
        }
    }

    /**
     * Watches the children of a list cheaply: {@link #changed()} is true when rows were added,
     * removed or moved since the last call, so they are looked at only then.
     */
    private static final class Rows {
        ViewGroup list;
        private int count = -1;
        private View first, last;
        private int firstX, firstY;

        void set(ViewGroup list) {
            if (this.list != list) {
                this.list = list;
                count = -1;
            }
        }

        boolean changed() {
            ViewGroup l = list;
            if (l == null || !l.isAttachedToWindow()) return false;
            int n = l.getChildCount();
            View f = n > 0 ? l.getChildAt(0) : null;
            View e = n > 0 ? l.getChildAt(n - 1) : null;
            int x = f != null ? f.getLeft() : 0, y = f != null ? f.getTop() : 0;
            if (n == count && f == first && e == last && x == firstX && y == firstY) return false;
            count = n;
            first = f;
            last = e;
            firstX = x;
            firstY = y;
            return true;
        }
    }

    /** One glass sheet on screen: styles it, keeps its glass current and undoes it all at the end. */
    private static final class Session implements ViewTreeObserver.OnGlobalLayoutListener {
        /** The least time between two restyles after a layout, so typing doesn't walk the tree. */
        private static final long RESTYLE_MS = 300;
        /**
         * While the sheet holds still, the glass is recorded again at most this often, for changes
         * in the layout behind it. A video playing behind needs nothing: the recording points at
         * the views' own render nodes, so their new frames show up in the glass by themselves.
         */
        private static final long REFRESH_MS = 500;

        private final Activity activity;
        private final Ids ids;
        private final ViewGroup host;
        private final ViewGroup panel;
        private final View content;
        /** The comments sheet, else the share sheet. */
        final boolean comments;
        private final View decor;
        private final float density;
        private final ArrayList<Saved> saved = new ArrayList<>();

        private ShareGlassDrawable glass;
        private ShareGlassDrawable.Band band;
        private ShareGlassDrawable.Strip strip;
        private View bandView;
        private final Rows recipients = new Rows();
        private final Rows actions = new Rows();
        private boolean styled;
        private boolean dark;
        private boolean layoutChanged;
        private long restyledAt;
        private long refreshedAt;
        private final int[] loc = new int[2];
        private int lastX = Integer.MIN_VALUE, lastY, lastW, lastH;
        private final float[] bandOff = new float[2];
        private float lastBandX = Float.NaN, lastBandY = Float.NaN;

        Session(Activity activity, Ids ids, ViewGroup host, ViewGroup panel, View content, boolean comments) {
            this.activity = activity;
            this.ids = ids;
            this.host = host;
            this.panel = panel;
            this.content = content;
            this.comments = comments;
            this.decor = activity.getWindow().getDecorView();
            this.density = activity.getResources().getDisplayMetrics().density;
        }

        boolean isFor(View panel, View content) {
            return this.panel == panel && this.content == content && content.isAttachedToWindow();
        }

        void frame() {
            if (!styled) {
                styled = style();
                if (!styled) return;
                restyledAt = SystemClock.uptimeMillis();
            } else if (layoutChanged && SystemClock.uptimeMillis() - restyledAt >= RESTYLE_MS) {
                layoutChanged = false;
                restyledAt = SystemClock.uptimeMillis();
                restyle();
            }
            if (recipients.changed()) {
                ViewGroup rv = recipients.list;
                int width = rv.getWidth();
                for (int i = 0, n = rv.getChildCount(); i < n; i++) clearRow(rv.getChildAt(i), width, 0);
            }
            if (actions.changed()) {
                ViewGroup row = actions.list;
                for (int i = 0, n = row.getChildCount(); i < n; i++) glassButton(row.getChildAt(i));
            }
            keepFresh();
        }

        /** Styles the sheet. False when it isn't laid out yet: tried again next frame, before it draws. */
        private boolean style() {
            if (content.getWidth() <= 0 || content.getHeight() <= 0) return false;
            dark = readDark();
            glass = new ShareGlassDrawable(content, density);
            View dimmer = ids.dimmer != 0 ? host.findViewById(ids.dimmer) : null;
            glass.setSkip(dimmer);
            glass.setDark(dark);
            save(content);
            content.setBackground(glass);
            content.setClipToOutline(false);
            restyle();
            // The container ends above the gesture bar: the glass goes on below it in the
            // window's overlay, so the sheet reaches the bottom of the screen like on iOS.
            strip = new ShareGlassDrawable.Strip(glass, host, content);
            strip.setBounds(0, 0, decor.getWidth(), decor.getHeight());
            decor.getOverlay().add(strip);
            content.getViewTreeObserver().addOnGlobalLayoutListener(this);
            return true;
        }

        /** The theme, from the sheet's own background before it is cleared, else the system's. */
        private boolean readDark() {
            float l = luminance(content.getBackground());
            View share = ids.share != 0 ? content.findViewById(ids.share) : null;
            if (l < 0f && share != null) l = luminance(share.getBackground());
            if (l < 0f) l = luminance(panel.getBackground());
            if (l >= 0f) return l < 0.4f;
            int mode = activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            return mode == Configuration.UI_MODE_NIGHT_YES;
        }

        /** The parts that can come and go: cleared backgrounds, dividers, search field, action row. */
        private void restyle() {
            int width = content.getWidth();
            clearBackgrounds(content, width, 0);
            for (int d : ids.dividers) {
                if (d == 0) continue;
                View v = content.findViewById(d);
                if (v != null && v.getAlpha() != 0f) {
                    save(v);
                    v.setAlpha(0f);
                }
            }
            if (comments) {
                commentField();
                return;
            }
            searchField();
            actionRow();
            View r = ids.recycler != 0 ? content.findViewById(ids.recycler) : null;
            recipients.set(r instanceof ViewGroup ? (ViewGroup) r : null);
            View a = ids.reshareRow != 0 ? content.findViewById(ids.reshareRow) : null;
            if (a == null && ids.reshareRowTop != 0) a = content.findViewById(ids.reshareRowTop);
            actions.set(a instanceof ViewGroup ? (ViewGroup) a : null);
        }

        private void save(View v) {
            for (int i = 0, n = saved.size(); i < n; i++) {
                if (saved.get(i).view == v) return;
            }
            saved.add(new Saved(v));
        }

        /**
         * Clears the solid backgrounds covering most of the sheet's width (the sheet's surface, the
         * list's), so the glass shows through. The rows of lists are handled as they come.
         */
        private void clearBackgrounds(View v, int width, int depth) {
            if (v != content && v.getId() != ids.stickySearch && v.getId() != ids.bottomControl
                    && v.getWidth() >= width * 0.5f && isSolid(v.getBackground())) {
                save(v);
                v.setBackground(null);
            }
            if (depth >= 6 || !(v instanceof ViewGroup) || isList(v)) return;
            if (v.getId() == ids.stickySearch) return;
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) clearBackgrounds(g.getChildAt(i), width, depth + 1);
        }

        /** The field inside the search box becomes a glass capsule, and nothing else does. */
        private void searchField() {
            View box = ids.stickySearch != 0 ? content.findViewById(ids.stickySearch) : null;
            if (box == null) return;
            View field = null;
            if (isSolid(box.getBackground()) || box.getBackground() instanceof ShareCapsuleDrawable) {
                field = box;
            } else if (ids.searchRow != 0) {
                View row = box.findViewById(ids.searchRow);
                if (row != null && (isSolid(row.getBackground())
                        || row.getBackground() instanceof ShareCapsuleDrawable)) field = row;
            }
            if (field == null) return;
            Drawable bg = field.getBackground();
            if (bg instanceof ShareCapsuleDrawable) {
                ((ShareCapsuleDrawable) bg).setDark(dark);
                return;
            }
            save(field);
            field.setBackground(new ShareCapsuleDrawable(density, dark, solidInsets(bg)));
        }

        /** The comment field's outlined pill becomes a glass capsule. */
        private void commentField() {
            View field = ids.commentField != 0 ? content.findViewById(ids.commentField) : null;
            if (field == null) return;
            Drawable bg = field.getBackground();
            if (bg instanceof ShareCapsuleDrawable) {
                ((ShareCapsuleDrawable) bg).setDark(dark);
                return;
            }
            if (bg == null) return;
            save(field);
            field.setBackground(new ShareCapsuleDrawable(density, dark, solidInsets(bg)));
        }

        private static final Rect noInsets = new Rect();

        /** Where an inset drawable draws its shape inside its bounds. */
        private static Rect solidInsets(Drawable bg) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && bg instanceof android.graphics.drawable.InsetDrawable) {
                android.graphics.Insets in = ((android.graphics.drawable.InsetDrawable) bg).getOpticalInsets();
                return new Rect(in.left, in.top, in.right, in.bottom);
            }
            return noInsets;
        }

        /** The bottom action row sits on the sheet's glass, softened at its top edge. */
        private void actionRow() {
            View bottom = ids.bottomControl != 0 ? content.findViewById(ids.bottomControl) : null;
            if (bottom == null) return;
            if (band == null || bottom.getBackground() != band) {
                save(bottom);
                band = new ShareGlassDrawable.Band(bottom, content, glass, density);
                bottom.setBackground(band);
            }
            bandView = bottom;
            clearBackgrounds(bottom, bottom.getWidth(), 0);
        }

        /** A recipient row drawn on white (the search results) gets a clear background that still shows presses. */
        private void clearRow(View v, int width, int depth) {
            Drawable bg = v.getBackground();
            if (bg != null && !(bg instanceof RowPress) && v.getWidth() >= width * 0.5f && isOpaqueish(bg)) {
                v.setBackground(new RowPress(dark));
            }
            if (depth >= 1 || !(v instanceof ViewGroup)) return;
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) clearRow(g.getChildAt(i), width, depth + 1);
        }

        /** An action button's grey disc (its container's background) becomes a glass circle. */
        private void glassButton(View item) {
            View box = ids.buttonContainer != 0 ? item.findViewById(ids.buttonContainer) : null;
            if (box == null) return;
            Drawable bg = box.getBackground();
            if (bg instanceof ShareCapsuleDrawable) {
                ((ShareCapsuleDrawable) bg).setDark(dark);
            } else if (isGrey(bg) && isGreyTint(box.getBackgroundTintList())) {
                // Only the grey discs: Instagram may still color the disc for an app (WhatsApp,
                // Meta AI), and then the capsule shows the colored one.
                ShareCapsuleDrawable capsule = new ShareCapsuleDrawable(density, dark, noInsets);
                box.setBackground(capsule);
                capsule.setOriginal(bg);
            }
        }

        /**
         * Redraws the glass when the sheet moved or changed size (open, drag, close, keyboard),
         * and otherwise at most every {@link #REFRESH_MS}, and only on frames that are drawn
         * anyway: this runs before a frame, so on an idle screen it never runs at all.
         */
        private void keepFresh() {
            content.getLocationInWindow(loc);
            int w = content.getWidth(), h = content.getHeight();
            long now = SystemClock.uptimeMillis();
            boolean moved = loc[0] != lastX || loc[1] != lastY || w != lastW || h != lastH;
            if (moved || now - refreshedAt >= REFRESH_MS) {
                lastX = loc[0];
                lastY = loc[1];
                lastW = w;
                lastH = h;
                refreshedAt = now;
                content.invalidate();
                if (moved && strip != null) strip.invalidateSelf();
            }
            View b = bandView;
            if (b != null && band != null && b.getBackground() == band
                    && ShareGlassDrawable.Band.offsetIn(b, content, bandOff)) {
                if (moved || bandOff[0] != lastBandX || bandOff[1] != lastBandY) {
                    lastBandX = bandOff[0];
                    lastBandY = bandOff[1];
                    b.invalidate();
                }
            }
        }

        @Override
        public void onGlobalLayout() {
            layoutChanged = true;
        }

        /** Puts back everything the session changed. */
        void end() {
            if (content.getViewTreeObserver().isAlive()) {
                content.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            }
            if (strip != null) {
                decor.getOverlay().remove(strip);
                strip = null;
            }
            for (int i = saved.size() - 1; i >= 0; i--) {
                try {
                    saved.get(i).restore();
                } catch (Throwable t) {
                    Log.w(LiquidGlassNavBarPatch.TAG, "Could not restore a share sheet view", t);
                }
            }
            saved.clear();
            styled = false;
        }
    }

    /** True for a plain color or a GradientDrawable shape with a solid fill. */
    static boolean isSolid(Drawable d) {
        if (d instanceof ColorDrawable) return Color.alpha(((ColorDrawable) d).getColor()) > 0;
        if (d instanceof GradientDrawable && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            android.content.res.ColorStateList c = ((GradientDrawable) d).getColor();
            return c != null && Color.alpha(c.getDefaultColor()) > 0;
        }
        if (d instanceof android.graphics.drawable.InsetDrawable) {
            return isSolid(((android.graphics.drawable.InsetDrawable) d).getDrawable());
        }
        return false;
    }

    /** A row background that hides the glass: a solid color, or a state list or ripple over one. */
    static boolean isOpaqueish(Drawable d) {
        if (isSolid(d)) return true;
        if (d instanceof android.graphics.drawable.StateListDrawable) {
            Drawable cur = d.getCurrent();
            return cur != null && cur != d && isSolid(cur);
        }
        if (d instanceof android.graphics.drawable.LayerDrawable) {
            android.graphics.drawable.LayerDrawable l = (android.graphics.drawable.LayerDrawable) d;
            for (int i = 0; i < l.getNumberOfLayers(); i++) {
                if (l.getId(i) == android.R.id.mask) continue;
                if (isSolid(l.getDrawable(i))) return true;
            }
        }
        return false;
    }

    /** A solid grey shape, or a layer list of one. */
    static boolean isGrey(Drawable d) {
        if (d instanceof android.graphics.drawable.LayerDrawable) {
            android.graphics.drawable.LayerDrawable l = (android.graphics.drawable.LayerDrawable) d;
            if (l.getNumberOfLayers() != 1) return false;
            d = l.getDrawable(0);
        }
        int color;
        if (d instanceof ColorDrawable) color = ((ColorDrawable) d).getColor();
        else if (d instanceof GradientDrawable && ((GradientDrawable) d).getColor() != null) {
            color = ((GradientDrawable) d).getColor().getDefaultColor();
        } else return false;
        if (Color.alpha(color) < 0x80) return false;
        int r = Color.red(color), g = Color.green(color), b = Color.blue(color);
        return Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) <= 16;
    }

    /** No tint, or a grey one: Instagram colors the discs of WhatsApp, Meta AI and the like with a tint. */
    static boolean isGreyTint(android.content.res.ColorStateList tint) {
        if (tint == null) return true;
        int c = tint.getDefaultColor();
        int r = Color.red(c), g = Color.green(c), b = Color.blue(c);
        return Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) <= 16;
    }

    /** -1 if the drawable isn't a solid color. */
    static float luminance(Drawable d) {
        int color = 0;
        if (d instanceof android.graphics.drawable.InsetDrawable) d = ((android.graphics.drawable.InsetDrawable) d).getDrawable();
        if (d instanceof ColorDrawable) color = ((ColorDrawable) d).getColor();
        else if (d instanceof GradientDrawable && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N
                && ((GradientDrawable) d).getColor() != null) {
            color = ((GradientDrawable) d).getColor().getDefaultColor();
        }
        if (Color.alpha(color) < 0x80) return -1f;
        return (0.2126f * Color.red(color) + 0.7152f * Color.green(color) + 0.0722f * Color.blue(color)) / 255f;
    }

    static boolean isList(View v) {
        String n = v.getClass().getName();
        return n.contains("RecyclerView") || n.contains("ListView") || n.contains("ScrollView");
    }

    /** A row's background: clear, with a light wash while it is pressed. */
    static final class RowPress extends Drawable {
        private final android.graphics.Paint paint = new android.graphics.Paint();
        private boolean pressed;

        RowPress(boolean dark) {
            paint.setColor(dark ? 0x1FFFFFFF : 0x14000000);
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean now = false;
            for (int s : state) {
                if (s == android.R.attr.state_pressed) now = true;
            }
            if (now == pressed) return false;
            pressed = now;
            invalidateSelf();
            return true;
        }

        @Override
        public void draw(android.graphics.Canvas canvas) {
            if (pressed) canvas.drawRect(getBounds(), paint);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }
}
