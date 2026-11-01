package dev.jason.gboardpatches.extension.extendeddictionary;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Modal progress for one import/remove job; re-attachable after the Activity is recreated. */
final class ExtendedDictionaryProgressDialog {
    private static final String TAG = "GboardExtendedDictionary";
    static final String UNKNOWN_REMAINING = "…";
    private static final int RING_SIZE_DP = 72;
    private static final int RING_STROKE_DP = 6;
    private static final int PADDING_DP = 24;

    /** Process-wide state of a running job; view fields are touched on the main thread only. */
    /** Immutable progress state handed from the worker to the main thread. */
    static final class Snapshot {
        final PhasedEta.Phase phase;
        final int done;
        final int total;
        final long remainingSeconds;
        final float overallFraction;

        Snapshot(PhasedEta.Phase phase, int done, int total, long remainingSeconds,
                float overallFraction) {
            this.phase = phase;
            this.done = done;
            this.total = total;
            this.remainingSeconds = remainingSeconds;
            this.overallFraction = overallFraction;
        }
    }

    static final class Job {
        final int titleResId;
        final boolean cancellable;
        final AtomicBoolean cancel = new AtomicBoolean();
        final AtomicReference<Object> attachedHost = new AtomicReference<>();
        final long startNanos = System.nanoTime();
        final String kind;
        final PhasedEta eta;
        /** The only state the UI reads; replaced as a whole, never mutated. */
        final AtomicReference<Snapshot> snapshot = new AtomicReference<>();
        volatile boolean finished;
        /** Only a successful job ends on a full ring; others keep the fraction they reached. */
        volatile boolean succeeded;
        Runnable view;

        Job(int titleResId, boolean cancellable) {
            this(titleResId, cancellable, "test", java.util.Collections.emptyList(),
                    java.util.Collections.emptyMap());
        }

        Job(int titleResId, boolean cancellable, String kind,
                java.util.List<PhasedEta.Phase> plan,
                java.util.Map<PhasedEta.Phase, Double> knownRates) {
            this.titleResId = titleResId;
            this.cancellable = cancellable;
            this.kind = kind;
            this.eta = new PhasedEta(plan, knownRates);
        }

        void onProgress(int done, int total) {
            onProgress(PhasedEta.Phase.INSERT, done, total);
        }

        /**
         * The single writer of progress: the phase count, the time estimate and the overall
         * work fraction are computed together and published as one snapshot. The fraction comes
         * from work done (never from time), so it only grows; the time estimate may move.
         */
        synchronized void onProgress(PhasedEta.Phase phase, int done, int total) {
            long now = System.nanoTime();
            eta.sample(phase, now, done, total);
            snapshot.set(new Snapshot(phase, done, total, eta.remainingSeconds(now),
                    eta.workFraction()));
        }

        /** The work is over; on success 100% is published before the dialog goes away. */
        synchronized void complete(boolean success) {
            succeeded = success;
            if (!success) {
                return;
            }
            eta.markComplete();
            Snapshot previous = snapshot.get();
            snapshot.set(previous == null
                    ? new Snapshot(PhasedEta.Phase.INSERT, 0, 0, 0L, 1f)
                    : new Snapshot(previous.phase, previous.total, previous.total, 0L, 1f));
        }

        /** Main thread only. Never throws, and drops every UI reference once finished. */
        void render() {
            Runnable current = view;
            try {
                if (current != null) {
                    current.run();
                }
            } catch (RuntimeException failure) {
                Log.w(TAG, "Progress dialog update failed: " + failure.getClass().getName());
                view = null;
            }
            if (finished) {
                view = null;
                attachedHost.set(null);
            }
        }
    }

    /** True when the host Activity can no longer show or dismiss its windows. */
    static boolean isHostGone(Context context) {
        return context instanceof Activity activity
                && (activity.isFinishing() || activity.isDestroyed());
    }

    private ExtendedDictionaryProgressDialog() {
    }

    static String remainingText(Context context, long seconds) {
        return seconds < 0 ? UNKNOWN_REMAINING : GboardSettingsText.format(context,
                R.string.gboard_patches_extended_dictionary_progress_remaining, seconds);
    }

    static final long COMPLETE_HOLD_MS = 400L;
    private static final float PERCENT_TEXT_SP = 22f;
    private static final float DETAIL_TEXT_SP = 12f;

    /** Whole percent, rounded down so 100% only appears when the work really is complete. */
    static String percentText(float fraction) {
        int percent = (int) Math.floor(Math.max(0f, Math.min(1f, fraction)) * 100f);
        return percent + "%";
    }

    private static void dismissSafely(Context context, AlertDialog dialog) {
        if (isHostGone(context)) {
            return;
        }
        try {
            dialog.dismiss();
        } catch (RuntimeException failure) {
            Log.w(TAG, "Progress dialog dismiss failed: " + failure.getClass().getName());
        }
    }

    static String phaseLabel(Context context, PhasedEta.Phase phase) {
        int label = switch (phase) {
            case PARSE -> R.string.gboard_patches_extended_dictionary_phase_parse;
            case REPAIR -> R.string.gboard_patches_extended_dictionary_phase_repair;
            case RECONCILE -> R.string.gboard_patches_extended_dictionary_phase_reconcile;
            case DEDUPE -> R.string.gboard_patches_extended_dictionary_phase_dedupe;
            case INSERT -> R.string.gboard_patches_extended_dictionary_phase_insert;
            case STORE_WRITE -> R.string.gboard_patches_extended_dictionary_phase_save;
            case DELETE -> R.string.gboard_patches_extended_dictionary_phase_delete;
        };
        return GboardSettingsText.get(context, label);
    }

    static String countText(int done, int total) {
        return String.format(Locale.ROOT, "%d / %d", done, total);
    }

    static GboardPatchesSettingsContract.ManagedDialogAction create(Context context, Job job) {
        return onDismiss -> {
            if (isHostGone(context) || job.finished) {
                job.attachedHost.compareAndSet(context, null);
                return false;
            }
            LinearLayout layout = new LinearLayout(context);
            layout.setOrientation(LinearLayout.VERTICAL);
            layout.setGravity(Gravity.CENTER_HORIZONTAL);
            int padding = dp(context, PADDING_DP);
            layout.setPadding(padding, padding, padding, padding);
            ProgressRing ring = new ProgressRing(context);
            layout.addView(ring, new LinearLayout.LayoutParams(
                    dp(context, RING_SIZE_DP), dp(context, RING_SIZE_DP)));
            TextView percent = new TextView(context);
            percent.setGravity(Gravity.CENTER);
            percent.setPadding(0, padding / 2, 0, 0);
            percent.setTextSize(TypedValue.COMPLEX_UNIT_SP, PERCENT_TEXT_SP);
            layout.addView(percent);
            TextView remaining = new TextView(context);
            remaining.setGravity(Gravity.CENTER);
            layout.addView(remaining);
            TextView count = new TextView(context);
            count.setGravity(Gravity.CENTER);
            count.setTextSize(TypedValue.COMPLEX_UNIT_SP, DETAIL_TEXT_SP);
            layout.addView(count);
            boolean[] dismissScheduled = {false};

            AlertDialog.Builder builder = new AlertDialog.Builder(context)
                    .setTitle(GboardSettingsText.get(context, job.titleResId))
                    .setView(layout)
                    .setCancelable(false);
            if (job.cancellable) {
                builder.setNegativeButton(
                        GboardSettingsText.get(context, R.string.gboard_patches_dialog_cancel),
                        null);
            }
            AlertDialog dialog = builder.create();
            dialog.setCanceledOnTouchOutside(false);
            Runnable[] self = new Runnable[1];
            Runnable update = () -> {
                if (isHostGone(context)) {
                    if (job.view == self[0]) {
                        job.view = null;
                    }
                    job.attachedHost.compareAndSet(context, null);
                    return;
                }
                if (job.finished && !job.succeeded) {
                    dismissSafely(context, dialog);
                    return;
                }
                if (job.finished) {
                    // Show the full ring briefly, then close.
                    ring.setFraction(1f);
                    percent.setText(percentText(1f));
                    remaining.setText("");
                    if (!dismissScheduled[0]) {
                        dismissScheduled[0] = true;
                        ring.postDelayed(() -> dismissSafely(context, dialog), COMPLETE_HOLD_MS);
                    }
                    return;
                }
                // One read of one immutable snapshot: no field can come from another update.
                Snapshot state = job.snapshot.get();
                float fraction = state == null ? 0f : state.overallFraction;
                ring.setFraction(fraction);
                percent.setText(percentText(fraction));
                count.setText(state == null ? "" : phaseLabel(context, state.phase) + ": "
                        + countText(state.done, state.total));
                remaining.setText(job.cancel.get()
                        ? GboardSettingsText.get(context,
                                R.string.gboard_patches_extended_dictionary_progress_cancelling)
                        : remainingText(context, state == null ? -1L : state.remainingSeconds));
            };
            self[0] = update;
            dialog.setOnDismissListener(ignored -> {
                if (job.view == update) {
                    job.view = null;
                }
                try {
                    onDismiss.run();
                } catch (Throwable failure) {
                    Log.w(TAG, "Failed to dismiss progress dialog", failure);
                }
            });
            job.view = update;
            dialog.show();
            Button cancel = dialog.getButton(AlertDialog.BUTTON_NEGATIVE);
            if (cancel != null) {
                cancel.setOnClickListener(button -> {
                    job.cancel.set(true);
                    button.setEnabled(false);
                    job.render();
                });
            }
            job.render();
            return true;
        };
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    /** Determinate circular progress drawn as an arc over a faint track. */
    static final class ProgressRing extends View {
        private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint arc = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF bounds = new RectF();
        private float fraction;

        ProgressRing(Context context) {
            super(context);
            float stroke = dp(context, RING_STROKE_DP);
            TypedValue accent = new TypedValue();
            int color = context.getTheme().resolveAttribute(
                    android.R.attr.colorAccent, accent, true) ? accent.data : 0xFF1A73E8;
            for (Paint paint : new Paint[] {track, arc}) {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(stroke);
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setColor(color);
            }
            track.setAlpha(48);
        }

        void setFraction(float value) {
            fraction = Math.max(0f, Math.min(1f, value));
            invalidate();
        }

        float getFraction() {
            return fraction;
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float inset = arc.getStrokeWidth() / 2f;
            bounds.set(inset, inset, getWidth() - inset, getHeight() - inset);
            canvas.drawArc(bounds, 0f, 360f, false, track);
            canvas.drawArc(bounds, -90f, 360f * fraction, false, arc);
        }
    }
}
