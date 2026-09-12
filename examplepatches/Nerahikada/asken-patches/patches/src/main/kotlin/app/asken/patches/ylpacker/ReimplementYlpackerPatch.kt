package app.asken.patches.ylpacker

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY

@Suppress("unused")
val reimplementYlpackerPatch = bytecodePatch(
    name = "Reimplement YLPacker in Java",
    description = "Replaces com.yl.pack.YLPacker's native packJNI/unpackJNI (HEX+AES-128-ECB, key \"yolandakitnewhdr\") with a pure-Java equivalent and skips loadLibrary(\"ylpacker\"), so libylpacker.so — which is DT_NEEDED on libpairipcore.so and would drag PairIP + its Play-license paywall back in — never loads. Lets PairIP stay fully removed."
) {
    compatibleWith(ASKEN_COMPATIBILITY)
    extendWith("extensions/extension.mpe")
    execute {
        YlpackerClinitFingerprint.method.addInstruction(0, "return-void")
        YlpackerAFingerprint.method.addInstructions(0, "invoke-static {p0}, Lapp/asken/extension/YlpackerShim;->pack(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object v0\nreturn-object v0")
        YlpackerBFingerprint.method.addInstructions(0, "invoke-static {p0}, Lapp/asken/extension/YlpackerShim;->unpack(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object v0\nreturn-object v0")
    }
}
