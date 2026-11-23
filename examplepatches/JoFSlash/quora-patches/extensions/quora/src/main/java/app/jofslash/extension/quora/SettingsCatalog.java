package app.jofslash.extension.quora;

import java.util.HashMap;
import java.util.Map;

/**
 * Where each switch in the patch settings goes, and one line about what it does.
 * Keys not listed here show up under "Other" with no line.
 */
final class SettingsCatalog {

    static final String[] CATEGORIES = {"Privacy", "Feed", "Reading", "Writing", "App", "Other"};

    private static final Map<String, String[]> ENTRIES = new HashMap<>();

    /** Switches whose change only shows after the app restarts. */
    static final java.util.Set<String> RESTART = new java.util.HashSet<>(java.util.Arrays.asList(
            "hideTabs", "startTab", "textSize", "disablePullToRefresh", "disableSwipeBetweenFeeds"));

    private static void add(String key, String category, String help) {
        ENTRIES.put(key, new String[]{category, help});
    }

    static {
        add("removeAds", "Privacy", "Promoted answers, sponsored posts and ad requests.");

        add("hideQuoraPlusAnswers", "Feed", "Answers only Quora+ subscribers can read.");
        add("hideQuoraPlusPromotions", "Feed", "\"Try Quora+\" buttons.");
        add("hideAiAnswers", "Feed", "Answers written by Poe bots.");
        add("hidePoe", "Feed", "Links and buttons that open Poe.");
        add("hideRelatedQuestions", "Feed", "Related questions on question pages.");
        add("hideSuggestedQuestions", "Feed", "Questions for you to answer.");
        add("hideSpacesSuggestions", "Feed", "\"Spaces you might like\".");
        add("hidePeopleSuggestions", "Feed", "\"People you may know\".");
        add("hideSpacesPosts", "Feed", "Posts from Spaces, so the feed shows answers only.");
        add("hideSeen", "Feed", "Items you already opened, when they come back.");
        add("hideOldAnswers", "Feed", "Answers older than the years set below.");
        add("filterKeywords", "Feed", "Items that mention your keywords (see Filters).");
        add("blockAuthors", "Feed", "Items from the people and Spaces in Filters.");
        add("hideAnonymousAnswers", "Feed", "Answers written as \"Anonymous\".");
        add("hideCounts", "Feed", "Upvote, view, comment and share numbers.");
        add("hideDownvoteButton", "Feed", "The downvote button.");
        add("hideCommentPreviews", "Feed", "\"123 comments from … and more\" rows.");
        add("hideCredentials", "Feed", "The line under authors' names.");
        add("hideFollowButtons", "Feed", "The small Follow next to names.");
        add("hideSurveys", "Feed", "\"How satisfied are you…\" and \"Was this worth your time?\" boxes.");
        add("hideAskBox", "Feed", "The \"What do you want to ask or share?\" box.");
        add("hideMoreStories", "Feed", "The red \"More Stories\" button over the feed.");
        add("hideDismissedQuestions", "Feed", "Answers to questions you marked \"Not interested\".");
        add("hideCommentBox", "Reading", "The \"Add a comment…\" field under answers.");

        add("copyAnswerText", "Reading", "A Copy button next to Share under answers.");
        add("shareAnswerText", "Reading", "A Share text button next to Share under answers.");
        add("sortAnswers", "Reading", "Questions open with answers in the order set below.");
        add("readingHistory", "Reading", "Remembers what you open (see History).");
        add("bookmarks", "Reading", "A bookmark button under open answers; saved ones read offline (see Bookmarks).");
        add("translateAnswerText", "Reading", "A Translate button next to Share under answers.");
        add("readAloud", "Reading", "A Read aloud button next to Share under answers.");
        add("fullscreenReading", "Reading", "Bars hide while you scroll down.");
        add("expandAnswers", "Reading", "Shortened answers open in full.");
        add("comfortableReading", "Reading", "More space between lines and paragraphs.");
        add("answerFont", "Reading", "Answers in the font set below.");
        add("amoledDark", "Reading", "Pure black with Quora's dark theme.");
        add("textSize", "Reading", "Text at the size set below. Applies after a restart.");
        add("enableTextSelection", "Reading", "Select and copy text anywhere.");
        add("dataSaver", "Reading", "Images load when you tap them.");
        add("dataSaverOnWifi", "Reading", "With Data saver, images still load on Wi-Fi.");
        add("disableVideoAutoplay", "Reading", "Videos play only when you tap them.");
        add("keepScreenOn", "Reading", "The screen stays on while a page is open.");

        add("wordCount", "Writing", "Words and characters while you write an answer or post.");

        add("hideTabs", "App", "Removes the tabs set below. Applies after a restart.");
        add("startTab", "App", "Opens on the tab set below. Applies after a restart.");
        add("hideBadges", "App", "Red dots and numbers on the tabs.");
        add("hideAskButton", "App", "The Ask button in the top bar.");
        add("openLinksInBrowser", "App", "Other websites open in your browser.");
        add("keepPlaceOnReturn", "App", "Coming back keeps the open answer and the feed.");
        add("disablePullToRefresh", "App", "Pulling down doesn't reload the page. Applies after a restart.");
        add("disableSwipeBetweenFeeds", "App", "Swiping sideways doesn't change the feed. Applies after a restart.");
        add("disableTabPrefetching", "App", "Other tabs load only when you open them.");
        add("disableVibration", "App", "No vibration when you tap buttons.");
        add("disableSignInPrompts", "App", "No \"Save password?\" or automatic sign-in.");
        add("blockPromotionalNotifications", "App", "Drops digests and promotions.");
        add("filterUpdates", "App", "Fixes for hiding things when Quora changes its pages, from GitHub once a day.");
    }

    private SettingsCatalog() {
    }

    /** Every switch listed here. */
    static java.util.Set<String> keys() {
        return new java.util.HashSet<>(ENTRIES.keySet());
    }

    static String category(String key) {
        String[] entry = ENTRIES.get(key);
        return entry == null ? "Other" : entry[0];
    }

    static String help(String key) {
        String[] entry = ENTRIES.get(key);
        return entry == null ? null : entry[1];
    }
}
