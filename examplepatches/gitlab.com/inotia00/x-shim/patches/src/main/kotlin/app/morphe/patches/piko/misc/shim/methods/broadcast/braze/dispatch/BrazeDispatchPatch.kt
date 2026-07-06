package app.morphe.patches.piko.misc.shim.methods.broadcast.braze.dispatch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.kotlin.kotlinHelperPatch
import app.morphe.patches.piko.misc.shim.methods.kotlin.onReceiveParameterCheckInstruction
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.misc.version.is_11_99_or_greater
import app.morphe.patches.piko.misc.version.versionCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val brazeDispatchPatch = bytecodePatch(
    description = "BrazeDispatchPatch",
) {
    dependsOn(
        kotlinHelperPatch,
        patchModeCheckPatch,
        versionCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        if (!is_11_99_or_greater) {
            return@execute
        }

        val brazeDisPatchClass = BrazeDisPatchConnectionFingerprint
            .getReference<TypeReference>(4)!!
            .type

        val localField = brazeDisPatchClass.findField {
            type.startsWith(BRAZE_DISPATCH_CLASS_PREFIX)
        }

        val helperMethod = BrazeDisPatchConnectivityEventConstructorFingerprint.method

        val (instanceField, coroutineMethod) = with(DefaultBrazeImageLoaderFingerprint) {
            Pair(
                getReference<FieldReference>(0)!!,
                getReference<MethodReference>(1)!!
            )
        }

        onReceiveFingerprint(brazeDisPatchClass).let {
            it.clearMatch()
            it.method.apply {
                cleanup()
                addInstructions(
                    0,
                    onReceiveParameterCheckInstruction + $$"""
                        invoke-virtual { p0 }, Landroid/content/BroadcastReceiver;->goAsync()Landroid/content/BroadcastReceiver$PendingResult;
                        move-result-object p1
                        new-instance v3, $${helperMethod.definingClass}
                        iget-object v1, p0, $$localField
                        const/4 v2, 0x0
                        invoke-direct { v3, v1, p2, p1, v2 }, $$helperMethod
                        sget-object v0, $$instanceField
                        const/4 v1, 0x0
                        const/4 v4, 0x3
                        const/4 v5, 0x0
                        invoke-static/range { v0 .. v5 }, $$coroutineMethod
                        return-void
                    """
                )
            }
        }

    }
}
