package app.kyurem39.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

/**
 * The "Morphe" settings sheet.
 *
 * <p>mpvEx compiles its whole interface with R8-merged Compose runtime classes, so a screen of its
 * own cannot be written against the shipped runtime. This dialog is built from framework widgets
 * instead, which needs no code from the app.
 *
 * <p>This class is entered from injected bytecode, so it is written in Java and does not use the
 * Kotlin runtime: R8 shrank the app's copy of it, and the merged copy wins over the one a Kotlin
 * extension would ship.
 */
public final class MorpheHook {
    private static WeakReference<Activity> current;
    private static boolean listening;
    private static boolean vietnameseInterfaceAvailable;
    private static boolean subtitleTranslationAvailable;

    private MorpheHook() {}

    /**
     * Called by the subtitle translation patch. The settings section is hidden when that patch is
     * not part of the applied set, so the sheet never offers a switch that does nothing.
     */
    public static void enableSubtitleTranslation() {
        subtitleTranslationAvailable = true;
    }

    /**
     * Called by the Vietnamese interface patch. The language switch is hidden when that patch is
     * not part of the applied set, so the sheet only offers settings for active patches.
     */
    public static void enableVietnameseInterface() {
        vietnameseInterfaceAvailable = true;
    }

    static Activity currentActivity() {
        WeakReference<Activity> reference = current;
        return reference == null ? null : reference.get();
    }

    /**
     * Logs an uncaught exception before the app replaces the process with its crash screen. The
     * app's own handler only passes the stack trace to that screen, which is gone by the time the
     * process exits, so without this the cause of a crash never reaches logcat.
     */
    public static void logCrash(Thread thread, Throwable throwable) {
        Log.e("MorpheCrash", "Uncaught exception on " + thread, throwable);
    }

    /**
     * Remembers {@code activity} as the activity the sheet is shown on. Activities are tracked as
     * they are resumed as well, because the one that created the sheet may already be gone by the
     * time a settings row is clicked again.
     */
    public static void track(final Activity activity) {
        current = new WeakReference<Activity>(activity);

        if (listening) return;
        listening = true;

        activity.getApplication().registerActivityLifecycleCallbacks(
            new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity resumed) {
                    current = new WeakReference<Activity>(resumed);
                }

                @Override
                public void onActivityCreated(Activity created, Bundle state) {}

                @Override
                public void onActivityStarted(Activity started) {}

                @Override
                public void onActivityPaused(Activity paused) {}

                @Override
                public void onActivityStopped(Activity stopped) {}

                @Override
                public void onActivitySaveInstanceState(Activity saved, Bundle state) {}

                @Override
                public void onActivityDestroyed(Activity destroyed) {}
            }
        );
    }

    /**
     * Entry point of the settings row that opens this sheet. Called with the navigation back stack
     * the row used to push the About screen with, so About stays reachable.
     */
    public static void open(final Object backstack) {
        WeakReference<Activity> reference = current;
        final Activity activity = reference == null ? null : reference.get();
        if (activity == null) return;

        activity.runOnUiThread(
            new Runnable() {
                @Override
                public void run() {
                    try {
                        show(activity, backstack);
                    } catch (Throwable failure) {
                        String message = failure.getMessage();
                        if (message == null) message = failure.getClass().getSimpleName();
                        toast(activity, "Morphe: " + message);
                    }
                }
            }
        );
    }

    private static void show(final Activity activity, final Object backstack) {
        final boolean vietnameseAvailable = vietnameseInterfaceAvailable;
        final boolean enabled = vietnameseAvailable && MorphePrefs.isVietnameseEnabled(activity);
        final boolean vietnamese = isVietnameseUi(activity);

        boolean dark =
            (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        final int theme = dark
            ? android.R.style.Theme_DeviceDefault_Dialog_Alert
            : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(activity, 24), dp(activity, 4), dp(activity, 24), dp(activity, 4));

        final Switch toggle = vietnameseAvailable
            ? addVietnameseRow(activity, content, enabled, vietnamese)
            : null;

        if (subtitleTranslationAvailable) {
            addDivider(activity, content);
            addSubtitleTranslationRow(activity, content, vietnamese);
            addTargetLanguageRow(activity, content, vietnamese, theme);
        }

        addDivider(activity, content);

        TextView footer = new TextView(activity);
        footer.setText(
            (vietnamese ? "Phiên bản vá: " : "Patch version: ")
                + BuildConfig.PATCH_VERSION
        );
        footer.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        footer.setAlpha(0.6f);
        footer.setPadding(0, dp(activity, 12), 0, dp(activity, 4));
        content.addView(footer);

        ScrollView scroll = new ScrollView(activity);
        scroll.addView(content);

        AlertDialog.Builder builder = new AlertDialog.Builder(activity, theme);
        builder.setTitle("kyurem39's patches");
        builder.setView(scroll);
        builder.setPositiveButton(vietnamese ? "Đóng" : "Close", null);
        builder.setNeutralButton(vietnamese ? "Giới thiệu mpvEx" : "About mpvEx", null);

        final AlertDialog dialog = builder.create();

        // The sheet saves the preference, shows itself again in the new language, then restarts
        // the app so its own interface switches too.
        if (toggle != null) {
            toggle.setOnCheckedChangeListener(
                new CompoundButton.OnCheckedChangeListener() {
                    @Override
                    public void onCheckedChanged(CompoundButton button, boolean checked) {
                        if (checked == enabled) return;

                        MorphePrefs.setVietnameseEnabled(activity, checked);
                        dialog.dismiss();
                        show(activity, backstack);
                        restart(activity);
                    }
                }
            );
        }

        dialog.setOnShowListener(
            new DialogInterface.OnShowListener() {
                @Override
                public void onShow(DialogInterface shown) {
                    dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(
                        new View.OnClickListener() {
                            @Override
                            public void onClick(View view) {
                                dialog.dismiss();
                                openAbout(activity, backstack);
                            }
                        }
                    );
                }
            }
        );

        dialog.show();
    }

    private static Switch addVietnameseRow(
        Activity activity,
        LinearLayout content,
        boolean enabled,
        boolean vietnamese
    ) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(activity, 12), 0, dp(activity, 12));

        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(activity);
        title.setText(vietnamese ? "Tiếng Việt" : "Vietnamese");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        labels.addView(title);

        TextView description = new TextView(activity);
        description.setText(
            vietnamese
                ? "Dịch giao diện mpvEx sang tiếng Việt. Tắt để quay về giao diện tiếng Anh."
                : "Translate the mpvEx interface into Vietnamese. "
                    + "Turn off to use the original English interface."
        );
        description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        description.setAlpha(0.7f);
        description.setPadding(0, dp(activity, 2), dp(activity, 8), 0);
        labels.addView(description);

        row.addView(
            labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        );

        final Switch toggle = new Switch(activity);
        toggle.setChecked(enabled);
        row.addView(toggle);
        content.addView(row);
        return toggle;
    }

    private static void addSubtitleTranslationRow(
        final Activity activity,
        LinearLayout content,
        boolean vietnamese
    ) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(activity, 12), 0, dp(activity, 12));

        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(activity);
        title.setText(vietnamese ? "Dịch phụ đề" : "Subtitle translation");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        labels.addView(title);

        TextView description = new TextView(activity);
        description.setText(
            vietnamese
                ? "Tự động dịch phụ đề sang ngôn ngữ đã chọn, kể cả phụ đề nhúng trong video. "
                    + "Dùng Google Translate và cần kết nối mạng."
                : "Automatically translate subtitles into the selected language, including "
                    + "subtitles embedded in the video. Uses Google Translate and needs an "
                    + "internet connection."
        );
        description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        description.setAlpha(0.7f);
        description.setPadding(0, dp(activity, 2), dp(activity, 8), 0);
        labels.addView(description);

        row.addView(
            labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        );

        final Switch toggle = new Switch(activity);
        toggle.setChecked(MorphePrefs.isSubtitleTranslationEnabled(activity));
        toggle.setOnCheckedChangeListener(
            new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton button, boolean checked) {
                    // Persist only: this sheet can run on a screen without a player, so the
                    // selection happens off this callback and only when a player is running.
                    MorphePrefs.setSubtitleTranslationEnabled(activity, checked);
                    if (!checked) MorpheSubtitles.selectEmbeddedSubtitleLater(activity);
                }
            }
        );
        row.addView(toggle);
        content.addView(row);
    }

    private static void addTargetLanguageRow(
        final Activity activity,
        LinearLayout content,
        final boolean vietnamese,
        final int theme
    ) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(activity, 12), 0, dp(activity, 12));

        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(activity);
        title.setText(vietnamese ? "Ngôn ngữ đích" : "Target language");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        labels.addView(title);

        final TextView summary = new TextView(activity);
        summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        summary.setAlpha(0.7f);
        summary.setPadding(0, dp(activity, 2), dp(activity, 8), 0);
        summary.setText(
            MorpheSubtitles.displayName(
                MorphePrefs.subtitleTargetLanguage(activity),
                vietnamese
            )
        );
        labels.addView(summary);

        row.addView(
            labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        );

        TextView arrow = new TextView(activity);
        arrow.setText("›");
        arrow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        arrow.setAlpha(0.5f);
        row.addView(arrow);

        row.setOnClickListener(
            new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    showLanguageDialog(activity, vietnamese, theme, summary);
                }
            }
        );

        content.addView(row);
    }

    private static void showLanguageDialog(
        final Activity activity,
        final boolean vietnamese,
        int theme,
        final TextView summary
    ) {
        final String[] codes = MorpheSubtitles.languageCodes();
        final String[] names = MorpheSubtitles.languageNames(vietnamese);
        String current = MorphePrefs.subtitleTargetLanguage(activity);

        int selected = 0;
        for (int index = 0; index < codes.length; index++) {
            if (codes[index].equalsIgnoreCase(current)) {
                selected = index;
                break;
            }
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(activity, theme);
        builder.setTitle(vietnamese ? "Ngôn ngữ đích" : "Target language");
        builder.setSingleChoiceItems(
            names,
            selected,
            new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    MorphePrefs.setSubtitleTargetLanguage(activity, codes[which]);
                    summary.setText(names[which]);
                    dialog.dismiss();
                }
            }
        );
        builder.setNegativeButton(vietnamese ? "Hủy" : "Cancel", null);
        builder.show();
    }

    private static void addDivider(Activity activity, LinearLayout content) {
        View divider = new View(activity);
        divider.setBackgroundColor(0x22000000);
        content.addView(
            divider,
            new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(activity, 1)
            )
        );
    }

    /**
     * Restarts the app's task so the newly stored language takes effect.
     *
     * <p>{@link Activity#recreate()} is not enough: the recreated activity keeps the resources of
     * its previous instance, including the locale override that was applied there. A fresh launch
     * with {@code CLEAR_TASK} creates a new activity record, and its {@code onCreate} applies the
     * stored preference from scratch.
     */
    private static void restart(Activity activity) {
        try {
            Intent intent = activity.getPackageManager()
                .getLaunchIntentForPackage(activity.getPackageName());
            if (intent == null) {
                activity.recreate();
                return;
            }
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(intent);
        } catch (Throwable ignored) {
            activity.recreate();
        }
    }

    /**
     * Pushes the app's own About screen, which cannot be referenced at compile time. The class name
     * and object instance survive R8, and so does the name of the back stack method that pushes a
     * screen.
     */
    private static void openAbout(Activity activity, Object backstack) {
        boolean opened = false;

        if (backstack != null) {
            try {
                Class<?> screenClass =
                    Class.forName("app.marlboroadvance.mpvex.ui.preferences.AboutScreen");
                Object screen = screenClass.getField("INSTANCE").get(null);

                Method add = null;
                for (Method method : backstack.getClass().getMethods()) {
                    Class<?>[] parameters = method.getParameterTypes();
                    if ("add".equals(method.getName())
                        && parameters.length == 1
                        && parameters[0].isInstance(screen)) {
                        add = method;
                        break;
                    }
                }

                if (add != null) {
                    add.invoke(backstack, screen);
                    opened = true;
                }
            } catch (Throwable ignored) {
                // Reported below.
            }
        }

        if (!opened) {
            toast(
                activity,
                isVietnameseUi(activity)
                    ? "Không mở được màn hình giới thiệu."
                    : "Could not open the About screen."
            );
        }
    }

    /** The language of the settings panel, which follows the Vietnamese toggle only. */
    private static boolean isVietnameseUi(Activity activity) {
        return vietnameseInterfaceAvailable && MorphePrefs.isVietnameseEnabled(activity);
    }

    private static void toast(final Activity activity, final String message) {
        activity.runOnUiThread(
            new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity, message, Toast.LENGTH_SHORT).show();
                }
            }
        );
    }

    private static int dp(Activity activity, int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density);
    }
}
