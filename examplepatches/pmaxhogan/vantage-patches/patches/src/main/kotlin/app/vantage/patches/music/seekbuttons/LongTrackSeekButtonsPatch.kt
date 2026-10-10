package app.vantage.patches.music.seekbuttons

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val EXTENSION_CLASS = "Lapp/vantage/extension/music/LongTrackSeekButtons;"

// The event-bus subscriber the player's sequencer stage is dispatched to. The
// name survives obfuscation because the bus dispatches by it.
private const val STAGE_EVENT_METHOD = "handleSequencerStageEvent"

private val COMPATIBILITY_MUSIC =
    Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
    )

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun isBooleanSetter(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return false
    val ref = instruction.methodRef() ?: return false
    return ref.returnType == "V" && ref.parameterTypes.map { it.toString() } == listOf("Z")
}

/** Index of the second call to the same (Z)V setter, or -1. */
private fun secondSetterCall(instructions: List<Instruction>): Int {
    val seen = mutableSetOf<String>()
    instructions.forEachIndexed { index, instruction ->
        if (!isBooleanSetter(instruction)) return@forEachIndexed
        val ref = instruction.methodRef()!!
        val key = "${ref.definingClass}->${ref.name}"
        if (!seen.add(key)) return index
    }
    return -1
}

private fun BytecodePatchContext.findStageEventMethod(): Pair<ClassDef, Method> {
    // Music's media-session presenter (nhr in 9.15.51) sets the session's
    // seek-focused flag twice in this method: once from the podcast-episode
    // video type, once from the player response's config. No other
    // implementation of the subscriber calls one (Z)V setter twice.
    val candidates = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.name != STAGE_EVENT_METHOD) return@forEach
            if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) return@forEach
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            if (secondSetterCall(instructions) >= 0) candidates += classDef to method
        }
    }
    return candidates.singleOrNull()
        ?: throw PatchException(
            "expected one $STAGE_EVENT_METHOD with two calls to the same (Z)V setter, found " +
                candidates.joinToString { "${it.first.type}->${it.second.name}" },
        )
}

@Suppress("unused")
val longTrackSeekButtonsPatch =
    bytecodePatch(
        name = "Seek buttons for long tracks",
        description = "Shows the podcast-style rewind 10 s / forward 30 s buttons in the media " +
            "notification, for any track longer than a set length.",
    ) {
        compatibleWith(COMPATIBILITY_MUSIC)

        extendWith("extensions/music.mpe")

        val minimumMinutes by intOption(
            key = "minimumMinutes",
            default = 20,
            title = "Minimum length (minutes)",
            description = "Tracks longer than this get the seek buttons.",
            required = true,
        ) { it != null && it in 1..600 }

        execute {
            val (classDef, method) = findStageEventMethod()
            val mutable = mutableClassDefBy(classDef).methods.first { MethodUtil.methodSignaturesMatch(it, method) }
            val instructions = mutable.instructions.toList()
            val setterIndex = secondSetterCall(instructions)
            val setter = instructions[setterIndex] as FiveRegisterInstruction
            val valueRegister = setter.registerD

            // The player response is read off the event (the method's last
            // parameter register) earlier in the method: the last iget-object
            // from that register whose type is an interface we can resolve.
            val eventRegister = mutable.implementation!!.registerCount - 1
            val responseRead = (setterIndex - 1 downTo 0).firstOrNull { i ->
                val instruction = instructions[i]
                instruction.opcode == Opcode.IGET_OBJECT &&
                    (instruction as TwoRegisterInstruction).registerB == eventRegister &&
                    classDefOrNull(instruction.fieldRef()!!.type)?.let {
                        AccessFlags.INTERFACE.isSet(it.accessFlags)
                    } == true
            } ?: throw PatchException("no player-response read before the seek-focused setter")
            val responseRegister = (instructions[responseRead] as TwoRegisterInstruction).registerA
            val responseType = instructions[responseRead].fieldRef()!!.type

            // Nothing may overwrite the response register between the read and
            // the setter, or the hook would hand the extension something else.
            (responseRead + 1 until setterIndex).forEach { i ->
                val opcode = instructions[i].opcode
                val written = (instructions[i] as? OneRegisterInstruction)?.registerA
                val clobbers = written == responseRegister ||
                    (opcode.setsWideRegister() && written != null && written + 1 == responseRegister)
                if (opcode.setsRegister() && clobbers) {
                    throw PatchException("player-response register v$responseRegister is reused before the setter")
                }
            }

            // The response's duration-in-ms getter (apde.d()J in 9.15.51) falls
            // back to TimeUnit.SECONDS.toMillis(lengthSeconds()); that inner
            // ()I call is the lengthSeconds getter on the interface.
            val lengthSecondsName = findLengthSecondsName(responseType)

            mutable.addInstructions(
                setterIndex,
                """
                    invoke-static { v$valueRegister, v$responseRegister }, $EXTENSION_CLASS->showSeekButtons(ZLjava/lang/Object;)Z
                    move-result v$valueRegister
                """,
            )

            val extension = mutableClassDefBy(EXTENSION_CLASS)
            extension.methods.first { it.name == "lengthSeconds" }.apply {
                removeInstructions(0, implementation!!.instructions.count())
                addInstructions(
                    0,
                    """
                        check-cast p0, $responseType
                        invoke-interface { p0 }, $responseType->$lengthSecondsName()I
                        move-result v0
                        return v0
                    """,
                )
            }
            extension.methods.first { it.name == "minimumSeconds" }.apply {
                removeInstructions(0, implementation!!.instructions.count())
                addInstructions(
                    0,
                    """
                        const v0, ${minimumMinutes!! * 60}
                        return v0
                    """,
                )
            }
        }
    }

private fun BytecodePatchContext.classDefOrNull(type: String): ClassDef? =
    try {
        classDefBy(type)
    } catch (e: Exception) {
        null
    }

private fun BytecodePatchContext.findLengthSecondsName(responseType: String): String {
    val names = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (responseType !in classDef.interfaces) return@classDefForEach
        classDef.methods.forEach { method ->
            if (method.returnType != "J" || method.parameterTypes.isNotEmpty()) return@forEach
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val usesToMillis = instructions.any {
                it.methodRef()?.let { ref ->
                    ref.definingClass == "Ljava/util/concurrent/TimeUnit;" && ref.name == "toMillis"
                } == true
            }
            if (!usesToMillis) return@forEach
            instructions.mapNotNull { it.methodRef() }
                .filter {
                    it.parameterTypes.isEmpty() && it.returnType == "I" &&
                        (it.definingClass == classDef.type || it.definingClass == responseType)
                }
                .forEach { names += it.name }
        }
    }
    return names.singleOrNull()
        ?: throw PatchException("expected one lengthSeconds getter on $responseType, found $names")
}
