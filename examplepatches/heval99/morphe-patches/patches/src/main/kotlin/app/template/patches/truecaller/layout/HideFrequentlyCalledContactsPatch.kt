package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.Opcode

private const val FEATURE = "truecaller.hide_frequent_contacts"

// A Heval Controls feature: the list builder skips the row only while it is on. The builder runs
// whenever the call log list updates, so no restart is needed.
@Suppress("unused")
val hideFrequentlyCalledContactsPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide frequently called contacts",
        description = "Hides the row of frequently called contacts above the call log.",
        category = TruecallerControlsCategory.CALL_LOG,
    ),
    default = false,
) {
    // The revamped call log's list builder adds the row as the LazyColumn item
    // "frequent_contacts_id" behind if-eqz on its show flag (set from the Family onboarding and
    // banner states). While the feature is on, the builder jumps past the item; the flag, the row's
    // data and the other items are untouched. With "Restore classic call log" this builder is not
    // used.
    FrequentContactsListFingerprint.method.skipLazyListItem("frequent_contacts_id", FEATURE) { instructions, guard ->
        if (instructions[guard].opcode != Opcode.IF_EQZ) {
            throw PatchException("The frequent contacts item is guarded by ${instructions[guard].opcode}, expected if-eqz on its show flag")
        }
    }
}
