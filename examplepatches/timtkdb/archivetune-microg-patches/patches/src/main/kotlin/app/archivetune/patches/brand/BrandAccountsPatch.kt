package app.archivetune.patches.brand

import app.archivetune.patches.shared.Constants.COMPATIBILITY_ARCHIVETUNE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val showAllBrandAccountsPatch = patch(
    name = "Show all brand accounts",
    description = "ArchiveTune's account switcher hides every account that YouTube reports as having no " +
        "YouTube channel. Music-only brand accounts usually have none, so they never show up under " +
        "\"YouTube channels\" in the account menu. This makes them show up.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ARCHIVETUNE)

    execute {
        // accounts_list entries carry "hasChannel": false for brand accounts without a channel, and
        // ArchiveTune drops them via `booleanValue("hasChannel") ?: true`. Making the helper return
        // "no value" for exactly that key makes the existing default (true) apply, with no other change.
        JsonBooleanValueFingerprint.method.let { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags)) {
                throw PatchException("booleanValue is not static anymore; the hook needs updating.")
            }
            val implementation = method.implementation
                ?: throw PatchException("booleanValue has no implementation")
            if (implementation.registerCount - method.parameterTypes.size < 1) {
                throw PatchException("booleanValue has no free local register for the hook")
            }

            // p1 is the key (String) for a static method with (JsonObject, String).
            method.addInstructions(
                0,
                """
                    const-string v0, "hasChannel"
                    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :keep_original
                    const/4 v0, 0x0
                    return-object v0
                    :keep_original
                    nop
                """,
            )
        }
    }
}
