/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import android.view.View;

import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide suggested people on profiles" patch.
 *
 * <p>Instagram draws the accounts it suggests on a profile three ways, and the server picks which:
 * a row of them inside the row of action buttons (Follow, Message), a row of its own under the
 * header, and a person-plus button beside the action buttons that opens them (Discover people on
 * your own profile). The patch hands each of them here as Instagram builds it:
 * <ul>
 *   <li>{@link #inlineRow} gets the flag the action row reads to show its suggestions, and a 0 sends
 *       it down Instagram's own path for no suggestions, which hides the row's container;</li>
 *   <li>{@link #keepStandaloneRow} is asked before the header adds its row of suggestions, and a 0
 *       leaves the row out of the header's list, so nothing is bound for it;</li>
 *   <li>{@link #chainingButton} gets the person-plus button once Instagram has set it up, and hides
 *       it.</li>
 * </ul>
 * Every other row of the header (bio, counts, links, highlights) and the action buttons themselves
 * are left alone, and so are the follower and following lists, which are built elsewhere.
 *
 * <p>Each hook fails open: with the switch off, HushGram paused, the settings not read yet or
 * anything thrown, Instagram's own answer stands.
 */
public final class ProfileSuggestions {
    /** The diagnostic counter route: what each hook was handed, and what it hid. */
    static final String ROUTE = "Profile suggestions";

    static final String INLINE_ROW = "inline row";
    static final String STANDALONE_ROW = "standalone row";
    static final String CHAINING_BUTTON = "discover people button";

    /**
     * The person-plus buttons this class hid, with the visibility each had. Instagram reuses the
     * button between binds and never sets its visibility itself, so with the switch off a button
     * hidden earlier gets its own visibility back. Weak, so a button gone from the screen isn't kept.
     */
    private static final Map<View, Integer> hidden = new WeakHashMap<>();

    private ProfileSuggestions() {
    }

    /**
     * Injected right after the profile's action row reads whether to show its row of suggested
     * accounts. Answers 0 while the switch is on, and [show] otherwise, or when anything goes wrong.
     * A 0 coming in stays 0. Never throws.
     */
    public static int inlineRow(int show) {
        return inlineRow(show, ProfileSuggestions::switchedOn);
    }

    static int inlineRow(int show, BooleanSupplier on) {
        if (show == 0) return 0;
        return hides(INLINE_ROW, on) ? 0 : show;
    }

    /**
     * Injected where the profile header is about to add its row of suggested accounts. Answers 0,
     * leave it out, while the switch is on, and 1 otherwise, or when anything goes wrong. Never
     * throws.
     */
    public static int keepStandaloneRow() {
        return keepStandaloneRow(ProfileSuggestions::switchedOn);
    }

    static int keepStandaloneRow(BooleanSupplier on) {
        return hides(STANDALONE_ROW, on) ? 0 : 1;
    }

    /**
     * Injected right after Instagram sets up the person-plus button beside a profile's action
     * buttons. Hides it while the switch is on. Otherwise a button this hid before gets its old
     * visibility back, and any other is left as it is. Never throws.
     */
    public static void chainingButton(View button) {
        chainingButton(button, ProfileSuggestions::switchedOn);
    }

    static void chainingButton(View button, BooleanSupplier on) {
        if (button == null) return;
        boolean hide = hides(CHAINING_BUTTON, on);
        try {
            synchronized (hidden) {
                if (hide) {
                    int was = button.getVisibility();
                    button.setVisibility(View.GONE);
                    // Only the first hide records it: a later one would record GONE as its own.
                    if (!hidden.containsKey(button)) hidden.put(button, was);
                } else {
                    Integer was = hidden.remove(button);
                    if (was != null) button.setVisibility(was);
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROFILE_SUGGESTIONS, CHAINING_BUTTON, failure);
        }
    }

    /** Whether to hide this part now, counting it either way. False when anything goes wrong. */
    private static boolean hides(String part, BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.PROFILE_SUGGESTIONS);
            FeedFilterCounters.sawKind(ROUTE, part);
            if (!on.getAsBoolean()) return false;
            FeedFilterCounters.removed(ROUTE, 1, part);
            Logger.printDebug(() -> "Profile suggestions: hid the " + part);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROFILE_SUGGESTIONS, part, failure);
            return false;
        }
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.HIDE_PROFILE_SUGGESTIONS.get();
    }
}
