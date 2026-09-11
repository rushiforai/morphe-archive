package app.d0nj.patches.niagara

import app.d0nj.patches.shared.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val fixChannelFingerprintTipPatch = bytecodePatch(
    name = "Fix home screen numbers tile",
    description = "Niagara's Channels feature registers a diagnostic tip whose message is a giant " +
        "fingerprint of concatenated hashCode() integers of up to 30 channel items (~850 digits). " +
        "Because the provider accepts every tip request, this shows up as a tile of giant numbers on " +
        "the home feed whenever the channel list refreshes, which happens when apps are installed, " +
        "updated or removed (for example through ADB). Makes the provider decline tip requests so the " +
        "diagnostic tip is never shown.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            packageName = "bitpit.launcher",
            name = "Niagara Launcher",
            appIconColor = 0x1E88E5,
            targets = listOf(AppTarget(version = null)),
        ),
    )

    execute {
        val candidates = mutableListOf<ClassDef>()

        classDefForEach { classDef ->
            val fingerprintBuilder = classDef.methods
                .firstOrNull { it.buildsHashCodeFingerprint() } ?: return@classDefForEach
            val constantTrueMethod = classDef.methods
                .filter { it.isConstantTrueBooleanReturn() }
                .firstOrNull { it.parameterTypes.singleOrNull() == fingerprintBuilder.parameterTypes.firstOrNull() }
                ?: return@classDefForEach

            candidates.add(classDef)
        }

        val channelsManager = candidates.singleOrNull()
            ?: throw PatchException(
                "Expected exactly one channels manager with a hashCode fingerprint tip builder, " +
                    "found ${candidates.size}: ${candidates.map { it.type }}",
            )

        val canHandleMethod = channelsManager.methods
            .filter { it.isConstantTrueBooleanReturn() }
            .singleOrNull { it.parameterTypes.size == 1 }
            ?: throw PatchException("Could not find the tip canHandle method in ${channelsManager.type}")

        val mutableClass = mutableClassDefBy(channelsManager)
        val mutableCanHandle: MutableMethod = mutableClass.methods
            .first { it.name == canHandleMethod.name && it.parameterTypes == canHandleMethod.parameterTypes }

        mutableCanHandle.apply {
            clearBody()
            addInstructions(0, "const/4 p0, 0x0\nreturn p0")
        }
    }
}

private fun Method.buildsHashCodeFingerprint(): Boolean {
    var emptyStringBuilders = 0
    var intAppends = 0
    var absCalls = 0

    for (instruction in implementation?.instructions ?: return false) {
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        when {
            reference.definingClass == "Ljava/lang/StringBuilder;" &&
                reference.name == "<init>" &&
                reference.parameterTypes.isEmpty() -> emptyStringBuilders++

            reference.definingClass == "Ljava/lang/StringBuilder;" &&
                reference.name == "append" &&
                reference.parameterTypes.singleOrNull() == "I" -> intAppends++

            reference.definingClass == "Ljava/lang/Math;" &&
                reference.name == "abs" &&
                reference.parameterTypes.singleOrNull() == "I" -> absCalls++
        }
    }

    return emptyStringBuilders >= 1 && intAppends >= 2 && absCalls >= 2
}

private fun Method.isConstantTrueBooleanReturn(): Boolean {
    if (returnType != "Z") return false
    val instructions = implementation?.instructions?.toList() ?: return false
    val opcodes = instructions.map { it.opcode }
    if (opcodes.size != 2 || opcodes[0] != Opcode.CONST_4 || opcodes[1] != Opcode.RETURN) return false
    return (instructions[0] as NarrowLiteralInstruction).narrowLiteral == 1
}
