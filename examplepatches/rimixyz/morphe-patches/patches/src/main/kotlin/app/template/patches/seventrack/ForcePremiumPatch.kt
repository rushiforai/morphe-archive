package app.template.patches.seventrack

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_17TRACK

private const val USER_MODEL_KEY = "SHARE_PREFERENCES_USER_MODEL"
private const val EXTENSION_CLASS = "Lapp/template/extension/extension/UserModelPatch;"

/**
 * Injected at index 0 of SharedPreferencesBackend.setString(key, value, options).
 *
 * p1 = key, p2 = value. When the Dart code saves the user model, the value is
 * rewritten by the extension BEFORE the original method stores it. Every other
 * key falls through untouched, so the rest of the app behaves identically.
 */
/**
 * setString has 5 registers and 4 incoming (this + 3 params), so:
 *   v0 = free   v1 = this   v2 = key   v3 = value   v4 = options
 * Using v-registers directly avoids any p-register resolution ambiguity
 * in the inline smali compiler.
 */
private const val PATCH_USER_MODEL = """
const-string v0, "$USER_MODEL_KEY"
invoke-virtual { v2, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
move-result v0
if-eqz v0, :continue_original
invoke-static { v3 }, $EXTENSION_CLASS->patchUserModel(Ljava/lang/String;)Ljava/lang/String;
move-result-object v0
move-object v3, v0
:continue_original
nop
"""

@Suppress("unused")
val forcePremiumPatch = patch(
    name = "Force Premium membership",
    description = "Rewrites the cached user model to Premium level (4020). Unlocks client-side VIP features and hides ads. Requires a fresh install.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_17TRACK)

    extendWith("extensions/extension.mpe")

    execute {
        SharedPreferencesSetStringFingerprint.method.addInstructions(0, PATCH_USER_MODEL)
    }
}
