package nl.johninnl.soundcloud;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * The sleep timer window: a circular selector and a grid of saved values. There are no buttons:
 *
 *  - a tap in the centre of the dial starts the timer, and stops it while it runs;
 *  - a tap on a saved value starts the timer with that value at once (also while one is running,
 *    which restarts it);
 *  - while the timer runs, "+5 min" in the centre adds five minutes;
 *  - holding the finger on the dial saves the selected value;
 *  - tapping outside the card (or Back) closes the window. Closing never touches the timer.
 *
 * It is a plain {@link Dialog} (not an AlertDialog) with a programmatically built layout, and it
 * talks to the existing timer only through {@link SleepTimer} (via {@link SleepTimerController}).
 *
 * Lifetime: one window at a time (a second open() replaces the first). It is dismissed when its
 * Activity is destroyed, all callbacks are removed on dismiss, and only weak references are kept
 * in statics, so neither the Activity nor the Window can leak.
 */
final class SleepTimerDialog {
    private static final String PREFS = "morphe_sleep_timer";
    private static final String KEY_FAVORITES = "favorites";
    private static final int ACCENT = 0xFFFF5500;
    private static final String KEY_LAST_MINUTES = "last_minutes";
    private static final int DEFAULT_MINUTES = 30; // only the very first time
    private static final int COLUMNS = 4;
    private static final int VISIBLE_ROWS = 2;

    private static final String HINT_IDLE = "Нажмите в центре, чтобы запустить. Удерживайте, чтобы сохранить время.";
    private static final String HINT_RUNNING = "Нажмите в центре, чтобы остановить.";

    private static WeakReference<Dialog> showing = new WeakReference<>(null);

    static void show(Activity activity) {
        Dialog previous = showing.get();
        if (previous != null && previous.isShowing()) previous.dismiss();
        new SleepTimerDialog(activity).display();
    }

    private final Activity activity;
    private final Context app;
    private final boolean dark;
    private final float density;
    private final SharedPreferences prefs;
    private final List<Integer> favorites;
    private final SleepTimerController controller;

    private final int surfaceColor;
    private final int textColor;
    private final int subTextColor;
    private final int chipColor;

    private Dialog dialog;
    private LinearLayout root;
    private SleepTimerDial dial;
    private TextView hint;
    private ScrollView gridScroll;
    private LinearLayout gridColumn;
    private LinearLayout.LayoutParams gridParams;
    private boolean lastRunning;

    private SleepTimerDialog(Activity activity) {
        this.activity = activity;
        this.app = activity.getApplicationContext();
        this.dark = isDark(activity);
        this.density = activity.getResources().getDisplayMetrics().density;
        this.prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        this.favorites = SleepTimerMath.parseFavorites(prefs.getString(KEY_FAVORITES, ""));
        this.controller = new SleepTimerController(new SleepTimerController.Backend() {
            @Override public boolean isRunning() { return SleepTimer.isRunning(); }
            @Override public void start(int minutes) { SleepTimer.start(app, minutes); }
            @Override public void stop() { SleepTimer.stop(app); }
            @Override public void extend(int minutes) { SleepTimer.extend(app, minutes); }
        });
        surfaceColor = dark ? 0xFF1E1E1E : 0xFFFFFFFF;
        textColor = dark ? 0xFFFFFFFF : 0xFF1A1A1A;
        subTextColor = dark ? 0xB3FFFFFF : 0x99000000;
        chipColor = dark ? 0xFF303030 : 0xFFEFEFEF;
    }

    /** SoundCloud has its own light/dark setting, so the theme's background colour decides first. */
    private static boolean isDark(Context context) {
        TypedValue value = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.colorBackground, value, true)
                && value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
            int c = value.data;
            double luminance = 0.299 * Color.red(c) + 0.587 * Color.green(c) + 0.114 * Color.blue(c);
            return luminance < 128;
        }
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
            == Configuration.UI_MODE_NIGHT_YES;
    }

    private int dp(float v) {
        return (int) (v * density + 0.5f);
    }

    private TextView text(String value, float sp, int color, boolean bold) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    private GradientDrawable rounded(int fill, float radiusDp) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(fill);
        d.setCornerRadius(dp(radiusDp));
        return d;
    }

    private void display() {
        DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        int width = Math.min(dp(360), metrics.widthPixels - dp(32));
        // The dial is a square: bounded by the width and, in landscape, by the available height.
        int dialSize = (int) Math.min(dp(300), Math.min(width - dp(40), metrics.heightPixels * 0.5f));

        root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(rounded(surfaceColor, 28));
        root.setPadding(dp(20), dp(18), dp(20), dp(18));

        TextView title = text("Таймер сна", 18, textColor, true);
        title.setGravity(Gravity.CENTER);
        root.addView(title, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        dial = new SleepTimerDial(activity, dark);
        LinearLayout.LayoutParams dialParams = new LinearLayout.LayoutParams(dialSize, dialSize);
        dialParams.gravity = Gravity.CENTER_HORIZONTAL;
        dialParams.topMargin = dp(10);
        root.addView(dial, dialParams);

        // Two lines are always reserved, so the card does not jump when the text changes.
        hint = text(HINT_IDLE, 12, subTextColor, false);
        hint.setGravity(Gravity.CENTER);
        hint.setMinLines(2);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintParams.topMargin = dp(6);
        root.addView(hint, hintParams);

        TextView savedTitle = text("Сохранённые", 13, subTextColor, true);
        savedTitle.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams savedTitleParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        savedTitleParams.topMargin = dp(12);
        root.addView(savedTitle, savedTitleParams);

        // 4 x 2 grid; more saved values scroll vertically, row by row.
        gridColumn = new LinearLayout(activity);
        gridColumn.setOrientation(LinearLayout.VERTICAL);
        gridScroll = new ScrollView(activity);
        gridScroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        gridScroll.setOnTouchListener((v, e) -> {
            // the card itself may scroll in landscape; the grid keeps its own vertical drags
            if (v.getParent() != null) v.getParent().requestDisallowInterceptTouchEvent(true);
            return false;
        });
        gridScroll.addView(gridColumn, new ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        gridParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, chipHeight());
        gridParams.topMargin = dp(8);
        root.addView(gridScroll, gridParams);

        ScrollView scroll = new ScrollView(activity); // keeps everything reachable in landscape
        scroll.addView(root, new ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        dial.setSelectedMinutes(loadLastMinutes(), false);
        dial.setListener(new SleepTimerDial.Listener() {
            @Override public void onMinutesChanged(int minutes) { updateChipSelection(); }
            @Override public void onLongPressSave(int minutes) { saveFavorite(minutes); }
            @Override public void onCenterTap() {
                controller.onCenterTap(dial.getSelectedMinutes());
                rememberSelection();
                refresh();
            }
            @Override public void onAddTime() {
                if (controller.onAddTime()) refresh();
            }
        });
        rebuildChips();

        dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(scroll);
        dialog.setCanceledOnTouchOutside(true); // a tap outside the card closes the window
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
        }

        final Runnable tick = new Runnable() {
            @Override public void run() {
                refresh();
                root.postDelayed(this, 1000);
            }
        };
        final Application application = activity.getApplication();
        final Application.ActivityLifecycleCallbacks closeWithActivity = new DismissWithActivity(activity, dialog);
        if (application != null) application.registerActivityLifecycleCallbacks(closeWithActivity);
        // Dismissing only removes this window's own callbacks; the timer itself keeps running.
        dialog.setOnDismissListener(d -> {
            rememberSelection(); // whatever was set last is what the window opens with next time
            root.removeCallbacks(tick);
            if (application != null) application.unregisterActivityLifecycleCallbacks(closeWithActivity);
            if (showing.get() == dialog) showing.clear();
        });

        showing = new WeakReference<>(dialog);
        dialog.show();
        refresh();
        root.postDelayed(tick, 1000);
    }

    /** The value that was set last time, or the default on the very first open. */
    private int loadLastMinutes() {
        int saved = prefs.getInt(KEY_LAST_MINUTES, DEFAULT_MINUTES);
        return saved >= SleepTimerMath.MIN_MINUTES && saved <= SleepTimerMath.MAX_MINUTES
            ? saved : DEFAULT_MINUTES;
    }

    private void rememberSelection() {
        prefs.edit().putInt(KEY_LAST_MINUTES, dial.getSelectedMinutes()).apply();
    }

    private int chipHeight() {
        return dp(40);
    }

    private int chipGap() {
        return dp(8);
    }

    /** Syncs the window with the real timer once a second (it may also finish while this is open). */
    private void refresh() {
        controller.sync();
        boolean running = SleepTimer.isRunning();
        dial.setRunning(running, SleepTimer.remainingMillis());
        if (running != lastRunning) {
            lastRunning = running;
            hint.setText(running ? HINT_RUNNING : HINT_IDLE);
        }
        updateChipSelection();
    }

    // ---- saved values ------------------------------------------------------------------------

    private void startPreset(int minutes) {
        // Idle: the handle glides to the value. Running: only the value to return to is updated and
        // the countdown handle glides to the new time left.
        dial.setSelectedMinutes(minutes, true);
        controller.onPreset(minutes);
        rememberSelection();
        refresh();
    }

    private void saveFavorite(int minutes) {
        if (SleepTimerMath.addFavorite(favorites, minutes)) {
            persist();
            rebuildChips();
            Toast.makeText(app, "Сохранено: " + minutes + " мин", Toast.LENGTH_SHORT).show();
        } else {
            if (Build.VERSION.SDK_INT >= 30) dial.performHapticFeedback(HapticFeedbackConstants.REJECT);
            Toast.makeText(app, "Уже сохранено", Toast.LENGTH_SHORT).show();
        }
    }

    private void removeFavorite(int minutes) {
        if (SleepTimerMath.removeFavorite(favorites, minutes)) {
            persist();
            rebuildChips();
            Toast.makeText(app, "Удалено: " + minutes + " мин", Toast.LENGTH_SHORT).show();
        }
    }

    private void persist() {
        prefs.edit().putString(KEY_FAVORITES, SleepTimerMath.serializeFavorites(favorites)).apply();
    }

    private void rebuildChips() {
        gridColumn.removeAllViews();
        int count = favorites.size();
        if (count == 0) {
            TextView empty = text("Пока пусто", 13, subTextColor, false);
            empty.setGravity(Gravity.CENTER);
            gridColumn.addView(empty, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, chipHeight()));
            gridParams.height = chipHeight();
            gridScroll.setLayoutParams(gridParams);
            return;
        }

        int rows = (count + COLUMNS - 1) / COLUMNS;
        for (int r = 0; r < rows; r++) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, chipHeight());
            rowParams.topMargin = r == 0 ? 0 : chipGap();
            gridColumn.addView(row, rowParams);

            for (int c = 0; c < COLUMNS; c++) {
                int index = r * COLUMNS + c;
                LinearLayout.LayoutParams cell = new LinearLayout.LayoutParams(0, chipHeight(), 1f);
                cell.leftMargin = c == 0 ? 0 : chipGap() / 2;
                cell.rightMargin = c == COLUMNS - 1 ? 0 : chipGap() / 2;
                if (index < count) {
                    row.addView(newChip(favorites.get(index)), cell);
                } else {
                    row.addView(new View(activity), cell); // keeps the last row aligned to the columns
                }
            }
        }

        int visibleRows = Math.min(rows, VISIBLE_ROWS);
        gridParams.height = visibleRows * chipHeight() + (visibleRows - 1) * chipGap();
        gridScroll.setLayoutParams(gridParams);
        updateChipSelection();
    }

    private TextView newChip(final int minutes) {
        TextView chip = text(minutes + " мин", 13, textColor, false);
        chip.setTag(minutes);
        chip.setGravity(Gravity.CENTER);
        chip.setSingleLine(true);
        chip.setEllipsize(TextUtils.TruncateAt.END);
        chip.setPadding(dp(4), 0, dp(4), 0);
        chip.setClickable(true);
        chip.setOnClickListener(v -> startPreset(minutes));
        chip.setOnLongClickListener(v -> {
            removeFavorite(minutes);
            return true;
        });
        return chip;
    }

    private void updateChipSelection() {
        // Idle: the value selected on the dial. Running: the saved value that was started, if any.
        int highlighted = SleepTimer.isRunning() ? controller.startedPreset() : dial.getSelectedMinutes();
        for (int r = 0; r < gridColumn.getChildCount(); r++) {
            View rowView = gridColumn.getChildAt(r);
            if (!(rowView instanceof LinearLayout)) continue;
            LinearLayout row = (LinearLayout) rowView;
            for (int c = 0; c < row.getChildCount(); c++) {
                View chip = row.getChildAt(c);
                if (!(chip.getTag() instanceof Integer)) continue;
                boolean selected = ((Integer) chip.getTag()) == highlighted;
                GradientDrawable bg = rounded(selected ? ((ACCENT & 0x00FFFFFF) | 0x33000000) : chipColor, 18);
                if (selected) bg.setStroke(dp(1.5f), ACCENT);
                chip.setBackground(bg);
            }
        }
    }

    /** Closes the window together with its Activity, so no Window is ever leaked. */
    private static final class DismissWithActivity implements Application.ActivityLifecycleCallbacks {
        private final WeakReference<Activity> target;
        private final WeakReference<Dialog> dialog;

        DismissWithActivity(Activity activity, Dialog dialog) {
            this.target = new WeakReference<>(activity);
            this.dialog = new WeakReference<>(dialog);
        }

        @Override public void onActivityDestroyed(Activity activity) {
            if (target.get() != activity) return;
            Dialog d = dialog.get();
            if (d != null && d.isShowing()) d.dismiss();
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) { }
        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityResumed(Activity activity) { }
        @Override public void onActivityPaused(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) { }
    }
}
