package app.onlynazril.patches.tiktok.profilebg

import app.morphe.patcher.Fingerprint

/**
 * Anchors for the profile-background patch.
 *
 * Every anchor here is structural, because the gate is an obfuscated
 * class whose name and method names change with every build: on 46.2.3
 * it is `X.0iZu`, on 46.5.3 `X.0InD`, on 47.0.3 `X.0kzw`, on 47.1.4
 * `X.0OSK`, on 47.7.1 `X.0O6G`, on 47.9.1 `X.0Nh8`. The gate method
 * itself moved from `LIZIZ` to `LIZJ` when 47.1.4 inserted a cached
 * decision above it. What does not move, on every version checked, is
 * the shape:
 *
 *  - the class's static no-arg accessor reads the AB key
 *    `profile_bg_in_allow_list` (the allow list the server pushes per
 *    account) and returns the cached snapshot; the key alone is unique
 *    in the bundle, so it names the holder without a class scan;
 *  - one `(boolean) -> boolean` method, the gate every profile
 *    component asks, ~29 instructions and 26 to 28 callers;
 *  - one `(boolean) -> void` method, the setter that stores the
 *    decision, ~18 instructions and 5 callers;
 *  - from 47.1.4, a no-arg `boolean` method, the cached decision
 *    the fragments read, ~10 instructions.
 *
 * The experiment-group key `profile_bg_enable_consumption_group` is read elsewhere, so it is not
 * part of the anchor.
 */
internal const val ALLOW_LIST_KEY = "profile_bg_in_allow_list"

/**
 * The gate holder's accessor: it reads [ALLOW_LIST_KEY] and returns the cached AB snapshot.
 *
 * A static no-argument method returning the obfuscated snapshot type. The string alone makes it
 * unique in the bundle on 47.7.1 through 47.9.1, which is what removes the need to scan every
 * class reading the key and shape-check it: the hit's class is the gate holder.
 */
internal val ProfileBgGateAccessorFingerprint = Fingerprint(
    isStatic = true,
    returnType = "L",
    parameters = emptyList(),
    strings = listOf(ALLOW_LIST_KEY),
)
