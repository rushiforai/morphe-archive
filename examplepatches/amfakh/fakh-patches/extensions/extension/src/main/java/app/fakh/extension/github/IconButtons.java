/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.res.Resources;

import java.util.Locale;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * The floating buttons that show only their icon. A button is known by its label, in the app's language, and keeps that
 * label for screen readers.
 */
@SuppressWarnings("unused")
public final class IconButtons {
    // The labels of the floating buttons: issues and pull requests, discussions, the home screen and Actions.
    private static final String[] LABELS = {
            "issue_pr_comment",
            "label_locked_badge",
            "discussions_write_comment",
            "discussions_write_comment_locked",
            "discussions_suggest_answer",
            "home_bar_of_actions_new_session_label",
            "actions_cancel_workflow_button_label",
            "copilot_fix_failing_check_cta",
    };

    // The labels of the floating buttons that end in a menu arrow and upper-case their text themselves.
    private static final String[] MENU_LABELS = {"actions_rerun_check_button_label", "commit_changes_button_label"};

    // The label the menu button being drawn no longer shows, until its arrow reads it.
    private static String hidden;

    private IconButtons() {
    }

    /**
     * The space after the icon of a button.
     *
     * @param label The button's label.
     * @return None for a button without text, otherwise the app's 8dp.
     */
    public static float gap(String label) {
        return isFloating(label) ? 0 : 8;
    }

    /**
     * What a screen reader says for the icon of a button.
     *
     * @param label The button's label.
     * @return The label for a button without text, otherwise null as in the app, whose text is read instead.
     */
    public static String description(String label) {
        return isFloating(label) ? label : null;
    }

    /**
     * The text a button with an icon shows.
     *
     * @param label The button's label.
     * @return Nothing for a floating button, otherwise the label.
     */
    public static String text(String label) {
        return isFloating(label) ? "" : label;
    }

    /**
     * The text a menu button shows. Remembers a label it hides for {@link #menuDescription}.
     *
     * @param label The upper-cased label.
     * @return Nothing for a floating button, otherwise the label.
     */
    public static String menuText(String label) {
        hidden = null;
        if (!on()) return label;
        for (String name : MENU_LABELS) {
            String original = string(name);
            if (original != null && label.equals(original.toUpperCase(Locale.ROOT))) {
                hidden = original;
                return "";
            }
        }
        return label;
    }

    /**
     * What a screen reader says for the arrow of the menu button drawn last. The arrow takes the label, because the
     * icon before the text is drawn before the label is read.
     *
     * @return The text the button no longer shows, or null as in the app for a button that shows its text.
     */
    public static String menuDescription() {
        return hidden;
    }

    /**
     * What a screen reader says for the icon of the review button.
     *
     * @return The text the button no longer shows, or null as in the app while it shows its text.
     */
    public static String reviewDescription() {
        return on() ? string("issue_pr_review_review_finish") : null;
    }

    /**
     * The text the review button shows.
     *
     * @param label The app's text.
     * @return Nothing while the switch is on, otherwise the text.
     */
    public static String reviewText(String label) {
        return on() ? "" : label;
    }

    /** Whether floating buttons show only their icon. */
    private static boolean on() {
        return Features.on("fakh_icon_only_buttons");
    }

    /** Whether this is the label of one of the floating buttons. */
    private static boolean isFloating(String label) {
        if (!on()) return false;
        for (String name : LABELS) {
            if (label.equals(string(name))) return true;
        }
        return false;
    }

    /** A string of the app by its resource name, or null when it has none by that name. */
    @SuppressWarnings("DiscouragedApi")
    private static String string(String name) {
        Application app = AppRuntime.application();
        if (app == null) return null;
        Resources resources = app.getResources();
        int id = resources.getIdentifier(name, "string", app.getPackageName());
        return id == 0 ? null : resources.getString(id);
    }
}
