package app.onlynazril.patches.tiktok.feedfilter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import app.morphe.util.implementationOrPatchException
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** The field types that hold the list itself, not the contract the model reads it through. */
private val COLLECTION_TYPES = setOf(
    "Ljava/util/List;",
    "Ljava/util/Collection;",
    "Ljava/util/ArrayList;",
    "Ljava/util/LinkedList;",
)

/**
 * Drops ads, survey cards, LIVE items, drama videos and out-of-range videos from the feed page.
 *
 * Two hooks, both before an item can reach a list the pager counts:
 *
 *  1. the fetch's return: the full filter, after the app has merged its preloaded ads into the page.
 *     A one-item page is filtered like any other, because the page TikTok shows at launch is
 *     exactly one item and exempting it left that video on screen regardless of the switches;
 *  2. \`FeedItemList#setItems\` and \`#clone\`: the **ad filter only**. The generic page model is
 *     shared with the profile, search and repost lists, where a count range would hide the profile
 *     owner's own posts.
 *
 * The panel's insert callback and the direct survey insert handle the card paths that never touch
 * the page.
 *
 * Nothing is wrapped and nothing is removed after it has entered a list: that shift positions the
 * pager holds, and refusing the last item empties the feed, which the app draws as its own error
 * view. The docs keep both attempts for the next reader.
 */
@Suppress("unused")
val tiktokFeedFilterPatch = bytecodePatch(
    name = "Feed filter",
    description = "Removes ads, promotional-music posts, survey cards, LIVE items, drama videos, " +
        "and videos outside a view- or like-count range from the feed. Each part has a switch in " +
        "Tweaks; ads are on by default, survey, LIVE and drama are off.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        // The page's entry to the presenter: the one point every page passes before it is copied
        // into a list, and the only place the full filter runs. The fetch return is not used: its
        // hook never fired on 47.9.3 (zero lines in every session).
        //
        // It is scoped to the **home** presenter, and that is the whole reason for the shape below.
        // Hooking the shared base class filtered every presenter in the app: the log showed another
        // screen (`X.0OKB`) losing every item of every page to the drama filter. The home presenter
        // is the class that carries the pager model's own methods (`getItems`, `getListCount`,
        // `insertItemList`, `setItems`); its `(FeedItemList) -> void` override is its own page entry,
        // so other presenters never reach this hook.
        var pageHooks = 0
        classDefForEach { classDef ->
            val names = classDef.methods.map { it.name }.toSet()
            if (!names.containsAll(PAGER_MODEL_METHODS)) return@classDefForEach
            val handler = classDef.methods.firstOrNull { method ->
                method.name == "handleData" &&
                    method.parameterTypes == listOf("Ljava/lang/Object;") &&
                    method.implementation != null
            } ?: return@classDefForEach
            mutableClassDefBy(classDef).findMutableMethodOf(handler).addInstructions(
                0,
                // `handleData` has no spare local: its regs=2 means v0 is `this`. p1 is v1 here,
                // so it goes straight into the invoke. Moving it into v0 clobbered the receiver.
                "invoke-static {p1}, $FEED_FILTER_CLASS->filterPage(Ljava/lang/Object;)V",
            )
            pageHooks++
        }
        if (pageHooks != 1) {
            throw PatchException(
                "Feed filter: expected one home page entry, found $pageHooks.",
            )
        }

        // Ads are the one thing a page hook cannot cover. An ad can be added straight into a list's
        // `ArrayList`, and the profile feed does exactly that: the log shows the ad rendered with no
        // page or setter line before it. Every storage that takes a list, and the adapter model
        // behind it, is wrapped at construction with an ads-only list. It refuses **ads only**: the
        // same storage backs the detail feed and a profile's own feed, where refusing a LIVE, drama
        // or out-of-range item drops the video the user just opened.
        val panel = classDefByOrNull(
            "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;",
        ) ?: throw PatchException("Feed filter: the feed panel was not found.")
        val adapter = panel.fields
            .mapNotNull { classDefByOrNull(it.type) }
            .firstOrNull { candidate ->
                candidate.methods.any {
                    it.name == "setData" && it.parameterTypes == listOf("Ljava/util/List;")
                } &&
                    candidate.methods.any { it.name == "getCount" && it.parameterTypes.isEmpty() } &&
                    candidate.methods.any { it.name == "getItem" && it.parameterTypes == listOf("I") }
            } ?: throw PatchException("Feed filter: the feed adapter was not found.")
        val adapterModel = adapter.fields
            .mapNotNull { classDefByOrNull(it.type) }
            .firstOrNull { candidate ->
                candidate.fields.any { it.type == "Ljava/util/ArrayList;" } &&
                    candidate.methods.any {
                        it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty()
                    }
            } ?: throw PatchException("Feed filter: the adapter's item list was not found.")

        var wrapped = 0
        for (target in listOf(adapterModel)) {
            val mutableTarget = mutableClassDefBy(target)
            for (method in target.methods) {
                if (method.name != "<init>" || method.implementation == null) continue
                val mutableInit = mutableTarget.findMutableMethodOf(method)
                val returns = mutableInit.implementation
                    ?.instructions
                    ?.withIndex()
                    ?.filter { it.value.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID }
                    ?.map { it.index }
                    ?.sortedDescending()
                    ?: emptyList()
                for (index in returns) {
                    mutableInit.addInstructions(
                        index,
                        "invoke-static {p0}, $FEED_FILTER_CLASS->wrapStorage(Ljava/lang/Object;)V",
                    )
                }
                wrapped++
            }
        }
        if (wrapped == 0) {
            throw PatchException("Feed filter: the adapter list has no constructor to wrap.")
        }

        // The generic page model is shared with the profile, search and repost lists. Only the ad
        // filter is safe there: a like/view range would drop the profile owner's own posts, but an
        // item marked as an ad is not wanted on any surface.
        val setItems = FeedItemListSetItemsFingerprint.methodOrNull
            ?: throw PatchException("Feed filter: FeedItemList#setItems was not found.")
        setItems.addInstructions(
            0,
            "invoke-static {p1}, $FEED_FILTER_CLASS->filterGenericSet(Ljava/lang/Object;)V",
        )

        val clone = FeedItemListCloneFingerprint.methodOrNull
            ?: throw PatchException("Feed filter: FeedItemList#clone was not found.")
        clone.filterOnReturns("filterGenericClone")

        // The feed panel's insert callback. The ad path in the detail feed does not touch
        // `FeedItemList` or the pager storage; it inserts the ad through `DataLayerAbility`, which
        // ends here with a bare list. `p3` is that list, replaced with a copy without ads.
        val insert = FeedPanelInsertFingerprint.methodOrNull
            ?: throw PatchException("Feed filter: the feed panel's insert callback was not found.")
        insert.addInstructions(
            0,
            "invoke-static {p2, p3}, $FEED_FILTER_CLASS->filterInsertList(" +
                "Ljava/lang/String;Ljava/util/List;)Ljava/util/List;\n" +
                "move-result-object p3",
        )

        // The direct survey-card insert does not pass through the callback above. Skip the whole
        // method when the switch is on; the card is not an item the feed should carry.
        FeedPanelSurveyFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static {}, $FEED_FILTER_CLASS->isSurveyEnabled()Z\n" +
                "move-result v0\n" +
                "if-eqz v0, :onlynazril_survey_keep\n" +
                "return-void\n" +
                ":onlynazril_survey_keep",
        )

    }
}

/** Runs the filter just before every object return, so a caller never receives an unfiltered list. */
private fun MutableMethod.filterOnReturns(entry: String) {
    val returns = implementationOrPatchException("Feed filter").instructions
        .withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }
    if (returns.isEmpty()) {
        throw PatchException(
            "Feed filter: ${definingClass}->${name} returns no object to filter.",
        )
    }

    // Highest index first: inserting shifts every index above it.
    for ((index, register) in returns.sortedByDescending { it.first }) {
        addInstructions(index, filterCall(register, entry))
    }
}

/**
 * The call, in whichever form reaches the register: a plain invoke names four bits, and a return
 * register above v15 needs the ranged form. The entry point is named per hook, so the log says which
 * one is talking.
 */
private fun filterCall(register: Int, entry: String): String =
    if (register <= 15) {
        "invoke-static { v$register }, $FEED_FILTER_CLASS->$entry(Ljava/lang/Object;)V"
    } else {
        "invoke-static/range { v$register .. v$register }, " +
            "$FEED_FILTER_CLASS->$entry(Ljava/lang/Object;)V"
    }
