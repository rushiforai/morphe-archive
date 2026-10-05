/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.widget.LinearLayout;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.crimera.theme.PikoTheme;
import app.morphe.extension.crimera.ui.BottomSheetView;
import app.morphe.extension.crimera.ui.ButtonView;
import app.morphe.extension.crimera.ui.IconView;
import app.morphe.extension.crimera.ui.ListItem;
import app.morphe.extension.instagram.utils.InstagramSheetTheme;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Media picker bottom sheet for the feed download button, shown for posts with more than one media.
 *
 * <ul>
 *   <li>Tap a row to download that media.
 *   <li>Long-press a row to enter selection mode; checkboxes then replace the copy-link action and
 *       the action button downloads the selection.
 *   <li>The action button downloads everything until a partial selection is made.
 *   <li>Leaving selection mode happens automatically once nothing is selected.
 * </ul>
 */
final class DownloadSheet {
    interface Listener {
        void onDownloadItem(int index);

        /** A partial selection, in the order it was picked. */
        void onDownloadItems(List<Integer> indexes);

        void onDownloadAll();
    }

    interface StoryListener {
        void onDownloadVideo();

        void onDownloadPhoto();
    }

    private DownloadSheet() {
    }

    /** Two rows for a video story: the video itself, or its cover frame saved as a photo. */
    /** Throws when there is no usable activity to host the sheet, so a failure is never silent. */
    static void showStoryOptions(Context context, String username, StoryListener listener) {
        Activity activity = findActivity(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            throw new IllegalStateException("No usable activity to host the story download sheet");
        }

        InstagramSheetTheme.install();
        final BottomSheetView sheet = new BottomSheetView(activity);
        sheet.setTitle(str("piko_download_sheet_title"));
        sheet.setSubtitle(username != null && !username.trim().isEmpty()
                ? str("piko_download_sheet_from", username.trim())
                : str("piko_download_sheet_subtitle"));

        final LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.addView(storyOptionRow(
                activity, IconView.IconType.VIDEO, str("piko_download_story_video"), () -> {
                    sheet.dismiss();
                    listener.onDownloadVideo();
                }));
        list.addView(storyOptionRow(
                activity, IconView.IconType.IMAGE, str("piko_download_story_photo"), () -> {
                    sheet.dismiss();
                    listener.onDownloadPhoto();
                }));

        sheet.setScrollableBodyView(list);
        sheet.show();
    }

    private static ListItem storyOptionRow(
            Activity activity, IconView.IconType icon, String title, Runnable onClick) {
        ListItem row = new ListItem(activity);
        row.setTitle(title);
        row.setLeadingIcon(icon, PikoTheme.primaryAccent(activity), PikoTheme.surfaceVariant(activity));
        row.setOnClickListener(v -> onClick.run());
        return row;
    }

    static void show(Context context, List<DownloadItem> downloads, String username, Listener listener) {
        Activity activity = findActivity(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            Logger.printDebug(() -> "Download sheet skipped: no usable activity");
            return;
        }

        final int total = downloads.size();
        InstagramSheetTheme.install();
        final BottomSheetView sheet = new BottomSheetView(activity);
        final String defaultTitle = str("piko_download_sheet_title");
        final String defaultSubtitle = username != null && !username.trim().isEmpty()
                ? str("piko_download_sheet_from", username.trim())
                : str("piko_download_sheet_subtitle");
        sheet.setTitle(defaultTitle);
        sheet.setSubtitle(defaultSubtitle);

        final ButtonView downloadButton = new ButtonView(
                activity, ButtonView.ButtonStyle.FILLED, str("piko_download_all_count", total));
        sheet.addButton(downloadButton);

        final LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);

        final Set<Integer> selected = new LinkedHashSet<>();
        final boolean[] selecting = {false};
        final List<ListItem> rows = new ArrayList<>(total);
        final List<Bitmap> thumbnails = new ArrayList<>(total);
        final Runnable[] refresh = new Runnable[1];

        refresh[0] = () -> {
            if (selecting[0] && selected.isEmpty()) selecting[0] = false;

            if (selecting[0]) {
                sheet.setTitle(str("piko_download_sheet_select_title"));
                sheet.setSubtitle(str("piko_download_sheet_selected", selected.size(), total));
                downloadButton.setText(selected.size() == total
                        ? str("piko_download_all_count", total)
                        : str("piko_download_count", selected.size()));
            } else {
                sheet.setTitle(defaultTitle);
                sheet.setSubtitle(defaultSubtitle);
                downloadButton.setText(str("piko_download_all_count", total));
            }

            for (int i = 0; i < total; i++) {
                bindRow(activity, rows.get(i), downloads.get(i), i, selecting[0], selected, sheet, listener, refresh[0], thumbnails.get(i));
            }
        };

        for (int i = 0; i < total; i++) {
            final int index = i;
            ListItem row = new ListItem(activity);
            row.setTitle(downloads.get(i).label + " " + (i + 1));
            row.setOnClickListener(v -> {
                if (selecting[0]) {
                    toggle(selected, index);
                    refresh[0].run();
                } else {
                    sheet.dismiss();
                    listener.onDownloadItem(index);
                }
            });
            row.setOnLongClickListener(v -> {
                if (selecting[0]) return false;
                try {
                    v.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                } catch (RuntimeException ignored) {
                    // Haptics are best effort.
                }
                selecting[0] = true;
                selected.clear();
                selected.add(index);
                refresh[0].run();
                return true;
            });
            rows.add(row);
            thumbnails.add(peekThumbnail(index, downloads.get(i)));
            list.addView(row);
        }

        downloadButton.setOnClickListener(v -> {
            if (selecting[0] && selected.isEmpty()) return;
            sheet.dismiss();
            if (!selecting[0] || selected.size() == total) {
                listener.onDownloadAll();
            } else {
                listener.onDownloadItems(new ArrayList<>(selected));
            }
        });

        refresh[0].run();
        sheet.setScrollableBodyView(list);
        sheet.show();
        loadThumbnails(activity, downloads, rows, thumbnails, sheet, selected, selecting);
    }

    /** Thumbnail already in memory, so the row opens with it instead of swapping in later. */
    private static Bitmap peekThumbnail(int index, DownloadItem item) {
        if (!ThumbnailLoader.isDownloadSheetThumbnailsEnabled()) return null;
        try {
            return ThumbnailLoader.peek("item[" + index + "]", item.cacheObjects, item.cacheUrls, item.thumbnailUrl);
        } catch (Throwable throwable) {
            return null;
        }
    }

    /** Kicks off async preview loads; the media-type icon stays until a tier returns a bitmap. */
    private static void loadThumbnails(
            Activity activity,
            List<DownloadItem> downloads,
            List<ListItem> rows,
            List<Bitmap> thumbnails,
            BottomSheetView sheet,
            Set<Integer> selected,
            boolean[] selecting
    ) {
        if (!ThumbnailLoader.isDownloadSheetThumbnailsEnabled()) return;

        for (int i = 0; i < downloads.size(); i++) {
            final int index = i;
            if (thumbnails.get(index) != null) continue;
            DownloadItem item = downloads.get(i);
            if (item.thumbnailUrl == null && item.cacheUrls.isEmpty()) continue;

            ThumbnailLoader.load(activity, "item[" + index + "]", item.cacheObjects, item.cacheUrls, item.thumbnailUrl, bitmap -> {
                if (bitmap == null || bitmap.isRecycled()) return;
                thumbnails.set(index, bitmap);
                if (!sheet.isShowing()) return;

                ListItem row = rows.get(index);
                if (!row.isAttachedToWindow()) return;
                row.setLeadingImage(
                        bitmap,
                        selecting[0] && selected.contains(index)
                                ? PikoTheme.primaryContainer(activity)
                                : PikoTheme.surfaceVariant(activity));
            });
        }
    }

    private static void bindRow(
            Activity activity,
            ListItem row,
            DownloadItem item,
            int index,
            boolean selecting,
            Set<Integer> selected,
            BottomSheetView sheet,
            Listener listener,
            Runnable refresh,
            Bitmap thumbnail
    ) {
        boolean isSelected = selected.contains(index);
        int badgeBg = selecting && isSelected
                ? PikoTheme.primaryContainer(activity)
                : PikoTheme.surfaceVariant(activity);
        if (thumbnail != null && !thumbnail.isRecycled()) {
            row.setLeadingImage(thumbnail, badgeBg);
        } else {
            row.setLeadingIcon(
                    item.video ? IconView.IconType.VIDEO : IconView.IconType.IMAGE,
                    PikoTheme.primaryAccent(activity),
                    badgeBg);
        }

        if (selecting) {
            row.createTrailingIconButton(
                    isSelected ? IconView.IconType.CHECKBOX_CHECKED : IconView.IconType.CHECKBOX_UNCHECKED,
                    isSelected ? PikoTheme.checkboxChecked(activity) : PikoTheme.secondaryText(activity),
                    v -> {
                        toggle(selected, index);
                        refresh.run();
                    });
        } else {
            row.createTrailingIconButton(
                    IconView.IconType.COPY_LINK,
                    PikoTheme.secondaryText(activity),
                    v -> {
                        sheet.dismiss();
                        Utils.setClipboard(item.url);
                        Utils.showToastShort(str("piko_copied_media_link"));
                    });
        }
    }

    private static void toggle(Set<Integer> selected, int index) {
        if (!selected.remove(index)) selected.add(index);
    }

    static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return Utils.getActivity();
    }
}
