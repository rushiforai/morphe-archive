package patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

private const val ANSWERS = "Lorg/ungoogled/waze/ConsentAnswers;"

@Suppress("unused")
val wazeSkipConsentScreensPatch = bytecodePatch(
    name = "Skip consent screens",
    description = "Answers privacy and terms consent silently and declines ad personalization without showing a screen.",
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeCustomizationPatch)

    execute {
        declareWazeToggle("skipConsent")

        // Both the native privacy request and its legacy presenter run the same completion path.
        // Waze's own non-personalized answer writes the preference and completes native consent.
        val privacyAnswer = """
            invoke-static { }, Lcom/waze/NativeManager;->getInstance()Lcom/waze/NativeManager;
            move-result-object v0
            invoke-virtual { v0 }, Lcom/waze/NativeManagerBase;->auditReportConsentBumpAgreeClicked()V
            const/4 v0, 0x0
            invoke-static { v0 }, Lcom/waze/ih;->j(Z)V
            return-void
        """
        mutableClassDefBy("Lcom/waze/NativeManager;").methods.single {
            it.name == "ShowPrivacyConsentBump" && it.parameterTypes.isEmpty()
        }.whenWazeFeature("skipConsent", privacyAnswer)
        mutableClassDefBy("Lcom/waze/ih;").methods.single {
            it.name == "w" && it.parameterTypes.map { type -> type.toString() } == listOf("Lcom/waze/b/t;")
        }.whenWazeFeature("skipConsent", privacyAnswer)
        mutableClassDefBy("Lcom/waze/ih;").methods.single {
            it.name == "v" && it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/Context;")
        }.whenWazeFeature("skipConsent", """
            const/4 v0, 0x0
            invoke-static { v0 }, Lcom/waze/ih;->j(Z)V
            return-void
        """)

        // The current ads dialog: g(false, true) is its genuine non-personalized button handler.
        mutableClassDefBy("Lcom/waze/uid/d;").methods.single {
            it.name == "a" && it.parameterTypes.firstOrNull()?.toString() == "Lcom/waze/uid/d;"
        }.whenWazeFeature("skipConsent", """
            move-object/from16 v1, p0
            const/4 v0, 0x0
            const/4 v2, 0x1
            invoke-direct { v1, v0, v2 }, Lcom/waze/uid/d;->g(ZZ)V
            sget-object v0, Lg/ab;->a:Lg/ab;
            return-object v0
        """, scratch = 3)

        // Signup privacy/terms states: keep state-entry initialization, then invoke the original
        // accepted handler (native approval + state-machine completion), before opening its service.
        for (type in listOf("Lcom/waze/uid/state_impl/g/p;", "Lcom/waze/uid/state_impl/g/m;")) {
            val enter = mutableClassDefBy(type).methods.single {
                it.name == "f" && it.parameterTypes.map { t -> t.toString() } == listOf("Lcom/waze/uid/e/e;")
            }
            val superCall = enter.implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_SUPER &&
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "f"
            }
            if (superCall < 0) throw PatchException("Consent state entry changed: $type")
            enter.whenWazeFeature("skipConsent", """
                invoke-static/range { p0 .. p0 }, $type->a($type)Lg/ab;
                return-void
            """, superCall + 1)
        }

        // New policy bumps are shared by phone and Android Auto. Answer at the requirement
        // decision, before routing to either screen. Copy the exact existing acceptance body;
        // it reads REQUIRED_ID and writes ACCEPTED_ID through Waze's normal config setter.
        val accept = classDefBy("Lcom/waze/s/b;").methods.single { it.name == "d" && it.returnType == "V" }
        val answers = mutableClassDefBy(ANSWERS)
        answers.methods.remove(answers.methods.single { it.name == "acceptCurrentPolicy" })
        answers.methods.add(ImmutableMethod(
            ANSWERS, "acceptCurrentPolicy", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, accept.implementation!!,
        ).toMutable())
        val decision = mutableClassDefBy("Lcom/waze/s/e;").methods.single { it.name == "invokeSuspend" }
        val code = decision.implementation!!.instructions.toList()
        val boxes = code.indices.filter {
            ((code[it] as? ReferenceInstruction)?.reference as? MethodReference)?.toString() ==
                "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"
        }
        val at = boxes.singleOrNull() ?: throw PatchException("Shared consent requirement decision changed")
        val register = (code[at] as FiveRegisterInstruction).registerC
        decision.replaceInstruction(at, "invoke-static { v$register }, $ANSWERS->answerModern(Z)Ljava/lang/Boolean;")
    }
}
