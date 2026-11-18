package app.afterglow.extension.navigation;

import android.net.Uri;

import java.util.ArrayList;
import java.util.Collection;

import app.afterglow.extension.Afterglow;

/**
 * The iOS "Privacy" settings. Injection points of {@code tweaks/navigation/PrivacyHooksPatch.kt};
 * the link rules are in {@link LinkCleaner}.
 */
@SuppressWarnings("unused")
public final class PrivacyHooks {
    private static final String NO_LINK_TRACKING = "noLinkTracking";
    private static final String NO_SHARE_CHUNK = "noShareChunk";
    private static final String NO_SEARCH_HISTORY = "noSearchHistory";

    private PrivacyHooks() {}

    /**
     * Injection point: a link YouTube is about to open (descriptions, comments, posts). Same rules
     * as iOS UIApplication openURL: (ytagSanitizedOpenURL): redirects first, then the share id.
     */
    public static Uri openedLink(Uri uri) {
        try {
            if (uri == null) return null;
            String original = uri.toString();
            String link = original;
            if (Gate.on(Gate.PRIVACY, NO_LINK_TRACKING)) link = LinkCleaner.unwrapRedirect(link);
            if (Gate.on(Gate.PRIVACY, NO_SHARE_CHUNK)) link = LinkCleaner.removeShareIdentifier(link);
            if (!link.equals(original)) return Uri.parse(link);
        } catch (Throwable error) {
            Afterglow.error("PrivacyHooks.openedLink", error);
        }
        return uri;
    }

    /** Injection point: the link or text YouTube copies or hands to the share sheet. */
    public static String sharedText(String text) {
        try {
            if (text != null && Gate.on(Gate.PRIVACY, NO_SHARE_CHUNK)) return LinkCleaner.removeShareIdentifier(text);
        } catch (Throwable error) {
            Afterglow.error("PrivacyHooks.sharedText", error);
        }
        return text;
    }

    /**
     * Injection point: the suggestions the search box is about to show (search history, trending
     * and typed suggestions). iOS noSearchHistory drops them all (YTSearchViewController
     * setSuggestions: and YTPersonalizedSuggestionsCacheProvider activeCache).
     */
    public static Collection<?> searchSuggestions(Collection<?> original) {
        try {
            if (original != null && Gate.on(Gate.PRIVACY, NO_SEARCH_HISTORY)) return new ArrayList<>();
        } catch (Throwable error) {
            Afterglow.error("PrivacyHooks.searchSuggestions", error);
        }
        return original;
    }
}
