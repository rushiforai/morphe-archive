package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val cleanMePagePatch = bytecodePatch(
    name = "Clean Me page",
    description = "Hide creator center section and selected menus (campaign, FAQs, feedback) on the Me profile page.",
) {
    category("Layout")
    compatibleWith(COMPATIBILITY_BSTATION)

    val hideCreatorCenter = booleanOption(
        key = "hideCreatorCenter",
        default = false,
        title = "Hide Creator Center",
        description = "Hides the Creator Center dashboard card and banner buttons.",
    )

    val hideCampaignMenu = booleanOption(
        key = "hideCampaignMenu",
        default = false,
        title = "Hide Campaign menu",
        description = "Hides promotional/campaign menus.",
    )

    val hideFaqMenu = booleanOption(
        key = "hideFaqMenu",
        default = false,
        title = "Hide FAQs menu",
        description = "Hides Help & FAQs menus.",
    )

    val hideFeedbackMenu = booleanOption(
        key = "hideFeedbackMenu",
        default = false,
        title = "Hide Feedback menu",
        description = "Hides Feedback and report menus.",
    )

    execute {
        val hideCreator = hideCreatorCenter.value == true
        val hideCampaign = hideCampaignMenu.value == true
        val hideFaq = hideFaqMenu.value == true
        val hideFeedback = hideFeedbackMenu.value == true

        if (!hideCreator && !hideCampaign && !hideFaq && !hideFeedback) return@execute

        val method = UserCenterInfoFingerprint.method
        val classDef = UserCenterInfoFingerprint.classDef

        val creatorCheckSmali = if (hideCreator) {
            """
                iget-object v7, v1, Ltv/danmaku/bili/ui/main2/api/AccountMineV2${'$'}Module;->style:Ljava/lang/String;
                if-eqz v7, :after_creator_check

                const-string v8, "creator_center"
                invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v8
                if-nez v8, :remove_module

                const-string v8, "creator_center_button"
                invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v8
                if-nez v8, :remove_module

                const-string v8, "banner_button"
                invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v8
                if-nez v8, :remove_module

                goto :after_creator_check

                :remove_module
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :modules_loop

                :after_creator_check
            """.trimIndent()
        } else {
            ""
        }

        val creatorItemFilterSmali = if (hideCreator) {
            """
                # Creator center item filter
                if-eqz v4, :creator_item_check_uri
                const-string v7, "creator"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :creator_item_check_uri
                if-eqz v5, :creator_item_done
                const-string v7, "creator"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :creator_item_done
            """.trimIndent()
        } else {
            ""
        }

        val hasItemFilters = hideCreator || hideCampaign || hideFaq || hideFeedback

        val campaignFilterSmali = if (hideCampaign) {
            """
                # Campaign filter
                if-eqz v4, :campaign_check_uri
                const-string v7, "campaign"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "activity"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :campaign_check_uri
                if-eqz v5, :campaign_check_title
                const-string v7, "campaign"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "operation"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :campaign_check_title
                if-eqz v6, :campaign_done
                const-string v7, "Campaign"
                invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "Acara"
                invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :campaign_done
            """.trimIndent()
        } else {
            ""
        }

        val faqFilterSmali = if (hideFaq) {
            """
                # FAQ filter
                if-eqz v4, :faq_check_uri
                const-string v7, "faq"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "help"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :faq_check_uri
                if-eqz v5, :faq_check_title
                const-string v7, "faq"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "help"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :faq_check_title
                if-eqz v6, :faq_done
                const-string v7, "FAQ"
                invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "Help"
                invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "Bantuan"
                invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :faq_done
            """.trimIndent()
        } else {
            ""
        }

        val feedbackFilterSmali = if (hideFeedback) {
            """
                # Feedback filter
                if-eqz v4, :feedback_check_uri
                const-string v7, "feedback"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "report"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :feedback_check_uri
                if-eqz v5, :feedback_check_title
                const-string v7, "feedback"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "report"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :feedback_check_title
                if-eqz v6, :feedback_done
                const-string v7, "Feedback"
                invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                const-string v7, "Umpan Balik"
                invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :remove_item

                :feedback_done
            """.trimIndent()
        } else {
            ""
        }

        val itemsProcessingSmali = if (hasItemFilters) {
            """
                iget-object v2, v1, Ltv/danmaku/bili/ui/main2/api/AccountMineV2${'$'}Module;->items:Ljava/util/List;
                if-eqz v2, :modules_loop

                invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v2

                :items_loop
                invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
                move-result v7
                if-eqz v7, :modules_loop

                invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v3
                if-eqz v3, :items_loop

                check-cast v3, Ltv/danmaku/bili/ui/main2/api/AccountMineV2${'$'}Item;

                invoke-virtual {v3}, Ltv/danmaku/bili/ui/main2/api/AccountMineV2${'$'}Item;->getType()Ljava/lang/String;
                move-result-object v4

                iget-object v5, v3, Ltv/danmaku/bili/ui/main2/api/AccountMineV2${'$'}Item;->uri:Ljava/lang/String;

                iget-object v6, v3, Ltv/danmaku/bili/ui/main2/api/AccountMineV2${'$'}Item;->title:Ljava/lang/String;

                # Guard check: type
                if-eqz v4, :guard_check_uri

                const-string v7, "history"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "download"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "favorite"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "setting"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "preference"
                invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                :guard_check_uri
                # Guard check: uri
                if-eqz v5, :filter_checks

                const-string v7, "history"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "download"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "favorite"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "preference"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                const-string v7, "setting"
                invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v8
                if-nez v8, :items_loop

                :filter_checks
                $creatorItemFilterSmali
                $campaignFilterSmali
                $faqFilterSmali
                $feedbackFilterSmali

                goto :items_loop

                :remove_item
                invoke-interface {v2}, Ljava/util/Iterator;->remove()V
                goto :items_loop
            """.trimIndent()
        } else {
            "goto :modules_loop"
        }

        val filterBody = """
            if-eqz p0, :done

            iget-object v0, p0, Ltv/danmaku/bili/ui/main2/api/AccountMineV2;->modules:Ljava/util/List;
            if-eqz v0, :done

            invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v0

            :modules_loop
            invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
            move-result v1
            if-eqz v1, :done

            invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v1
            if-eqz v1, :modules_loop

            check-cast v1, Ltv/danmaku/bili/ui/main2/api/AccountMineV2${'$'}Module;

            $creatorCheckSmali

            $itemsProcessingSmali

            :done
            return-object p0
        """.trimIndent()

        val filterMethod = MutableMethod(
            ImmutableMethod(
                classDef.type,
                "filterMineData",
                listOf(ImmutableMethodParameter("Ltv/danmaku/bili/ui/main2/api/AccountMineV2;", emptySet(), null)),
                "Ltv/danmaku/bili/ui/main2/api/AccountMineV2;",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                MutableMethodImplementation(10),
            ),
        )
        filterMethod.addInstructions(0, filterBody)
        classDef.methods.add(filterMethod)

        method.addInstructions(
            0,
            """
                invoke-static {p1}, ${classDef.type}->filterMineData(Ltv/danmaku/bili/ui/main2/api/AccountMineV2;)Ltv/danmaku/bili/ui/main2/api/AccountMineV2;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
