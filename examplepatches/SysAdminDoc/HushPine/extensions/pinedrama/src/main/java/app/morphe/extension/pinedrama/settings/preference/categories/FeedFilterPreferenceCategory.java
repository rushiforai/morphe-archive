/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/FeedFilterPreferenceCategory.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/FeedFilterPreferenceCategory.java
 */

package app.morphe.extension.pinedrama.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;


import app.morphe.extension.pinedrama.settings.L10n;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.RangeValuePreference;
import app.morphe.extension.pinedrama.settings.preference.InputTextPreference;
import app.morphe.extension.pinedrama.settings.preference.NumberInputPreference;
import app.morphe.extension.pinedrama.settings.preference.CreatorListPreference;
import app.morphe.extension.pinedrama.settings.preference.SectionHeadingPreference;
import app.morphe.extension.pinedrama.settings.preference.TogglePreference;
import app.morphe.extension.pinedrama.feedfilter.AdvancedFeedRules;
import app.morphe.extension.pinedrama.feedfilter.CreatorExceptions;

/**
 * What reaches the feed, in the order a reader asks: which kinds of post, how much of them,
 * from whom and with which sounds, which words and countries, what was already seen, and the
 * one advanced switch. The buttons that block or hide from a video are on Feed screen with every
 * other control drawn on the video, so one page answers what shows up there.
 */
@SuppressWarnings("deprecation")
public class FeedFilterPreferenceCategory extends ConditionalPreferenceCategory {
    public FeedFilterPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Feed filter");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.feedFilterEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        // Each patch's rows go behind its own flag. The page is reachable when any of them
        // is in the bundle, and a page reachable because of one of them must not offer the
        // others' settings, which would sit there doing nothing.
        if (SettingsStatus.feedFilterEnabled) addAds(context);
        if (SettingsStatus.feedFilterEnabled) addKindsOfPost(context);
        if (SettingsStatus.feedFilterEnabled) addLimits(context);
        if (SettingsStatus.feedFilterEnabled) addCreatorsAndSounds(context);
        if (SettingsStatus.feedFilterEnabled) addWordsAndCountries(context);
        if (SettingsStatus.feedFilterEnabled && SettingsStatus.liveFeedFilterEnabled) addLiveFeed(context);
        if (SettingsStatus.feedFilterEnabled) addAdvanced(context);
    }

    private void addKindsOfPost(Context context) {
        addPreference(new SectionHeadingPreference(context, "Kinds of post"));
        addPreference(new TogglePreference(
                context,
                "Hide TikTok Shop", "Hide TikTok Shop posts from the feed, and the shop buttons under captions.",
                Settings.HIDE_SHOP
        ));
        addPreference(new TogglePreference(
                context,
                "Hide TikTok Shop in search", "Hide the Products block and product cards in search results.",
                Settings.HIDE_SEARCH_SHOP
        ));
        addPreference(new TogglePreference(
                context,
                "Hide LIVE videos", "Hide LIVE videos from the feed.",
                Settings.HIDE_LIVE
        ));
        addPreference(new TogglePreference(context, "Hide LIVE replays", "Hide recorded LIVE broadcasts from the feed.", Settings.HIDE_LIVE_REPLAYS));
        addPreference(new TogglePreference(
                context,
                "Hide unpersonalized feed videos",
                "Hide the fill-in videos PineDrama sends to the feed without picking them for you. When a whole batch is fill-in, it stays so the feed doesn't run dry.",
                Settings.HIDE_UNPERSONALIZED_FOR_YOU
        ));
        addPreference(new TogglePreference(
                context,
                "Latest first on Following",
                "Play the Following feed newest post first. A newer post that loads later moves up to right after the video you're watching, and nothing you've already scrolled past moves. Ads and LIVEs keep their place.",
                Settings.FOLLOWING_LATEST_FIRST
        ));
        addPreference(new TogglePreference(
                context,
                "Hide stories", "Hide stories from the feed.",
                Settings.HIDE_STORY
        ));
        addPreference(new TogglePreference(
                context,
                "Hide photo posts", "Hide photo posts from the feed.",
                Settings.HIDE_IMAGE
        ));
        addPreference(new TogglePreference(
                context,
                "Hide AI-generated videos",
                "Hide videos with PineDrama's AI-generated label, AI content credentials, a PineDrama AI effect "
                        + "such as AI Alive, or a tag like #ai or #aigenerated.",
                Settings.HIDE_AI_GENERATED
        ));
        addPreference(new TogglePreference(
                context,
                "Hide verified accounts",
                "Hide videos posted by verified accounts.",
                Settings.HIDE_VERIFIED
        ));
        addPreference(new TogglePreference(
                context,
                "Hide Series",
                "Hide videos that belong to a paid Series.",
                Settings.HIDE_SERIES
        ));
        addPreference(new TogglePreference(
                context,
                "Hide mini dramas",
                "Hide PineDrama's short drama episodes and the cards that promote them.",
                Settings.HIDE_MINI_DRAMAS
        ));
        addPreference(new TogglePreference(
                context,
                "Hide playlist videos",
                "Hide videos posted as part of a playlist.",
                Settings.HIDE_PLAYLIST_VIDEOS
        ));
        addPreference(new TogglePreference(
                context,
                "Hide subscriber-only videos",
                "Hide posts only a creator's subscribers can watch, the ones with a lock, on the feed and on profiles.",
                Settings.HIDE_SUBSCRIBER_ONLY
        ));
        // A kind of post, not an ad: its summary says it goes even when the badge isn't paid.
        addPreference(new TogglePreference(context, "Filter location-tagged videos",
                "Hide feed videos with place badges, even when they aren't paid ads.",
                Settings.FILTER_LOCATION_VIDEOS));
    }

    private void addAds(Context context) {
        addPreference(new SectionHeadingPreference(context, "Ads"));
        addPreference(new TogglePreference(
                context,
                "Remove feed ads",
                "Remove feed ads, creator commission posts, paid partnerships, and branded content.",
                Settings.REMOVE_ADS
        ));
        addPreference(new TogglePreference(
                context,
                "Hide paid partnerships",
                "Hide videos marked as paid partnership or branded content.",
                Settings.HIDE_PAID_PARTNERSHIP
        ));
        addPreference(new TogglePreference(context, "Hide promotional music",
                "Hide videos marked as using promotional music.", Settings.HIDE_PROMOTIONAL_MUSIC));
    }

    private void addLimits(Context context) {
        addPreference(new SectionHeadingPreference(context, "Limits"));
        addPreference(new NumberInputPreference(context, "Minimum video length", "Seconds. Zero keeps every length. Photo posts and videos without a known length stay. If everything the feed just sent would be filtered out, the video closest to your limit is kept.", Settings.MIN_VIDEO_SECONDS, "%1$s second", "%1$s seconds").zeroMeansOff());
        addPreference(new NumberInputPreference(context, "Maximum video length", "Seconds. Zero keeps every length. If everything the feed just sent would be filtered out, the video closest to your limit is kept so the feed isn't empty.", Settings.MAX_VIDEO_SECONDS, "%1$s second", "%1$s seconds").zeroMeansOff());
        addPreference(new NumberInputPreference(context, "Maximum post age",
                "Days. Zero keeps every age. Posts without a usable timestamp, including future posts, stay visible.",
                Settings.MAX_PUBLICATION_AGE_DAYS, "%1$s day", "%1$s days").zeroMeansOff());
        addPreference(new NumberInputPreference(context, "Maximum views per like", "Hide videos with a lot of views and few likes. Lower numbers are stricter, zero turns the rule off, and one video is kept back if everything the feed just sent would go.", Settings.MAX_VIEWS_PER_LIKE, "%1$s view per like", "%1$s views per like").zeroMeansOff());
        addPreference(new NumberInputPreference(context, "Maximum views per comment", "Hide videos with a lot of views and few comments. Works the same way as views per like. Zero turns it off.", Settings.MAX_VIEWS_PER_COMMENT, "%1$s view per comment", "%1$s views per comment").zeroMeansOff());
        addPreference(new RangeValuePreference(
                context,
                "Views range", "Show only videos with this many views.",
                Settings.MIN_MAX_VIEWS
        ));
        addPreference(new RangeValuePreference(
                context,
                "Likes range", "Show only videos with this many likes.",
                Settings.MIN_MAX_LIKES
        ));
        addPreference(new RangeValuePreference(
                context,
                "Comments range", "Show only videos with this many comments.",
                Settings.MIN_MAX_COMMENTS
        ));
        addPreference(new RangeValuePreference(
                context,
                "Favorites range", "Show only videos with this many favorites.",
                Settings.MIN_MAX_FAVOURITES
        ));
        addPreference(new RangeValuePreference(
                context,
                "Shares range", "Show only videos with this many shares.",
                Settings.MIN_MAX_SHARES
        ));
    }

    private void addCreatorsAndSounds(Context context) {
        addPreference(new SectionHeadingPreference(context, "Creators and sounds"));
        if (SettingsStatus.feedFilterEnabled) {
            addPreference(new InputTextPreference(context, "Blocked creators", "Separate "
                    + "account handles or user IDs with commas. Videos from these accounts are "
                    + "always hidden. An entry between slashes, like /^news_/, is a search "
                    + "pattern checked against the handle and display name.", Settings.BLOCKED_CREATORS)
                    .withCheck(AdvancedFeedRules::creatorEntryProblem).withNameKeyboard());
            addPreference(new CreatorListPreference(context, "Creators hidden on this phone",
                    "Creators you add here are hidden on this phone. Search the list and remove one at a time.",
                    Settings.LOCAL_HIDDEN_CREATORS));
            addPreference(new InputTextPreference(context, "Creator exceptions",
                    "Separate handles or user IDs with commas. Their videos stay when a filter "
                            + "on post type, labels, age, length or counts would hide them. "
                            + "Ads, blocked creators, words, sounds, countries and caption "
                            + "languages still apply.",
                    Settings.CREATOR_FILTER_EXCEPTIONS)
                    .withCheck(CreatorExceptions::entryProblem)
                    .withNote(CreatorExceptions::conflictNote)
                    .withNameKeyboard());
        }
        if (SettingsStatus.feedFilterEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide videos with blocked sounds",
                    "Hide videos that use a sound named or listed below.",
                    Settings.HIDE_BLOCKED_SOUNDS
            ));
            addPreference(new InputTextPreference(
                    context,
                    "Blocked sound names",
                    "Separate words with commas, like saxophone, to match against sound names. "
                            + "Capital letters don't matter.",
                    Settings.BLOCKED_SOUND_NAMES
            ));
            addPreference(new InputTextPreference(
                    context,
                    "Blocked sound ids",
                    "Sound IDs to hide, separated by commas. Remove one to unblock it.",
                    Settings.BLOCKED_SOUND_IDS
            ).withNameKeyboard());
        }
    }

    private void addWordsAndCountries(Context context) {
        addPreference(new SectionHeadingPreference(context, "Words, countries and languages"));
        addPreference(new InputTextPreference(context, "Blocked caption words",
                "Separate words or phrases with commas. Videos whose caption matches are "
                        + "hidden. Capital letters don't matter. Write \"a\" & \"b\" to need "
                        + "both phrases, or \"a\" !& \"b\" to need the first without the "
                        + "second.",
                Settings.BLOCKED_CAPTION_WORDS)
                .withCheck(app.morphe.extension.pinedrama.feedfilter.KeywordRules::problem)
                .withSamplePreview(app.morphe.extension.pinedrama.settings.L10n.t("Sample caption to test"),
                        app.morphe.extension.pinedrama.feedfilter.KeywordRulePreview.MAX_SAMPLE_CHARS,
                        app.morphe.extension.pinedrama.feedfilter.KeywordRulePreview::result));
        addPreference(new TogglePreference(context, "Match text stickers too",
                "Also hide videos whose text stickers match a blocked caption word. Text stickers are the words a creator types over the video in PineDrama's editor. Text that's part of the picture itself can't be read.",
                Settings.BLOCKED_WORDS_IN_STICKERS));
        addPreference(new InputTextPreference(context, "Only from these countries",
                "Separate country codes with commas, like GB, IE. Videos posted from anywhere "
                        + "else are hidden. Leave empty for all countries.",
                Settings.REGION_ONLY_FROM)
                .withCheck(app.morphe.extension.pinedrama.feedfilter.RegionFilter::countryProblem)
                .withNameKeyboard());
        addPreference(new InputTextPreference(context, "Never from these countries",
                "Separate country codes with commas. Videos posted from these are hidden, "
                        + "whatever the list above says.",
                Settings.REGION_NEVER_FROM)
                .withCheck(app.morphe.extension.pinedrama.feedfilter.RegionFilter::countryProblem)
                .withNameKeyboard());
        addPreference(new InputTextPreference(context, "Only these caption languages",
                "Separate language codes with commas, like en, es. A video whose original "
                        + "caption is in another language is hidden. Videos with no caption, or "
                        + "only translated ones, always stay.",
                Settings.CAPTION_LANGUAGES)
                .withCheck(app.morphe.extension.pinedrama.feedfilter.CaptionLanguageFilter::languageProblem)
                .withNameKeyboard());
    }

    /** The LIVE feed you swipe through, a page of rooms at a time (issue #57). */
    private void addLiveFeed(Context context) {
        addPreference(new SectionHeadingPreference(context, "LIVE feed"));
        addPreference(new TogglePreference(context, "Filter the LIVE feed",
                "Hides rooms in the LIVE feed you swipe through, using the rules below. Blocked "
                        + "creators, Creators hidden on this phone and Creator exceptions apply "
                        + "here too, and Blocked caption words are checked against each LIVE's "
                        + "title. The first room the LIVE button opens isn't filtered. If every "
                        + "room would be hidden, one gets through so the feed keeps loading.",
                Settings.LIVE_FEED_FILTER));
        addPreference(new TogglePreference(context, "Hide gaming LIVEs",
                "Hide LIVEs that PineDrama tags with a game or a gaming category.",
                Settings.LIVE_HIDE_GAMING));
        addPreference(new TogglePreference(context, "Hide shopping LIVEs",
                "Hide LIVEs that sell products or carry a TikTok Shop tag.",
                Settings.LIVE_HIDE_SHOPPING));
        addPreference(new TogglePreference(context, "Hide sponsored LIVEs",
                "Hide LIVEs that PineDrama labels as a paid partnership or promotional content.",
                Settings.LIVE_HIDE_SPONSORED));
        addPreference(new TogglePreference(context, "Hide verified creators' LIVEs",
                "Hide LIVEs hosted by verified accounts.",
                Settings.LIVE_HIDE_VERIFIED));
        addPreference(new InputTextPreference(context, "Hidden LIVE categories",
                "Separate words with commas, like music, chat. A LIVE is hidden when its "
                        + "category, topic tags or game name contains one. Capital letters "
                        + "don't matter.",
                Settings.LIVE_HIDDEN_CATEGORIES)
                .withCheck(app.morphe.extension.pinedrama.feedfilter.KeywordRules::problem)
                .withSamplePreview(app.morphe.extension.pinedrama.settings.L10n.t("Sample category to test"),
                        app.morphe.extension.pinedrama.feedfilter.KeywordRulePreview.MAX_SAMPLE_CHARS,
                        app.morphe.extension.pinedrama.feedfilter.KeywordRulePreview::result));
        addPreference(new RangeValuePreference(context, "LIVE viewers range",
                "Show only LIVEs with this many people watching.",
                Settings.LIVE_MIN_MAX_VIEWERS));
        addPreference(new RangeValuePreference(context, "LIVE followers range",
                "Show only LIVEs from creators with this many followers.",
                Settings.LIVE_MIN_MAX_FOLLOWERS));
    }

    private void addAdvanced(Context context) {
        addPreference(new SectionHeadingPreference(context, "Advanced"));
        addPreference(new TogglePreference(
                context,
                "Keep offline videos out of the feed",
                "PineDrama slips the videos it saved for offline viewing back into the feed when it can't load "
                        + "enough new ones. This takes them all out. Your offline list stays as it is.",
                Settings.HIDE_OFFLINE_VIDEOS
        ));
        addPreference(new TogglePreference(
                context,
                "Filter PineDrama's offline videos",
                "Also apply these filters to downloaded videos PineDrama uses when the feed can't load enough new items.",
                Settings.FILTER_OFFLINE_FALLBACK_VIDEOS
        ));
        addPreference(new TogglePreference(
                context,
                "Show how many were filtered",
                "Shows a small count under PineDrama's top tabs of what the feed filter has "
                        + "removed since PineDrama started. It shows only on the feed, and taps on "
                        + "it go through to the video under it.",
                Settings.FILTERED_COUNT_PILL
        ));
    }
}
