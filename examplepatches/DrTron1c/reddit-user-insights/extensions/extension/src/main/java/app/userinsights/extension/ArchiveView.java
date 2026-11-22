package app.userinsights.extension;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * A user's archived posts and comments from Arctic Shift, with subreddit filters.
 * Used full screen by {@link ArchiveActivity}, and inside hidden profiles by {@link OverlayManager}.
 */
final class ArchiveView extends LinearLayout {
    static final int BG = 0xFF0B0B0C;
    static final int SURFACE = 0xFF17181B;
    static final int TEXT = 0xFFEDEEF0;
    static final int TEXT_DIM = 0xFF9A9DA3;
    static final int ACCENT = 0xFFFF4500;

    private final Activity activity;
    final String user;
    private final boolean embedded;
    private String subreddit;
    private boolean showPosts;

    private final List<ArcticShift.Item> items = new ArrayList<>();
    private List<ArcticShift.SubCount> lastSubs;
    private boolean loading;
    private boolean endReached;
    private int requestToken;
    private boolean released;

    private LinearLayout chipRow;
    private TextView commentsTab;
    private TextView postsTab;
    private TextView footer;
    private ItemAdapter adapter;

    /**
     * @param embedded True when shown inside a Reddit profile: a smaller header with a full screen button.
     */
    ArchiveView(Activity activity, String user, String subreddit, boolean embedded) {
        super(activity);
        this.activity = activity;
        this.user = user;
        this.subreddit = subreddit;
        this.embedded = embedded;
        setOrientation(VERTICAL);
        setBackgroundColor(BG);
        build();
        loadTopSubreddits();
        reload();
    }

    /** Stops callbacks from updating this view after it is removed. */
    void release() {
        released = true;
        requestToken++;
    }

    private boolean isDead() {
        return released || activity.isFinishing();
    }

    private void build() {
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);

        if (embedded) {
            header.setPadding(dp(16), dp(10), dp(12), dp(4));
            TextView title = new TextView(activity);
            title.setText("Hidden activity · from Arctic Shift");
            title.setTextColor(TEXT);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            header.addView(title, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            TextView expand = smallButton("Full screen");
            expand.setOnClickListener(v -> UserInsights.openArchive(activity, user, subreddit));
            header.addView(expand);
        } else {
            header.setPadding(dp(4), dp(8), dp(12), dp(8));
            TextView back = new TextView(activity);
            back.setText("←");
            back.setTextColor(TEXT);
            back.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
            back.setPadding(dp(12), dp(4), dp(12), dp(4));
            back.setOnClickListener(v -> activity.finish());
            header.addView(back);

            LinearLayout titles = new LinearLayout(activity);
            titles.setOrientation(VERTICAL);
            TextView title = new TextView(activity);
            title.setText("u/" + user);
            title.setTextColor(TEXT);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
            title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            title.setSingleLine(true);
            title.setEllipsize(TextUtils.TruncateAt.END);
            titles.addView(title);
            TextView subtitle = new TextView(activity);
            subtitle.setText("Archived activity · Arctic Shift · may be incomplete");
            subtitle.setTextColor(TEXT_DIM);
            subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            titles.addView(subtitle);
            header.addView(titles, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView profile = smallButton("Profile");
            profile.setOnClickListener(v ->
                    UserInsights.openInReddit(activity, "https://www.reddit.com/user/" + user));
            header.addView(profile);

            TextView settings = smallButton("⚙");
            settings.setOnClickListener(v -> UserInsights.openSettings(activity));
            LayoutParams settingsParams = new LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            settingsParams.leftMargin = dp(8);
            header.addView(settings, settingsParams);
        }
        addView(header);

        // Subreddit chips.
        HorizontalScrollView chipScroll = new HorizontalScrollView(activity);
        chipScroll.setHorizontalScrollBarEnabled(false);
        chipRow = new LinearLayout(activity);
        chipRow.setOrientation(HORIZONTAL);
        chipRow.setPadding(dp(12), dp(4), dp(12), dp(8));
        chipScroll.addView(chipRow);
        addView(chipScroll);
        renderChips();

        // Tabs.
        LinearLayout tabs = new LinearLayout(activity);
        tabs.setOrientation(HORIZONTAL);
        commentsTab = tab("Comments");
        postsTab = tab("Posts");
        commentsTab.setOnClickListener(v -> selectTab(false));
        postsTab.setOnClickListener(v -> selectTab(true));
        tabs.addView(commentsTab, new LayoutParams(0, dp(44), 1f));
        tabs.addView(postsTab, new LayoutParams(0, dp(44), 1f));
        addView(tabs);
        updateTabs();

        View divider = new View(activity);
        divider.setBackgroundColor(0xFF26282C);
        addView(divider, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1));

        // List.
        ListView list = new ListView(activity);
        list.setDivider(null);
        list.setBackgroundColor(BG);
        list.setCacheColorHint(BG);
        list.setSelector(android.R.color.transparent);
        footer = new TextView(activity);
        footer.setGravity(Gravity.CENTER);
        footer.setTextColor(TEXT_DIM);
        footer.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        footer.setPadding(dp(16), dp(20), dp(16), dp(28));
        footer.setOnClickListener(v -> {
            if (!loading && !endReached) {
                loadMore();
            }
        });
        list.addFooterView(footer, null, true);
        adapter = new ItemAdapter();
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> {
            if (position < items.size()) {
                ArcticShift.Item item = items.get(position);
                if (!item.permalink.isEmpty()) {
                    String link = item.permalink.startsWith("http")
                            ? item.permalink : "https://www.reddit.com" + item.permalink;
                    UserInsights.openInReddit(activity, link);
                }
            }
        });
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            if (position < items.size()) {
                ArcticShift.Item item = items.get(position);
                String text = item.isPost ? item.title + "\n\n" + item.body : item.body;
                ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                clipboard.setPrimaryClip(ClipData.newPlainText("Reddit text", text.trim()));
                Toast.makeText(activity, "Copied", Toast.LENGTH_SHORT).show();
                return true;
            }
            return false;
        });
        list.setOnScrollListener(new AbsListView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(AbsListView view, int scrollState) {
            }

            @Override
            public void onScroll(AbsListView view, int first, int visible, int total) {
                if (total > 1 && first + visible >= total - 3 && !loading && !endReached && !items.isEmpty()) {
                    loadMore();
                }
            }
        });
        addView(list, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
    }

    private TextView smallButton(String text) {
        TextView button = new TextView(activity);
        button.setText(text);
        button.setTextColor(TEXT);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        button.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        button.setPadding(dp(12), dp(6), dp(12), dp(6));
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(dp(50));
        background.setColor(SURFACE);
        button.setBackground(background);
        return button;
    }

    private TextView tab(String text) {
        TextView tab = new TextView(activity);
        tab.setText(text);
        tab.setGravity(Gravity.CENTER);
        tab.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tab.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        return tab;
    }

    private void selectTab(boolean posts) {
        if (showPosts == posts) {
            return;
        }
        showPosts = posts;
        updateTabs();
        reload();
    }

    private void updateTabs() {
        commentsTab.setTextColor(!showPosts ? TEXT : TEXT_DIM);
        commentsTab.setBackground(!showPosts ? underline() : null);
        postsTab.setTextColor(showPosts ? TEXT : TEXT_DIM);
        postsTab.setBackground(showPosts ? underline() : null);
    }

    private Drawable underline() {
        GradientDrawable line = new GradientDrawable();
        line.setColor(ACCENT);
        LayerDrawable layer = new LayerDrawable(new Drawable[]{new InsetDrawable(line, 0)});
        layer.setLayerGravity(0, Gravity.BOTTOM | Gravity.FILL_HORIZONTAL);
        layer.setLayerHeight(0, dp(3));
        layer.setLayerInsetLeft(0, dp(40));
        layer.setLayerInsetRight(0, dp(40));
        return layer;
    }

    private void renderChips() {
        chipRow.removeAllViews();
        addChip("All", null, -1);
        boolean selectedPresent = subreddit == null;
        if (lastSubs != null) {
            for (int i = 0; i < lastSubs.size(); i++) {
                ArcticShift.SubCount sub = lastSubs.get(i);
                if (sub.subreddit.equalsIgnoreCase(subreddit)) {
                    selectedPresent = true;
                }
                addChip("r/" + sub.subreddit + " · " + Ui.formatCount(sub.count), sub.subreddit, i);
            }
        }
        if (!selectedPresent) {
            addChip("r/" + subreddit, subreddit, -1);
        }
    }

    private void addChip(String label, final String chipSubreddit, int rank) {
        boolean selected = chipSubreddit == null ? subreddit == null : chipSubreddit.equalsIgnoreCase(subreddit);
        int color = rank >= 0 && rank < OverlayManager.PILL_COLORS.length ? OverlayManager.PILL_COLORS[rank] : TEXT;

        TextView chip = new TextView(activity);
        chip.setText(label);
        chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        chip.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        chip.setSingleLine(true);
        chip.setPadding(dp(12), dp(6), dp(12), dp(6));
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(dp(50));
        if (selected) {
            background.setColor(color);
            chip.setTextColor(0xFF000000);
        } else {
            background.setColor(SURFACE);
            background.setStroke(dp(1), rank >= 0 ? color : 0xFF3A3D42);
            chip.setTextColor(rank >= 0 ? color : TEXT);
        }
        chip.setBackground(background);
        chip.setOnClickListener(v -> {
            boolean same = chipSubreddit == null ? subreddit == null : chipSubreddit.equalsIgnoreCase(subreddit);
            if (same) {
                return;
            }
            subreddit = chipSubreddit;
            renderChips();
            reload();
        });
        LayoutParams params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.rightMargin = dp(8);
        chipRow.addView(chip, params);
    }

    private void loadTopSubreddits() {
        ArcticShift.topSubs(user, 15, (result, error) -> {
            if (isDead() || result == null) {
                return;
            }
            lastSubs = result;
            renderChips();
        });
    }

    private void reload() {
        items.clear();
        endReached = false;
        loading = false;
        requestToken++;
        adapter.notifyDataSetChanged();
        loadMore();
    }

    private void loadMore() {
        if (loading || endReached || released) {
            return;
        }
        loading = true;
        footer.setText("Loading…");
        final int token = requestToken;
        long before = 0;
        if (!items.isEmpty()) {
            before = items.get(items.size() - 1).createdUtc;
        }
        ArcticShift.search(showPosts, user, subreddit, before, (result, error) -> {
            if (token != requestToken || isDead()) {
                return;
            }
            loading = false;
            if (result == null) {
                footer.setText((error == null ? "Could not load" : error) + "\nTap to retry");
                return;
            }
            int added = 0;
            for (ArcticShift.Item item : result) {
                boolean duplicate = false;
                for (int i = Math.max(0, items.size() - 60); i < items.size(); i++) {
                    if (items.get(i).id.equals(item.id)) {
                        duplicate = true;
                        break;
                    }
                }
                if (!duplicate) {
                    items.add(item);
                    added++;
                }
            }
            if (result.isEmpty() || added == 0) {
                endReached = true;
            }
            adapter.notifyDataSetChanged();
            String where = subreddit != null ? " in r/" + subreddit : "";
            if (items.isEmpty()) {
                footer.setText(showPosts ? "No archived posts found" + where : "No archived comments found" + where);
            } else if (endReached) {
                footer.setText("That's everything in the archive");
            } else {
                footer.setText("Load more");
            }
        });
    }

    private int dp(float value) {
        return Ui.dp(activity, value);
    }

    private final class ItemAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            return items.size();
        }

        @Override
        public Object getItem(int position) {
            return items.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            ViewHolder holder;
            if (convertView == null) {
                LinearLayout card = new LinearLayout(activity);
                card.setOrientation(VERTICAL);
                card.setPadding(dp(16), dp(12), dp(16), dp(12));
                holder = new ViewHolder();
                holder.meta = new TextView(activity);
                holder.meta.setTextColor(TEXT_DIM);
                holder.meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                holder.title = new TextView(activity);
                holder.title.setTextColor(TEXT);
                holder.title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                holder.title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
                holder.title.setPadding(0, dp(4), 0, 0);
                holder.body = new TextView(activity);
                holder.body.setTextColor(0xFFCFD1D4);
                holder.body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                holder.body.setMaxLines(10);
                holder.body.setEllipsize(TextUtils.TruncateAt.END);
                holder.body.setPadding(0, dp(4), 0, 0);
                View divider = new View(activity);
                divider.setBackgroundColor(0xFF1F2124);
                card.addView(holder.meta);
                card.addView(holder.title);
                card.addView(holder.body);
                LinearLayout wrapper = new LinearLayout(activity);
                wrapper.setOrientation(VERTICAL);
                wrapper.addView(card);
                wrapper.addView(divider, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1));
                wrapper.setTag(holder);
                convertView = wrapper;
            } else {
                holder = (ViewHolder) convertView.getTag();
            }

            ArcticShift.Item item = items.get(position);
            StringBuilder meta = new StringBuilder("r/").append(item.subreddit);
            String ago = Ui.timeAgo(item.createdUtc);
            if (!ago.isEmpty()) {
                meta.append(" · ").append(ago);
            }
            meta.append(" · ↑ ").append(Ui.formatCount(Math.max(0, item.score)));
            if (item.isPost) {
                meta.append(" · ").append(Ui.formatCount(item.numComments)).append(" comments");
            }
            holder.meta.setText(meta);

            if (item.isPost) {
                holder.title.setVisibility(VISIBLE);
                holder.title.setText(item.title);
                String body = item.body;
                if (body.isEmpty() && !item.url.isEmpty() && !item.url.contains(item.id)) {
                    body = item.url;
                }
                holder.body.setVisibility(body.isEmpty() ? GONE : VISIBLE);
                holder.body.setText(body);
            } else {
                holder.title.setVisibility(GONE);
                holder.body.setVisibility(VISIBLE);
                holder.body.setText(item.body.isEmpty() ? "[no text]" : item.body);
            }
            return convertView;
        }
    }

    private static final class ViewHolder {
        TextView meta;
        TextView title;
        TextView body;
    }
}
