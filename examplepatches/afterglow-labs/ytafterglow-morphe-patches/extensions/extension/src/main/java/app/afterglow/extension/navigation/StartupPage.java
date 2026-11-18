package app.afterglow.extension.navigation;

/**
 * Where YouTube opens, from the iOS startup settings (YTAfterglow.x:4798-4811), as plain
 * code with no Android types so it runs in JVM tests.
 *
 * <p>iOS selects the startup tab by its pivot identifier once the tab bar appears; Android
 * opens a page by browse id, or by intent action for Shorts. The rules, in iOS order:
 * <ol>
 *   <li>shortsOnlyMode opens Shorts.</li>
 *   <li>Lite Mode opens Home (YTAGLiteModeStartupTab).</li>
 *   <li>Otherwise the startup tab: Home and the Afterglow tab keep YouTube's Home (the Afterglow
 *       tab has Home's browse id on iOS, ytagBrowseIdForTabId); Shorts opens the Shorts player;
 *       Create/Uploads cannot be a page and keeps Home; every other tab opens its browse id.</li>
 * </ol>
 */
public final class StartupPage {
    public static final String HOME = "FEwhat_to_watch";
    public static final String SHORTS = "FEshorts";
    public static final String UPLOADS = "FEuploads";
    public static final String AFTERGLOW = "YTAGControlCenter";

    /** The intent action YouTube's own Shorts launcher shortcut uses. */
    public static final String SHORTS_INTENT_ACTION = "com.google.android.youtube.action.open.shorts";

    private StartupPage() {}

    /** The tab YouTube should open, after shortsOnlyMode and Lite Mode. */
    public static String effectiveTab(String startupTab, boolean shortsOnlyMode, boolean liteMode) {
        if (shortsOnlyMode) return SHORTS;
        if (liteMode) return HOME;
        return startupTab == null || startupTab.isEmpty() ? HOME : canonical(startupTab);
    }

    /** The browse id that replaces Home's, or null to keep Home (also for Shorts, which is an intent). */
    public static String browseIdFor(String tab) {
        if (tab == null) return null;
        switch (tab) {
            case HOME:
            case AFTERGLOW:
            case SHORTS:
            case UPLOADS:
                return null;
            default:
                return tab.startsWith("FE") || tab.startsWith("VL") ? tab : null;
        }
    }

    /** True when the tab opens the Shorts player, which Android starts by intent action. */
    public static boolean opensShorts(String tab) {
        return SHORTS.equals(tab);
    }

    /** iOS YTAGCanonicalTabId: retired Explore and Trending ids are the Hype tab. */
    static String canonical(String tab) {
        if ("FEexplore".equals(tab) || "FEtrending".equals(tab)) return "FEhype_leaderboard";
        return tab;
    }
}
