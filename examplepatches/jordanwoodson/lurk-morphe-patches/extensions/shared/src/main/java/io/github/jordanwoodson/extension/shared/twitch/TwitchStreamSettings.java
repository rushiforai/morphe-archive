package io.github.jordanwoodson.extension.shared.twitch;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.SleepTimer;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Lurk's rows in Twitch's stream settings sheet (the player's gear): a Sleep timer row between Twitch's
 * Background audio and Pop out rows, styled after the latter, that opens the same chooser as Lurk settings and
 * arms the timer at once.
 */
@SuppressWarnings("unused")
public final class TwitchStreamSettings {
    private static final String TAG = "lurk-sleep-timer-row";

    private TwitchStreamSettings() {
    }

    /**
     * Injection point: the end of the sheet's view holder constructor, with the inflated sheet. Adds the
     * Sleep timer row once per sheet, right before Twitch's Pop out row (a label and a switch in a wrapper,
     * which the row copies); a sheet without that row is left alone.
     */
    public static void sleepTimerRow(View root) {
        if (root == null) return;
        try {
            if (!Settings.isRegistered(SleepTimer.KEY)) return;
            Resources resources = root.getResources();
            String app = root.getContext().getPackageName();
            View wrapper = root.findViewById(resources.getIdentifier("pip_wrapper", "id", app));
            View label = root.findViewById(resources.getIdentifier("pip_text", "id", app));
            View control = root.findViewById(resources.getIdentifier("pip_switch", "id", app));
            if (wrapper == null || !(label instanceof TextView) || control == null
                    || !(wrapper.getParent() instanceof ViewGroup)) return;
            ViewGroup parent = (ViewGroup) wrapper.getParent();
            if (parent.findViewWithTag(TAG) != null) return;
            parent.addView(row(root.getContext(), wrapper, (TextView) label, control), parent.indexOfChild(wrapper));
        } catch (RuntimeException e) {
            Logger.d("stream settings: sleep timer row failed: " + e);
        }
    }

    private static View row(Context context, View sibling, TextView siblingLabel, View siblingControl) {
        FrameLayout row = new FrameLayout(context);
        row.setTag(TAG);
        ViewGroup.LayoutParams params = sibling.getLayoutParams();
        row.setLayoutParams(params instanceof LinearLayout.LayoutParams
                ? new LinearLayout.LayoutParams((LinearLayout.LayoutParams) params)
                : params instanceof ViewGroup.MarginLayoutParams
                ? new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams) params)
                : new ViewGroup.LayoutParams(params));
        row.setPadding(sibling.getPaddingLeft(), sibling.getPaddingTop(), sibling.getPaddingRight(), sibling.getPaddingBottom());
        row.setMinimumHeight(sibling.getMinimumHeight());
        Drawable background = sibling.getBackground();
        if (background != null && background.getConstantState() != null) {
            row.setBackground(background.getConstantState().newDrawable(context.getResources()));
        }
        row.setClickable(true);
        row.setFocusable(true);

        TextView title = text(context, siblingLabel, "Sleep timer", siblingLabel.getLayoutParams(),
                Gravity.START | Gravity.CENTER_VERTICAL);
        TextView value = text(context, siblingLabel, currentLabel(), siblingControl.getLayoutParams(),
                Gravity.END | Gravity.CENTER_VERTICAL);
        value.setAlpha(0.7f);
        row.addView(title);
        row.addView(value);
        row.setContentDescription("Sleep timer, " + currentLabel());
        row.setOnClickListener(view -> choose(view.getContext(), value, row));
        return row;
    }

    /** A text styled like {@code like}, placed like the sibling whose layout params are {@code placement}. */
    private static TextView text(Context context, TextView like, String text, ViewGroup.LayoutParams placement,
            int gravity) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_PX, like.getTextSize());
        view.setTextColor(like.getTextColors());
        view.setTypeface(like.getTypeface());
        view.setSingleLine(true);
        FrameLayout.LayoutParams params = placement instanceof ViewGroup.MarginLayoutParams
                ? new FrameLayout.LayoutParams((ViewGroup.MarginLayoutParams) placement)
                : new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.width = ViewGroup.LayoutParams.WRAP_CONTENT;
        params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        params.gravity = gravity;
        view.setLayoutParams(params);
        return view;
    }

    private static String currentLabel() {
        String[] labels = Settings.choiceLabels(SleepTimer.KEY);
        String[] values = Settings.choiceValues(SleepTimer.KEY);
        String current = String.valueOf(Settings.getInt(SleepTimer.KEY));
        for (int i = 0; i < values.length; i++) if (values[i].equals(current)) return labels[i];
        return "Off";
    }

    private static void choose(Context context, TextView value, View row) {
        String[] labels = Settings.choiceLabels(SleepTimer.KEY);
        String[] values = Settings.choiceValues(SleepTimer.KEY);
        if (labels.length == 0) return;
        String current = String.valueOf(Settings.getInt(SleepTimer.KEY));
        int checked = -1;
        for (int i = 0; i < values.length; i++) if (values[i].equals(current)) checked = i;
        new AlertDialog.Builder(context, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle("Sleep timer")
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    if (Settings.setChoice(SleepTimer.KEY, values[which])) {
                        SleepTimer.settingChanged();
                        value.setText(labels[which]);
                        row.setContentDescription("Sleep timer, " + labels[which]);
                    }
                    dialog.dismiss();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }
}
