package patches.weeronline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips the cookie onboarding page, the automatic Didomi consent notice and the consent-or-pay " +
        "wall after disabling tracking and ads. Records no consent choice; Privacy settings in the menu remain " +
        "available.",
) {
    compatibleWith(weeronline)
    dependsOn(disableTracking, hideAds)
    execute {
        // Onboarding: Welcome continues to the location step instead of the cookies page.
        val ids = "$APP/R\$id;"
        Fingerprint(definingClass = "$APP/screen/onboarding/welcome/navigation/WelcomeNavigationUseCase;",
            name = "navigateToCookies",
            filters = listOf(fieldAccess(definingClass = ids, name = "cookiesFragment"))).let { fingerprint ->
            val index = fingerprint.instructionMatches.single().index
            val register = fingerprint.method.getInstruction<OneRegisterInstruction>(index).registerA
            fingerprint.method.replaceInstruction(index, "sget v$register, $ids->locationOnBoardingFragment:I")
        }

        // Infoplaza consent manager (shared with Buienalarm): the automatic gate's false path
        // publishes NotRequired, as for paid users, so waiting screens continue without a notice.
        val manager = Fingerprint(returnType = "Z", parameters = listOf("L"),
            strings = listOf("Didomi not ready yet; skipping shouldConsentBeCollected check")).originalClassDef.type
        val gate = Fingerprint(definingClass = manager, returnType = "Z", parameters = emptyList()).method
        var callers = 0
        classDefForEach { cls ->
            cls.methods.forEach { method ->
                callers += method.implementation?.instructions?.count { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == manager && ref.name == gate.name &&
                        ref.parameterTypes.isEmpty() && ref.returnType == "Z"
                } ?: 0
            }
        }
        check(callers == 2) { "Expected the two known automatic consent callers, found $callers" }
        Fingerprint(returnType = "Ljava/lang/Object;", parameters = emptyList(),
            strings = listOf("Trying to show consent", "Consent not required")).method
        // The manual Privacy settings path must still reach Didomi's preferences.
        Fingerprint(filters = listOf(methodCall(definingClass = "Lio/didomi/sdk/Didomi;",
            name = "showPreferences\$default")),
            custom = { _, classDef -> !classDef.type.startsWith("Lio/didomi/") }).method
        gate.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
