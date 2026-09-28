/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.download;

import android.app.Activity;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ProgressBar;
import android.content.res.ColorStateList;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.blockauthor.BlockAuthorOverlay;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * A running count for several files and optional stream progress for a video save.
 *
 * <p>Saving a dozen original photos, a story's photos or a video with its sound and subtitles
 * ran fire-and-toast: a slow save looked like a failed one, and nothing short of killing TikTok
 * could stop it. From {@link #MIN_FILES} files up, a row in the banner's place says which file
 * is being saved and offers Cancel, which lets the file under way finish and leaves the rest.
 * The row is read out once when it appears, once when Cancel is pressed and the result once at
 * the end, not on every file; the count changes silently in between.
 */
final class SaveProgress {
    /** The default count row starts here; optional stream progress also covers smaller saves. */
    static final int MIN_FILES = 3;
    /** Room under the row for a banner (a block's Undo, a finished save) to appear beneath it. */
    private static final int ABOVE_BANNER_DP = 56;
    /** Space between simultaneous saves, in addition to each measured row height. */
    private static final int ROW_GAP_DP = 8;
    /** The rows up right now, main thread only, so two saves at once do not share pixels. */
    private static final List<View> LIVE_ROWS = new ArrayList<>();
    /** For the tests: what the row said aloud, in order. Null keeps it to the phone. */
    static volatile List<String> announcementsForTests;

    interface Step {
        /** Saves file {@code index}, counted from 0; throwing skips that file. */
        void save(int index) throws IOException;
    }

    /** Why a run ended before its last file when it was not Cancel. */
    enum Stop { NONE, NO_SPACE, NO_TIME }

    /** What a run of steps came to. */
    static final class Outcome {
        final int total;
        final int saved;
        final int skipped;
        final int cancelled;
        final Stop stop;

        Outcome(int total, int saved, int skipped, int cancelled) {
            this(total, saved, skipped, cancelled, Stop.NONE);
        }

        Outcome(int total, int saved, int skipped, int cancelled, Stop stop) {
            this.total = total;
            this.saved = saved;
            this.skipped = skipped;
            this.cancelled = cancelled;
            this.stop = stop;
        }

        boolean complete() {
            return saved == total;
        }
    }

    private final int total;
    private final boolean showTransfer;
    private volatile int current = 1;
    private volatile int percent = -1;
    private volatile ProgressBar transferBar;
    private final AtomicBoolean cancelled = new AtomicBoolean();
    private volatile boolean finished;
    private volatile View row;
    private volatile TextView count;

    private SaveProgress(int total, boolean showTransfer) {
        this.total = total;
        this.showTransfer = showTransfer;
    }

    /** A progress row for {@code total} files, or a silent one below {@link #MIN_FILES}. */
    static SaveProgress begin(int total) {
        return begin(total, false);
    }

    static SaveProgress begin(int total, boolean showTransfer) {
        SaveProgress progress = new SaveProgress(total, showTransfer);
        if (total >= MIN_FILES || showTransfer) progress.show();
        return progress;
    }

    /** The current stream, not an estimate of later streams, muxing or publication. */
    void transfer(long bytes, long expected) {
        if (!showTransfer || finished || cancelled.get()) return;
        int next = expected <= 0 ? -1 : (int) Math.max(0, Math.min(99, bytes * 100.0 / expected));
        if (next == percent) return;
        percent = next;
        updateTransfer();
    }

    private String progressText() {
        if (percent < 0) return total == 1 ? L10n.t("Saving video")
                : L10n.f("Saving %1$s of %2$s", String.valueOf(current), String.valueOf(total));
        String value = java.text.NumberFormat.getPercentInstance().format(percent / 100.0);
        return total == 1 ? L10n.f("Saving video: %1$s", value)
                : L10n.f("Saving %1$s of %2$s: %3$s", String.valueOf(current), String.valueOf(total), value);
    }

    private void updateTransfer() {
        Utils.runOnMainThread(() -> {
            if (count == null || cancelled.get() || finished) return;
            count.setText(progressText());
            ProgressBar bar = transferBar;
            if (bar != null) {
                bar.setIndeterminate(percent < 0);
                if (percent >= 0) bar.setProgress(percent);
            }
        });
    }

    int total() {
        return total;
    }

    boolean isCancelled() {
        return cancelled.get();
    }

    /** Stops after the file under way. The row says so, aloud once, until that file is done. */
    void cancel() {
        if (!cancelled.compareAndSet(false, true)) return;
        Utils.runOnMainThread(() -> {
            TextView view = count;
            if (view == null) return;
            String text = L10n.t("Stopping after this file");
            view.setText(text);
            announce(view, text);
        });
    }

    /**
     * Runs {@code step} for each file until cancelled, counting what came of each, and takes
     * the row down. A step that throws is a skipped file, not the end of the save: the photos
     * after a bad one still land, and the result says how many did not. A refusal from the disk
     * or the clock is the end of it, since every file after would fail the same way.
     */
    Outcome run(Step step) {
        int saved = 0;
        int skipped = 0;
        int index = 0;
        Stop stop = Stop.NONE;
        try {
            for (; index < total; index++) {
                if (isCancelled()) break;
                showCount(index + 1);
                try {
                    step.save(index);
                    saved++;
                } catch (MediaBudget.StopException refusal) {
                    int which = index + 1;
                    Logger.printException(() -> "The save stopped at file " + which + " of " + total, refusal);
                    stop = refusal.space ? Stop.NO_SPACE : Stop.NO_TIME;
                    break;
                } catch (IOException | RuntimeException failure) {
                    int which = index + 1;
                    Logger.printException(() -> "File " + which + " of " + total + " was not saved", failure);
                    skipped++;
                }
            }
        } finally {
            dismiss();
        }
        return new Outcome(total, saved, skipped, total - index, stop);
    }

    /** {@code complete} when every file landed, otherwise what did and what did not, and why. */
    static String message(Outcome outcome, String complete) {
        if (outcome.complete()) return complete;
        String saved = String.valueOf(outcome.saved);
        String total = String.valueOf(outcome.total);
        String skipped = String.valueOf(outcome.skipped);
        if (outcome.stop == Stop.NO_SPACE) return L10n.f("Saved %1$s of %2$s, the rest need more free space", saved, total);
        if (outcome.stop == Stop.NO_TIME) return L10n.f("Saved %1$s of %2$s, the rest ran out of time", saved, total);
        if (outcome.cancelled > 0 && outcome.skipped > 0) {
            return L10n.f("Saved %1$s of %2$s, %3$s skipped and the rest cancelled", saved, total, skipped);
        }
        if (outcome.cancelled > 0) return L10n.f("Saved %1$s of %2$s, the rest cancelled", saved, total);
        return L10n.f("Saved %1$s of %2$s, %3$s skipped", saved, total, skipped);
    }

    private void show() {
        // Not at once: a save starts as TikTok swaps its share sheet away, and a row put on the
        // window on top at that instant goes with the sheet, unseen (the save banner learnt this
        // first and waits the same). A save that is over inside the wait never gets a row.
        Utils.runOnMainThreadDelayed(() -> {
            if (finished) return;
            try {
                Activity activity = Utils.getActivity();
                if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
                ViewGroup root = SaveNotice.topWindowRoot(activity);
                if (root == null) root = activity.findViewById(android.R.id.content);
                if (root == null) return;

                LinearLayout banner = new LinearLayout(activity);
                banner.setOrientation(LinearLayout.HORIZONTAL);
                banner.setGravity(Gravity.CENTER_VERTICAL);
                banner.setPadding(SettingsUi.dp(activity, 16), SettingsUi.dp(activity, 12),
                        SettingsUi.dp(activity, 16), SettingsUi.dp(activity, 12));
                banner.setBackground(SettingsUi.overlayBanner(activity));
                banner.setTag("hushfeed_save_progress");

                TextView label = new TextView(activity);
                String text = progressText();
                label.setText(text);
                label.setTextColor(SettingsUi.OVERLAY_TEXT);
                label.setTextSize(TypedValue.COMPLEX_UNIT_SP, SettingsUi.TEXT_BODY_SMALL);
                if (showTransfer) {
                    LinearLayout body = new LinearLayout(activity);
                    body.setOrientation(LinearLayout.VERTICAL);
                    body.addView(label, new LinearLayout.LayoutParams(-1, -2));
                    ProgressBar bar = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
                    bar.setMax(100);
                    bar.setIndeterminate(percent < 0);
                    if (percent >= 0) bar.setProgress(percent);
                    bar.setProgressTintList(ColorStateList.valueOf(SettingsUi.OVERLAY_ACCENT));
                    bar.setIndeterminateTintList(ColorStateList.valueOf(SettingsUi.OVERLAY_ACCENT));
                    // The adjacent text gives its value to TalkBack without per-byte announcements.
                    bar.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                    LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(-1, SettingsUi.dp(activity, 4));
                    barParams.topMargin = SettingsUi.dp(activity, 8);
                    body.addView(bar, barParams);
                    transferBar = bar;
                    banner.addView(body, new LinearLayout.LayoutParams(0, -2, 1f));
                } else {
                    banner.addView(label, new LinearLayout.LayoutParams(0, -2, 1f));
                }

                TextView stop = new TextView(activity);
                String cancelLabel = L10n.t(activity, "Cancel");
                stop.setText(cancelLabel);
                stop.setContentDescription(cancelLabel);
                stop.setTextColor(SettingsUi.OVERLAY_ACCENT);
                stop.setTextSize(TypedValue.COMPLEX_UNIT_SP, SettingsUi.TEXT_BODY_SMALL);
                stop.setPadding(SettingsUi.dp(activity, 16), SettingsUi.dp(activity, 12),
                        SettingsUi.dp(activity, 16), SettingsUi.dp(activity, 12));
                stop.setMinimumHeight(SettingsUi.dp(activity, 48));
                stop.setMinimumWidth(SettingsUi.dp(activity, 48));
                stop.setGravity(Gravity.CENTER);
                stop.setBackground(SettingsUi.overlayAction(activity, SettingsUi.RADIUS_OVERLAY));
                stop.setFocusable(true);
                SettingsUi.markAsButton(stop);
                stop.setOnClickListener(view -> cancel());
                // Cancel stops after the current file. A single file has no later work to cancel.
                if (total > 1) banner.addView(stop, new LinearLayout.LayoutParams(-2, -2));

                // Above where a banner goes, so a finished save or a block's Undo can show
                // beneath a save still running, and above any row already up.
                FrameLayout.LayoutParams params = BlockAuthorOverlay.bannerParams(activity, root);
                params.bottomMargin += SettingsUi.dp(activity, ABOVE_BANNER_DP);
                banner.setLayoutParams(params);
                // Should the window it sits on go away with the save still running (a sheet
                // closing late), the row moves to the activity's own content.
                banner.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View view) {
                    }

                    @Override public void onViewDetachedFromWindow(View view) {
                        if (row != view) return;
                        Utils.runOnMainThread(() -> rehome(activity, view));
                    }
                });
                banner.addOnLayoutChangeListener((view, left, top, right, bottom,
                        oldLeft, oldTop, oldRight, oldBottom) -> {
                    if (bottom - top != oldBottom - oldTop) placeRows();
                });
                root.addView(banner);
                LIVE_ROWS.add(banner);
                row = banner;
                count = label;
                placeRows();
                // Said once here, by hand; the count is not a live region, so the files that
                // follow change it without a word, and the result is the banner's to announce.
                announce(banner, text);
            } catch (Throwable failure) {
                Logger.printException(() -> "Could not show the save progress row", failure);
            }
        }, SaveNotice.SHEET_SETTLE_MS);
    }

    private void rehome(Activity activity, View view) {
        if (row != view || activity.isFinishing() || activity.isDestroyed()) return;
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null || view.getParent() == content) return;
        if (view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
        content.addView(view);
        placeRows();
    }

    /** A translated label or larger text can make a row taller than the default spacing. */
    private static void placeRows() {
        for (View view : LIVE_ROWS) {
            if (!(view.getParent() instanceof ViewGroup)) continue;
            ViewGroup root = (ViewGroup) view.getParent();
            Activity activity = (Activity) view.getContext();
            int bottom = BlockAuthorOverlay.bannerParams(activity, root).bottomMargin
                    + SettingsUi.dp(activity, ABOVE_BANNER_DP);
            for (View previous : LIVE_ROWS) {
                if (previous == view) break;
                if (previous.getParent() == root) bottom += previous.getHeight() + SettingsUi.dp(activity, ROW_GAP_DP);
            }
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) view.getLayoutParams();
            if (params.bottomMargin != bottom) {
                params.bottomMargin = bottom;
                view.setLayoutParams(params);
            }
        }
    }

    private void showCount(int current) {
        this.current = current;
        percent = -1;
        updateTransfer();
    }

    private void dismiss() {
        finished = true;
        Utils.runOnMainThread(() -> {
            View view = row;
            row = null;
            count = null;
            transferBar = null;
            if (view == null) return;
            LIVE_ROWS.remove(view);
            if (view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
            placeRows();
        });
    }

    private static void announce(View view, String text) {
        List<String> log = announcementsForTests;
        if (log != null) log.add(text);
        view.announceForAccessibility(text);
    }
}
