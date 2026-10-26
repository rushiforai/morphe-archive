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
val hideHomeTabBarItemsPatch = bytecodePatch(
    name = "Hide home tab bar items",
    description = "Hide selected horizontal tab bar items on the home screen (Featured, Plaza, Subscriptions, Anime, Shorts, Community, Campaigns).",
) {
    category("Layout")
    compatibleWith(COMPATIBILITY_BSTATION)

    val hideFeaturedTab = booleanOption(
        key = "hideFeaturedTab",
        default = false,
        title = "Hide Featured tab",
        description = "Hides the Featured / For You tab from the home tab bar.",
    )

    val hidePlazaTab = booleanOption(
        key = "hidePlazaTab",
        default = false,
        title = "Hide Plaza tab",
        description = "Hides the Plaza / Channel tab from the home tab bar.",
    )

    val hideCampaignTabs = booleanOption(
        key = "hideCampaignTabs",
        default = false,
        title = "Hide Campaign and Activity tabs",
        description = "Hides promotional, event, and activity tabs (e.g. Dapatkan Itabag, Gratis Sementara, limited-time events).",
    )

    val hideSubscriptionsTab = booleanOption(
        key = "hideSubscriptionsTab",
        default = false,
        title = "Hide Subscriptions tab",
        description = "Hides the Subscriptions tab from the home tab bar.",
    )

    val hideAnimeTab = booleanOption(
        key = "hideAnimeTab",
        default = false,
        title = "Hide Anime tab",
        description = "Hides the Anime tab from the home tab bar.",
    )

    val hideShortsTab = booleanOption(
        key = "hideShortsTab",
        default = false,
        title = "Hide Shorts tab",
        description = "Hides the Shorts tab from the home tab bar.",
    )

    val hideOpusTab = booleanOption(
        key = "hideOpusTab",
        default = false,
        title = "Hide Community (Opus) tab",
        description = "Hides the Community (Opus) tab from the home tab bar.",
    )

    execute {
        val uriPatterns = buildList {
            if (hideFeaturedTab.value == true) {
                add("pegasus/promo")
            }
            if (hidePlazaTab.value == true) {
                add("pegasus/channel")
                add("plaza")
            }
            if (hideCampaignTabs.value == true) {
                add("activity")
                add("operation")
            }
            if (hideSubscriptionsTab.value == true) {
                add("main/subscriptions")
            }
            if (hideAnimeTab.value == true) {
                add("anime/cartoon")
            }
            if (hideShortsTab.value == true) {
                add("anime/shorts")
            }
            if (hideOpusTab.value == true) {
                add("main/opus")
            }
        }

        val namePatterns = buildList {
            if (hideFeaturedTab.value == true) {
                add("Featured")
                add("For You")
                add("Untuk Anda")
            }
            if (hidePlazaTab.value == true) {
                add("Plaza")
                add("plaza")
            }
            if (hideCampaignTabs.value == true) {
                add("Itabag")
                add("itabag")
                add("Gratis")
                add("gratis")
                add("Sementara")
                add("sementara")
            }
            if (hideSubscriptionsTab.value == true) {
                add("Subscriptions")
                add("Langganan")
            }
            if (hideAnimeTab.value == true) {
                add("Anime")
            }
            if (hideShortsTab.value == true) {
                add("Shorts")
            }
            if (hideOpusTab.value == true) {
                add("Opus")
            }
        }

        if (uriPatterns.isEmpty() && namePatterns.isEmpty()) return@execute

        val method = HomeNavigationInfoFingerprint.method
        val classDef = HomeNavigationInfoFingerprint.classDef

        val uriCheckBranches = uriPatterns.joinToString("\n") { pattern ->
            """
                const-string v4, "$pattern"
                invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v5
                if-nez v5, :remove_item
            """.trimIndent()
        }

        val nameCheckBranches = namePatterns.joinToString("\n") { pattern ->
            """
                const-string v4, "$pattern"
                invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v5
                if-nez v5, :remove_item
            """.trimIndent()
        }

        val filterBody = """
            if-eqz p0, :cond_done

            invoke-interface {p0}, Ljava/util/List;->size()I
            move-result v0
            const/4 v1, 0x1
            if-le v0, v1, :cond_done

            invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v0

            :loop_start
            invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
            move-result v1
            if-eqz v1, :cond_done

            invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v1
            if-eqz v1, :loop_start

            instance-of v2, v1, Lnf1/f;
            if-eqz v2, :loop_start

            check-cast v1, Lnf1/f;
            iget-object v2, v1, Lnf1/f;->c:Ljava/lang/String;
            iget-object v3, v1, Lnf1/f;->b:Ljava/lang/String;

            if-eqz v2, :check_name
            $uriCheckBranches

            :check_name
            if-eqz v3, :loop_start
            $nameCheckBranches

            goto :loop_start

            :remove_item
            invoke-interface {p0}, Ljava/util/List;->size()I
            move-result v6
            const/4 v5, 0x1
            if-le v6, v5, :cond_done

            invoke-interface {v0}, Ljava/util/Iterator;->remove()V
            goto :loop_start

            :cond_done
            return-object p0
        """.trimIndent()

        val filterMethod = MutableMethod(
            ImmutableMethod(
                classDef.type,
                "filterHomeTabs",
                listOf(ImmutableMethodParameter("Ljava/util/List;", emptySet(), null)),
                "Ljava/util/List;",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                emptySet(),
                emptySet(),
                MutableMethodImplementation(8),
            ),
        )
        filterMethod.addInstructions(0, filterBody)
        classDef.methods.add(filterMethod)

        method.addInstructions(
            0,
            """
                invoke-static {p1}, ${classDef.type}->filterHomeTabs(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """.trimIndent(),
        )
    }
}

