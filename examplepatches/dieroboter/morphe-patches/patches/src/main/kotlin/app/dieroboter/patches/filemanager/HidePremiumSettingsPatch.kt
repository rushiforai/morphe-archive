package app.dieroboter.patches.filemanager

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.dieroboter.patches.shared.Constants.COMPATIBILITY_FILE_MANAGER

private const val SETTINGS_FRAGMENT = "Lax/g7/p1;"
private const val PREFERENCE_SCREEN = "Landroidx/preference/PreferenceScreen;"
private const val PREFERENCE_GROUP = "Landroidx/preference/PreferenceGroup;"
private const val PREFERENCE = "Landroidx/preference/Preference;"

/**
 * Hide premium section in settings (File Manager 3.8.5).
 *
 * The Settings screen is an AndroidX PreferenceFragmentCompat
 * (ax/g7/p1) inflated from res/xml/settings.xml. Its top section is a
 * PreferenceCategory keyed "settings_payment" holding a single
 * Preference keyed "payment_screen" that opens the payment activity.
 * The fragment's refresh method s3() runs when the screen is created
 * and again on every resume; it looks both preferences up by key and
 * updates their state and titles from the license verdicts.
 *
 * This patch prepends a short, branch-free block to s3() that sets
 * both preferences invisible (Preference.setVisible(false), R8-renamed
 * to N0(Z)V on the facade class; its backing field is the one the
 * preference-list flattening reads through isVisible()). The category
 * header and the row therefore never appear in the list.
 *
 * The preferences deliberately stay in the hierarchy: s3() itself
 * dereferences both lookups later in its body without null checks, and
 * the fragment's setup attaches the row's click listener the same way,
 * so removing the preferences (from the XML or at runtime) would crash
 * Settings. Hiding is also idempotent - s3() re-runs on resume and
 * nothing in the fragment ever sets these two visible again.
 *
 * Premium itself is unaffected (see the "Unlock premium" patch), and
 * the payment screen remains reachable from the main menu; only the
 * Settings section is hidden.
 *
 * Register note: the block runs at index 0, where only the parameter
 * register (p0, the fragment) is live. It uses v0/v1 as scratch; the
 * original prologue rewrites both before reading them (the screen
 * lookup into v0 at its index 0, a const-string into v1 at its
 * index 1).
 */
@Suppress("unused")
val hidePremiumSettingsPatch = bytecodePatch(
    name = "Hide premium section in settings",
    description = "Hides the Premium category and its entry at the top of the Settings " +
        "screen by setting both preferences invisible whenever the settings screen " +
        "refreshes. Premium stays unlocked and the payment screen remains reachable " +
        "from the main menu - only the Settings section is hidden.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FILE_MANAGER)

    execute {
        fileManagerMethod(SETTINGS_FRAGMENT, "s3", "", "V").addInstructions(
            0,
            """
            iget-object v0, p0, $SETTINGS_FRAGMENT->v1:$PREFERENCE_SCREEN
            const-string v1, "settings_payment"
            invoke-virtual {v0, v1}, $PREFERENCE_GROUP->V0(Ljava/lang/CharSequence;)$PREFERENCE
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, $PREFERENCE->N0(Z)V
            iget-object v0, p0, $SETTINGS_FRAGMENT->v1:$PREFERENCE_SCREEN
            const-string v1, "payment_screen"
            invoke-virtual {v0, v1}, $PREFERENCE_GROUP->V0(Ljava/lang/CharSequence;)$PREFERENCE
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, $PREFERENCE->N0(Z)V
            """
        )
    }
}
