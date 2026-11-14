package semicoloncolonel.mobilestream.patches.settingshome.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.settingshome.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block ads.
//
// Settings Home shows app-open, native (feed and home), and banner ads through
// a CloudX waterfall, with Google Ad Manager, Meta, and others as CloudX's
// mediation adapters.
//
//   1. CloudX.isInitialized() always answers false. Every CloudX ad source
//      checks it first and reports no-fill when it is false (the app's own
//      "cloudx not initialized" path), so no CloudX ad is ever requested.
//   2. The app-open ad activity finishes as soon as it starts, so the launch
//      ad is never shown even if a direct Google Ad Manager app-open slips the
//      waterfall.
// ─────────────────────────────────────────────────────────────────────────────

internal object CloudXInitializedFingerprint : Fingerprint(
    definingClass = "Lio/cloudx/sdk/CloudX;",
    name = "isInitialized",
    parameters = listOf(),
    returnType = "Z",
)

internal object AppOpenAdActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/eet/core/ads/activity/AppOpenAdActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes the app-open, banner, and native ads.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // CloudX reports itself uninitialized, so every CloudX source no-fills.
        CloudXInitializedFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Finish the app-open ad activity right after its super.onCreate, before
        // it reads the ad and shows it. Injecting before super.onCreate would
        // leave the activity without its required superclass setup.
        val onCreate = AppOpenAdActivityOnCreateFingerprint.method
        val superIndex = onCreate.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_SUPER &&
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "onCreate"
        }
        if (superIndex < 0) throw PatchException("AppOpenAdActivity super.onCreate call not found")
        onCreate.addInstructions(
            superIndex + 1,
            """
                invoke-virtual { p0 }, Lcom/eet/core/ads/activity/AppOpenAdActivity;->finish()V
                return-void
            """.trimIndent(),
        )
    }
}
