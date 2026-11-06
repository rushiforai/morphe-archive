/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

import app.morphe.extension.shared.L10n;

/**
 * A long press on the Threads logo at the top of the home feed opens the HushThreads screen.
 * Threads makes its logo clickable with Compose's clickable, and the settings patch sends that one
 * call here instead, to Compose's combined clickable with the same arguments: Threads' own tap stays
 * the tap, and {@link #LONG_PRESS} becomes the long press. Nothing here asks whether HushThreads is
 * paused, since its screen is where it's resumed.
 *
 * <p>The logo doubles as Threads' refresh spinner, so TalkBack used to land on the spinner inside
 * it, say "Progress bar" and never mention the long press. The clickable now ends with Compose's
 * clearAndSetSemantics and {@link #DESCRIBE}, which names the logo {@link #LABEL} and leaves the
 * spinner out, so TalkBack lands on the clickable itself and offers its long press.
 */
@SuppressWarnings("unused")
public final class ThreadsLogo {
    /** What TalkBack calls the logo. It's the app's name, so it stays the same in every language. */
    static final String LABEL = "Threads";

    /**
     * The one long press every draw of the logo gets. Compose compares a clickable's handlers each
     * time the header is drawn, and the same one each time leaves the logo's click as it was.
     */
    static final LongPress LONG_PRESS = new LongPress();

    /** The one description every draw gets, for the same reason as {@link #LONG_PRESS}. */
    static final Describe DESCRIBE = new Describe();

    /** What a test says about {@link #inBuild()}, or null to take the patch's answer. */
    static volatile Boolean inBuildForTests;

    private ThreadsLogo() {
    }

    /** Whether the settings patch put the long press into this build, which a Threads build it doesn't fit leaves out. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : patchedIn();
    }

    /** Written by the settings patch to answer true once the long press is in. */
    static boolean patchedIn() {
        return false;
    }

    /** TalkBack names the action in the current app language each time the header is drawn. */
    public static String longClickLabel() {
        return L10n.t("Open HushThreads settings");
    }

    /**
     * The logo's long press each time the header is drawn: {@link #LONG_PRESS}, or none with its
     * switch off, which leaves the logo with Threads' own tap and nothing for TalkBack to offer.
     */
    public static Object longPress() {
        return SettingsEntry.logoPressOn() ? LONG_PRESS : null;
    }

    /**
     * Written by the settings patch, and called by Threads' feed header where it makes the logo
     * clickable: Compose's combined clickable with Threads' interaction source, indication, modifier,
     * role, label, tap and enabled flag, {@link #longPress()} as the long press, and no double tap,
     * then clearAndSetSemantics with {@link #DESCRIBE} when the build has it. Every parameter but
     * the label and the flag is one of Threads' own types, which this build can't name. Until the
     * patch writes it, the logo just keeps its modifier.
     */
    public static Object clickable(Object interactionSource, Object indication, Object modifier, Object role,
                                   String onClickLabel, Object onClick, boolean enabled) {
        return modifier;
    }

    /**
     * Written by the settings patch: Compose's contentDescription setter on the semantics receiver
     * {@link Describe#invoke} is handed. The receiver is one of Threads' own types. Until the patch
     * writes it, nothing is described.
     */
    public static void describe(Object receiver, String label) {
    }

    /**
     * The logo's long press. The settings patch makes it a {@code kotlin.jvm.functions.Function0},
     * which this build can't name, and Compose calls {@link #invoke()} when the logo is long-pressed.
     */
    public static final class LongPress {
        public Object invoke() {
            // A header drawn before the switch went off keeps this long press until Threads draws
            // it again, and then it does nothing.
            if (SettingsEntry.logoPressOn()) SettingsEntry.openFromLogo();
            return null;
        }
    }

    /**
     * The logo's semantics. The settings patch makes it a {@code kotlin.jvm.functions.Function1},
     * and Compose calls {@link #invoke(Object)} with its semantics receiver each time it reads them.
     */
    public static final class Describe {
        public Object invoke(Object receiver) {
            describe(receiver, LABEL);
            return null;
        }
    }
}
