/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.calendarreminders;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.WeakHashMap;

/** Separate defaults for fresh drafts only; never changes an existing event/model. */
public final class AllDayReminders {
    private static final String PREFS = "penguin_calendar_all_day";
    private static final String TAG = "penguin.calendar.allDayDefaults";
    private static final String STATE = "io.github.pengusto.calendar.reminders.";
    private static final int MAX_MINUTES = 525600;
    private static final WeakHashMap<Activity, Draft> DRAFTS = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Draft> RESTORING = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Boolean> LOADED = new WeakHashMap<>();

    private AllDayReminders() {}
    private static final class Draft {
        int[] timed, allDay, current;
        boolean day;
        Draft(int[] timed, int[] allDay, boolean day) {
            this.timed = timed; this.allDay = allDay; this.day = day;
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
    private static int value(Context context, int index) {
        int result = preferences(context).getInt("reminder_" + index, index == 0 ? 720 : -1);
        return result >= -1 && result <= MAX_MINUTES ? result : (index == 0 ? 720 : -1);
    }

    /** Called only in the original fresh-event branch, after native defaults load. */
    public static void begin(Activity activity) {
        if (!CalendarHooks.reuse(activity)) {
            DRAFTS.put(activity, new Draft(CalendarHooks.read(activity),
                new int[] {value(activity, 0), value(activity, 1), value(activity, 2), 0, 0, 0}, false));
        }
    }

    /** Native date/time toggling does not modify these reminder fields. */
    public static void toggle(Activity activity, boolean allDay) {
        Draft draft = DRAFTS.get(activity);
        if (draft == null || draft.day == allDay) return;
        if (draft.day) draft.allDay = CalendarHooks.read(activity);
        else draft.timed = CalendarHooks.read(activity);
        draft.day = allDay;
        CalendarHooks.write(activity, (allDay ? draft.allDay : draft.timed).clone());
    }

    public static void save(Activity activity, Bundle state) {
        Draft draft = DRAFTS.get(activity);
        if (draft == null) return;
        if (draft.day) draft.allDay = CalendarHooks.read(activity);
        else draft.timed = CalendarHooks.read(activity);
        state.putIntArray(STATE + "timed", draft.timed.clone());
        state.putIntArray(STATE + "allDay", draft.allDay.clone());
        state.putBoolean(STATE + "day", draft.day);
        state.putIntArray(STATE + "current", CalendarHooks.read(activity));
    }

    public static void restore(Activity activity, Bundle state) {
        int[] timed = state.getIntArray(STATE + "timed");
        int[] allDay = state.getIntArray(STATE + "allDay");
        int[] current = state.getIntArray(STATE + "current");
        if (timed != null && allDay != null && timed.length == 6 && allDay.length == 6
                && current != null && current.length == 6
                && !CalendarHooks.reuse(activity)) {
            Draft draft = new Draft(timed.clone(), allDay.clone(), state.getBoolean(STATE + "day"));
            draft.current = current.clone();
            RESTORING.put(activity, draft);
            if (LOADED.containsKey(activity)) complete(activity);
        }
    }

    /** gotEvent asynchronously resets fields and the switch after native onRestore. */
    public static void complete(Activity activity) {
        LOADED.put(activity, true);
        Draft draft = RESTORING.remove(activity);
        if (draft == null) return;
        DRAFTS.put(activity, draft);
        CalendarHooks.write(activity, draft.current);
        CalendarHooks.allDay(activity, draft.day);
    }

    private static boolean german(Context context) {
        return "de".equals(context.getResources().getConfiguration().getLocales().get(0).getLanguage());
    }
    private static String text(Context context, String english, String german) {
        return german(context) ? german : english;
    }
    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
    private static TextView label(Activity activity, TextView template, String text) {
        TextView view = new TextView(activity);
        view.setText(text);
        view.setTextColor(template.getTextColors());
        view.setTextSize(TypedValue.COMPLEX_UNIT_PX, template.getTextSize());
        view.setGravity(Gravity.CENTER_VERTICAL);
        view.setPadding(dp(activity, 16), dp(activity, 8), dp(activity, 16), dp(activity, 8));
        view.setMinHeight(dp(activity, 48));
        return view;
    }

    // Target IDs belong to the original APK, not this separately built MPE's R.
    @android.annotation.SuppressLint("DiscouragedApi")
    public static void settings(Activity activity) {
        ViewGroup root = activity.findViewById(android.R.id.content);
        if (root.findViewWithTag(TAG) == null) {
            int id = activity.getResources().getIdentifier("settings_default_reminder_3_holder", "id", activity.getPackageName());
            View anchor = activity.findViewById(id);
            int textId = activity.getResources().getIdentifier("settings_default_reminder_3", "id", activity.getPackageName());
            TextView template = activity.findViewById(textId);
            if (anchor == null || template == null || !(anchor.getParent() instanceof LinearLayout)) {
                throw new IllegalStateException("Unsupported Calendar settings layout");
            }
            LinearLayout parent = (LinearLayout) anchor.getParent();
            LinearLayout section = new LinearLayout(activity);
            section.setTag(TAG);
            section.setOrientation(LinearLayout.VERTICAL);
            section.addView(label(activity, template, text(activity,
                "All-day defaults (before local midnight)", "Ganztags-Standards (vor lokaler Mitternacht)")));
            for (int index = 0; index < 3; index++) {
                final int position = index;
                TextView row = label(activity, template, "");
                row.setTag(TAG + index);
                TypedValue background = new TypedValue();
                if (activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, background, true)) {
                    row.setBackgroundResource(background.resourceId);
                }
                updateRow(activity, row, index);
                row.setOnClickListener(view -> choose(activity, row, position));
                section.addView(row, new LinearLayout.LayoutParams(-1, -2));
            }
            parent.addView(section, parent.indexOfChild(anchor) + 1, new LinearLayout.LayoutParams(-1, -2));
        }
        visibility(activity, !CalendarHooks.reuse(activity));
    }

    public static void visibility(Activity activity, boolean show) {
        ViewGroup root = activity.findViewById(android.R.id.content);
        View section = root.findViewWithTag(TAG);
        if (section != null) section.setVisibility(show ? View.VISIBLE : View.GONE);
    }
    private static void updateRow(Activity activity, TextView row, int index) {
        row.setText(String.format(activity.getResources().getConfiguration().getLocales().get(0),
            text(activity, "All-day reminder %d: %s", "Ganztags-Erinnerung %d: %s"),
            index + 1, CalendarHooks.format(activity, value(activity, index))));
    }
    private static void store(Activity activity, TextView row, int index, int minutes) {
        if (minutes < -1 || minutes > MAX_MINUTES) throw new IllegalArgumentException("Invalid reminder minutes");
        preferences(activity).edit().putInt("reminder_" + index, minutes).apply();
        updateRow(activity, row, index);
    }
    private static void choose(Activity activity, TextView row, int index) {
        int[] minutes = {-1, 0, 360, 720, 1440, 2880};
        String[] labels = new String[minutes.length + 1];
        int selected = -1;
        for (int i = 0; i < minutes.length; i++) {
            labels[i] = CalendarHooks.format(activity, minutes[i]);
            if (value(activity, index) == minutes[i]) selected = i;
        }
        labels[minutes.length] = text(activity, "Custom minutes…", "Eigene Minuten…");
        new AlertDialog.Builder(activity).setTitle(text(activity, "All-day reminder ", "Ganztags-Erinnerung ") + (index + 1))
            .setSingleChoiceItems(labels, selected, (dialog, which) -> {
                dialog.dismiss();
                if (which < minutes.length) store(activity, row, index, minutes[which]);
                else custom(activity, row, index);
            }).setNegativeButton(android.R.string.cancel, null).show();
    }
    private static void custom(Activity activity, TextView row, int index) {
        EditText input = new EditText(activity);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setSingleLine(true);
        input.setText(String.valueOf(Math.max(0, value(activity, index))));
        input.selectAll();
        LinearLayout holder = new LinearLayout(activity);
        holder.setPadding(dp(activity, 24), 0, dp(activity, 24), 0);
        holder.addView(input, new LinearLayout.LayoutParams(-1, -2));
        AlertDialog dialog = new AlertDialog.Builder(activity)
            .setTitle(text(activity, "Minutes before local midnight", "Minuten vor lokaler Mitternacht"))
            .setView(holder).setPositiveButton(android.R.string.ok, null)
            .setNegativeButton(android.R.string.cancel, null).create();
        dialog.setOnShowListener(ignored -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
            try {
                int minutes = Integer.parseInt(input.getText().toString().trim());
                if (minutes < 0 || minutes > MAX_MINUTES) throw new NumberFormatException();
                store(activity, row, index, minutes);
                dialog.dismiss();
            } catch (NumberFormatException invalid) {
                input.setError(text(activity, "Enter 0–525600 minutes", "0–525600 Minuten eingeben"));
            }
        }));
        dialog.show();
    }
}
