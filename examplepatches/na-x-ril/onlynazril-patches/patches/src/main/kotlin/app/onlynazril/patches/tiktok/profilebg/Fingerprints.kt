package app.onlynazril.patches.tiktok.profilebg

/**
 * Anchors for the profile-background patch.
 *
 * Every anchor here is structural, because the gate is an obfuscated
 * class whose name and method names change with every build: on 46.2.3
 * it is `X.0iZu`, on 46.5.3 `X.0InD`, on 47.0.3 `X.0kzw`, on 47.1.4
 * `X.0OSK`. The gate method itself moved from `LIZIZ` to `LIZJ` when
 * 47.1.4 inserted a cached decision above it. What does not move, on
 * every version checked, is the shape:
 *
 *  - a method that reads the AB key `profile_bg_in_allow_list` (the
 *    allow list the server pushes per account) or
 *    `profile_bg_enable_consumption_group` (the experiment group),
 *    both `com.bytedance.ies.abmock` config keys;
 *  - one `(boolean) -> boolean` method, the gate every profile
 *    component asks, ~29 instructions and 26 to 28 callers;
 *  - one `(boolean) -> void` method, the setter that stores the
 *    decision, ~18 instructions and 5 callers;
 *  - from 47.1.4, a no-arg `boolean` method, the cached decision
 *    the fragments read, ~10 instructions.
 *
 * The AB-defaults registry that also reads both keys (the ~200-method
 * class of which every method returns void) carries no
 * boolean-returning method, and the class that only lists the keys in
 * its static init has two void methods, so the shape tells the gate
 * holder apart from both without a name.
 */
private const val ALLOW_LIST_KEY = "profile_bg_in_allow_list"
private const val CONSUMPTION_GROUP_KEY = "profile_bg_enable_consumption_group"

/** The AB keys the gate reads, in either of its two forms. */
internal val GATE_KEYS = listOf(ALLOW_LIST_KEY, CONSUMPTION_GROUP_KEY)
