package patches.weerplaza

import app.morphe.patcher.Fingerprint
import patches.shared.uniqueMatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips automatic consent through the existing ConsentNotRequired completion after disabling ads and tracking. Records no consent choice and retains manual privacy settings.",
) {
    dependsOn(originalInput)
    compatibleWith(weerplaza)
    dependsOn(hideAds, disableTracking)
    execute {
        installWebRequestPolicy(WebControl.Consent)
        installWebSanitizer(WebControl.Consent)
        Fingerprint(definingClass = "Lt9/y;", name = "A", returnType = "Z", strings = listOf("Didomi not ready yet; skipping shouldConsentBeCollected check")).uniqueMatch().method
        val gate = exact("Lt9/y;", "z", "Z").method
        var callers = 0
        classDefForEach { cls -> cls.methods.forEach { method ->
            callers += method.implementation?.instructions?.count {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lt9/y;" && ref.name == "z" && ref.parameterTypes.isEmpty() && ref.returnType == "Z"
            } ?: 0
        } }
        check(callers == 2) { "Expected two automatic consent gate callers, found $callers" }
        Fingerprint(definingClass = "Lt9/y;", name = "I", strings = listOf("Trying to show consent", "Consent not required")).uniqueMatch().method
        Fingerprint(definingClass = "Lv9/d;", name = "g", filters = listOf(methodCall(definingClass = "Lio/didomi/sdk/Didomi;", name = "showPreferences\$default"))).uniqueMatch().method
        gate.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
