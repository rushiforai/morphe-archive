package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

internal fun BytecodePatchContext.applyUnderPlayerAds() {
    val factories = listOf(DirectUnderPlayerAdFingerprint, SdkUnderPlayerAdFingerprint)
    factories.forEach { it.matchAll(1..1) }
    factories.forEach {
        it.method.addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """.trimIndent())
    }
}
