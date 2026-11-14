package semicoloncolonel.mobilestream.extension.yahoofinance;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Yahoo Finance: the feature flags each patch turns off, and the prompt steps
 * Hide pop-ups lets through.
 *
 * Every flag is read through one reader (config/c, its a() and c()), with the
 * flag's key in the reader's field a. Each patch puts a check for its own list
 * at the top of both methods, so a flag on a list reads as off.
 */
@SuppressWarnings("unused")
public final class FinanceFlags {
    private FinanceFlags() {
    }

    /** Disable AI: Yahoo Scout and the AI-written insight cards. */
    private static final Set<String> AI = set(
            "qspScoutChat", "articleDdqNativeChat", "askScoutSelectionScoutChat", "qspAiAnalysis",
            "mosaicScoutTab", "mosaicScoutTopNav", "scoutFloatingComposer", "scoutOnboarding",
            "reactSurfaceScoutTranscript", "qspNewsHeadlinesInsight", "inceptionHomeWatchlistMoversInsights",
            "companyInsights");

    /** Hide Plus upsells: Yahoo Finance Plus banners and sheets, and the Coinbase referral button. */
    private static final Set<String> UPSELLS = set(
            "enableAlphaspaceBanner", "alphaspaceBottomSheet", "alphaspaceMobileAppCreative",
            "inceptionAlphaspaceEntry", "inceptionAlphaspaceBannerQsp", "stockPicksPromoBanner",
            "inceptionAccountUpsell", "smartAssetPortfolioUpsell", "portfolioAnalyticsUpsellBottomSheet",
            "portfolioAnalyticsBanner", "notificationsSubscriptionUpsell", "insightEdgeOnboardingCard",
            "coinbaseTradeNow", "premiumPerksHub");

    /** Hide pop-ups: rating and feedback prompts, the widget prompt, tooltips, and the beta invitation. */
    private static final Set<String> POPUPS = set(
            "ratingDialog", "launchFeedbackNews", "launchFeedbackQuote", "launchFeedbackSearch",
            "launchFeedbackWatch", "launchFeedbackApp", "widgetPrompt", "betaProgramDialog", "inAppUpdate",
            "toolTips");

    /** Block analytics & tracking: the app's switches for its analytics SDKs. */
    private static final Set<String> ANALYTICS = set(
            "appsFlyerSdk", "comscoreSdk", "chartBeatSDK", "embraceTelemetry", "embraceCohortPersona",
            "googleAnalytics", "sgtmLowLatencyForwarding", "oathAnalytics");

    /** Skip ads: the More News list on quote pages then gets no ad items. */
    private static final Set<String> ADS = set("inceptionQspNewsListAds");

    /** The prompt steps Hide pop-ups keeps: the forced update notice, privacy and consent, and ATT. */
    private static final Set<String> KEPT_STEPS = set("FORCE_UPGRADE", "PRIVACY_TRAPS", "ATT");

    public static boolean aiOff(String key) {
        return key != null && AI.contains(key);
    }

    public static boolean upsellOff(String key) {
        return key != null && UPSELLS.contains(key);
    }

    public static boolean popupOff(String key) {
        return key != null && POPUPS.contains(key);
    }

    public static boolean adsOff(String key) {
        return key != null && ADS.contains(key);
    }

    public static boolean analyticsOff(String key) {
        return key != null && ANALYTICS.contains(key);
    }

    /** Whether a prompt step (CampaignStepId name) may register with the arbiter. */
    public static boolean keepStep(Object step) {
        return step instanceof Enum && KEPT_STEPS.contains(((Enum<?>) step).name());
    }

    private static Set<String> set(String... keys) {
        return new HashSet<>(Arrays.asList(keys));
    }
}
