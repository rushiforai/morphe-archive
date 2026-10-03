/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import android.content.Context;
import android.text.format.DateUtils;

import androidx.annotation.Nullable;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Show a story's exact time" patch.
 *
 * <p>Instagram labels a story with how long ago it went up ("3h") through one method of the story
 * item. That method takes the time the story was posted, in seconds by the phone's clock, and hands
 * it to Instagram's relative formatter. The patch asks {@link #label} first, with that time, and
 * the method answers the label it gets back, or goes on to Instagram's own when it gets null.
 *
 * <p>Both story headers ask the story item for its label. One of them picks a second relative
 * formatter instead while one of Instagram's server flags is on, so the patch passes that flag's
 * answer through {@link #relativeHeader}, which answers off while the exact time is shown.
 */
public final class StoryTime {
    /** The date, with the month short, and the time. The year shows only for another year. */
    static final int FORMAT = DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_SHOW_TIME | DateUtils.FORMAT_ABBREV_MONTH;

    /** Past this many seconds, the time in milliseconds no longer fits a long. */
    private static final long LAST_SECOND = Long.MAX_VALUE / 1000L;

    private StoryTime() {
    }

    /** Whether the exact time is shown: the settings are read and the switch is on, which a pause answers off. */
    private static boolean on() {
        return Utils.settingsReady() && Settings.SHOW_STORY_TIME.get();
    }

    /**
     * Injected in the story item's time label, in front of Instagram's own formatting, with the time
     * the story was posted in seconds. Answers that date and time in the phone's language, time
     * zone and 12 or 24-hour setting while the switch is on. Answers null, for Instagram's own
     * label, while it's off, HushGram is paused, the settings aren't ready or the time isn't one.
     * Never throws.
     */
    @Nullable
    public static String label(long seconds) {
        try {
            HookStatus.invoked(FamilyNames.STORY_TIME);
            if (seconds <= 0 || seconds > LAST_SECOND || !on()) return null;
            Context context = Utils.getContext();
            return context == null ? null : DateUtils.formatDateTime(context, seconds * 1000L, FORMAT);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_TIME, "story time label", failure);
            return null;
        }
    }

    /**
     * Injected right after a story header reads the server flag that has it format the time with
     * its second relative formatter, with the flag's answer as an int. Answers off while the exact
     * time is shown, so the header asks the story item for its label, and Instagram's answer
     * otherwise. Never throws.
     */
    public static boolean relativeHeader(int answer) {
        boolean instagram = answer != 0;
        try {
            return instagram && !on();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_TIME, "story header flag", failure);
            return instagram;
        }
    }
}
