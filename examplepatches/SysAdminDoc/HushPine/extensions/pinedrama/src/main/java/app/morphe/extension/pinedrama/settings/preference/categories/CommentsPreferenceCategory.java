/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.pinedrama.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.InputTextPreference;
import app.morphe.extension.pinedrama.settings.preference.SectionHeadingPreference;
import app.morphe.extension.pinedrama.settings.preference.TogglePreference;

/**
 * Reading comments, hiding some of them, and blocking who wrote them. The page was one card
 * of thirteen rows in the order the patches arrived.
 */
@SuppressWarnings("deprecation")
public class CommentsPreferenceCategory extends ConditionalPreferenceCategory {
    public CommentsPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Comments");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.commentTranslationEnabled
                || SettingsStatus.doNotAutoTranslateEnabled
                || SettingsStatus.videoAutoTranslateEnabled
                || SettingsStatus.translateIntoEnabled
                || SettingsStatus.commentTranslateButtonEnabled
                || SettingsStatus.languagePageTranslationsEnabled
                || SettingsStatus.feedTranslationsEnabled
                || SettingsStatus.hideCommentQuickReactionsEnabled
                || SettingsStatus.copyCommentsWithoutUsernameEnabled
                || SettingsStatus.hideCommentEggsEnabled
                || SettingsStatus.commentSortControlsEnabled
                || SettingsStatus.commentsFullHeightEnabled
                || SettingsStatus.voiceCommentsEnabled
                || SettingsStatus.commentPhotosEnabled
                || SettingsStatus.commenterDetailsEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        boolean reading = SettingsStatus.commentTranslationEnabled
                || SettingsStatus.doNotAutoTranslateEnabled
                || SettingsStatus.videoAutoTranslateEnabled
                || SettingsStatus.translateIntoEnabled
                || SettingsStatus.commentTranslateButtonEnabled
                || SettingsStatus.languagePageTranslationsEnabled
                || SettingsStatus.feedTranslationsEnabled
                || SettingsStatus.commentSortControlsEnabled
                || SettingsStatus.commentsFullHeightEnabled
                || SettingsStatus.copyCommentsWithoutUsernameEnabled
                || SettingsStatus.commenterDetailsEnabled;
        if (reading) {
            addPreference(new SectionHeadingPreference(context, "Reading"));
        }
        if (SettingsStatus.commentTranslationEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Auto translate comments",
                    "Translate comments as they load, using PineDrama's own translator.",
                    Settings.COMMENT_BATCH_TRANSLATION
            ));
        }
        if (SettingsStatus.doNotAutoTranslateEnabled) {
            addPreference(new InputTextPreference(
                    context,
                    "Don't auto translate these languages",
                    "Separate language codes with commas, like es, de. When PineDrama translates for you, "
                            + "captions and comments in these languages stay as they were written. "
                            + "See translation still works when you tap it. PineDrama's own Don't translate "
                            + "list stays the way it is.",
                    Settings.DONT_AUTO_TRANSLATE_LANGUAGES)
                    .withCheck(app.morphe.extension.pinedrama.translation.DoNotAutoTranslate::languageProblem)
                    .withNameKeyboard());
        }
        if (SettingsStatus.videoAutoTranslateEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Don't auto translate videos",
                    "Descriptions, captions and text on videos stay in the language they were made in, "
                            + "even with PineDrama's Always translate on. See translation still works when "
                            + "you tap it. Comments have their own switch above.",
                    Settings.NO_VIDEO_AUTO_TRANSLATE
            ));
        }
        if (SettingsStatus.translateIntoEnabled) {
            addPreference(new InputTextPreference(
                    context,
                    "Translate into",
                    "One language code, like en or es. Comments and captions PineDrama translates come out in "
                            + "this language instead of the app's. Leave it empty to keep PineDrama's choice.",
                    Settings.TRANSLATE_INTO)
                    .withCheck(app.morphe.extension.pinedrama.translation.TranslateInto::languageProblem)
                    .withNameKeyboard());
        }
        if (SettingsStatus.commentTranslateButtonEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Translate button in comments",
                    "Adds PineDrama's translate button next to the comment count. One tap translates "
                            + "every comment, and another shows the originals again.",
                    Settings.COMMENT_TRANSLATE_BUTTON
            ));
        }
        if (SettingsStatus.languagePageTranslationsEnabled || SettingsStatus.feedTranslationsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Bring back PineDrama's translation",
                    translationSummary(),
                    Settings.SHOW_TRANSLATION_SETTINGS
            ));
        }
        if (SettingsStatus.commentSortControlsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Full comment sort options",
                    "Shows PineDrama's full sort menu on every post, with hot, newest, media and "
                            + "creator options, instead of the shorter one your account got. "
                            + "Restart PineDrama to see the change.",
                    Settings.COMMENT_SORT_CONTROLS
            ));
        }
        if (SettingsStatus.commentsFullHeightEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Open the comments at full height",
                    "Opens the comment sheet at the full height of the screen instead of part "
                            + "way up. Drag it down to close it, as before.",
                    Settings.COMMENTS_FULL_HEIGHT
            ));
        }
        if (SettingsStatus.copyCommentsWithoutUsernameEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Copy comments without username",
                    "Copy only the comment text when using PineDrama's copy comment action.",
                    Settings.COPY_COMMENTS_WITHOUT_USERNAME
            ));
        }
        if (SettingsStatus.commenterDetailsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show commenters' handles",
                    "Show each commenter's @username instead of the display name they chose. A reply "
                            + "to a reply names the person it answers the same way once their own "
                            + "comment has loaded.",
                    Settings.SHOW_COMMENTER_HANDLE
            ));
            addPreference(new TogglePreference(
                    context,
                    "Show where commenters are from",
                    "Show the country a commenter's account is set to after the comment's time. "
                            + "Comments from accounts PineDrama sends no country for stay as they are.",
                    Settings.SHOW_COMMENTER_REGION
            ));
            addPreference(new TogglePreference(
                    context,
                    "Color commenter names",
                    "Give each commenter's name a color of its own, the same one every time you see "
                            + "that account, so a long thread is easier to follow.",
                    Settings.COLOR_COMMENTER_NAMES
            ));
        }

        boolean hiding = SettingsStatus.hideCommentQuickReactionsEnabled
                || SettingsStatus.hideCommentEggsEnabled;
        if (hiding) {
            addPreference(new SectionHeadingPreference(context, "Hiding"));
        }
        if (SettingsStatus.hideCommentQuickReactionsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide comment typing suggestions",
                    "Hide the quick emoji row and automatic sticker suggestions that appear while you type. The emoji and sticker buttons still work.",
                    Settings.HIDE_COMMENT_QUICK_REACTIONS
            ));
        }
        if (SettingsStatus.hideCommentEggsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide comment popup ads",
                    "Stop the brand animation that plays over the comments when what someone typed matches an advertiser's trigger.",
                    Settings.HIDE_COMMENT_EGGS
            ));
        }
        if (SettingsStatus.voiceCommentsEnabled
                || SettingsStatus.commentPhotosEnabled) {
            addPreference(new SectionHeadingPreference(context, "Writing"));
        }
        if (SettingsStatus.voiceCommentsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Allow voice comments",
                    "Show PineDrama's button for recording a spoken comment, on accounts that don't "
                            + "have it yet. It hasn't been tried on a real account, so it may not work.",
                    Settings.ENABLE_VOICE_COMMENTS
            ));
        }
        if (SettingsStatus.commentPhotosEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Allow photo comments",
                    "Show the gallery tab in the comment box, so you can add a photo to a comment. "
                            + "PineDrama turns it off for everyone, and its server still decides whether "
                            + "your account can post one.",
                    Settings.PINEDRAMA_COMMENT_PHOTOS
            ));
        }
    }

    /** What the translation switch brings back, by which of its two hooks this build has. */
    static String translationSummary() {
        // Each one whole, so the translation tables' check finds it in the source as written.
        if (!SettingsStatus.feedTranslationsEnabled) {
            return "Brings back the translation rows on PineDrama's Language page, under Settings and privacy, "
                    + "for accounts that only see App language there.";
        }
        if (!SettingsStatus.languagePageTranslationsEnabled) {
            return "For accounts PineDrama took translation away from. Brings back See translation under video "
                    + "descriptions and in captions. Restart PineDrama to see the change.";
        }
        return "For accounts PineDrama took translation away from. Brings back See translation under video "
                + "descriptions and in captions, and the translation rows on the Language page in Settings "
                + "and privacy. Restart PineDrama to see it on videos.";
    }
}
