package semicoloncolonel.mobilestream.patches.npr.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.npr.shared.Constants

// NPR 7.10.0.
//
// "Hide Waze bar": the "Drive with Waze" bar at the top of the app is on
// unless you turn it off in settings. Its default is now off. The setting in
// NPR still turns it back on.
//
// "Hide donate buttons": the Donate buttons in the Home top bar, on the
// live-station module on Home, on station pages, and on a live stream's
// detail sheet. Station and
// story links to donate elsewhere in the app are not changed.

private const val WAZE_PREF = "Lorg/npr/one/waze/data/repo/WazePrefLiveData;"
private const val DONATE_HIDER = "Lsemicoloncolonel/mobilestream/extension/npr/DonateButtonHider;"

internal object WazePrefFingerprint : Fingerprint(
    definingClass = WAZE_PREF,
    name = "<init>",
    strings = listOf("org.npr.one.waze.enable_bar"),
)

internal object StationModuleDonateFingerprint : Fingerprint(
    definingClass = "Lorg/npr/one/modules/module/StationExpandableContainedView;",
    custom = { method, _ -> method.readsField("donateClickHandler") },
)

internal object StationPageViewCreatedFingerprint : Fingerprint(
    definingClass = "Lorg/npr/one/station/detail/view/StationDetailFragment;",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.IPUT_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).name == "bDonate"
        } == true && method.name == "onViewCreated"
    },
)

// The Home top bar's Donate button is shown when your station has a donation
// link and hidden when it does not.
internal object TopBarDonateFingerprint : Fingerprint(
    custom = { method, _ ->
        method.implementation?.instructions?.let { insns ->
            insns.any {
                it.opcode == Opcode.IGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).let { ref ->
                        ref.name == "donationUrl" && ref.definingClass.endsWith("/UserOrgEntity;")
                    }
            } && insns.any {
                (it as? ReferenceInstruction)?.reference.let { ref ->
                    ref is MethodReference && ref.name == "setVisibility"
                }
            }
        } == true
    },
)

internal object StreamDonateStateFingerprint : Fingerprint(
    strings = listOf("DONATE"),
    custom = { method, _ -> method.readsField("donationUrl") },
)

private fun com.android.tools.smali.dexlib2.iface.Method.readsField(name: String) =
    implementation?.instructions?.any {
        it.opcode == Opcode.IGET_OBJECT &&
            ((it as ReferenceInstruction).reference as FieldReference).name == name
    } == true

/** Replaces the first read of [field] with null. */
private fun MutableMethod.nullFieldRead(field: String) {
    val instructions = implementation!!.instructions.toList()
    val index = instructions.indexOfFirst {
        it.opcode == Opcode.IGET_OBJECT &&
            ((it as ReferenceInstruction).reference as FieldReference).name == field
    }
    if (index == -1) throw PatchException("$field read not found in $name")
    val register = (instructions[index] as TwoRegisterInstruction).registerA
    replaceInstruction(index, "const/4 v$register, 0x0")
}

@Suppress("unused")
val hideWazeBarPatch = bytecodePatch(
    name = "Hide Waze bar",
    description = "Turns off the \"Drive with Waze\" bar by default. You can turn it back on in the app's settings.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        WazePrefFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val getBoolean = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_INTERFACE &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "getBoolean"
            }
            if (getBoolean == -1) throw PatchException("getBoolean not found")
            val defaultRegister = (instructions[getBoolean] as Instruction35c).registerE
            // The one "true" that feeds both the default field and getBoolean.
            val trueIndex = (getBoolean downTo 0).firstOrNull { i ->
                val insn = instructions[i]
                insn.opcode == Opcode.CONST_4 &&
                    (insn as OneRegisterInstruction).registerA == defaultRegister &&
                    (insn as NarrowLiteralInstruction).narrowLiteral == 1
            } ?: throw PatchException("Waze bar default not found")
            replaceInstruction(trueIndex, "const/4 v$defaultRegister, 0x0")
        }
    }
}

@Suppress("unused")
val hideDonateButtonsPatch = bytecodePatch(
    name = "Hide donate buttons",
    description = "Hides the Donate buttons in the top bar, on Home, on station pages, and on live streams.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Home's live-station module hides its button when there is no handler.
        StationModuleDonateFingerprint.method.nullFieldRead("donateClickHandler")

        // Station page: hide the button as soon as it is found.
        StationPageViewCreatedFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.IPUT_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).name == "bDonate"
            }
            val register = (instructions[index] as TwoRegisterInstruction).registerA
            addInstruction(index + 1, "invoke-static { v$register }, $DONATE_HIDER->hide(Landroid/view/View;)V")
        }

        // Live stream detail sheet: the button is only offered when the
        // stream has a donation link.
        StreamDonateStateFingerprint.method.nullFieldRead("donationUrl")

        // Home top bar.
        TopBarDonateFingerprint.method.nullFieldRead("donationUrl")
    }
}
