/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide Notes on profile pictures" patch: takes the Notes bubble off profile
 * pictures, yours included.
 *
 * <p>Instagram has its own switch for Notes on profiles, the {@code is_consumption_disabled}
 * parameter of its {@code ig4a_profile_unship_direct_notes} config, and reads it in two places: the
 * profile screen, which skips fetching the profile's Note when it's set, and the builder of the
 * profile header, which drops the Note it was about to draw. The patch hands each read's answer to
 * {@link #consumptionDisabled}, and with the switch on a no becomes a yes.
 *
 * <p>That leaves the prompt to post a Note ("Start your first note...") on your own picture, which
 * the header builder puts up in place of a Note it drops. The config's {@code is_creation_disabled}
 * parameter is what holds it back, read once by the same builder for your own profile, and the
 * patch hands that answer to {@link #creationDisabled}. Nothing else changes, so the Notes tray in
 * Messages and the Notes composer are as Instagram makes them.
 *
 * <p>Both hooks fail open: with the switch off, HushGram paused, the settings not read yet or
 * anything thrown, Instagram's own answer goes through.
 */
public final class ProfileNotes {
    /** What's counted for each time Instagram's answer is turned from no to yes. */
    static final String LEFT_OFF = "Notes left off profiles";

    /** What's counted for each time the prompt to post a Note is left off your own picture. */
    static final String PROMPT_LEFT_OFF = "Notes prompt left off your profile";

    private ProfileNotes() {
    }

    /**
     * Injected right after Instagram reads the flag that turns Notes off on profiles ([answer]
     * nonzero for yes). Answers yes while Hide Notes on profile pictures is on, and Instagram's own
     * answer otherwise. Never throws, and never waits for the settings.
     */
    public static boolean consumptionDisabled(int answer) {
        boolean instagram = answer != 0;
        try {
            HookStatus.invoked(FamilyNames.PROFILE_NOTES);
            if (instagram || !Utils.settingsReady() || !Settings.HIDE_PROFILE_NOTES.get()) return instagram;
            HookStatus.counted(FamilyNames.PROFILE_NOTES, LEFT_OFF);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROFILE_NOTES, "profile notes flag", failure);
            return instagram;
        }
    }

    /**
     * Injected right after the profile header reads the flag that keeps the prompt to post a Note
     * off your own picture ([answer] nonzero for yes). Answers yes while Hide Notes on profile
     * pictures is on, and Instagram's own answer otherwise. Never throws, and never waits for the
     * settings.
     */
    public static boolean creationDisabled(int answer) {
        boolean instagram = answer != 0;
        try {
            HookStatus.invoked(FamilyNames.PROFILE_NOTES);
            if (instagram || !Utils.settingsReady() || !Settings.HIDE_PROFILE_NOTES.get()) return instagram;
            HookStatus.counted(FamilyNames.PROFILE_NOTES, PROMPT_LEFT_OFF);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROFILE_NOTES, "profile notes prompt flag", failure);
            return instagram;
        }
    }
}
