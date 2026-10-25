package app.morphe.patches.zona

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Stream selection service, which reads the resolution and the voice-over chosen by hand last
 * time out of the app settings memory and turns them into the stream filters to apply.
 */
private object StreamSelectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        // Turns the remembered resolution into a filter (3.0.75: Fg.s$a.a, 3.0.76: zg.p$a.a).
        anyInstruction(
            methodCall(
                definingClass = "LFg/s\$a;",
                name = "a",
                parameters = listOf("Ljava/lang/String;"),
                returnType = "LFg/s;",
            ),
            methodCall(
                definingClass = "Lzg/p\$a;",
                name = "a",
                parameters = listOf("Ljava/lang/String;"),
                returnType = "Lzg/p;",
            ),
        ),
        // The constructor that receives the quality from the app settings (3.0.75: Hg.o.<init>, 3.0.76: Bg.r.<init>).
        anyInstruction(
            methodCall(
                definingClass = "LHg/o;",
                name = "<init>",
                parameters = listOf("LGe/b;", "LFg/f\$c;"),
                returnType = "V",
            ),
            methodCall(
                definingClass = "LBg/r;",
                name = "<init>",
                parameters = listOf("LAe/b;", "Lzg/c\$c;"),
                returnType = "V",
            ),
        ),
    ),
)

/**
 * Stream selection evaluation loop (Fg.o.g in 3.0.75, zg.l.g in 3.0.76), which decides whether to play
 * the strict stream or immediately fall back to a lower quality upon receiving fast streams.
 */
private object StreamWaitDecisionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    strings = listOf(") All streams are processed, need to choose a stream to play"),
)

@Suppress("unused")
val preferredQualityPriorityPatch = bytecodePatch(
    name = "Preferred quality priority",
    description = "Plays at the quality from \"Preferred quality\" instead of the last quality chosen by hand, and waits for preferred quality sources before falling back.",
    default = true,
) {
    compatibleWith(ZONA_COMPATIBILITY)

    val waitTimeoutSecondsOption = intOption(
        key = "waitTimeoutSeconds",
        default = 5,
        title = "Wait timeout for preferred quality (1-30 sec)",
        description = "Time to wait for slow 1080p stream providers (torrents/mirrors) before falling back to lower quality. If 1080p is found earlier, playback starts immediately. Allowed range: 1 to 30 seconds.",
        required = true,
    ) { it != null && it in 1..30 }

    execute {
        // 1. Force the strict filter chain to demand the resolution from the "Preferred quality" setting.
        StreamSelectionFingerprint.method.apply {
            val parseResolution = StreamSelectionFingerprint.instructionMatches[0]
            val qualityArgument = StreamSelectionFingerprint.instructionMatches[1]

            val register = parseResolution.getInstruction<FiveRegisterInstruction>().registerC
            val qualityRegister = qualityArgument.getInstruction<FiveRegisterInstruction>().registerD

            val qualityMethodRef = qualityArgument.getInstruction<ReferenceInstruction>().reference as MethodReference
            val qualityType = qualityMethodRef.parameterTypes[0]

            addInstruction(parseResolution.index, "iget v$register, v$qualityRegister, $qualityType->c:I")
            addInstruction(
                parseResolution.index + 1,
                "invoke-static {v$register}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;",
            )
            addInstruction(parseResolution.index + 2, "move-result-object v$register")
        }

        // 2. Prevent premature fallback to lower quality in Fg.o.g/zg.l.g when the first fast provider finishes.
        // Instead of falling back immediately on status == Loaded, route through the timeout check.
        StreamWaitDecisionFingerprint.method.apply {
            val stringMatchIndex = StreamWaitDecisionFingerprint.stringMatches[0].index
            val branchIndex = (stringMatchIndex downTo 0).first {
                implementation!!.instructions[it] is BuilderInstruction22t
            }
            val original = implementation!!.instructions[branchIndex] as BuilderInstruction22t
            val alwaysJump = BuilderInstruction22t(
                Opcode.IF_EQ,
                original.registerB,
                original.registerB,
                original.target,
            )
            replaceInstruction(branchIndex, alwaysJump)
        }

        // 3. Customize the timeout duration in Fg.o.<clinit>/zg.l.<clinit> for how long to wait for 1080p before fallback.
        val timeoutSec = waitTimeoutSecondsOption.value!!
        StreamSelectionFingerprint.classDef.methods.first { it.name == "<clinit>" }.apply {
            for (index in implementation!!.instructions.indices) {
                val instruction = implementation!!.instructions[index]
                if (instruction is NarrowLiteralInstruction && instruction.narrowLiteral == 10) {
                    val reg = (instruction as OneRegisterInstruction).registerA
                    replaceInstruction(index, "const/16 v$reg, $timeoutSec")
                    addInstruction(index + 4, "const/16 v$reg, 10")
                    break
                }
            }
        }
    }
}
