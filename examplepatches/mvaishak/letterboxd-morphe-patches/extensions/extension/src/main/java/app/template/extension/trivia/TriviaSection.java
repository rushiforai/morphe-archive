package app.template.extension.trivia;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.util.TypedValue;
import androidx.core.graphics.ColorUtils;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import android.text.style.URLSpan;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import com.google.android.material.chip.Chip;
import com.google.android.material.divider.MaterialDivider;
import app.template.extension.ui.LoadingIndicator;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public final class TriviaSection extends Fragment {
    private static final int FIRST = ImdbTriviaPage.PREVIEW_SIZE;
    private static final int MORE = 5;
    private final Set<String> revealed = new HashSet<>();
    private final List<String> renderedIds = new ArrayList<>();
    private final Set<String> categories = new LinkedHashSet<>();
    private String imdbId;
    private String category;
    private int limit = FIRST;
    private long selectedAt;
    private boolean measured;
    private boolean cacheHit;
    private LinearLayout root;
    private LinearLayout filters;
    private LinearLayout rows;
    private HorizontalScrollView filterScroll;
    private TextView status;
    private View empty;
    private Button more;
    private Button retry;
    private LoadingIndicator progress;
    private LoadingIndicator moreProgress;
    private LinearLayout moreRow;
    private ImdbTriviaPage.Result current;
    private Runnable unsubscribe;

    static TriviaSection create(String imdbId, long selectedAt) {
        TriviaSection fragment = new TriviaSection();
        Bundle args = new Bundle();
        args.putString("imdbId", imdbId);
        args.putLong("selectedAt", selectedAt);
        fragment.setArguments(args);
        return fragment;
    }

    boolean isFor(String id) {
        return java.util.Objects.equals(requireArguments().getString("imdbId"), id);
    }

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle saved) {
        imdbId = requireArguments().getString("imdbId");
        selectedAt = requireArguments().getLong("selectedAt");
        if (saved != null) {
            selectedAt = SystemClock.elapsedRealtime();
            category = saved.getString("category");
            limit = saved.getInt("limit", FIRST);
        }
        revealed.clear();
        measured = false;
        Context context = inflater.getContext();
        int margin = resource(context, "activity_horizontal_margin", "dimen");
        int padding = margin == 0 ? dp(context, 16) : context.getResources().getDimensionPixelSize(margin);
        root = column(context);
        root.setPaddingRelative(padding, dp(context, 8), padding, dp(context, 12));
        LinearLayout header = new LinearLayout(context);
        header.setGravity(android.view.Gravity.CENTER_VERTICAL);
        status = text(context, "", "MetadataBody");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        header.addView(status, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (imdbId != null) header.addView(action(context, "IMDb", () -> open(ImdbTriviaPage.source(imdbId))));
        root.addView(header);

        filterScroll = new HorizontalScrollView(context);
        filterScroll.setHorizontalScrollBarEnabled(false);
        filters = new LinearLayout(context);
        filterScroll.addView(filters);
        root.addView(filterScroll);
        filterScroll.setVisibility(View.GONE);

        rows = column(context);
        root.addView(rows);
        empty = emptyView(inflater);
        empty.setVisibility(View.GONE);
        root.addView(empty, new LinearLayout.LayoutParams(-1, -2));
        progress = new LoadingIndicator(context, false);
        root.addView(progress, new LinearLayout.LayoutParams(-1, -2));
        moreRow = new LinearLayout(context);
        moreRow.setGravity(Gravity.CENTER_VERTICAL);
        more = action(context, "Load more", () -> {
            limit += MORE;
            render();
        });
        moreRow.addView(more);
        moreProgress = new LoadingIndicator(context, true);
        moreRow.addView(moreProgress, new LinearLayout.LayoutParams(-2, -2));
        root.addView(moreRow);
        moreRow.setVisibility(View.GONE);
        retry = action(context, "Retry", this::load);
        root.addView(retry);
        retry.setVisibility(View.GONE);
        return root;
    }

    @Override public void onStart() {
        super.onStart();
        load();
    }

    @Override public void onStop() {
        if (unsubscribe != null) unsubscribe.run();
        unsubscribe = null;
        progress.setLoading(false);
        moreProgress.setLoading(false);
        super.onStop();
    }

    @Override public void onSaveInstanceState(Bundle out) {
        super.onSaveInstanceState(out);
        out.putString("category", category);
        out.putInt("limit", limit);
    }

    @Override public void onDestroyView() {
        if (unsubscribe != null) unsubscribe.run();
        unsubscribe = null;
        root = rows = filters = null;
        filterScroll = null;
        status = null;
        empty = null;
        more = retry = null;
        progress = moreProgress = null;
        moreRow = null;
        current = null;
        categories.clear();
        renderedIds.clear();
        super.onDestroyView();
    }

    private void load() {
        if (unsubscribe != null) unsubscribe.run();
        unsubscribe = null;
        retry.setVisibility(View.GONE);
        empty.setVisibility(View.GONE);
        status.setVisibility(View.VISIBLE);
        if (imdbId == null) {
            status.setText("This film has no IMDb link.");
            progress.setLoading(false);
            return;
        }
        ImdbTriviaPage.Result cached = ImdbTrivia.cached(imdbId);
        cacheHit = cached != null;
        if (cached != null) {
            update(cached);
            return;
        }
        status.setText("Loading trivia…");
        progress.setLoading(current == null || current.items.isEmpty());
        unsubscribe = ImdbTrivia.subscribe(requireParentFragment(), imdbId, this::update);
    }

    private void update(ImdbTriviaPage.Result result) {
        if (root == null || !result.imdbId.equals(imdbId)) return;
        // A failed later page or extraction must not erase already visible entries.
        if (result.items.isEmpty() && current != null && !current.items.isEmpty()
                && !"empty".equals(result.status)) {
            result = new ImdbTriviaPage.Result(imdbId, result.status, current.items);
        }
        current = result;
        render();
    }

    private void render() {
        if (current == null) return;
        boolean loading = "loading".equals(current.status);
        boolean complete = "observed".equals(current.status) || "empty".equals(current.status);
        progress.setLoading(loading && current.items.isEmpty());
        boolean sourceLimited = current.status.endsWith("http_403") || current.status.endsWith("http_429");
        boolean mayRetry = !sourceLimited && !current.status.equals("http_404");
        retry.setVisibility(!loading && !complete && mayRetry ? View.VISIBLE : View.GONE);

        Set<String> available = new LinkedHashSet<>();
        for (ImdbTriviaPage.Item item : current.items) available.add(item.category);
        if (!loading && !available.contains(category)) category = null;
        if (!available.equals(categories)) {
            categories.clear();
            categories.addAll(available);
            buildFilters();
        }

        List<ImdbTriviaPage.Item> matching = new ArrayList<>();
        for (boolean spoiler : new boolean[]{false, true}) {
            for (ImdbTriviaPage.Item item : current.items) {
                if (item.spoiler == spoiler && (category == null || category.equals(item.category))) matching.add(item);
            }
        }

        int visible = Math.min(limit, matching.size());
        // Retain rows that are still in place; append in the film's existing vertical scroll.
        int common = 0;
        while (common < visible && common < renderedIds.size()
                && renderedIds.get(common).equals(matching.get(common).id)) common++;
        for (int i = renderedIds.size() - 1; i >= common; i--) {
            rows.removeViewAt(i);
            renderedIds.remove(i);
        }
        for (int i = common; i < visible; i++) {
            ImdbTriviaPage.Item item = matching.get(i);
            rows.addView(row(item));
            renderedIds.add(item.id);
        }
        boolean hasLocalRows = visible < matching.size();
        boolean waitingForRows = loading && visible > 0;
        // A tap raises the limit by five. Bind any local rows now and fill the remaining slots on completion.
        more.setEnabled(hasLocalRows);
        more.setText(hasLocalRows ? "Load more" : "Loading more…");
        moreRow.setVisibility(hasLocalRows || waitingForRows ? View.VISIBLE : View.GONE);
        moreProgress.setLoading(waitingForRows && !hasLocalRows);
        String count = matching.size() == 1 ? "1 entry" : matching.size() + " entries";
        boolean isEmpty = complete && current.items.isEmpty();
        empty.setVisibility(isEmpty ? View.VISIBLE : View.GONE);
        status.setVisibility(isEmpty ? View.INVISIBLE : View.VISIBLE);
        if (!current.items.isEmpty()) {
            status.setText(loading ? "Loading more from IMDb…" : complete ? count : count + " · Some entries may be missing");
            if (visible > 0) measureFirstFrame();
        } else if (loading) status.setText("Loading trivia…");
        else if (isEmpty) status.setText("");
        else if (current.status.startsWith("network_")) status.setText("Couldn’t connect to IMDb. Try again.");
        else if (current.status.equals("http_404")) status.setText("IMDb couldn’t find this trivia page.");
        else if (sourceLimited) status.setText("IMDb is limiting requests. Try again later.");
        else status.setText("Couldn’t load trivia from IMDb.");
    }

    private void buildFilters() {
        filters.removeAllViews();
        filterScroll.setVisibility(categories.size() > 1 ? View.VISIBLE : View.GONE);
        if (categories.size() < 2) return;
        addFilter("All", null);
        for (String key : categories) addFilter(label(key), key);
    }

    private void addFilter(String label, String key) {
        Context context = filters.getContext();
        Chip chip = new Chip(context);
        chip.setTextAppearance(style(context, "Pill", android.R.style.TextAppearance_Material_Body1));
        chip.setChipMinHeight(dp(context, 32));
        chip.setEnsureMinTouchTargetSize(true);
        chip.setChipCornerRadius(dp(context, 16));
        chip.setChipStartPadding(dp(context, 12));
        chip.setChipEndPadding(dp(context, 12));
        chip.setTextStartPadding(0);
        chip.setTextEndPadding(0);
        int surface = themeColor(context, "colorSurface", android.R.attr.colorBackground, Color.BLACK);
        int accent = appColor(context, "green00E054", themeColor(context, "colorAccent",
                android.R.attr.colorAccent, status.getCurrentTextColor()));
        int primary = appColor(context, "textColorPrimary", status.getCurrentTextColor());
        int secondary = status.getCurrentTextColor();
        chip.setTextColor(checkedColors(primary, secondary));
        chip.setChipBackgroundColor(checkedColors(ColorUtils.blendARGB(surface, accent, .16f), surface));
        chip.setChipStrokeWidth(dp(context, 1));
        chip.setChipStrokeColor(checkedColors(accent, ColorUtils.blendARGB(surface, secondary, .42f)));
        chip.setRippleColor(ColorStateList.valueOf(ColorUtils.setAlphaComponent(accent, 55)));
        chip.setText(label);
        chip.setCheckable(true);
        chip.setChecked(java.util.Objects.equals(key, category));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
        params.setMarginEnd(dp(filters.getContext(), 6));
        filters.addView(chip, params);
        chip.setOnClickListener(view -> {
            category = key;
            limit = FIRST;
            for (int i = 0; i < filters.getChildCount(); i++) {
                ((Chip) filters.getChildAt(i)).setChecked(filters.getChildAt(i) == chip);
            }
            render();
        });
    }

    private View row(ImdbTriviaPage.Item item) {
        Context context = rows.getContext();
        LinearLayout row = column(context);
        row.addView(new MaterialDivider(context), new LinearLayout.LayoutParams(-1, -2));
        LinearLayout body = column(context);
        body.setPadding(0, dp(context, 8), 0, dp(context, 8));
        row.addView(body);
        if (!"uncategorized".equals(item.category)) {
            TextView categoryLabel = text(context, label(item.category), "FilmRelease.SecondaryDescription");
            categoryLabel.setTextColor(status.getTextColors());
            body.addView(categoryLabel);
        }
        if (item.spoiler && !revealed.contains(item.id)) {
            View reveal = spoilerView(context, () -> {
                revealed.add(item.id);
                int index = rows.indexOfChild(row);
                if (index < 0) return;
                rows.removeViewAt(index);
                View replacement = row(item);
                rows.addView(replacement, index);
                replacement.announceForAccessibility("Spoiler revealed");
            });
            body.addView(reveal);
        } else {
            TextView prose = text(context, item.text, "MetadataBodySpaced");
            if (!item.html.isEmpty()) {
                SpannableStringBuilder rich = new SpannableStringBuilder(Build.VERSION.SDK_INT >= 24
                        ? Html.fromHtml(item.html, Html.FROM_HTML_MODE_COMPACT) : Html.fromHtml(item.html));
                for (URLSpan span : rich.getSpans(0, rich.length(), URLSpan.class)) {
                    int start = rich.getSpanStart(span);
                    int end = rich.getSpanEnd(span);
                    rich.removeSpan(span);
                    try {
                        URI url = URI.create(ImdbTriviaPage.source(imdbId)).resolve(span.getURL());
                        if ("https".equalsIgnoreCase(url.getScheme()) && url.getHost() != null
                                && url.getUserInfo() == null) rich.setSpan(new URLSpan(url.toString()),
                                        start, end, android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    } catch (IllegalArgumentException ignored) {
                        // Keep the text if the source URL is malformed or unsupported.
                    }
                }
                if (rich.length() != 0) prose.setText(rich);
                if (rich.getSpans(0, rich.length(), URLSpan.class).length != 0) {
                    prose.setMovementMethod(LinkMovementMethod.getInstance());
                }
            }
            body.addView(prose);
        }
        return row;
    }

    private View emptyView(LayoutInflater inflater) {
        Context context = inflater.getContext();
        int layout = resource(context, "view_empty", "layout");
        int titleId = resource(context, "empty_title_view", "id");
        if (layout != 0 && titleId != 0) {
            View view = inflater.inflate(layout, root, false);
            TextView title = view.findViewById(titleId);
            if (title != null) {
                title.setText("No trivia");
                View quote = view.findViewById(resource(context, "empty_quote_view", "id"));
                if (quote != null) quote.setVisibility(View.GONE);
                view.setMinimumHeight(dp(context, 112));
                return view;
            }
        }
        TextView fallback = text(context, "No trivia", "Action.Label");
        fallback.setGravity(android.view.Gravity.CENTER);
        fallback.setMinimumHeight(dp(context, 112));
        return fallback;
    }

    private View spoilerView(Context context, Runnable reveal) {
        String message = "Spoiler: Tap to reveal";
        int layout = resource(context, "view_spoiler", "layout");
        if (layout == 0) return action(context, message, reveal);
        // SpoilerView inflates this same merge layout. Bind our own action without ever inserting the hidden text.
        FrameLayout banner = new FrameLayout(context);
        banner.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        LayoutInflater.from(context).inflate(layout, banner, true);
        View content = banner.getChildAt(0);
        if (content != null) {
            content.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            replaceSpoilerLabel(content, message);
        }
        banner.setContentDescription(message);
        banner.setFocusable(true);
        banner.setOnClickListener(view -> reveal.run());
        return banner;
    }

    private static void replaceSpoilerLabel(View view, String message) {
        if (view instanceof TextView) {
            ((TextView) view).setText(message);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) replaceSpoilerLabel(group.getChildAt(i), message);
        }
    }

    private static ColorStateList checkedColors(int checked, int normal) {
        return new ColorStateList(new int[][]{new int[]{android.R.attr.state_checked}, new int[0]},
                new int[]{checked, normal});
    }

    private static int themeColor(Context context, String name, int defaultAttr, int fallback) {
        int id = resource(context, name, "attr");
        TypedValue value = new TypedValue();
        if ((id == 0 || !context.getTheme().resolveAttribute(id, value, true))
                && !context.getTheme().resolveAttribute(defaultAttr, value, true)) return fallback;
        return value.resourceId != 0 ? context.getColor(value.resourceId) : value.data;
    }

    private static int appColor(Context context, String name, int fallback) {
        int id = resource(context, name, "color");
        return id == 0 ? fallback : context.getColor(id);
    }

    private void measureFirstFrame() {
        if (measured) return;
        measured = true;
        long bound = SystemClock.elapsedRealtime();
        View view = root;
        view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override public boolean onPreDraw() {
                view.getViewTreeObserver().removeOnPreDrawListener(this);
                long now = SystemClock.elapsedRealtime();
                Log.i(ImdbTriviaPage.TAG, "first_frame id=" + imdbId + " cache=" + cacheHit
                        + " elapsedMs=" + (now - selectedAt) + " frameWaitMs=" + (now - bound));
                return true;
            }
        });
    }

    private void open(String url) {
        try {
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (ActivityNotFoundException error) {
            status.setText("No browser is available.");
        }
    }

    private static LinearLayout column(Context context) {
        LinearLayout view = new LinearLayout(context);
        view.setOrientation(LinearLayout.VERTICAL);
        return view;
    }

    private static Button action(Context context, String label, Runnable run) {
        Button button = new Button(context, null, android.R.attr.borderlessButtonStyle);
        button.setAllCaps(false);
        button.setText(label);
        button.setOnClickListener(view -> run.run());
        return button;
    }

    private static TextView text(Context context, String label, String appearance) {
        TextView view = new TextView(context);
        int textStyle = style(context, appearance, android.R.style.TextAppearance_Material_Body1);
        view.setTextAppearance(textStyle);
        TypedArray spacing = context.obtainStyledAttributes(textStyle,
                new int[]{android.R.attr.lineSpacingExtra, android.R.attr.lineSpacingMultiplier});
        try {
            view.setLineSpacing(spacing.getDimension(0, 0), spacing.getFloat(1, 1));
        } finally {
            spacing.recycle();
        }
        view.setText(label);
        return view;
    }

    private static int style(Context context, String name, int fallback) {
        int id = resource(context, "Theme.Letterboxd.Text." + name, "style");
        return id == 0 ? fallback : id;
    }

    private static int resource(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static String label(String key) {
        StringBuilder out = new StringBuilder();
        for (String word : key.split("[-_]")) {
            if (word.isEmpty()) continue;
            if (out.length() != 0) out.append(' ');
            out.append(word.substring(0, 1).toUpperCase(Locale.ROOT)).append(word.substring(1));
        }
        return out.toString();
    }
}
