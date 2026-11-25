package dev.jason.gboardpatches.extension.rambler;

/**
 * Turns on Gboard's own Rambler personal dictionary.
 *
 * <p>Gboard ships a finished "Voice correction list" under Rambler settings: words you add,
 * import or correct are stored there and sent to Rambler so it spells them right. Google keeps the
 * screen, its import/export menu and the sending behind server flags a re-signed Gboard never
 * receives; this supplies them.
 */
public final class GboardRamblerDictionaryRuntime {
    /** Rambler settings use the layout that links the voice correction list. */
    public static final String CORRECTION_LIST_SETTING_FLAG = "enable_rambler_voice_correction_list_setting";
    /** Import (add words) and export menu of the voice correction list. */
    public static final String CORRECTION_LIST_IMPORT_EXPORT_FLAG = "enable_rambler_voice_correction_list_import_export";
    /** Shows the list, the Contact names switch and the explanation footer. */
    public static final String SHOW_DICTIONARY_SETTINGS_FLAG = "show_rambler_dict_settings";
    /** Shows "Clear all corrected words". */
    public static final String SHOW_CLEAR_ALL_FLAG = "show_clear_all_corrected_words_settings";
    /** Sends the list's words with each Rambler request. */
    public static final String SEND_WORDS_FLAG = "enable_user_contact_biasing";
    /**
     * Loads Gboard's user feature cache, the module that stores the list (as MUSE_STATS). Without
     * it the list stays empty and every import is dropped.
     */
    public static final String FEATURE_CACHE_FLAG = "enable_user_feature_cache";

    private GboardRamblerDictionaryRuntime() {
    }

    /** Flag-family hook: called with every flag name and Gboard's own value for it. */
    public static Object applyFlagValue(String flagName, Object originalResult) {
        if (flagName == null || !(originalResult instanceof Boolean)) {
            return originalResult;
        }
        switch (flagName) {
            case CORRECTION_LIST_SETTING_FLAG:
            case CORRECTION_LIST_IMPORT_EXPORT_FLAG:
            case SHOW_DICTIONARY_SETTINGS_FLAG:
            case SHOW_CLEAR_ALL_FLAG:
            case SEND_WORDS_FLAG:
            case FEATURE_CACHE_FLAG:
                return Boolean.TRUE;
            default:
                return originalResult;
        }
    }
}
