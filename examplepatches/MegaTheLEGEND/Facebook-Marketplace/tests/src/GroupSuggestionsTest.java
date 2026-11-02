import app.morphe.extension.facebook.marketplace.GroupSuggestions;

public class GroupSuggestionsTest {
  static int fails = 0;
  static void check(boolean ok, String m) { System.out.println((ok ? "PASS " : "FAIL ") + m); if (!ok) fails++; }

  /** Same arithmetic as MobileConfigNativeModule.A00(DD)J: double-to-long lo | (double-to-long hi << 32). */
  static long pack(double lo, double hi) { return (long) lo | ((long) hi << 32); }

  public static void main(String[] a) {
    // --- name based reads (getBool / getBoolWithoutLogging) ---
    check(GroupSuggestions.filterBoolByName("mp_pathing_lth:disable_mp_search_nullstate_gysj", false),
        "search null state GYSJ kill switch forced ON (was false)");
    check(!GroupSuggestions.filterBoolByName("groups_yakima_gysj:enable_gysj_unit_rendering", true),
        "GYSJ unit rendering forced OFF (was true)");
    check(!GroupSuggestions.filterBoolByName("mp_serp_h1_2026:enable_groups_insights_module", true),
        "SERP groups insights module forced OFF");
    check(!GroupSuggestions.filterBoolByName("group_discussion_mp_pdp:enable_below_gysj", true),
        "PDP group discussion (below GYSJ) forced OFF");
    check(GroupSuggestions.filterBoolByName("some_other:flag", true), "unrelated flag true stays true");
    check(!GroupSuggestions.filterBoolByName("some_other:flag", false), "unrelated flag false stays false");
    check(GroupSuggestions.filterBoolByName("marketplace_x:group_thing_unmanaged", true),
        "group-looking but unmanaged flag is passed through (only logged)");
    check(GroupSuggestions.filterBoolByName(null, true), "null name returns original");

    // --- numeric reads (StableSpec / ContextualId): lo | hi << 32 ---
    // 0x1010ae4000159db = disable_mp_search_nullstate_gysj: hi 0x01010ae4, lo 0x000159db
    long nullState = pack(0x000159dbL, 0x01010ae4L);
    check(nullState == 0x1010ae4000159dbL, "double packing reproduces the rn_params specifier");
    check(GroupSuggestions.filterBoolBySpec(nullState, false), "search null state kill switch forced ON by spec");
    // 0x2081116b00015c52 = enable_gysj_unit_rendering (default-true marker 0x20 in the top byte)
    check(!GroupSuggestions.filterBoolBySpec(0x2081116b00015c52L, true), "GYSJ unit rendering OFF by spec (with default marker)");
    check(!GroupSuggestions.filterBoolBySpec(0x0081116b00015c52L, true), "GYSJ unit rendering OFF by spec (marker absent)");
    check(!GroupSuggestions.filterBoolBySpec(pack(0x00015c52L, 0x2081116bL), true), "GYSJ unit rendering OFF via two doubles");
    check(!GroupSuggestions.filterBoolBySpec(0x1010b0300285a7cL, true), "expanded groups insights module OFF by spec");
    check(GroupSuggestions.filterBoolBySpec(0x1234L, true), "unknown spec true stays true");
    check(!GroupSuggestions.filterBoolBySpec(0L, false), "spec 0 stays as is");

    System.out.println(fails == 0 ? "ALL PASS" : "FAILURES: " + fails);
    System.exit(fails == 0 ? 0 : 1);
  }
}
