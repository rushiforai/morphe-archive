/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;

/**
 * Replaces the "Home" header title on the Home screen with the signed-in user's username or display name.
 */
@SuppressWarnings("unused")
public final class HomeHeaderText {
    static final String KEY = "fakh_home_title";
    static final String MODE_USERNAME = "username";
    static final String MODE_NAME = "name";
    static final String MODE_HOME = "home";

    // The signed-in account as the Home header last got it, so the sheet can show what each choice reads.
    private static String accountLogin;
    private static String accountName;

    private HomeHeaderText() {
    }

    /** The chosen mode: {@code "username"} (default), {@code "name"}, or {@code "home"}. */
    static String mode() {
        String saved = Features.text(KEY, MODE_USERNAME);
        if (MODE_NAME.equals(saved) || MODE_HOME.equals(saved)) return saved;
        return MODE_USERNAME;
    }

    /**
     * The label of a choice in the sheet.
     *
     * @param mode One of the three modes.
     * @return The translated name of the choice, followed by the username or name it shows, in brackets, once known.
     */
    static String choice(String mode) {
        if (MODE_HOME.equals(mode)) return I18n.tr("Home");
        boolean byName = MODE_NAME.equals(mode);
        String label = I18n.tr(byName ? "Name" : "Username");
        String shown = byName ? accountName : accountLogin;
        return shown == null || shown.trim().isEmpty() ? label : label + " (" + shown.trim() + ")";
    }

    /**
     * Resolves the Home screen header title.
     *
     * @param login    The signed-in user's username.
     * @param name     The signed-in user's display name, if set.
     * @param original GitHub's default "Home" title.
     * @return The title to display.
     */
    public static String headerText(String login, String name, String original) {
        accountLogin = login;
        accountName = name;
        if (!Features.has(KEY)) return original;
        String chosen = mode();
        if (MODE_HOME.equals(chosen)) return original;
        if (MODE_NAME.equals(chosen) && name != null && !name.trim().isEmpty()) return name.trim();
        if (login != null && !login.trim().isEmpty()) return login.trim();
        return original;
    }
}
