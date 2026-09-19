package app.travianpatch.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.travianpatch.patches.Constants.COMPATIBILITY_TRAVIAN_LEGENDS

private const val EXTENSION_CLASS = "Lcom/travianpatch/notifier/NotifierBootstrap;"

@Suppress("unused")
val travianNotifierPatch = bytecodePatch(
    name = "Build/troop queue notifications",
    description = "Notifies you when a building upgrade or troop training queue finishes, with " +
        "the building/unit name, level, and village, and warns you about incoming attacks and " +
        "raids (who, from where, and when they arrive) with a second warning about a minute " +
        "before they land, and tells you when reinforcements or your own returning troops " +
        "arrive. Uses the session you're already logged in " +
        "with in the game — no separate login, no password ever handled by this patch. Checks " +
        "run quietly in the background: one is scheduled for just after each build/training is " +
        "due to finish, plus a regular check every 5 minutes (Android may delay background " +
        "work slightly). Nothing is shown unless something actually finished. The first time " +
        "you open the app it asks once for " +
        "notification permission and to exempt the app from battery optimization, so the " +
        "background checks aren't killed by the system.",
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
