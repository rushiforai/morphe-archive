/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.RippleDrawable;
import android.util.LruCache;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;
import java.util.function.BooleanSupplier;

import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.general.offline.OfflinePlaylistSelection.Item;

/** Virtualized playlist rows; only visible thumbnails are requested and recycled rows keep their identity. */
final class OfflinePlaylistPicker {
    private static final LruCache<String, Bitmap> thumbnails = new LruCache<>(4 * 1024 * 1024) {
        @Override protected int sizeOf(String key, Bitmap bitmap) {
            return bitmap.getByteCount();
        }
    };
    private static final Set<String> loading = ConcurrentHashMap.newKeySet();

    private final Activity activity;
    private final int foreground;
    private final OfflinePlaylistSelection selection;
    private final Button download;
    private final TextView quality;
    private final BooleanSupplier active;
    private final BaseAdapter adapter = new BaseAdapter() {
        @Override public int getCount() {
            return selection.size();
        }

        @Override public Item getItem(int position) {
            return selection.get(position);
        }

        @Override public long getItemId(int position) {
            return position;
        }

        @Override public View getView(int position, View convertView, ViewGroup parent) {
            Row row = convertView instanceof Row recycled ? recycled : new Row();
            row.bind(position);
            return row;
        }
    };

    OfflinePlaylistPicker(Activity activity, ListView list, LinearLayout header, LinearLayout actions,
                          Button download, List<Item> items, int foreground, BooleanSupplier active,
                          Consumer<List<Item>> onPick) {
        this.activity = activity;
        this.foreground = foreground;
        this.active = active;
        this.selection = new OfflinePlaylistSelection(items);
        this.download = download;
        quality = label(14);
        quality.setPadding(Dim.dp16, Dim.dp12, Dim.dp16, Dim.dp12);
        quality.setOnClickListener(view -> showGlobalQuality());
        header.addView(quality);

        actions.setPadding(Dim.dp16, Dim.dp8, Dim.dp16, Dim.dp8);
        for (boolean all : new boolean[]{true, false}) {
            Button button = actionButton(activity,
                    str(all ? "revanced_offline_batch_select_all" : "revanced_offline_batch_select_none"), false);
            button.setOnClickListener(view -> {
                selection.selectAll(all);
                changed();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            if (all) params.setMarginEnd(Dim.dp8);
            actions.addView(button, params);
        }
        list.setAdapter(adapter);
        boolean[] picked = {false};
        download.setOnClickListener(view -> {
            if (picked[0] || selection.selectedCount() == 0) return;
            picked[0] = true;
            onPick.accept(selection.selectedItems());
        });
        changed();
    }

    /** RVX dialog pills with wrapping labels and full-height touch targets, only for the playlist picker. */
    static Button actionButton(Context context, CharSequence label, boolean primary) {
        Button button = CustomDialog.createButton(context, null, label, null, primary, false);
        button.setSingleLine(false);
        button.setMaxLines(Integer.MAX_VALUE);
        button.setEllipsize(null);
        button.setMinHeight(Dim.dp(48));
        button.setMinimumHeight(Dim.dp(48));
        button.setPadding(Dim.dp16, Dim.dp8, Dim.dp16, Dim.dp8);

        int color = button.getCurrentTextColor();
        int ripple = (color & 0x00FFFFFF) | 0x33000000;
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(ripple), button.getBackground(), null));
        return button;
    }

    private void changed() {
        download.setText(str("revanced_offline_batch_download_selected", selection.selectedCount()));
        download.setEnabled(selection.selectedCount() > 0);
        download.setAlpha(download.isEnabled() ? 1f : 0.38f);
        quality.setText(str("revanced_offline_batch_global_quality", heightLabel(selection.heightLimit)));
        adapter.notifyDataSetChanged();
    }

    private String heightLabel(int height) {
        return height == Integer.MAX_VALUE ? str("revanced_offline_batch_best") : height + "p";
    }

    private void showGlobalQuality() {
        List<Integer> limits = OfflinePickerSheet.heightLimits();
        String[] labels = new String[limits.size()];
        for (int index = 0; index < labels.length; index++) labels[index] = heightLabel(limits.get(index));
        OfflineUi.showChoices(activity, str("revanced_offline_batch_subtitle"), labels,
                limits.indexOf(selection.heightLimit), foreground, which -> {
                    selection.heightLimit = limits.get(which);
                    changed();
                });
    }

    private void edit(int position) {
        Item item = selection.get(position);
        List<Integer> limits = new ArrayList<>();
        limits.add(Integer.MAX_VALUE);
        for (int limit : OfflinePickerSheet.heightLimits()) {
            if (limit < selection.heightLimit) limits.add(limit);
        }
        String[] labels = new String[limits.size() + 1];
        int selected = item.audioOnly() ? labels.length - 1 : 0;
        for (int index = 0; index < limits.size(); index++) {
            labels[index] = str("revanced_offline_batch_video", heightLabel(Math.min(selection.heightLimit,
                    limits.get(index))));
            if (!item.audioOnly() && item.heightLimit() == limits.get(index)) selected = index;
        }
        labels[labels.length - 1] = str("revanced_offline_batch_audio");
        OfflineUi.showChoices(activity, item.title(), labels, selected, foreground, which -> {
            boolean audio = which == labels.length - 1;
            selection.edit(position, audio, audio ? item.heightLimit() : limits.get(which));
            changed();
        });
    }

    private TextView label(int size) {
        TextView text = new TextView(activity);
        text.setTextSize(size);
        text.setTextColor(foreground);
        return text;
    }

    private final class Row extends LinearLayout {
        private final CheckBox checked = new CheckBox(activity);
        private final TextView index = label(12);
        private final ImageView image = new ImageView(activity);
        private final TextView duration = label(11);
        private final TextView title = label(14);
        private final TextView format = label(12);
        private final Button edit = actionButton(activity, str("revanced_offline_batch_edit"), false);
        private String imageKey;

        Row() {
            super(activity);
            setGravity(Gravity.CENTER_VERTICAL);
            setPadding(Dim.dp8, Dim.dp8, Dim.dp8, Dim.dp8);
            checked.setButtonTintList(ColorStateList.valueOf(foreground));
            addView(checked);
            index.setGravity(Gravity.CENTER);
            addView(index, new LayoutParams(Dim.dp(24), ViewGroup.LayoutParams.WRAP_CONTENT));

            FrameLayout thumbnail = new FrameLayout(activity);
            image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            image.setBackgroundColor(0x33808080);
            thumbnail.addView(image, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));
            duration.setTextColor(Color.WHITE);
            duration.setBackgroundColor(0xBB000000);
            thumbnail.addView(duration, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END));
            addView(thumbnail, new LayoutParams(Dim.dp(96), Dim.dp(54)));

            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(VERTICAL);
            labels.setPadding(Dim.dp8, 0, 0, 0);
            title.setMaxLines(3);
            labels.addView(title);
            format.setAlpha(0.7f);
            labels.addView(format);
            addView(labels, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            LayoutParams editParams = new LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            editParams.topMargin = Dim.dp8;
            labels.addView(edit, editParams);
        }

        void bind(int position) {
            Item item = selection.get(position);
            checked.setOnCheckedChangeListener(null);
            checked.setChecked(item.selected());
            checked.setContentDescription(item.title());
            checked.setOnCheckedChangeListener((button, selected) -> {
                selection.select(position, selected);
                changed();
            });
            setOnClickListener(view -> checked.toggle());
            index.setText(Integer.toString(item.index()));
            title.setText(item.title());
            int limit = Math.min(selection.heightLimit, item.heightLimit());
            String type = item.audioOnly() ? str("revanced_offline_batch_audio")
                    : str("revanced_offline_batch_video", heightLabel(limit));
            format.setText(type + (item.alreadyDownloaded() ? " · " + str("revanced_offline_already_downloaded") : ""));
            duration.setText(item.lengthMs() > 0 ? OfflineLibraryScreen.formatDuration(item.lengthMs()) : "");
            duration.setVisibility(item.lengthMs() > 0 ? VISIBLE : GONE);
            edit.setOnClickListener(view -> edit(position));
            loadThumbnail(item.videoId());
        }

        private void loadThumbnail(String videoId) {
            imageKey = videoId;
            Bitmap cached = thumbnails.get(videoId);
            image.setImageBitmap(cached);
            if (cached != null || !loading.add(videoId)) return;
            Utils.runOnBackgroundThread(() -> {
                Bitmap bitmap = OfflinePickerSheet.fetchThumbnail(
                        "https://i.ytimg.com/vi/" + videoId + "/mqdefault.jpg");
                loading.remove(videoId);
                if (bitmap == null) return;
                thumbnails.put(videoId, bitmap);
                Utils.runOnMainThread(() -> {
                    if (active.getAsBoolean() && videoId.equals(imageKey)) image.setImageBitmap(bitmap);
                });
            });
        }
    }
}
