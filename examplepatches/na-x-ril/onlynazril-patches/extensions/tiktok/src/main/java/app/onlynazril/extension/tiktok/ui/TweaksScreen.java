package app.onlynazril.extension.tiktok.ui;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import app.onlynazril.extension.tiktok.CustomFontBridge;
import app.onlynazril.extension.tiktok.Surfaces;
import app.onlynazril.extension.tiktok.feedfilter.FeedFilterStats;
import app.onlynazril.extension.tiktok.internal.Activities;
import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.RestartPrompt;
import app.onlynazril.extension.tiktok.settings.CaptchaSettings;
import app.onlynazril.extension.tiktok.settings.CommentCopySettings;
import app.onlynazril.extension.tiktok.settings.CustomFontSettings;
import app.onlynazril.extension.tiktok.settings.DownloadSettings;
import app.onlynazril.extension.tiktok.settings.FeedFilterSettings;
import app.onlynazril.extension.tiktok.settings.HandleSettings;
import app.onlynazril.extension.tiktok.settings.ProfileBgSettings;

/**
 * Builds the screen: header, one Handle section (master switch on top, then one row per surface,
 * then the region), then one section per remaining feature (Comments, Captcha, Feed filter,
 * Download, Profile background, Custom font), and About.
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

        // Independent of the master: what the clipboard receives is not what a name is drawn
        // with, so the @handle stamp and the comment surface switch do not govern it.
        column.addView(section(context, "Comments"));
        column.addView(new RowView(
                context,
                "Copy without username",
                "Copy a comment's own text and leave the username in front of it out.",
                toggle(context, CommentCopySettings.isEnabled(context),
                        checked -> CommentCopySettings.setEnabled(context, checked))));

        // Independent of everything above: the puzzle is not the @handle stamp and not the
        // filter, and its own switch is the feature.
        column.addView(section(context, "Captcha"));
        column.addView(new RowView(
                context,
                "Hide CAPTCHA popups",
                "Skip the risk-control puzzle while browsing. Account verification (login, SMS, "
                        + "two-factor) is never hidden.",
                toggle(context, CaptchaSettings.isEnabled(context),
                        checked -> CaptchaSettings.setEnabled(context, checked))));

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

        boolean downloadOn = DownloadSettings.isEnabled(context);
        List<RowView> downloadDependents = new ArrayList<>();

        column.addView(section(context, "Download"));
        ToggleView downloadMaster = new ToggleView(context);
        downloadMaster.setChecked(downloadOn);
        column.addView(new RowView(
                context,
                "Download",
                "Fetch the media from the share sheet. Each part below has its own switch.",
                downloadMaster));

        column.addView(divider(context));
        RowView noWatermarkRow = new RowView(
                context,
                "No watermark",
                "Take the address that carries no watermark.",
                toggle(context, DownloadSettings.isNoWatermarkEnabled(context),
                        checked -> DownloadSettings.setNoWatermarkEnabled(context, checked)));
        downloadDependents.add(noWatermarkRow);
        column.addView(noWatermarkRow);

        column.addView(divider(context));
        RowView everySheetRow = new RowView(
                context,
                "Every share sheet",
                "Offer the row for a video as well, not only for a photo post.",
                toggle(context, DownloadSettings.isEverySheetEnabled(context),
                        checked -> DownloadSettings.setEverySheetEnabled(context, checked)));
        downloadDependents.add(everySheetRow);
        column.addView(everySheetRow);

        column.addView(divider(context));
        RowView bestQualityRow = new RowView(
                context,
                "Best quality",
                "Take the highest quality among the variants this feed carries, not the highest "
                        + "the server has: a lower one is possible when the feed omits the top.",
                toggle(context, DownloadSettings.isBestQualityEnabled(context),
                        checked -> DownloadSettings.setBestQualityEnabled(context, checked)));
        downloadDependents.add(bestQualityRow);
        column.addView(bestQualityRow);

        downloadMaster.setOnCheckedChangeListener(checked -> {
            DownloadSettings.setEnabled(context, checked);
            for (RowView row : downloadDependents) row.setRowEnabled(checked);
        });
        for (RowView row : downloadDependents) row.setRowEnabled(downloadOn);

        // Independent of the master: the profile background is not the
        // @handle stamp, and its gate is the app's own AB decision, not a
        // switch above it.
        column.addView(section(context, "Profile background"));
        column.addView(new RowView(
                context,
                "Profile background",
                "Set a static image or a video as the profile background, on "
                        + "accounts TikTok has not rolled it out to. Others see it, not you: the "
                        + "background shows on your profile to everyone who opens it, so pick an "
                        + "image you are happy to publish, or choose one from your posts",
                toggle(context, ProfileBgSettings.isEnabled(context),
                        checked -> ProfileBgSettings.setEnabled(context, checked))));

        // Independent of the master: the custom font is not the
        // @handle stamp, and its switch is the feature itself. The
        // picker brings a font in; the list below picks the face
        // the app draws with. Every change asks for the restart
        // the text already on screen needs.
        boolean fontOn = CustomFontSettings.isEnabled(context);
        List<RowView> fontDependents = new ArrayList<>();

        column.addView(section(context, "Custom font"));
        ToggleView fontMaster = new ToggleView(context);
        fontMaster.setChecked(fontOn);
        column.addView(new RowView(
                context,
                "Custom font",
                "Render TikTok's own text with an imported font file.",
                fontMaster));

        column.addView(divider(context));
        RowView importRow = new RowView(
                context,
                "Import a font file",
                "Pick a .ttf or .otf. It is copied into the app's own files.",
                new ActionView(context, "Pick", () -> pickFontFile(context)));
        fontDependents.add(importRow);
        column.addView(importRow);

        LinearLayout fontList = new LinearLayout(context);
        fontList.setOrientation(LinearLayout.VERTICAL);
        fillFontList(context, fontList);
        column.addView(fontList);
        for (RowView row : fontDependents) row.setRowEnabled(fontOn);
        setFontRowsEnabled(fontList, fontOn);

        fontMaster.setOnCheckedChangeListener(checked -> {
            CustomFontSettings.setEnabled(context, checked);
            for (RowView row : fontDependents) row.setRowEnabled(checked);
            setFontRowsEnabled(fontList, checked);
        });

        column.addView(section(context, "About"));
        column.addView(description(
                context,
                "Tweaks for TikTok 47.7.1 and 47.7.2. "
                        + "The display name is read, never rewritten."));
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
                Tokens.dp(context, Tokens.SPACE_2),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_6));

        TextView title = new TextView(context);
        title.setText("Tweaks");
        title.setTextSize(Tokens.TITLE_SP);
        title.setTypeface(Fonts.face(true));
        title.setTextColor(Tokens.TEXT_PRIMARY);
        block.addView(title);

        TextView subtitle = new TextView(context);
        subtitle.setText("Handle stamp, region, post time, comment copy, captcha, feed filter, "
                + "download, profile background, custom font");
        subtitle.setTextSize(Tokens.SUBTITLE_SP);
        subtitle.setTextColor(Tokens.TEXT_SECONDARY);
        subtitle.setTypeface(Fonts.face(false));
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
        view.setTypeface(Fonts.face(false));
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
        ActionView delete = new ActionView(context, "Delete", () -> {
            CustomFontSettings.deleteFont(context, name);
            fillFontList(context, list);
            RestartPrompt.askNow(context);
        });
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
    @SuppressWarnings("deprecation")
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
