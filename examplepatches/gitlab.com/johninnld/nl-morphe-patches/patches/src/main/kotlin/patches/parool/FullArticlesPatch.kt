package patches.parool

import app.morphe.patcher.patch.bytecodePatch

/** A completed suspend success, consumed by the app's existing None state mapping.
 * Empty templates prevent both blocked-content and whole-body inline replacement. */
internal val emptyMarketingTemplates = bytecodePatch {
    dependsOn(originalInput)
    execute {
        change("Lnl/persgroep/edition/temptation/data/repository/MarketingTemplatesRouter;", "resolveTemplate(Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplatesConfiguration;Ljava/util/List;Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplateContentMetaData;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            new-instance v1, Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplateResolveResult;
            const/4 v2, 0x0
            invoke-direct {v1, v2, v0}, Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplateResolveResult;-><init>(ZLjava/util/List;)V
            new-instance v0, Lnl/persgroep/domain/base/ResultOf${'$'}Success;
            invoke-direct {v0, v1}, Lnl/persgroep/domain/base/ResultOf${'$'}Success;-><init>(Ljava/lang/Object;)V
            return-object v0
        """)
    }
}

@Suppress("unused")
val readFullArticles = bytecodePatch(name = "Read full articles", description = "Renders all editorial body components received from the article API using the normal successful empty marketing-template result, without changing account or purchase entitlements.") {
    dependsOn(originalInput)
    compatibleWith(parool)
    dependsOn(emptyMarketingTemplates)
}
