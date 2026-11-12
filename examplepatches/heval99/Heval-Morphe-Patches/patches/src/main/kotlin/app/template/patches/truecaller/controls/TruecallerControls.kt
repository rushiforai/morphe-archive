package app.template.patches.truecaller.controls

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.shared.hevalcontrols.hevalControlsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val TRUECALLER_CONTROLS_ENTRY = "Lapp/template/extension/truecaller/HevalControlsEntry;"

/** Categories of the Truecaller features, in the order a full patch set usually registers them. */
internal object TruecallerControlsCategory {
    const val PROMOTIONS = "Promotions & nags"
    const val TABS = "Tabs & buttons"
    const val CALL_LOG = "Call log & search"
    const val CONTACTS = "Contacts & business"
    const val CALL_SCREEN = "Call screen"
    const val PROFILE_MENU = "Profile menu"
    const val PRIVACY = "Privacy"
}

/**
 * The in-app entry point: a "Patch settings" row after "Help" on Truecaller's main Settings screen,
 * styled like the stock rows (HevalControlsEntry in extensions/truecaller). It is part of the "Patch
 * settings" patch, so the screen can always be reached.
 */
private val truecallerControlsEntryPatch = bytecodePatch(
    description = "Adds a \"Patch settings\" row to Truecaller's Settings screen.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    extendWith("extensions/truecaller.mpe")

    execute {
        classDefBy(TRUECALLER_CONTROLS_ENTRY)

        // Right after super.onViewCreated(view, state): the rows are inflated, and the fragment
        // binds them (visibility, click listeners) only after this point. p1 is the root view; it
        // is a high register (v27 in 26.42.5), hence /range.
        val onViewCreated = CategoriesFragmentViewCreatedFingerprint.method
        val superCalls = onViewCreated.instructions.withIndex().filter { (_, instruction) ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            (instruction.opcode == Opcode.INVOKE_SUPER || instruction.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                call?.name == "onViewCreated" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        }
        val superCall = superCalls.singleOrNull()?.index
            ?: throw PatchException("CategoriesFragment.onViewCreated calls super.onViewCreated ${superCalls.size} times, expected once")
        onViewCreated.requireNoBranchTargetAt(superCall + 1, "Patch settings row")
        onViewCreated.addInstructionsChecked(
            superCall + 1,
            "invoke-static/range {p1 .. p1}, $TRUECALLER_CONTROLS_ENTRY->addRow(Landroid/view/View;)V",
        )
    }
}

/** The Truecaller Heval Controls host; the converted Truecaller patches are its feature patches. */
internal val truecallerControls = hevalControlsPatch(
    COMPATIBILITY_TRUECALLER,
    dependencies = setOf(truecallerControlsEntryPatch),
)

// Expose the host patch, so Manager lists "Patch settings".
@Suppress("unused")
val truecallerHevalControlsPatch = truecallerControls.patch

