package dev.abotmaker.ramblerenhancements;

/**
 * Holds patch-time feature activation flags and dynamically fingerprinted Gboard
 * class/method/field bindings.
 *
 * <p>Default symbol values match Gboard 18.5.4 (verified target). At patch time,
 * {@code RamblerSharedExtensionPatch} rewrites {@code <clinit>} with the exact bindings
 * discovered in the target APK and sets each {@code FEATURE_*} flag to {@code true} only
 * when that patch was selected by the user in Morphe.</p>
 */
public final class RamblerDynamicConfig {
    // Feature selection flags (rewritten in <clinit> by selected patches)
    public static boolean FEATURE_WAVEFORM = false;
    public static boolean FEATURE_CUSTOM_INSTRUCTIONS = false;
    public static boolean FEATURE_PERSONAL_DICTIONARY = false;
    public static boolean FEATURE_CONTACT_NAMES = false;
    public static boolean FEATURE_CURSOR_EDITING = false;
    public static boolean FEATURE_APP_CONTEXT = false;
    public static boolean FEATURE_PRODUCTIVITY_TOOLS = false;
    public static boolean FEATURE_BANGLA_LITE_SCRIPT = false;
    public static boolean FEATURE_BANGLA_PHONETIC = false;
    public static boolean FEATURE_RAMBLER_EXTRAS = false;
    public static boolean FEATURE_HIDDEN_FLAGS = false;
    public static boolean FEATURE_AT_MENTION_SUGGESTIONS = false;
    public static boolean FEATURE_AMOLED_DARK_KEYBOARD = false;
    public static boolean FEATURE_CLIPBOARD_REORDER = false;

    // Flag class (oki in Gboard 18.5.4)
    public static String FLAG_NAME_FIELD = "a";
    public static String FLAG_RECOMPUTE_METHOD = "x";
    public static String FLAG_NOTIFY_METHOD = "t";

    // Waveform light bar (fkl / fkm in Gboard 18.5.4)
    public static String DRAWABLE_SHADER_FIELD = "e";
    public static String DRAWABLE_CORNER_RADIUS_FIELD = "h";
    public static String SHADER_PROCESSING_FIELD = "l";
    public static String SHADER_COLLAPSING_FIELD = "i";
    public static String SHADER_EXIT_FADE_FIELD = "j";
    public static String SHADER_GLOBAL_ALPHA_FIELD = "o";

    // UserFeatureCache / MUSE_STATS / Protobuf (Gboard 18.5.4 defaults)
    public static String MODULE_LOAD_METHOD = "b";
    public static String UFC_INTERFACE_CLASS = "see";
    public static String UFC_FEATURE_ENUM_CLASS = "sdo";
    public static String UFC_ENUM_FROM_ID_METHOD = "a";
    public static String UFC_READ_METHOD = "c";
    public static String UFC_UPDATE_METHOD = "n";
    public static String FUNCTION_INTERFACE_CLASS = "wgh";
    public static String MUSE_STATS_CLASS = "scf";
    public static String MUSE_STATS_DEFAULT_FIELD = "a";
    public static String MUSE_STATS_WORDS_FIELD = "b";
    public static String MUSE_WORD_CLASS = "sce";
    public static String MUSE_WORD_DEFAULT_FIELD = "a";
    public static String MUSE_WORD_TEXT_FIELD = "b";
    public static String PROTO_BASE_CLASS = "aaln";
    public static String PROTO_BUILDER_CLASS = "aali";
    public static String PROTO_LIST_CLASS = "aamd";
    public static String PROTO_PARSE_METHOD = "t";
    public static String PROTO_TO_BUILDER_METHOD = "o";
    public static String PROTO_MUTABLE_COPY_METHOD = "E";
    public static String BUILDER_COPY_ON_WRITE_METHOD = "t";
    public static String BUILDER_BUILD_METHOD = "o";
    public static String BUILDER_INSTANCE_FIELD = "b";
    public static String LIST_IS_MODIFIABLE_METHOD = "c";

    // Gboard Preferences (qvt in Gboard 18.5.4)
    public static String PREFS_CLASS = "qvt";
    public static String PREFS_GET_INSTANCE_METHOD = "I";
    public static String PREFS_READ_STRING_METHOD = "d";
    public static String PREFS_WRITE_STRING_METHOD = "i";

    // AndroidX Preference (Landroidx/preference/Preference;)
    public static String PREF_CONTEXT_FIELD = "j";
    public static String PREF_INTENT_FIELD = "s";

    // AgenticDictationExtension fields for per-app custom instructions (fhv in Gboard 18.5.4)
    public static String AGENTIC_CONTEXT_FIELD = "b";
    public static String AGENTIC_EDITOR_INFO_FIELD = "h";

    // InputConnection wrapper interface methods (pcn in 18.5.4, aepw in 18.8.0)
    public static String PCN_GET_EDITOR_INFO_METHOD = "k";
    public static String PCN_PERFORM_ACTION_METHOD = "y";

    // Gboard Toolbar Access Point bindings (18.5.4 defaults; rewritten for 18.8.0+)
    public static String AP_CONTROLLER_CLASS = "mwv";
    public static String AP_CONTROLLER_ORDER_HELPER_FIELD = "g";
    public static String AP_CONTROLLER_REGISTER_METHOD = "g";
    public static String AP_ORDER_HELPER_CLASS = "mwg";
    public static String AP_ORDER_HELPER_CATALOG_FIELD = "c";
    public static String AP_IMMUTABLE_SET_CLASS = "wpa";
    public static String AP_IMMUTABLE_SET_COPY_METHOD = "n";
    public static String AP_DESCRIPTOR_CLASS = "mtr";
    public static String AP_DESCRIPTOR_BUILDER_FACTORY_METHOD = "c";
    public static String AP_BUILDER_BASE_CLASS = "mtm";
    public static String AP_BUILDER_CONCRETE_CLASS = "mtm";
    public static String AP_BUILDER_TOKEN_METHOD = "l";
    public static String AP_BUILDER_RUNNABLE_METHOD = "q";
    public static String AP_BUILDER_BUILD_METHOD = "a";
    public static String AP_BUILDER_ICON_FIELD = "c";
    public static String AP_BUILDER_LABEL_FIELD = "d";

    // Spacebar long-press -> Rambler trigger bindings (18.5.4 defaults; rewritten for 18.8.0+)
    public static String SPACEBAR_LP_EVENT_GET_KEYDATA_METHOD = "g";
    public static String SPACEBAR_LP_EVENT_ACTION_FIELD = "a";
    public static String SPACEBAR_LP_KEYDATA_CODE_FIELD = "c";
    public static String SPACEBAR_LP_KEYDATA_DATA_FIELD = "e";
    public static String SPACEBAR_LP_EXT_GET_CONTEXT_METHOD = "ac";
    public static String SPACEBAR_LP_AGENTIC_IS_ACTIVE_METHOD = "ag";
    public static String SPACEBAR_LP_AGENTIC_TRIGGER_METHOD = "C";
    public static String SPACEBAR_LP_AGENTIC_CLASS = "fhv";
    public static String SPACEBAR_LP_AGENTIC_UI_MANAGER_FIELD = "c";
    public static String SPACEBAR_LP_UI_MANAGER_GET_STATE_METHOD = "h";

    // Native Gboard suggestion-strip @mention integration bindings (18.5.4 defaults)
    public static String AT_MENTION_IME_ACTIVE_BUNDLE_METHOD = "ah";
    public static String AT_MENTION_TEXT_CANDIDATES_UPDATED_METHOD = "K";
    public static String AT_MENTION_BUNDLE_WRAPPER_FIELD = "k";
    public static String AT_MENTION_WRAPPER_CONTROLLER_FIELD = "s";
    public static String AT_MENTION_WRAPPER_ACTIVE_METHOD = "p";
    public static String AT_MENTION_CONTROLLER_APPEND_METHOD = "c";
    public static String AT_MENTION_CANDIDATE_CLASS = "owu";
    public static String AT_MENTION_CANDIDATE_BUILDER_CLASS = "owr";

    private RamblerDynamicConfig() {
    }
}
