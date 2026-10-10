package app.nogoogle.gboard;

import app.nogoogle.gboard.extras.PortedFeatures;
import app.nogoogle.gboard.gif.GifBridge;

import java.util.HashSet;
import java.util.Set;

/**
 * Called with every Gboard feature-flag read: first the features ported from Gboard-patches, then
 * (with "Turn off online-only features" on) flags of features that only work through Google
 * servers are forced off, so their UI never appears and their background work never starts.
 */
@SuppressWarnings("unused")
public final class FlagOverrides {
    private static final String GIF_FETCH_DELAY = "tenor_backup_cache_max_fetch_delay_in_milliseconds";
    private static final Long GIF_FETCH_DELAY_MS = 3000L; // Gboard's default: 500
    private static final Set<String> FORCE_OFF = new HashSet<>();
    private static final String[] FORCE_OFF_PREFIXES = {
            "enable_nga", "enable_tenor_", "enable_proactive_emoji_kitchen",
            "enable_emoji_kitchen", "enable_proactive_gif", "enable_contextual_gif",
            "enable_custom_sticker", "enable_sticker_predictions", "enable_voice_donation",
            "enable_gif_", "enable_custom_gif", "enable_expression_moment",
    };

    // Trending GIFs, categories and terms: kept once a GIF source is set (they send no typed text;
    // the proactive / contextual GIF features above stay off because they would).
    private static final Set<String> GIF_FLAGS = new HashSet<>();

    static {
        GIF_FLAGS.add("enable_tenor_trending_gifs");
        GIF_FLAGS.add("enable_tenor_trending_categories");
        GIF_FLAGS.add("enable_tenor_trending_term_v2_for_language_tags");
        GIF_FLAGS.add("enable_prioritize_recent_gifs");
        String[] names = {
                "enable_nga", "enable_nga_data_share", "enable_nga_lab_modeless_smartedit",
                "enable_nga_lab_smartedit_promo_banner", "enable_on_device_proofread",
                "active_emoji_kitchen_browse", "emoji_kitchen_v5", "enable_tenor_trending_gifs",
                "enable_tenor_trending_categories", "enable_prioritize_recent_gifs",
                "enable_gif_peer", "enable_custom_sticker_tab", "enable_sticker_share_usage_histogram",
                "auto_show_translate", "enable_writing_tools_log_with_proofread",
        };
        for (String n : names) FORCE_OFF.add(n);
    }

    /** Set by the "Runtime feature toggles" patch at the start of this class's static initializer:
     *  the flag hook is shared with the Gboard-patches features, which must not bring these rules. */
    static boolean onlineRules;

    private FlagOverrides() {
    }

    public static Object apply(String name, Object value) {
        if (name == null) return value;
        value = PortedFeatures.apply(name, value);
        // Gboard shows its cached GIF category row (up to a day old) when an answer takes longer than this;
        // the answers made here from the current GIF sources are quick, so give them time to arrive.
        if (GIF_FETCH_DELAY.equals(name) && value instanceof Long && GifBridge.enabled()) return GIF_FETCH_DELAY_MS;
        if (!onlineRules) return value;
        if (ExpressionTabs.FLAG.equals(name) && value instanceof String) return ExpressionTabs.filter((String) value);
        if (!(value instanceof Boolean) || !((Boolean) value)) return value;
        try {
            if (!NoGoogleSettings.bool(NoGoogleSettings.DISABLE_ONLINE_FEATURES)) return value;
        } catch (Throwable t) {
            return value;
        }
        if (GIF_FLAGS.contains(name) && GifBridge.enabled()) return value;
        if (FORCE_OFF.contains(name)) return Boolean.FALSE;
        for (String p : FORCE_OFF_PREFIXES) {
            if (name.startsWith(p)) return Boolean.FALSE;
        }
        return value;
    }

    /** Play services availability override: 1 = SERVICE_MISSING, -1 = run the real check. */
    public static int gmsAvailability() {
        return NoGoogleSettings.bool(NoGoogleSettings.REPORT_GMS_MISSING) ? 1 : -1;
    }
}
