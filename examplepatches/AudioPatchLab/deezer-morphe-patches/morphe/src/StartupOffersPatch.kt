package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val startupOffersPatch = patch {
    compatibleWith(deezerCompatibility)
    execute {
        mutableClassDefBy("Lcore/auth/module/UserAuthParsedResult;").methods.single {
            it.name == "isWaitingforPayment" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        // Independently verified against 9.0.27.3. R8 shares this class with
        // consent/logout rules: only variant 8 is the no-freemium redirect.
        // See johninnld/nl-morphe-patches, RemovePaywallsPatch.kt (7622f42).
        val rule = mutableClassDefBy("LIIlllIllIlIIllII;").methods.single {
            it.name == "IllIlllIIIllIlII" && it.parameterTypes ==
                listOf("Landroid/content/Context;", "LIIlIIlIIlIIIlll;") &&
                it.returnType == "LIIIlIIIIIIIIIlII;"
        }
        check(checkNotNull(rule.implementation).registerCount >= 5)
        rule.addInstructionsWithLabels(0, """
            iget v0, p0, LIIlllIllIlIIllII;->lIIIIIlllllIIIII:I
            const/16 v1, 0x8
            if-ne v0, v1, :native_rule
            const/4 v0, 0x0
            return-object v0
            :native_rule
            nop
        """.trimIndent())

        val activity = mutableClassDefBy("Lcom/deezer/ui/premium/NativePremiumActivity;")
        val create = activity.methods.single {
            it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;")
        }
        val code = checkNotNull(create.implementation)
        val superCall = code.instructions.withIndex().single {
            it.value.opcode == Opcode.INVOKE_SUPER &&
                (it.value as ReferenceInstruction).reference.toString().endsWith("->onCreate(Landroid/os/Bundle;)V")
        }.index
        check(code.registerCount - 2 >= 3)
        // The offer may be the task root after sign-in: launch Home before closing it.
        create.addInstructions(superCall + 1, """
            new-instance v0, Landroid/content/Intent;
            const-class v1, Lcom/deezer/ui/dynamicpage/DynamicPageRootActivity;
            invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
            const/high16 v2, 0x24000000
            invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
            invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent())
    }
}
