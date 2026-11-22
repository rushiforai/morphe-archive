
package io.github.arkert.patches.comunio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch

// Creates and inserts banner advertisements.
private object BannerCreationFingerprint : Fingerprint(
    definingClass = "Li2;",
    name = "k",
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "Li2;",
        "Landroid/view/ViewGroup;",
        "I"
    )
)

// Loads or refreshes existing banner advertisements.
private object BannerReloadFingerprint : Fingerprint(
    definingClass = "Li2;",
    name = "r",
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "I"
    )
)

@Suppress("unused")
val hideBannerAdsPatch = patch(
    name = "Hide Banner Ads",
    description = "Prevents banner advertisements from loading in Comunio.",
    default = true
) {
    compatibleWith(comunioCompatibility)

    execute {
        BannerCreationFingerprint.method.addInstruction(
            0,
            "return-void"
        )

        BannerReloadFingerprint.method.addInstruction(
            0,
            "return-void"
        )
    }
}
