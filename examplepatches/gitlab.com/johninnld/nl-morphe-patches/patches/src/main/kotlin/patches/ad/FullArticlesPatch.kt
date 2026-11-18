package patches.ad

import app.morphe.patcher.patch.bytecodePatch

/** Both callers already accept these exact completed empty result types. */
internal val emptyMarketingTemplates = bytecodePatch {
    dependsOn(originalInput)
    execute {
        exact("Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;", "<init>(ZLjava/util/List;)V")
        change("Ljla;", "a(Ljava/lang/String;Lnet/persgroep/marketingtemplatessdk/core/types/Appearance;Ljava/util/List;Ldla;Lzs3;)Ljava/lang/Object;", """
            new-instance v0, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;
            const/4 v1, 0x0
            sget-object v2, Lht5;->a:Lht5;
            invoke-direct {v0, v1, v2}, Lnet/persgroep/marketingtemplatessdk/core/models/ResolveResponse;-><init>(ZLjava/util/List;)V
            return-object v0
        """)
        change("Ljq8;", "k(Lcom/persgroep/temptationsdk/data/model/ResolveResponse;)Ljava/util/ArrayList;", """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            return-object v0
        """)
    }
}

@Suppress("unused")
val readFullArticles = bytecodePatch(name = "Read full articles", description = "Requests complete article components through the shipped article API and completes both marketing resolvers with their supported empty results, preserving account and purchase state.") {
    compatibleWith(ad)
    dependsOn(originalInput, emptyMarketingTemplates)
    execute {
        // p3 is physical register 28: const/4 cannot encode it directly.
        // p2/cacCompatible, network coroutine, error and component mapping remain.
        change("Lht0;", "a(Ljava/lang/String;ZZLzs3;)Ljava/lang/Object;", "const/4 v0, 0x0\nmove/16 p3, v0")
    }
}
