/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.preference.Preference;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import app.morphe.extension.facebook.settings.SettingsRows.Row;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.Setting;

/**
 * The note under the status card for someone who updated from a build made before 32 patches
 * joined Morphe Manager's default selection with their switches starting off. A switch left as it
 * started was never stored, so one of those that started on before is off after the update, and
 * nothing records the build before to say it was on. The note names the ones in this build still
 * at that new start, and goes for good once it's opened.
 */
@SuppressWarnings("deprecation")
final class StartsOffNote {
    /** The note row's key. It stores nothing: no setting has this name. */
    static final String KEY = "action_starts_off_note";

    static final int UNDECIDED = 0;
    static final int SHOW = 1;
    static final int DONE = 2;

    /** When the APK running now was installed, or null to ask the package manager. A test sets it. */
    @Nullable
    static volatile Long installedAtForTests;

    private StartsOffNote() {
    }

    /**
     * Whether the note is owed: decided once, at the first start of a build that has it, then shown
     * until it's opened. It's Hushfacebook's own state, like the release check's, so it keeps its
     * value while paused and never goes in a settings file. A class of its own, so nothing here
     * loads a setting before the context is set.
     */
    static final class Stored {
        static final IntegerSetting STATE = new IntegerSetting("hushfacebook_starts_off_note", UNDECIDED, false, false);

        static {
            Setting.keepWhenPaused(STATE);
        }

        private Stored() {
        }
    }

    /**
     * The switches that started on before and start off now, in the order the changelog names
     * them. Each one belongs to a patch that joined the default selection.
     */
    static List<BooleanSetting> startedOn() {
        return Arrays.asList(Settings.HIDE_FEED_REELS, Settings.BLOCK_RETURN_REFRESH, Settings.HIDE_TOP_STORIES_TRAY,
                Settings.HIDE_STORIES_BETWEEN_POSTS, Settings.BLOCK_STORY_AUTO_ADVANCE, Settings.VIEW_STORIES_ANONYMOUSLY,
                Settings.HIDE_REEL_CHIPS, Settings.HIDE_REEL_FOLLOW_BUTTON, Settings.HIDE_REEL_SOCIAL_FOOTER,
                Settings.DONT_SEND_REEL_WATCH_HISTORY, Settings.TURN_OFF_DOUBLE_TAP_LIKE, Settings.HOLD_REEL_FOR_2X,
                Settings.DEFAULT_COMMENT_ORDER, Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT, Settings.TAP_TO_PLAY,
                Settings.DEFAULT_PLAYBACK_QUALITY, Settings.PICTURE_IN_PICTURE, Settings.TURN_OFF_HDR_BRIGHTNESS,
                Settings.USE_SYSTEM_FONT, Settings.USE_SYSTEM_EMOJI, Settings.TURN_OFF_HAPTICS,
                Settings.TURN_OFF_SCREEN_TRANSITIONS, Settings.DOWNLOAD_VIDEOS, Settings.HIDE_REELS_TAB,
                Settings.HOLD_ANALYTICS_UPLOADS, Settings.ALLOW_SCREENSHOTS, Settings.BLOCK_SCREENSHOT_DETECTION,
                Settings.HIDE_CHAT_TYPING, Settings.HIDE_COMMENT_TYPING, Settings.HIDE_READ_RECEIPTS);
    }

    /**
     * Called once per Facebook start, from SettingsEntry.onApplicationCreate after the context is
     * set. The first start of a build with the note decides it for good, so a later update never
     * asks again and a fresh install of this build never sees it.
     */
    static void onFacebookStart(Context context) {
        try {
            if (!Utils.settingsReady() || !Utils.isMainProcess()) return;
            if (Stored.STATE.savedValue() != UNDECIDED) return;
            long firstStart = BaseSettings.FIRST_TIME_APP_LAUNCHED.savedValue();
            Stored.STATE.save(updated(firstStart, installedAt(context)) ? SHOW : DONE);
        } catch (Throwable failure) {
            Logger.printException(() -> "Starts off note: could not decide whether it's owed", failure);
        }
    }

    /**
     * Whether Hushfacebook first started on this install at [firstStart], before the APK running
     * now went in at [installedAt]: an earlier build ran here and kept its settings. A fresh
     * install's first start comes after its APK went in, and a time Android won't give says no. A
     * Root Mount install reports the stock APK's time, so a patch mounted over the same stock
     * build says no, and the note shows only once the stock app itself updates.
     */
    static boolean updated(long firstStart, long installedAt) {
        return firstStart > 0 && installedAt > 0 && firstStart < installedAt;
    }

    private static long installedAt(Context context) {
        Long forced = installedAtForTests;
        if (forced != null) return forced;
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).lastUpdateTime;
        } catch (PackageManager.NameNotFoundException | RuntimeException failure) {
            return 0;
        }
    }

    /**
     * The switches the note names for [build]: those that started on before, belong to a patch in
     * this build, are off and were never stored, so nobody chose off for them.
     */
    static List<BooleanSetting> unset(Set<PatchFamily> build) {
        SharedPreferences store = Setting.preferences.preferences;
        List<BooleanSetting> unset = new ArrayList<>();
        for (BooleanSetting setting : startedOn()) {
            if (setting.savedValue() || store.contains(setting.key)) continue;
            for (PatchFamily family : build) {
                if (!family.switches.contains(setting)) continue;
                unset.add(setting);
                break;
            }
        }
        return unset;
    }

    /**
     * The note row, or null when none is owed or every switch it would name is set. A tap opens
     * the names and the note is read, so the next time the settings open it's gone. A second tap
     * takes it off this page at once. Nothing asks first.
     */
    @Nullable
    static Preference row(Context context, Set<PatchFamily> build) {
        if (Stored.STATE.savedValue() != SHOW) return null;
        List<String> names = new ArrayList<>();
        for (BooleanSetting setting : unset(build)) names.add(SwitchLabels.title(setting));
        if (names.isEmpty()) return null;
        String closed = L10n.t("After this update, a switch you had on may be off now. Tap to see which.");
        String open = L10n.quantity(names.size(),
                "Now off: %1$s. Turn it back on in its section if you want it. Tap again to hide this note.",
                "Now off: %1$s. Turn back on the ones you want in their sections. Tap again to hide this note.",
                L10n.join(names));
        Row row = new Row(context);
        row.setKey(KEY);
        row.setPersistent(false);
        // A tap opens the names or hides the note, so the row goes without a chevron.
        row.actsAtOnce = true;
        row.setTitle(L10n.quantity(names.size(), "%1$d switch starts off now", "%1$d switches start off now",
                names.size()));
        row.setSummary(closed);
        row.setOnPreferenceClickListener(p -> {
            if (closed.contentEquals(p.getSummary())) {
                p.setSummary(open);
                Stored.STATE.save(DONE);
            } else if (p.getParent() != null) {
                p.getParent().removePreference(p);
            }
            return true;
        });
        return row;
    }
}
