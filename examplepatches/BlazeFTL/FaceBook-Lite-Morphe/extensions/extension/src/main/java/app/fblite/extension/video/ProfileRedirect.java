package app.fblite.extension.video;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import app.fblite.extension.settings.MorpheLog;

/**
 * A creator's "Reels" page (opened by tapping the creator in a reel) is empty when the creator did not post
 * their videos as reels, although the main profile has videos. This opens the main profile for you: it taps the
 * page's 3 dot button, waits for the "View main profile" sheet, taps its row, and then the profile's Reels tab. A plain
 * cover hides the pages in between.
 *
 * Facebook Lite draws these screens from server components, so there is no button to call. The taps are
 * synthetic touches, like the story skip. The 3 dot button is looked up as a small view at the top right, and
 * if there is none, put where it is on a 1080 px wide screen (right edge minus 62 px, 50 px under the status
 * bar), scaled by width. The sheet's row is one row high at the bottom (73 px above the navigation bar).
 *
 * The page is recognised by the text "No reels yet" in a list of at most 12 items, or, when the "always" switch is
 * on, by a header item that reads like "15 Reels" next to "19K followers" (the creator's Reels page with reels),
 * so for now it works with the app in English. A page that was left for its profile is not redirected again for
 * two minutes (so Back works). A page that is still there after a try is tried at most twice per run, 15 s apart.
 * Every step is written to the debug log (tag "profile").
 */
final class ProfileRedirect {
    private static final String EMPTY_PAGE = "no reels yet";
    private static final String MAIN_PROFILE = "view main profile";
    private static final int MAX_ITEMS = 12;
    private static final int MAX_TRIES = 2;
    private static final long COOLDOWN_MS = 4000;
    private static final long DONE_MS = 120000;
    private static final int HEADER_ITEMS = 3;
    private static final Pattern REELS_COUNT = Pattern.compile("(?:^|[^\\w.,])[\\d.,]+\\s?[kmb]?\\s+reels?\\b");
    private static final long SHEET_FIRST_MS = 150;
    private static final long SHEET_POLL_MS = 100;
    private static final int SHEET_POLLS = 16;
    private static final long TAB_POLL_MS = 150;
    private static final int TAB_POLLS = 14;
    private static final long CURTAIN_MAX_MS = 7000;
    private static final long PROBE_MS = 2500;
    private static final float REFERENCE_WIDTH = 1080f;

    private static boolean busy;
    private static View curtain;
    private static final Runnable CURTAIN_OFF = new Runnable() {
        @Override
        public void run() {
            curtainOff();
        }
    };
    private static long lastAt;
    private static String runKey;
    private static boolean runAlways;
    private static final Map<String, Integer> TRIES = new HashMap<>();
    private static final Map<String, Long> DONE = new HashMap<>();

    private ProfileRedirect() {
    }

    /** Called from the window scan while no video plays. Cheap: only small lists are read. */
    static void check(Activity activity, boolean always, View playing) {
        if (busy) return;
        long now = SystemClock.uptimeMillis();
        if (lastAt != 0 && now - lastAt < COOLDOWN_MS) return;
        try {
            View root = activity.getWindow().getDecorView();
            String key = reelsPage(root, always, playing == null ? null : FeedItems.pagerOf(playing));
            if (key == null) return;
            Long done = DONE.get(key);
            if (done != null && now - done < DONE_MS) return;
            Integer tries = TRIES.get(key);
            if (tries != null && tries >= MAX_TRIES) return;
            TRIES.put(key, tries == null ? 1 : tries + 1);
            runKey = key;
            runAlways = always;
            start(activity, root, key);
        } catch (Throwable t) {
            VideoFeatures.log("Profile redirect check failed", t);
        }
    }

    /**
     * The page's identity (its first texts) when a small list says "No reels yet", or, with {@code always}, when the
     * first items of a list hold a "15 Reels" text and a "followers" text (the creator's Reels page). Else null.
     */
    private static String reelsPage(View root, boolean always, View skip) {
        for (View pager : FeedItems.pagersIn(root)) {
            if (pager == skip) continue;
            Object[] items = FeedItems.items(pager);
            if (items.length == 0) continue;
            boolean small = items.length <= MAX_ITEMS;
            if (!small && !always) continue;
            int limit = small ? items.length : Math.min(items.length, HEADER_ITEMS);
            boolean empty = false;
            boolean count = false;
            boolean followers = false;
            StringBuilder key = new StringBuilder();
            for (int i = 0; i < limit; i++) {
                Object tree = FeedItems.treeOf(items[i]);
                if (tree == null) continue;
                for (String text : FeedItems.texts(tree, 24)) {
                    String lower = text.toLowerCase(Locale.ROOT);
                    if (lower.equals(EMPTY_PAGE)) empty = true;
                    if (REELS_COUNT.matcher(lower).find()) count = true;
                    if (lower.contains("follower")) followers = true;
                    if (key.length() < 60) key.append(text).append('|');
                }
            }
            if ((empty && small) || (always && count && followers)) return key.toString();
        }
        return null;
    }

    private static void start(final Activity activity, final View root, String key) {
        busy = true;
        lastAt = SystemClock.uptimeMillis();
        int width = root.getWidth();
        int top = topInset(root, width);
        int[] point = moreButton(root, width, top);
        boolean found = point != null;
        if (point == null) point = new int[] {Math.round(width * 0.943f), top + Math.round(width * 50f / REFERENCE_WIDTH)};
        MorpheLog.log("profile", "Reels page [" + key + "], tapping the 3 dot button at " + point[0] + "," + point[1]
                + (found ? " (a view there)" : " (fallback position)") + ", window " + width + "x" + root.getHeight()
                + ", top inset " + top);
        curtainOn(activity);
        Stories.tap(root, point[0], point[1]);
        poll(activity, root, 0);
    }

    private static void poll(final Activity activity, final View root, final int n) {
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    boolean sheet = hasText(root, MAIN_PROFILE);
                    if (sheet || n >= SHEET_POLLS) {
                        int[] row = sheetRow(root);
                        MorpheLog.log("profile", (sheet ? "Sheet is open" : "No \"View main profile\" text seen after "
                                + (SHEET_FIRST_MS + n * SHEET_POLL_MS) + " ms, trying anyway")
                                + ", tapping its row at " + row[0] + "," + row[1]);
                        Stories.tap(root, row[0], row[1]);
                        tabs(root, 0);
                        return;
                    }
                    poll(activity, root, n + 1);
                } catch (Throwable t) {
                    busy = false;
                    curtainOff();
                    VideoFeatures.log("Profile redirect failed", t);
                }
            }
        }, n == 0 ? SHEET_FIRST_MS : SHEET_POLL_MS);
    }

    /** On the profile: taps its Reels tab (the row with the All, Photos, Reels, Mentions tabs), then ends the run. */
    private static void tabs(final View root, final int n) {
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    int[] tab = reelsTab(root);
                    if (tab != null) {
                        MorpheLog.log("profile", "Profile open, tapping its Reels tab at " + tab[0] + "," + tab[1]);
                        Stories.tap(root, tab[0], tab[1]);
                        finish(root);
                        return;
                    }
                    if (n >= TAB_POLLS) {
                        MorpheLog.log("profile", "No Reels tab row found after " + (TAB_POLLS * TAB_POLL_MS) + " ms");
                        finish(root);
                        return;
                    }
                    tabs(root, n + 1);
                } catch (Throwable t) {
                    busy = false;
                    curtainOff();
                    VideoFeatures.log("Profile tab step failed", t);
                }
            }
        }, TAB_POLL_MS);
    }

    private static void finish(final View root) {
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                curtainOff();
            }
        }, 350);
        probe(root);
    }

    /**
     * The Reels tab: the item whose texts hold Photos and Reels, no taller than a tab row. The tabs sit at 0.577 of
     * the row's width for Reels (All, Photos, Reels, Mentions in that order). Null when no such item is on screen.
     */
    private static int[] reelsTab(View root) {
        for (View pager : FeedItems.pagersIn(root)) {
            if (!(pager instanceof ViewGroup)) continue;
            ViewGroup group = (ViewGroup) pager;
            for (int i = 0; i < group.getChildCount() && i < 10; i++) {
                View child = group.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || child.getHeight() <= 0
                        || child.getHeight() > root.getHeight() * 0.1f) {
                    continue;
                }
                boolean photos = false;
                boolean reels = false;
                for (String text : Stories.viewTexts(child)) {
                    if (text.equals("photos")) photos = true;
                    else if (text.equals("reels")) reels = true;
                }
                if (photos && reels) {
                    int[] location = new int[2];
                    child.getLocationInWindow(location);
                    return new int[] {location[0] + Math.round(child.getWidth() * 0.577f), location[1] + child.getHeight() / 2};
                }
            }
        }
        return null;
    }

    // ------------------------------------------------------------------------------------ curtain

    /** A plain cover over the window while the redirect runs, so the pages it passes through are not seen. Touches go through it. */
    private static void curtainOn(Activity activity) {
        try {
            if (curtain != null) return;
            View view = new View(activity);
            boolean night = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            view.setBackgroundColor(night ? 0xFF18191A : 0xFFFFFFFF);
            Overlay.mark(view);
            ((ViewGroup) activity.getWindow().getDecorView()).addView(view,
                    new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
            curtain = view;
            VideoFeatures.MAIN.postDelayed(CURTAIN_OFF, CURTAIN_MAX_MS);
        } catch (Throwable t) {
            curtain = null;
        }
    }

    private static void curtainOff() {
        VideoFeatures.MAIN.removeCallbacks(CURTAIN_OFF);
        View view = curtain;
        curtain = null;
        if (view != null && view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
    }

    /** Writes the screen that follows to the log (the profile page, for finding its Reels tab), then ends the run. */
    private static void probe(final View root) {
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    String key = runKey;
                    if (key != null) {
                        if (key.equals(reelsPage(root, runAlways, null))) {
                            MorpheLog.log("profile", "Still on the Reels page after the try");
                        } else {
                            DONE.put(key, SystemClock.uptimeMillis());
                            TRIES.remove(key);
                        }
                    }
                    if (MorpheLog.enabled()) {
                        MorpheLog.log("profile", "Screen after the redirect: " + Overlay.describe(root));
                        for (View pager : FeedItems.pagersIn(root)) {
                            Object[] items = FeedItems.items(pager);
                            MorpheLog.log("profile", "  list " + Overlay.describe(pager) + " items " + items.length);
                            for (int i = 0; i < items.length && i < 30; i++) {
                                Object tree = FeedItems.treeOf(items[i]);
                                List<String> texts = tree == null ? null : FeedItems.texts(tree, 12);
                                MorpheLog.log("profile", "    [" + i + "] " + (tree == null ? "no tree" : tree.getClass().getName())
                                        + " texts " + texts);
                            }
                        }
                    }
                } catch (Throwable t) {
                    VideoFeatures.log("Profile probe failed", t);
                } finally {
                    busy = false;
                    curtainOff();
                }
            }
        }, PROBE_MS);
    }

    // ------------------------------------------------------------------------------------ positions

    private static int topInset(View root, int width) {
        if (Build.VERSION.SDK_INT >= 23) {
            WindowInsets insets = root.getRootWindowInsets();
            if (insets != null) return insets.getSystemWindowInsetTop();
        }
        return Math.round(width * 0.083f);
    }

    private static int bottomInset(View root) {
        if (Build.VERSION.SDK_INT >= 23) {
            WindowInsets insets = root.getRootWindowInsets();
            if (insets != null) return insets.getSystemWindowInsetBottom();
        }
        return 0;
    }

    /** The sheet's only row: 73 px above the bottom of the content on a 1080 px wide screen, left part of the row. */
    private static int[] sheetRow(View root) {
        int width = root.getWidth();
        int bottom = root.getHeight() - bottomInset(root);
        return new int[] {Math.round(width * 0.25f), bottom - Math.round(width * 73f / REFERENCE_WIDTH)};
    }

    /** A small view in the top right corner below the status bar (a real view for the 3 dot button), or null. */
    private static int[] moreButton(View view, int width, int top) {
        return findSmallView(view, width, top, 0);
    }

    private static int[] findSmallView(View view, int width, int top, int depth) {
        if (view.getVisibility() != View.VISIBLE || depth > 40) return null;
        int[] location = new int[2];
        view.getLocationInWindow(location);
        int w = view.getWidth();
        int h = view.getHeight();
        int cx = location[0] + w / 2;
        int cy = location[1] + h / 2;
        boolean sized = w >= width * 0.05f && w <= width * 0.14f && h >= width * 0.05f && h <= width * 0.14f;
        if (sized && cx >= width * 0.88f && cy >= top && cy <= top + width * 0.2f) return new int[] {cx, cy};
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                int[] found = findSmallView(group.getChildAt(i), width, top, depth + 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** True when a text component in any list on screen reads as the given text (case-insensitive). */
    private static boolean hasText(View root, String wanted) {
        for (View pager : FeedItems.pagersIn(root)) {
            for (Object item : FeedItems.items(pager)) {
                Object tree = FeedItems.treeOf(item);
                if (tree == null) continue;
                for (String text : FeedItems.texts(tree, 40)) {
                    if (text.toLowerCase(Locale.ROOT).equals(wanted)) return true;
                }
            }
        }
        return false;
    }
}
