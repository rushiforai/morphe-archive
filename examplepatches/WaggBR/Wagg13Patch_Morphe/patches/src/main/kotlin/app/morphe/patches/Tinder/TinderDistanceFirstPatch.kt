package app.morphe.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object ProfileDetailBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/profile/usecase/b;",
    name = "t",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lh4p;",
        "Ljava/util/List;",
        "Z",
        "Z",
        "Luev;",
        "Ljava/lang/String;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
)

private const val ORDER_HELPER = "Lapp/morphe/extension/tinder/patches/TinderDistanceOrder;"

@Suppress("unused")
val tinderDistanceFirstPatch = bytecodePatch(
    name = "Tinder Distance First",
    description = "Shows profile distance before Bio and Interests.",
) {
    compatibleWith(TinderCompatibility.TINDER)
    extendWith("extensions/extension.mpe")

    execute {
        ProfileDetailBuilderFingerprint.method.apply {
            val instructions = implementation!!.instructions

            // The profile detail model is built once, from the finished card list.
            val detailIndex = instructions.withIndex().singleOrNull { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Lh6p;" && reference.name == "<init>"
            }?.index ?: error("Tinder profile detail constructor was not found")

            val detailCall = instructions[detailIndex] as? RegisterRangeInstruction
                ?: error("Tinder profile detail constructor does not use a register range")
            check(detailCall.registerCount == 15) {
                "Unexpected Tinder profile detail constructor shape"
            }

            // First explicit argument of the constructor range is the ordered card list.
            val cardListRegister = detailCall.startRegister + 1

            // The profile model is last read from the hidden-card field right above the
            // constructor, which keeps the register choice tied to the verified shape
            // instead of an assumed local.
            val profileRegister = instructions.withIndex()
                .filter { (index, _) -> index < detailIndex }
                .mapNotNull { (_, instruction) ->
                    val read = instruction as? TwoRegisterInstruction ?: return@mapNotNull null
                    if (read.opcode != Opcode.IGET_OBJECT) return@mapNotNull null
                    val field = (read as? ReferenceInstruction)?.reference as? FieldReference
                    // iget-object vA, vB, field: the profile itself is the object operand.
                    if (field?.definingClass == "Lh4p;" && field.name == "X") read.registerB else null
                }
                .lastOrNull() ?: error("Tinder profile model register was not found")

            // v0 and v1 are free on this branch: both are copied into the constructor
            // arguments just before this point and are never read again.
            addInstructions(
                detailIndex,
                """
                    move-object/from16 v0, v$profileRegister
                    move-object/from16 v1, v$cardListRegister
                    invoke-static {v0, v1}, $ORDER_HELPER->moveEssentialsFirst(Ljava/lang/Object;Ljava/util/List;)V
                """.trimIndent(),
            )
        }
    }
}
