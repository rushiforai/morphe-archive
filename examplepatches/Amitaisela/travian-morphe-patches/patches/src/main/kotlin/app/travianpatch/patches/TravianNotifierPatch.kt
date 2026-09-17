package app.travianpatch.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.travianpatch.patches.Constants.COMPATIBILITY_TRAVIAN_LEGENDS

private const val EXTENSION_CLASS = "Lcom/travianpatch/notifier/NotifierService;"

@Suppress("unused")
val travianNotifierPatch = bytecodePatch(
    name = "Build/troop queue notifications",
    description = "Notifies you when a building upgrade or troop training queue finishes, " +
        "by independently polling the game's own API on a background timer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAVIAN_LEGENDS)

    dependsOn(manifestPatch)

    extendWith("extensions/extension.mpe")

    // User-configurable so this patch doesn't need to be rebuilt from source
    // to point it at a different Travian account.
    val email by stringOption(
        key = "email",
        default = "you@example.com",
        title = "Travian account email",
        description = "The Travian: Legends account this notifier logs into.",
        required = true,
    )
    val password by stringOption(
        key = "password",
        default = "changeme",
        title = "Travian account password",
        description = "Password for the account above.",
        required = true,
    )

    execute {
        // Escape in case a value contains a double quote (smali string literal).
        fun smaliEscape(s: String) = s.replace("\\", "\\\\").replace("\"", "\\\"")

        val method = TravianLegendsActivityOnCreateFingerprint.method

        // Method has ".locals 0" — p0 (this) and p1 (Bundle) are the only
        // registers that exist; there is no free scratch register, and
        // dexlib2 doesn't support growing register count after the fact.
        // Instead, insert AFTER the invoke-super call (index 1, not 0):
        // by that point p1's original Bundle value has already been
        // consumed, so it's safe to reuse p1 itself as scratch space.
        method.addInstructions(
            1,
            """
                const-string p1, "${smaliEscape(email!!)}"
                sput-object p1, $EXTENSION_CLASS->EMAIL:Ljava/lang/String;
                const-string p1, "${smaliEscape(password!!)}"
                sput-object p1, $EXTENSION_CLASS->PASSWORD:Ljava/lang/String;
                invoke-static {p0}, $EXTENSION_CLASS->start(Landroid/content/Context;)V
            """,
        )
    }
}
