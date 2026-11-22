package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val RETROFIT_GET_ANNOTATION = "Lcom/bytedance/retrofit2/c/h;"
private const val TAB_BAR = "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/otherprofile/ProfileTabBarView;"
private const val TAB_LISTENER = "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/otherprofile/OtherProfileSecondaryFragment\$f;"
private const val STRING_RESOURCES = "Lcom/ss/android/ugc/aweme/homepage/lite/R\$string;"
private const val STRING_TRANSLATOR = "Lcom/ss/android/ugc/aweme/tv/utils/v;"
private const val OTHER_PROFILE_VIEW_MODEL =
    "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/otherprofile/a;"
private const val OTHER_PROFILE_OBSERVER =
    "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/otherprofile/a\$b;"
private const val PROFILE_LISTS = "Lapp/template/extension/extension/ProfileLists;"
private const val CALL_SERVER_INTERCEPTOR = "Lcom/bytedance/retrofit2/CallServerInterceptor;"
private const val RAW_RESPONSE = "Lcom/bytedance/retrofit2/b/d;"
private const val TRAFFIC_STATS = "Lcom/bytedance/retrofit2/v;"
private const val SS_RESPONSE = "Lcom/bytedance/retrofit2/z;"
private const val REQUEST_FACTORY = "Lcom/bytedance/retrofit2/RequestFactory;"
private const val TYPED_INPUT = "Lcom/bytedance/retrofit2/mime/TypedInput;"
private const val USER_RESPONSE =
    "Lcom/ss/android/ugc/aweme/tv/profile/fragment/user/UserResponse;"
private const val USER = "Lcom/ss/android/ugc/aweme/profile/model/User;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val SEARCH_DEBUG = "Lapp/template/extension/extension/SearchDebug;"
private const val PROFILE_COUNTS = "Lapp/template/extension/extension/ProfileCounts;"
private const val PROFILE_TABS = "Lapp/template/extension/extension/ProfileTabs;"
private const val GRID_VIEW_MODEL = "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/videogrid/b;"
private const val MY_PROFILE_BASE =
    "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/myprofile/MyProfileBaseFragment;"
private const val FEED_ITEM_LIST = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"

/** Retrofit interfaces the profile screen uses for the head and author grid. */
private val PROFILE_API_CLASSES = listOf(
    "Lcom/ss/android/ugc/aweme/tv/profile/api/ProfileApi;",
    "Lcom/ss/android/ugc/aweme/tv/profile/api/QueryAwemeWithIdApi;",
    "Lcom/ss/android/ugc/aweme/tv/profile/api/FollowApi;",
    "Lcom/ss/android/ugc/aweme/tv/profilev2/api/UserListAPI;",
    "Lcom/ss/android/ugc/aweme/tv/profilev2/api/OtherUserAPI;",
)

/** Maps retired TV profile paths to their live TikTok Lite routes. */
private val PROFILE_PATH_REWRITES = mapOf(
    "/aweme/v1/tv/user/profile/other/" to "/lite/v2/user/detail/other/?lite_flow_schedule=new",
    "/aweme/v1/aweme/tv/post/" to "/lite/v2/public/item/list/",
    "/aweme/v1/tv/user/profile/self/" to "/lite/v2/user/profile/self/",
    // The retired TV relation lists. Lite serves the same user cards from the `/relation/`
    // routes; `WireIdentity` adds the offset/count/source_type query Lite sends.
    "/tiktok/tv/follower/list/v1/" to "/lite/v2/relation/follower/list/",
    "/tiktok/tv/following/list/v1/" to "/lite/v2/relation/following/list/",
    // The saved-video list. The TV method already sends `cursor`/`count`, which is Lite's shape.
    "/tv/user/favorite" to "/lite/v2/aweme/collection/list/",
)

/** Rewrites the retired TV profile endpoints to TikTok Lite's live routes. */
@Suppress("unused")
val fixTvProfilePatch = bytecodePatch(
    name = "Fix TikTok TV profiles",
    description = "Sends profile-head and video-grid requests to the live TikTok Lite endpoints instead of the retired TV profile backend.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        var rewritten = 0

        PROFILE_API_CLASSES.forEach { classDescriptor ->
            mutableClassDefBy(classDescriptor).methods.forEach { method ->
                method.annotations
                    .filter { it.type == RETROFIT_GET_ANNOTATION }
                    .flatMap { it.elements }
                    .mapNotNull { it.value as? MutableStringEncodedValue }
                    .forEach { value ->
                        PROFILE_PATH_REWRITES[value.value]?.let { target ->
                            value.setValue(target)
                            rewritten++
                        }
                    }
            }
        }

        check(rewritten > 0) { "No retired TV profile endpoint found to rewrite" }

        /*
         * Liked/repost share one TV method (`getLikedAweme`). Its path stays the retired
         * `/aweme/v1/aweme/tv/favorite/` in the dex; `WireIdentity` chooses the live route per
         * request: the account's own `Video đã thích` goes to Lite's
         * `/lite/v1/relation/like-items`, another author's Repost tab goes to
         * `/tiktok/v1/upvote/item/list` with `scene=0`. The query parameter stays `max_cursor`
         * in the dex and is renamed to `offset` only on the repost branch.
         */

        /*
         * Tab bar: keep Posts, replace Liked/Following/Followers with Repost. The constructor
         * builds a four-string array before `c()` creates the TextViews; replace that array
         * right before the Kotlin list conversion. R.string.forward is already the app's
         * "Repost" string, so the UI translator localises it like the old labels.
         */
        val tabBarCtor = mutableClassDefBy(TAB_BAR).methods.first { it.name == "<init>" }
        val tabListCall = tabBarCtor.implementation!!.instructions.indexOfFirst { instruction ->
            val reference = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == "Lkotlin/collections/t;" &&
                reference.name == "b" &&
                reference.parameterTypes.size == 1 &&
                reference.parameterTypes[0].toString() == "[Ljava/lang/Object;"
        }
        check(tabListCall >= 0) { "ProfileTabBarView string array not found" }
        // 12.3.4.1's translator is tv/utils/v; 12.3.7.1 renamed it tv/utils/x. Read the class
        // from the constructor's own calls instead of baking one version in.
        val translator = tabBarCtor.implementation!!.instructions
            .mapNotNull {
                ((it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    ?.reference as? MethodReference)
            }
            .firstOrNull {
                it.name == "a" &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes[0].toString() == "I" &&
                    it.returnType == "Ljava/lang/String;" &&
                    it.definingClass.startsWith("Lcom/ss/android/ugc/aweme/tv/utils/")
            }?.definingClass ?: STRING_TRANSLATOR
        tabBarCtor.addInstructions(
            tabListCall,
            listOf(
                "const/4 p2, 0x2",
                "new-array p2, p2, [Ljava/lang/String;",
                "const/4 v0, 0x0",
                "sget v1, $STRING_RESOURCES->tvProfile_posts_header:I",
                "invoke-static {v1}, $translator->a(I)Ljava/lang/String;",
                "move-result-object v1",
                "aput-object v1, p2, v0",
                "const/4 v0, 0x1",
                "sget v1, $STRING_RESOURCES->forward:I",
                "invoke-static {v1}, $translator->a(I)Ljava/lang/String;",
                "move-result-object v1",
                "aput-object v1, p2, v0",
            ).joinToString("\n"),
        )

        // The tab's click listener was a no-op; make CENTER on a tab actually switch the pane.
        mutableClassDefBy(TAB_BAR).methods.firstOrNull {
            it.name == "a" && it.parameterTypes == listOf("Landroid/view/View;") && it.returnType == "V"
        }?.addInstruction(
            0,
            "invoke-static {p0}, $PROFILE_TABS->onTabClick(Landroid/view/View;)V",
        )

        // The repost endpoint has no max_cursor; give the grid one before it reads the response.
        mutableClassDefBy(GRID_VIEW_MODEL).methods.first {
            it.name == "a" && it.parameterTypes == listOf(FEED_ITEM_LIST)
        }.addInstruction(
            0,
            "invoke-static {p0, p1}, $PROFILE_TABS->fixRepostCursor(Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        // The right-arrow boundary was hard-coded to the fourth tab; with two tabs it is 1.
        val tabKeyMethod = mutableClassDefBy(TAB_BAR).methods.first {
            it.name == "a" &&
                it.returnType == "Z" &&
                it.parameterTypes.size == 6 &&
                it.parameterTypes[0] == TAB_BAR
        }
        val lastTabIndex = tabKeyMethod.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.CONST_4 && (it as Instruction11n).narrowLiteral == 3
        }
        check(lastTabIndex >= 0) { "ProfileTabBarView right boundary not found" }
        tabKeyMethod.replaceInstruction(lastTabIndex, "const/4 p3, 0x1")

        /*
         * The tab listener builds the title/content pair for index 1. Point that pair at the
         * repost title and analytics key; the grid it already builds uses `LIKED_VIDEOS`, which
         * now hits the repost endpoint.
         */
        val tabListener = mutableClassDefBy(TAB_LISTENER).methods.first {
            it.name == "a" && it.parameterTypes == listOf("I")
        }
        tabListener.implementation!!.instructions.forEachIndexed { index, instruction ->
            val reference = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference
            if (instruction.opcode == Opcode.SGET && reference is com.android.tools.smali.dexlib2.iface.reference.FieldReference &&
                reference.name == "tvProfile_likedvids_header") {
                tabListener.replaceInstruction(
                    index,
                    "sget v${(instruction as OneRegisterInstruction).registerA}, $STRING_RESOURCES->forward:I",
                )
            }
            if (reference is StringReference && reference.string == "liked_videos") {
                tabListener.replaceInstruction(
                    index,
                    "const-string v${(instruction as OneRegisterInstruction).registerA}, \"repost\"",
                )
            }
        }

        /*
         * The head endpoint answers an empty 200 with `tt_orcas_res=1` for this client on every
         * identity, so the screen must not depend on it. The opening surface already has the
         * author/search-card User, and this view model receives it as `p1`; emit it through the
         * same observer and return before the network call. The grid is a separate view model
         * and still loads from the live item-list endpoint; ProfileCounts fills the three
         * counters from that answer's author. If the head endpoint becomes reachable again,
         * remove the `return-void` to let it refresh the richer fields as well.
         */
        val networkCall = mutableClassDefBy(OTHER_PROFILE_VIEW_MODEL).methods.firstOrNull {
            it.name == "b" && it.parameterTypes == listOf(USER, FUNCTION1)
        } ?: throw IllegalStateException("OtherProfileViewModel network method not found")
        val injected = listOf(
            "new-instance v0, $OTHER_PROFILE_OBSERVER",
            "invoke-direct {v0, p0, p2}, $OTHER_PROFILE_OBSERVER-><init>($OTHER_PROFILE_VIEW_MODEL$FUNCTION1)V",
            "new-instance p2, $USER_RESPONSE",
            "invoke-direct {p2}, $USER_RESPONSE-><init>()V",
            "invoke-virtual {p2, p1}, $USER_RESPONSE->setUser($USER)V",
            "invoke-virtual {v0, p2}, $OTHER_PROFILE_OBSERVER->onNext(Ljava/lang/Object;)V",
            "invoke-static {p1, v0}, $PROFILE_COUNTS->enrich(Ljava/lang/Object;Ljava/lang/Object;)V",
            "return-void",
        )
        injected.forEachIndexed { index, instruction ->
            networkCall.addInstruction(index, instruction)
        }

        mutableClassDefBy(OTHER_PROFILE_OBSERVER).methods.first {
            it.name == "onError" && it.parameterTypes == listOf("Ljava/lang/Throwable;")
        }.apply {
            addInstruction(0, "invoke-static {p1}, $SEARCH_DEBUG->logProfileThrowable(Ljava/lang/Throwable;)V")
            addInstruction(1, "return-void")
        }

        /*
         * The relation answers carry raw User objects, while the TV follow-tab converter reads
         * {user: ...} wrappers. Reshape at the same pre-toResponse seam the profile grids use;
         * ProfileLists leaves every other path untouched.
         */
        val convert = mutableClassDefBy(CALL_SERVER_INTERCEPTOR).methods.firstOrNull {
            it.name == "a" &&
                it.parameterTypes == listOf(RAW_RESPONSE, TRAFFIC_STATS) &&
                it.returnType == SS_RESPONSE
        } ?: throw IllegalStateException("CallServerInterceptor.a(Response, TrafficStats) not found")

        val toResponse = convert.implementation!!.instructions.indexOfFirst { instruction ->
            val reference = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference
            reference is MethodReference &&
                reference.definingClass == REQUEST_FACTORY &&
                reference.name == "toResponse" &&
                reference.parameterTypes == listOf(TYPED_INPUT)
        }
        check(toResponse >= 0) { "RequestFactory.toResponse(TypedInput) call not found" }

        convert.addInstructions(
            toResponse,
            """
                invoke-static {p1, v0}, $PROFILE_LISTS->shapeBody(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $TYPED_INPUT
            """.trimIndent(),
        )

        /*
         * The grid view model's request method starts with the selected tab's `awemeQueryId`
         * (`l`). Record it so WireIdentity can tell an own Repost request from an own Liked
         * request; both use the same `LIKED_VIDEOS` query type and Retrofit method.
         */
        val gridRequest = mutableClassDefBy(GRID_VIEW_MODEL).methods.first {
            it.name == "e" && it.parameterTypes.isEmpty()
        }
        gridRequest.addInstruction(
            0,
            "invoke-static {p0}, $PROFILE_LISTS->noteGridKind(Ljava/lang/Object;)V",
        )

        /*
         * My profile menu: Posts, Repost, Saved, Liked videos, Following, Followers. Build the
         * two new grid fragments from the app's own factory (reflection, because the extension
         * cannot link the TV classes at compile time) and splice them into the list just before
         * initializeTabData returns.
         */
        val initializeTabs = mutableClassDefBy(MY_PROFILE_BASE).methods.first {
            it.name == "initializeTabData" && it.parameterTypes.isEmpty()
        }
        val tabReturn = initializeTabs.implementation!!.instructions.indexOfLast {
            it.opcode == Opcode.RETURN_OBJECT
        }
        check(tabReturn >= 0) { "MyProfileBaseFragment initializeTabData return not found" }
        val listRegister = (initializeTabs.implementation!!.instructions[tabReturn] as OneRegisterInstruction)
            .registerA
        initializeTabs.addInstruction(
            tabReturn,
            "invoke-static {v$listRegister}, $PROFILE_LISTS->addMyProfileTabs(Ljava/lang/Object;)V",
        )
    }
}
