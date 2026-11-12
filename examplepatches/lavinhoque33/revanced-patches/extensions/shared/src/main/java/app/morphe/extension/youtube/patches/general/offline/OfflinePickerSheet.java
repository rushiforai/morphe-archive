/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-10-10.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.format.Formatter;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.function.Consumer;

import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.ui.SheetBottomDialog;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.shared.PipDismissHelper;
import app.morphe.extension.youtube.utils.ThemeUtils;

/**
 * Bottom sheet of the built-in downloader. Shows the video while its formats load, then one row
 * per downloadable video quality, the audio-only formats and the thumbnail.
 */
final class OfflinePickerSheet {
    private static final String THUMBNAIL_URL = "https://i.ytimg.com/vi/%s/mqdefault.jpg";
    private static final int ANIMATION_DURATION_MS = 180;

    private final Activity activity;
    private final SheetBottomDialog.SlideDialog dialog;
    private final LinearLayout root;
    private final LinearLayout details;
    private final ImageView thumbnail;
    private final TextView duration;
    private final TextView title;
    private final TextView author;
    private final ProgressBar loading;
    private OfflineCaptions.Catalog playlistCaptions;
    private final OfflineSponsorBlock.Picker sponsorPicker;
    private boolean dismissed;

    private final int foreground;
    private final int secondary;
    private final int divider;
    private final int ripple;

    OfflinePickerSheet(Activity activity, @Nullable String videoId, Runnable onDismiss) {
        this.activity = activity;
        sponsorPicker = new OfflineSponsorBlock.Picker(videoId == null, this::isActive);
        foreground = ThemeUtils.getAppForegroundColor();
        secondary = withAlpha(foreground, 0xAA);
        divider = withAlpha(foreground, 0x1F);
        ripple = withAlpha(foreground, 0x33);

        root = SheetBottomDialog.createMainLayout(activity, ThemeUtils.getDialogBackgroundColor());
        root.setPadding(0, 0, 0, Dim.dp8);

        details = new LinearLayout(activity);
        details.setOrientation(LinearLayout.HORIZONTAL);
        details.setGravity(Gravity.CENTER_VERTICAL);
        details.setPadding(Dim.dp16, Dim.dp4, Dim.dp16, Dim.dp12);

        FrameLayout thumbnailFrame = new FrameLayout(activity);
        thumbnail = new ImageView(activity);
        thumbnail.setScaleType(ImageView.ScaleType.CENTER_CROP);
        thumbnail.setClipToOutline(true);
        thumbnail.setBackground(rounded(Dim.dp8, divider));
        thumbnailFrame.addView(thumbnail, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        duration = text(11, Color.WHITE, 1);
        duration.setTypeface(Typeface.DEFAULT_BOLD);
        duration.setBackground(rounded(Dim.dp4, 0xCC000000));
        duration.setPadding(Dim.dp4, 0, Dim.dp4, 0);
        duration.setVisibility(View.GONE);
        FrameLayout.LayoutParams durationParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
        durationParams.setMargins(Dim.dp4, Dim.dp4, Dim.dp4, Dim.dp4);
        thumbnailFrame.addView(duration, durationParams);
        details.addView(thumbnailFrame, new LinearLayout.LayoutParams(Dim.dp(128), Dim.dp(72)));

        LinearLayout texts = new LinearLayout(activity);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPadding(Dim.dp12, 0, 0, 0);
        title = text(16, foreground, 2);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setText(str("revanced_offline_loading_formats"));
        texts.addView(title);
        author = text(13, secondary, 1);
        author.setVisibility(View.GONE);
        texts.addView(author);
        details.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(details);

        loading = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        loading.setIndeterminate(true);
        loading.setIndeterminateTintList(ColorStateList.valueOf(foreground));
        LinearLayout.LayoutParams loadingParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        loadingParams.setMargins(Dim.dp16, 0, Dim.dp16, Dim.dp16);
        root.addView(loading, loadingParams);

        dialog = SheetBottomDialog.createSlideDialog(activity, root, ANIMATION_DURATION_MS);
        PipDismissHelper.dismissOnPip(dialog, () -> {
            dismissed = true;
            onDismiss.run();
        });
        if (videoId != null) {
            sponsorPicker.fetch(videoId);
            loadThumbnail(videoId);
        }
    }

    void show() {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        dialog.show();
    }

    boolean isActive() {
        return !dismissed && dialog.isShowing() && !activity.isFinishing() && !activity.isDestroyed();
    }

    void dismiss() {
        dismissed = true;
        try {
            dialog.dismiss();
        } catch (Exception ex) {
            Logger.printException(() -> "Could not dismiss the quality picker", ex);
        }
    }

    void setLoadingText(String text) {
        title.setText(text);
    }

    /** Independently scrollable options and recycled video rows, with fixed selection and download actions. */
    void showPlaylist(OfflinePlaylist.Result playlist, List<OfflinePlaylistSelection.Item> items,
                      Consumer<List<OfflinePlaylistSelection.Item>> onPick) {
        if (!isActive()) return;
        title.setText(playlist.title().isEmpty() ? str("revanced_offline_batch_title") : playlist.title());
        author.setText(str("revanced_offline_batch_count", items.size()));
        author.setVisibility(View.VISIBLE);
        loadThumbnail(playlist.entries().get(0).videoId());
        root.removeView(loading);
        root.removeView(details);

        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        header.addView(details);

        View line = new View(activity);
        line.setBackgroundColor(divider);
        header.addView(line, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Dim.dp1));

        playlistCaptions = OfflineCaptions.Catalog.forBatch();
        OfflineSubtitlePicker.add(activity, header, playlistCaptions, foreground);
        sponsorPicker.add(activity, header, foreground);

        String footerText = str("revanced_offline_batch_footer");
        if (OfflineOptions.isRangeNarrowed()) {
            footerText += "\n" + str("revanced_offline_batch_range",
                    OfflineOptions.minHeight() + "p", OfflineOptions.maxHeight() + "p");
        }
        if (OfflineOptions.allVideoCodecsOff()) footerText += "\n" + str("revanced_offline_codecs_all_off");
        LinearLayout footer = new LinearLayout(activity);
        footer.setOrientation(LinearLayout.VERTICAL);
        Button download = OfflinePlaylistPicker.actionButton(activity, "", true);
        LinearLayout.LayoutParams downloadParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        downloadParams.setMargins(Dim.dp16, Dim.dp8, Dim.dp16, 0);
        footer.addView(download, downloadParams);

        ScrollView options = new ScrollView(activity);
        options.addView(header);
        LinearLayout actions = new LinearLayout(activity);
        ListView list = new ListView(activity);
        list.setDivider(null);
        new OfflinePlaylistPicker(activity, list, header, actions, download,
                items, foreground, this::isActive, onPick);
        header.addView(createFooter(footerText));

        LinearLayout content = new PlaylistContent(activity);
        content.addView(options, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        content.addView(actions, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 2f));
        content.addView(footer, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(content, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    OfflineCaptions.Selection playlistSubtitles() {
        return playlistCaptions == null ? OfflineCaptions.Selection.none() : playlistCaptions.selection();
    }

    OfflineSponsorBlock.Selection sponsorSelection() {
        return sponsorPicker.selection();
    }

    /** Best, then the usual limits that lie within the quality range of the settings. */
    static List<Integer> heightLimits() {
        List<Integer> limits = new ArrayList<>();
        limits.add(Integer.MAX_VALUE);
        for (int limit : new int[]{1080, 720, 480, 360}) {
            if (limit >= OfflineOptions.minHeight() && limit <= OfflineOptions.maxHeight()) limits.add(limit);
        }
        return limits;
    }

    /**
     * Replaces the loading state with the video qualities, the audio-only formats and the thumbnail.
     */
    void showFormats(OfflineFormats.Resolved resolved, Consumer<OfflineFormats.Stream> onPick,
                     Runnable onThumbnail) {
        if (!isActive()) return;
        showDetails(resolved);
        root.removeView(loading);

        View line = new View(activity);
        line.setBackgroundColor(divider);
        root.addView(line, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Dim.dp1));

        boolean[] picked = {false};
        Consumer<Runnable> once = action -> {
            if (picked[0]) return; // A second tap while the sheet slides away.
            picked[0] = true;
            action.run();
        };
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        OfflineSubtitlePicker.add(activity, list, resolved.captions(), foreground);
        sponsorPicker.add(activity, list, foreground);
        addVideoSection(list, resolved, video -> once.accept(() -> onPick.accept(video)));
        addAudioSection(list, resolved, audio -> once.accept(() -> onPick.accept(audio)));
        addThumbnailSection(list, () -> once.accept(onThumbnail));

        addCappedList(list, str("revanced_offline_picker_footer",
                OfflineMediaStore.Collection.VIDEO.relativePath(OfflineOptions.videoFolder()),
                OfflineMediaStore.Collection.AUDIO.relativePath(OfflineOptions.audioFolder()))
                + "\n" + str("revanced_offline_subtitles_footer"));
    }

    private void showDetails(OfflineFormats.Resolved resolved) {
        title.setText(resolved.title());
        author.setText(resolved.author());
        author.setVisibility(TextUtils.isEmpty(resolved.author()) ? View.GONE : View.VISIBLE);
        if (resolved.lengthMs() > 0) {
            duration.setText(OfflineLibraryScreen.formatDuration(resolved.lengthMs()));
            duration.setVisibility(View.VISIBLE);
        }
    }

    private void addVideoSection(LinearLayout list, OfflineFormats.Resolved resolved,
                                 Consumer<OfflineFormats.Stream> onPick) {
        list.addView(sectionTitle(str("revanced_offline_picker_subtitle")));
        if (OfflineOptions.allVideoCodecsOff()) list.addView(note(str("revanced_offline_codecs_all_off")));

        List<OfflineFormats.Stream> videos = OfflineOptions.filterVideos(resolved.videos());
        if (videos.isEmpty()) list.addView(note(str("revanced_offline_picker_no_video_match")));
        for (OfflineFormats.Stream video : videos) {
            long size = video.contentLength() > 0 && resolved.audioFor(video).contentLength() > 0
                    ? video.contentLength() + resolved.audioFor(video).contentLength()
                    : -1;
            list.addView(row(OfflineDownloader.qualityLabel(video), badge(video), videoDetail(video), size,
                    v -> onPick.accept(video)));
        }
    }

    private void addAudioSection(LinearLayout list, OfflineFormats.Resolved resolved,
                                 Consumer<OfflineFormats.Stream> onPick) {
        List<OfflineFormats.Stream> audio = OfflineOptions.filterAudio(resolved.audioOnly());
        if (audio.isEmpty()) return;

        list.addView(sectionTitle(str("revanced_offline_picker_audio_section")));
        for (OfflineFormats.Stream stream : audio) {
            boolean opus = OfflineFormats.CODEC_OPUS.equals(stream.codec());
            String label = str(opus ? "revanced_offline_picker_audio_opus" : "revanced_offline_picker_audio_m4a");
            String detail = stream.codec() + " · " + Math.round(stream.bitrate() / 1000f) + " kbps · "
                    + str(opus ? "revanced_offline_picker_opus_hint" : "revanced_offline_picker_m4a_hint");
            list.addView(row(label, null, withFormatId(detail, stream), stream.contentLength(),
                    v -> onPick.accept(stream)));
        }
    }

    private void addThumbnailSection(LinearLayout list, Runnable onPick) {
        list.addView(sectionTitle(str("revanced_offline_picker_thumbnail_section")));
        String folder = OfflineMediaStore.Collection.IMAGE.relativePath(OfflineOptions.thumbnailFolder());
        list.addView(row(str("revanced_offline_picker_thumbnail"), null,
                str("revanced_offline_picker_thumbnail_hint", folder), -1, v -> onPick.run()));
    }

    private TextView sectionTitle(String text) {
        TextView section = text(13, secondary, 1);
        section.setTypeface(Typeface.DEFAULT_BOLD);
        section.setText(text);
        section.setPadding(Dim.dp16, Dim.dp12, Dim.dp16, Dim.dp4);
        return section;
    }

    private TextView note(String text) {
        TextView note = text(13, warningColor(), 3);
        note.setText(text);
        note.setPadding(Dim.dp16, Dim.dp4, Dim.dp16, Dim.dp4);
        return note;
    }

    private TextView createFooter(String footerText) {
        TextView footer = text(12, secondary, Integer.MAX_VALUE);
        footer.setEllipsize(null);
        footer.setText(footerText);
        footer.setGravity(Gravity.CENTER);
        footer.setPadding(Dim.dp16, Dim.dp8, Dim.dp16, Dim.dp4);
        return footer;
    }

    private void addCappedList(LinearLayout list, String footerText) {
        TextView footer = createFooter(footerText);
        ScrollView scroll = new MaxHeightScrollView(activity, footer, root);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(footer, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private LinearLayout baseRow(View.OnClickListener onClick) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(Dim.dp(60));
        row.setPadding(Dim.dp16, Dim.dp8, Dim.dp16, Dim.dp8);
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(ripple), null, mask));
        row.setOnClickListener(onClick);
        return row;
    }

    /**
     * @param size Bytes, or -1 to show none.
     */
    private View row(String label, @Nullable String badgeText, CharSequence detail, long size,
                     View.OnClickListener onClick) {
        LinearLayout row = baseRow(onClick);

        LinearLayout texts = new LinearLayout(activity);
        texts.setOrientation(LinearLayout.VERTICAL);

        LinearLayout labelLine = new LinearLayout(activity);
        labelLine.setOrientation(LinearLayout.HORIZONTAL);
        labelLine.setGravity(Gravity.CENTER_VERTICAL);
        TextView labelView = text(16, foreground, 1);
        labelView.setTypeface(Typeface.DEFAULT_BOLD);
        labelView.setText(label);
        labelLine.addView(labelView);
        if (badgeText != null) {
            TextView badge = text(10, foreground, 1);
            badge.setTypeface(Typeface.DEFAULT_BOLD);
            badge.setText(badgeText);
            badge.setBackground(rounded(Dim.dp4, divider));
            badge.setPadding(Dim.dp6, Dim.dp1, Dim.dp6, Dim.dp1);
            LinearLayout.LayoutParams badgeParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            badgeParams.setMarginStart(Dim.dp8);
            labelLine.addView(badge, badgeParams);
        }
        texts.addView(labelLine);

        TextView detailView = text(13, secondary, 2);
        detailView.setText(detail);
        texts.addView(detailView);
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        if (size != -1) {
            TextView sizeView = text(14, foreground, 1);
            sizeView.setText(size > 0 ? Formatter.formatShortFileSize(activity, size) : "—");
            sizeView.setPadding(Dim.dp12, 0, 0, 0);
            row.addView(sizeView);
        }
        return row;
    }

    @Nullable
    private static String badge(OfflineFormats.Stream video) {
        if (video.height() >= 2160) return "4K";
        if (video.height() >= 1440) return "2K";
        return video.height() >= 720 ? "HD" : null;
    }

    private CharSequence videoDetail(OfflineFormats.Stream video) {
        String hint = switch (video.codec()) {
            case OfflineFormats.CODEC_AV1 -> "revanced_offline_picker_av1_hint";
            case OfflineFormats.CODEC_VP9 -> "revanced_offline_picker_vp9_hint";
            default -> "revanced_offline_picker_h264_hint";
        };
        SpannableStringBuilder detail = new SpannableStringBuilder(withFormatId(
                video.codec() + " · " + str(hint), video));
        // AV1 this device cannot decode is listed, with a warning note.
        if (!video.playable()) {
            int start = detail.length();
            detail.append(" [").append(str("revanced_offline_picker_av1_unplayable")).append(']');
            detail.setSpan(new ForegroundColorSpan(warningColor()), start, detail.length(),
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        return detail;
    }

    /** Appends {@code id: <itag>} when the setting asks for it. */
    private static String withFormatId(String detail, OfflineFormats.Stream stream) {
        if (!OfflineOptions.showFormatIds()) return detail;
        return detail + " · " + str("revanced_offline_picker_format_id", stream.itag());
    }

    private static int warningColor() {
        return BaseThemeUtils.isDarkModeEnabled() ? 0xFFFFA040 : 0xFFD84315;
    }

    private void loadThumbnail(String videoId) {
        Utils.runOnBackgroundThread(() -> {
            Bitmap bitmap = fetchThumbnail(String.format(Locale.US, THUMBNAIL_URL, videoId));
            if (bitmap != null) Utils.runOnMainThread(() -> {
                if (isActive()) thumbnail.setImageBitmap(bitmap);
            });
        });
    }

    @Nullable
    static Bitmap fetchThumbnail(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(10_000);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) return null;
            try (InputStream input = connection.getInputStream()) {
                return BitmapFactory.decodeStream(input);
            }
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not load the picker thumbnail", ex);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private TextView text(float sizeSp, int color, int maxLines) {
        TextView view = new TextView(activity);
        view.setTextSize(sizeSp);
        view.setTextColor(color);
        view.setMaxLines(maxLines);
        view.setEllipsize(TextUtils.TruncateAt.END);
        return view;
    }

    private static GradientDrawable rounded(int radius, int color) {
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(radius);
        shape.setColor(color);
        return shape;
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    /** Keeps the sheet's header and footer on screen when a video has many qualities. */
    private static final class MaxHeightScrollView extends ScrollView {
        private final View footer;
        private final ViewGroup root;

        MaxHeightScrollView(Context context, View footer, ViewGroup root) {
            super(context);
            this.footer = footer;
            this.root = root;
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int cap = listCap(this, footer, root, widthMeasureSpec, heightMeasureSpec);
            super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(cap, MeasureSpec.AT_MOST));
        }
    }

    private static int listCap(View list, View footer, ViewGroup root, int widthSpec, int heightSpec) {
        footer.measure(widthSpec, View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int screenHeight = list.getResources().getDisplayMetrics().heightPixels;
        int available = View.MeasureSpec.getMode(heightSpec) == View.MeasureSpec.UNSPECIFIED
                ? screenHeight : View.MeasureSpec.getSize(heightSpec);
        return OfflinePickerLayout.scrollCap(screenHeight, available, footer.getMeasuredHeight(),
                root.getPaddingBottom() + Dim.dp8, Dim.dp(120));
    }

    /** Measure fixed actions first, then share the remaining height between options and video rows. */
    private static final class PlaylistContent extends LinearLayout {
        PlaylistContent(Context context) {
            super(context);
            setOrientation(VERTICAL);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int screenHeight = getResources().getDisplayMetrics().heightPixels;
            int available = MeasureSpec.getMode(heightMeasureSpec) == MeasureSpec.UNSPECIFIED
                    ? screenHeight : MeasureSpec.getSize(heightMeasureSpec);
            int height = Math.min(available, (int) (screenHeight * 0.85f));
            super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY));
        }
    }
}
