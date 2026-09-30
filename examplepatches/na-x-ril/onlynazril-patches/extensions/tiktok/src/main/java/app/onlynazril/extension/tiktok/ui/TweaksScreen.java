package app.onlynazril.extension.tiktok.ui;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import app.onlynazril.extension.tiktok.Surfaces;
import app.onlynazril.extension.tiktok.feedfilter.FeedFilterStats;
import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.RestartPrompt;
import app.onlynazril.extension.tiktok.settings.FeedFilterSettings;
import app.onlynazril.extension.tiktok.settings.HandleSettings;

/**
 * Builds the screen: header, one Handle section (master switch on top, then one row per surface,
 * then the region), a Feed filter section, and About.
 *
 * With the master off the dependent rows stay visible but greyed and inert, so their own state
 * survives and comes back unchanged when the master returns.
 *
 * The feed filter's rows take no part in that: what the feed contains is not the @handle stamp,
 * so no switch above can change them and they cannot change it.
 */
public final class TweaksScreen {
    /** {surface id, title, summary} for the surface rows. */
    private static final String[][] SURFACE_ROWS = {
        {Surfaces.FEED, "Feed videos", "The author line, the region and the post time in the feed."},
        {Surfaces.COMMENTS, "Comments", "Comment authors and their region."},
    };

    private TweaksScreen() {}

    public static View build(Context context) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackgroundColor(Tokens.BACKGROUND);
        column.setPadding(0, 0, 0, Tokens.dp(context, Tokens.SPACE_8));

        column.addView(header(context));
        column.addView(section(context, "Feed"));

        boolean masterOn = HandleSettings.isEnabled(context);
        List<RowView> dependents = new ArrayList<>();

        ToggleView masterToggle = new ToggleView(context);
        masterToggle.setChecked(masterOn);
        column.addView(new RowView(
                context,
                "Handle stamp",
                "Only the @handle. The region and the post time have their own switches below.",
                masterToggle));

        for (int i = 0; i < SURFACE_ROWS.length; i++) {
            column.addView(divider(context));
            RowView row = new RowView(
                    context,
                    SURFACE_ROWS[i][1],
                    SURFACE_ROWS[i][2],
                    surfaceToggle(context, SURFACE_ROWS[i][0]));
            dependents.add(row);
            column.addView(row);
        }

        // Independent of the master: the region and the post time share the header's time view,
        // so neither is part of the @handle stamp.
        column.addView(divider(context));
        column.addView(new RowView(
                context,
                "Region \u00b7 CC",
                "Append the country code after the post time, on every surface that shows one.",
                toggle(context, HandleSettings.isRegionEnabled(context),
                        checked -> HandleSettings.setRegionEnabled(context, checked))));
        column.addView(divider(context));
        column.addView(new RowView(
                context,
                "Post time",
                "Show when the video was posted, even when TikTok hides it. Off removes the time, "
                        + "including TikTok's own.",
                toggle(context, HandleSettings.isPostTimeEnabled(context),
                        checked -> HandleSettings.setPostTimeEnabled(context, checked))));

        masterToggle.setOnCheckedChangeListener(checked -> {
            HandleSettings.setEnabled(context, checked);
            for (RowView row : dependents) row.setRowEnabled(checked);
        });
        for (RowView row : dependents) row.setRowEnabled(masterOn);

        long[] views = FeedFilterSettings.minMaxViews();
        long[] likes = FeedFilterSettings.minMaxLikes();
        column.addView(section(context, "Feed filter"));
        column.addView(new RowView(
                context,
                "Remove ads",
                "Drop ads and promotional-music posts from the feed.",
                toggle(context, FeedFilterSettings.isAdsEnabled(context),
                        checked -> FeedFilterSettings.setAdsEnabled(context, checked))));
        column.addView(divider(context));
        column.addView(new RowView(
                context,
                "Min/Max views",
                "Hide videos outside this play-count range. Set the range to turn it on.",
                RangeAction.create(context, "Min/Max views", views[0], views[1],
                        (min, max) -> FeedFilterSettings.setViewsRange(context, min, max))));
        column.addView(divider(context));
        column.addView(new RowView(
                context,
                "Min/Max likes",
                "Hide videos outside this digg-count range. Set the range to turn it on.",
                RangeAction.create(context, "Min/Max likes", likes[0], likes[1],
                        (min, max) -> FeedFilterSettings.setLikesRange(context, min, max))));

        column.addView(section(context, "About"));
        column.addView(description(
                context,
                "Tweaks for TikTok 47.0.3. The display name is read, never rewritten."));
        column.addView(diagnostics(context));
        column.addView(actions(context));

        return column;
    }

    /**
     * The filter's own tally, tappable to copy.
     *
     * This is the one piece of state a device report needs, and reading it off a screenshot is not
     * the same as pasting it: the block is also written to the log on every tap, so the log carries
     * the state as it was when it was read.
     */
    private static View diagnostics(Context context) {
        TextView view = new TextView(context);
        view.setText(body() + "\nTap to copy");
        view.setTextSize(Tokens.ROW_SUMMARY_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
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
            view.setText("Copied to clipboard");
            view.postDelayed(() -> view.setText(text + "\nTap to copy"), 1600);
        });
        return view;
    }

    /** What a report needs: which build, what the filter saw, and where the log went. */
    private static String body() {
        File sink = Debug.sink();
        return "Build " + Debug.BUILD + "\n"
                + "Feed filter: " + FeedFilterStats.summary() + "\n"
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

    private static View header(Context context) {
        LinearLayout block = new LinearLayout(context);
        block.setOrientation(LinearLayout.VERTICAL);
        block.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_12),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_6));

        TextView title = new TextView(context);
        title.setText("Tweaks");
        title.setTextSize(Tokens.TITLE_SP);
        title.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        title.setTextColor(Tokens.TEXT_PRIMARY);
        block.addView(title);

        TextView subtitle = new TextView(context);
        subtitle.setText("Handle stamp, region, post time, feed filter");
        subtitle.setTextSize(Tokens.SUBTITLE_SP);
        subtitle.setTextColor(Tokens.TEXT_SECONDARY);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(context, Tokens.SPACE_1);
        subtitle.setLayoutParams(params);
        block.addView(subtitle);
        return block;
    }

    private static View section(Context context, String label) {
        TextView view = new TextView(context);
        view.setText(label.toUpperCase());
        view.setTextSize(Tokens.SECTION_SP);
        view.setLetterSpacing(0.14f);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_6),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_2));
        return view;
    }

    private static View description(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(Tokens.ROW_SUMMARY_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
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

    private static ToggleView surfaceToggle(Context context, String surface) {
        return toggle(context, HandleSettings.isSurfaceEnabled(context, surface),
                checked -> HandleSettings.setSurfaceEnabled(context, surface, checked));
    }

    private static ToggleView toggle(
            Context context, boolean initial, ToggleView.OnCheckedChangeListener listener) {
        ToggleView view = new ToggleView(context);
        view.setChecked(initial);
        view.setOnCheckedChangeListener(listener);
        return view;
    }
}
