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

    private RamblerDynamicConfig() {
    }
}
