package app.template.patches.truecaller.misc.t9

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionChecked
import app.template.patches.truecaller.misc.gms.TruecallerInitOnCreateFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val INCREMENTAL_HELPER = "morpheRefreshT9Incremental"

// T9 search (content://com.truecaller/aggregated_contact_t9) joins the t9_mapping table, which only
// RefreshT9MappingWorker fills: every 12 hours as a background job, or at once through the
// RebuildAll helper, which only old-settings migrations and the QA menu call. A fresh install so
// has an empty T9 index for hours. This enqueues the same worker on every launch, in its
// incremental mode (RebuildAll = false): it indexes only the contacts that have no up-to-date
// mapping, and does nothing before login. The helper enqueues a unique job with
// ExistingWorkPolicy.REPLACE ("Standalone_RefreshT9MappingWorker"), so repeated launches replace the
// pending job instead of stacking runs. One side effect: a full RebuildAll that an old-settings
// migration or the QA menu just queued (and an in-progress run) is replaced by the incremental job;
// acceptable for an opt-in patch, and the incremental job still indexes every unmapped contact.
@Suppress("unused")
val fixT9ContactSearchPatch = bytecodePatch(
    name = "Fix T9 contact search",
    description = "Fixes T9 search not finding new contacts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. The RebuildAll helper: exactly one static (Context)V method with both strings.
        val matches = RefreshT9MappingFingerprint.matchAllOrNull().orEmpty()
        val match = matches.singleOrNull() ?: throw PatchException(
            "Expected one RefreshT9MappingWorker helper, found " +
                matches.map { "${it.classDef.type}->${it.method.name}" },
        )
        val helper = match.method
        val helperClass = match.classDef

        // 2. Its single Boolean.TRUE load (the RebuildAll value).
        val trueLoads = helper.instructions.withIndex().filter { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Ljava/lang/Boolean;" &&
                field.name == "TRUE"
        }
        val trueLoad = trueLoads.singleOrNull() ?: throw PatchException(
            "${helperClass.type}->${helper.name} has ${trueLoads.size} Boolean.TRUE loads, expected one",
        )
        val valueRegister = (trueLoad.value as OneRegisterInstruction).registerA

        // 3. A private static copy of the helper that enqueues the worker with RebuildAll = FALSE.
        // ImmutableMethod deep-copies the implementation, so the original stays unchanged.
        val incremental = ImmutableMethod(
            helperClass.type,
            INCREMENTAL_HELPER,
            helper.parameters,
            helper.returnType,
            // Public, not private: this helper is invoked from TruecallerInit (a different class,
            // and w6j is in the default package), and dex has no nestmate access, so a private
            // method would throw IllegalAccessError at the call site.
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            helper.implementation,
        ).toMutable().apply {
            replaceInstruction(trueLoad.index, "sget-object v$valueRegister, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
        }
        helperClass.methods.add(incremental)

        // 4. Call it from the launch activity right after super.onCreate, once the activity (and
        // the app's dependency graph) is set up. p0 is a high register here, hence /range.
        val onCreate = TruecallerInitOnCreateFingerprint.method
        val superCall = onCreate.instructions.indexOfFirst { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            (instruction.opcode == Opcode.INVOKE_SUPER || instruction.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                call?.name == "onCreate" && call.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
        }
        if (superCall < 0) throw PatchException("TruecallerInit.onCreate does not call super.onCreate")
        onCreate.addInstructionChecked(
            superCall + 1,
            "invoke-static/range {p0 .. p0}, ${helperClass.type}->$INCREMENTAL_HELPER(Landroid/content/Context;)V",
        )
    }
}
