package app.xposed.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.NumberFormat;
import java.util.List;

/** X-Posed's settings, laid out like X's own settings pages. Opened from the badge sheet. */
final class SettingsScreen {
    private static final NumberFormat NUMBERS = NumberFormat.getIntegerInstance();

    private final Page page;
    private final Ui ui;
    private final SharedPreferences prefs;
    private LinearLayout preview;
    private View highlightPreview;

    private SettingsScreen(Context context) {
        Settings.init(context);
        this.page = new Page(context, "X-Posed");
        this.ui = page.ui;
        this.prefs = Settings.prefs();
    }

    static void show(Context context) {
        SettingsScreen screen = new SettingsScreen(context);
        screen.build();
        screen.page.show();
    }

    private void build() {
        page.clear();
        Context context = page.context;

        page.section("Badges");
        preview = new LinearLayout(context);
        preview.setGravity(Gravity.CENTER_VERTICAL);
        preview.setPadding(ui.dp(16), ui.dp(4), ui.dp(16), ui.dp(12));
        page.add(preview);
        updatePreview();
        choice("Badge size", "The size of the icons and spacing beside names.", Settings.BADGE_SIZE,
                new String[]{"Small", "Medium", "Large"}, new String[]{"small", "medium", "large"}, "medium");
        toggle("Show badge background", "Turn off the background and border for icons only.", Settings.BADGE_BACKGROUND, true);
        toggle("Show country flags", "Display country flags next to names.", Settings.BADGE_FLAGS, true);
        toggle("Show device icons", "Display device type icons (Apple, Android, Web).", Settings.BADGE_DEVICES, false);
        toggle("Show VPN/proxy indicator", "Show a shield when the location may not be accurate.", Settings.BADGE_VPN, false);
        toggle("Show info icon", "Show the circled-i at the end of each badge. Turn it off to free space for long names.",
                Settings.BADGE_INFO, true);

        page.section("Filters");
        FilterRules rules = Filters.rules();
        page.link(null, "Filter profile", Filters.active().name, v -> FilterScreens.showProfiles(context, this::build));
        page.choice("When a post matches", "Highlighted posts stay readable; hidden posts are removed from timelines. "
                        + "Saved in the filter profile.", new String[]{"Highlight it", "Hide it"},
                new String[]{"highlight", "hide"}, rules.highlight ? "highlight" : "hide", picked -> {
                    Filters.edit(b -> b.highlight = picked.equals("highlight"));
                    changed();
                });
        page.link(null, "Saved filters", FilterScreens.summary(Filters.rules()), v -> FilterScreens.showSaved(context, this::build));
        page.link(null, "Add a filter", "Countries, accounts, names, bios, links, labels, languages and more.",
                v -> FilterScreens.showAdd(context, this::build));
        page.link(null, "Always Show", FilterScreens.alwaysShowSummary(Filters.rules()),
                v -> FilterScreens.showAlwaysShow(context, this::build));
        page.link(null, "Filter behavior", "Device country and profile details.",
                v -> FilterScreens.showBehavior(context, this::build));
        highlightPreview = mockPost();
        page.add(highlightPreview);
        choice("Highlight contrast", "How strongly highlighted posts stand out. Standard matches X-Posed.",
                Settings.HIGHLIGHT_CONTRAST, new String[]{"Subtle", "Standard", "Strong", "Bold"},
                new String[]{"subtle", "standard", "strong", "bold"}, "standard");

        page.section("Privacy");
        toggle("Don't report passive engagement",
                "Impressions, viewing time, video views and opening of highlighted or hidden posts aren't sent to X. "
                        + "Likes, replies and reposts still are.", Settings.ZERO_ENGAGEMENT, true);
        toggle("Community cache",
                "Look up accounts in the X-Posed community cache and share what X reports with it. "
                        + "The handles you see are sent to the cache server.", Settings.COMMUNITY_CACHE, true);
        TextView[] clear = new TextView[1];
        clear[0] = page.action("Clear cached accounts", Page.DESTRUCTIVE, v -> {
            Lookup.clear();
            States.changedAll();
            clear[0].setText("Cleared");
            clear[0].setTextColor(ui.secondary);
        });

        page.section("Statistics");
        long posts = Stats.get(Stats.POSTS);
        long requested = Stats.get(Stats.CLOUD_REQUESTED);
        String summary = NUMBERS.format(posts) + " posts seen"
                + (requested > 0 ? " · " + percent(Stats.get(Stats.CLOUD_HITS), requested) + " cache hits" : "");
        page.link(null, "View statistics", summary, v -> showStats());

        page.section("About");
        page.note("Based on X-Posed by Alexander Hagenah (github.com/xaitax/x-account-location-device, MIT License). "
                + "Filter icons from Lucide (lucide.dev, ISC License). "
                + "Badges show what X reports about an account, not anyone's live location or the device used for a post.");
    }

    private void changed() {
        updatePreview();
        if (highlightPreview != null) highlightPreview.invalidate();
        States.changedAll();
    }

    private void toggle(String title, String summary, String key, boolean def) {
        page.toggle(title, summary, prefs.getBoolean(key, def), on -> {
            prefs.edit().putBoolean(key, on).apply();
            changed();
        });
    }

    private void choice(String title, String summary, String key, String[] labels, String[] values, String def) {
        page.choice(title, summary, labels, values, prefs.getString(key, def), picked -> {
            prefs.edit().putString(key, picked).apply();
            changed();
        });
    }

    /** "@example" with a badge, like the extension's preview: an account with a location warning. */
    private void updatePreview() {
        preview.removeAllViews();
        preview.addView(ui.text("@example", 15, false, ui.secondary));
        AccountInfo sample = new AccountInfo("Switzerland", "Switzerland App Store", false, null, 0, AccountInfo.ORIGIN_X, 0);
        BadgeDrawable badge = BadgeDrawable.create(sample);
        if (badge == null) return;
        ImageView image = new ImageView(page.context);
        image.setImageDrawable(badge);
        image.setAdjustViewBounds(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(22 * badge.spanScale()));
        lp.setMarginStart(ui.dp(6));
        preview.addView(image, lp);
    }

    /** A post as it would look when highlighted, for the contrast setting. */
    private View mockPost() {
        Context context = page.context;
        LinearLayout post = new LinearLayout(context);
        post.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(12));
        View avatar = new View(context);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(ui.divider);
        avatar.setBackground(circle);
        post.addView(avatar, new LinearLayout.LayoutParams(ui.dp(40), ui.dp(40)));
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPaddingRelative(ui.dp(12), 0, 0, 0);
        LinearLayout header = new LinearLayout(context);
        header.addView(ui.text("Example", 15, true, ui.text));
        header.addView(ui.text("  @example · 1h", 15, false, ui.secondary));
        body.addView(header);
        body.addView(ui.text("This is how posts that match a filter look in your timeline.", 15, false, ui.text));
        post.addView(body, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        Highlight highlight = new Highlight(ui.dark, context.getResources().getDisplayMetrics().density);
        post.getOverlay().add(highlight);
        post.addOnLayoutChangeListener(highlight);
        return post;
    }

    private void showStats() {
        Page stats = new Page(page.context, "Statistics");
        long posts = Stats.get(Stats.POSTS);
        List<Stats.Entry> seen = Stats.top(false);
        stats.section("Posts seen");
        stats.note(NUMBERS.format(posts) + " posts from " + seen.size() + " countries and regions"
                + (Stats.get(Stats.POSTS_UNKNOWN) > 0 ? ", " + NUMBERS.format(Stats.get(Stats.POSTS_UNKNOWN)) + " not yet looked up" : ""));
        bars(stats, seen, posts);

        stats.section(Filters.rules().highlight ? "Highlighted" : "Hidden");
        List<Stats.Entry> filtered = Stats.top(true);
        long filteredTotal = 0;
        for (Stats.Entry e : filtered) filteredTotal += e.count;
        if (filtered.isEmpty()) {
            stats.note("No filtered posts yet.");
        } else {
            stats.note(NUMBERS.format(filteredTotal) + " posts, " + percent(filteredTotal, posts) + " of all posts seen");
            bars(stats, filtered, filteredTotal);
        }

        stats.section("Lookups");
        long requested = Stats.get(Stats.CLOUD_REQUESTED), hits = Stats.get(Stats.CLOUD_HITS);
        stat(stats, "Community cache hit rate", requested == 0 ? "–" : percent(hits, requested),
                NUMBERS.format(hits) + " of " + NUMBERS.format(requested) + " accounts were already in the cache");
        stat(stats, "Looked up on X", NUMBERS.format(Stats.get(Stats.X_LOOKUPS)),
                NUMBERS.format(Stats.get(Stats.X_FOUND)) + " with a location, " + NUMBERS.format(Stats.get(Stats.X_FAILED)) + " failed");
        stat(stats, "Shared with the community cache", NUMBERS.format(Stats.get(Stats.CONTRIBUTED_ACCEPTED)),
                NUMBERS.format(Stats.get(Stats.CONTRIBUTED)) + " accounts sent, counted when the cache accepted them");

        stats.action("Reset statistics", Page.DESTRUCTIVE, v -> {
            Stats.reset();
            stats.dialog.dismiss();
        });
        stats.onClose(this::build);
        stats.show();
    }

    /** One row per location: flag, name, count and a bar for its share, top 10 then the rest summed. */
    private void bars(Page stats, List<Stats.Entry> entries, long total) {
        int shown = Math.min(10, entries.size());
        long rest = 0;
        for (int i = shown; i < entries.size(); i++) rest += entries.get(i).count;
        for (int i = 0; i < shown; i++) bar(stats, entries.get(i).location, entries.get(i).count, total);
        if (rest > 0) bar(stats, null, rest, total);
    }

    private void bar(Page stats, String location, long count, long total) {
        Context context = page.context;
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(ui.dp(16), ui.dp(6), ui.dp(16), ui.dp(6));
        LinearLayout line = new LinearLayout(context);
        String flag = location == null ? null : Countries.flagFor(location);
        String label = location == null ? "Others" : (flag != null ? flag : Countries.UNKNOWN_FLAG) + "  " + location;
        line.addView(ui.text(label, 15, false, ui.text), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        line.addView(ui.text(NUMBERS.format(count) + " · " + percent(count, total), 15, false, ui.secondary));
        row.addView(line);
        FrameLayout track = new FrameLayout(context);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(ui.divider);
        bg.setCornerRadius(ui.dp(2));
        track.setBackground(bg);
        View fill = new View(context);
        GradientDrawable fg = new GradientDrawable();
        fg.setColor(Ui.ACCENT);
        fg.setCornerRadius(ui.dp(2));
        fill.setBackground(fg);
        track.addView(fill, new FrameLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT));
        track.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            int width = Math.round((r - l) * (total == 0 ? 0 : (float) count / total));
            if (fill.getLayoutParams().width != width) {
                fill.getLayoutParams().width = width;
                fill.post(fill::requestLayout);
            }
        });
        track.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams trackLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(4));
        trackLp.topMargin = ui.dp(6);
        row.addView(track, trackLp);
        stats.add(row);
    }

    /** A stats row: title and explanation on the left, the figure on the right. */
    private void stat(Page stats, String title, String value, String summary) {
        stats.row(title, summary, ui.text(value, 17, true, ui.text), null);
    }

    private static String percent(long part, long whole) {
        if (whole <= 0) return "0%";
        return Math.round(100.0 * part / whole) + "%";
    }
}
