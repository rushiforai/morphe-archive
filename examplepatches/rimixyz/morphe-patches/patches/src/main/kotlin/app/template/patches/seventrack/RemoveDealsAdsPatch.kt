package app.template.patches.seventrack

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_17TRACK

private const val HIDE_DEALS_CAMPAIGN = "SHARE_PREFERENCES_HIDE_DEALS_CAMPAIGN"
private const val HIDE_DEALS_TAB = "SHARE_PREFERENCES_HIDE_DEALS_TAB"

/**
 * Injected at index 0 of SharedPreferencesBackend.getBool(String, PigeonOptions).
 *
 * p1 is the key argument. Only v0 is touched so the original method still has
 * `this` (v1), the key (v2) and the options (v3) intact when we fall through.
 */
private const val FORCE_BOOL_TRUE = """
    const-string v0, "$HIDE_DEALS_CAMPAIGN"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    const-string v0, "$HIDE_DEALS_TAB"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    goto :continue_original

    :forced_true
    const/4 v0, 0x1
    invoke-static { v0 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    return-object v0

    :continue_original
"""

/**
 * Same idea for getString, in case the Dart side reads those flags as strings.
 */
private const val FORCE_STRING_TRUE = """
    const-string v0, "$HIDE_DEALS_CAMPAIGN"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    const-string v0, "$HIDE_DEALS_TAB"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    goto :continue_original

    :forced_true
    const-string v0, "true"
    return-object v0

    :continue_original
"""

@Suppress("unused")
val removeDealsAdsPatch = patch(
    name = "Remove Deals ads",
    description = "Hides the 'Deals' tab and campaign ads by forcing the local preference flags to true.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_17TRACK)

    execute {
        SharedPreferencesGetBoolFingerprint.method.addInstructions(0, FORCE_BOOL_TRUE)
        SharedPreferencesGetStringFingerprint.method.addInstructions(0, FORCE_STRING_TRUE)
    }
}
