package app.morphe.patches.rssreader

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_RSS_READER

@Suppress("unused")
val rssReaderPremiumPatch = bytecodePatch(
    name = "RSS Reader Premium",
    description = "Unlock premium features and remove ads in RSS Reader.",
    default = true
) {
    compatibleWith(COMPATIBILITY_RSS_READER)

    execute {
        // Hook method a()
        RssReaderPremiumFingerprintA.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                """
                    new-instance v0, Lo90;
                    const/4 v1, 0x6
                    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-direct {v0, v1, v2}, Lo90;-><init>(ILjava/lang/Object;)V
                    return-object v0
                """
            )
        }

        // Hook method b()
        RssReaderPremiumFingerprintB.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                """
                    new-instance v0, Lo90;
                    const/4 v1, 0x6
                    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-direct {v0, v1, v2}, Lo90;-><init>(ILjava/lang/Object;)V
                    return-object v0
                """
            )
        }

        // Hook method c()
        RssReaderPremiumFingerprintC.method.apply {
            removeInstructions(0, implementation!!.instructions.size)
            addInstructions(
                0,
                """
                    new-instance v0, Lo90;
                    const/4 v1, 0x6
                    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    invoke-direct {v0, v1, v2}, Lo90;-><init>(ILjava/lang/Object;)V
                    return-object v0
                """
            )
        }
    }
}
