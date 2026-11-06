/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.view.View;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.Switch;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.BooleanSupplier;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.sponsorblock.objects.SegmentCategory;
import app.morphe.extension.youtube.sponsorblock.requests.SBRequester;

/** Download-scoped choices and segment snapshots; never changes the online player's category list. */
final class OfflineSponsorBlock {
    record Result(SBRequester.DownloadStatus status, List<OfflineSponsorSegments.Segment> segments, long durationMs) {
    }

    record Selection(boolean include, List<String> categories, Result result) {
    }

    static Result fetch(String videoId) {
        SBRequester.DownloadSegments result = SBRequester.getSegments(videoId, OfflineSponsorSegments.CATEGORIES);
        List<OfflineSponsorSegments.Segment> segments = OfflineSponsorSegments.fromJson(result.segments(), true);
        SBRequester.DownloadStatus status = result.status() == SBRequester.DownloadStatus.OK && segments.isEmpty()
                ? SBRequester.DownloadStatus.NONE : result.status();
        return new Result(status, segments, result.durationMs());
    }

    static void save(OfflineVideo video, Selection selection, Result result) {
        if (!selection.include()) return;
        video.sponsorChecked = result.status() != SBRequester.DownloadStatus.ERROR;
        video.sponsorDurationMs = result.durationMs();
        video.sponsorCategories = selection.categories();
        video.sponsorSegments = result.segments();
    }

    static String behavior(String key) {
        SegmentCategory category = SegmentCategory.byCategoryKey(key);
        return category == null ? "ignore" : category.behaviorSetting.get();
    }

    static final class Picker {
        private final Set<String> categories = new LinkedHashSet<>();
        private final boolean batch;
        private boolean include = Settings.OFFLINE_SPONSORBLOCK_INCLUDE.get();
        private Result result;
        private Activity activity;
        private LinearLayout container;
        private int foreground;
        private final BooleanSupplier active;

        Picker(boolean batch, BooleanSupplier active) {
            this.batch = batch;
            this.active = active;
            for (String key : OfflineSponsorSegments.CATEGORIES) {
                if (!"ignore".equals(behavior(key))) categories.add(key);
            }
        }

        void fetch(String videoId) {
            Utils.runOnBackgroundThread(() -> {
                Result fetched = OfflineSponsorBlock.fetch(videoId);
                Utils.runOnMainThread(() -> {
                    if (!active.getAsBoolean()) return;
                    result = fetched;
                    render();
                });
            });
        }

        void add(Activity activity, LinearLayout parent, int foreground) {
            this.activity = activity;
            this.foreground = foreground;
            container = new LinearLayout(activity);
            container.setOrientation(LinearLayout.VERTICAL);
            parent.addView(container);
            render();
        }

        Selection selection() {
            boolean available = batch || (result != null && result.status() == SBRequester.DownloadStatus.OK);
            return new Selection(include && available, List.copyOf(categories), result);
        }

        private void render() {
            if (container == null || !active.getAsBoolean()) return;
            container.removeAllViews();
            boolean available = batch || (result != null && result.status() == SBRequester.DownloadStatus.OK);
            String summary = batch ? "revanced_offline_sponsorblock_summary"
                    : result == null ? "revanced_offline_sponsorblock_loading"
                    : switch (result.status()) {
                        case OK -> "revanced_offline_sponsorblock_summary";
                        case NONE -> "revanced_offline_sponsorblock_none";
                        case ERROR -> "revanced_offline_sponsorblock_error";
                    };
            Switch toggle = OfflineUi.toggleRow(activity, container, "sponsorblock",
                    str("revanced_offline_sponsorblock_include"), str(summary), foreground, available, include);
            LinearLayout choices = new LinearLayout(activity);
            choices.setOrientation(LinearLayout.VERTICAL);
            choices.setVisibility(toggle.isChecked() ? View.VISIBLE : View.GONE);
            container.addView(choices);
            for (String key : OfflineSponsorSegments.CATEGORIES) {
                SegmentCategory category = SegmentCategory.byCategoryKey(key);
                if (category == null) continue;
                CheckBox box = new CheckBox(activity);
                box.setText(category.title.toString());
                box.setTextColor(foreground);
                box.setButtonTintList(ColorStateList.valueOf(Color.parseColor(category.colorSetting.get())));
                box.setPadding(Utils.dipToPixels(48), 0, Utils.dipToPixels(16), 0);
                box.setChecked(categories.contains(key));
                box.setOnCheckedChangeListener((button, checked) -> {
                    if (checked) categories.add(key);
                    else categories.remove(key);
                });
                choices.addView(box);
            }
            toggle.setOnCheckedChangeListener((button, checked) -> {
                include = checked;
                Settings.OFFLINE_SPONSORBLOCK_INCLUDE.save(checked);
                choices.setVisibility(checked ? View.VISIBLE : View.GONE);
            });
        }
    }

    private OfflineSponsorBlock() {
    }
}
