package app.morphe.patches.piko.misc.shim.methods.kotlin

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal lateinit var onReceiveParameterCheckInstruction: String

val kotlinHelperPatch = bytecodePatch(
    description = "Find Kotlin helper method",
) {
    dependsOn(patchModeCheckPatch)
    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val kotlinParameterCheckerMethod = KotlinParameterCheckerFingerprint
            .getReference<MethodReference>(1)!!

        onReceiveParameterCheckInstruction = """
            const-string v0, "context"
            invoke-static { p1, v0 }, $kotlinParameterCheckerMethod
            const-string p1, "intent"
            invoke-static { p2, p1 }, $kotlinParameterCheckerMethod
        """
    }
}
