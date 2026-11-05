package semicoloncolonel.mobilestream.patches.recgov.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.recgov.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Recreation.gov 2.2.67 takes a precise location every time the app comes to
// the foreground, from an app lifecycle observer. That observer's onStart
// now returns at once. Nearby search and permit check-in still ask for
// location when you use them.

@Suppress("unused")
val skipLocationOnOpenPatch = bytecodePatch(
    name = "Skip location on open",
    description = "Stops the app from reading your precise location every time you open it.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { true },
            { method ->
                method.name == "onStart" && method.returnType == "V" && method.parameterTypes.size == 1 &&
                    method.implementation?.instructions?.any { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Lcom/bah/r1smobile/utilities/LocationHandler;" &&
                                it.name == "checkLocationSettingsAndGetLocation"
                        } == true
                    } == true
            },
        ) { it.returnEarly("return-void") }
        if (count != 1) throw PatchException("Location lifecycle observer not found ($count)")
    }
}
