package lab.yahoofinance.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Passive diagnostics: whitelist public finance paths/status codes and local access outcomes.
 * Never logs headers, query parameters, cookies, account IDs, response bodies or tokens.
 */
@Suppress("unused")
val yahooFinanceAnalysisDiagnosticPatch = bytecodePatch(
    name = "Yahoo Finance - Analysis diagnostics A7",
    description = "Logs finance analysis response status and local subscription access outcomes without changing results.",
    default = false
) {
    compatibleWith(Compatibility(name = "Yahoo Finance", packageName = "com.yahoo.mobile.client.android.finance", targets = listOf(AppTarget(version = "26.21.2"))))
    execute {
        val owner = "Lretrofit2/q0;"
        val response = "Lokhttp3/r0;"
        val clazz = mutableClassDefBy(owner)
        val name = "yfAnalysisResponseStatus"
        require(clazz.methods.none { it.name == name })
        val helper = ImmutableMethod(owner, name, listOf(ImmutableMethodParameter(response, null, null)), "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(6)).toMutable()
        helper.addInstructionsWithLabels(0, """
            if-eqz p0, :done
            iget-object v0, p0, Lokhttp3/r0;->a:Lokhttp3/l0;
            iget-object v0, v0, Lokhttp3/l0;->a:Lokhttp3/a0;
            iget-object v0, v0, Lokhttp3/a0;->f:Ljava/util/ArrayList;
            const-string v1, "/"
            invoke-static {v1, v0}, Ljava/lang/String;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;
            move-result-object v0
            const-string v1, "quoteSummary/"
            invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v1
            if-nez v1, :record
            const-string v1, "finance/premium/insights"
            invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v1
            if-nez v1, :record
            const-string v1, "finance/premium/company360"
            invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v1
            if-nez v1, :record
            const-string v1, "ws/obi-integration/v1/subscriptions"
            invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :done
            :record
            new-instance v1, Ljava/lang/StringBuilder;
            invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
            invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v0, " HTTP="
            invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            iget v2, p0, Lokhttp3/r0;->d:I
            invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
            invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
            move-result-object v1
            const-string v0, "YF-ANALYSIS-A7"
            invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            :done
            return-void
        """.trimIndent())
        clazz.methods.add(helper)
        val ctor = Fingerprint(definingClass = owner, name = "<init>", returnType = "V",
            parameters = listOf(response, "Ljava/lang/Object;", "Lokhttp3/t0;")).method
        ctor.addInstructionsWithLabels(1, "invoke-static {p1}, $owner->$name($response)V")
        val access = Fingerprint(definingClass = "Lcom/yahoo/mobile/client/android/finance/subscription/a0;", name = "h",
            returnType = "Lcom/yahoo/mobile/client/android/finance/subscription/SubscriptionManager${'$'}FeatureAccessibility;",
            parameters = listOf("Lcom/yahoo/mobile/client/android/finance/data/repository/SubscriptionRepository${'$'}BESubscriptionFeature;")).method
        val impl = requireNotNull(access.implementation)
        require(impl.registerCount == 4)
        val instructions = impl.instructions.toList()
        var count = 0
        instructions.indices.reversed().forEach { index ->
            if (instructions[index].opcode == Opcode.RETURN_OBJECT) {
                val field = (instructions[index - 1] as? ReferenceInstruction)?.reference as? FieldReference
                require(field != null && field.name in listOf("HAS_ACCESS", "REQUIRES_UPGRADE", "REQUIRES_SUBSCRIPTION"))
                access.addInstructionsWithLabels(index, """
                    const-string v0, "YF-ACCESS-A7"
                    const-string v1, "${field.name}"
                    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                """.trimIndent())
                count++
            }
        }
        require(count == 3)
    }
}
