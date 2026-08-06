package app.logm1lo.patches.calistree.premium

import app.logm1lo.patches.shared.COMPATIBILITY_CALISTREE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch

private val FAKE_ENTITLEMENT_SMALI = """
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V
    const-string v1, "identifier"
    const-string v2, "pro"
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "isActive"
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "willRenew"
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    const-string v1, "isSandbox"
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    new-instance v1, Ljava/util/LinkedHashMap;
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V
    const-string v2, "pro"
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V
    const-string v2, "all"
    invoke-static {v2, v0}, Lkm/v;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkm/p;
    move-result-object v0
    const-string v2, "active"
    invoke-static {v2, v1}, Lkm/v;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkm/p;
    move-result-object v1
    const-string v2, "verification"
    const-string v3, "NOT_REQUESTED"
    invoke-static {v2, v3}, Lkm/v;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkm/p;
    move-result-object v2
    filled-new-array {v0, v1, v2}, [Lkm/p;
    move-result-object v0
    invoke-static {v0}, Llm/o0;->l([Lkm/p;)Ljava/util/Map;
    move-result-object v0
    return-object v0
""".trimIndent()

@Suppress("unused")
val calistreePremiumPatch = bytecodePatch(
    name = "Premium Unlock",
    description = "Unlocks all Calistree PRO features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CALISTREE)

    execute {
        GetActiveFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.replaceInstruction(fp.instructionMatches[0].index,
                "iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;")
        }

        GetActiveSubsFingerprint.let { fp ->
            val m = fp.matchOrNull() ?: return@let
            m.method.addInstructions(0, """
                new-instance v0, Ljava/util/HashSet;
                invoke-direct {v0}, Ljava/util/HashSet;-><init>()V
                const-string v1, "pro"
                invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
                return-object v0
            """)
        }

        EntitlementMapFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, FAKE_ENTITLEMENT_SMALI)
        }

        AllPurchasedIdsFingerprint.let { fp ->
            fp.matchOrNull()?.method?.addInstructions(0, """
                new-instance v0, Ljava/util/HashSet;
                invoke-direct {v0}, Ljava/util/HashSet;-><init>()V
                const-string v1, "pro"
                invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
                return-object v0
            """)
        }

        CustomerInfoMapFingerprint.let { fp ->
            val match = fp.matchOrNull() ?: return@let
            val returnIdx = match.method.implementation!!.instructions
                .indexOfLast { it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT }
            if (returnIdx >= 0) {
                match.method.addInstructions(returnIdx, """
                    const-string v3, "latestExpirationDate"
                    const-string v4, "2099-01-01T00:00:00.000Z"
                    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    const-string v3, "allExpirationDates"
                    new-instance v4, Ljava/util/LinkedHashMap;
                    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V
                    const-string v5, "pro"
                    const-string v6, "2099-01-01T00:00:00.000Z"
                    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                """.trimIndent())
            }
        }
    }
}
