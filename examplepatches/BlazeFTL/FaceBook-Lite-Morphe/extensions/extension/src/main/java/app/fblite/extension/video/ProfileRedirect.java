package app.fblite.extension.video;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
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
    private static final long BUSY_MAX_MS = 20000;
    private static final long TRY_RESET_MS = 60000;
    private static final long DONE_MS = 120000;
    private static final int HEADER_ITEMS = 8;
    private static final Pattern REELS_COUNT = Pattern.compile("(?:^|[^\\w.,])[\\d.,]+\\+?\\s?[kmb]?\\s+reels?\\b");
    private static final long SHEET_FIRST_MS = 150;
    private static final long SHEET_POLL_MS = 60;
    private static final int SHEET_POLLS = 40;
    private static final long TAB_POLL_MS = 100;
    private static final int TAB_POLLS = 45;
    private static final long CURTAIN_MAX_MS = 5500;
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
    private static final Map<String, Long> TRY_AT = new HashMap<>();
    private static String lastSkip = "";
    private static final Map<String, Long> DONE = new HashMap<>();

    private ProfileRedirect() {
    }

    /** Called from the window scan while no video plays. Cheap: only small lists are read. */
    static void check(Activity activity, boolean always, View playing) {
        long now = SystemClock.uptimeMillis();
        if (!busy && !DONE.isEmpty() && playing != null) noteViewer(activity, always, playing, now);
        if (busy) {
            if (now - lastAt < BUSY_MAX_MS) return;
            MorpheLog.log("profile", "Redirect still busy after " + (now - lastAt) + " ms, resetting");
            busy = false;
            curtainOff();
        }
        if (lastAt != 0 && now - lastAt < COOLDOWN_MS) return;
        try {
            View root = activity.getWindow().getDecorView();
            String key = reelsPage(root, always, playing == null ? null : FeedItems.pagerOf(playing));
            if (key == null) return;
            Long done = DONE.get(key);
            if (done != null && now - done < DONE_MS) {
                skipped(key, "left", "left for its profile " + (now - done) / 1000 + " s ago");
                return;
            }
            Integer tries = TRIES.get(key);
            Long tryAt = TRY_AT.get(key);
            if (tries != null && tryAt != null && now - tryAt >= TRY_RESET_MS) {
                TRIES.remove(key);
                tries = null;
            }
            if (tries != null && tries >= MAX_TRIES) {
                skipped(key, "tries", "already tried " + tries + " times, next try in "
                        + Math.max(0, (TRY_RESET_MS - (tryAt == null ? 0 : now - tryAt)) / 1000) + " s");
                return;
            }
            TRIES.put(key, tries == null ? 1 : tries + 1);
            TRY_AT.put(key, now);
            runKey = key;
            runAlways = always;
            start(activity, root, key);
        } catch (Throwable t) {
            VideoFeatures.log("Profile redirect check failed", t);
        }
    }

    private static int viewerSeen;

    /**
     * Back from the profile lands on the Reels page again and that must stay (see DONE). Once the reel feed itself is
     * on screen (no Reels page, and the feed's own list painted on top of the video) the page is gone, so the same
     * creator is skipped again the next time.
     */
    private static void noteViewer(Activity activity, boolean always, View video, long now) {
        try {
            View root = activity.getWindow().getDecorView();
            boolean visible = false;
            View pager = FeedItems.pagerOf(video);
            if (video.isShown() && video.getWidth() > 0 && video.getHeight() > 0
                    && reelsPage(root, always, pager) == null) {
                int[] where = new int[2];
                video.getLocationInWindow(where);
                visible = Overlay.onTop(video, pager, where[0] + video.getWidth() / 2f, where[1] + video.getHeight() / 2f);
            }
            viewerSeen = visible ? viewerSeen + 1 : 0;
            if (viewerSeen >= 2) {
                viewerSeen = 0;
                DONE.clear();
                TRIES.clear();
                MorpheLog.log("profile", "Back in the reel feed, creator pages are skipped again");
            }
        } catch (Throwable t) {
            VideoFeatures.log("Profile viewer check failed", t);
        }
    }

    private static void skipped(String key, String kind, String why) {
        String id = key + "|" + kind;
        if (id.equals(lastSkip)) return;
        lastSkip = id;
        MorpheLog.log("profile", "Reels page [" + key + "] not redirected: " + why);
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
        try {
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
        } catch (Throwable t) {
            busy = false;
            curtainOff();
            VideoFeatures.log("Profile redirect start failed", t);
        }
    }

    private static float lastSheetY = -1;

    private static void poll(final Activity activity, final View root, final int n) {
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    if (n == 0) lastSheetY = -1;
                    int[] real = sheetRowView(root);
                    boolean stable = real != null && (real[2] == 1 || Math.abs(real[1] - lastSheetY) < 2f);
                    lastSheetY = real == null ? -1 : real[1];
                    if (real != null && stable) {
                        MorpheLog.log("profile", "Sheet is open (found by its shape after " + (SHEET_FIRST_MS + n * SHEET_POLL_MS)
                                + " ms), tapping its row at " + real[0] + "," + real[1]);
                        trace(root, "before row tap");
                        Stories.tap(root, real[0], real[1]);
                        tabs(root, 0);
                        return;
                    }
                    if (n >= SHEET_POLLS) {
                        int[] row = sheetRow(root);
                        MorpheLog.log("profile", "No sheet seen after " + (SHEET_FIRST_MS + n * SHEET_POLL_MS)
                                + " ms, tapping the fallback row at " + row[0] + "," + row[1]);
                        trace(root, "before fallback tap");
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

    /**
     * The "View main profile" sheet is not in a list: it is a view group as wide as the window, 100 to 320 px high,
     * at the bottom, holding a thin handle (80x8 px) and one wide row. Returns the row's centre, or null.
     */
    private static int[] sheetRowView(View root) {
        int width = root.getWidth();
        int bottomLimit = root.getHeight() - bottomInset(root);
        return findSheet(root, width, bottomLimit, 0);
    }

    private static int[] findSheet(View view, int width, int bottomLimit, int depth) {
        if (view.getVisibility() != View.VISIBLE || depth > 40 || Overlay.OURS.equals(view.getTag())) return null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                int[] found = findSheet(group.getChildAt(i), width, bottomLimit, depth + 1);
                if (found != null) return found;
            }
            int gw = group.getWidth();
            int gh = group.getHeight();
            if (gw >= width * 0.9f && gh >= width * 0.09f && gh <= width * 0.3f && group.getChildCount() >= 2
                    && group.getChildCount() <= 4) {
                int[] where = new int[2];
                group.getLocationInWindow(where);
                if (where[1] + gh >= bottomLimit - width * 0.05f) {
                    boolean handle = false;
                    View row = null;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        View child = group.getChildAt(i);
                        if (child.getVisibility() != View.VISIBLE) continue;
                        if (child.getHeight() > 0 && child.getHeight() <= width * 0.02f && child.getWidth() <= width * 0.2f) handle = true;
                        else if (child.getWidth() >= gw * 0.85f && child.getHeight() >= width * 0.05f) row = child;
                    }
                    if (handle && row != null) {
                        int[] at = new int[2];
                        row.getLocationInWindow(at);
                        return new int[] {at[0] + Math.round(row.getWidth() * 0.25f), at[1] + row.getHeight() / 2,
                                Math.abs(where[1] + gh - bottomLimit) <= 3 ? 1 : 0};
                    }
                }
            }
        }
        return null;
    }

    /** One line in the log: the lists on screen with their size and first texts (what page is this?). */
    private static void trace(View root, String label) {
        if (!MorpheLog.enabled()) return;
        try {
            StringBuilder out = new StringBuilder();
            for (View pager : FeedItems.pagersIn(root)) {
                Object[] items = FeedItems.items(pager);
                out.append(" [list items=").append(items.length).append(':');
                int shown = 0;
                for (int i = 0; i < items.length && i < 12 && shown < 4; i++) {
                    Object tree = FeedItems.treeOf(items[i]);
                    if (tree == null) continue;
                    List<String> texts = FeedItems.texts(tree, 6);
                    if (texts.isEmpty()) continue;
                    shown++;
                    out.append(' ').append(texts.get(0)).append(" |");
                }
                out.append(']');
            }
            MorpheLog.log("profile", "trace " + label + ":" + out);
        } catch (Throwable t) {
            // diagnostics only
        }
    }

    private static final int STABLE_POLLS = 3;
    private static final int MAX_TAPS = 3;
    private static final int VERIFY_POLLS = 12;
    private static final long VERIFY_POLL_MS = 100;
    private static int stableX = -1;
    private static int stableY = -1;
    private static int stableCount;
    private static int tapCount;

    /**
     * On the profile: waits until the Reels tab stays at the same place (a profile that comes from the network keeps
     * growing above the tabs while it loads, and a tap on a moving row misses), taps it, and checks that the list
     * below the tabs changed. If it did not, the tab is tapped again. Then ends the run.
     */
    private static void tabs(final View root, final int n) {
        if (n == 0) {
            stableX = -1;
            stableY = -1;
            stableCount = 0;
            tapCount = 0;
        }
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    int[] tab = reelsTab(root);
                    if (tab != null) {
                        if (Math.abs(tab[0] - stableX) <= 2 && Math.abs(tab[1] - stableY) <= 2) {
                            stableCount++;
                        } else {
                            stableCount = 0;
                            stableX = tab[0];
                            stableY = tab[1];
                        }
                        boolean late = n >= TAB_POLLS - 6;
                        if (stableCount >= STABLE_POLLS || late) {
                            tapTab(root, tab, 0);
                            return;
                        }
                    }
                    if (n % 4 == 0) trace(root, "tabs poll " + n);
                    if (n >= TAB_POLLS) {
                        MorpheLog.log("profile", "No Reels tab row found after " + (TAB_POLLS * TAB_POLL_MS) + " ms");
                        logTabRows(root);
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

    private static void tapTab(final View root, int[] tab, final int verifyN) {
        final String before = tabSignature(root);
        tapCount++;
        MorpheLog.log("profile", "Profile open, tapping its Reels tab at " + tab[0] + "," + tab[1] + " (tap " + tapCount
                + ", stable for " + stableCount + " polls)");
        Stories.tap(root, tab[0], tab[1]);
        verify(root, before, 0);
    }

    private static void verify(final View root, final String before, final int n) {
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    String now = tabSignature(root);
                    if (before == null || now == null || !now.equals(before)) {
                        MorpheLog.log("profile", "Reels tab is open (list below the tabs changed after " + ((n + 1) * VERIFY_POLL_MS) + " ms)");
                        finish(root);
                        return;
                    }
                    if (n + 1 >= VERIFY_POLLS) {
                        int[] tab = tapCount < MAX_TAPS ? reelsTab(root) : null;
                        if (tab != null) {
                            MorpheLog.log("profile", "The list below the tabs did not change, tapping the tab again");
                            tapTab(root, tab, 0);
                        } else {
                            MorpheLog.log("profile", "The list below the tabs did not change after " + tapCount + " taps");
                            finish(root);
                        }
                        return;
                    }
                    verify(root, before, n + 1);
                } catch (Throwable t) {
                    busy = false;
                    curtainOff();
                    VideoFeatures.log("Profile tab check failed", t);
                }
            }
        }, VERIFY_POLL_MS);
    }

    /** The first texts of the list item right below the tab row (what the selected tab shows), or null. */
    private static String tabSignature(View root) {
        try {
            for (View pager : FeedItems.pagersIn(root)) {
                Object[] items = FeedItems.items(pager);
                for (int i = 0; i < items.length && i < 14; i++) {
                    Object tree = FeedItems.treeOf(items[i]);
                    if (tree == null) continue;
                    List<String> texts = FeedItems.texts(tree, 8);
                    if (texts.size() > 6) continue;
                    boolean reels = false;
                    boolean other = false;
                    for (String text : texts) {
                        String t = text.trim().toLowerCase(Locale.ROOT);
                        if (t.equals("reels")) reels = true;
                        else if (tabWord(t)) other = true;
                    }
                    if (!reels || !other) continue;
                    StringBuilder sig = new StringBuilder();
                    for (int k = i + 1; k < items.length && k <= i + 2; k++) {
                        Object next = FeedItems.treeOf(items[k]);
                        sig.append('|');
                        if (next != null) sig.append(FeedItems.texts(next, 3));
                    }
                    return sig.toString();
                }
            }
        } catch (Throwable t) {
            // diagnostics and check only
        }
        return null;
    }

    private static void finish(final View root) {
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                curtainOff();
            }
        }, 150);
        probe(root);
    }

    private static final String[] TAB_WORDS = {"all", "photos", "posts", "videos", "about", "mentions", "home", "reviews",
            "community", "shop", "playlists", "live", "more", "tagged", "featured"};

    private static boolean tabWord(String text) {
        for (String word : TAB_WORDS) if (word.equals(text)) return true;
        return false;
    }

    /** Lower case texts of one row of a list: from the item's component tree, else from the view. */
    private static List<String> rowTexts(View pager, View child) {
        List<String> out = new java.util.ArrayList<>();
        try {
            int position = FeedItems.positionOf(pager, child);
            // The app's list does not always answer for its children. The profile has just opened, so the list is at
            // the top and the nth child is the nth item.
            if (position < 0 && pager instanceof ViewGroup) position = ((ViewGroup) pager).indexOfChild(child);
            Object[] items = FeedItems.items(pager);
            if (position >= 0 && position < items.length) {
                Object tree = FeedItems.treeOf(items[position]);
                if (tree != null) {
                    for (String text : FeedItems.texts(tree, 20)) out.add(text.toLowerCase(Locale.ROOT));
                }
            }
        } catch (Throwable t) {
            // fall back to the view
        }
        if (out.isEmpty()) out.addAll(Stories.viewTexts(child));
        return out;
    }

    /** The tab labels of a row: short texts without digits, in order. */
    private static List<String> tabLabels(View pager, View child) {
        List<String> labels = new java.util.ArrayList<>();
        for (String text : rowTexts(pager, child)) {
            String t = text.trim();
            if (t.length() >= 2 && t.length() <= 14 && !t.matches(".*\\d.*") && !labels.contains(t)) labels.add(t);
        }
        return labels;
    }

    /**
     * The Reels tab: a row no taller than 12% of the window whose short texts hold "reels" and at least one other
     * tab name (photos, posts, videos, about ...). Each tab is as wide as its text plus padding, so the tap goes to the
     * middle of "reels" by the share of the text lengths. Null when no such row is on screen.
     */
    private static int[] reelsTab(View root) {
        for (View pager : FeedItems.pagersIn(root)) {
            if (!(pager instanceof ViewGroup)) continue;
            ViewGroup group = (ViewGroup) pager;
            for (int i = 0; i < group.getChildCount() && i < 12; i++) {
                View child = group.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || child.getHeight() <= 0
                        || child.getHeight() > root.getHeight() * 0.12f) {
                    continue;
                }
                List<String> labels = tabLabels(pager, child);
                int index = labels.indexOf("reels");
                if (index < 0) continue;
                boolean other = false;
                for (String label : labels) if (tabWord(label)) other = true;
                if (!other) continue;
                float total = 0f;
                float before = 0f;
                for (int k = 0; k < labels.size(); k++) {
                    float w = labels.get(k).length() + 4f;
                    if (k < index) before += w;
                    total += w;
                }
                float fraction = (before + (labels.get(index).length() + 4f) / 2f) / total;
                int[] location = new int[2];
                child.getLocationInWindow(location);
                return new int[] {location[0] + Math.round(child.getWidth() * fraction), location[1] + child.getHeight() / 2};
            }
        }
        return null;
    }

    /** For the log: what the short rows of the profile say (to find the Reels tab when it was not recognised). */
    private static void logTabRows(View root) {
        if (!MorpheLog.enabled()) return;
        try {
            for (View pager : FeedItems.pagersIn(root)) {
                if (!(pager instanceof ViewGroup)) continue;
                ViewGroup group = (ViewGroup) pager;
                for (int i = 0; i < group.getChildCount() && i < 12; i++) {
                    View child = group.getChildAt(i);
                    if (child.getVisibility() != View.VISIBLE || child.getHeight() <= 0) continue;
                    MorpheLog.log("profile", "  row " + i + " h=" + child.getHeight() + " texts " + rowTexts(pager, child));
                }
            }
        } catch (Throwable t) {
            // diagnostics only
        }
    }

    // ------------------------------------------------------------------------------------ curtain

    /** A loading screen over the window while the redirect runs, so the pages it passes through are not seen. Touches go through it. */
    private static void curtainOn(Activity activity) {
        try {
            if (curtain != null) return;
            boolean night = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            View view = Overlay.mark(new Loading(activity, night));
            ((ViewGroup) activity.getWindow().getDecorView()).addView(view,
                    new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
            curtain = view;
            VideoFeatures.MAIN.postDelayed(CURTAIN_OFF, CURTAIN_MAX_MS);
        } catch (Throwable t) {
            curtain = null;
        }
    }

    /** The cover: a plain background, a turning ring and "Opening profile". */
    private static final class Loading extends View {
        private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint label = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF arc = new RectF();
        private final float density;

        Loading(Context context, boolean night) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            setBackgroundColor(night ? 0xFF18191A : 0xFFFFFFFF);
            track.setStyle(Paint.Style.STROKE);
            track.setStrokeWidth(4f * density);
            track.setColor(night ? 0xFF3A3B3C : 0xFFE4E6EB);
            ring.setStyle(Paint.Style.STROKE);
            ring.setStrokeWidth(4f * density);
            ring.setStrokeCap(Paint.Cap.ROUND);
            ring.setColor(0xFF1877F2);
            label.setTextAlign(Paint.Align.CENTER);
            label.setTextSize(15f * density);
            label.setColor(night ? 0xFFB0B3B8 : 0xFF65676B);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f;
            float cy = getHeight() * 0.42f;
            float r = 22f * density;
            arc.set(cx - r, cy - r, cx + r, cy + r);
            canvas.drawOval(arc, track);
            float angle = (SystemClock.uptimeMillis() % 900L) / 900f * 360f;
            canvas.drawArc(arc, angle, 110f, false, ring);
            canvas.drawText("Opening profile", cx, cy + r + 28f * density, label);
            postInvalidateOnAnimation();
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
