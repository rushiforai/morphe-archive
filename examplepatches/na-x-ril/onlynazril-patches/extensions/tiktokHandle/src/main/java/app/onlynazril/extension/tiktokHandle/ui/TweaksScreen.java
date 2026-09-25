package app.onlynazril.extension.tiktokHandle.ui;

import android.content.Context;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import app.onlynazril.extension.tiktokHandle.Surfaces;
import app.onlynazril.extension.tiktokHandle.internal.RestartPrompt;
import app.onlynazril.extension.tiktokHandle.settings.HandleSettings;

/**
 * Builds the screen: header, one Handle section (master switch on top, then one row per surface,
 * then the region), and About.
 *
 * With the master off the dependent rows stay visible but greyed and inert, so their own state
 * survives and comes back unchanged when the master returns.
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

        column.addView(section(context, "About"));
        column.addView(description(
                context,
                "Tweaks for TikTok 47.0.3. The display name is read, never rewritten."));
        column.addView(actions(context));

        return column;
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
        subtitle.setText("Handle stamp, region and post time");
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
