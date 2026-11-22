package app.userinsights.extension;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Collections;
import java.util.List;

/**
 * Draws the subreddit pills, the hidden-profile view and the hidden-profile button on top of the
 * Reddit screen. The views live in a transparent layer added to the window the content is in
 * (the activity, or a dialog or sheet above it), so touches outside them go straight through to Reddit.
 */
final class OverlayManager {
    private static final String LAYER_TAG = "user_insights_layer";
    private static final String HIDDEN_BUTTON_TAG = "user_insights_hidden_button";
    private static final String INLINE_TAG = "user_insights_inline";
    private static final int MAX_ROWS = 30;

    /** Border/text colours of the 1st, 2nd and 3rd pill. */
    static final int[] PILL_COLORS = {0xFFE8834A, 0xFFA77BF3, 0xFFE0709A};
    private static final int FULL_HISTORY_COLOR = 0xFF9A9DA3;
    private static final int PILL_FILL = 0xE60E0F12;
    private static final int LOADING_COLOR = 0xFF5C6066;
    private static TextPaint headerPaint;

    /** Tag of a pill row: whose row it is and what it shows. */
    private static final class RowTag {
        String user = "";
        String signature = "";
        boolean assigned;
    }

    private OverlayManager() {
    }

    /** Windows that have (or had) a layer, so all of them can be cleared. */
    private static final java.util.WeakHashMap<ViewGroup, Boolean> hosts = new java.util.WeakHashMap<>();
    private static java.lang.ref.WeakReference<ViewGroup> lastHost = new java.lang.ref.WeakReference<>(null);

    private static FrameLayout layer(ViewGroup host, boolean create) {
        if (host == null) {
            return null;
        }
        View existing = host.findViewWithTag(LAYER_TAG);
        if (existing instanceof FrameLayout) {
            return (FrameLayout) existing;
        }
        if (!create) {
            return null;
        }
        Context context = host.getContext();
        FrameLayout layer = new FrameLayout(context);
        layer.setTag(LAYER_TAG);
        layer.setClickable(false);
        layer.setFocusable(false);
        layer.setClipChildren(false);
        // Keep these views out of the accessibility tree, so they are not scanned or read out.
        layer.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        layer.setElevation(Ui.dp(context, 24));
        layer.setTranslationZ(Ui.dp(context, 24));
        host.addView(layer, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        hosts.put(host, Boolean.TRUE);
        return layer;
    }

    /** Hides everything while the screen scrolls, so pills never point at the wrong comment. */
    static void hideTemporarily(ViewGroup host) {
        FrameLayout layer = layer(host, false);
        if (layer != null) {
            layer.animate().cancel();
            layer.setAlpha(0f);
        }
    }

    static void hideAllTemporarily() {
        for (ViewGroup host : new java.util.ArrayList<>(hosts.keySet())) {
            hideTemporarily(host);
        }
    }

    /** Moves the pills (and the hidden-profile button) by dy pixels, following the content while it scrolls. */
    static void shiftRows(ViewGroup host, float dy) {
        if (dy == 0f) {
            return;
        }
        FrameLayout layer = layer(host, false);
        if (layer == null) {
            return;
        }
        for (int i = 0; i < layer.getChildCount(); i++) {
            View child = layer.getChildAt(i);
            if (child.getVisibility() == View.VISIBLE && (isRow(child) || HIDDEN_BUTTON_TAG.equals(child.getTag()))) {
                child.animate().cancel();
                child.setTranslationY(child.getTranslationY() + dy);
            }
        }
    }

    /** True if (x, y), in window coordinates, is on one of our visible views. */
    static boolean isOnOverlay(ViewGroup host, float x, float y) {
        FrameLayout layer = layer(host, false);
        if (layer == null || layer.getAlpha() == 0f) {
            return false;
        }
        Rect hit = new Rect();
        for (int i = 0; i < layer.getChildCount(); i++) {
            View child = layer.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) {
                continue;
            }
            child.getHitRect(hit);
            if (hit.contains((int) x, (int) y)) {
                return true;
            }
        }
        return false;
    }

    static void clear(ViewGroup host) {
        FrameLayout layer = layer(host, false);
        if (layer == null) {
            return;
        }
        for (int i = 0; i < layer.getChildCount(); i++) {
            layer.getChildAt(i).setVisibility(View.GONE);
        }
    }

    static void clearAll() {
        for (ViewGroup host : new java.util.ArrayList<>(hosts.keySet())) {
            clear(host);
        }
    }

    /** Removes the layers of an activity that is closing (its own window and its dialogs). */
    static void remove(Activity activity) {
        for (ViewGroup host : new java.util.ArrayList<>(hosts.keySet())) {
            if (host.getContext() != activity && unwrap(host.getContext()) != activity) {
                continue;
            }
            FrameLayout layer = layer(host, false);
            if (layer != null) {
                releaseInline(layer);
                host.removeView(layer);
            }
            hosts.remove(host);
        }
    }

    private static Context unwrap(Context context) {
        while (context instanceof android.content.ContextWrapper && !(context instanceof Activity)) {
            Context base = ((android.content.ContextWrapper) context).getBaseContext();
            if (base == null || base == context) {
                break;
            }
            context = base;
        }
        return context;
    }

    /**
     * Draws everything for one scan.
     *
     * @param activity For opening screens from the pills.
     * @param host     Root view of the window the scanned content is in.
     */
    static void render(Activity activity, ViewGroup host, ScreenScanner.Result result) {
        ViewGroup previous = lastHost.get();
        if (previous != null && previous != host) {
            // Moved to another window (such as a post opened above the feed): clear the old one.
            clear(previous);
        }
        lastHost = new java.lang.ref.WeakReference<>(host);

        FrameLayout layer = layer(host, true);
        if (layer == null) {
            return;
        }
        int[] origin = new int[2];
        layer.getLocationOnScreen(origin);
        int layerWidth = layer.getWidth();
        int layerHeight = layer.getHeight();
        if (layerWidth <= 0 || layerHeight <= 0) {
            // The layer was just added and is not laid out yet: scan again on the next frame.
            layer.post(() -> InsightsAccessibilityService.requestScan(0));
            return;
        }

        boolean inlineShown = renderInline(activity, layer, result, origin, layerHeight);
        renderHiddenButton(activity, layer, result, origin, layerWidth, layerHeight, inlineShown);
        renderRows(activity, layer, result, origin, layerWidth, layerHeight, inlineShown);

        layer.animate().cancel();
        layer.setAlpha(1f);
    }

    // Pills.

    private static void renderRows(Activity activity, FrameLayout layer, ScreenScanner.Result result,
                                   int[] origin, int layerWidth, int layerHeight, boolean inlineShown) {
        boolean badges = Prefs.badgesEnabled();
        int wanted = Prefs.badgeCount();
        int inlineTop = inlineShown ? (int) layer.findViewWithTag(INLINE_TAG).getTranslationY() : Integer.MAX_VALUE;

        // Rows not claimed by a name on screen in this pass are hidden at the end.
        for (int i = 0; i < layer.getChildCount(); i++) {
            View child = layer.getChildAt(i);
            if (isRow(child)) {
                ((RowTag) child.getTag()).assigned = false;
            }
        }

        int used = 0;
        for (ScreenScanner.Hit hit : result.hits) {
            if (used >= MAX_ROWS) {
                break;
            }
            // Comment headers draw their own pills when that patch is applied; only u/name headers
            // (profiles, post authors) still get floating ones.
            if (EmbeddedPills.isActive() && !hit.profileHeader) {
                continue;
            }
            // "Full history" on the u/name header of a profile that is not hidden.
            boolean fullHistory = hit.profileHeader && result.hiddenUser == null
                    && hit.user.equalsIgnoreCase(result.profileUser) && Prefs.hiddenButtonEnabled();
            if (!badges && !fullHistory) {
                continue;
            }

            List<ArcticShift.SubCount> subs = Collections.emptyList();
            boolean loading = false;
            if (badges) {
                List<ArcticShift.SubCount> cached = ArcticShift.cachedTopSubs(hit.user);
                if (cached == null) {
                    ArcticShift.requestTopSubs(hit.user);
                    loading = ArcticShift.isLoading(hit.user);
                } else {
                    subs = cached;
                }
            }
            if (subs.isEmpty() && !fullHistory && !loading) {
                continue;
            }

            Rect local = new Rect(hit.bounds);
            local.offset(-origin[0], -origin[1]);
            if (local.bottom <= 0 || local.top >= layerHeight || local.top >= inlineTop) {
                continue;
            }
            // Pills stay inside the list the name is in (such as the comments panel of a video).
            int maxRight = layerWidth;
            if (hit.container != null) {
                maxRight = Math.min(layerWidth, hit.container.right - origin[0]);
            }
            LinearLayout row = rowFor(layer, hit.user);
            boolean wasVisible = row.getVisibility() == View.VISIBLE;
            bindRow(activity, row, hit.user, subs, badges ? wanted : 0, fullHistory, loading);
            if (positionRow(activity, row, local, anchorRight(activity, hit, local, origin), hit.merged, maxRight, wasVisible)) {
                row.setVisibility(View.VISIBLE);
                used++;
            } else {
                row.setVisibility(View.GONE);
            }
        }

        for (int i = 0; i < layer.getChildCount(); i++) {
            View child = layer.getChildAt(i);
            if (isRow(child) && !((RowTag) child.getTag()).assigned) {
                child.setVisibility(View.GONE);
            }
        }
    }

    private static boolean isRow(View view) {
        return view.getTag() instanceof RowTag;
    }

    /**
     * Where the name (and time) text ends. A node can be wider than its text,
     * such as a whole header row, so measure the text in that case.
     */
    private static int anchorRight(Context context, ScreenScanner.Hit hit, Rect local, int[] origin) {
        if (hit.textRight >= 0) {
            // Where the text really ends, as reported for the screen.
            return hit.textRight - origin[0];
        }
        if (hit.merged || hit.headerText == null) {
            return local.right;
        }
        if (headerPaint == null) {
            headerPaint = new TextPaint(TextPaint.ANTI_ALIAS_FLAG);
        }
        TextPaint paint = headerPaint;
        paint.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14,
                context.getResources().getDisplayMetrics()));
        int textWidth = (int) Math.ceil(paint.measureText(hit.headerText.split("\n")[0]));
        if (local.width() > textWidth + Ui.dp(context, 24)) {
            return Math.min(local.right, local.left + textWidth);
        }
        return local.right;
    }

    /**
     * The row for a user: the one that showed this user before (so it glides into place instead
     * of jumping), else a free one, else a new one.
     */
    private static LinearLayout rowFor(FrameLayout layer, String user) {
        LinearLayout free = null;
        for (int i = 0; i < layer.getChildCount(); i++) {
            View child = layer.getChildAt(i);
            if (!isRow(child)) {
                continue;
            }
            RowTag tag = (RowTag) child.getTag();
            if (tag.assigned) {
                continue;
            }
            if (tag.user.equalsIgnoreCase(user) && child.getVisibility() == View.VISIBLE) {
                tag.assigned = true;
                return (LinearLayout) child;
            }
            if (free == null) {
                free = (LinearLayout) child;
            }
        }
        LinearLayout row = free;
        if (row == null) {
            row = new LinearLayout(layer.getContext());
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setTag(new RowTag());
            row.setVisibility(View.GONE);
            layer.addView(row, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        } else {
            // A row of another user: it must not animate from that user's place.
            row.setVisibility(View.GONE);
        }
        ((RowTag) row.getTag()).assigned = true;
        return row;
    }

    private static void bindRow(final Activity activity, LinearLayout row, final String user,
                                List<ArcticShift.SubCount> subs, int wanted, boolean fullHistory, boolean loading) {
        int count = Math.min(wanted, subs.size());
        StringBuilder signature = new StringBuilder(user).append('|');
        for (int i = 0; i < count; i++) {
            signature.append(subs.get(i).subreddit).append(':').append(subs.get(i).count).append(',');
        }
        signature.append(fullHistory).append(loading);
        String key = signature.toString();
        RowTag tag = (RowTag) row.getTag();
        tag.user = user;
        if (key.equals(tag.signature)) {
            return;
        }
        tag.signature = key;
        row.removeAllViews();

        int gap = Ui.dp(activity, 4);
        if (loading && count == 0) {
            // Shown at once while the top subreddits load, so the row never pops in late.
            addPill(row, pill(activity, "· · ·", LOADING_COLOR), 0);
        }
        for (int i = 0; i < count; i++) {
            final ArcticShift.SubCount sub = subs.get(i);
            TextView pill = pill(activity, "r/" + sub.subreddit + " · " + Ui.formatCount(sub.count),
                    PILL_COLORS[i % PILL_COLORS.length]);
            pill.setOnClickListener(v -> UserInsights.openArchive(activity, user, sub.subreddit));
            pill.setOnLongClickListener(v -> {
                UserInsights.openSettings(activity);
                return true;
            });
            addPill(row, pill, i > 0 ? gap : 0);
        }
        if (fullHistory) {
            TextView pill = pill(activity, "Full history ›", FULL_HISTORY_COLOR);
            pill.setOnClickListener(v -> UserInsights.openArchive(activity, user, null));
            pill.setOnLongClickListener(v -> {
                UserInsights.openSettings(activity);
                return true;
            });
            addPill(row, pill, row.getChildCount() > 0 ? gap : 0);
        }
    }

    private static void addPill(LinearLayout row, TextView pill, int leftMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.leftMargin = leftMargin;
        row.addView(pill, params);
    }

    static TextView pill(Context context, String text, int color) {
        TextView pill = new TextView(context);
        pill.setText(text);
        pill.setTextColor(color);
        pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        pill.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        // Full subreddit names: pills that do not fit are left out instead of cut short.
        pill.setSingleLine(true);
        int h = Ui.dp(context, 7);
        int v = Ui.dp(context, 2);
        pill.setPadding(h, v, h, v);
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(Ui.dp(context, 50));
        background.setColor(PILL_FILL);
        background.setStroke(Math.max(1, Ui.dp(context, 1)), color);
        pill.setBackground(background);
        pill.setClickable(true);
        return pill;
    }

    /**
     * Places a row on the name's line, right after the name and time, dropping pills that do not fit.
     *
     * @param wasVisible If the row already showed this user: small corrections glide instead of jump.
     * @return false if not even one pill fits.
     */
    private static boolean positionRow(Context context, LinearLayout row, Rect name, int anchorRight,
                                       boolean merged, int maxRight, boolean wasVisible) {
        int margin = Ui.dp(context, 8);
        int gap = Ui.dp(context, 8);
        int unspecified = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED);

        if (merged) {
            // The name is somewhere inside a whole comment; put the pills in its top-right corner.
            int right = Math.min(name.right, maxRight);
            if (!fitPills(row, right - name.left - 2 * margin)) {
                return false;
            }
            row.measure(unspecified, unspecified);
            moveTo(context, row, right - margin - row.getMeasuredWidth(), name.top + Ui.dp(context, 4), wasVisible);
            return true;
        }

        // Centre on the first line of the name, even if the node also covers a flair line below it.
        int lineHeight = Math.min(name.height(), Ui.dp(context, 28));
        int x = anchorRight + gap;
        if (fitPills(row, maxRight - margin - x)) {
            row.measure(unspecified, unspecified);
            moveTo(context, row, x, name.top + (lineHeight - row.getMeasuredHeight()) / 2f, wasVisible);
            return true;
        }
        // No room on the line at all: just below the name.
        if (!fitPills(row, maxRight - margin - name.left)) {
            return false;
        }
        row.measure(unspecified, unspecified);
        moveTo(context, row, name.left, name.bottom + Ui.dp(context, 2), wasVisible);
        return true;
    }

    private static void moveTo(Context context, View view, float x, float y, boolean wasVisible) {
        if (wasVisible && ScrollTracker.isGestureActive()) {
            // Already moving with the finger; scan positions can be a frame behind, so leave it.
            return;
        }
        float dx = Math.abs(view.getTranslationX() - x);
        float dy = Math.abs(view.getTranslationY() - y);
        if (dx < 1f && dy < 1f) {
            return;
        }
        view.animate().cancel();
        int limit = Ui.dp(context, 160);
        if (wasVisible && dx < limit && dy < limit) {
            view.animate().translationX(x).translationY(y).setDuration(90).start();
        } else {
            view.setTranslationX(x);
            view.setTranslationY(y);
        }
    }

    /** Hides pills from the end until the row fits; false if none fits. */
    private static boolean fitPills(LinearLayout row, int available) {
        if (available <= 0 || row.getChildCount() == 0) {
            return false;
        }
        int unspecified = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED);
        for (int visible = row.getChildCount(); visible >= 1; visible--) {
            for (int i = 0; i < row.getChildCount(); i++) {
                row.getChildAt(i).setVisibility(i < visible ? View.VISIBLE : View.GONE);
            }
            row.measure(unspecified, unspecified);
            if (row.getMeasuredWidth() <= available) {
                return true;
            }
        }
        return false;
    }

    // Hidden profiles.

    /**
     * Shows the archived activity right inside a hidden profile, under its tabs.
     *
     * @return true if shown.
     */
    private static boolean renderInline(Activity activity, FrameLayout layer, ScreenScanner.Result result,
                                        int[] origin, int layerHeight) {
        View existing = layer.findViewWithTag(INLINE_TAG);
        if (!Prefs.hiddenButtonEnabled() || !Prefs.inlineHiddenEnabled()
                || result.hiddenUser == null || result.hiddenBounds == null) {
            if (existing != null) {
                existing.setVisibility(View.GONE);
            }
            return false;
        }

        Rect message = new Rect(result.hiddenBounds);
        message.offset(-origin[0], -origin[1]);
        int top;
        if (result.profileContentTop > 0 && result.profileContentTop - origin[1] < message.top) {
            top = result.profileContentTop - origin[1];
        } else {
            // No tabs found: start a little above the message, which usually has a picture above it.
            top = message.top - Ui.dp(activity, 140);
        }
        top = Math.max(top, Ui.dp(activity, 80));
        int height = layerHeight - top;
        if (height < Ui.dp(activity, 220)) {
            if (existing != null) {
                existing.setVisibility(View.GONE);
            }
            return false;
        }

        FrameLayout panel;
        if (existing instanceof FrameLayout) {
            panel = (FrameLayout) existing;
            View child = panel.getChildCount() > 0 ? panel.getChildAt(0) : null;
            if (!(child instanceof ArchiveView) || !((ArchiveView) child).user.equalsIgnoreCase(result.hiddenUser)) {
                if (child instanceof ArchiveView) {
                    ((ArchiveView) child).release();
                }
                panel.removeAllViews();
                panel.addView(new ArchiveView(activity, result.hiddenUser, null, true));
            }
        } else {
            panel = new FrameLayout(activity);
            panel.setTag(INLINE_TAG);
            panel.setClickable(true);
            panel.addView(new ArchiveView(activity, result.hiddenUser, null, true));
            layer.addView(panel, 0, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        }

        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) panel.getLayoutParams();
        if (params.height != height) {
            params.height = height;
            panel.setLayoutParams(params);
        }
        panel.setTranslationY(top);
        panel.setVisibility(View.VISIBLE);
        return true;
    }

    private static void releaseInline(FrameLayout layer) {
        View existing = layer.findViewWithTag(INLINE_TAG);
        if (existing instanceof FrameLayout) {
            FrameLayout panel = (FrameLayout) existing;
            if (panel.getChildCount() > 0 && panel.getChildAt(0) instanceof ArchiveView) {
                ((ArchiveView) panel.getChildAt(0)).release();
            }
            layer.removeView(panel);
        }
    }

    private static void renderHiddenButton(final Activity activity, FrameLayout layer, ScreenScanner.Result result,
                                           int[] origin, int layerWidth, int layerHeight, boolean inlineShown) {
        View existing = layer.findViewWithTag(HIDDEN_BUTTON_TAG);
        if (inlineShown || !Prefs.hiddenButtonEnabled() || result.hiddenUser == null || result.hiddenBounds == null) {
            if (existing != null) {
                existing.setVisibility(View.GONE);
            }
            return;
        }

        LinearLayout button;
        TextView label;
        if (existing instanceof LinearLayout) {
            button = (LinearLayout) existing;
            label = (TextView) button.getChildAt(0);
        } else {
            button = new LinearLayout(activity);
            button.setTag(HIDDEN_BUTTON_TAG);
            button.setGravity(Gravity.CENTER);
            int h = Ui.dp(activity, 16);
            int v = Ui.dp(activity, 10);
            button.setPadding(h, v, h, v);
            GradientDrawable background = new GradientDrawable();
            background.setCornerRadius(Ui.dp(activity, 50));
            background.setColor(0xFFFF4500);
            button.setBackground(background);
            button.setElevation(Ui.dp(activity, 6));
            label = new TextView(activity);
            label.setTextColor(0xFFFFFFFF);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            label.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            button.addView(label);
            layer.addView(button, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        final String user = result.hiddenUser;
        label.setText("Show u/" + user + "'s hidden activity");
        button.setOnClickListener(v -> UserInsights.openArchive(activity, user, null));
        button.setOnLongClickListener(v -> {
            UserInsights.openSettings(activity);
            return true;
        });

        Rect local = new Rect(result.hiddenBounds);
        local.offset(-origin[0], -origin[1]);
        int unspecified = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED);
        button.measure(unspecified, unspecified);
        int width = button.getMeasuredWidth();
        int height = button.getMeasuredHeight();
        int x = Math.max(0, Math.min(layerWidth - width, local.centerX() - width / 2));
        int y = local.bottom + Ui.dp(activity, 12);
        if (y + height > layerHeight - Ui.dp(activity, 16)) {
            y = Math.max(0, local.top - height - Ui.dp(activity, 12));
        }
        button.setTranslationX(x);
        button.setTranslationY(y);
        button.setVisibility(View.VISIBLE);
    }
}
