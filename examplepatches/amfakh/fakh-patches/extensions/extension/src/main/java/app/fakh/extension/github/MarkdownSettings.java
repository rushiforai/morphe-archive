/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.webkit.JavascriptInterface;
import android.webkit.WebView;

import app.fakh.extension.shared.Features;

/**
 * What the scripts of the markdown page ask about the patches: which are on, and how wide a tab is. The patch hands
 * each new markdown view to {@link #attach}.
 */
@SuppressWarnings("unused")
public final class MarkdownSettings {
    static final String TAB_WIDTH = "fakh_tab_width_spaces";
    // The width to bring back once the override is on again.
    private static final String LAST_TAB_WIDTH = "fakh_tab_width_last";

    private MarkdownSettings() {
    }

    /**
     * Lets the page of a markdown view ask about the patches.
     *
     * @param view The new view.
     */
    public static void attach(WebView view) {
        view.addJavascriptInterface(new MarkdownSettings(), "fakhSettings");
    }

    /**
     * The tab width until the user picks one. The Override tab width patch makes this return its option.
     *
     * @return The app's 8 unless patched.
     */
    public static int defaultTabWidth() {
        return 8;
    }

    /** How many spaces a tab takes in code blocks: the one picked in the app, otherwise the patch's option. */
    static int pickedTabWidth() {
        return savedWidth(TAB_WIDTH);
    }

    /**
     * Switches the override: off keeps the picked width for later and picks the app's 8, on brings that width back.
     *
     * @param on The new position of the switch.
     */
    static void overrideTabWidth(boolean on) {
        if (!on) Features.setText(LAST_TAB_WIDTH, String.valueOf(pickedTabWidth()));
        Features.setText(TAB_WIDTH, String.valueOf(on ? lastTabWidth() : 8));
    }

    /** The width the override had when it was last switched off, otherwise the patch's option. */
    static int lastTabWidth() {
        return savedWidth(LAST_TAB_WIDTH);
    }

    /** The width saved under a key, otherwise the patch's option. */
    private static int savedWidth(String key) {
        try {
            return Integer.parseInt(Features.text(key, String.valueOf(defaultTabWidth())));
        } catch (NumberFormatException error) {
            return defaultTabWidth();
        }
    }

    /**
     * Whether a patch is on. Called by the page, off the main thread.
     *
     * @param id The patch's switch.
     * @return True when the switch is on.
     */
    @JavascriptInterface
    public boolean on(String id) {
        return Features.on(id);
    }

    /**
     * How wide a tab is. Called by the page, off the main thread.
     *
     * @return The number of spaces.
     */
    @JavascriptInterface
    public int tabWidth() {
        return pickedTabWidth();
    }
}
