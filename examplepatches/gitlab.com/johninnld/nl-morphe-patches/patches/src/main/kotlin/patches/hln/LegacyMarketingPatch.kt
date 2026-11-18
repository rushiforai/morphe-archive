package patches.hln

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Legacy section marketing bypasses the article resolvers. Reuse its own
 * feature-disabled Result Flow before token lookup or request construction. */
internal val suppressLegacySectionMarketing = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val flow = exact("Llg;", "<init>(Ljava/lang/Object;B)V").classDef
        check("Lnk6;" in flow.interfaces) { "HLN legacy marketing completion is no longer a Flow" }
        exact("Lqte;", "<init>(Ljava/lang/Object;)V")
        exact("Lnte;", "<init>(Ljava/lang/Throwable;)V")
        val signature = "a(Landroid/app/Application;Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Lws3;)Ljava/lang/Object;"
        val original = exact("Lrjh;", signature).method.instructions.toList()
        val completions = original.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Llg;" && ref.name == "<init>" &&
                ref.parameterTypes == listOf("Ljava/lang/Object;", "B") && ref.returnType == "V"
        }
        check(completions.size == 1) { "HLN legacy feature-disabled Flow constructor changed" }
        val (index, instruction) = completions.single()
        val constructor = instruction as? Instruction35c
        val selector = original.getOrNull(index - 1)
        check(constructor != null && constructor.registerCount == 3 && selector is NarrowLiteralInstruction &&
            selector.narrowLiteral == 9 && (selector as? OneRegisterInstruction)?.registerA == constructor.registerE) {
            "HLN legacy feature-disabled Flow must retain finite selector 8"
        }
        change("Lrjh;", "a(Landroid/app/Application;Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Lws3;)Ljava/lang/Object;", """
            new-instance v0, Ljava/lang/IllegalAccessException;
            const-string v1, "TemptationView is disabled"
            invoke-direct {v0, v1}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V
            new-instance v1, Lnte;
            invoke-direct {v1, v0}, Lnte;-><init>(Ljava/lang/Throwable;)V
            new-instance v0, Lqte;
            invoke-direct {v0, v1}, Lqte;-><init>(Ljava/lang/Object;)V
            new-instance v1, Llg;
            const/16 v2, 0x9
            invoke-direct {v1, v0, v2}, Llg;-><init>(Ljava/lang/Object;B)V
            return-object v1
        """)
    }
}
