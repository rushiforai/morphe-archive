package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// Paramount+ and Pluto TV share Paramount's splash module. Both play a short
// branded intro video on launch, gated by an isVideoSplash boolean on a splash
// config object (R8-renamed, toString "SplashCoreModuleConfig(isVideoSplash=").
// When it is false the app shows its static splash logo and releases the
// navigation gate at once, a shipped path, so forcing the flag false in the
// config constructor skips the video. The two apps rename the class
// differently, so each resolves it through this shared fingerprint.
internal object SplashConfigFingerprint : Fingerprint(
    strings = listOf("SplashCoreModuleConfig(isVideoSplash="),
)

internal fun BytecodePatchContext.forceSplashVideoOff() {
    val configClass = SplashConfigFingerprint.classDef.type
    val constructor = SplashConfigFingerprint.classDef.methods.first { it.name == "<init>" }
    val instructions = constructor.implementation!!.instructions.toList()
    val storeIndex = instructions.indexOfFirst {
        it.opcode == Opcode.IPUT_BOOLEAN &&
            ((it as ReferenceInstruction).reference as FieldReference).definingClass == configClass
    }
    if (storeIndex < 0) throw PatchException("isVideoSplash store not found")
    val register = (instructions[storeIndex] as TwoRegisterInstruction).registerA
    constructor.addInstructions(storeIndex, "const/4 v$register, 0x0")
}
