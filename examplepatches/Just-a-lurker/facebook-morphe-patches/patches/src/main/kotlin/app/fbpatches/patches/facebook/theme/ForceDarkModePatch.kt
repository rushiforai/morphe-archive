/*
 * The hook and the fingerprint follow Hushfacebook
 * (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0), layout/theme/ForceDarkModePatch.kt,
 * Fingerprints.kt (DarkModeFingerprint) and AmoledThemePatch.kt (hookDarkModeAnswer), rewritten
 * for facebook-morphe-patches, 2026. Hushfacebook's runtime switch is replaced by a tablet check,
 * so the patch needs no settings.
 */
package app.fbpatches.patches.facebook.theme

import app.fbpatches.patches.facebook.ads.affiliate.filterBooleanReturns
import app.fbpatches.patches.facebook.shared.EXTENSION_PACKAGE
import app.fbpatches.patches.facebook.shared.extensionPatch
import app.fbpatches.patches.facebook.shared.returnEarlyBoolean
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val PATCH = "Dark mode on tablets"

/** Kept enum holding the theme preference Facebook's dark mode controller reads. */
private const val THEME_PREFERENCES_STATE = "Lcom/facebook/prefs/theme/ThemePreferences\$State;"

private const val DARK_MODE = "$EXTENSION_PACKAGE/theme/DarkMode;"

/** Takes each answer as an int: ART lets a boolean method return a register it types as int. */
private const val DARK_MODE_ANSWER = "$DARK_MODE->answer(I)Z"

/** The extension's stub the Follow the system theme option fills in. */
private const val FOLLOWS_SYSTEM = "followsSystem"

/**
 * Facebook's dark mode controller answering whether its dark mode is on for the whole app: the
 * Dark mode setting, or the system's night mode when the setting follows the system. It's the only
 * method holding the end-to-end tests' dark mode switch, and it reads the setting's
 * ThemePreferences state (585 found as `X.C01el;->A05`; the class and method names are renamed
 * every release). An activity's own theme can force dark or light without it, which is why the hook
 * goes here and not on the method that applies an activity's theme.
 */
internal object DarkModeFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("fb.e2e.enable_dark_mode"),
    filters = listOf(fieldAccess(type = THEME_PREFERENCES_STATE)),
)

/**
 * Turns Facebook's dark mode on for tablets, where its Settings page has no Dark mode row. Phones
 * keep Facebook's own light or dark choice. Off by default: pick it in Morphe Manager before
 * patching. Once patched in, it works without a runtime switch; the one choice is made at patch time.
 */
@Suppress("unused")
val forceDarkModePatch = bytecodePatch(
    name = PATCH,
    description = "Turns Facebook's dark mode on for tablets, where its Settings page has no Dark mode " +
        "row. Phones keep Facebook's own light or dark choice. Off by default: pick it in Morphe " +
        "Manager before patching. By default a tablet is always dark; the Follow the system theme " +
        "option makes it dark only while the system's dark theme is on.",
    default = false,
) {
    dependsOn(extensionPatch)
    compatibleWith(COMPATIBILITY_FACEBOOK)

    val followSystemTheme by booleanOption(
        key = "followSystemTheme",
        default = false,
        title = "Follow the system theme",
        description = "On a tablet, turn dark mode on only while the system's dark theme is on. " +
            "When off, a tablet is always dark. A change of the system theme shows fully once " +
            "Facebook restarts.",
    )

    execute {
        // Every answer of the controller passes through the extension before it returns. The hook
        // takes over each return's label, so a branch or a switch case landing on a return still
        // goes through it.
        DarkModeFingerprint.method.filterBooleanReturns(PATCH, DARK_MODE_ANSWER)

        if (followSystemTheme == true) {
            mutableClassDefBy(DARK_MODE).methods.singleOrNull {
                it.name == FOLLOWS_SYSTEM && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    AccessFlags.STATIC.isSet(it.accessFlags)
            }?.returnEarlyBoolean(true)
                ?: throw PatchException("$PATCH: $DARK_MODE has no static boolean $FOLLOWS_SYSTEM()")
        }
    }
}
