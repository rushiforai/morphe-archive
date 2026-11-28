package semicoloncolonel.mobilestream.patches.washingtonpost.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// The Washington Post 7.19.0 checks the user's age through Google Play's Age
// Signals API at launch, when its server turns the check on. The API is a
// Play Store service, so microG cannot answer it. The splash view model turns
// the result into what the user sees: a passed check opens the app, a real age
// result (restricted, parental permission needed, unknown) opens the block
// screen, and an API error shows the "Error on Google Services" dialog.
//
// The errors that only mean Google Play could not be asked are now treated as
// a passed check: Play Store or Play services missing or out of date, the Age
// Signals SDK out of date, and an install that did not come from Play (codes
// -1, -2, -4 to -7, -9, and -10). Network and transient errors (-3, -8) keep
// the app's own retry, and every age result Google Play does return still
// applies.

internal object AgeCheckResultFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lkotlin/Unit;",
    strings = listOf("state Age Restricted", "state Api Error => "),
)

@Suppress("unused")
val skipAgeCheckErrorsPatch = bytecodePatch(
    name = "Skip age check errors",
    description = "Opens the app without the \"Error on Google Services\" dialog when Google Play cannot " +
        "check your age, such as on a phone without the Play Store. An age result from Google Play still applies.",
) {
    category("Interface")
    compatibleWith(Constants.V7_19_COMPATIBILITY)

    execute {
        val method = AgeCheckResultFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val viewModel = method.parameterTypes[0].toString()

        // The passed check: the result class whose branch asks the view model
        // for its success state, a static (view model) -> state accessor.
        val successIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as MethodReference).let {
                    it.definingClass == viewModel && it.parameterTypes.map(CharSequence::toString) == listOf(viewModel) &&
                        it.returnType != "V"
                }
        }
        val passed = instructions.getOrNull(successIndex - 2)
            ?.takeIf { successIndex >= 2 && it.opcode == Opcode.INSTANCE_OF }
            ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
            ?: throw PatchException("Skip age check errors: no passed-check branch")
        val passedInstance = classDefBy(passed).fields.singleOrNull { field ->
            field.type == passed && AccessFlags.STATIC.isSet(field.accessFlags)
        } ?: throw PatchException("Skip age check errors: $passed has no single instance")

        // The API error branch logs its code: error() then code() come right
        // before the log message.
        val logIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == "state Api Error => "
        }
        val getters = instructions.subList(0, logIndex).filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .takeLast(2).map { (it as ReferenceInstruction).reference as MethodReference }
        if (getters.size != 2 || getters[1].returnType != "I") {
            throw PatchException("Skip age check errors: error code getters not found")
        }
        val apiError = getters[0].definingClass
        val error = getters[0].returnType

        // The method copies its parameters into v0 and v1 first, then uses v2
        // and v3 as scratch.
        val start = 2
        val copies = instructions.take(start).map { it as? TwoRegisterInstruction }
        if (copies.map { it?.opcode } != listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16) ||
            copies.map { it?.registerA } != listOf(0, 1)
        ) {
            throw PatchException("Skip age check errors: unexpected method start")
        }

        method.addInstructionsWithLabels(
            start,
            """
                instance-of v2, v1, $apiError
                if-eqz v2, :msp_keep
                move-object v2, v1
                check-cast v2, $apiError
                invoke-virtual { v2 }, $apiError->${getters[0].name}()$error
                move-result-object v2
                invoke-virtual { v2 }, $error->${getters[1].name}()I
                move-result v2
                const/16 v3, -0xa
                if-lt v2, v3, :msp_keep
                if-gez v2, :msp_keep
                const/4 v3, -0x3
                if-eq v2, v3, :msp_keep
                const/4 v3, -0x8
                if-eq v2, v3, :msp_keep
                sget-object v1, $passed->${passedInstance.name}:$passed
            """,
            ExternalLabel("msp_keep", method.getInstruction(start)),
        )
    }
}
