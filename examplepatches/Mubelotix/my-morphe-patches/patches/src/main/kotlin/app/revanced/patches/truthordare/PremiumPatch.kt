package app.revanced.patches.truthordare

import app.morphe.patcher.patch.bytecodePatch
import app.revanced.util.reactnative.reactNativePatch

@Suppress("unused")
val premiumPatch = bytecodePatch(
    name = "Activates premium features",
) {
    compatibleWith("com.antoinehabert.truthordaregame"("2.9"))

    // This patch depends on the generic React Native patch
    // which handles the injection.
    dependsOn(reactNativePatch("app/revanced/patches/truthordare/unlock.js"))
}
