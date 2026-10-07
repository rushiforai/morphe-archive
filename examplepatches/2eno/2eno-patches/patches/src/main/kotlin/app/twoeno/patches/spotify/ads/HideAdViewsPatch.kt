package app.twoeno.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.p0Register
import app.twoeno.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HideAdViewsPatch;"

private val AD_VIEW_CLASSES = listOf(
    "Lcom/spotify/adsinternal/playback/video/CountdownBarView;",
    "Lcom/spotify/adsinternal/display/DisplayAdView;",
    "Lcom/spotify/adsinternal/ads/AudioAdView;",
    "Lcom/spotify/nowplaying/ads/AdPlayerView;",
)

@Suppress("unused")
val hideAdViewsPatch = bytecodePatch(
    name = "Hide ad views",
    description = "Hides ad banners, display ads and the ad player.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    execute {
        var patchedClasses = 0

        AD_VIEW_CLASSES.forEach { type ->
            val adView = mutableClassDefByOrNull(type) ?: return@forEach

            adView.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { constructor ->
                val thisRegister = constructor.p0Register
                // `this` is initialized after the super (or delegated) constructor call.
                val superCallIndex = constructor.indexOfFirstInstruction {
                    val firstRegister = when (this) {
                        is FiveRegisterInstruction -> registerC
                        is RegisterRangeInstruction -> startRegister
                        else -> -1
                    }
                    (opcode == Opcode.INVOKE_DIRECT || opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                        getReference<MethodReference>()?.name == "<init>" &&
                        firstRegister == thisRegister
                }
                if (superCallIndex < 0) return@forEach

                constructor.addInstruction(
                    superCallIndex + 1,
                    "invoke-static/range { v$thisRegister .. v$thisRegister }, " +
                        "$EXTENSION_CLASS->onAdViewCreated(Landroid/view/View;)V",
                )
            }

            adView.methods.firstOrNull { method ->
                method.name == "onMeasure" && method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() } == listOf("I", "I")
            }?.apply {
                addInstructions(
                    0,
                    """
                        invoke-static/range { v$p0Register .. v$p0Register }, $EXTENSION_CLASS->hideView(Landroid/view/View;)V
                        return-void
                    """,
                )
            }

            patchedClasses++
        }

        if (patchedClasses == 0) throw PatchException("Could not find any ad view")
    }
}
