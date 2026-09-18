package app.travianpatch.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.travianpatch.patches.Constants.COMPATIBILITY_TRAVIAN_LEGENDS

private const val EXTENSION_CLASS = "Lcom/travianpatch/notifier/NotifierBootstrap;"

@Suppress("unused")
val travianNotifierPatch = bytecodePatch(
    name = "Build/troop queue notifications",
    description = "Notifies you when a building upgrade or troop training queue finishes, with " +
        "the building/unit name, level, and village. The first time you open the app you'll be " +
        "asked to log in once; your password is sent straight to Travian's own login endpoint " +
        "and is never stored — only the resulting session is kept, encrypted on-device.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAVIAN_LEGENDS)

    dependsOn(manifestPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val method = TravianLegendsActivityOnCreateFingerprint.method

        // Method has ".locals 0" — p0 (this) and p1 (Bundle) are the only
        // registers that exist; there is no free scratch register, and
        // dexlib2 doesn't support growing register count after the fact.
        // Insert AFTER the invoke-super call (index 1, not 0), same as
        // before — p0 alone is all NotifierBootstrap.start() needs now.
        method.addInstructions(
            1,
            """
                invoke-static {p0}, $EXTENSION_CLASS->start(Landroid/content/Context;)V
            """,
        )
    }
}
