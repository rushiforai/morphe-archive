package app.template.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.util.ArrayList;
import java.util.List;

import app.template.extension.WatchlistNav;

/**
 * "Bottom navigation" — lets the user choose which destinations the bar shows. Letterboxd ships
 * five (Films, Search, the Log button, Activity, Profile); this can hide any of them except
 * Profile, and can add a Watchlist destination the app never had.
 *
 * <p>{@link #applyMenu(View)} runs from {@code MainActivity.setup} right after the menu is
 * inflated (it is re-inflated on every call, so this re-applies itself). {@link #onMenuSelected}
 * runs from the head of the bar's item-selected listener so the synthetic Watchlist id is
 * handled before Letterboxd's own {@code fromMenuId} rejects it.
 */
public final class NavItems {

    /** Synthetic menu id for Watchlist — above the app's {@code 0x7f0a....} id space. */
    public static final int WATCHLIST_ITEM_ID = 0x7FFFFE01;

    /** Canonical order. {@code watchlist} has no app menu id (added at runtime); {@code profile} is fixed on. */
    static final String[] KEYS = { "popular", "search", "log", "activity", "watchlist", "profile" };
    static final String[] LABELS = { "Films", "Search", "Log button", "Activity", "Watchlist", "Profile" };
    private static final String[] MENU_RES = {
            "nav_popular", "nav_search", "nav_log", "nav_activity", null, "nav_profile",
    };

    /** Default = today's bar (everything but Watchlist). */
    static final String DEFAULT = "popular,search,log,activity,profile";

    private NavItems() {}

    static List<String> enabled() {
        String csv = Prefs.getString(Prefs.KEY_NAV_ITEMS, DEFAULT);
        List<String> out = new ArrayList<>();
        for (String k : csv.split(",")) {
            String t = k.trim();
            for (String known : KEYS) {
                if (known.equals(t) && !out.contains(t)) out.add(t);
            }
        }
        if (!out.contains("profile")) out.add("profile"); // never removable
        return out;
    }

    static void setEnabled(List<String> keys) {
        StringBuilder sb = new StringBuilder();
        for (String k : KEYS) {
            if (keys.contains(k) || k.equals("profile")) {
                if (sb.length() > 0) sb.append(',');
                sb.append(k);
            }
        }
        Prefs.putString(Prefs.KEY_NAV_ITEMS, sb.toString());
    }

    /** Menu ids of the shown items, in bar order — used by {@link LaunchTab}. */
    static List<Integer> visibleMenuIds(Context ctx) {
        List<String> on = enabled();
        List<Integer> ids = new ArrayList<>();
        for (int i = 0; i < KEYS.length; i++) {
            if (!on.contains(KEYS[i])) continue;
            if ("watchlist".equals(KEYS[i])) {
                ids.add(WATCHLIST_ITEM_ID);
            } else {
                int id = ctx.getResources().getIdentifier(MENU_RES[i], "id", ctx.getPackageName());
                if (id != 0) ids.add(id);
            }
        }
        return ids;
    }

    static int menuId(Context ctx, String key) {
        for (int i = 0; i < KEYS.length; i++) {
            if (!KEYS[i].equals(key)) continue;
            if ("watchlist".equals(key)) return WATCHLIST_ITEM_ID;
            return ctx.getResources().getIdentifier(MENU_RES[i], "id", ctx.getPackageName());
        }
        return 0;
    }

    // --- patch entry points ------------------------------------------------

    public static void applyMenu(View bottomNav) {
        try {
            if (!(bottomNav instanceof BottomNavigationView)) return;
            Prefs.load(bottomNav.getContext());
            Menu menu = ((BottomNavigationView) bottomNav).getMenu();
            Context ctx = bottomNav.getContext();

            int profileId = ctx.getResources().getIdentifier("nav_profile", "id", ctx.getPackageName());
            MenuItem profile = profileId == 0 ? null : menu.findItem(profileId);
            if (profile == null) return; // signed-out menu — leave it alone

            List<String> on = enabled();
            hide(menu, id(ctx, "nav_popular"), on.contains("popular"));
            hide(menu, id(ctx, "nav_search"), on.contains("search"));
            hide(menu, id(ctx, "nav_log"), on.contains("log"));
            hide(menu, id(ctx, "nav_activity"), on.contains("activity"));

            if (on.contains("watchlist") && menu.findItem(WATCHLIST_ITEM_ID) == null) {
                // Re-add Profile after Watchlist so Profile stays last in the bar.
                CharSequence title = profile.getTitle();
                Drawable icon = profile.getIcon();
                menu.removeItem(profileId);

                MenuItem wl = menu.add(0, WATCHLIST_ITEM_ID, Menu.NONE, watchlistTitle(ctx));
                setWatchlistIcon(ctx, wl);

                MenuItem p = menu.add(0, profileId, Menu.NONE, title);
                p.setIcon(icon);
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * From the head of the bar's item-selected listener. True = this was the Watchlist item; we
     * navigated to it and the listener should report it selected (so the item highlights and the
     * bottom bar stays), instead of running Letterboxd's own handling which doesn't know the id.
     */
    /**
     * From the head of the bar's item-selected listener. When it's the synthetic Watchlist id we
     * open the watchlist and return {@code false}: {@link WatchlistNav#open} selects the Profile
     * tab itself (that's the tab whose graph the watchlist lives in), so the bar and the app's
     * tab state stay in agreement — highlighting our own item instead left tapping Profile broken.
     */
    /**
     * From the head of the bar's item-selected listener.
     * <ul>
     *   <li>Watchlist tapped → open it and return {@code true}, so our item shows selected.</li>
     *   <li>Any other item tapped while the watchlist is up → pop it first, then return
     *       {@code false} so the app's normal tab switch runs and lands in one tap.</li>
     * </ul>
     */
    public static boolean onMenuSelected(Activity activity, MenuItem item) {
        try {
            int tapped = item == null ? 0 : item.getItemId();
            if (tapped == WATCHLIST_ITEM_ID) {
                WatchlistNav.open(activity);
                return true;
            }
            if (WatchlistNav.showing) {
                WatchlistNav.dismiss(activity);
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    // --- helpers ---------------------------------------------------------

    private static int id(Context ctx, String name) {
        return ctx.getResources().getIdentifier(name, "id", ctx.getPackageName());
    }

    private static void hide(Menu menu, int id, boolean visible) {
        if (id == 0) return;
        MenuItem item = menu.findItem(id);
        if (item != null) item.setVisible(visible);
    }

    private static CharSequence watchlistTitle(Context ctx) {
        int s = ctx.getResources().getIdentifier("watchlist", "string", ctx.getPackageName());
        return s != 0 ? ctx.getString(s) : "Watchlist";
    }

    /**
     * A clock (Letterboxd's own watchlist glyph), tinted per state so it lights up with the rest
     * of the bar: unselected grey {@code #AABBCC} (the literal the app's own icons use), selected
     * = a live read of {@code @color/blue40BCF4} — the exact colour resource the other four
     * "filled" icons reference, which {@link ModThemeApi31} re-points at the chosen accent / nav
     * style at runtime. So whatever recolours those recolours this too, on the next start.
     */
    private static void setWatchlistIcon(Context ctx, MenuItem item) {
        int selected = 0xFF40BCF4;
        int blueId = ctx.getResources().getIdentifier("blue40BCF4", "color", ctx.getPackageName());
        if (blueId != 0) {
            try {
                selected = ctx.getColor(blueId);
            } catch (Throwable ignored) {
            }
        }
        float d = ctx.getResources().getDisplayMetrics().density;
        item.setIcon(new ClockIcon(0xFFAABBCC, selected, d));
    }

    /**
     * A clock, drawn on the canvas so nothing can strip its colour: BottomNavigationView clears
     * the app's icon tint to null, which wipes a tint set on a VectorDrawable. Stateful — grey at
     * rest, the accent colour when checked, like the app's {@code ic_*_selector} icons.
     * {@link #getConstantState()} stays null so the bar uses this instance directly.
     */
    private static final class ClockIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int rest;
        private final int active;
        private final float density;
        private int color;

        ClockIcon(int rest, int active, float density) {
            this.rest = rest;
            this.active = active;
            this.density = density;
            this.color = rest;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override public boolean isStateful() {
            return true;
        }

        @Override protected boolean onStateChange(int[] states) {
            boolean checked = false;
            for (int s : states) {
                if (s == android.R.attr.state_checked || s == android.R.attr.state_selected) checked = true;
            }
            int next = checked ? active : rest;
            if (next != color) {
                color = next;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override public void draw(Canvas c) {
            Rect b = getBounds();
            if (b.isEmpty()) return;
            float cx = b.exactCenterX(), cy = b.exactCenterY();
            float r = Math.min(b.width(), b.height()) * 0.42f;
            paint.setColor(color);
            paint.setStrokeWidth(2f * density);
            c.drawCircle(cx, cy, r, paint);
            c.drawLine(cx, cy, cx, cy - r * 0.55f, paint);
            c.drawLine(cx, cy, cx + r * 0.5f, cy + r * 0.3f, paint);
        }

        @Override public int getIntrinsicWidth() { return Math.round(24 * density); }
        @Override public int getIntrinsicHeight() { return Math.round(24 * density); }
        @Override public void setAlpha(int a) { paint.setAlpha(a); }
        @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
