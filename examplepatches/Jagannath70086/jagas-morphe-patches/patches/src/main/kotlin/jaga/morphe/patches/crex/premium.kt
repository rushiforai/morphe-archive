package jaga.morphe.patches.crex

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

val SubscriptionExpiredFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("yyyy-MM-dd"),
        string("expiry_date"),
        string("0000-00-00"),
    )
)

@Suppress("unused")
val crexPremiumPatch = bytecodePatch(
    name = "CREX Premium",
    description = "Unlocks premium features and removes ads."
) {
    compatibleWith(Compatibility(
        name = "CREX - Just Cricket",
        packageName = "in.cricketexchange.app.cricketexchange",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xA8805C,
        targets = listOf(
            AppTarget(version = "26.04.05")
        )
    ))

    execute {
        SubscriptionExpiredFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}