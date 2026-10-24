package app.template.extension.pdb;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Shared helpers for the Pdb Morphe extension.
 *
 * Pdb stores all of its preferences in {@code <packageName>_preferences}, which is
 * the same file its built-in Tweaks screen and its {@code isProUser()} gate read.
 * Writing here is therefore equivalent to toggling the app's own developer switches.
 *
 * <p>Two flavours of row exist in the injected menu: boolean switches
 * ({@link #ALL_KEYS}) and free-text overrides ({@link #TEXT_KEYS}). Both are applied
 * to the app's own keys by {@link PdbStartup}.
 */
public final class PdbSettings {

    public static final String PREFS_SUFFIX = "_preferences";

    /* ── Extension switches (injected into res/xml/root_preferences.xml) ──
       Premium + ad removal are patch-time always-on and intentionally have no row. */
    public static final String PRIVACY_RECEIPTS = "morphe_privacy_receipts";
    public static final String PRIVACY_SEE_MORE = "morphe_privacy_see_more";
    public static final String REMEMBER_AUTH    = "morphe_remember_auth";
    public static final String FORCE_OFFER      = "morphe_force_offer";
    public static final String API_STAGING      = "morphe_api_staging";
    public static final String SHOW_FULL_ERROR  = "morphe_show_full_error";
    public static final String IM_CONNECT_TOAST = "morphe_im_connect_toast";
    public static final String FORCE_ENGLISH    = "morphe_force_english";
    public static final String ADVANCED_LOGGING = "morphe_advanced_logging";
    public static final String GLOBAL_PAUSE     = "morphe_global_pause";
    public static final String ROW_ID_CHIPS     = "morphe_row_id_chips";
    public static final String IDS_EVERYWHERE   = "morphe_ids_everywhere";
    public static final String BUBBLE           = "morphe_bubble";
    /** Client-side limit extensions (Pdb Extras → Limits). */
    public static final String NO_VISITOR_LIMIT = "morphe_no_visitor_limit";

    /* ── Extension text overrides (EditTextPreference rows) ── */
    public static final String GEO_COUNTRY      = "morphe_geo_country";
    public static final String WHITELIST_HOST   = "morphe_whitelist_host";
    public static final String BUBBLE_URL       = "morphe_bubble_url";
    public static final String MOCK_LATLNG      = "morphe_mock_latlng";
    public static final String INSTANT_CHAT_USER = "morphe_instant_chat_user";

    /* Bookkeeping (not rows). */
    public static final String ICON_ALIAS = "morphe_icon_alias";

    public static final String[] SWITCH_KEYS = {
        PRIVACY_RECEIPTS, PRIVACY_SEE_MORE, REMEMBER_AUTH,
        FORCE_OFFER, API_STAGING, SHOW_FULL_ERROR, IM_CONNECT_TOAST, FORCE_ENGLISH,
        ADVANCED_LOGGING, GLOBAL_PAUSE, ROW_ID_CHIPS, IDS_EVERYWHERE, BUBBLE,
        NO_VISITOR_LIMIT,
    };

    public static final String[] TEXT_KEYS = {
        GEO_COUNTRY, WHITELIST_HOST, BUBBLE_URL, MOCK_LATLNG, INSTANT_CHAT_USER,
    };

    /** Every key owned by the extension — the set export / import / reset rebuild. */
    public static final String[] ALL_KEYS = {
        PRIVACY_RECEIPTS, PRIVACY_SEE_MORE, REMEMBER_AUTH,
        FORCE_OFFER, API_STAGING, SHOW_FULL_ERROR, IM_CONNECT_TOAST, FORCE_ENGLISH,
        ADVANCED_LOGGING, GLOBAL_PAUSE, ROW_ID_CHIPS, IDS_EVERYWHERE, BUBBLE,
        NO_VISITOR_LIMIT,
        GEO_COUNTRY, WHITELIST_HOST, BUBBLE_URL, MOCK_LATLNG, INSTANT_CHAT_USER,
        ICON_ALIAS,
    };

    /* ── Pdb's own preference keys that we drive ──
       The first two are written unconditionally at every startup (patch-time
       always-on unlock); the rest follow the injected switches. */
    public static final String PDB_MOCK_PRO     = "mockIsProUser";
    public static final String PDB_AD_OFF       = "isADLibDisabled";
    public static final String PDB_NO_READ      = "disableIRLMarkRead";
    public static final String PDB_IGNORE_SEE   = "ignoreIRLMore";
    public static final String PDB_REMEMBER_AUTH = "rememberGoogleAuth";
    public static final String PDB_FORCE_OFFER  = "forceShowOffer";
    public static final String PDB_API_STAGING  = "apiIsStaging";
    public static final String PDB_SHOW_ERROR   = "showFullError";
    public static final String PDB_IM_TOAST     = "imConnectToast";
    public static final String PDB_FORCE_EN     = "forceEnglish";
    public static final String PDB_LOG_LEVEL    = "fileLogLevel";

    /* Pdb's own keys behind the text rows. */
    public static final String PDB_GEO_COUNTRY  = "mockFeedCountryCode";
    public static final String PDB_WHITELIST    = "whiteListHost";
    public static final String PDB_BUBBLE_URL   = "mockBubbleEntranceURL";
    public static final String PDB_MOCK_LATLNG  = "mockLatLng";
    public static final String PDB_IM_CHAT_USER = "debugInstantChatUserId";

    /** Pdb's own preference keys, in the order shown by the diagnostics action. */
    public static final String[] PDB_KEY_ORDER = {
        PDB_MOCK_PRO, PDB_AD_OFF, PDB_NO_READ, PDB_IGNORE_SEE, PDB_REMEMBER_AUTH,
        PDB_FORCE_OFFER, PDB_API_STAGING, PDB_SHOW_ERROR, PDB_IM_TOAST, PDB_FORCE_EN,
        PDB_LOG_LEVEL,
        PDB_GEO_COUNTRY, PDB_WHITELIST, PDB_BUBBLE_URL, PDB_MOCK_LATLNG, PDB_IM_CHAT_USER,
        GLOBAL_PAUSE,
    };

    public static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(ctx.getPackageName() + PREFS_SUFFIX, Context.MODE_PRIVATE);
    }

    public static boolean getBool(SharedPreferences sp, String key, boolean def) {
        try {
            return sp.getBoolean(key, def);
        } catch (Throwable ignored) {
            return def;
        }
    }

    /**
     * The value a switch effectively has when the user has never touched it.
     * Must mirror the defaults {@link PdbStartup} applies, otherwise the UI shows
     * "off" for protections that are actually on.
     */
    public static boolean defaultBool(String key) {
        return PRIVACY_RECEIPTS.equals(key)
            || PRIVACY_SEE_MORE.equals(key)
            || REMEMBER_AUTH.equals(key)
            || IDS_EVERYWHERE.equals(key)
            || BUBBLE.equals(key);
    }

    public static String getString(SharedPreferences sp, String key, String def) {
        try {
            String value = sp.getString(key, def);
            return value == null ? def : value;
        } catch (Throwable ignored) {
            return def;
        }
    }

    private PdbSettings() {}
}
