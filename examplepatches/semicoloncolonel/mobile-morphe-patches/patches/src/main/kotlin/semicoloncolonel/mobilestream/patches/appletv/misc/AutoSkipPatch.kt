package semicoloncolonel.mobilestream.patches.appletv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Apple TV phone app 3.0.0 (Java and Media3). The stream lists its skippable
// parts as Skip segments (start, duration, target, label, action, promo),
// read from the HLS session data "com.apple.hls.skip.*". The player's view
// model follows the playback position and stores the segment the player is
// inside as its active segment, which shows the Skip button. The button calls
// a view model method that seeks to the segment's target.
//
// The view model registers itself with PhoneAutoSkipper when it is created,
// and every store of a new active segment is passed to PhoneAutoSkipper,
// which calls that same method for the parts the options chose.
//
// After a recap or intro is skipped, a "Watch Recap" or "Watch Intro"
// segment is added where it ends, so the app's own button offers to go back.
//
// The Android TV app shares the package name but not this code, so this patch
// does nothing there. Its own Auto-skip patch covers it.

private const val SKIPPER = "Lsemicoloncolonel/mobilestream/extension/appletv/PhoneAutoSkipper;"

internal object SkipSegmentToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("Skip(start="),
)

private fun switchFingerprint(name: String, returnType: String) = Fingerprint(
    definingClass = SKIPPER,
    name = name,
    returnType = returnType,
)

@Suppress("unused")
val autoSkipPatch = bytecodePatch(
    name = "Auto-skip",
    description = "Skips the parts you choose: Apple's promos for other titles, recaps, and intros.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val promos by booleanOption(
        key = "skipPromos",
        default = true,
        title = "Skip promos",
        description = "Skips Apple's promos for other titles that play before a show or movie.",
        required = true,
    )
    val recaps by booleanOption(
        key = "skipRecaps",
        default = false,
        title = "Skip recaps",
        description = "Skips the recap of earlier episodes.",
        required = true,
    )
    val intros by booleanOption(
        key = "skipIntros",
        default = false,
        title = "Skip intros",
        description = "Skips a show's opening titles.",
        required = true,
    )

    execute {
        val segment = SkipSegmentToStringFingerprint.classDefOrNull ?: return@execute
        val segmentType = segment.type

        // Fields: three Doubles, the label (String), the action (an enum with
        // NextVideo), and the promo details.
        val others = segment.fields.filter {
            it.type != "Ljava/lang/Double;" && it.type != "Ljava/lang/String;" &&
                (it.accessFlags and 0x8) == 0
        }
        val label = segment.fields.singleOrNull { it.type == "Ljava/lang/String;" }
            ?: throw PatchException("Apple TV skip label not found")
        fun isNextVideoEnum(type: String) = classDefByOrNull(type)?.methods?.any { method ->
            method.implementation?.instructions?.any {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "NextVideo"
            } == true
        } == true
        val action = others.singleOrNull { isNextVideoEnum(it.type) }
            ?: throw PatchException("Apple TV skip action not found")
        val promo = others.singleOrNull { it != action }
            ?: throw PatchException("Apple TV skip promo not found")

        // The view model: the class with two methods that take a segment. The
        // one that converts the target to milliseconds (a double multiply)
        // seeks.
        var viewModel: String? = null
        var skipMethod: String? = null
        classDefForEach { classDef ->
            val takers = classDef.methods.filter {
                it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf(segmentType)
            }
            if (takers.size != 2) return@classDefForEach
            val seek = takers.singleOrNull { method ->
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.MUL_DOUBLE || it.opcode == Opcode.MUL_DOUBLE_2ADDR
                } == true
            } ?: return@classDefForEach
            viewModel = classDef.type
            skipMethod = seek.name
        }
        val modelType = viewModel ?: throw PatchException("Apple TV player view model not found")
        val packagePrefix = modelType.substringBeforeLast('/') + "/"

        mutableClassDefBy(modelType).methods.filter { it.name == "<init>" }.forEach { init ->
            val returns = init.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed()
            returns.forEach { index ->
                init.addInstruction(index, "invoke-static/range { p0 .. p0 }, $SKIPPER->register(Ljava/lang/Object;)V")
            }
        }

        // Every store of a segment into a state holder, in the view model's
        // package: check-cast to the segment, then setValue(segment).
        val hooks = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(packagePrefix)) return@classDefForEach
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val casts = instructions.filter {
                    it.opcode == Opcode.CHECK_CAST &&
                        ((it as ReferenceInstruction).reference as TypeReference).type == segmentType
                }
                if (casts.isEmpty()) return@forEach
                val stores = instructions.any { isStoreOfCast(it, casts.map { c -> (c as OneRegisterInstruction).registerA }) }
                if (stores) hooks += classDef.type to method.name
            }
        }
        if (hooks.isEmpty()) throw PatchException("Apple TV active skip segment store not found")

        hooks.distinct().forEach { (type, name) ->
            mutableClassDefBy(type).methods.filter { it.name == name }.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val castRegisters = instructions.filter {
                    it.opcode == Opcode.CHECK_CAST &&
                        ((it as ReferenceInstruction).reference as TypeReference).type == segmentType
                }.map { (it as OneRegisterInstruction).registerA }
                instructions.withIndex()
                    .filter { isStoreOfCast(it.value, castRegisters) }
                    .map { it.index }
                    .reversed()
                    .forEach { index ->
                        val register = (instructions[index] as FiveRegisterInstruction).registerD
                        method.addInstruction(
                            index + 1,
                            "invoke-static/range { v$register .. v$register }, $SKIPPER->onActive(Ljava/lang/Object;)V",
                        )
                    }
            }
        }

        fun bool(name: String, on: Boolean?) =
            switchFingerprint(name, "Z").method.returnEarly("const/4 v0, ${if (on == true) "0x1" else "0x0"}\nreturn v0")
        fun text(name: String, value: String) =
            switchFingerprint(name, "Ljava/lang/String;").method.returnEarly("const-string v0, \"$value\"\nreturn-object v0")

        bool("skipPromos", promos)
        bool("skipRecaps", recaps)
        bool("skipIntros", intros)
        text("labelField", label.name)
        text("actionField", action.name)
        text("promoField", promo.name)
        text("skipMethod", skipMethod!!)

        // "Watch Recap" and "Watch Intro" (see PhoneAutoSkipper.addRewatch):
        // the segments' start, duration, and target fields, and the session
        // data's list of segments.
        val segmentLabels = fieldLabels(segment)
        listOf("start", "duration", "target").forEach {
            text("${it}Field", segmentLabels[it] ?: throw PatchException("Apple TV skip $it not found"))
        }
        val sessionData = SessionDataToStringFingerprint.classDefOrNull
            ?: throw PatchException("Apple TV session data not found")
        text("skipsField", fieldLabels(sessionData)["skips"] ?: throw PatchException("Apple TV skips not found"))

        mutableClassDefBy(sessionData.type).methods.filter { it.name == "<init>" && it.parameterTypes.isNotEmpty() }.forEach { init ->
            init.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    init.addInstruction(index, "invoke-static/range { p0 .. p0 }, $SKIPPER->addRewatch(Ljava/lang/Object;)V")
                }
        }

        // A "Watch" press goes back instead of forward.
        mutableClassDefBy(modelType).methods.single {
            it.name == skipMethod && it.parameterTypes.map { p -> p.toString() } == listOf(segmentType)
        }.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $SKIPPER->resolve(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, $segmentType
            """,
        )
    }
}

// invoke-interface { state, segment }, ...->setValue(Ljava/lang/Object;)V
private fun isStoreOfCast(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction, registers: List<Int>): Boolean {
    if (instruction.opcode != Opcode.INVOKE_INTERFACE && instruction.opcode != Opcode.INVOKE_VIRTUAL) return false
    val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: return false
    if (reference.name != "setValue" || reference.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;")) return false
    val call = instruction as FiveRegisterInstruction
    return call.registerCount == 2 && call.registerD in registers
}
