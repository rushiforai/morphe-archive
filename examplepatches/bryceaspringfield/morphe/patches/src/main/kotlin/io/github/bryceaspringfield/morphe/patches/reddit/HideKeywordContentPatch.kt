package io.github.bryceaspringfield.morphe.patches.reddit

import io.github.bryceaspringfield.morphe.patches.hookReturns
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.bryceaspringfield.morphe.patches.reddit.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lio/github/bryceaspringfield/morphe/extension/reddit/HideKeywordContentPatch;"

/**
 * The settings screen Morphe Patches adds to Reddit (Settings > Morphe). This bundle adds its
 * sections to that screen, and adds no screen of its own.
 */
private const val MORPHE_SETTINGS_FRAGMENT =
    "Lapp/morphe/extension/reddit/settings/preference/RedditPreferenceFragment;"

private const val BOTTOM_NAV_SCREEN = "Lcom/reddit/launch/bottomnav/BottomNavScreen;"
private const val BOTTOM_NAV_TAB = "Lcom/reddit/launch/bottomnav/BottomNavTab;"
private const val DRAWER_LIST_BINDER =
    "Lcom/reddit/screens/drawer/community/CommunityDrawerPresenter\$bindListOnView\$2;"
private const val MENU_BADGE_FLOW =
    "Lcom/reddit/navdrawer/composables/RedditMainNavigationButtonProvider\$mainNavigationIcon\$navIconBadgeVisible\$2\$1;"
/** The modification steps of the two feed pagers, each calling the modification and returning the modified feed. */
private val FEED_MODIFICATIONS = listOf(
    "Lcom/reddit/feeds/impl/domain/paging/RedditCachedFeedPager\$applyFeedModification\$2;",
    "Lcom/reddit/feeds/impl/domain/paging/RedditFeedPager\$applyFeedModification\$2\$1;",
)

/** The suspended call of RedditFeedPager's applyFeedModification, whose constructor takes the pager. */
private const val FEED_PAGER_MODIFICATION_CALL =
    "Lcom/reddit/feeds/impl/domain/paging/RedditFeedPager\$applyFeedModification\$1;"

/** A suspended call of RedditCachedFeedPager whose constructor takes the pager first. */
private const val CACHED_PAGER_INNER_CALL =
    "Lcom/reddit/feeds/impl/domain/paging/RedditCachedFeedPager\$handleLoadError\$1;"

/**
 * Whether a method is the app's copy of a collection into an immutable list of the type given: static, taking an
 * Iterable, and returning the Iterable itself when it is already of that type.
 */
private fun isImmutableCopy(method: Method, type: String) =
    AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == type &&
            method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Iterable;") &&
            method.implementation?.instructions?.firstOrNull()?.let {
                it.opcode == Opcode.INSTANCE_OF && it.getReference<TypeReference>()?.type == type
            } == true

private val COMMENT_LISTS = listOf(
    "Lcom/reddit/domain/model/CommentsResultWithSource;",
    "Lcom/reddit/domain/model/CommentResponse;",
)

private val logger = Logger.getLogger("HideKeywordContentPatch")

private const val USER_SETTINGS_SECTION = "Lcom/reddit/settings/usersettings/UserSettingsSection;"

/** The key of Reddit's privacy policy row, which Morphe Patches renames "Morphe" and opens its settings from. */
private const val MORPHE_ROW_KEY = "key_pref_privacy_policy"

/** The extension's switch for a patch's settings section, returning true once the patch is applied. */
private const val FEATURES_CLASS = "Lio/github/bryceaspringfield/morphe/extension/reddit/Features;"

private const val TRENDING_CLASS = "Lio/github/bryceaspringfield/morphe/extension/reddit/TrendingPlaces;"
private const val MORPHE_TRENDING_CLASS = "Lapp/morphe/extension/reddit/patches/HideTrendingShelvesPatch;"

/**
 * Sends Reddit's reads of Morphe Patches' Hide Trending shelves switch to the extension, with a switch for feeds
 * (the Trending unit, in Reddit's search.feeds package) and one for search suggestions (every other read).
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.splitTrendingSwitch() {
    fun morpheRead(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction) =
        instruction.opcode == Opcode.INVOKE_STATIC && instruction.getReference<MethodReference>()?.let {
            it.definingClass == MORPHE_TRENDING_CLASS && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    (it.name == "hideTrendingShelf" || it.name == "hideTrendingCommunitiesShelf")
        } == true

    val found = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/") || classDef.type.startsWith("Lio/github/bryceaspringfield/")) return@classDefForEach
        if (classDef.methods.any { m -> m.implementation?.instructions?.any { morpheRead(it) } == true }) found.add(classDef)
    }
    var feeds = 0
    var search = 0
    found.forEach { classDef ->
        val place = if (classDef.type.startsWith("Lcom/reddit/search/feeds/")) "feed" else "search"
        val target = com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference(TRENDING_CLASS, place, emptyList(), "Z")
        mutableClassDefBy(classDef).methods.forEach { method ->
            if (method.implementation == null) return@forEach
            method.instructions.toList().forEachIndexed { index, instruction ->
                if (!morpheRead(instruction)) return@forEachIndexed
                method.replaceInstruction(index, BuilderInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, target))
                if (place == "feed") feeds++ else search++
            }
        }
    }
    if (feeds + search == 0) {
        logger.info("Morphe Patches' Hide Trending shelves is not applied; its switch stays whole")
        return
    }
    enableFeature("trending")
    logger.info("Trending switch split: $feeds feed reads and $search search reads")
}

/** Makes the extension's Features.[name] return true, which shows the patch's section in Settings > Morphe. */
internal fun app.morphe.patcher.patch.BytecodePatchContext.enableFeature(name: String) {
    val method = mutableClassDefByOrNull(FEATURES_CLASS)?.methods?.firstOrNull { it.name == name }
    if (method == null) {
        logger.warning("The extension's Features.$name is missing; its settings stay hidden")
        return
    }
    method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}

/**
 * The bundle's extension and its settings in Settings > Morphe (the profiles, and each applied patch's section),
 * shared by every patch of the bundle.
 */
internal val keywordFilterSettingsPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_REDDIT)

    extendWith("extensions/reddit-keyword-filter.mpe")

    // Runs after every selected patch of every bundle, so Morphe Patches' settings screen exists.
    finalize {
        splitTrendingSwitch()
        val fragment = mutableClassDefByOrNull(MORPHE_SETTINGS_FRAGMENT)
        val initialize = fragment?.methods?.firstOrNull {
            it.name == "initialize" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        if (initialize == null) {
            logger.warning(
                "Morphe Patches' Reddit settings screen is missing, so the filters cannot be edited. " +
                        "Also select Morphe Patches' Reddit patches."
            )
            return@finalize
        }

        moveMorpheRow()
        addAboutSection()

        initialize.apply {
            hookReturns(Opcode.RETURN_VOID, "invoke-static { }, $EXTENSION_CLASS->addSettings()V")

            // The screen is saved at the start, since the compiled method reuses the register of
            // `this` for its own values before it returns.
            addInstruction(0, "invoke-static { p0 }, $EXTENSION_CLASS->setSettingsFragment(Ljava/lang/Object;)V")
        }
    }
}

@Suppress("unused")
val hideKeywordContentPatch = bytecodePatch(
    name = "Hide keyword content",
    description = "Hides posts and comments by keyword, subreddit, author, flair, type, score, and number of " +
            "comments. Select it together with Morphe Patches' Reddit patches, whose settings screen " +
            "(Settings > Morphe) gets the Keyword filter sections.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(keywordFilterSettingsPatch)

    execute {
        enableFeature("filters")
        // Filter each page of the paged feeds (Home, Popular, News, communities, search, profiles).
        FeedPagingDataSourceLoadFingerprint.let {
            it.method.apply {
                val getDataIndex = it.instructionMatches.first().index
                val index = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                // The data source, whose feed type names the place, is the receiver of the getClass() call
                // the compiled code makes just before getData().
                val getClassIndex = (getDataIndex - 1 downTo maxOf(0, getDataIndex - 12)).firstOrNull { i ->
                    val reference = getInstruction(i).getReference<MethodReference>()
                    reference?.name == "getClass" && reference.definingClass == "Ljava/lang/Object;"
                }
                // The compiled code may reuse the receiver's register after getClass(), keeping the source in a
                // copy made just before; the first candidate no instruction overwrites before the hook is used.
                fun keptUntilHook(register: Int, from: Int) = (from..index).none { i ->
                    val instruction = getInstruction(i)
                    instruction.opcode.setsRegister() &&
                            (instruction as? OneRegisterInstruction)?.registerA == register
                }
                val sourceRegister = getClassIndex?.let { getClassAt ->
                    val receiver = getInstruction<FiveRegisterInstruction>(getClassAt).registerC
                    val copies = (getClassAt - 1 downTo maxOf(0, getClassAt - 8)).mapNotNull { i ->
                        val instruction = getInstruction(i)
                        if (instruction.opcode == Opcode.MOVE_OBJECT || instruction.opcode == Opcode.MOVE_OBJECT_FROM16)
                            (instruction as TwoRegisterInstruction).takeIf { it.registerB == receiver }?.registerA
                        else null
                    }
                    (listOf(receiver) + copies).firstOrNull { keptUntilHook(it, getClassAt + 1) }
                }
                val sourceKept = sourceRegister != null

                addInstructions(
                    index + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->filterFeedElements(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """
                )
                if (sourceKept) {
                    addInstruction(
                        index + 1,
                        "invoke-static/range { v$sourceRegister .. v$sourceRegister }, " +
                                "$EXTENSION_CLASS->setFeedSource(Ljava/lang/Object;)V"
                    )
                } else {
                    logger.warning("Could not find the feed's data source; feeds are filtered as Other feeds")
                }
            }
        }

        // Filter the older post listings (search results, profiles).
        ListingFingerprint.method.apply {
            // Found by scanning, since another bundle's patch may have inserted code here after matching.
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.IPUT_OBJECT && it.getReference<FieldReference>()?.name == "children"
            }
            val register = getInstruction<TwoRegisterInstruction>(index).registerA

            addInstructions(
                index,
                """
                    invoke-static { v$register }, $EXTENSION_CLASS->filterLinks(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """
            )
        }
    }

    // Runs after every selected patch of every bundle, so Morphe Patches' own hooks in the same
    // methods are in place, and Morphe Patches' settings screen exists.
    finalize {
        // Filter a feed again after a translation rewrites its posts: the result of the pager's modification step, at the
        // modification call and at the return of a resumed call.
        var listCopyWritten = false
        FEED_MODIFICATIONS.forEach { modificationClass -> run {
            val method = mutableClassDefByOrNull(modificationClass)?.methods?.firstOrNull { it.name == "invokeSuspend" }
            val listType = method?.instructions?.firstNotNullOfOrNull {
                if (it.opcode == Opcode.CHECK_CAST) it.getReference<TypeReference>()?.type else null
            }
            val callIndex = method?.instructions?.indexOfFirst { it.opcode == Opcode.INVOKE_INTERFACE } ?: -1
            val modificationType = method?.takeIf { callIndex >= 0 }?.getInstruction(callIndex)
                ?.getReference<MethodReference>()?.definingClass
            val field = method?.instructions?.firstNotNullOfOrNull {
                it.getReference<FieldReference>()?.takeIf { f -> it.opcode == Opcode.IGET_OBJECT && f.type == modificationType }
            }
            val copy = listType?.let { type ->
                classDefByOrNull { c -> c.methods.any { isImmutableCopy(it, type) } }?.methods?.first { isImmutableCopy(it, type) }
            }
            val stub = mutableClassDefByOrNull(EXTENSION_CLASS)?.methods?.firstOrNull { it.name == "immutableList" }
            if (method == null || field == null || copy == null || stub == null ||
                method.getInstruction(callIndex + 1).opcode != Opcode.MOVE_RESULT_OBJECT
            ) {
                logger.warning("Could not find the modification step $modificationClass; its translated posts are not filtered again")
                return@run
            }

            // The extension's list copy calls the app's.
            if (!listCopyWritten) stub.addInstructions(
                0,
                """
                    invoke-static { p0 }, ${copy.definingClass}->${copy.name}(Ljava/lang/Iterable;)${copy.returnType}
                    move-result-object p0
                    return-object p0
                """
            )

            method.apply {
                val thisRegister = implementation!!.registerCount - 2
                // A return reached before any instruction writes the register of this, which then still holds this.
                val resumeReturn = instructions.withIndex().firstOrNull { (i, it) ->
                    it.opcode == Opcode.RETURN_OBJECT && (0 until i).none { j ->
                        val previous = getInstruction(j)
                        previous.opcode.setsRegister() && (previous as? OneRegisterInstruction)?.registerA == thisRegister
                    }
                }?.index
                val call = getInstruction<FiveRegisterInstruction>(callIndex)
                val receiver = call.registerC
                val result = getInstruction<OneRegisterInstruction>(callIndex + 1).registerA

                // Inserted from the last index to the first, so earlier indices stay valid.
                val hooks = mutableListOf<Pair<Int, String>>()
                if (resumeReturn != null) {
                    val value = getInstruction<OneRegisterInstruction>(resumeReturn).registerA
                    val temp = (0..2).first { it != value && it != thisRegister }
                    if (value < 16 && thisRegister < 16) hooks += resumeReturn to """
                        iget-object v$temp, p0, ${field.definingClass}->${field.name}:${field.type}
                        invoke-static { v$value, v$temp }, $EXTENSION_CLASS->filterModifiedFeed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$value
                    """
                }
                if (receiver != result && receiver < 16 && result < 16) hooks += (callIndex + 2) to """
                    invoke-static { v$result, v$receiver }, $EXTENSION_CLASS->filterModifiedFeed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$result
                """ else logger.warning("The modification call's registers are unexpected; synchronous results are not filtered again")
                hooks.sortedByDescending { it.first }.forEach { (index, code) -> addInstructions(index, code) }
            }
            listCopyWritten = true
        } }

        // A requested translation of one post changes the post in place, through the pager's update of one element,
        // and runs no feed modification. After such an update the extension filters the pager's state again, and the
        // generated refilterPagerState writes the posts kept with the app's own state copy and compare-and-set.
        fun refilterHooks(pagerType: String?, stubName: String) {
            val pager = pagerType?.let { mutableClassDefByOrNull(it) }
            val update = pager?.methods?.firstOrNull { m ->
                m.returnType == "V" && m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/util/List;") &&
                        m.implementation?.instructions?.any { it.opcode == Opcode.INVOKE_STATIC_RANGE } == true
            }
            val calls = update?.instructions?.mapNotNull { i -> i.getReference<MethodReference>()?.let { i to it } }.orEmpty()
            val cas = calls.firstOrNull { (_, r) ->
                r.returnType == "Z" && r.definingClass != "Lkotlin/jvm/internal/Intrinsics;" &&
                        r.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
            }
            val stateFlow = cas?.second?.definingClass
            val getValue = calls.firstOrNull { (_, r) -> r.definingClass == stateFlow && r.name == "getValue" }
            val copyCall = calls.firstOrNull { (i, r) ->
                i.opcode == Opcode.INVOKE_STATIC_RANGE && r.parameterTypes.size >= 4 &&
                        r.parameterTypes[0].toString() == r.returnType && r.parameterTypes[1] == r.parameterTypes[2]
            }
            val copy = copyCall?.second
            val stateType = copy?.returnType
            val listType = copy?.parameterTypes?.get(1)?.toString()
            val stateField = update?.instructions?.firstNotNullOfOrNull { i ->
                i.getReference<FieldReference>()?.takeIf {
                    i.opcode == Opcode.IGET_OBJECT && it.type == stateFlow && it.definingClass == pagerType
                }
            }
            val listFields = update?.instructions?.mapNotNull { i ->
                i.getReference<FieldReference>()?.takeIf {
                    i.opcode == Opcode.IGET_OBJECT && it.definingClass == stateType && it.type == listType
                }
            }?.distinctBy { it.name }.orEmpty()
            val extension = mutableClassDefByOrNull(EXTENSION_CLASS)
            if (update == null || cas == null || getValue == null || copyCall == null || copy == null || stateField == null ||
                listFields.size != 2 || extension == null || update.implementation!!.registerCount > 16 ||
                copy.parameterTypes.any { it.toString() == "J" || it.toString() == "D" }
            ) {
                logger.warning("Could not find the element update of feed pager $pagerType; its open feed is not filtered again")
                return
            }
            // The mask the app passes: the literal last written to the copy call's last register before the call.
            val range = copyCall.first as RegisterRangeInstruction
            val maskRegister = range.startRegister + range.registerCount - 1
            val copyIndex = update.instructions.indexOf(copyCall.first)
            val mask = (copyIndex - 1 downTo 0).firstNotNullOfOrNull { j ->
                val i = update.getInstruction(j)
                if ((i as? OneRegisterInstruction)?.registerA == maskRegister) (i as? NarrowLiteralInstruction)?.narrowLiteral ?: -4 else null
            } ?: -4

            val count = copy.parameterTypes.size
            val defaults = (3 until count - 1).joinToString("\n") { k -> "const/4 v${8 + k}, 0x0" }
            fun callOp(op: Opcode) = if (op == Opcode.INVOKE_INTERFACE) "invoke-interface" else "invoke-virtual"
            val body = """
                move-object/from16 v5, p0
                instance-of v7, v5, $pagerType
                if-eqz v7, :none
                check-cast v5, $pagerType
                iget-object v0, v5, $pagerType->${stateField.name}:$stateFlow
                :loop
                ${callOp(getValue.first.opcode)} { v0 }, $stateFlow->getValue()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, $stateType
                iget-object v2, v1, $stateType->${listFields[0].name}:$listType
                iget-object v3, v1, $stateType->${listFields[1].name}:$listType
                invoke-static { v2, v3 }, $EXTENSION_CLASS->keptLists(Ljava/util/List;Ljava/util/List;)[Ljava/lang/Object;
                move-result-object v4
                if-eqz v4, :none
                move-object v8, v1
                const/4 v5, 0x0
                aget-object v9, v4, v5
                check-cast v9, $listType
                const/4 v5, 0x1
                aget-object v10, v4, v5
                check-cast v10, $listType
                $defaults
                const v${8 + count - 1}, $mask
                invoke-static/range { v8 .. v${8 + count - 1} }, ${copy.definingClass}->${copy.name}(${copy.parameterTypes.joinToString("")})${copy.returnType}
                move-result-object v6
                ${callOp(cas.first.opcode)} { v0, v1, v6 }, $stateFlow->${cas.second.name}(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v7
                if-eqz v7, :loop
                const/4 v0, 0x1
                return v0
                :none
                const/4 v0, 0x0
                return v0
            """
            extension.methods.removeIf { it.name == stubName }
            extension.methods.add(
                ImmutableMethod(
                    EXTENSION_CLASS,
                    stubName,
                    listOf(ImmutableMethodParameter("Ljava/lang/Object;", emptySet(), "pager")),
                    "Z",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    emptySet(),
                    null,
                    MutableMethodImplementation(8 + count + 1),
                ).toMutable().apply {
                    addInstructionsWithLabels(0, body)
                    // The field reads and the two calls use the app's own references.
                    val reads = instructions.withIndex().filter { it.value.opcode == Opcode.IGET_OBJECT }.map { it.index }
                    listOf(stateField, listFields[0], listFields[1]).zip(reads).forEach { (field, index) ->
                        val read = getInstruction<TwoRegisterInstruction>(index)
                        replaceInstruction(index, BuilderInstruction22c(Opcode.IGET_OBJECT, read.registerA, read.registerB, field))
                    }
                    val copyAt = instructions.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC_RANGE }
                    replaceInstruction(copyAt, BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 8, count, copy))
                    val casAt = instructions.withIndex().last {
                        (it.value.opcode == Opcode.INVOKE_VIRTUAL || it.value.opcode == Opcode.INVOKE_INTERFACE) &&
                                it.value.getReference<MethodReference>()?.parameterTypes?.size == 2
                    }.index
                    replaceInstruction(casAt, BuilderInstruction35c(cas.first.opcode, 3, 0, 1, 6, 0, 0, cas.second))
                }
            )
            update.addInstruction(0, "invoke-static { p0, p2 }, $EXTENSION_CLASS->onElementEvents(Ljava/lang/Object;Ljava/util/List;)V")
            // Each pager registers itself, so a settings change filters every open feed again.
            pager.methods.filter { it.name == "<init>" }.forEach { constructor ->
                constructor.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
                    .sortedDescending().forEach { index ->
                        constructor.addInstruction(index, "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->registerPager(Ljava/lang/Object;)V")
                    }
            }
        }
        refilterHooks(
            classDefByOrNull(FEED_PAGER_MODIFICATION_CALL)?.methods
                ?.firstOrNull { it.name == "<init>" }?.parameterTypes?.firstOrNull()?.toString(),
            "refilterFeedPager",
        )
        refilterHooks(
            classDefByOrNull(CACHED_PAGER_INNER_CALL)?.methods
                ?.firstOrNull { it.name == "<init>" }?.parameterTypes?.firstOrNull()?.toString(),
            "refilterCachedPager",
        )


        // Filter each post's comments where the app stores them.
        COMMENT_LISTS.forEach { type ->
            val constructors = mutableClassDefByOrNull(type)?.methods?.filter { method ->
                method.name == "<init>" && "Ljava/util/List;" in method.parameterTypes &&
                        "Lkotlin/jvm/internal/DefaultConstructorMarker;" !in method.parameterTypes
            }.orEmpty()
            if (constructors.isEmpty()) logger.warning("Could not find $type; comments there are not filtered")
            constructors.forEach { method ->
                val types = method.parameterTypes.map { it.toString() }
                val position = types.indexOf("Ljava/util/List;")
                val register = 1 + types.take(position).sumOf { if (it == "J" || it == "D") 2L else 1L }.toInt()
                method.addInstructions(
                    0,
                    """
                        invoke-static/range { p$register .. p$register }, $EXTENSION_CLASS->filterComments(Ljava/util/List;)Ljava/util/List;
                        move-result-object p$register
                    """
                )
            }
        }

    }
}

@Suppress("unused")
val navigationAndSidebarPatch = bytecodePatch(
    name = "Navigation and sidebar",
    description = "Adds switches in Settings > Morphe, off until turned on, to hide the Inbox button, sidebar rows, " +
            "and the sidebar button's badge, and to keep the top and bottom bars shown while a feed scrolls.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(keywordFilterSettingsPatch)

    finalize {
        enableFeature("navigation")
        // Skip a hidden bottom bar tab in the loop building the bar's tabs.
        val tabBuilder = mutableClassDefByOrNull(BOTTOM_NAV_SCREEN)?.methods?.firstOrNull { method ->
            method.returnType != "V" && method.parameterTypes.size == 1 && method.implementation != null &&
                    method.instructions.any { it.getReference<MethodReference>()?.name == "hasNext" } &&
                    method.instructions.any {
                        it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.type == BOTTOM_NAV_TAB
                    }
        }
        if (tabBuilder == null) {
            logger.warning("Could not find the bottom bar's tab builder; the Inbox tab cannot be hidden")
        } else tabBuilder.apply {
            val loopIndex = instructions.indexOfFirst { it.getReference<MethodReference>()?.name == "hasNext" }
            val tabIndex = instructions.withIndex().first { (i, it) ->
                i > loopIndex && it.opcode == Opcode.IGET_OBJECT &&
                        it.getReference<FieldReference>()?.type == BOTTOM_NAV_TAB
            }.index
            val register = getInstruction<TwoRegisterInstruction>(tabIndex).registerA
            addInstructionsWithLabels(
                tabIndex + 1,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->navigationTab(Ljava/lang/Enum;)Ljava/lang/Enum;
                    move-result-object v$register
                    if-eqz v$register, :next_tab
                    check-cast v$register, $BOTTOM_NAV_TAB
                """,
                ExternalLabel("next_tab", getInstruction(loopIndex))
            )
        }

        // Remove hidden sidebar rows before the sidebar's adapter gets its list.
        val drawerBinder = mutableClassDefByOrNull(DRAWER_LIST_BINDER)?.methods?.firstOrNull { it.name == "invokeSuspend" }
        val drawerCall = drawerBinder?.instructions?.indexOfFirst {
            val reference = it.getReference<MethodReference>()
            it.opcode == Opcode.INVOKE_VIRTUAL && reference?.returnType == "V" &&
                    reference.parameterTypes.map { type -> type.toString() } == listOf("Ljava/util/List;")
        } ?: -1
        // The presenter keeps the list it binds and reads a tapped row by its position in that list, so the rows are
        // removed where the presenter stores the list, keeping each position on the row shown there.
        val drawerListField = drawerBinder?.instructions?.take(maxOf(drawerCall, 0))?.lastOrNull {
            it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.type == "Ljava/util/List;"
        }?.getReference<FieldReference>()
        var drawerStores = 0
        val drawerOwner = drawerListField?.let { mutableClassDefByOrNull(it.definingClass) }
        if (drawerListField != null && drawerOwner != null) {
            // A helper in the presenter filters the stored list in place after each store; filtering the value before
            // the store changes the register's type, which the verifier rejects where the method reuses the register.
            val field = "${drawerOwner.type}->${drawerListField.name}:Ljava/util/List;"
            val helper = "morpheFilterSidebar"
            drawerOwner.methods.removeIf { it.name == helper }
            drawerOwner.methods.add(
                ImmutableMethod(
                    drawerOwner.type,
                    helper,
                    listOf(ImmutableMethodParameter(drawerOwner.type, emptySet(), "presenter")),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    emptySet(),
                    null,
                    MutableMethodImplementation(2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            iget-object v0, p0, $field
                            invoke-static { v0 }, $EXTENSION_CLASS->filterSidebar(Ljava/util/List;)Ljava/util/List;
                            move-result-object v0
                            iput-object v0, p0, $field
                            return-void
                        """
                    )
                }
            )
            drawerOwner.methods.forEach { method ->
                // The constructor stores the empty list only.
                if (method.implementation == null || method.name == "<init>" || method.name == helper) return@forEach
                val stores = method.instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.IPUT_OBJECT && instruction.getReference<FieldReference>().let {
                        it?.definingClass == drawerListField.definingClass && it.name == drawerListField.name &&
                                it.type == drawerListField.type
                    }
                }.map { it.index }
                stores.sortedDescending().forEach { index ->
                    val owner = method.getInstruction<TwoRegisterInstruction>(index).registerB
                    method.addInstruction(
                        index + 1,
                        "invoke-static/range { v$owner .. v$owner }, ${drawerOwner.type}->$helper(${drawerOwner.type})V"
                    )
                    drawerStores++
                }
            }
        }
        logger.info("Sidebar list stores filtered: $drawerStores")
        if (drawerStores > 0) {
            logger.info("Sidebar rows are removed from the presenter's own list")
        } else if (drawerBinder == null || drawerCall < 0) {
            logger.warning("Could not find the sidebar's list; sidebar rows cannot be hidden")
        } else drawerBinder.apply {
            val register = getInstruction<FiveRegisterInstruction>(drawerCall).registerD
            addInstructions(
                drawerCall,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->filterSidebar(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """
            )
        }

        // End the sidebar button's badge flow before it emits, so the badge stays hidden.
        val badgeFlow = mutableClassDefByOrNull(MENU_BADGE_FLOW)?.methods?.firstOrNull { it.name == "invokeSuspend" }
        val unit = badgeFlow?.instructions?.firstNotNullOfOrNull {
            it.getReference<FieldReference>()?.takeIf { field -> it.opcode == Opcode.SGET_OBJECT && field.type == "Lkotlin/Unit;" }
        }
        if (badgeFlow == null || unit == null) {
            logger.warning("Could not find the sidebar button's badge; it cannot be hidden")
        } else badgeFlow.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS->hideMenuBadge()Z
                    move-result v0
                    if-eqz v0, :show_badge
                    sget-object v0, ${unit.definingClass}->${unit.name}:${unit.type}
                    return-object v0
                """,
                ExternalLabel("show_badge", getInstruction(0))
            )
        }

        keepBarsShown()
    }
}

@Suppress("unused")
val mediaOptionsPatch = bytecodePatch(
    name = "Media options",
    description = "Adds switches in Settings > Morphe, off until turned on, to turn captions on by default, open " +
            "older posts' media links in a player, and show media Reddit marks with a caution without the blur.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(keywordFilterSettingsPatch)

    finalize {
        enableFeature("media")
        captionsOnByDefault()
        mediaLinksInApp()
        nsfwBlurSwitch()
    }
}

/**
 * Moves the "Morphe" row of Reddit's settings from About to General, right under Account settings (order 0 in
 * General). The row's class sets its section, order, and key in its constructor; each return of the constructor
 * gets a check of the key, since the class also builds the user agreement row.
 */
/** Morphe Patches' About dialog, whose page gets this bundle's section (author and source code). */
private const val MORPHE_ABOUT_PREFERENCE =
    "Lapp/morphe/extension/shared/settings/preference/about/MorpheAboutPreference;"

private fun app.morphe.patcher.patch.BytecodePatchContext.addAboutSection() {
    val method = mutableClassDefByOrNull(MORPHE_ABOUT_PREFERENCE)?.methods?.firstOrNull {
        it.name == "createDialogHtml" && it.returnType == "Ljava/lang/String;"
    }
    if (method == null) {
        Logger.getLogger("HideKeywordContentPatch").warning("Morphe's About dialog is missing; its credit section is left out.")
        return
    }
    method.hookReturns(
        Opcode.RETURN_OBJECT,
        """
            invoke-static { {reg} }, $EXTENSION_CLASS->aboutHtml(Ljava/lang/String;)Ljava/lang/String;
            move-result-object {reg}
        """
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.moveMorpheRow() {
    val found = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { classDef ->
        if (classDef.fields.none { it.type == USER_SETTINGS_SECTION && !AccessFlags.STATIC.isSet(it.accessFlags) }) {
            return@classDefForEach
        }
        val init = classDef.methods.firstOrNull { it.name == "<init>" } ?: return@classDefForEach
        if (init.implementation?.instructions?.any { it.getReference<StringReference>()?.string == MORPHE_ROW_KEY } == true) {
            found.add(classDef)
        }
    }
    val row = found.singleOrNull()?.let { mutableClassDefBy(it) }
    val init = row?.methods?.firstOrNull { method ->
        method.name == "<init>" && method.instructions.any { it.getReference<StringReference>()?.string == MORPHE_ROW_KEY }
    }
    val sectionField = row?.fields?.firstOrNull { it.type == USER_SETTINGS_SECTION && !AccessFlags.STATIC.isSet(it.accessFlags) }
    // The key field is the one the key string is stored to; the order field is the one getOrder() reads.
    val keyField = init?.let { method ->
        val keyIndex = method.instructions.indexOfFirst { it.getReference<StringReference>()?.string == MORPHE_ROW_KEY }
        method.instructions.drop(keyIndex + 1).firstOrNull { it.opcode == Opcode.IPUT_OBJECT }
            ?.getReference<FieldReference>()
    }
    val orderField = row?.methods?.firstOrNull { it.name == "getOrder" && it.returnType == "I" }
        ?.instructions?.lastOrNull { it.opcode == Opcode.IGET }?.getReference<FieldReference>()
    if (init == null || sectionField == null || keyField == null || orderField == null || init.parameterTypes.size < 2) {
        logger.warning("Could not find the Morphe row of Reddit's settings (found ${found.size} candidates); it stays in About")
        return
    }
    val section = "${row.type}->${sectionField.name}:$USER_SETTINGS_SECTION"
    val key = "${row.type}->${keyField.name}:Ljava/lang/String;"
    val order = "${row.type}->${orderField.name}:I"
    init.apply {
        instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
            .reversed()
            .forEach { index ->
                addInstructionsWithLabels(
                    index,
                    """
                        iget-object p1, p0, $key
                        const-string p2, "$MORPHE_ROW_KEY"
                        invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result p1
                        if-eqz p1, :keep_section
                        sget-object p1, $USER_SETTINGS_SECTION->General:$USER_SETTINGS_SECTION
                        iput-object p1, p0, $section
                        const/4 p1, 0x1
                        iput p1, p0, $order
                        :keep_section
                        nop
                    """
                )
            }
    }
}

/** The step of a feed's link tap which opens the post's link, given the context, the link, and the tap event. */
private const val LINK_OPEN_STEP =
    "Lcom/reddit/feeds/impl/ui/actions/OnClickPostLinkEventHandler\$handleEvent\$5;"

/**
 * Plays the media of a link post (imgur, Streamable, RedGIFs, and others) inside Reddit: the step opening a feed
 * post's link first asks the extension, which opens its player and ends the step when the link is media.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.mediaLinksInApp() {
    val step = mutableClassDefByOrNull(LINK_OPEN_STEP)
    val method = step?.methods?.firstOrNull { it.name == "invokeSuspend" && it.implementation != null }
    val unit = method?.instructions?.firstOrNull {
        it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>()?.type == "Lkotlin/Unit;"
    }?.getReference<FieldReference>()
    if (method == null || unit == null || method.implementation!!.registerCount - method.parameters.size - 1 < 1) {
        logger.warning("Could not find the step opening a post's link; media links open in the browser")
        return
    }
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0 }, $EXTENSION_CLASS->onLinkClick(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :open_link
            sget-object v0, Lkotlin/Unit;->${unit.name}:Lkotlin/Unit;
            return-object v0
            :open_link
            nop
        """
    )
    logger.info("Media links: hooked the step opening a post's link")
}

/** The local key of the blur-mature-media setting, read in the preference repository beside the account's own. */
private const val NSFW_BLUR_KEY = "nsfw_blur_enabled"

/**
 * Lets the extension turn off the 18+ blur: each read of the blur-mature-media setting, the local key for a
 * logged-out session and the account's getNoProfanity() otherwise, passes its result through the extension.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.nsfwBlurSwitch() {
    var total = 0
    val found = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lio/github/bryceaspringfield/") || classDef.type.startsWith("Lapp/morphe/")) return@classDefForEach
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any {
                    it.getReference<StringReference>()?.string == NSFW_BLUR_KEY ||
                            it.getReference<MethodReference>()?.let { m -> m.name == "getNoProfanity" && m.returnType == "Z" } == true
                } == true
            }) found.add(classDef)
    }
    found.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            if (method.implementation == null || method.name == "getNoProfanity") return@forEach
            val list = method.instructions.toList()
            val calls = list.indices.mapNotNull { i ->
                val instruction = list[i]
                val reference = instruction.getReference<MethodReference>()
                val call = when {
                    reference?.name == "getNoProfanity" && reference.returnType == "Z" -> i
                    instruction.getReference<StringReference>()?.string == NSFW_BLUR_KEY -> {
                        val register = (instruction as OneRegisterInstruction).registerA
                        (i + 1 until minOf(i + 8, list.size)).firstOrNull { j ->
                            val it = list[j]
                            it is FiveRegisterInstruction && it.getReference<MethodReference>()?.returnType == "Z" &&
                                    it.registerCount >= 2 && it.registerD == register
                        }
                    }
                    else -> null
                }
                call?.takeIf { list.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT }
            }.distinct().sortedDescending()
            calls.forEach { call ->
                val result = (list[call + 1] as OneRegisterInstruction).registerA
                method.addInstructions(
                    call + 2,
                    """
                        invoke-static/range { v$result .. v$result }, $EXTENSION_CLASS->blurNsfw(Z)Z
                        move-result v$result
                    """
                )
            }
            total += calls.size
        }
    }
    if (total == 0) logger.warning("Could not find the blur-mature-media reads; the 18+ caution stays")
    else logger.info("18+ caution: hooked $total reads in ${found.size} classes")
}

/**
 * Turns video captions on by default: each read of Reddit's stored captions switch (a boolean preference under the
 * key below) goes through the extension, and each store of the switch first tells the extension the user chose.
 */
private const val CAPTIONS_KEY = "captions_preferences_captions_enabled"

private fun app.morphe.patcher.patch.BytecodePatchContext.captionsOnByDefault() {
    val found = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.getReference<StringReference>()?.string == CAPTIONS_KEY } == true
            }) found.add(classDef)
    }
    var reads = 0
    var stores = 0
    found.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            if (method.implementation == null) return@forEach
            val list = method.instructions.toList()
            val keys = list.withIndex().filter { it.value.getReference<StringReference>()?.string == CAPTIONS_KEY }
            // Hooks are added from the last instruction back, keeping earlier indexes valid.
            keys.map { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                val call = (index + 1 until minOf(index + 8, list.size)).firstOrNull { i ->
                    val it = list[i]
                    it is FiveRegisterInstruction && it.getReference<MethodReference>() != null &&
                            it.registerCount >= 2 && it.registerD == register
                }
                index to call
            }.filter { it.second != null }.sortedByDescending { it.second }.forEach { (_, call) ->
                val reference = list[call!!].getReference<MethodReference>()!!
                when {
                    reference.returnType == "Z" && list.getOrNull(call + 1)?.opcode == Opcode.MOVE_RESULT -> {
                        val result = (list[call + 1] as OneRegisterInstruction).registerA
                        method.addInstructions(
                            call + 2,
                            """
                                invoke-static/range { v$result .. v$result }, $EXTENSION_CLASS->captionsEnabled(Z)Z
                                move-result v$result
                            """
                        )
                        reads++
                    }
                    reference.returnType == "V" -> {
                        method.addInstruction(call, "invoke-static { }, $EXTENSION_CLASS->captionsChanged()V")
                        stores++
                    }
                }
            }
        }
    }
    logger.info("Captions switch: hooked $reads reads and $stores stores in ${found.size} classes")
}

/**
 * Keeps the home screen's top bar and the bottom bar shown while a feed scrolls: every screen told the bars' expanded
 * fraction (the bottom bar, the home pager, and the screens they pass it to) gets 1, fully shown, when the setting is
 * on. The screens implement a one-method interface taking the fraction, found among BottomNavScreen's interfaces.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.keepBarsShown() {
    val bottomNav = classDefByOrNull(BOTTOM_NAV_SCREEN)
    val listener = bottomNav?.interfaces?.firstOrNull { name ->
        classDefByOrNull(name)?.methods?.toList()?.let { methods ->
            methods.size == 1 && methods[0].returnType == "V" && methods[0].parameterTypes.map { it.toString() } == listOf("F")
        } == true
    }
    val methodName = listener?.let { classDefByOrNull(it)?.methods?.first()?.name }
    if (listener == null || methodName == null) {
        logger.warning("Could not find the bars' expanded-fraction listener; the bars still hide on scroll")
        return
    }
    val implementers = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { classDef -> if (listener in classDef.interfaces) implementers.add(classDef) }
    var hooked = 0
    implementers.forEach { classDef ->
        val method = mutableClassDefBy(classDef).methods.firstOrNull {
            it.name == methodName && it.returnType == "V" && it.parameterTypes.map { t -> t.toString() } == listOf("F") &&
                    it.implementation != null
        } ?: return@forEach
        method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->barsExpandedFraction(F)F
                move-result p1
            """
        )
        hooked++
    }
    logger.info("Bars kept shown on scroll: hooked $hooked of ${implementers.size} screens of $listener")
}
