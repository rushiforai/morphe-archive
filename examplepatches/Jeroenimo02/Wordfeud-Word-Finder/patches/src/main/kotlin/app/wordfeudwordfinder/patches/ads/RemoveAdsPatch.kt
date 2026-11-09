package app.wordfeudwordfinder.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.smali.ExternalLabel
import app.wordfeudwordfinder.patches.platform.HandlePlatformMessageFingerprint
import app.wordfeudwordfinder.patches.shared.Constants.COMPATIBILITY_WORDFEUD
import app.wordfeudwordfinder.patches.shared.extensionPatch

private const val AD_BLOCK = "Lapp/wordfeudwordfinder/extension/ads/AdBlock;"

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the banner and full-screen ads and skips the ad consent popup. The ad SDKs no longer " +
        "start with the app, Firebase Analytics is turned off and the advertising ID permissions are removed. " +
        "Notifications keep working.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WORDFEUD)

    // extensionPatch: the AdBlock hook below. adManifestPatch: ad SDK start-up, Analytics and permissions.
    dependsOn(extensionPatch, adManifestPatch)

    execute {
        // Wordfeud's ad plugin is obfuscated (its class names change with every release), so the patch does not
        // touch it. Instead it hooks the Flutter engine's entry point for messages from Dart, the same stable method
        // the word finder uses (platformTapPatch), and answers the ad calls there. See AdBlock for the list.
        //
        // Instance method: p0 = this (FlutterJNI), p1 = channel, p2 = message, p3 = reply id, p4/p5 = native
        // message pointer (long). The range form passes them in that order whatever registers they map to.
        // Injected at index 0, where the parameters still hold their original values.
        //
        // The jump for "not an ad" must use addInstructionsWithLabels with an ExternalLabel on the original first
        // instruction. Morphe 2.1.0's plain addInstructions does not move labels declared inside the added smali, so
        // a ":label nop" there compiled to a branch with offset 0 and Android rejected the whole FlutterJNI class
        // ("VerifyError: [0x7] branch offset of zero not allowed", crash at start in v1.5.0-dev.1 to dev.4).
        HandlePlatformMessageFingerprint.method.apply {
            val free = findFreeRegister(0)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range {p0 .. p5}, $AD_BLOCK->onPlatformMessage(Ljava/lang/Object;Ljava/lang/String;Ljava/nio/ByteBuffer;IJ)Z
                    move-result v$free
                    if-eqz v$free, :not_an_ad
                    return-void
                """,
                // Index 0 before the insertion: the method's original first instruction (or the word finder's hook
                // if platformTapPatch was applied first), so other messages run exactly as before.
                ExternalLabel("not_an_ad", 0)
            )
        }
    }
}
