package patches.ed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/** Filter concrete commercial DTOs before raw and normalized field assignment.
 * Input lists are never mutated; editorial child objects retain identity/order. */
internal val contentFilters = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val cls = exact(FILTER, "<init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V").classDef
        check(cls.methods.none { it.name.startsWith("morphe") }) { "ED filters already installed" }
        cls.methods.add(helper("morpheAds", "Z", emptyList(), 1, FALSE))
        cls.methods.add(helper("morphePremium", "Z", emptyList(), 1, FALSE))
        addVacancyWidgetFilter(cls)
        cls.methods.add(helper("morpheFilter", "Ljava/util/List;", listOf("Ljava/util/List;"), 4, """
            if-eqz p0, :null_list
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v1
            :loop
            invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done
            invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            invoke-static {v2}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v2
            if-eqz v2, :loop
            invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
            goto :loop
            :done
            return-object v0
            :null_list
            return-object p0
        """))
        cls.methods.add(helper("morphePrimary", "Lcom/popular/core/model/data/ArticleItem;", listOf("Lcom/popular/core/model/data/ArticleItem;", "Ljava/util/List;", "Ljava/util/List;"), 2, """
            invoke-static {p0}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            if-nez v0, :unchanged
            const/4 v1, 0x0
            if-eqz p1, :second
            invoke-interface {p1}, Ljava/util/List;->isEmpty()Z
            move-result v0
            if-nez v0, :second
            invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lcom/popular/core/model/data/ArticleItem;
            return-object v0
            :second
            if-eqz p2, :empty
            invoke-interface {p2}, Ljava/util/List;->isEmpty()Z
            move-result v0
            if-nez v0, :empty
            invoke-interface {p2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lcom/popular/core/model/data/ArticleItem;
            return-object v0
            :empty
            const/4 v0, 0x0
            return-object v0
            :unchanged
            return-object p0
        """))
        cls.methods.add(helper("morpheNormalize", "Ljava/lang/Object;", listOf("Ljava/lang/Object;"), 2, """
            if-eqz p0, :keep
            invoke-static {}, $FILTER->morpheAds()Z
            move-result v0
            if-eqz v0, :premium
            instance-of v0, p0, ${MODEL}Advertisement;
            if-nez v0, :drop
            instance-of v0, p0, ${MODEL}AdvertisementPack;
            if-nez v0, :drop
            instance-of v0, p0, ${MODEL}CrossPromotionAdvertisementComponent;
            if-nez v0, :drop
            instance-of v0, p0, ${MODEL}HtmlEmbedDataTeaser;
            if-eqz v0, :afterVacancyWidget
            move-object v0, p0
            check-cast v0, ${MODEL}HtmlEmbedDataTeaser;
            iget-object v1, v0, ${MODEL}HtmlEmbedDataTeaser;->d:Ljava/lang/String;
            invoke-static {v1}, $FILTER->morpheVacancyHtml(Ljava/lang/String;)Z
            move-result v1
            if-nez v1, :drop
            iget-object v0, v0, ${MODEL}HtmlEmbedDataTeaser;->e:Ljava/lang/String;
            invoke-static {v0}, $FILTER->morpheVacancyHtml(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :drop
            :afterVacancyWidget
            instance-of v0, p0, Lcom/popular/core/model/data/ArticleItem;
            if-eqz v0, :next10
            move-object v0, p0
            check-cast v0, Lcom/popular/core/model/data/ArticleItem;
            invoke-virtual {v0}, Lcom/popular/core/model/data/ArticleItem;->isAdvertorial()Z
            move-result v0
            if-nez v0, :drop
            :next10
            instance-of v0, p0, Lcom/popular/core/model/data/TeaserItem;
            if-eqz v0, :next18
            move-object v0, p0
            check-cast v0, Lcom/popular/core/model/data/TeaserItem;
            invoke-virtual {v0}, Lcom/popular/core/model/data/TeaserItem;->isAdvertorial()Z
            move-result v0
            if-nez v0, :drop
            :next18
            instance-of v0, p0, ${MODEL}ArticleTeaserComponent;
            if-eqz v0, :next26
            move-object v0, p0
            check-cast v0, ${MODEL}ArticleTeaserComponent;
            iget-object v0, v0, ${MODEL}ArticleTeaserComponent;->b:${MODEL}ArticleTeaserComponent${'$'}Properties;
            if-eqz v0, :keep
            iget-boolean v0, v0, ${MODEL}ArticleTeaserComponent${'$'}Properties;->j:Z
            if-nez v0, :drop
            :next26
            instance-of v0, p0, ${MODEL}UrlTeaserComponent;
            if-eqz v0, :next35
            move-object v0, p0
            check-cast v0, ${MODEL}UrlTeaserComponent;
            iget-object v0, v0, ${MODEL}UrlTeaserComponent;->d:${MODEL}UrlTeaserComponent${'$'}Properties;
            if-eqz v0, :keep
            iget-boolean v0, v0, ${MODEL}UrlTeaserComponent${'$'}Properties;->h:Z
            if-nez v0, :drop
            :next35
            instance-of v0, p0, ${MODEL}EditorialTips${'$'}Tip;
            if-eqz v0, :nexttip
            move-object v0, p0
            check-cast v0, ${MODEL}EditorialTips${'$'}Tip;
            iget-boolean v0, v0, ${MODEL}EditorialTips${'$'}Tip;->n:Z
            if-nez v0, :drop
            :nexttip
            instance-of v0, p0, ${MODEL}CompactTeaser;
            if-eqz v0, :next51
            move-object v0, p0
            check-cast v0, ${MODEL}CompactTeaser;
            iget-object v0, v0, ${MODEL}CompactTeaser;->b:Lcom/popular/core/model/data/ArticleItem;
            if-eqz v0, :keep
            invoke-static {v0}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :drop
            :next51
            instance-of v0, p0, ${MODEL}UnoTeaser;
            if-eqz v0, :next61
            move-object v0, p0
            check-cast v0, ${MODEL}UnoTeaser;
            iget-object v0, v0, ${MODEL}UnoTeaser;->b:Lcom/popular/core/model/data/ArticleItem;
            if-eqz v0, :keep
            invoke-static {v0}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :drop
            :next61
            instance-of v0, p0, ${MODEL}LiveBlogTeaser;
            if-eqz v0, :next71
            move-object v0, p0
            check-cast v0, ${MODEL}LiveBlogTeaser;
            iget-object v0, v0, ${MODEL}LiveBlogTeaser;->b:Lcom/popular/core/model/data/ArticleItem;
            if-eqz v0, :keep
            invoke-static {v0}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :drop
            :next71
            instance-of v0, p0, ${MODEL}TickerTeaser;
            if-eqz v0, :next81
            move-object v0, p0
            check-cast v0, ${MODEL}TickerTeaser;
            iget-object v0, v0, ${MODEL}TickerTeaser;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next81
            instance-of v0, p0, ${MODEL}ArticlesCrossPromotion;
            if-eqz v0, :next90
            move-object v0, p0
            check-cast v0, ${MODEL}ArticlesCrossPromotion;
            iget-object v0, v0, ${MODEL}ArticlesCrossPromotion;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next90
            instance-of v0, p0, ${MODEL}ArticlesSectionsRecommendation;
            if-eqz v0, :next99
            move-object v0, p0
            check-cast v0, ${MODEL}ArticlesSectionsRecommendation;
            iget-object v0, v0, ${MODEL}ArticlesSectionsRecommendation;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next99
            instance-of v0, p0, ${MODEL}CarouselTeaser;
            if-eqz v0, :next108
            move-object v0, p0
            check-cast v0, ${MODEL}CarouselTeaser;
            iget-object v0, v0, ${MODEL}CarouselTeaser;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next108
            instance-of v0, p0, ${MODEL}TeaserTopList;
            if-eqz v0, :next117
            move-object v0, p0
            check-cast v0, ${MODEL}TeaserTopList;
            iget-object v0, v0, ${MODEL}TeaserTopList;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next117
            instance-of v0, p0, ${MODEL}RecapTeaser;
            if-eqz v0, :next126
            move-object v0, p0
            check-cast v0, ${MODEL}RecapTeaser;
            iget-object v0, v0, ${MODEL}RecapTeaser;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next126
            instance-of v0, p0, ${MODEL}CollectionsList;
            if-eqz v0, :next135
            move-object v0, p0
            check-cast v0, ${MODEL}CollectionsList;
            iget-object v0, v0, ${MODEL}CollectionsList;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next135
            instance-of v0, p0, ${MODEL}VideoCrossPromotion;
            if-eqz v0, :next144
            move-object v0, p0
            check-cast v0, ${MODEL}VideoCrossPromotion;
            iget-object v0, v0, ${MODEL}VideoCrossPromotion;->b:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next144
            instance-of v0, p0, ${MODEL}PromoBannerTeaser;
            if-eqz v0, :next153
            move-object v0, p0
            check-cast v0, ${MODEL}PromoBannerTeaser;
            iget-object v0, v0, ${MODEL}PromoBannerTeaser;->e:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next153
            instance-of v0, p0, ${MODEL}LocalNewsTeaser;
            if-eqz v0, :next162
            move-object v0, p0
            check-cast v0, ${MODEL}LocalNewsTeaser;
            iget-object v1, v0, ${MODEL}LocalNewsTeaser;->e:Lcom/popular/core/model/data/ArticleItem;
            if-nez v1, :keep
            iget-object v1, v0, ${MODEL}LocalNewsTeaser;->g:Ljava/util/List;
            invoke-static {v1}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v1
            if-eqz v1, :keep
            iget-object v0, v0, ${MODEL}LocalNewsTeaser;->f:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next162
            instance-of v0, p0, ${MODEL}BreakingNewsTeaser;
            if-eqz v0, :next177
            move-object v0, p0
            check-cast v0, ${MODEL}BreakingNewsTeaser;
            iget-object v1, v0, ${MODEL}BreakingNewsTeaser;->b:Lcom/popular/core/model/data/ArticleItem;
            if-nez v1, :keep
            iget-object v0, v0, ${MODEL}BreakingNewsTeaser;->c:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next177
            instance-of v0, p0, ${MODEL}DossierTeaser;
            if-eqz v0, :next188
            move-object v0, p0
            check-cast v0, ${MODEL}DossierTeaser;
            iget-object v1, v0, ${MODEL}DossierTeaser;->b:Lcom/popular/core/model/data/ArticleItem;
            if-nez v1, :keep
            iget-object v0, v0, ${MODEL}DossierTeaser;->c:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next188
            instance-of v0, p0, ${MODEL}VideoCarouselTeaser;
            if-eqz v0, :next199
            move-object v0, p0
            check-cast v0, ${MODEL}VideoCarouselTeaser;
            iget-object v1, v0, ${MODEL}VideoCarouselTeaser;->c:Lcom/popular/core/model/data/ArticleItem;
            if-nez v1, :keep
            iget-object v0, v0, ${MODEL}VideoCarouselTeaser;->d:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next199
            instance-of v0, p0, ${MODEL}MiniCarouselTeaser;
            if-eqz v0, :next210
            move-object v0, p0
            check-cast v0, ${MODEL}MiniCarouselTeaser;
            iget-object v1, v0, ${MODEL}MiniCarouselTeaser;->c:Lcom/popular/core/model/data/ArticleItem;
            if-nez v1, :keep
            iget-object v0, v0, ${MODEL}MiniCarouselTeaser;->d:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next210
            :premium
            invoke-static {}, $FILTER->morphePremium()Z
            move-result v0
            if-eqz v0, :groups
            instance-of v0, p0, ${MODEL}PremiumLabelComponent;
            if-nez v0, :drop
            instance-of v0, p0, ${MODEL}PremiumIndicatorComponent;
            if-nez v0, :drop
            instance-of v0, p0, ${MODEL}MarketingComponent;
            if-nez v0, :drop
            instance-of v0, p0, ${MODEL}MarketingPositionTeaser;
            if-nez v0, :drop
            :groups
            instance-of v0, p0, ${MODEL}GroupComponent;
            if-eqz v0, :next230
            move-object v0, p0
            check-cast v0, ${MODEL}GroupComponent;
            iget-object v0, v0, ${MODEL}GroupComponent;->d:${MODEL}GroupComponent${'$'}Properties;
            if-eqz v0, :keep
            iget-object v0, v0, ${MODEL}GroupComponent${'$'}Properties;->a:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next230
            instance-of v0, p0, ${MODEL}ListComponent;
            if-eqz v0, :next241
            move-object v0, p0
            check-cast v0, ${MODEL}ListComponent;
            iget-object v0, v0, ${MODEL}ListComponent;->d:${MODEL}ListComponent${'$'}Properties;
            if-eqz v0, :keep
            iget-object v0, v0, ${MODEL}ListComponent${'$'}Properties;->a:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next241
            instance-of v0, p0, ${MODEL}VideoNewsComponent;
            if-eqz v0, :next252
            move-object v0, p0
            check-cast v0, ${MODEL}VideoNewsComponent;
            iget-object v0, v0, ${MODEL}VideoNewsComponent;->d:${MODEL}VideoNewsComponent${'$'}Properties;
            if-eqz v0, :keep
            iget-object v0, v0, ${MODEL}VideoNewsComponent${'$'}Properties;->a:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next252
            instance-of v0, p0, ${MODEL}EditorialTips;
            if-eqz v0, :next263
            move-object v0, p0
            check-cast v0, ${MODEL}EditorialTips;
            iget-object v0, v0, ${MODEL}EditorialTips;->d:${MODEL}EditorialTips${'$'}Properties;
            if-eqz v0, :keep
            iget-object v0, v0, ${MODEL}EditorialTips${'$'}Properties;->a:Ljava/util/List;
            invoke-static {v0}, $FILTER->morpheEmpty(Ljava/util/List;)Z
            move-result v0
            if-nez v0, :drop
            :next263
            instance-of v0, p0, ${MODEL}MediaTopComponent;
            if-eqz v0, :fallback
            move-object v0, p0
            check-cast v0, ${MODEL}MediaTopComponent;
            iget-object v0, v0, ${MODEL}MediaTopComponent;->d:${MODEL}MediaTopComponent${'$'}Properties;
            iget-object v1, v0, ${MODEL}MediaTopComponent${'$'}Properties;->a:${MODEL}ArticleComponent;
            invoke-static {v1}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v1
            if-nez v1, :keep
            iget-object v0, v0, ${MODEL}MediaTopComponent${'$'}Properties;->b:${MODEL}ArticleComponent;
            invoke-static {v0}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
            :fallback
            instance-of v0, p0, ${MODEL}MediaOverlayComponent;
            if-eqz v0, :fallback_content
            move-object v0, p0
            check-cast v0, ${MODEL}MediaOverlayComponent;
            invoke-static {v0}, $FILTER->morpheOverlay(${MODEL}MediaOverlayComponent;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
            :fallback_content
            instance-of v0, p0, ${MODEL}FallbackComponent;
            if-eqz v0, :keep
            move-object v0, p0
            check-cast v0, ${MODEL}FallbackComponent;
            iget-object v0, v0, ${MODEL}FallbackComponent;->d:${MODEL}FallbackComponent${'$'}Properties;
            if-eqz v0, :keep
            iget-object v0, v0, ${MODEL}FallbackComponent${'$'}Properties;->b:${MODEL}ArticleComponent;
            if-eqz v0, :keep
            invoke-static {v0}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :drop
            :keep
            return-object p0
            :drop
            const/4 v0, 0x0
            return-object v0
        """))
        // Preserve an originally empty editorial overlay. Rebuild only when a
        // real nested commercial/marker child was removed, retaining its id and
        // every surviving editorial child object. InlineArticle is always kept:
        // its author/date/read-more navigation exists independently of its body.
        cls.methods.add(helper("morpheOverlay", "Ljava/lang/Object;", listOf("${MODEL}MediaOverlayComponent;"), 6, """
            iget-object v0, p0, ${MODEL}MediaOverlayComponent;->d:${MODEL}MediaOverlayComponent${'$'}Properties;
            iget-object v1, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->a:${MODEL}ArticleComponent;
            iget-object v2, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->b:${MODEL}ArticleComponent;
            iget-object v3, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->c:${MODEL}ArticleComponent;
            iget-object v4, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->d:${MODEL}ArticleComponent;
            if-nez v1, :filter
            if-nez v2, :filter
            if-nez v3, :filter
            if-nez v4, :filter
            return-object p0
            :filter
            invoke-static {v1}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v1
            check-cast v1, ${MODEL}ArticleComponent;
            invoke-static {v2}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v2
            check-cast v2, ${MODEL}ArticleComponent;
            invoke-static {v3}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v3
            check-cast v3, ${MODEL}ArticleComponent;
            invoke-static {v4}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v4
            check-cast v4, ${MODEL}ArticleComponent;
            if-nez v1, :compare
            if-nez v2, :compare
            if-nez v3, :compare
            if-nez v4, :compare
            const/4 v0, 0x0
            return-object v0
            :compare
            iget-object v5, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->a:${MODEL}ArticleComponent;
            if-ne v1, v5, :rebuild
            iget-object v5, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->b:${MODEL}ArticleComponent;
            if-ne v2, v5, :rebuild
            iget-object v5, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->c:${MODEL}ArticleComponent;
            if-ne v3, v5, :rebuild
            iget-object v5, v0, ${MODEL}MediaOverlayComponent${'$'}Properties;->d:${MODEL}ArticleComponent;
            if-ne v4, v5, :rebuild
            return-object p0
            :rebuild
            new-instance v5, ${MODEL}MediaOverlayComponent${'$'}Properties;
            invoke-direct {v5, v1, v2, v3, v4}, ${MODEL}MediaOverlayComponent${'$'}Properties;-><init>(${MODEL}ArticleComponent;${MODEL}ArticleComponent;${MODEL}ArticleComponent;${MODEL}ArticleComponent;)V
            new-instance v0, ${MODEL}MediaOverlayComponent;
            iget-object v1, p0, ${MODEL}MediaOverlayComponent;->c:Ljava/lang/String;
            invoke-direct {v0, v1, v5}, ${MODEL}MediaOverlayComponent;-><init>(Ljava/lang/String;${MODEL}MediaOverlayComponent${'$'}Properties;)V
            return-object v0
        """))
        cls.methods.add(helper("morpheSingle", "${MODEL}ArticleComponent;", listOf("${MODEL}ArticleComponent;"), 1, """
            invoke-static {p0}, $FILTER->morpheNormalize(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, ${MODEL}ArticleComponent;
            return-object v0
        """))
        cls.methods.add(helper("morpheEmpty", "Z", listOf("Ljava/util/List;"), 1, """
            if-eqz p0, :empty
            invoke-interface {p0}, Ljava/util/List;->isEmpty()Z
            move-result v0
            return v0
            :empty
            const/4 v0, 0x1
            return v0
        """))
        cls.methods.add(helper("morpheArticleComponents", "Ljava/util/List;", listOf("Ljava/util/List;", "${MODEL}Metadata;"), 2, """
            invoke-static {}, $FILTER->morpheAds()Z
            move-result v0
            if-eqz v0, :editorial
            if-eqz p1, :editorial
            iget-object v0, p1, ${MODEL}Metadata;->d:Ljava/lang/String;
            const-string v1, "ADVERTORIAL"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :editorial
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            return-object v0
            :editorial
            invoke-static {p0}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object v0
            return-object v0
        """))
        change("${MODEL}SectionResponse;", "<init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}ArticleDetailResponse;", "<init>(Ljava/util/List;Lcom/kubus/module/network/model/Presentation;Lcom/kubus/module/network/model/Metadata;)V", """
            invoke-static {p1, p3}, $FILTER->morpheArticleComponents(Ljava/util/List;${MODEL}Metadata;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}GroupComponent\$Properties;", "<init>(Ljava/util/List;Ljava/lang/Boolean;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}ListComponent\$Properties;", "<init>(Ljava/util/List;Ljava/lang/String;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}VideoNewsComponent\$Properties;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}InlineArticleComponent\$Content;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}Moment;", "<init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", """
            invoke-static/range {p7 .. p7}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p7
        """)
        change("${MODEL}EditorialTips\$Properties;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}CrossPromotionTeasersResponse;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}TickerTeaser;", "<init>(Ljava/util/List;Lcom/kubus/module/network/model/TickerAction;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}ArticlesCrossPromotion;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}ArticlesSectionsRecommendation;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}CarouselTeaser;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}TeaserTopList;", "<init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/kubus/module/network/model/TeaserListAction;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}RecapTeaser;", "<init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/kubus/module/network/model/TeaserListAction;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}CollectionsList;", "<init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/kubus/module/network/model/CollectionsAction;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}VideoCrossPromotion;", "<init>(Ljava/util/List;)V", """
            invoke-static/range {p1 .. p1}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        change("${MODEL}PromoBannerTeaser;", "<init>(Ljava/lang/String;Ljava/lang/String;Lcom/popular/core/model/data/PromoBannerAction;Ljava/util/List;)V", """
            invoke-static/range {p4 .. p4}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p4
        """)
        change("${MODEL}RegionPromotionTeaser;", "<init>(Lpge;Ljava/util/List;Lcom/popular/core/model/data/Title;Lcom/popular/core/model/data/Button;)V", """
            invoke-static/range {p2 .. p2}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p2
        """)
        change("${MODEL}LocalNewsTeaser;", "<init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/util/List;)V", """
            invoke-static/range {p5 .. p5}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p5
            invoke-static/range {p6 .. p6}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p6
            invoke-static {p4, p5, p6}, $FILTER->morphePrimary(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/util/List;)Lcom/popular/core/model/data/ArticleItem;
            move-result-object p4
        """)
        change("${MODEL}BreakingNewsTeaser;", "<init>(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V", """
            invoke-static/range {p2 .. p2}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p2
            invoke-static {p1, p2, p2}, $FILTER->morphePrimary(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/util/List;)Lcom/popular/core/model/data/ArticleItem;
            move-result-object p1
        """)
        change("${MODEL}DossierTeaser;", "<init>(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V", """
            invoke-static/range {p2 .. p2}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p2
            invoke-static {p1, p2, p2}, $FILTER->morphePrimary(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/util/List;)Lcom/popular/core/model/data/ArticleItem;
            move-result-object p1
        """)
        change("${MODEL}VideoCarouselTeaser;", "<init>(Lcom/popular/core/model/data/Header;Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Lcom/popular/core/model/data/VideoTeaserAction;)V", """
            invoke-static/range {p3 .. p3}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p3
            invoke-static {p2, p3, p3}, $FILTER->morphePrimary(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/util/List;)Lcom/popular/core/model/data/ArticleItem;
            move-result-object p2
        """)
        change("${MODEL}MiniCarouselTeaser;", "<init>(Lcom/popular/core/model/data/Header;Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;)V", """
            invoke-static/range {p3 .. p3}, $FILTER->morpheFilter(Ljava/util/List;)Ljava/util/List;
            move-result-object p3
            invoke-static {p2, p3, p3}, $FILTER->morphePrimary(Lcom/popular/core/model/data/ArticleItem;Ljava/util/List;Ljava/util/List;)Lcom/popular/core/model/data/ArticleItem;
            move-result-object p2
        """)
        change("${MODEL}MediaTopComponent\$Properties;", "<init>(Lcom/kubus/module/network/model/ArticleComponent;Lcom/kubus/module/network/model/ArticleComponent;)V", """
            invoke-static/range {p2 .. p2}, $FILTER->morpheSingle(${MODEL}ArticleComponent;)${MODEL}ArticleComponent;
            move-result-object p2
        """)
    }
}
