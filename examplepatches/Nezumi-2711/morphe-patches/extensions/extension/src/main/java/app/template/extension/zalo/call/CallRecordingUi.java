package app.template.extension.zalo.call;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import java.util.Locale;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.settings.NezumiPrefs;
import app.template.extension.zalo.shared.ZaloEnv;

/**
 * In-call record button and "REC mm:ss" label, added next to the minimise button at the top of
 * ZmInCallActivity. Rebuilt every time the activity rebuilds that button, then driven by
 * {@link CallRecorder}'s state so it always reflects reality.
 */
public final class CallRecordingUi {
    private CallRecordingUi() { }

    private static final String TAG_BUTTON = "nezumi-rec-button";
    private static final String TAG_LABEL = "nezumi-rec-label";

    /** Called at the end of ZmInCallActivity.j0() with the freshly added minimise button. */
    public static void attach(View minimize) {
        try {
            Activity activity = minimize == null ? null : ZaloEnv.activityOf(minimize.getContext());
            if (activity == null || minimize == null || !(minimize.getParent() instanceof FrameLayout)) return;
            FrameLayout root = (FrameLayout) minimize.getParent();
            purge(activity, root);
            View existingCluster = cluster(activity, root);
            if (existingCluster instanceof ViewGroup) purge(activity, (ViewGroup) existingCluster);
            final int generation = ++installGeneration;
            if (!NezumiPrefs.bool(activity, NezumiPrefs.CALL_RECORDING, true)) return;

            FrameLayout.LayoutParams reference = (FrameLayout.LayoutParams) minimize.getLayoutParams();
            int size = reference.width > 0 ? reference.width : dp(activity, 36);
            int edge = Math.max(reference.leftMargin, dp(activity, 8));

            RecordIconDrawable icon = new RecordIconDrawable();
            ImageView button = new ImageView(activity);
            button.setTag(TAG_BUTTON);
            button.setImageDrawable(icon);
            int pad = dp(activity, 7);
            button.setPadding(pad, pad, pad, pad);
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(0x33000000);
            button.setBackground(circle);
            button.setContentDescription("Record call");
            FrameLayout.LayoutParams fallbackButton = new FrameLayout.LayoutParams(size, size,
                Gravity.TOP | Gravity.END);
            fallbackButton.topMargin = reference.topMargin;
            fallbackButton.rightMargin = edge;
            fallbackButton.setMarginEnd(edge);

            TextView label = new TextView(activity);
            label.setTag(TAG_LABEL);
            label.setTextColor(0xFFFF3B30);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            label.setTypeface(label.getTypeface(), android.graphics.Typeface.BOLD);
            label.setGravity(Gravity.CENTER);
            label.setSingleLine(true);
            label.setId(View.generateViewId());
            label.setVisibility(View.GONE);
            FrameLayout.LayoutParams fallbackLabel = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, size, Gravity.TOP | Gravity.END);
            fallbackLabel.topMargin = reference.topMargin;
            fallbackLabel.setMarginEnd(edge + size + dp(activity, 8));
            fallbackLabel.rightMargin = fallbackLabel.getMarginEnd();
            install(activity, root, button, label, fallbackButton, fallbackLabel, size, generation, 0);

            Runnable[] tick = new Runnable[1];
            tick[0] = () -> {
                try {
                    boolean recording = CallRecorder.isRecording();
                    icon.setActive(recording);
                    int visibility = minimize.getVisibility() == View.VISIBLE ? View.VISIBLE : View.INVISIBLE;
                    button.setVisibility(visibility);
                    button.setEnabled(visibility == View.VISIBLE);
                    label.setVisibility(recording ? View.VISIBLE : View.GONE);
                    placeLabel(activity, label);
                    if (recording) {
                        long seconds = CallRecorder.elapsedMs() / 1000;
                        label.setText(String.format(Locale.US, "● REC %02d:%02d", seconds / 60, seconds % 60));
                    }
                } catch (RuntimeException failure) {
                    NezumiLog.w(Patch.CALL_RECORDING, "CallRecordingUi", "ui tick failed", failure);
                }
                if (button.isAttachedToWindow()) button.postDelayed(tick[0], 500);
            };
            button.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(View view) {
                    view.removeCallbacks(tick[0]);
                    view.post(tick[0]);
                }

                @Override public void onViewDetachedFromWindow(View view) {
                    view.removeCallbacks(tick[0]);
                }
            });
            button.setOnClickListener(view -> {
                CallRecorder.toggle(activity);
                button.removeCallbacks(tick[0]);
                tick[0].run();
            });
            tick[0].run();
        } catch (Throwable failure) {
            NezumiLog.e(Patch.CALL_RECORDING, "CallRecordingUi", "attach failed", failure);
        }
    }

    private static int installGeneration;

    private static View cluster(Activity activity, FrameLayout root) {
        int id = activity.getResources().getIdentifier("call_groupMiniButton", "id", activity.getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    /** Put the views into Zalo's top-right button cluster (retrying while it is built); else float them. */
    private static void install(Activity activity, FrameLayout root, View button, View label,
            FrameLayout.LayoutParams fallbackButton, FrameLayout.LayoutParams fallbackLabel,
            int size, int generation, int attempt) {
        root.post(() -> {
            try {
                if (generation != installGeneration) return;
                View found = cluster(activity, root);
                if (found instanceof android.widget.LinearLayout) {
                    android.widget.LinearLayout group = (android.widget.LinearLayout) found;
                    android.widget.LinearLayout.LayoutParams labelParams = new android.widget.LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, size);
                    labelParams.gravity = Gravity.CENTER_VERTICAL;
                    labelParams.rightMargin = dp(activity, 5);
                    android.widget.LinearLayout.LayoutParams buttonParams = new android.widget.LinearLayout.LayoutParams(size, size);
                    buttonParams.gravity = Gravity.CENTER_VERTICAL;
                    buttonParams.rightMargin = dp(activity, 5);
                    group.addView(button, 0, buttonParams);
                    // Fallback home until placeLabel finds a call timer to sit under.
                    if (label.getParent() == null) group.addView(label, 0, labelParams);
                } else if (attempt < 10) {
                    root.postDelayed(() -> install(activity, root, button, label, fallbackButton,
                        fallbackLabel, size, generation, attempt + 1), 100);
                } else {
                    NezumiLog.w(Patch.CALL_RECORDING, "CallRecordingUi", "cluster not found, using floating placement");
                    root.addView(button, fallbackButton);
                    if (label.getParent() == null) root.addView(label, fallbackLabel);
                }
            } catch (RuntimeException failure) {
                NezumiLog.e(Patch.CALL_RECORDING, "CallRecordingUi", "install failed", failure);
            }
        });
    }

    private static View byName(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }

    /** Remove any tagged views below group, undoing the RelativeLayout re-pointing for labels. */
    private static void purge(Activity activity, ViewGroup group) {
        for (int index = group.getChildCount() - 1; index >= 0; index--) {
            View child = group.getChildAt(index);
            Object tag = child.getTag();
            if (TAG_BUTTON.equals(tag)) {
                group.removeViewAt(index);
            } else if (TAG_LABEL.equals(tag)) {
                release(activity, child);
            } else if (child instanceof ViewGroup) {
                purge(activity, (ViewGroup) child);
            }
        }
    }

    /** Detach the label from its parent; siblings that were anchored below it go back to the timer. */
    private static void release(Activity activity, View label) {
        ViewGroup parent = label.getParent() instanceof ViewGroup ? (ViewGroup) label.getParent() : null;
        if (parent == null) return;
        if (parent instanceof RelativeLayout) {
            View switcher = byName(activity, "call_switcherInCallStatus");
            if (switcher != null) repoint((RelativeLayout) parent, label.getId(), switcher.getId(), label);
        }
        parent.removeView(label);
    }

    private static void repoint(RelativeLayout parent, int from, int to, View except) {
        for (int index = 0; index < parent.getChildCount(); index++) {
            View child = parent.getChildAt(index);
            if (child == except || !(child.getLayoutParams() instanceof RelativeLayout.LayoutParams)) continue;
            RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) child.getLayoutParams();
            if (params.getRule(RelativeLayout.BELOW) == from) {
                params.addRule(RelativeLayout.BELOW, to);
                child.setLayoutParams(params);
            }
        }
    }

    /** Keep the REC label directly under whichever call timer (video or audio) is currently shown. */
    private static void placeLabel(Activity activity, TextView label) {
        View video = byName(activity, "call_vidElapsedTime");
        View audio = byName(activity, "call_audio_elapsed_time");
        View timer = video != null && video.isShown() ? video : audio != null && audio.isShown() ? audio : null;
        if (timer == null) return; // keep current (fallback) placement
        int gap = dp(activity, 2);
        if (timer == video && video.getParent() instanceof LinearLayout) {
            LinearLayout parent = (LinearLayout) video.getParent();
            int wanted = parent.indexOfChild(video) + 1;
            if (label.getParent() == parent && parent.indexOfChild(label) == wanted) return;
            release(activity, label);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.gravity = Gravity.CENTER_HORIZONTAL;
            params.topMargin = gap;
            parent.addView(label, Math.min(wanted, parent.getChildCount()), params);
            return;
        }
        View switcher = byName(activity, "call_switcherInCallStatus");
        if (timer == audio && switcher != null && switcher.getParent() instanceof RelativeLayout) {
            RelativeLayout parent = (RelativeLayout) switcher.getParent();
            if (label.getParent() != parent) {
                release(activity, label);
                RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                params.addRule(RelativeLayout.CENTER_HORIZONTAL);
                params.addRule(RelativeLayout.BELOW, switcher.getId());
                params.topMargin = gap;
                parent.addView(label, params);
            }
            // Idempotent; also catches siblings Zalo rebuilt with a BELOW(switcher) rule.
            repoint(parent, switcher.getId(), label.getId(), label);
        }
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
