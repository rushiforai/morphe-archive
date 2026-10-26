package app.xposed.extension;

import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsetsController;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/** X-Posed's settings, laid out like X's own settings pages. Opened from the badge sheet. */
final class SettingsScreen {
    private static final int DESTRUCTIVE = 0xFFF4212E;
    private static final Glyphs.Glyph BACK = new Glyphs.Glyph(new Glyphs.Layer(
            Glyphs.svg("M7.414 13l5.043 5.04-1.414 1.42L3.586 12l7.457-7.46 1.414 1.42L7.414 11H21v2H7.414z"), false, 0));
    private static final Glyphs.Glyph CHECK = new Glyphs.Glyph(new Glyphs.Layer(
            Glyphs.svg("M5 12.5l4.5 4.5L19 7.5"), true, 2.4f));

    private final Context context;
    private final Ui ui;
    private final SharedPreferences prefs;
    private final Dialog dialog;
    private static final java.text.NumberFormat NUMBERS = java.text.NumberFormat.getIntegerInstance();
    private LinearLayout list;
    private LinearLayout preview;
    private View highlightPreview;

    private SettingsScreen(Context context) {
        this.context = context;
        Settings.init(context);
        this.ui = new Ui(context);
        this.prefs = Settings.prefs();
        this.dialog = fullScreen(context, ui);

        ScrollView scroll = new ScrollView(context);
        list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(0, 0, 0, ui.dp(24));
        scroll.addView(list);
        dialog.setContentView(page(context, ui, "X-Posed", dialog, scroll));
    }

    static void show(Context context) {
        SettingsScreen screen = new SettingsScreen(context);
        screen.build();
        screen.dialog.show();
    }

    private void build() {
        list.removeAllViews();

        section("Badges");
        preview = new LinearLayout(context);
        preview.setGravity(Gravity.CENTER_VERTICAL);
        preview.setPadding(ui.dp(16), ui.dp(4), ui.dp(16), ui.dp(12));
        list.addView(preview);
        updatePreview();
        choice("Badge size", "The size of the icons and spacing beside names.", Settings.BADGE_SIZE,
                new String[]{"Small", "Medium", "Large"}, new String[]{"small", "medium", "large"}, "medium");
        toggle("Show badge background", "Turn off the background and border for icons only.", Settings.BADGE_BACKGROUND, true);
        toggle("Show country flags", "Display country flags next to names.", Settings.BADGE_FLAGS, true);
        toggle("Show device icons", "Display device type icons (Apple, Android, Web).", Settings.BADGE_DEVICES, false);
        toggle("Show VPN/proxy indicator", "Show a shield when the location may not be accurate.", Settings.BADGE_VPN, false);
        toggle("Show info icon", "Show the circled-i at the end of each badge. Turn it off to free space for long names.",
                Settings.BADGE_INFO, true);

        section("Filters");
        choice("When a post matches", "Highlighted posts stay readable; hidden posts are removed from timelines.",
                Settings.FILTER_MODE, new String[]{"Highlight it", "Hide it"},
                new String[]{Settings.MODE_HIGHLIGHT, Settings.MODE_HIDE}, Settings.MODE_HIGHLIGHT);
        List<String> filtered = Filters.locations();
        row("Countries and regions", filtered.isEmpty() ? "None" : String.join(", ", filtered), null,
                v -> new CountryPicker().show());
        highlightPreview = mockPost();
        list.addView(highlightPreview, Ui.matchWidth());
        choice("Highlight contrast", "How strongly highlighted posts stand out. Standard matches X-Posed.",
                Settings.HIGHLIGHT_CONTRAST, new String[]{"Subtle", "Standard", "Strong", "Bold"},
                new String[]{"subtle", "standard", "strong", "bold"}, "standard");

        section("Privacy");
        toggle("Don't report passive engagement",
                "Impressions, viewing time, video views and opening of highlighted or hidden posts aren't sent to X. "
                        + "Likes, replies and reposts still are.", Settings.ZERO_ENGAGEMENT, true);
        toggle("Community cache",
                "Look up accounts in the X-Posed community cache and share what X reports with it. "
                        + "The handles you see are sent to the cache server.", Settings.COMMUNITY_CACHE, true);
        TextView clear = ui.text("Clear cached accounts", 15, false, DESTRUCTIVE);
        clear.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        clear.setBackground(ui.rowBackground());
        clear.setOnClickListener(v -> {
            Lookup.clear();
            clear.setText("Cleared");
            clear.setTextColor(ui.secondary);
        });
        list.addView(clear, Ui.matchWidth());

        section("Statistics");
        long posts = Stats.get(Stats.POSTS);
        long requested = Stats.get(Stats.CLOUD_REQUESTED);
        String summary = NUMBERS.format(posts) + " posts seen"
                + (requested > 0 ? " · " + percent(Stats.get(Stats.CLOUD_HITS), requested) + " cache hits" : "");
        row("View statistics", summary, null, v -> showStats());

        section("About");
        TextView about = ui.text("Based on X-Posed by Alexander Hagenah (github.com/xaitax/x-account-location-device). "
                + "Badges show what X reports about an account, not anyone's live location or the device used for a post.",
                13, false, ui.secondary);
        about.setPadding(ui.dp(16), 0, ui.dp(16), 0);
        list.addView(about);
    }

    private void changed() {
        updatePreview();
        if (highlightPreview != null) highlightPreview.invalidate();
        HeaderBadges.refreshAll();
    }

    /** "@example" with a badge, like the extension's preview: an account with a location warning. */
    private void updatePreview() {
        preview.removeAllViews();
        preview.addView(ui.text("@example", 15, false, ui.secondary));
        AccountInfo sample = new AccountInfo("Switzerland", "Switzerland App Store", false, null, 0, AccountInfo.ORIGIN_X, 0);
        BadgeDrawable badge = BadgeDrawable.create(context, sample);
        if (badge == null) return;
        ImageView image = new ImageView(context);
        image.setImageDrawable(badge);
        image.setAdjustViewBounds(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(22 * badge.spanScale()));
        lp.leftMargin = ui.dp(6);
        preview.addView(image, lp);
    }

    /** A post as it would look when highlighted, for the contrast setting. */
    private View mockPost() {
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
        body.setPadding(ui.dp(12), 0, 0, 0);
        LinearLayout header = new LinearLayout(context);
        header.addView(ui.text("Example", 15, true, ui.text));
        TextView meta = ui.text("  @example · 1h", 15, false, ui.secondary);
        header.addView(meta);
        body.addView(header);
        body.addView(ui.text("This is how posts from countries you filter look in your timeline.", 15, false, ui.text));
        post.addView(body, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        FilterViews.Highlight highlight = new FilterViews.Highlight(context);
        post.getOverlay().add(highlight);
        post.addOnLayoutChangeListener(highlight);
        return post;
    }

    private void showStats() {
        Dialog d = fullScreen(context, ui);
        ScrollView scroll = new ScrollView(context);
        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(0, 0, 0, ui.dp(24));
        scroll.addView(page);
        LinearLayout saved = list;
        // Reuse the row builders for the stats page.
        listOverride(page);

        long posts = Stats.get(Stats.POSTS);
        List<Stats.Entry> seen = Stats.top(false);
        section("Posts seen");
        TextView total = ui.text(NUMBERS.format(posts) + " posts from " + seen.size() + " countries and regions"
                + (Stats.get(Stats.POSTS_UNKNOWN) > 0 ? ", " + NUMBERS.format(Stats.get(Stats.POSTS_UNKNOWN)) + " not yet looked up" : ""),
                13, false, ui.secondary);
        total.setPadding(ui.dp(16), 0, ui.dp(16), ui.dp(8));
        page.addView(total);
        bars(seen, posts);

        section(Settings.highlightMode() ? "Highlighted" : "Hidden");
        List<Stats.Entry> filtered = Stats.top(true);
        long filteredTotal = 0;
        for (Stats.Entry e : filtered) filteredTotal += e.count;
        if (filtered.isEmpty()) {
            TextView none = ui.text("No filtered posts yet.", 13, false, ui.secondary);
            none.setPadding(ui.dp(16), 0, ui.dp(16), 0);
            page.addView(none);
        } else {
            TextView share = ui.text(NUMBERS.format(filteredTotal) + " posts, " + percent(filteredTotal, posts) + " of all posts seen",
                    13, false, ui.secondary);
            share.setPadding(ui.dp(16), 0, ui.dp(16), ui.dp(8));
            page.addView(share);
            bars(filtered, filteredTotal);
        }

        section("Lookups");
        long requested = Stats.get(Stats.CLOUD_REQUESTED), hits = Stats.get(Stats.CLOUD_HITS);
        stat("Community cache hit rate", requested == 0 ? "–" : percent(hits, requested),
                NUMBERS.format(hits) + " of " + NUMBERS.format(requested) + " accounts were already in the cache");
        stat("Looked up on X", NUMBERS.format(Stats.get(Stats.X_LOOKUPS)),
                NUMBERS.format(Stats.get(Stats.X_FOUND)) + " with a location, " + NUMBERS.format(Stats.get(Stats.X_FAILED)) + " failed");
        stat("Shared with the community cache", NUMBERS.format(Stats.get(Stats.CONTRIBUTED_ACCEPTED)),
                NUMBERS.format(Stats.get(Stats.CONTRIBUTED)) + " accounts sent, counted when the cache accepted them");

        TextView reset = ui.text("Reset statistics", 15, false, DESTRUCTIVE);
        reset.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        reset.setBackground(ui.rowBackground());
        reset.setOnClickListener(v -> {
            Stats.reset();
            d.dismiss();
        });
        page.addView(reset, Ui.matchWidth());

        listOverride(saved);
        d.setContentView(page(context, ui, "Statistics", d, scroll));
        d.setOnDismissListener(x -> build());
        d.show();
    }

    private void listOverride(LinearLayout target) {
        list = target;
    }

    /** One row per location: flag, name, count and a bar for its share, top 10 then the rest summed. */
    private void bars(List<Stats.Entry> entries, long total) {
        int shown = Math.min(10, entries.size());
        long rest = 0;
        for (int i = shown; i < entries.size(); i++) rest += entries.get(i).count;
        for (int i = 0; i < shown; i++) bar(entries.get(i).location, entries.get(i).count, total);
        if (rest > 0) bar(null, rest, total);
    }

    private void bar(String location, long count, long total) {
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
        LinearLayout.LayoutParams trackLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(4));
        trackLp.topMargin = ui.dp(6);
        row.addView(track, trackLp);
        list.addView(row, Ui.matchWidth());
    }

    /** A stats row: title and explanation on the left, the figure on the right. */
    private void stat(String title, String value, String summary) {
        LinearLayout row = row(title, summary, ui.text(value, 17, true, ui.text), null);
        row.setBackground(null);
        row.setClickable(false);
    }

    private static String percent(long part, long whole) {
        if (whole <= 0) return "0%";
        return Math.round(100.0 * part / whole) + "%";
    }

    private void section(String title) {
        if (list.getChildCount() > 0) {
            View gap = ui.divider();
            ((LinearLayout.LayoutParams) gap.getLayoutParams()).topMargin = ui.dp(12);
            list.addView(gap);
        }
        TextView t = ui.text(title, 20, true, ui.text);
        t.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(8));
        list.addView(t);
    }

    /** A settings row: title, optional summary, optional widget on the right. */
    private LinearLayout row(String title, String summary, View widget, View.OnClickListener onClick) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(12));
        row.setBackground(ui.rowBackground());
        row.setOnClickListener(onClick);

        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(ui.text(title, 15, false, ui.text));
        if (summary != null) {
            TextView s = ui.text(summary, 13, false, ui.secondary);
            s.setPadding(0, ui.dp(2), 0, 0);
            texts.addView(s);
        }
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (widget != null) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.leftMargin = ui.dp(16);
            row.addView(widget, lp);
        }
        list.addView(row, Ui.matchWidth());
        return row;
    }

    private void toggle(String title, String summary, String key, boolean def) {
        Toggle sw = new Toggle(context, ui, prefs.getBoolean(key, def));
        row(title, summary, sw, v -> {
            sw.toggle();
            prefs.edit().putBoolean(key, sw.isChecked()).apply();
            changed();
        });
    }

    private void choice(String title, String summary, String key, String[] labels, String[] values, String def) {
        TextView value = ui.text(labelFor(labels, values, prefs.getString(key, def)), 15, false, Ui.ACCENT);
        row(title, summary, value, v -> pick(title, labels, values, prefs.getString(key, def), picked -> {
            prefs.edit().putString(key, picked).apply();
            value.setText(labelFor(labels, values, picked));
            changed();
        }));
    }

    private static String labelFor(String[] labels, String[] values, String value) {
        for (int i = 0; i < values.length; i++) if (values[i].equals(value)) return labels[i];
        return labels[0];
    }

    private interface Picked {
        void on(String value);
    }

    /** A small card with one row per option, the current one checked. */
    private void pick(String title, String[] labels, String[] values, String current, Picked picked) {
        Dialog d = new Dialog(context);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(0, ui.dp(8), 0, ui.dp(8));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(ui.background);
        bg.setCornerRadius(ui.dp(16));
        card.setBackground(bg);
        TextView t = ui.text(title, 20, true, ui.text);
        t.setPadding(ui.dp(24), ui.dp(16), ui.dp(24), ui.dp(8));
        card.addView(t);
        for (int i = 0; i < labels.length; i++) {
            String value = values[i];
            LinearLayout option = new LinearLayout(context);
            option.setGravity(Gravity.CENTER_VERTICAL);
            option.setPadding(ui.dp(24), ui.dp(14), ui.dp(24), ui.dp(14));
            option.setBackground(ui.rowBackground());
            option.addView(ui.text(labels[i], 15, false, ui.text), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            ImageView check = new ImageView(context);
            check.setImageDrawable(CHECK.asDrawable(Ui.ACCENT));
            check.setVisibility(value.equals(current) ? View.VISIBLE : View.INVISIBLE);
            option.addView(check, new LinearLayout.LayoutParams(ui.dp(20), ui.dp(20)));
            option.setOnClickListener(v -> {
                picked.on(value);
                d.dismiss();
            });
            card.addView(option, Ui.matchWidth());
        }
        d.setContentView(card);
        Window w = d.getWindow();
        w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        w.setLayout(context.getResources().getDisplayMetrics().widthPixels - ui.dp(48), ViewGroup.LayoutParams.WRAP_CONTENT);
        d.show();
    }

    /** Searchable checklist of countries and X regions, selected ones first. */
    private final class CountryPicker extends BaseAdapter {
        private final Set<String> selected = new HashSet<>();
        private final List<String> all = new ArrayList<>();
        private List<String> shown = new ArrayList<>();

        CountryPicker() {
            for (String l : Filters.locations()) selected.add(l);
            all.addAll(selected);
            for (String name : Countries.pickerNames()) {
                if (!Filters.isFiltered(name)) all.add(name);
            }
            shown = all;
        }

        void show() {
            Dialog d = fullScreen(context, ui);
            LinearLayout body = new LinearLayout(context);
            body.setOrientation(LinearLayout.VERTICAL);

            EditText search = new EditText(context);
            search.setHint("Search countries and regions");
            search.setHintTextColor(ui.secondary);
            search.setTextColor(ui.text);
            search.setTypeface(ui.regular);
            search.setTextSize(15);
            search.setSingleLine(true);
            search.setPadding(ui.dp(16), ui.dp(10), ui.dp(16), ui.dp(10));
            GradientDrawable pill = new GradientDrawable();
            pill.setColor(ui.divider);
            pill.setCornerRadius(ui.dp(20));
            search.setBackground(pill);
            LinearLayout.LayoutParams searchLp = Ui.matchWidth();
            searchLp.setMargins(ui.dp(16), ui.dp(4), ui.dp(16), ui.dp(8));
            body.addView(search, searchLp);

            ListView listView = new ListView(context);
            listView.setDivider(null);
            listView.setSelector(new ColorDrawable(Color.TRANSPARENT));
            listView.setAdapter(this);
            listView.setOnItemClickListener((parent, view, position, id) -> {
                String name = shown.get(position);
                if (!selected.remove(name)) selected.add(name);
                Filters.save(selected, Settings.highlightMode());
                HeaderBadges.refreshAll();
                notifyDataSetChanged();
            });
            body.addView(listView, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

            search.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    String q = s.toString().trim().toLowerCase(Locale.ROOT);
                    List<String> result = new ArrayList<>();
                    for (String name : all) if (name.toLowerCase(Locale.ROOT).contains(q)) result.add(name);
                    shown = result;
                    notifyDataSetChanged();
                }

                @Override
                public void afterTextChanged(Editable s) {
                }
            });

            d.setContentView(page(context, ui, "Countries and regions", d, body));
            d.setOnDismissListener(x -> build());
            d.show();
        }

        @Override
        public int getCount() {
            return shown.size();
        }

        @Override
        public Object getItem(int position) {
            return shown.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            String name = shown.get(position);
            LinearLayout row = new LinearLayout(context);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(12));
            row.setBackground(ui.rowBackground());
            String flag = Countries.flagFor(name);
            TextView emoji = ui.text(flag != null ? flag : Countries.UNKNOWN_FLAG, 20, false, ui.text);
            row.addView(emoji, new LinearLayout.LayoutParams(ui.dp(36), ViewGroup.LayoutParams.WRAP_CONTENT));
            row.addView(ui.text(name, 15, false, ui.text), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            ImageView check = new ImageView(context);
            check.setImageDrawable(CHECK.asDrawable(Ui.ACCENT));
            check.setVisibility(selected.contains(name) ? View.VISIBLE : View.INVISIBLE);
            row.addView(check, new LinearLayout.LayoutParams(ui.dp(20), ui.dp(20)));
            return row;
        }
    }

    /** A full-screen dialog painted in X's background, with system bars to match. */
    private static Dialog fullScreen(Context context, Ui ui) {
        Dialog d = new Dialog(context, android.R.style.Theme_DeviceDefault_NoActionBar);
        Window w = d.getWindow();
        w.setBackgroundDrawable(new ColorDrawable(ui.background));
        w.setStatusBarColor(ui.background);
        w.setNavigationBarColor(ui.background);
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            w.getDecorView().post(() -> {
                WindowInsetsController c = w.getInsetsController();
                if (c != null) c.setSystemBarsAppearance(ui.dark ? 0 : light, light);
            });
        }
        return d;
    }

    /** X's page chrome: back arrow and a bold title above the content. */
    private static View page(Context context, Ui ui, String title, Dialog dialog, View content) {
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setFitsSystemWindows(true);

        LinearLayout bar = new LinearLayout(context);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(ui.dp(4), 0, ui.dp(16), 0);
        FrameLayout back = new FrameLayout(context);
        back.setBackground(ui.rowBackground());
        back.setOnClickListener(v -> dialog.dismiss());
        ImageView arrow = new ImageView(context);
        arrow.setImageDrawable(BACK.asDrawable(ui.text));
        back.addView(arrow, new FrameLayout.LayoutParams(ui.dp(22), ui.dp(22), Gravity.CENTER));
        bar.addView(back, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        TextView t = ui.text(title, 20, true, ui.text);
        t.setPadding(ui.dp(20), 0, 0, 0);
        bar.addView(t);
        root.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(53)));
        root.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        return root;
    }
}
