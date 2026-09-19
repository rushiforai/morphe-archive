package app.ais.patches

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * The players wrap the video with an IMA (Google Interactive Media Ads) media
 * source that loads the app's VMAP ad tag for pre/mid-roll ad breaks. There are
 * three ad tag variants: one for the standard and popup players, one for the
 * "c" player and one for the swipe player.
 *
 * Replacing each ad tag URL with an empty string makes the ad request fail
 * and playback continues with content only.
 */
// ponytail: dummy URL must be non-empty — "" makes the IMA SDK throw
// IllegalArgumentException at video start (ad error event is fine, empty is not)
private val DUMMY_AD_URL = java.util.Base64.getDecoder()
    .decode("aHR0cDovLzEyNy4wLjAuMS94").toString(Charsets.UTF_8) // http://127.0.0.1/x

private val VMAP_AD_URLS = arrayOf(
    "aHR0cHM6Ly9wb3JuLWFwcC5jb20vdm1hcC54bWw=",
    "aHR0cHM6Ly9wb3JuLWFwcC5jb20vdm1hcGMueG1s",
    "aHR0cHM6Ly9wb3JuLWFwcC5jb20vdm1hcF9zd2lwZS54bWw="
).map { java.util.Base64.getDecoder().decode(it).toString(Charsets.UTF_8) }

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes video ad breaks from the standard and popup video players.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        for (adUrl in VMAP_AD_URLS) {
            string(adUrl).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(DUMMY_AD_URL)
                    )
                )
            }
        }
    }
}