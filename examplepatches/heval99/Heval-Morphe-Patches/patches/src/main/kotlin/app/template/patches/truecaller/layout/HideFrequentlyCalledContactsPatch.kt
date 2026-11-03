package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val hideFrequentlyCalledContactsPatch = bytecodePatch(
    name = "Hide frequently called contacts",
    description = "Hides the row of frequently called contacts above the call log.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // The revamped call log's list builder adds the row as the LazyColumn item
        // "frequent_contacts_id" behind if-eqz on its show flag (set from the Family onboarding and
        // banner states). The builder now always jumps past the item; the flag, the row's data and
        // the other items are untouched. With "Restore classic call log" this builder is not used.
        FrequentContactsListFingerprint.method.skipLazyListItem("frequent_contacts_id") { instructions, guard ->
            if (instructions[guard].opcode != Opcode.IF_EQZ) {
                throw PatchException("The frequent contacts item is guarded by ${instructions[guard].opcode}, expected if-eqz on its show flag")
            }
        }
    }
}
