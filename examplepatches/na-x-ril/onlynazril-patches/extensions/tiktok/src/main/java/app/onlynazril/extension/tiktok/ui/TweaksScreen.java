package app.onlynazril.extension.tiktok.ui;

import android.animation.TimeInterpolator;
import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.onlynazril.extension.tiktok.AppLocale;
import app.onlynazril.extension.tiktok.CountryName;
import app.onlynazril.extension.tiktok.CustomFontBridge;
import app.onlynazril.extension.tiktok.KeepScreenBridge;
import app.onlynazril.extension.tiktok.Surfaces;
import app.onlynazril.extension.tiktok.feedfilter.FeedFilterStats;
import app.onlynazril.extension.tiktok.internal.Activities;
import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.RestartPrompt;
import app.onlynazril.extension.tiktok.playback.ResumePlayback;
import app.onlynazril.extension.tiktok.refreshrate.RefreshRate;
import app.onlynazril.extension.tiktok.settings.CaptchaSettings;
import app.onlynazril.extension.tiktok.settings.CommentCopySettings;
import app.onlynazril.extension.tiktok.settings.CustomFontSettings;
import app.onlynazril.extension.tiktok.settings.DownloadSettings;
import app.onlynazril.extension.tiktok.settings.FeedFilterSettings;
import app.onlynazril.extension.tiktok.settings.HandleSettings;
import app.onlynazril.extension.tiktok.settings.KeepScreenSettings;
import app.onlynazril.extension.tiktok.settings.PostDateFormat;
import app.onlynazril.extension.tiktok.settings.PauseImageSearchSettings;
import app.onlynazril.extension.tiktok.settings.ProfileBgSettings;
import app.onlynazril.extension.tiktok.settings.RefreshRateSettings;
import app.onlynazril.extension.tiktok.settings.ResumePlaybackSettings;
import app.onlynazril.extension.tiktok.settings.SettingsBackup;
import app.onlynazril.extension.tiktok.settings.SettingsReset;

/**
 * Tweaks screen: a root category list and one full page per category.
 * <p>
 * Each page is one unit: its top bar, arrow and content slide together, while only the rows
 * scroll. {@link #goBack()} returns to the root before the activity handles back.
 */
public final class TweaksScreen extends FrameLayout {
    /** {surface id, title, summary} for the surface rows. */
    private static final String[][] SURFACE_ROWS = {
        {Surfaces.FEED, "Feed videos", "The author line, the region and the post time in the feed."},
        {Surfaces.COMMENTS, "Comments", "Comment authors and their region."},
    };

    private static final String[] RATE_LABELS = {"Default", "60 fps", "90 fps", "120 fps"};

    private static final String[] REGION_MODES = {"Off", "Code", "Name"};

    /** A search never needs more rows than the screen holds; the cap keeps a bad query cheap. */
    private static final int MAX_SEARCH_ROWS = 80;

    /** One render per pause in typing, not one per keystroke. */
    private static final long SEARCH_DEBOUNCE_MS = 200L;

    /** How far the outgoing page trails the incoming one. */
    private static final float PARALLAX_FACTOR = 0.25f;

    /** Page easing: easeOutQuint with a stronger settle at the end. */
    private static final TimeInterpolator PAGE_EASE =
            t -> (t >= 1f) ? 1f : (float) ((1 - Math.pow(2, -7 * t)) / (1 - Math.pow(2, -7)));

    private final int PAGE_ANIMATION_MS = getResources().getInteger(android.R.integer.config_shortAnimTime) + 40;

    private enum Category {
        FEED("Feed", "Handle, region, post time, feed filters and pause search."),
        CONTENT("Content & appearance", "Comment copy, custom font and profile background."),
        PRIVACY("Privacy", "The risk-control CAPTCHA puzzle."),
        DOWNLOAD("Download", "Watermark, share sheets and quality."),
        MISC("Misc", "Display refresh rate and room for future options."),
        ABOUT("About", "Build, diagnostics and restart.");

        final String title;
        final String summary;

        Category(String title, String summary) {
            this.title = title;
            this.summary = summary;
        }
    }

    private final Context context;
    private final FrameLayout host;
    private final Handler searchHandler = new Handler(Looper.getMainLooper());
    private Category current;
    private View currentView;
    private boolean transitioning;
    private boolean searching;
    private Runnable pendingSearch;

    public TweaksScreen(Context context) {
        super(context);
        this.context = context;
        setBackgroundColor(Tokens.BACKGROUND);

        host = new FrameLayout(context);
        host.setBackgroundColor(Tokens.BACKGROUND);
        addView(host, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT));

        showRoot(false);
    }

    @Override
    protected void onDetachedFromWindow() {
        cancelPendingSearch();
        super.onDetachedFromWindow();
    }

    /** Returns to the category list; false when the list is already showing. */
    public boolean goBack() {
        if (current == null && !searching) return false;
        showRoot(true);
        return true;
    }

    private void showRoot(boolean animateBack) {
        current = null;
        searching = false;
        cancelPendingSearch();
        Page page = page(topBar("Tweaks", true, true));
        page.content.addView(pageIntro("Choose a group. Every change is saved as you make it."));

        View first = categoryRow(Category.FEED, feedSummary());
        LinearLayout.LayoutParams firstParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        firstParams.topMargin = Tokens.dp(context, Tokens.SPACE_3);
        page.content.addView(first, firstParams);
        page.content.addView(divider(context));
        page.content.addView(categoryRow(Category.CONTENT, Category.CONTENT.summary));
        page.content.addView(divider(context));
        page.content.addView(categoryRow(Category.PRIVACY, privacySummary()));
        page.content.addView(divider(context));
        page.content.addView(categoryRow(Category.DOWNLOAD, downloadSummary()));
        page.content.addView(divider(context));
        page.content.addView(categoryRow(Category.MISC, miscSummary()));
        page.content.addView(divider(context));
        page.content.addView(categoryRow(Category.ABOUT, Category.ABOUT.summary));
        show(page.root, !animateBack);
    }

    private void showCategory(Category category) {
        showCategory(category, null);
    }

    private void showCategory(Category category, String highlight) {
        current = category;
        searching = false;
        cancelPendingSearch();
        Page page = page(topBar(category.title, false, false));
        page.content.addView(pageIntro(category.summary));
        addCategoryContent(page.content, category);
        show(page.root, true);
        if (highlight != null) page.root.post(() -> reveal(page, highlight));
    }

    /** Scrolls the named row into view and runs one shimmer across it. */
    private void reveal(Page page, String title) {
        try {
            RowView row = findRow(page.content, title);
            if (row == null) return;
            int top = 0;
            View walk = row;
            while (walk != null && walk != page.content) {
                top += walk.getTop();
                walk = walk.getParent() instanceof View ? (View) walk.getParent() : null;
            }
            page.scroll.smoothScrollTo(0, Math.max(0, top - Tokens.dp(context, Tokens.SPACE_12)));
            Shimmer.play(row);
        } catch (Throwable t) {
            Debug.print("search: could not reveal '" + title + "': " + t);
        }
    }

    private static RowView findRow(ViewGroup group, String title) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof RowView && title.equals(((RowView) child).title())) {
                return (RowView) child;
            }
            if (child instanceof ViewGroup) {
                RowView found = findRow((ViewGroup) child, title);
                if (found != null) return found;
            }
        }
        return null;
    }

    private void addCategoryContent(LinearLayout content, Category category) {
        switch (category) {
            case FEED:
                addFeed(content);
                break;
            case CONTENT:
                addContent(content);
                break;
            case PRIVACY:
                addPrivacy(content);
                break;
            case DOWNLOAD:
                addDownload(content);
                break;
            case MISC:
                addMisc(content);
                break;
            case ABOUT:
                addAbout(content);
                break;
        }
    }

    /** Search results built from the real rows, filtered as the field changes. */
    private void showSearch() {
        try {
            openSearch();
        } catch (Throwable t) {
            // A search screen that cannot be built must not take the app down with it.
            searching = false;
            Debug.print("search: could not open: " + t);
            showRoot(true);
        }
    }

    private void openSearch() {
        if (searching) return;
        searching = true;
        Page page = page(topBar("Search", false, false));
        page.content.addView(pageIntro(
                "Find a row by its name or what it does. Hold a row to open its group."));

        EditText field = searchField();
        LinearLayout.LayoutParams fieldParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, Tokens.dp(context, 44));
        fieldParams.setMargins(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_2),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_1));
        page.content.addView(field, fieldParams);

        LinearLayout results = new LinearLayout(context);
        results.setOrientation(LinearLayout.VERTICAL);
        page.content.addView(results);

        List<RowHit> hits = buildHits();
        field.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable s) {
                cancelPendingSearch();
                final String query = s == null ? "" : s.toString();
                pendingSearch = () -> renderHits(results, hits, query);
                searchHandler.postDelayed(pendingSearch, SEARCH_DEBOUNCE_MS);
            }
        });
        renderHits(results, hits, "");
        show(page.root, true);

        field.post(() -> {
            field.requestFocus();
            InputMethodManager keyboard =
                    (InputMethodManager) context.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (keyboard != null) keyboard.showSoftInput(field, InputMethodManager.SHOW_IMPLICIT);
        });
    }

    private void cancelPendingSearch() {
        if (pendingSearch == null) return;
        searchHandler.removeCallbacks(pendingSearch);
        pendingSearch = null;
    }

    private EditText searchField() {
        return TextField.create(context)
                .hint("Search settings")
                .imeOptions(EditorInfo.IME_ACTION_SEARCH)
                .horizontalPaddingDp(Tokens.SPACE_4)
                .alignStart()
                .build();
    }

    /**
     * Lays every group out once, in a detached container, and keeps the real rows. The same views
     * the pages build are moved into the result list, so a setting is changed right there instead
     * of in a copy of itself.
     */
    private List<RowHit> buildHits() {
        List<RowHit> hits = new ArrayList<>();
        for (Category category : Category.values()) {
            LinearLayout scratch = new LinearLayout(context);
            scratch.setOrientation(LinearLayout.VERTICAL);
            addCategoryContent(scratch, category);
            collectHits(scratch, category, hits);
        }
        return hits;
    }

    private static void collectHits(ViewGroup group, Category category, List<RowHit> out) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof RowView) {
                RowView row = (RowView) child;
                String title = row.title();
                if (!title.isEmpty()) out.add(new RowHit(category, title, row.summary(), row));
            } else if (child instanceof ViewGroup) {
                collectHits((ViewGroup) child, category, out);
            }
        }
    }

    private void renderHits(LinearLayout results, List<RowHit> hits, String query) {
        try {
            renderHitsUnsafe(results, hits, query);
        } catch (Throwable t) {
            Debug.print("search: could not render results: " + t);
        }
    }

    private void renderHitsUnsafe(LinearLayout results, List<RowHit> hits, String query) {
        results.removeAllViews();
        String needle = query.trim().toLowerCase(Locale.ROOT);
        if (needle.isEmpty()) {
            results.addView(searchNote("Type a name, or a word from a description."));
            return;
        }
        int shown = 0;
        for (RowHit hit : hits) {
            if (shown >= MAX_SEARCH_ROWS) break;
            if (!hit.matches(needle)) continue;
            hit.row.setOnLongClickListener(view -> {
                showCategory(hit.category, hit.title);
                return true;
            });
            // A row still lives in the scratch container it was built in, or in a nested group
            // there; a view can only have one parent, so it is detached before it is reused.
            ViewParent parent = hit.row.getParent();
            if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(hit.row);
            results.addView(hit.row);
            results.addView(divider(context));
            shown++;
        }
        if (shown == 0) {
            results.addView(searchNote("No setting matches \"" + query.trim() + "\"."));
        }
    }

    private View searchNote(String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(Tokens.SUBTITLE_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setTypeface(Fonts.face(false));
        view.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_3),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_3));
        return view;
    }

    /** A real row, and the group it was built for. */
    private static final class RowHit {
        final Category category;
        final String title;
        final String summary;
        final RowView row;

        RowHit(Category category, String title, String summary, RowView row) {
            this.category = category;
            this.title = title;
            this.summary = summary;
            this.row = row;
        }

        boolean matches(String needle) {
            String lowerTitle = title.toLowerCase(Locale.ROOT);
            String lowerSummary = summary == null ? "" : summary.toLowerCase(Locale.ROOT);
            return lowerTitle.contains(needle) || lowerSummary.contains(needle);
        }
    }
    /** Slides the old page out and the new one in with a 1/4 parallax; the whole page moves. */
    private void show(View page, boolean forward) {
        if (transitioning) return;

        if (currentView == null) {
            currentView = page;
            host.addView(page, pageParams());
            return;
        }

        int distance = getWidth() > 0 ? getWidth() : getResources().getDisplayMetrics().widthPixels;
        float trailing = distance * PARALLAX_FACTOR;
        float start = forward ? distance : -trailing;
        float endOld = forward ? -trailing : distance;

        final View outgoing = currentView;
        page.setTranslationX(start);
        if (forward) {
            // The new page enters above the old one, so it covers it as it slides in.
            host.addView(page, pageParams());
        } else {
            // On the way back the old page must stay above the root until it has slid out;
            // adding the root at index 0 keeps the outgoing page visible for the whole animation.
            host.addView(page, 0, pageParams());
        }

        transitioning = true;
        outgoing.animate()
                .translationX(endOld)
                .setDuration(PAGE_ANIMATION_MS)
                .setInterpolator(PAGE_EASE)
                .start();
        page.animate()
                .translationX(0f)
                .setDuration(PAGE_ANIMATION_MS)
                .setInterpolator(PAGE_EASE)
                .withEndAction(() -> {
                    host.removeView(outgoing);
                    outgoing.setTranslationX(0f);
                    currentView = page;
                    transitioning = false;
                })
                .start();
    }

    private static FrameLayout.LayoutParams pageParams() {
        return new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT);
    }

    /** Builds a full page: top bar above, scrollable content below. */
    private Page page(View bar) {
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Tokens.BACKGROUND);
        root.addView(bar, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(Tokens.BACKGROUND);
        scroll.setOverScrollMode(OVER_SCROLL_NEVER);
        root.addView(scroll, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                0,
                1f));

        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setBackgroundColor(Tokens.BACKGROUND);
        content.setPadding(0, 0, 0, Tokens.dp(context, Tokens.SPACE_8));
        scroll.addView(content, new ScrollView.LayoutParams(
                ScrollView.LayoutParams.MATCH_PARENT,
                ScrollView.LayoutParams.WRAP_CONTENT));
        return new Page(root, scroll, content);
    }

    /** A page's root (bar + scroll), the scroll itself, and the content inside it. */
    private static final class Page {
        final LinearLayout root;
        final ScrollView scroll;
        final LinearLayout content;

        Page(LinearLayout root, ScrollView scroll, LinearLayout content) {
            this.root = root;
            this.scroll = scroll;
            this.content = content;
        }
    }

    /** Shared top bar. The arrow goes back, or closes the screen on the root page. */
    private View topBar(String titleText, boolean root, boolean search) {
        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setMinimumHeight(Tokens.dp(context, Tokens.SPACE_12));
        bar.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                0,
                Tokens.dp(context, search ? Tokens.SPACE_2 : Tokens.SPACE_4),
                0);

        FrameLayout back = new FrameLayout(context);
        back.setClickable(true);
        back.setFocusable(true);
        back.setContentDescription(root ? "Close Tweaks" : "Back to category list");
        back.setOnClickListener(view -> {
            if (root) {
                finishScreen();
            } else {
                showRoot(true);
            }
        });
        bar.addView(back, new LinearLayout.LayoutParams(
                Tokens.dp(context, Tokens.SPACE_12),
                Tokens.dp(context, Tokens.SPACE_12)));

        ArrowView arrow = new ArrowView(context);
        FrameLayout.LayoutParams arrowParams = new FrameLayout.LayoutParams(
                Tokens.dp(context, Tokens.SPACE_6),
                Tokens.dp(context, Tokens.SPACE_6));
        arrowParams.gravity = Gravity.START | Gravity.CENTER_VERTICAL;
        back.addView(arrow, arrowParams);

        TextView title = new TextView(context);
        title.setText(titleText);
        title.setTextSize(Tokens.PAGE_TITLE_SP);
        title.setTypeface(Fonts.face(true));
        title.setTextColor(Tokens.TEXT_PRIMARY);
        title.setSingleLine(true);
        title.setEllipsize(TextUtils.TruncateAt.END);
        title.setIncludeFontPadding(false);
        bar.addView(title, new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        if (search) {
            FrameLayout button = new FrameLayout(context);
            button.setClickable(true);
            button.setFocusable(true);
            button.setContentDescription("Search settings");
            button.setOnClickListener(view -> showSearch());
            SearchIconView icon = new SearchIconView(context);
            FrameLayout.LayoutParams iconParams = new FrameLayout.LayoutParams(
                    Tokens.dp(context, Tokens.SPACE_6),
                    Tokens.dp(context, Tokens.SPACE_6));
            iconParams.gravity = Gravity.CENTER;
            button.addView(icon, iconParams);
            bar.addView(button, new LinearLayout.LayoutParams(
                    Tokens.dp(context, Tokens.SPACE_12),
                    Tokens.dp(context, Tokens.SPACE_12)));
        }
        return bar;
    }

    private void finishScreen() {
        Activity activity = Activities.of(context);
        if (activity != null) activity.finish();
    }

    /** The page's one-line summary: the first thing that scrolls, right under the bar. */
    private View pageIntro(String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(Tokens.SUBTITLE_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setTypeface(Fonts.face(false));
        view.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_1),
                Tokens.dp(context, Tokens.SPACE_4),
                0);
        return view;
    }

    private View categoryRow(Category category, String summary) {
        RowView row = new RowView(context, category.title, summary, chevron());
        row.setOnClickListener(view -> showCategory(category));
        return row;
    }

    private View chevron() {
        return new ChevronView(context);
    }

    private void addFeed(LinearLayout page) {
        page.addView(section(context, "Name"));
        boolean masterOn = HandleSettings.isEnabled(context);
        List<RowView> dependents = new ArrayList<>();

        ToggleView masterToggle = new ToggleView(context);
        masterToggle.setChecked(masterOn);
        page.addView(new RowView(
                context,
                "Handle stamp",
                "Only the @handle. The region and the post time have their own switches below.",
                masterToggle));

        for (String[] surfaceRow : SURFACE_ROWS) {
            page.addView(divider(context));
            RowView row = new RowView(
                    context,
                    surfaceRow[1],
                    surfaceRow[2],
                    surfaceToggle(context, surfaceRow[0]));
            dependents.add(row);
            page.addView(row);
        }

        page.addView(divider(context));
        String country = CountryName.of(context, "ID");
        String[] regionExamples = {
                "28m ago",
                "28m ago \u00b7 ID",
                "28m ago \u00b7 " + country,
        };
        page.addView(new RowView(
                context,
                "Display country",
                "Show the country after the time. Off hides it; Code is the two-letter code; "
                        + "Name follows the app language.",
                ChoiceAction.create(context, "Display country",
                        "Name follows the app language.",
                        REGION_MODES,
                        regionExamples,
                        HandleSettings.regionMode(context),
                        index -> HandleSettings.setRegionMode(context, index))));
        page.addView(divider(context));

        boolean postTimeOn = HandleSettings.isPostTimeEnabled(context);
        RowView compactRow = new RowView(
                context,
                "Compact time units",
                "Remove the space between the number and the unit: 2h, 2mnt. Off keeps the "
                        + "language's own spacing.",
                toggle(context, HandleSettings.isCompactEnabled(context),
                        checked -> HandleSettings.setCompactEnabled(context, checked)));
        RowView patternRow = new RowView(
                context,
                "Custom pattern",
                "A SimpleDateFormat pattern, checked against a real date before it is saved.",
                new ActionView(context, "Edit", () -> PatternDialog.show(
                        context,
                        "Custom pattern",
                        "Letters: d day, M month, y year, H hour, m minute. Quote text with '...'.",
                        HandleSettings.customDatePattern(context),
                        pattern -> {
                            HandleSettings.setCustomDatePattern(context, pattern);
                            HandleSettings.setDateFormat(context, PostDateFormat.CUSTOM);
                        })));
        // The pattern only exists while Custom is the chosen format, so the row and its divider
        // travel together and stay out of the page otherwise.
        LinearLayout patternGroup = new LinearLayout(context);
        patternGroup.setOrientation(LinearLayout.VERTICAL);
        patternGroup.addView(divider(context));
        patternGroup.addView(patternRow);

        RowView dateRow = new RowView(
                context,
                "Date format",
                "How a post or comment older than a week is written. Auto follows the app "
                        + "language and adds the year once the post is from another year; Custom "
                        + "asks for a pattern right below.",
                ChoiceAction.create(context, "Date format",
                        "Auto adds the year for posts and comments from another year.",
                        PostDateFormat.labels(),
                        () -> dateExamples(context),
                        HandleSettings.dateFormat(context).ordinal(),
                        index -> {
                            HandleSettings.setDateFormat(context, PostDateFormat.at(index));
                            syncPatternGroup(context, patternGroup);
                        }));
        RowView clockRow = new RowView(
                context,
                "Hour in dates",
                "Show the hour and minute next to the date, on a post and on a comment, once it "
                        + "is four weeks old. Recent items keep their relative age.",
                toggle(context, HandleSettings.isClockEnabled(context),
                        checked -> HandleSettings.setClockEnabled(context, checked)));
        ToggleView postTimeToggle = toggle(context, postTimeOn, checked -> {
            HandleSettings.setPostTimeEnabled(context, checked);
            compactRow.setRowEnabled(checked);
            dateRow.setRowEnabled(checked);
            patternRow.setRowEnabled(checked);
            clockRow.setRowEnabled(checked);
        });
        page.addView(new RowView(
                context,
                "Post time",
                "Show when the video was posted, even when TikTok hides it. Comments are dated the "
                        + "same way. Off leaves comments as TikTok wrote them and removes the time in "
                        + "the feed, including TikTok's own. Other languages use CLDR wording, so the "
                        + "text may differ slightly from TikTok's own.",
                postTimeToggle));
        page.addView(divider(context));
        page.addView(compactRow);
        page.addView(divider(context));
        page.addView(dateRow);
        page.addView(patternGroup);
        page.addView(divider(context));
        page.addView(clockRow);
        syncPatternGroup(context, patternGroup);
        compactRow.setRowEnabled(postTimeOn);
        dateRow.setRowEnabled(postTimeOn);
        patternRow.setRowEnabled(postTimeOn);
        clockRow.setRowEnabled(postTimeOn);

        masterToggle.setOnCheckedChangeListener(checked -> {
            HandleSettings.setEnabled(context, checked);
            for (RowView row : dependents) row.setRowEnabled(checked);
        });
        for (RowView row : dependents) row.setRowEnabled(masterOn);

        long[] views = FeedFilterSettings.minMaxViews();
        long[] likes = FeedFilterSettings.minMaxLikes();
        page.addView(section(context, "Feed filter"));
        page.addView(new RowView(
                context,
                "Remove ads",
                "Drop ads and promotional-music posts from the feed.",
                toggle(context, FeedFilterSettings.isAdsEnabled(context),
                        checked -> FeedFilterSettings.setAdsEnabled(context, checked))));
        page.addView(divider(context));
        page.addView(new RowView(
                context,
                "Filter survey cards",
                "Hide TikTok's survey cards from the feed.",
                toggle(context, FeedFilterSettings.isSurveyEnabled(context),
                        checked -> FeedFilterSettings.setSurveyEnabled(context, checked))));
        page.addView(divider(context));
        page.addView(new RowView(
                context,
                "Filter LIVE",
                "Hide LIVE videos and the LIVE entry from the feed.",
                toggle(context, FeedFilterSettings.isLiveEnabled(context),
                        checked -> FeedFilterSettings.setLiveEnabled(context, checked))));
        page.addView(divider(context));
        page.addView(new RowView(
                context,
                "Filter drama",
                "Hide mini-drama and series videos from the feed.",
                toggle(context, FeedFilterSettings.isDramaEnabled(context),
                        checked -> FeedFilterSettings.setDramaEnabled(context, checked))));
        page.addView(divider(context));
        page.addView(new RowView(
                context,
                "Min/Max views",
                "Hide videos outside this play-count range. Set the range to turn it on.",
                RangeAction.create(context, "Min/Max views", views[0], views[1],
                        (min, max) -> FeedFilterSettings.setViewsRange(context, min, max))));
        page.addView(divider(context));
        page.addView(new RowView(
                context,
                "Min/Max likes",
                "Hide videos outside this digg-count range. Set the range to turn it on.",
                RangeAction.create(context, "Min/Max likes", likes[0], likes[1],
                        (min, max) -> FeedFilterSettings.setLikesRange(context, min, max))));

        page.addView(section(context, "Resume playback"));
        boolean resumeOn = ResumePlaybackSettings.isEnabled(context);
        ToggleView resumeToggle = new ToggleView(context);
        resumeToggle.setChecked(resumeOn);

        RowView startRow = new RowView(
                context,
                "Skip from start",
                "Seconds before a position is remembered.",
                NumberAction.create(context, "Skip from start",
                        "Seconds counted from the beginning of the video.",
                        "s", ResumePlaybackSettings.startSeconds(context),
                        seconds -> ResumePlaybackSettings.setStartSeconds(context, seconds)));
        RowView endRow = new RowView(
                context,
                "Skip from end",
                "Seconds before the end that are not remembered.",
                NumberAction.create(context, "Skip from end",
                        "Seconds counted back from the end of the video.",
                        "s", ResumePlaybackSettings.endSeconds(context),
                        seconds -> ResumePlaybackSettings.setEndSeconds(context, seconds)));

        page.addView(new RowView(
                context,
                "Resume playback",
                "Continue a video from where you stopped. The twelve most recently opened videos "
                        + "are kept until the app closes.",
                resumeToggle));
        page.addView(divider(context));
        page.addView(startRow);
        page.addView(divider(context));
        page.addView(endRow);

        resumeToggle.setOnCheckedChangeListener(checked -> {
            ResumePlaybackSettings.setEnabled(context, checked);
            startRow.setRowEnabled(checked);
            endRow.setRowEnabled(checked);
        });
        startRow.setRowEnabled(resumeOn);
        endRow.setRowEnabled(resumeOn);

        page.addView(section(context, "Pause"));
        page.addView(new RowView(
                context,
                "Disable image search on pause",
                "Hide the image-search entries while a video is paused. Off restores TikTok's entries.",
                toggle(context, PauseImageSearchSettings.isDisabled(context),
                        checked -> PauseImageSearchSettings.setDisabled(context, checked))));
    }

    private void addContent(LinearLayout page) {
        page.addView(section(context, "Comments"));
        page.addView(new RowView(
                context,
                "Copy without username",
                "Copy a comment's own text and leave the username in front of it out.",
                toggle(context, CommentCopySettings.isEnabled(context),
                        checked -> CommentCopySettings.setEnabled(context, checked))));

        page.addView(section(context, "Profile background"));
        page.addView(new RowView(
                context,
                "Profile background",
                "Set a static image or a video as the profile background, on "
                        + "accounts TikTok has not rolled it out to. You may not see it on your "
                        + "own profile; only other people do when they open it. Pick an image you "
                        + "are happy to publish, or choose one from your posts.",
                toggle(context, ProfileBgSettings.isEnabled(context),
                        checked -> ProfileBgSettings.setEnabled(context, checked))));

        boolean fontOn = CustomFontSettings.isEnabled(context);
        List<RowView> fontDependents = new ArrayList<>();

        page.addView(section(context, "Custom font"));
        ToggleView fontMaster = new ToggleView(context);
        fontMaster.setChecked(fontOn);
        page.addView(new RowView(
                context,
                "Custom font",
                "Render TikTok's own text with an imported font file.",
                fontMaster));

        page.addView(divider(context));
        RowView importRow = new RowView(
                context,
                "Import a font file",
                "Pick a .ttf or .otf. It is copied into the app's own files.",
                new ActionView(context, "Pick", () -> pickFontFile(context)));
        fontDependents.add(importRow);
        page.addView(importRow);

        LinearLayout fontList = new LinearLayout(context);
        fontList.setOrientation(LinearLayout.VERTICAL);
        fillFontList(context, fontList);
        page.addView(fontList);
        for (RowView row : fontDependents) row.setRowEnabled(fontOn);
        setFontRowsEnabled(fontList, fontOn);

        fontMaster.setOnCheckedChangeListener(checked -> {
            CustomFontSettings.setEnabled(context, checked);
            for (RowView row : fontDependents) row.setRowEnabled(checked);
            setFontRowsEnabled(fontList, checked);
        });
    }

    private void addPrivacy(LinearLayout page) {
        page.addView(section(context, "Captcha"));
        page.addView(new RowView(
                context,
                "Hide CAPTCHA popups",
                "Skip the risk-control puzzle while browsing. Account verification (login, SMS, "
                        + "two-factor) is never hidden.",
                toggle(context, CaptchaSettings.isEnabled(context),
                        checked -> CaptchaSettings.setEnabled(context, checked))));
    }

    private void addDownload(LinearLayout page) {
        boolean downloadOn = DownloadSettings.isEnabled(context);
        List<RowView> dependents = new ArrayList<>();

        page.addView(section(context, "Download"));
        ToggleView master = new ToggleView(context);
        master.setChecked(downloadOn);
        page.addView(new RowView(
                context,
                "Download",
                "Fetch the media from the share sheet. Each part below has its own switch.",
                master));

        page.addView(divider(context));
        RowView noWatermarkRow = new RowView(
                context,
                "No watermark",
                "Take the address that carries no watermark.",
                toggle(context, DownloadSettings.isNoWatermarkEnabled(context),
                        checked -> DownloadSettings.setNoWatermarkEnabled(context, checked)));
        dependents.add(noWatermarkRow);
        page.addView(noWatermarkRow);

        page.addView(divider(context));
        RowView everySheetRow = new RowView(
                context,
                "Every share sheet",
                "Offer the row for a video as well, not only for a photo post.",
                toggle(context, DownloadSettings.isEverySheetEnabled(context),
                        checked -> DownloadSettings.setEverySheetEnabled(context, checked)));
        dependents.add(everySheetRow);
        page.addView(everySheetRow);

        page.addView(divider(context));
        RowView bestQualityRow = new RowView(
                context,
                "Best quality",
                "Take the highest quality among the variants this feed carries, not the highest "
                        + "the server has: a lower one is possible when the feed omits the top.",
                toggle(context, DownloadSettings.isBestQualityEnabled(context),
                        checked -> DownloadSettings.setBestQualityEnabled(context, checked)));
        dependents.add(bestQualityRow);
        page.addView(bestQualityRow);

        master.setOnCheckedChangeListener(checked -> {
            DownloadSettings.setEnabled(context, checked);
            for (RowView row : dependents) row.setRowEnabled(checked);
        });
        for (RowView row : dependents) row.setRowEnabled(downloadOn);
    }

    private void addMisc(LinearLayout page) {
        page.addView(section(context, "Display"));
        page.addView(new RowView(
                context,
                "Keep screen on",
                "Keep the display awake while TikTok is open. Off returns the system screen timeout.",
                toggle(context, KeepScreenSettings.isEnabled(context), checked -> {
                    KeepScreenSettings.setEnabled(context, checked);
                    KeepScreenBridge.apply(Activities.of(context));
                })));

        page.addView(section(context, "Refresh rate"));
        int rateIndex = rateIndex(RefreshRateSettings.fps(context));
        page.addView(new RowView(
                context,
                "App refresh rate",
                "Ask the app for a fixed rate. Default leaves the choice to Android and TikTok.",
                ChoiceAction.create(context, "App refresh rate",
                        "The panel may pick the closest rate it supports.",
                        RATE_LABELS, rateIndex, index -> {
                    RefreshRateSettings.setFps(context, RefreshRateSettings.CHOICES[index]);
                    if (RefreshRate.isInstalled()) RefreshRate.applyNow(context);
                })));

        page.addView(section(context, "Settings backup"));
        page.addView(new RowView(
                context,
                "Export settings",
                "Save every setting to a JSON file.",
                new ActionView(context, "Export", () -> exportSettings(context))));
        page.addView(divider(context));
        page.addView(new RowView(
                context,
                "Import settings",
                "Load settings from a JSON file.",
                new ActionView(context, "Import", () -> importSettings(context))));
        page.addView(divider(context));
        page.addView(new RowView(
                context,
                "Reset to defaults",
                "Every switch in this bundle goes back to its default. This cannot be undone.",
                new ActionView(context, "Reset", () -> Prompt.show(
                        context,
                        "Reset settings?",
                        "Every switch goes back to its default. Imported filters, the chosen font "
                                + "and the saved surfaces are cleared too.",
                        "Reset",
                        () -> {
                            SettingsReset.reset(context);
                            showRoot(false);
                            RestartPrompt.askNow(context);
                        }))));
    }

    private void addAbout(LinearLayout page) {
        page.addView(description(
                context,
                "Tweaks for TikTok 47.7.1 to 47.7.3. "
                        + "The display name is read, never rewritten."));
        page.addView(diagnostics(context));
        page.addView(actions(context));
    }

    /** The pattern row only means something while Custom is the chosen format. */
    private static void syncPatternGroup(Context context, View group) {
        boolean custom = HandleSettings.dateFormat(context) == PostDateFormat.CUSTOM;
        group.setVisibility(custom ? View.VISIBLE : View.GONE);
    }

    /**
     * The sample under each date format. Custom shows what the saved pattern writes, or says it is
     * unset, so the choice never claims a shape the app would not produce.
     */
    private static String[] dateExamples(Context context) {
        Locale locale = AppLocale.of(context);
        String custom = HandleSettings.customDatePattern(context);
        String usable = PostDateFormat.isValidPattern(custom, locale) ? custom.trim() : null;
        String[] examples = PostDateFormat.examples(
                locale,
                System.currentTimeMillis() - 400L * 24L * 60L * 60L * 1000L,
                HandleSettings.isClockEnabled(context),
                usable);
        int customIndex = PostDateFormat.CUSTOM.ordinal();
        if (usable == null && customIndex < examples.length) {
            examples[customIndex] = "no pattern set";
        }
        return examples;
    }

    private String feedSummary() {
        return Category.FEED.summary;
    }

    private String privacySummary() {
        return CaptchaSettings.isEnabled(context) ? "CAPTCHA hidden." : "CAPTCHA shown.";
    }

    private String downloadSummary() {
        return DownloadSettings.isEnabled(context)
                ? "On. Watermark, share sheets and quality."
                : "Off. Nothing is downloaded unless the share sheet asks for it.";
    }

    private String miscSummary() {
        return "Refresh rate: " + RATE_LABELS[rateIndex(RefreshRateSettings.fps(context))];
    }

    /**
     * The filter's own tally, tappable to copy.
     * <p>
     * This is the one piece of state a device report needs, and reading it off a screenshot is not
     * the same as pasting it: the block is also written to the log on every tap, so the log carries
     * the state as it was when it was read.
     */
    private View diagnostics(Context context) {
        TextView view = new TextView(context);
        view.setText(body() + "\nTap to copy");
        view.setTextSize(Tokens.ROW_SUMMARY_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setTypeface(Fonts.face(false));
        view.setLineSpacing(Tokens.dp(context, Tokens.SPACE_1), 1f);
        view.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_2),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_4));
        view.setClickable(true);
        view.setOnClickListener(clicked -> {
            String text = body();
            Debug.print("state: " + text.replace('\n', ' '));
            copy(context, text);
        });
        return view;
    }

    /** What a report needs: which build, what the filter saw, and where the log went. */
    private static String body() {
        File sink = Debug.sink();
        return "Build " + Debug.BUILD + "\n"
                + "Feed filter: " + FeedFilterStats.summary() + "\n"
                + "Resume playback: " + ResumePlayback.summary() + "\n"
                + "Log: " + (sink == null ? "not written yet" : sink.getAbsolutePath());
    }

    private static void copy(Context context, String text) {
        ClipboardManager manager =
                (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (manager == null) return;
        manager.setPrimaryClip(ClipData.newPlainText("Tweaks", text));
    }

    /**
     * The screen's one control that acts on the app rather than on a setting, set at the bottom
     * right where a thumb reaches it. It is not a row: the list is the settings.
     */
    private static View actions(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.END);
        row.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_2),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_6));
        row.addView(new ActionView(context, "Restart", () -> RestartPrompt.restartNow(context)));
        return row;
    }

    private static View section(Context context, String label) {
        TextView view = new TextView(context);
        view.setText(label.toUpperCase());
        view.setTextSize(Tokens.SECTION_SP);
        view.setLetterSpacing(0.14f);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setTypeface(Fonts.face(false));
        view.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_6),
                Tokens.dp(context, Tokens.SPACE_4),
                0);
        return view;
    }

    private static View description(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(Tokens.ROW_SUMMARY_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setTypeface(Fonts.face(false));
        view.setLineSpacing(Tokens.dp(context, Tokens.SPACE_1), 1f);
        view.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_2),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_4));
        return view;
    }

    private static View divider(Context context) {
        View view = new View(context);
        view.setBackgroundColor(Tokens.HAIRLINE);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                Math.max(1, Tokens.dp(context, 0.5f)));
        params.leftMargin = Tokens.dp(context, Tokens.SPACE_4);
        params.rightMargin = Tokens.dp(context, Tokens.SPACE_4);
        view.setLayoutParams(params);
        return view;
    }

    /**
     * The imported fonts, one row each, the one in use named in
     * its summary. Tapping a row picks that face, rebuilds the
     * list, and asks for the restart the text already on screen
     * needs. A name runs at most seven tenths of the row's width,
     * so a long one cannot push the trailing controls out of view.
     * Each row carries its own way out, and the bottom of the list
     * carries the way out of all of it.
     */
    private static void fillFontList(Context context, LinearLayout list) {
        list.removeAllViews();
        List<String> names = CustomFontSettings.names(context);
        if (names.isEmpty()) {
            RowView hint = new RowView(
                    context,
                    "No font imported yet",
                    "Pick a .ttf or .otf file to add one.",
                    null);
            hint.setRowEnabled(false);
            list.addView(hint);
            return;
        }
        String selected = CustomFontSettings.selected(context);
        for (String name : names) {
            list.addView(divider(context));
            boolean inUse = name.equals(selected);
            RowView row = new RowView(
                    context,
                    name,
                    inUse ? "In use" : null,
                    fontRowControls(context, name, list));
            row.capTitleWidth(0.7f);
            row.setOnClickListener(picked -> {
                CustomFontSettings.select(context, name);
                fillFontList(context, list);
                RestartPrompt.askNow(context);
            });
            list.addView(row);
        }
        list.addView(clearAllFonts(context, list));
    }

    /** What a font row carries on its right: the way out of the list for this one font. */
    private static View fontRowControls(
            Context context, String name, LinearLayout list) {
        LinearLayout controls = new LinearLayout(context);
        controls.setOrientation(LinearLayout.HORIZONTAL);
        controls.setGravity(Gravity.CENTER_VERTICAL);
        float fullRadius = Tokens.dp(context, 999);
        ActionView delete = new ActionView(
                context, "Delete", Color.TRANSPARENT, Tokens.TEXT_DANGER, () -> {
            CustomFontSettings.deleteFont(context, name);
            fillFontList(context, list);
            RestartPrompt.askNow(context);
        });
        GradientDrawable deleteBg = new GradientDrawable();
        deleteBg.setColor(Color.TRANSPARENT);
        deleteBg.setCornerRadius(fullRadius);
        deleteBg.setStroke(Tokens.dp(context, 1), Tokens.BORDER_DANGER);
        GradientDrawable deleteMask = new GradientDrawable();
        deleteMask.setColor(Color.WHITE);
        deleteMask.setCornerRadius(fullRadius);
        delete.setBackground(new RippleDrawable(
                ColorStateList.valueOf(Tokens.RIPPLE_ERROR), deleteBg, deleteMask));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        controls.addView(delete, params);
        return controls;
    }


    /** The bottom of the list: the way out of every imported font at once. */
    private static View clearAllFonts(Context context, final LinearLayout list) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.END);
        row.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_1),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_4));
        row.addView(new ActionView(context, "Clear all fonts", () -> Prompt.show(
                context,
                "Clear all fonts",
                "Remove every imported font? The app then draws with its own faces.",
                "Remove all",
                () -> {
                    CustomFontSettings.clearFonts(context);
                    fillFontList(context, list);
                    RestartPrompt.askNow(context);
                })));
        return row;
    }

    private static void setFontRowsEnabled(LinearLayout list, boolean enabled) {
        for (int i = 0; i < list.getChildCount(); i++) {
            View child = list.getChildAt(i);
            if (child instanceof RowView) {
                ((RowView) child).setRowEnabled(enabled);
            }
        }
    }

    /**
     * The system's document picker, filtered to font files. The
     * picked file's answer comes back through the hooked
     * activity result, not through a callback here.
     */
    private static void pickFontFile(Context context) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;
        Intent pick = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        pick.addCategory(Intent.CATEGORY_OPENABLE);
        pick.setType("*/*");
        pick.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                "font/ttf", "font/otf",
                "application/x-font-ttf", "application/x-font-otf",
                "application/octet-stream"});
        activity.startActivityForResult(pick, CustomFontBridge.REQUEST_PICK_FONT);
    }

    private static void exportSettings(Context context) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;
        Intent create = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        create.addCategory(Intent.CATEGORY_OPENABLE);
        create.setType("application/json");
        create.putExtra(Intent.EXTRA_TITLE, "tiktok-tweaks-settings.json");
        activity.startActivityForResult(create, SettingsBackup.REQUEST_EXPORT);
    }

    private static void importSettings(Context context) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;
        Intent open = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        open.addCategory(Intent.CATEGORY_OPENABLE);
        open.setType("*/*");
        open.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                "application/json", "text/json", "text/plain", "application/octet-stream"});
        activity.startActivityForResult(open, SettingsBackup.REQUEST_IMPORT);
    }

    private static ToggleView surfaceToggle(Context context, String surface) {
        return toggle(context, HandleSettings.isSurfaceEnabled(context, surface),
                checked -> HandleSettings.setSurfaceEnabled(context, surface, checked));
    }

    /** The index of the saved rate in the option list, or the default option when it is unknown. */
    private static int rateIndex(int fps) {
        for (int i = 0; i < RefreshRateSettings.CHOICES.length; i++) {
            if (RefreshRateSettings.CHOICES[i] == fps) return i;
        }
        return 0;
    }

    private static ToggleView toggle(
            Context context, boolean initial, ToggleView.OnCheckedChangeListener listener) {
        ToggleView view = new ToggleView(context);
        view.setChecked(initial);
        view.setOnCheckedChangeListener(listener);
        return view;
    }
}
