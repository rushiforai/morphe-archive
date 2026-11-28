package semicoloncolonel.mobilestream.patches.cbsnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News for Android TV 8.6.0 picks how to play each video from the
// video's own data. A video marked requiresPreroll gets an ad tag, and the
// Paramount AVIA player plays its pre-roll through Google's IMA SDK first.
// Any other video, except the live streams with Google DAI, plays its URL
// directly. The requiresPreroll getter now always says no, so on-demand
// videos and the local station streams play directly, with no pre-roll.
//
// The CBS News 24/7 live stream has its ads stitched in on Google's servers
// (Google DAI), so they cannot be removed. The "Mask live ad breaks" option
// covers them.

internal object RequiresPrerollFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ ->
        // The plain getter: read the field and return it.
        val instructions = method.implementation?.instructions?.toList()
        instructions?.size == 2 && instructions[0].opcode == Opcode.IGET_BOOLEAN &&
            ((instructions[0] as ReferenceInstruction).reference as FieldReference).name == "requiresPreroll"
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads before on-demand videos and local station streams.",
    default = false,
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)
    extendWith("extensions/extension.mpe")

    val maskLiveAds by booleanOption(
        key = "maskLiveAds",
        default = true,
        title = "Mask live ad breaks",
        description = "Covers live ad breaks with a \"We'll be right back!\" screen and mutes them.",
    )

    execute {
        RequiresPrerollFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
        if (maskLiveAds == true) maskLiveAdBreaks()
    }
}
