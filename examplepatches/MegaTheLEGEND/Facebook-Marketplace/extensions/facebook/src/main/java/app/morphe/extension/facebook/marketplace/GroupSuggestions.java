package app.morphe.extension.facebook.marketplace;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Runtime half of the "Block group suggestions" option of the Marketplace patch (Facebook 582.0.0.50.54).
 *
 * Marketplace's search screen and listing page (PDP) are React Native screens, so the "Recommended groups" /
 * "Related groups" blocks (Facebook calls them GYSJ, "Groups You Should Join") are drawn by JavaScript in a Hermes
 * bundle that can't be patched. What the JS does read are MobileConfig flags, through
 * {@code MobileConfigNativeModule.getBool*}. The patch calls {@link #filterBoolByName} (name based reads) and
 * {@link #filterBoolBySpec} (numeric "StableSpec" / contextual-id reads) with the value Facebook computed, and we
 * answer with the value that switches the group modules off.
 *
 * Specifiers are the hex numbers from the APK's assets/rn_params*.txt (name,specifier,configKey,paramKey,default).
 * The two doubles the JS passes are packed as {@code lo | hi << 32}; that is the same number. A specifier of a flag
 * whose default is true carries an extra marker bit (0x20 in the top byte); it is cleared on both sides so a read
 * matches whichever way the JS encodes it.
 *
 * Never throws: any problem returns Facebook's own value. No Android compile-time dependency (unit-tested on a JVM).
 */
@SuppressWarnings("unused")
public final class GroupSuggestions {

    private static final String TAG = "MarketplaceOnly";
    private static final long DEFAULT_TRUE_MARKER = 0x2000000000000000L;

    private static final class Flag {
        final String name;
        final boolean forced;

        Flag(String name, boolean forced) {
            this.name = name;
            this.forced = forced;
        }
    }

    private static final Map<String, Flag> BY_NAME = new HashMap<>();
    private static final Map<Long, Flag> BY_SPEC = new HashMap<>();

    /** Flags (or names) already logged, so each shows up once in logcat. */
    private static final Set<String> LOGGED = ConcurrentHashMap.newKeySet();

    private static void add(String name, long spec, boolean forced) {
        Flag flag = new Flag(name, forced);
        BY_NAME.put(name, flag);
        BY_SPEC.put(normalize(spec), flag);
    }

    private static long normalize(long spec) {
        return spec & ~DEFAULT_TRUE_MARKER;
    }

    static {
        // Switch the Marketplace search "null state" GYSJ block off (Facebook's own kill switch, default false).
        add("mp_pathing_lth:disable_mp_search_nullstate_gysj", 0x1010ae4000159dbL, true);
        // Everything below is forced OFF: GYSJ rendering (search results, listing page, feed), the groups
        // insights module on search results, group discussion modules and "share to groups" on the listing page.
        add("groups_yakima_gysj:enable_gysj_unit_rendering", 0x2081116b00015c52L, false);
        add("mp_serp_h1_2026:enable_groups_insights_module", 0x1010b0300275a7bL, false);
        add("mp_serp_h1_2026:expanded_groups_insights_module", 0x1010b0300285a7cL, false);
        add("mp_serp_h1_2026:groups_insights_inline_composer", 0x1010b0300265a7aL, false);
        add("gysj_bsg_pdp:enable_show_hidden_bsg_pdp_section", 0x1010a8000005846L, false);
        add("bsg_gysj_distribution:category_feed_gysj_v2", 0x81110400015b28L, false);
        add("group_discussion_mp_pdp:enable_group_discussion_module", 0x1010abf00005926L, false);
        add("group_discussion_mp_pdp:enable_above_ads", 0x1010abf00015927L, false);
        add("group_discussion_mp_pdp:enable_below_ads", 0x1010abf00025928L, false);
        add("group_discussion_mp_pdp:enable_below_gysj", 0x1010abf00035929L, false);
        add("group_discussion_mp_pdp:enable_v2_design", 0x1010abf0004592aL, false);
        add("group_discussion_mp_pdp:enable_yakima_discussion_module", 0x1010abf0007592bL, false);
        add("group_discussion_mp_pdp:enable_hscroll_design", 0x1010abf0008592cL, false);
        add("group_discussion_mp_pdp:enable_pathways_design", 0x1010abf000a592dL, false);
        add("group_discussion_mp_feed:enable_comment_button", 0x1010af700005a1cL, false);
        add("group_discussion_mp_feed:enable_bling_bar", 0x1010af700015a1dL, false);
        add("group_discussion_mp_feed:enable_minifeed", 0x1010af700025a1eL, false);
        add("group_discussion_mp_feed:enable_pathways_design", 0x1010af700035a1fL, false);
        add("marketplace_jobs:show_share_to_groups_on_pdp", 0x1010185009114d9L, false);
        add("marketplace_jobs:show_more_groups_to_share_on_pdp", 0x1010185009d14deL, false);
    }

    private GroupSuggestions() {
    }

    /** Injected before the {@code return} of {@code getBool(String)} / {@code getBoolWithoutLogging(String)}. */
    public static boolean filterBoolByName(String name, boolean original) {
        try {
            if (name == null) return original;
            Flag flag = BY_NAME.get(name);
            if (flag != null) {
                noteForced(flag, original);
                return flag.forced;
            }
            // Discovery aid: any other group-looking flag the JS asks for by name, once, so a section that
            // survives can be traced from `adb logcat -s MarketplaceOnly`.
            if (LOGGED.add("seen:" + name) && looksGroupRelated(name)) {
                log("group flag read, not overridden: " + name + " = " + original);
            }
            return original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    /**
     * Injected before the final {@code return} of the numeric variants (StableSpec and ContextualId), with the packed
     * 64-bit specifier ({@code lo | hi << 32}) Facebook resolved the read with.
     */
    public static boolean filterBoolBySpec(long spec, boolean original) {
        try {
            Flag flag = BY_SPEC.get(normalize(spec));
            if (flag == null) return original;
            noteForced(flag, original);
            return flag.forced;
        } catch (Throwable ignored) {
            return original;
        }
    }

    private static void noteForced(Flag flag, boolean original) {
        if (LOGGED.add("forced:" + flag.name)) {
            log("group flag " + flag.name + ": " + original + " -> " + flag.forced);
        }
    }

    private static boolean looksGroupRelated(String name) {
        String lower = name.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("gysj") || lower.contains("group");
    }

    private static void log(String msg) {
        try {
            Class.forName("android.util.Log").getMethod("i", String.class, String.class).invoke(null, TAG, msg);
        } catch (Throwable ignored) {
            // not on Android (unit tests)
        }
    }
}
