package patches.buienradar.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR

@Suppress("unused")
val hidePremiumBannerPatch = bytecodePatch(
    name = "Hide Premium banner",
    description = "Hides the 'Discover Buienradar Premium' promotion blocks on the Today and Info tabs and the Plus " +
        "trial notification.",
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)

    execute {
        // Enum constant: first static field assigned after its name string in <clinit>.
        fun promotionsType(name: String) = PromotionsTypeEnumFingerprint.method.let { clinit ->
            val stringIndex = clinit.instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    (it as ReferenceInstruction).reference.toString() == name
            }
            clinit.instructions.drop(stringIndex).first { it.opcode == Opcode.SPUT_OBJECT }
                .let { (it as ReferenceInstruction).reference as FieldReference }
        }
        val todayField = promotionsType("TODAY")
        val settingsField = promotionsType("SETTINGS")

        val showUiClass = PromotionsShowUiToStringFingerprint.originalClassDef
        val showUiType = showUiClass.type
        val stateSuperclass = showUiClass.superclass!!

        fun stateObject(toStringValue: String): Pair<ClassDef, String> {
            val classDef = Fingerprint(
                superclass = stateSuperclass,
                name = "toString",
                returnType = "Ljava/lang/String;",
                strings = listOf(toStringValue)
            ).originalClassDef
            val field = classDef.staticFields.first { it.type == classDef.type }
            return classDef to "${classDef.type}->${field.name}:${classDef.type}"
        }

        val (loadingClass, _) = stateObject("Loading")
        val (_, hideInstance) = stateObject("Hide")

        // Method that loads the promotions for the Today screen:
        //   state.emit(Loading); ...; state.emit(ShowUI(list, PromotionsType.TODAY))
        Fingerprint(
            filters = listOf(
                fieldAccess(reference = todayField, opcode = Opcode.SGET_OBJECT),
                methodCall(
                    definingClass = showUiType,
                    name = "<init>",
                    opcode = Opcode.INVOKE_DIRECT
                )
            )
        ).let { fingerprint ->
            fingerprint.method.apply {
                // Replace ShowUI(..., TODAY) with Hide.
                val initIndex = fingerprint.instructionMatches.last().index
                val showUiRegister = getInstruction<FiveRegisterInstruction>(initIndex).registerC
                addInstruction(initIndex + 1, "sget-object v$showUiRegister, $hideInstance")

                // Replace Loading with Hide as well, so no placeholder flashes while loading.
                instructions.withIndex()
                    .filter { (_, instruction) ->
                        instruction.opcode == Opcode.SGET_OBJECT &&
                            ((instruction as ReferenceInstruction).reference as FieldReference)
                                .definingClass == loadingClass.type
                    }
                    .map { it.index }
                    .sortedDescending()
                    .forEach { index ->
                        val register = getInstruction<OneRegisterInstruction>(index).registerA
                        addInstruction(index + 1, "sget-object v$register, $hideInstance")
                    }
            }
        }

        // Info tab and the Pay-or-OK screen: ShowUI(list, SETTINGS) becomes Hide. Both
        // sites only pass the value on as the sealed state type.
        fun Instruction.isSettingsType() = opcode == Opcode.SGET_OBJECT &&
            (this as ReferenceInstruction).reference == settingsField
        fun Instruction.isShowUiInit() = opcode == Opcode.INVOKE_DIRECT &&
            ((this as ReferenceInstruction).reference as MethodReference).let {
                it.definingClass == showUiType && it.name == "<init>"
            }
        var settingsSites = 0
        classDefForEach { classDef ->
            if (classDef.methods.none { method ->
                    method.implementation?.instructions?.let { list -> list.any { it.isSettingsType() } } == true
                }) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                val list = method.implementation?.instructions?.toList() ?: return@forEach
                list.withIndex().filter { (index, instruction) ->
                    instruction.isShowUiInit() && list.subList(maxOf(0, index - 3), index).any { it.isSettingsType() }
                }.map { it.index }.sortedDescending().forEach { index ->
                    val register = method.getInstruction<FiveRegisterInstruction>(index).registerC
                    method.addInstruction(index + 1, "sget-object v$register, $hideInstance")
                    settingsSites++
                }
            }
        }
        check(settingsSites == 2) { "Expected Info tab and Pay-or-OK promotions, found $settingsSites" }

        // Complete the trial notification job successfully without posting it.
        // The worker's own early exit (no notification permission) returns this result type.
        TrialNotificationWorkFingerprint.method.apply {
            val successType = instructions.last { it.opcode == Opcode.NEW_INSTANCE }
                .let { ((it as ReferenceInstruction).reference as TypeReference).type }
            addInstructions(
                0,
                """
                    new-instance v0, $successType
                    invoke-direct {v0}, $successType-><init>()V
                    return-object v0
                """
            )
        }
    }
}
