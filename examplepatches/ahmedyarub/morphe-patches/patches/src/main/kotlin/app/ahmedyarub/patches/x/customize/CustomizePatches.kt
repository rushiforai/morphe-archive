package app.ahmedyarub.patches.x.customize

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.resources.ResourceType
import app.morphe.patches.all.misc.resources.getResourceId
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.stringsOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// region Inline action bar

/** The action bar presenter, which copies a post's actions into the bar's state. */
private object InlineActionBarPresenterFingerprint : Fingerprint(
    parameters = listOf("Landroidx/compose/runtime/Composer;"),
    strings = listOf("android_font_engagement_bar_content_scaling_enabled"),
)

@Suppress("unused")
val customizeInlineActionBarPatch = bytecodePatch(
    name = "Customize Inline action Bar items",
    description = "Hides actions from the bar under each post.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden = hideOptions(
        linkedMapOf(
            "reply" to "reply",
            "retweet" to "repost",
            "like" to "like",
            "views" to "views (or dislike, where it replaces views)",
            "bookmark" to "bookmark",
            "share" to "share",
        ),
    )

    execute {
        hidden.writeHidden(CustomiseSetting("inlineActionBarHidden"))

        // The entries are gathered into an ArrayList, then made immutable in one call taking an
        // Iterable. They are filtered just before it. The timeline, the focal post, the media
        // viewer and DM previews all derive their bar from this state.
        InlineActionBarPresenterFingerprint.method.apply {
            val toImmutable = instructions.first { instruction ->
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    instruction.getReference<MethodReference>()?.parameterTypes?.map { it.toString() } == listOf("Ljava/lang/Iterable;")
            }
            val list = (toImmutable as FiveRegisterInstruction).registerC

            addInstructions(
                toImmutable.location.index,
                "invoke-static/range { v$list .. v$list }, $CUSTOMISE_CLASS->inlineActionBar(Ljava/util/List;)V",
            )
        }
    }
}

// endregion

// region Navigation bar

/** The main landing screen's badge state, built with one entry per bottom bar tab. */
private object LandingTabsFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("android_webview_grok_tab_enabled"),
    custom = { method, _ ->
        method.parameterTypes.size == 5 && method.implementation?.instructions?.any {
            it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == "Ljava/util/LinkedHashMap;"
        } == true
    },
)

@Suppress("unused")
val customizeNavigationBarPatch = bytecodePatch(
    name = "Customize Navigation Bar items",
    description = "Hides tabs from the bottom navigation bar. Home always stays.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden = hideOptions(
        linkedMapOf(
            "explore" to "Explore",
            "grok" to "Grok",
            "notifications" to "Notifications",
            "dm" to "Messages",
        ),
    )

    execute {
        hidden.writeHidden(CustomiseSetting("navBarHidden"))

        // The tabs are filtered into a list, then a map sized for it is created, then the list is
        // iterated to fill the map. The list is filtered when that iteration starts: the map's
        // creation is the loop exit, a branch target, and code added there would be skipped.
        LandingTabsFingerprint.method.apply {
            val mapCreated = instructions.first { instruction ->
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    instruction.getReference<MethodReference>()?.let { it.definingClass == "Ljava/util/LinkedHashMap;" && it.name == "<init>" } == true
            }.location.index
            val iteration = instructions.first { instruction ->
                instruction.location.index > mapCreated &&
                    instruction.getReference<MethodReference>()?.name == "iterator"
            }
            val tabs = (iteration as FiveRegisterInstruction).registerC

            addInstructions(
                iteration.location.index,
                "invoke-static/range { v$tabs .. v$tabs }, $CUSTOMISE_CLASS->navBar(Ljava/util/List;)V",
            )
        }
    }
}

// endregion

// region Reply sorting

/** Opens a post's conversation, creating its repository with the default sort. */
private object ConversationOpenFingerprint : Fingerprint(
    name = "invokeSuspend",
    strings = listOf("changeReplySorting"),
)

@Suppress("unused")
val customizeReplySortingPatch = bytecodePatch(
    name = "Customize default reply sorting",
    description = "Sets the sort replies open with.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val sort by stringOption(
        key = "replySort",
        default = "Relevance",
        values = mapOf("Relevance" to "Relevance", "Recent" to "Recency", "Likes" to "Likes"),
        title = "Default sort",
        required = true,
    )

    execute {
        CustomiseSetting("replySortChoice").method.returnEarly(sort!!)

        // The conversation repository takes the post id and then the sort.
        val repository = ConversationOpenFingerprint.method.instructions.firstNotNullOfOrNull { instruction ->
            instruction.getReference<MethodReference>()?.takeIf { reference ->
                reference.name == "<init>" && reference.parameterTypes.size == 6 && reference.parameterTypes[2] == "J"
            }
        } ?: throw PatchException("The conversation is not opened with a repository taking the post id")
        val sortType = repository.parameterTypes[3].toString()

        mutableClassDefBy(repository.definingClass).methods.first {
            it.name == "<init>" && it.parameterTypes == repository.parameterTypes
        }.apply {
            // p0 is the receiver; the long post id takes two registers.
            val sortRegister = "p5"

            addInstructions(
                0,
                """
                invoke-static/range { $sortRegister .. $sortRegister }, $CUSTOMISE_CLASS->replySort(Ljava/lang/Enum;)Ljava/lang/Enum;
                move-result-object $sortRegister
                check-cast $sortRegister, $sortType
                """,
            )
        }
    }
}

// endregion

// region Explore tabs

private object UrpPageFragmentToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("UrpPageFragment(page_body="),
)

@Suppress("unused")
val customizeExploreTabsPatch = bytecodePatch(
    name = "Customize explore tabs",
    description = "Hides tabs from the Explore page.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden by stringsOption(
        key = "hiddenExploreTabs",
        default = emptyList(),
        title = "Hidden tabs",
        description = "The ids of the tabs to hide, e.g. trending, news, sports, entertainment. The server names them, " +
            "so they are matched without regard to case, hyphens or underscores.",
    )

    execute {
        CustomiseSetting("exploreTabsHidden").method.returnEarly(
            hidden.orEmpty().map { it.lowercase().replace("_", "").replace("-", "").trim() }.filter { it.isNotEmpty() }.joinToString(","),
        )

        // The server sends the page; one mapper turns its segmented timelines into tabs.
        val pageType = UrpPageFragmentToStringFingerprint.classDef.type
        val mapper = classDefBy { classDef ->
            classDef.methods.any { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/util/List;" &&
                    method.parameterTypes.map { it.toString() } == listOf(pageType)
            }
        }

        mutableClassDefBy(mapper).methods.single { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/util/List;" &&
                method.parameterTypes.map { it.toString() } == listOf(pageType)
        }.apply {
            // Every return: the tab list's is a loop exit, which a plain insert would not reach.
            instructions.filter { it.opcode == Opcode.RETURN_OBJECT }.map { it.location.index }.sortedDescending().forEach { index ->
                val tabs = getInstruction<OneRegisterInstruction>(index).registerA
                addInstructionsAtControlFlowLabel(
                    index,
                    """
                    invoke-static/range { v$tabs .. v$tabs }, $CUSTOMISE_CLASS->exploreTabs(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$tabs
                    """,
                )
            }
        }
    }
}

// endregion

// region Notification tabs

@Suppress("unused")
val customizeNotificationTabsPatch = bytecodePatch(
    name = "Customize notification tabs",
    description = "Hides tabs from Notifications. At least one tab always stays.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden = hideOptions(
        linkedMapOf("all" to "All", "mentions" to "Mentions", "verified" to "Verified", "priority" to "Priority"),
    )

    execute {
        hidden.writeHidden(CustomiseSetting("notificationTabsHidden"))
        filterArraysOf(ToStringFingerprint("Tab(notificationTabType=").classDef.type, "notificationTabs")
    }
}

// endregion

// region Search suggestions

private object SearchTypeaheadQueryFingerprint : Fingerprint(
    name = "name",
    returnType = "Ljava/lang/String;",
    strings = listOf("SearchTypeahead"),
)

@Suppress("unused")
val customizeSearchSuggestionsPatch = bytecodePatch(
    name = "Customize search suggestions",
    description = "Hides kinds of suggestion from the search box.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden = hideOptions(linkedMapOf("users" to "accounts", "suggestions" to "search suggestions"))

    execute {
        hidden.writeHidden(CustomiseSetting("searchSuggestionsHidden"))

        // The typeahead query is only run by the mapper that turns its results into suggestions.
        val queryType = SearchTypeaheadQueryFingerprint.classDef.type
        val mapper = classDefBy { classDef ->
            classDef.methods.any { method ->
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == queryType
                } == true && method.parameterTypes.lastOrNull()?.toString() == "Lkotlin/coroutines/Continuation;"
            }
        }

        mutableClassDefBy(mapper).methods.single { method ->
            method.implementation?.instructions?.any {
                it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == queryType
            } == true
        }.apply {
            // The suggestions are returned wrapped in a success result: new-instance, then its
            // constructor taking the list, then return.
            val success = instructions.indices.single { index ->
                val constructor = instructions.getOrNull(index + 1)
                instructions[index].opcode == Opcode.NEW_INSTANCE &&
                    constructor?.opcode == Opcode.INVOKE_DIRECT &&
                    constructor.getReference<MethodReference>()?.parameterTypes?.map { it.toString() } == listOf("Ljava/lang/Object;") &&
                    instructions.getOrNull(index + 2)?.opcode == Opcode.RETURN_OBJECT
            }
            val list = getInstruction<FiveRegisterInstruction>(success + 1).registerD

            addInstructions(
                success,
                """
                invoke-static/range { v$list .. v$list }, $CUSTOMISE_CLASS->searchTypeahead(Ljava/util/List;)Ljava/util/List;
                move-result-object v$list
                """,
            )
        }
    }
}

// endregion

// region Search tabs

@Suppress("unused")
val customizeSearchTabsPatch = bytecodePatch(
    name = "Customize search tab items",
    description = "Hides tabs from search results. At least one tab always stays.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden = hideOptions(
        linkedMapOf("top" to "Top", "latest" to "Latest", "people" to "People", "media" to "Media", "lists" to "Lists"),
    )

    execute {
        hidden.writeHidden(CustomiseSetting("searchTabsHidden"))
        filterArraysOf(ToStringFingerprint("SearchTab(searchType=").classDef.type, "searchTabs")
    }
}

// endregion

// region Side bar

private object DrawerFingerprint : Fingerprint(strings = listOf("DrawerDiscountPillAlpha"))

/** The side bar rows, keyed by option, with the string resources their titles come from. */
private val SIDE_BAR_ROWS = linkedMapOf(
    "premium" to listOf("settings_subscription_title", "settings_subscription_premium_plus_title", "drawer_subscription_title"),
    "money" to listOf("drawer_money_title"),
    "communities" to listOf("drawer_communities_title"),
    "sports" to listOf("drawer_sports_title"),
    "bookmarks" to listOf("bookmarks_title", "drawer_history_title"),
    "communityNotes" to listOf("birdwatch_pivot_header_title"),
    "offlineVideos" to listOf("offline_videos_title"),
    "lists" to listOf("drawer_lists"),
    "boost" to listOf("quick_promote_boost_button_text"),
    "spaces" to listOf("spaces_tab_name"),
    "followRequests" to listOf("follow_requests_title"),
    "monetization" to listOf("monetization_drawer_menu_title"),
    "creatorStudio" to listOf("creator_studio_drawer_menu_title"),
    "analytics" to listOf("subscriptions_drawer_menu_group_analytics"),
    "grok" to listOf(
        "drawer_open_grok", "drawer_get_grok", "drawer_grok_bot_create_a_bot", "drawer_grok_bot_hire_a_bot",
        "drawer_grok_bot_try_grok_bot", "drawer_grok_bot_try_ai_teammate", "drawer_grok_bot_automate_work",
    ),
)

@Suppress("unused")
val customizeSideBarPatch = bytecodePatch(
    name = "Customize side bar items",
    description = "Hides rows from the side bar.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden = hideOptions(
        linkedMapOf(
            "premium" to "Premium", "money" to "Money", "communities" to "Communities", "sports" to "Sports",
            "bookmarks" to "Bookmarks / History", "communityNotes" to "Community Notes", "offlineVideos" to "Offline videos",
            "lists" to "Lists", "boost" to "Boost", "spaces" to "Spaces", "followRequests" to "Follow requests",
            "monetization" to "Monetization", "creatorStudio" to "Creator Studio", "analytics" to "Analytics",
            "grok" to "Grok",
        ),
    )

    execute {
        CustomiseSetting("sideBarHidden").method.returnEarly(
            hidden.filterValues { it.value == true }.keys.flatMap { SIDE_BAR_ROWS.getValue(it) }.joinToString(","),
        )

        // The side bar has no list: each row is drawn by calling one of two row composables with
        // its localised title. A hidden row returns before its composable starts its group.
        val rows = mutableClassDefBy(DrawerFingerprint.classDef).methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.map { it.toString() }.let { parameters ->
                    parameters.firstOrNull() == "Ljava/lang/String;" &&
                        parameters.getOrNull(2) == "Lkotlin/jvm/functions/Function0;" &&
                        "Landroidx/compose/runtime/Composer;" in parameters
                }
        }
        if (rows.size != 2) throw PatchException("Expected the side bar's two row composables, found ${rows.size}")

        rows.forEach { row ->
            row.addInstructionsWithLabels(
                0,
                """
                invoke-static/range { p0 .. p0 }, $CUSTOMISE_CLASS->hideDrawerItem(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :show
                return-void
                """,
                ExternalLabel("show", row.getInstruction(0)),
            )
        }
    }
}

// endregion

// region Home tabs

/** Rebuilds the home tabs with the pinned lists and communities once they load. */
private object PinnedHomeTabsFingerprint : Fingerprint(
    name = "invokeSuspend",
    strings = listOf("hometimeline_pinned_tabs_special_effects_enabled"),
)

@Suppress("unused")
val customizeTimelineTopBarPatch = bytecodePatch(
    name = "Customize timeline top bar",
    description = "Hides tabs from the top of the home timeline. At least one tab always stays.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val hidden = hideOptions(
        linkedMapOf(
            "forYou" to "For you",
            "following" to "Following",
            "subscriptions" to "Subscriptions",
            "topicsUpsell" to "the topics suggestion",
            "pinnedLists" to "pinned lists",
            "pinnedCommunities" to "pinned communities",
            "pinnedTopics" to "pinned topics",
        ),
    )

    val hideAddTab by booleanOption(
        key = "hideAddTab",
        default = false,
        title = "Hide the Add tab",
        description = "Hides the + tab that pins a new timeline to the top bar.",
    )

    dependsOn(resourceMappingPatch)

    execute {
        // The + tab is drawn by its own composable, labelled "Add tab". Returning before its
        // group starts draws nothing.
        if (hideAddTab == true) {
            val label = getResourceId(ResourceType.STRING, "add_tab")
            val addTab = classDefBy { classDef ->
                classDef.methods.any { method -> method.isAddTab(label) }
            }
            mutableClassDefBy(addTab).methods.single { it.isAddTab(label) }.addInstructions(0, "return-void")
        }

        hidden.writeHidden(CustomiseSetting("homeTabsHidden")) { it.lowercase() }

        // The default tabs, For you and Following.
        filterArraysOf(ToStringFingerprint("Tab(homeTabType=").classDef.type, "homeTabs")

        // The full list, rebuilt once pinned timelines load, just before the pager is given it.
        PinnedHomeTabsFingerprint.method.apply {
            val navigate = instructions.first { instruction ->
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    instruction.getReference<MethodReference>()?.let { reference ->
                        reference.returnType == "V" && reference.parameterTypes.size == 2 &&
                            reference.parameterTypes[1] == "Ljava/util/List;"
                    } == true &&
                    instructions.getOrNull(instruction.location.index + 1)?.let { next ->
                        next.opcode == Opcode.INVOKE_VIRTUAL &&
                            next.getReference<MethodReference>()?.parameterTypes?.map { it.toString() } == listOf("Ljava/util/List;")
                    } == true
            }
            val tabs = (navigate as FiveRegisterInstruction).registerD

            addInstructions(
                navigate.location.index,
                "invoke-static/range { v$tabs .. v$tabs }, $CUSTOMISE_CLASS->homeTabsList(Ljava/util/List;)V",
            )
        }
    }
}

// endregion

private fun com.android.tools.smali.dexlib2.iface.Method.isAddTab(label: Long) =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
        parameterTypes.map { it.toString() } == listOf("Lkotlin/jvm/functions/Function0;", "Landroidx/compose/runtime/Composer;", "I") &&
        implementation?.instructions?.any {
            (it as? com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction)?.wideLiteral == label
        } == true
