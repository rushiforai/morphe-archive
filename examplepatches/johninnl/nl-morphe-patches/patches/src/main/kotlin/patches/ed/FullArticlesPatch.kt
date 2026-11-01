package patches.ed

import app.morphe.patcher.patch.bytecodePatch

/** Both callers already accept these exact completed empty result types. */
internal val emptyMarketingTemplates = bytecodePatch {
    dependsOn(originalInput, automaticSectionPrompts)
    execute {
        exact("Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;", "<init>(ZLjava/util/List;)V")
        change("Lema;", "a(Ljava/lang/String;Lnet/persgroep/marketingtemplatessdk/core/types/Appearance;Ljava/util/List;Lyla;Lgt3;)Ljava/lang/Object;", """
            new-instance v0, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;
            const/4 v1, 0x0
            sget-object v2, Lnt5;->a:Lnt5;
            invoke-direct {v0, v1, v2}, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;-><init>(ZLjava/util/List;)V
            return-object v0
        """)
        change("Llq8;", "l(Lcom/persgroep/temptationsdk/data/model/ResolveResponse;)Ljava/util/ArrayList;", """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            return-object v0
        """)
    }
}

@Suppress("unused")
val readFullArticles = bytecodePatch(name = "Read full articles", description = "Requests complete article components through the shipped article API and completes both marketing resolvers with their supported empty results, preserving account and purchase state.") {
    compatibleWith(ed)
    dependsOn(originalInput, emptyMarketingTemplates)
    execute {
        // p3 is physical register 28: const/4 cannot encode it directly.
        // p2/cacCompatible, network coroutine, error and component mapping remain.
        change("Llt0;", "a(Ljava/lang/String;ZZLgt3;)Ljava/lang/Object;", "const/4 v0, 0x0\nmove/16 p3, v0")
    }
}
