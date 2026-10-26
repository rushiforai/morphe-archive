/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import app.pixkk.extension.core.Settings;

/**
 * Keeps See more on the description from opening the full text in a new screen.
 *
 * TikTok asks its description delegate to navigate to the post-mode detail page and, when that
 * answers true, stops there. Answering false instead lets the same method carry on to the
 * expand-in-place it has always had. Only the See more button and a tap on the text are changed:
 * collapsing, and any other entry, still go the way TikTok sends them.
 */
public final class DescriptionExpand {
    private static final String SEE_MORE_BUTTON = "SEE_MORE_BTN";
    private static final String TAP_TEXT = "TAP_TEXT";

    private DescriptionExpand() {
    }

    /**
     * @param navigates what TikTok's delegate answered: true when it opened the detail screen.
     * @param mechanism the {@code PostModeEntranceMechanism} that triggered the call, or null.
     * @return the answer TikTok should act on.
     */
    public static boolean keepInPlace(boolean navigates, Object mechanism) {
        if (!navigates || !Settings.EXPAND_DESCRIPTION_IN_PLACE.get()) return navigates;
        return !isSeeMore(mechanism);
    }

    /**
     * @param mechanism the {@code PostModeEntranceMechanism} that triggered the call, or null.
     * @return true when the delegate should answer false at once, without opening the detail
     *         screen: the setting is on and the call is See more or a tap on the text.
     */
    public static boolean keepOutOfDetail(Object mechanism) {
        return Settings.EXPAND_DESCRIPTION_IN_PLACE.get() && isSeeMore(mechanism);
    }

    /**
     * @param viewerOn TikTok's visual-search flag: true when See more and a tap on the text open
     *                 the description in the full-screen search viewer.
     * @param mechanism the {@code PostModeEntranceMechanism} that triggered the call, or null.
     * @return the flag TikTok should act on: off for See more when the setting is on.
     */
    public static boolean keepSearchViewerOff(boolean viewerOn, Object mechanism) {
        if (!viewerOn || !Settings.EXPAND_DESCRIPTION_IN_PLACE.get()) return viewerOn;
        return !isSeeMore(mechanism);
    }

    private static boolean isSeeMore(Object mechanism) {
        if (!(mechanism instanceof Enum)) return false;
        String name = ((Enum<?>) mechanism).name();
        return SEE_MORE_BUTTON.equals(name) || TAP_TEXT.equals(name);
    }
}
