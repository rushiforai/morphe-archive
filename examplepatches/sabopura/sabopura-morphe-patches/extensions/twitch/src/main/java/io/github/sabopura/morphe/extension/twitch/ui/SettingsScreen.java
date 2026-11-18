package io.github.sabopura.morphe.extension.twitch.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import io.github.sabopura.morphe.extension.twitch.ads.AdBlock;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.DanmakuSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.TwitchDanmaku;
import io.github.sabopura.morphe.extension.twitch.original.Stats;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * One settings screen for every Twitch patch. Wide windows show the sections beside the options; narrow
 * ones show the section list first, and the choice follows the window's real width. Changes are saved
 * immediately.
 */
public final class SettingsScreen extends BackDialog implements Catalog.Env {
    private static final int SEARCH_DEBOUNCE_MS = 120;

    private final Ui ui;
    private List<Catalog.Category> categories;
    private List<Catalog.Section> sections;
    /** The language the catalog was made in. */
    private boolean japanese;
    private final Map<String, Catalog.Item> itemsByKey = new HashMap<>();
    private final List<Runnable> refreshers = new ArrayList<>();
    private final Map<Catalog.Section, TextView> badges = new IdentityHashMap<>();
    private final Map<Catalog.Item, View> rows = new IdentityHashMap<>();

    private boolean twoPane;
    private Catalog.Section current;
    private Catalog.Category tab;
    private String query = "";
    private List<String> tokens = Collections.emptyList();
    private ConfirmPill.Pending pending;
    private DanmakuPreview preview;
    private ChatPreview chatPreview;
    private JellyTabs tabs;
    private Catalog.Section tabsFor;
    private boolean totalsCounted;
    private View scrollEdge;

    private LinearLayout root;
    private ScrollView railScroll;
    private LinearLayout rail;
    private FrameLayout tabsHolder;
    private FrameLayout pinned;
    private ScrollView detailScroll;
    private LinearLayout detail;
    private TextView title;
    private ImageView back;
    private SeekField search;
    private final Runnable applyQuery = this::readQuery;

    public static void show(Context context) {
        show(context, null);
    }

    /** Opens the screen, optionally on one category such as {@link Catalog#DANMAKU}. */
    public static void show(Context context, String categoryId) {
        SettingsScreen screen = new SettingsScreen(context, categoryId);
        Ui.show(screen, context);
    }

    /** Opens the screen with the search field filled in. */
    public static void showSearch(Context context, String text) {
        SettingsScreen screen = new SettingsScreen(context, null);
        Ui.show(screen, context);
        screen.search.openNow(false);
        screen.search.setText(text);
        screen.readQuery();
    }

    private SettingsScreen(Context context, String categoryId) {
        super(context, Ui.of(context).dark ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar);
        ui = Ui.of(context);
        twoPane = Layouts.twoPane(context.getResources().getConfiguration().screenWidthDp);
        loadCatalog(categoryId);
        build();
    }

    /** Makes the catalog in the language chosen now and opens the page of {@code categoryId}, if it names one. */
    private void loadCatalog(String categoryId) {
        Text.use(getContext());
        japanese = Text.japanese();
        categories = Catalog.build();
        sections = Catalog.sections(categories);
        itemsByKey.clear();
        for (Catalog.Category category : categories)
            for (Catalog.Group group : category.groups)
                for (Catalog.Item item : group.items)
                    if (item.key != null) itemsByKey.put(item.id(), item);
        current = null;
        tab = null;
        if (categoryId != null) {
            for (Catalog.Section section : sections) {
                for (Catalog.Category category : section.tabs) {
                    if (category.id.equals(categoryId)) {
                        current = section;
                        tab = category;
                    }
                }
            }
        }
        if (current == null && twoPane) open(sections.get(0), null);
    }

    /**
     * The language setting changed what the labels say, so every one is made again on the page that
     * is open. From search results the setting's own page opens: the words typed stopped matching.
     */
    private void translateIfChosen() {
        Text.use(getContext());
        if (japanese == Text.japanese()) return;
        String open = searching() ? Catalog.ABOUT : current == null ? null : tab.id;
        if (searching()) search.close();
        loadCatalog(open);
        search.relabel();
        render();
    }

    private void open(Catalog.Section section, Catalog.Category category) {
        current = section;
        tab = category != null ? category : section.tabs.get(0);
    }

    // ---- Env ----

    @Override
    public Context context() {
        return getContext();
    }

    @Override
    public Ui ui() {
        return ui;
    }

    @Override
    public SharedPreferences prefs(Catalog.Store store) {
        if (store == Catalog.Store.ADS) return AdBlock.preferences(getContext());
        return store == Catalog.Store.DANMAKU
                ? DanmakuSettings.preferences(getContext())
                : ChatSettings.preferences(getContext());
    }

    @Override
    public void changed(Catalog.Store store) {
        if (store == Catalog.Store.DANMAKU) {
            DanmakuSettings.reload(getContext());
            TwitchDanmaku.settingsChanged();
            if (preview != null) preview.reload();
        } else if (store == Catalog.Store.CHAT) {
            ChatSettings.reload(getContext());
            if (chatPreview != null) chatPreview.reload();
        }
        translateIfChosen();
        for (Runnable refresher : new ArrayList<>(refreshers)) refresher.run();
        updateBadges();
    }

    @Override
    public void onRefresh(Runnable refresher) {
        refreshers.add(refresher);
    }

    @Override
    public void rebuild() {
        int scroll = detailScroll.getScrollY();
        render();
        detailScroll.post(() -> detailScroll.scrollTo(0, scroll));
    }

    @Override
    public void preview(Catalog.Store store, String key, int value) {
        if (store == Catalog.Store.DANMAKU && preview != null) preview.preview(key, value);
        if (store == Catalog.Store.CHAT && chatPreview != null) chatPreview.preview(key, value);
    }

    @Override
    public ConfirmPill.Pending beginUndo(String key, Runnable undo) {
        pending = new ConfirmPill.Pending(key, undo);
        return pending;
    }

    @Override
    public ConfirmPill.Pending pending(String key) {
        return pending != null && pending.key.equals(key) && pending.live() ? pending : null;
    }

    @Override
    public void clearPending() {
        pending = null;
    }

    // ---- layout ----

    private void build() {
        Context context = getContext();
        requestWindowFeature(Window.FEATURE_NO_TITLE);

        root = new LinearLayout(context) {
            @Override
            protected void onSizeChanged(int w, int h, int oldw, int oldh) {
                super.onSizeChanged(w, h, oldw, oldh);
                post(() -> widthChanged(w - getPaddingLeft() - getPaddingRight()));
            }
        };
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background);
        Ui.padForInsets(root);

        root.addView(topBar(context), Ui.matchWidth());

        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.HORIZONTAL);
        root.addView(body, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

        railScroll = new ScrollView(context);
        rail = new LinearLayout(context);
        rail.setOrientation(LinearLayout.VERTICAL);
        rail.setPadding(Ui.dp(context, 12), Ui.dp(context, 8), Ui.dp(context, 8), Ui.dp(context, 24));
        railScroll.addView(rail);
        body.addView(railScroll, new LinearLayout.LayoutParams(Ui.dp(context, 300),
                ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        body.addView(column, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        tabsHolder = new FrameLayout(context);
        column.addView(tabsHolder, Ui.matchWidth());
        pinned = new FrameLayout(context);
        column.addView(pinned, Ui.matchWidth());
        scrollEdge = new View(context);
        scrollEdge.setBackgroundColor(ui.line);
        scrollEdge.setAlpha(0);
        column.addView(scrollEdge, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.max(1, Ui.dp(context, 0.7f))));
        detailScroll = new ScrollView(context);
        detailScroll.setClipToPadding(false);
        // Rows slide under the bar; the hairline says so only while they do.
        detailScroll.setOnScrollChangeListener((v, x, y, oldX, oldY) -> scrollEdge.setAlpha(y > 0 ? 1 : 0));
        FrameLayout centre = new FrameLayout(context);
        detail = new LinearLayout(context);
        detail.setOrientation(LinearLayout.VERTICAL);
        centre.addView(detail, Ui.frame(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER_HORIZONTAL));
        detailScroll.addView(centre);
        column.addView(detailScroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        detail.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> limitWidth());
        applyPaneChrome();

        setContentView(root);
        Notice.prefer(root);
        Window window = getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(ui.background));
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                    | WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
            if (android.os.Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
            window.setStatusBarColor(ui.background);
            window.setNavigationBarColor(ui.background);
            Ui.systemBarIcons(window, ui.dark);
        }
        render();
    }

    /** Rotation and folding arrive here as a new width; the screen adjusts itself in place. */
    private void widthChanged(int width) {
        if (Ui.closeIfGone(this, getContext())) return;
        DisplayMetrics metrics = getContext().getResources().getDisplayMetrics();
        int widthDp = Math.round(width / metrics.density);
        boolean wanted = Layouts.twoPane(widthDp);
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) railScroll.getLayoutParams();
        lp.width = Ui.dp(getContext(), Layouts.railWidth(widthDp));
        railScroll.setLayoutParams(lp);
        search.setSpan(widthDp - 48 - 16);
        if (wanted == twoPane) return;
        twoPane = wanted;
        if (twoPane && current == null) open(sections.get(0), null);
        applyPaneChrome();
        render();
    }

    private void applyPaneChrome() {
        railScroll.setVisibility(twoPane ? View.VISIBLE : View.GONE);
        int side = Ui.dp(getContext(), twoPane ? 24 : 16);
        detail.setPadding(side, Ui.dp(getContext(), 4), side, Ui.dp(getContext(), 32));
        pinned.setPadding(side, 0, side, 0);
    }

    /** Keeps option rows readable on very wide tablets. */
    private void limitWidth() {
        int max = Ui.dp(getContext(), 760);
        ViewGroup.LayoutParams lp = detail.getLayoutParams();
        int available = ((View) detail.getParent()).getWidth();
        int wanted = available > max ? max : ViewGroup.LayoutParams.MATCH_PARENT;
        if (lp.width != wanted) {
            lp.width = wanted;
            detail.post(() -> detail.setLayoutParams(lp));
        }
        if (pinned.getChildCount() == 0) return;
        View sample = pinned.getChildAt(0);
        ViewGroup.LayoutParams sampleLp = sample.getLayoutParams();
        if (sampleLp.width != wanted) {
            sampleLp.width = wanted;
            sample.post(() -> sample.setLayoutParams(sampleLp));
        }
    }

    private View topBar(Context context) {
        LinearLayout bar = new LinearLayout(context);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setMinimumHeight(Ui.dp(context, 56));
        bar.setPadding(Ui.dp(context, 4), 0, Ui.dp(context, 8), 0);

        back = ui.iconView(context, Icons.Kind.CLOSE, ui.text, 24);
        back.setBackground(ui.pressable(context, 0, 24));
        back.setOnClickListener(v -> goBack());
        bar.addView(back, new LinearLayout.LayoutParams(Ui.dp(context, 48), Ui.dp(context, 48)));

        title = ui.text(context, "", 20, ui.text, true);
        title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setPadding(Ui.dp(context, 8), 0, Ui.dp(context, 8), 0);
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        search = new SeekField(context, ui, this::onSearchOpened, this::onSearchClosed, this::onSearchText,
                this::openFirstResult);
        search.setTitle(title);
        bar.addView(search, new LinearLayout.LayoutParams(Ui.dp(context, 48), Ui.dp(context, 48)));
        return bar;
    }

    private boolean searching() {
        return search.isOpen();
    }

    private boolean showingResults() {
        return searching() && !tokens.isEmpty();
    }

    private void onSearchOpened() {
        updateBackIcon();
    }

    private void onSearchClosed() {
        tokens = Collections.emptyList();
        query = "";
        render();
    }

    private void onSearchText(String text) {
        detail.removeCallbacks(applyQuery);
        detail.postDelayed(applyQuery, SEARCH_DEBOUNCE_MS);
    }

    private void readQuery() {
        String text = search.text();
        if (text.equals(query)) return;
        query = text;
        tokens = SearchText.tokens(text);
        render();
    }

    @Override
    void goBack() {
        if (searching()) {
            search.close();
        } else if (!twoPane && current != null) {
            current = null;
            tab = null;
            render();
            detailScroll.scrollTo(0, 0);
        } else {
            dismiss();
        }
    }

    private void updateBackIcon() {
        boolean canGoBack = searching() || (!twoPane && current != null);
        back.setImageDrawable(Icons.drawable(getContext(), canGoBack ? Icons.Kind.BACK : Icons.Kind.CLOSE, ui.text, 24));
        back.setContentDescription(canGoBack ? label("戻る", "Back") : label("閉じる", "Close"));
    }

    // ---- rendering ----

    private void render() {
        refreshers.clear();
        rows.clear();
        preview = null;
        chatPreview = null;
        pinned.removeAllViews();
        detail.removeAllViews();
        renderRail();
        renderTabs();
        if (showingResults()) {
            title.setText(label("検索", "Search"));
            renderSearch();
        } else if (current == null) {
            title.setText(label("パッチの設定", "Patch settings"));
            renderSectionList();
        } else {
            title.setText(current.title);
            renderCategory(tab);
        }
        updateBackIcon();
    }

    private void slideIn() {
        if (!Motion.enabled() || showingResults()) return;
        detail.setAlpha(0);
        detail.setTranslationX(Ui.dp(getContext(), 12));
        detail.animate().alpha(1).translationX(0).setDuration(180).start();
    }

    private void renderRail() {
        rail.removeAllViews();
        badges.clear();
        Context context = getContext();
        for (Catalog.Section section : sections) {
            boolean selected = section == current && !showingResults();
            LinearLayout item = new LinearLayout(context);
            item.setGravity(Gravity.CENTER_VERTICAL);
            item.setPadding(Ui.dp(context, 12), Ui.dp(context, 10), Ui.dp(context, 12), Ui.dp(context, 10));
            item.setBackground(ui.pressable(context, selected ? ui.accentSoft : 0, 14));
            LinearLayout.LayoutParams tileLp = new LinearLayout.LayoutParams(Ui.dp(context, 32), Ui.dp(context, 32));
            tileLp.rightMargin = Ui.dp(context, 12);
            item.addView(ui.iconTile(context, section.icon, section.tint, 32), tileLp);
            LinearLayout texts = new LinearLayout(context);
            texts.setOrientation(LinearLayout.VERTICAL);
            texts.addView(ui.text(context, section.title, 15, selected ? ui.accent : ui.text, true));
            TextView summary = ui.text(context, section.summary(), 12, ui.secondary, false);
            summary.setSingleLine(true);
            summary.setEllipsize(android.text.TextUtils.TruncateAt.END);
            texts.addView(summary);
            TextView badge = ui.text(context, "", 12, ui.accent, false);
            texts.addView(badge);
            item.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            badges.put(section, badge);
            item.setOnClickListener(v -> openSection(section));
            LinearLayout.LayoutParams lp = Ui.matchWidth();
            lp.bottomMargin = Ui.dp(context, 2);
            rail.addView(item, lp);
        }
        updateBadges();
    }

    private void openSection(Catalog.Section section) {
        open(section, null);
        if (searching()) search.close();
        else render();
        slideIn();
        detailScroll.scrollTo(0, 0);
    }

    private void updateBadges() {
        for (Map.Entry<Catalog.Section, TextView> entry : badges.entrySet()) {
            String status = status(entry.getKey());
            entry.getValue().setText(status == null ? "" : status);
            entry.getValue().setTextColor(isOff(entry.getKey()) ? ui.secondary : ui.accent);
            entry.getValue().setVisibility(status == null ? View.GONE : View.VISIBLE);
        }
    }

    /** On or off for a section with its own switch; otherwise how many of its settings were changed. */
    private String status(Catalog.Section section) {
        if (section.master != null) return isOff(section) ? label("オフ", "Off") : label("オン", "On");
        int count = changedCount(section);
        return count == 0 ? null : changedLabel(count);
    }

    private boolean isOff(Catalog.Section section) {
        Catalog.SwitchItem master = section.master;
        return master != null && !prefs(master.store).getBoolean(master.key, master.fallback);
    }

    private int changedCount(Catalog.Section section) {
        int count = 0;
        for (Catalog.Category category : section.tabs) count += Catalog.changedCount(this, category);
        return count;
    }

    private static String changedLabel(int count) {
        return label(count + " 項目変更", count + " changed");
    }

    private void renderSectionList() {
        Context context = getContext();
        if (Features.has(Feature.PATCH_STATS)) {
            LinearLayout.LayoutParams totalsLp = Ui.matchWidth();
            totalsLp.topMargin = Ui.dp(context, 8);
            totalsLp.bottomMargin = Ui.dp(context, 4);
            detail.addView(totals(context), totalsLp);
        }
        LinearLayout card = ui.card(context, 70);
        for (Catalog.Section section : sections) {
            card.addView(ui.sectionRow(context, section.icon, section.tint, section.title, section.summary(),
                    status(section), section.master != null && !isOff(section), () -> openFromList(section)), Ui.matchWidth());
        }
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.topMargin = Ui.dp(context, 8);
        detail.addView(card, lp);
        if (Features.danmaku()) {
            TextView hint = ui.text(context, label("プレイヤーのボタンをタップするとメニュー、長押しで弾幕のオン/オフです。",
                    "Tap the player button for the menu; long-press it to turn danmaku on or off."), 13,
                    ui.secondary, false);
            hint.setPadding(Ui.dp(context, 4), Ui.dp(context, 14), Ui.dp(context, 4), 0);
            detail.addView(hint);
        }
    }

    private void openFromList(Catalog.Section section) {
        open(section, null);
        render();
        slideIn();
        detailScroll.scrollTo(0, 0);
    }

    /** What the patches have done so far, counted up once when the screen opens. Opens the About page. */
    private View totals(Context context) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable fill = new GradientDrawable(GradientDrawable.Orientation.TL_BR,
                new int[]{0xFF8A4DFF, 0xFF5C33D6, 0xFF3A2399});
        fill.setCornerRadius(Ui.dp(context, 20));
        card.setBackground(new android.graphics.drawable.RippleDrawable(
                android.content.res.ColorStateList.valueOf(0x33FFFFFF), fill, Ui.rounded(context, 0xFFFFFFFF, 20)));
        card.setPadding(Ui.dp(context, 20), Ui.dp(context, 16), Ui.dp(context, 12), Ui.dp(context, 18));
        LinearLayout head = new LinearLayout(context);
        head.setGravity(Gravity.CENTER_VERTICAL);
        head.addView(ui.text(context, label("これまでの記録", "So far"), 13, 0xD9FFFFFF, true),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        head.addView(ui.iconView(context, Icons.Kind.CHEVRON, 0xB3FFFFFF, 18));
        card.addView(head);
        LinearLayout cells = new LinearLayout(context);
        cells.setPadding(0, Ui.dp(context, 10), Ui.dp(context, 8), 0);
        boolean animate = !totalsCounted && Motion.enabled();
        totalsCounted = true;
        if (Features.ads())
            addTotal(cells, Stats.value(Stats.STOPPED) + Stats.value(Stats.REPLACED) + Stats.value(Stats.COVERED),
                    null, "", label("止めた広告", "Ads stopped"), animate);
        if (Features.has(Feature.AUTO_POINTS))
            addTotal(cells, Stats.value(Stats.POINTS), null, "", label("ポイントボーナス", "Point bonuses"), animate);
        long watched = Stats.value(Stats.WATCHED_MS);
        addTotal(cells, 0, Stats.watchedNumber(watched), Stats.watchedInHours(watched) ? label("時間", "h") : label("分", "min"),
                label("見た時間", "Time watched"), false);
        card.addView(cells, Ui.matchWidth());
        card.setOnClickListener(v -> {
            for (Catalog.Section section : sections) if (section.id.equals(Catalog.ABOUT)) openFromList(section);
        });
        return card;
    }

    /** One total: the number large, its unit small after it, and what it counts underneath. */
    private void addTotal(LinearLayout cells, long value, String fixed, String unit, String caption, boolean animate) {
        Context context = getContext();
        LinearLayout cell = new LinearLayout(context);
        cell.setOrientation(LinearLayout.VERTICAL);
        cell.setPadding(0, 0, Ui.dp(context, 8), 0);
        TextView number = ui.text(context, withUnit(fixed != null ? fixed : grouped(value), unit), 24, 0xFFFFFFFF, true);
        number.setSingleLine(true);
        cell.addView(number);
        TextView name = ui.text(context, caption, 12, 0xCCFFFFFF, false);
        name.setPadding(0, Ui.dp(context, 2), 0, 0);
        cell.addView(name);
        cell.setContentDescription(caption + " " + number.getText());
        cells.addView(cell, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (fixed != null || !animate || value <= 0) return;
        ValueAnimator count = ValueAnimator.ofFloat(0, 1);
        count.setDuration(900);
        count.setInterpolator(new android.view.animation.DecelerateInterpolator(1.8f));
        count.addUpdateListener(a -> number.setText(
                withUnit(grouped(Math.round(value * (double) (float) a.getAnimatedValue())), unit)));
        count.start();
    }

    private static CharSequence withUnit(String number, String unit) {
        if (unit.isEmpty()) return number;
        SpannableString text = new SpannableString(number + " " + unit);
        text.setSpan(new android.text.style.RelativeSizeSpan(.58f), number.length(), text.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return text;
    }

    private static String grouped(long value) {
        return String.format(java.util.Locale.ROOT, "%,d", value);
    }

    /** The tab strip stays in place across pages, so the selection can spring instead of being rebuilt. */
    private void renderTabs() {
        Context context = getContext();
        boolean show = !showingResults() && current != null && current.tabs.size() > 1;
        tabsHolder.setVisibility(show ? View.VISIBLE : View.GONE);
        if (!show) return;
        int index = current.tabs.indexOf(tab);
        if (tabsFor == current && tabs != null) {
            tabs.select(index, false);
            return;
        }
        tabsFor = current;
        String[] labels = new String[current.tabs.size()];
        for (int i = 0; i < labels.length; i++) labels[i] = current.tabs.get(i).title;
        tabs = new JellyTabs(context, ui, labels, index, picked -> {
            tab = current.tabs.get(picked);
            render();
            slideIn();
            detailScroll.scrollTo(0, 0);
        });
        HorizontalScrollView strip = new HorizontalScrollView(context);
        strip.setHorizontalScrollBarEnabled(false);
        strip.setFillViewport(false);
        // A tab cut off by the edge fades out, which says there is more to scroll to.
        strip.setHorizontalFadingEdgeEnabled(true);
        strip.setFadingEdgeLength(Ui.dp(context, 28));
        strip.addView(tabs);
        tabsHolder.removeAllViews();
        tabsHolder.addView(strip, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void renderCategory(Catalog.Category category) {
        if (category.id.equals(Catalog.DANMAKU) && Features.danmaku()) {
            preview = new DanmakuPreview(getContext());
            addSample(preview);
        } else if (category.id.equals(Catalog.CHAT) && Features.any(Feature.CHAT_APPEARANCE, Feature.COMPACT_CHAT,
                Feature.FIRST_TIME_CHATTERS)) {
            chatPreview = new ChatPreview(getContext(), ui);
            addSample(chatPreview);
        }
        for (Catalog.Group group : category.groups) renderGroup(group, group.title, null);
        // The page about the patch has "reset everything" instead.
        if (!category.id.equals(Catalog.ABOUT)) renderCategoryReset(category);
    }

    /**
     * A live sample stays above the list while the options under it scroll, when the window is tall
     * enough to spare the room; in a short window it scrolls with them.
     */
    private void addSample(View sample) {
        Context context = getContext();
        if (Layouts.pinSample(context.getResources().getConfiguration().screenHeightDp)) {
            FrameLayout.LayoutParams lp = Ui.frame(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER_HORIZONTAL);
            lp.topMargin = Ui.dp(context, 4);
            lp.bottomMargin = Ui.dp(context, 8);
            pinned.addView(sample, lp);
            return;
        }
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.topMargin = Ui.dp(context, 12);
        detail.addView(sample, lp);
    }

    /**
     * The category's way back to its defaults, under its settings. It follows them: it comes with the
     * first change and its count stays right. Once shown it stays until the page is drawn again, as
     * taking it away would move the list under the finger.
     */
    private void renderCategoryReset(Catalog.Category category) {
        Context context = getContext();
        String key = "reset:" + category.id;
        LinearLayout section = new LinearLayout(context);
        section.setOrientation(LinearLayout.VERTICAL);
        detail.addView(section, Ui.matchWidth());
        LinearLayout card = ui.card(context);
        int[] shown = {-1};
        Runnable follow = () -> {
            int changed = Catalog.changedCount(this, category);
            boolean empty = section.getChildCount() == 0;
            // A change made after a reset ends the offer to undo it, which would take that change away too.
            if (shown[0] >= 0 && changed > shown[0] && pending(key) != null) clearPending();
            if (changed == shown[0] || empty && changed == 0 && pending(key) == null) return;
            shown[0] = changed;
            if (empty) {
                section.addView(ui.sectionLabel(context, label("初期値に戻す", "Reset")));
                section.addView(card, Ui.matchWidth());
            }
            card.removeAllViews();
            card.addView(new Catalog.ResetItem(key, label("このカテゴリを初期値に戻す", "Reset this category"),
                    Collections.singletonList(category)).summary(changedSummary(changed)).build(this), Ui.matchWidth());
        };
        follow.run();
        onRefresh(follow);
    }

    /** How many of the category's items differ from their defaults; nothing right after a reset, while it can be undone. */
    static String changedSummary(int changed) {
        if (changed == 0) return null;
        return label("初期値と違う項目が " + changed + " 件あります",
                changed == 1 ? "1 setting differs from its default" : changed + " settings differ from their defaults");
    }

    private void renderSearch() {
        int found = 0;
        for (Catalog.Category category : categories) {
            for (Catalog.Group group : category.groups) {
                Catalog.Group matches = new Catalog.Group(category, group.title);
                for (Catalog.Item item : group.items) if (item.matches(tokens)) matches.items.add(item);
                if (matches.items.isEmpty()) continue;
                found += matches.items.size();
                renderGroup(matches, category.path() + " › " + group.title, matches);
            }
        }
        if (found == 0) {
            TextView none = ui.text(getContext(), label("一致する設定はありません", "No matching settings"),
                    15, ui.secondary, false);
            none.setGravity(Gravity.CENTER);
            none.setPadding(0, Ui.dp(getContext(), 48), 0, 0);
            detail.addView(none, Ui.matchWidth());
        }
    }

    private void openFirstResult() {
        if (!showingResults()) return;
        for (Catalog.Category category : categories) {
            for (Catalog.Group group : category.groups) {
                for (Catalog.Item item : group.items) {
                    if (item.matches(tokens)) {
                        openResult(category, item);
                        return;
                    }
                }
            }
        }
    }

    private void openResult(Catalog.Category category, Catalog.Item item) {
        for (Catalog.Section section : sections) if (section.tabs.contains(category)) open(section, category);
        search.close();
        detailScroll.post(() -> flash(item));
    }

    private void flash(Catalog.Item item) {
        View row = rows.get(item);
        if (row == null) return;
        int top = 0;
        for (View at = row; at != detail && at != null; at = (View) at.getParent()) top += at.getTop();
        detailScroll.scrollTo(0, Math.max(0, top - Ui.dp(getContext(), 24)));
        GradientDrawable glow = new GradientDrawable();
        glow.setColor(ui.accent);
        glow.setAlpha(0);
        row.setForeground(glow);
        ValueAnimator animator = ValueAnimator.ofFloat(0, 1);
        animator.setDuration(600);
        animator.addUpdateListener(a -> {
            float t = (float) a.getAnimatedValue();
            glow.setAlpha(Math.round(90 * (1 - Math.abs(2 * t - 1))));
        });
        animator.addListener(new android.animation.AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(android.animation.Animator a) {
                row.setForeground(null);
            }
        });
        animator.start();
    }

    private void renderGroup(Catalog.Group group, String heading, Catalog.Group results) {
        Context context = getContext();
        TextView head = ui.sectionLabel(context, heading);
        if (results != null) {
            head.setOnClickListener(v -> openResult(group.category, group.items.get(0)));
            head.setCompoundDrawablesRelativeWithIntrinsicBounds(null, null,
                    Icons.drawable(context, Icons.Kind.CHEVRON, ui.accent, 16), null);
            head.setBackground(ui.pressable(context, 0, 8));
        }
        detail.addView(head);
        LinearLayout card = ui.card(context);
        for (Catalog.Item item : group.items) {
            View view = item.build(this);
            rows.put(item, view);
            card.addView(view, Ui.matchWidth());
            addPendingPill(card, item);
            if (results != null) highlight(view);
            if (item.dependsOn != null) {
                Runnable refresh = () -> setEnabled(view, parentsOn(item));
                refresh.run();
                onRefresh(refresh);
            }
        }
        detail.addView(card, Ui.matchWidth());
        if (group.note != null && results == null) {
            TextView note = ui.text(context, group.note, 12, ui.secondary, false);
            note.setLineSpacing(0, 1.15f);
            note.setPadding(Ui.dp(context, 4), Ui.dp(context, 8), Ui.dp(context, 4), 0);
            detail.addView(note);
        }
    }

    private void addPendingPill(LinearLayout card, Catalog.Item item) {
        if (!(item instanceof Catalog.ChoiceItem) || pending(item.key) == null) return;
        ConfirmPill.Pending active = pending(item.key);
        View[] holder = new View[1];
        ConfirmPill pill = new ConfirmPill(getContext(), ui, null, ((Catalog.ChoiceItem) item).undoLabel(), active, () -> {
        }, () -> {
            clearPending();
            active.undo.run();
        }, () -> {
            clearPending();
            holder[0].setVisibility(View.GONE);
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        // The pill's touch target reaches past its face; the margins line the face up as before.
        int reach = pill.targetMargin();
        lp.setMargins(Ui.dp(getContext(), 16), -reach, Ui.dp(getContext(), 16), Ui.dp(getContext(), 10) - reach);
        holder[0] = pill;
        card.addView(pill, lp);
    }

    /** True only when every switch up the {@code dependsOn} chain is on. */
    private boolean parentsOn(Catalog.Item item) {
        Catalog.Item at = item;
        for (int depth = 0; at != null && at.dependsOn != null && depth < 16; depth++) {
            Catalog.Item parent = itemsByKey.get(at.parentId());
            Boolean on = parent == null ? null : parent.on(prefs(parent.store));
            if (on == null) return true;
            if (!on) return false;
            at = parent;
        }
        return true;
    }

    private void highlight(View view) {
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            CharSequence value = text.getText();
            if (value.length() == 0) return;
            String plain = value.toString();
            List<int[]> ranges = SearchText.ranges(plain, tokens);
            if (ranges.isEmpty()) return;
            SpannableString marked = new SpannableString(plain);
            for (int[] range : ranges) {
                marked.setSpan(new BackgroundColorSpan(ui.accentSoft), range[0], range[1], Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                marked.setSpan(new ForegroundColorSpan(ui.accent), range[0], range[1], Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            text.setText(marked);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) highlight(group.getChildAt(i));
        }
    }

    private static void setEnabled(View view, boolean enabled) {
        view.setAlpha(enabled ? 1f : 0.38f);
        setEnabledChild(view, enabled);
    }

    private static void setEnabledChild(View view, boolean enabled) {
        view.setEnabled(enabled);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) setEnabledChild(group.getChildAt(i), enabled);
        }
    }
}
