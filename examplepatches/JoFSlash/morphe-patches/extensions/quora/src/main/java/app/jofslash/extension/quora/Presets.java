package app.jofslash.extension.quora;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.SharedPreferences;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.util.Log;
import android.widget.Toast;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Ready-made sets of switches, offered once on the first start after patching and later under
 * Patch settings > More > Presets. A preset can only switch off patches, and switch back on the
 * ones that were patched in: what wasn't patched in stays out. Privacy patches can't be switched
 * at all, so every preset keeps them. A preset sets every switch in SettingsCatalog: on when it is
 * in the preset's list, off when it isn't. The personal ones in PERSONAL (text size, font, tabs,
 * where links open and the like) are habits rather than part of a look, so no preset touches them.
 */
final class Presets {

    private static final String TAG = "JoFSlashPatches";

    /**
     * Clean feed: no ads, AI answers, promotions or suggestions, and the tools you patched in, but
     * the feed, the answers and the app look and move as in the official app.
     */
    static final Set<String> CLEAN_FEED = new HashSet<>(Arrays.asList(
            "removeAds",
            "hideQuoraPlusAnswers", "hideQuoraPlusPromotions", "hideAiAnswers", "hidePoe", "hideSuggestedQuestions",
            "hideSpacesSuggestions", "hidePeopleSuggestions", "hideSurveys", "hideAskBox", "hideMoreStories",
            "hideDismissedQuestions", "filterKeywords", "blockAuthors",
            "copyAnswerText", "shareAnswerText", "readingHistory", "bookmarks", "translateAnswerText", "readAloud",
            "wordCount", "enableTextSelection", "disableVideoAutoplay",
            "readerView", "readingTime", "pickToHide",
            "disableTabPrefetching", "disableSignInPrompts", "blockPromotionalNotifications",
            "filterUpdates", "updateNotice"));

    /**
     * For reading: the clean feed, plus whole answers, more space, no numbers or credentials, and
     * bars that hide while you read.
     */
    static final Set<String> READING = new HashSet<>(CLEAN_FEED);

    static {
        READING.addAll(Arrays.asList(
                "expandAnswers", "fullscreenReading", "comfortableReading", "amoledDark", "hideCounts",
                "hideCredentials", "hideCommentPreviews", "hideFollowButtons", "keepPlaceOnReturn"));
    }

    /** Switches each person sets to their own liking: every preset leaves them as they are. */
    static final Set<String> PERSONAL = new HashSet<>(Arrays.asList(
            "textSize", "answerFont", "hideTabs", "startTab", "openLinksInBrowser", "keepScreenOn",
            "dataSaver", "dataSaverOnWifi", "disableVibration", "disablePullToRefresh", "disableSwipeBetweenFeeds"));

    /** Ads and privacy only: everything you see is as in the official app, without ads. */
    static final Set<String> ADS_ONLY = new HashSet<>(Arrays.asList(
            "removeAds", "disableTabPrefetching", "disableSignInPrompts", "blockPromotionalNotifications",
            "filterUpdates", "updateNotice"));

    private Presets() {
    }

    /**
     * Asks which preset to use.
     *
     * @param firstStart Whether this is the first start after patching; then the dialog also says
     *                   where the settings are, and closing it keeps everything as patched.
     */
    static void ask(Activity activity, SharedPreferences prefs, boolean firstStart) {
        boolean dark = (activity.getResources().getConfiguration().uiMode
                & android.content.res.Configuration.UI_MODE_NIGHT_MASK) == android.content.res.Configuration.UI_MODE_NIGHT_YES;
        // Quora's settings colors, as on the settings page.
        int text = dark ? 0xFFE6E7E8 : 0xFF282829;
        int secondary = dark ? 0xFF939598 : 0xFF636466;
        int accent = 0xFF2E69FF;
        float density = activity.getResources().getDisplayMetrics().density;
        int pad = Math.round(20 * density);
        CharSequence[] items = {
                item(Texts.t("Everything you patched"),
                        Texts.t("Every patch you picked in Morphe stays on."), secondary),
                item(Texts.t("Clean feed"),
                        Texts.t("No ads, AI answers, promotions or suggestions. Answers and the app look as usual."), secondary),
                item(Texts.t("For reading"),
                        Texts.t("A clean feed, whole answers with more space, no numbers, and bars that hide while you read."), secondary),
                item(Texts.t("Ads and privacy only"),
                        Texts.t("Everything looks as in the official app, without ads and tracking."), secondary),
        };

        android.widget.LinearLayout column = new android.widget.LinearLayout(activity);
        column.setOrientation(android.widget.LinearLayout.VERTICAL);
        column.setPadding(pad, pad / 2, pad, 0);
        if (firstStart) {
            android.widget.TextView hint = new android.widget.TextView(activity);
            hint.setText(Texts.t("Change them any time in Settings > Morphe, or by long-pressing the Home tab."));
            hint.setTextColor(secondary);
            hint.setTextSize(15);
            hint.setPadding(0, 0, 0, pad / 2);
            column.addView(hint);
        }
        // The group gives its buttons ids of their own, which keeps one of them checked.
        android.widget.RadioGroup group = new android.widget.RadioGroup(activity);
        android.widget.RadioButton[] buttons = new android.widget.RadioButton[items.length];
        for (int i = 0; i < items.length; i++) {
            android.widget.RadioButton button = buttons[i] = new android.widget.RadioButton(activity);
            button.setText(items[i]);
            button.setTextColor(text);
            button.setTextSize(16);
            button.setButtonTintList(android.content.res.ColorStateList.valueOf(accent));
            button.setPadding(pad / 2, pad / 3, 0, pad / 3);
            group.addView(button);
        }
        buttons[0].setChecked(true);
        column.addView(group);
        android.widget.ScrollView scroll = new android.widget.ScrollView(activity);
        scroll.addView(column);

        AlertDialog.Builder builder = new AlertDialog.Builder(activity, dark
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                .setTitle(firstStart ? Texts.t("Quora patches are on") : Texts.t("Presets"))
                .setView(scroll)
                .setPositiveButton(Texts.t("Use"), (d, w) -> {
                    for (int i = 0; i < buttons.length; i++) {
                        if (buttons[i].isChecked()) apply(activity, prefs, i);
                    }
                })
                .setNegativeButton(firstStart ? Texts.t("Later") : Texts.t("Cancel"), null);
        if (firstStart) {
            builder.setNeutralButton(Texts.t("Choose myself"), (d, w) -> SettingsPage.open(activity, prefs));
        }
        builder.show();
    }

    private static CharSequence item(String name, String line, int color) {
        SpannableStringBuilder text = new SpannableStringBuilder(name).append('\n');
        int start = text.length();
        text.append(line);
        text.setSpan(new RelativeSizeSpan(0.85f), start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new android.text.style.ForegroundColorSpan(color), start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return text;
    }

    /** 0: everything on, 1: clean feed, 2: for reading, 3: ads and privacy only. */
    static void apply(Activity activity, SharedPreferences prefs, int preset) {
        try {
            Set<String> on = preset == 1 ? CLEAN_FEED : preset == 2 ? READING : preset == 3 ? ADS_ONLY : null;
            SharedPreferences.Editor editor = prefs.edit();
            boolean restart = false;
            for (String key : SettingsCatalog.keys()) {
                if (PERSONAL.contains(key)) continue;
                boolean value = on == null || on.contains(key);
                if (prefs.getBoolean(key, true) != value && SettingsCatalog.RESTART.contains(key)
                        && PatchSettings.isRegistered(key)) {
                    restart = true;
                }
                editor.putBoolean(key, value);
            }
            editor.apply();
            PatchSettings.reload();
            Toast.makeText(activity, restart ? Texts.t("Done. Some changes show after restarting the app.") : Texts.t("Done."),
                    Toast.LENGTH_LONG).show();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to apply the preset", ex);
        }
    }
}
