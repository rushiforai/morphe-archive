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
 * A running count over a save of several files, with a way to stop it.
 *
 * <p>Saving a dozen original photos, a story's photos or a video with its sound and subtitles
 * ran fire-and-toast: a slow save looked like a failed one, and nothing short of killing TikTok
 * could stop it. From {@link #MIN_FILES} files up, a row in the banner's place says which file
 * is being saved and offers Cancel, which lets the file under way finish and leaves the rest.
 * The row is read out once when it appears, once when Cancel is pressed and the result once at
 * the end, not on every file; the count changes silently in between.
 */
final class SaveProgress {
    /** Below this many files a save is over before a row would help. */
    static final int MIN_FILES = 3;
    /** Room under the row for a banner (a block's Undo, a finished save) to appear beneath it. */
    private static final int ABOVE_BANNER_DP = 56;
    /** Each further row of a save running at the same time sits this much higher than the last. */
    private static final int ROW_STACK_DP = 56;
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
    private final AtomicBoolean cancelled = new AtomicBoolean();
    private volatile boolean finished;
    private volatile View row;
    private volatile TextView count;

    private SaveProgress(int total) {
        this.total = total;
    }

    /** A progress row for {@code total} files, or a silent one below {@link #MIN_FILES}. */
    static SaveProgress begin(int total) {
        SaveProgress progress = new SaveProgress(total);
        if (total >= MIN_FILES) progress.show();
        return progress;
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
                String text = L10n.f("Saving %1$s of %2$s", String.valueOf(1), String.valueOf(total));
                label.setText(text);
                label.setTextColor(SettingsUi.OVERLAY_TEXT);
                label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                banner.addView(label, new LinearLayout.LayoutParams(0, -2, 1f));

                TextView stop = new TextView(activity);
                String cancelLabel = L10n.t(activity, "Cancel");
                stop.setText(cancelLabel);
                stop.setContentDescription(cancelLabel);
                stop.setTextColor(SettingsUi.OVERLAY_ACCENT);
                stop.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                stop.setPadding(SettingsUi.dp(activity, 16), SettingsUi.dp(activity, 12),
                        SettingsUi.dp(activity, 16), SettingsUi.dp(activity, 12));
                stop.setMinimumHeight(SettingsUi.dp(activity, 48));
                stop.setMinimumWidth(SettingsUi.dp(activity, 48));
                stop.setGravity(Gravity.CENTER);
                stop.setBackground(SettingsUi.overlayAction(activity, SettingsUi.RADIUS_OVERLAY));
                stop.setFocusable(true);
                SettingsUi.markAsButton(stop);
                stop.setOnClickListener(view -> cancel());
                banner.addView(stop, new LinearLayout.LayoutParams(-2, -2));

                // Above where a banner goes, so a finished save or a block's Undo can show
                // beneath a save still running, and above any row already up.
                FrameLayout.LayoutParams params = BlockAuthorOverlay.bannerParams(activity, root);
                params.bottomMargin += SettingsUi.dp(activity, ABOVE_BANNER_DP + ROW_STACK_DP * LIVE_ROWS.size());
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
                root.addView(banner);
                LIVE_ROWS.add(banner);
                row = banner;
                count = label;
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
    }

    private void showCount(int current) {
        Utils.runOnMainThread(() -> {
            TextView view = count;
            if (view == null || cancelled.get()) return;
            view.setText(L10n.f("Saving %1$s of %2$s", String.valueOf(current), String.valueOf(total)));
        });
    }

    private void dismiss() {
        finished = true;
        Utils.runOnMainThread(() -> {
            View view = row;
            row = null;
            count = null;
            if (view == null) return;
            LIVE_ROWS.remove(view);
            if (view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
        });
    }

    private static void announce(View view, String text) {
        List<String> log = announcementsForTests;
        if (log != null) log.add(text);
        view.announceForAccessibility(text);
    }
}
