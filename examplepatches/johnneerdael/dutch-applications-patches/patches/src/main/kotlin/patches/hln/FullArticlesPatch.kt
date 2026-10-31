package patches.hln

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** The two app callers consume a completed list and first() of a Flow.
 * Preserve those distinct types while avoiding marketing token/network work. */
internal val suppressMarketingRequests = bytecodePatch {
    dependsOn(originalInput, suppressLegacySectionMarketing)
    execute {
        val flow = exact("Lq3g;", "<init>(Ljava/lang/Object;)V").classDef
        check("Lrk6;" in flow.interfaces) { "HLN marketing completion is no longer a Flow" }
        val caller = exact("Lk4m;", "j(Ljava/lang/String;ZLbt3;)Ljava/lang/Object;").method
        val calls = caller.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.toList()
        check(calls.count { it.definingClass == "Lnq8;" && it.name == "d" } == 1 &&
            calls.count { it.definingClass == "Lpw7;" && it.name == "H" &&
                it.parameterTypes == listOf("Lrk6;", "Lbt3;") && it.returnType == "Ljava/lang/Object;" } == 1) {
            "HLN native marketing caller no longer consumes first() of the result Flow"
        }
        val arguments = "(Ljava/lang/String;Ljava/lang/String;Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Lcom/persgroep/temptationsdk/data/model/Appearance;Lcom/persgroep/temptationsdk/data/model/PreferredTemplateType;Lbt3;)Ljava/lang/Object;"
        change("Lnq8;", "c$arguments", """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            return-object v0
        """)
        change("Lnq8;", "d$arguments", """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            new-instance v1, Lq3g;
            invoke-direct {v1, v0}, Lq3g;-><init>(Ljava/lang/Object;)V
            return-object v1
        """)
    }
}

/** Both callers already accept these exact completed empty result types. */
internal val emptyMarketingTemplates = bytecodePatch {
    dependsOn(originalInput, suppressMarketingRequests)
    execute {
        exact("Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;", "<init>(ZLjava/util/List;)V")
        change("Lmla;", "a(Ljava/lang/String;Lnet/persgroep/marketingtemplatessdk/core/types/Appearance;Ljava/util/List;Lgla;Lbt3;)Ljava/lang/Object;", """
            new-instance v0, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;
            const/4 v1, 0x0
            sget-object v2, Lkt5;->a:Lkt5;
            invoke-direct {v0, v1, v2}, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;-><init>(ZLjava/util/List;)V
            return-object v0
        """)
        change("Lnq8;", "k(Lcom/persgroep/temptationsdk/data/model/ResolveResponse;)Ljava/util/ArrayList;", """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            return-object v0
        """)
    }
}

@Suppress("unused")
val readFullArticles = bytecodePatch(name = "Read full articles", description = "Requests complete article components through the shipped article API and completes both marketing resolvers with their supported empty results, preserving account and purchase state.") {
    compatibleWith(hln)
    dependsOn(originalInput, emptyMarketingTemplates)
    execute {
        // p3 is physical register 28: const/4 cannot encode it directly.
        // p2/cacCompatible, network coroutine, error and component mapping remain.
        change("Lht0;", "a(Ljava/lang/String;ZZLbt3;)Ljava/lang/Object;", "const/4 v0, 0x0\nmove/16 p3, v0")
    }
}
