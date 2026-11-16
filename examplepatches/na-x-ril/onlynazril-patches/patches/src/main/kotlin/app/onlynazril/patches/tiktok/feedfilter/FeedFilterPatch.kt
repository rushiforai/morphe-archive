package app.onlynazril.patches.tiktok.feedfilter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findMutableMethodOf
import app.morphe.util.implementationOrPatchException
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Drops ads, survey cards, LIVE items, drama videos and out-of-range videos from the feed page.
 *
 * Six hooks, scoped by what the list is allowed to remove:
 *
 *  1. the fetch's return: full filter, after the app has merged its preloaded ads into the page;
 *  2. `FeedItemList#setItems`: the generic page model, shared with the profile, search and repost
 *     lists, so **ads only**; a count, LIVE or drama filter would hide the profile owner's own posts;
 *  3. `FeedItemList#clone`: the same ad-only filter for the copy;
 *  4. the feed panel's insert callback: ads, survey cards, LIVE cards and drama cards, selected by
 *     the batch's source string;
 *  5. the direct survey-card insert on the same panel: skipped when the survey switch is on;
 *  6. the pager item model's storage, where the list the feed renders is taking items in: full
 *     filter. The storage's live `ArrayList`, and the adapter model's list behind it, are wrapped
 *     separately to refuse a direct ad; that wrapper is ads-only because the same list is rebuilt
 *     for the detail feed and a profile's video list.
 *
 * The extension reads its own switches, so a build with everything off pays six calls per page.
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
        val matches = FeedApiFetchFingerprint.matchAllOrNull() ?: emptyList()
        if (matches.size != 1) {
            throw PatchException(
                "Feed filter: expected one implementation of $I_FEED_API#fetchFeedList, " +
                    "found ${matches.size}.",
            )
        }
        matches.single().method.filterOnReturns("filterFetch")

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

        // The pager's own item model , the list the feed renders from, behind the fetched page.
        //
        // Filtering where items are *taken in* was tried and did nothing: the two hooks fired but
        // never removed anything, and the page kept rebuilding from this model. So the filter goes
        // where the pager *reads* the list instead , the model's own accessor, which returns the
        // live list (`X.07zq#getItems` → `X.07sw#getList` on 47.0.3), so a removal changes what the
        // next read sees rather than a copy that is replaced.
        val models = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            // One pass, no set allocated per class, and an early exit as soon as the
            // four names and the taking method have been seen: the pager's class has
            // hundreds of methods, and most classes have none of these.
            var hasGetItems = false
            var hasCount = false
            var hasInsert = false
            var hasSet = false
            var takesItems = false
            for (method in classDef.methods) {
                when (method.name) {
                    PAGER_MODEL_GET_ITEMS -> hasGetItems = true
                    PAGER_MODEL_GET_COUNT -> hasCount = true
                    PAGER_MODEL_SET -> hasSet = true
                    PAGER_MODEL_INSERT -> {
                        hasInsert = true
                        if (!takesItems &&
                            method.parameterTypes.size == 2 &&
                            method.implementation != null
                        ) {
                            takesItems = true
                        }
                    }
                }
                if (hasGetItems && hasCount && hasInsert && hasSet && takesItems) break
            }
            if (hasGetItems && hasCount && hasInsert && hasSet && takesItems) models += classDef
        }

        // The contract, and any base class above it, carries the same method names. The pager holds
        // the most derived one, so the base classes are those that appear in another candidate's
        // superclass chain and are dropped.
        fun supertypesOf(classDef: ClassDef): List<String> {
            val chain = mutableListOf<String>()
            var current = classDef.superclass?.let { classDefByOrNull(it) }
            var guard = 0
            while (current != null && guard++ < 32) {
                chain += current.type
                current = current.superclass?.let { classDefByOrNull(it) }
            }
            return chain
        }

        val mostDerived = models.filter { candidate ->
            models.none { other -> other != candidate && supertypesOf(other).contains(candidate.type) }
        }
        val model = mostDerived.singleOrNull()
            ?: throw PatchException(
                "Feed filter: expected one pager item model carrying $PAGER_MODEL_METHODS, found " +
                    "${models.joinToString { it.type }}, of which ${mostDerived.size} are most derived.",
            )

        val mutableModel = mutableClassDefBy(model)
        if (model.methods.none { it.name == "getItems" && it.returnType == "Ljava/util/List;" }) {
            throw PatchException("Feed filter: ${model.type} exposes no item list to read.")
        }

        // The list's own storage, behind the contract the model reads through.
        //
        // Filtering the *read* was tried and is wrong: the pager counts the list it is handed, so a
        // shorter list shifts its positions, and it runs to "No more results" while items remain. The
        // filter belongs where items enter the storage instead, as if the page had never carried
        // them , nothing is ever removed under a position the pager already has.
        //
        // The contract is named by the model itself: its `getItems` calls exactly one method, and
        // that method's owner is the contract , no obfuscated name has to be written down.
        val contract = model.methods
            .singleOrNull { it.name == "getItems" && it.returnType == "Ljava/util/List;" }
            ?.implementationOrPatchException("Feed filter")
            ?.instructions
            ?.mapNotNull { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass
            }
            ?.distinct()
            ?.singleOrNull()
            ?: throw PatchException(
                "Feed filter: ${model.type} reads its list through more than one owner.",
            )

        val stores = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            val holds = classDef.interfaces.contains(contract) &&
                classDef.methods.any { method ->
                    method.name == "setData" &&
                        method.parameterTypes == listOf("Ljava/util/List;") &&
                        method.implementation != null
                }
            if (holds) stores += classDef
        }
        if (stores.isEmpty()) {
            throw PatchException("Feed filter: no storage behind $contract takes a list.")
        }

        var hooks = 0
        for (store in stores) {
            val mutableStore = mutableClassDefBy(store)
            for (method in store.methods) {
                // Every void method that takes a list adds items: the setter, the bulk add, and the
                // indexed insert. Filtering each is what keeps the storage from ever holding one.
                if (method.returnType != "V" || method.implementation == null) continue
                val index = method.parameterTypes.indexOf("Ljava/util/List;")
                if (index < 0) continue
                mutableStore.findMutableMethodOf(method).addInstructions(
                    0,
                    "invoke-static {p${index + 1}}, $FEED_FILTER_CLASS->filterStore(Ljava/lang/Object;)V",
                )
                hooks++
            }

            // The storage's own list, replaced at construction with one that refuses a direct ad.
            // This is the path the ad SDK uses without calling any of the methods above. Only ads
            // are refused: this storage is also rebuilt for the detail feed and a profile's video
            // list, where dropping the opened item leaves a black screen or the previous list.
            for (method in store.methods) {
                if (method.name != "<init>" || method.implementation == null) continue
                val mutableInit = mutableStore.findMutableMethodOf(method)
                val returns = mutableInit.implementation
                    ?.instructions
                    ?.withIndex()
                    ?.filter { it.value.opcode == Opcode.RETURN_VOID }
                    ?.map { it.index }
                    ?.sortedDescending()
                    ?: emptyList()
                for (index in returns) {
                    mutableInit.addInstructions(
                        index,
                        "invoke-static {p0}, $FEED_FILTER_CLASS->wrapStorage(Ljava/lang/Object;)V",
                    )
                }
            }
        }
        if (hooks == 0) {
            throw PatchException("Feed filter: $contract stores take no list to filter.")
        }

        // The adapter's own item model, one step behind the panel: `X.09e6` (adapter) holds
        // `X.09gj`, whose `ArrayList` is what the pager binds from. Ads can be added there directly,
        // after the storage, so its constructor is wrapped the same way. This list is shared with
        // the detail feed, so the wrapper stays ads-only there too.
        val panel = classDefByOrNull(insert.definingClass)
        val adapter = panel?.fields
            ?.mapNotNull { classDefByOrNull(it.type) }
            ?.singleOrNull { candidate ->
                candidate.methods.any {
                    it.name == "setData" && it.parameterTypes == listOf("Ljava/util/List;")
                } &&
                    candidate.methods.any { it.name == "getCount" && it.parameterTypes.isEmpty() } &&
                    candidate.methods.any { it.name == "getItem" && it.parameterTypes == listOf("I") }
            }
        val adapterModel = adapter?.fields
            ?.mapNotNull { classDefByOrNull(it.type) }
            ?.singleOrNull { candidate ->
                candidate.fields.any { it.type == "Ljava/util/ArrayList;" } &&
                    candidate.methods.any {
                        it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty()
                    }
            }
        if (adapterModel != null) {
            val mutableModel = mutableClassDefBy(adapterModel)
            for (method in adapterModel.methods) {
                if (method.name != "<init>" || method.implementation == null) continue
                val mutableInit = mutableModel.findMutableMethodOf(method)
                val returns = mutableInit.implementation
                    ?.instructions
                    ?.withIndex()
                    ?.filter { it.value.opcode == Opcode.RETURN_VOID }
                    ?.map { it.index }
                    ?.sortedDescending()
                    ?: emptyList()
                for (index in returns) {
                    mutableInit.addInstructions(
                        index,
                        "invoke-static {p0}, $FEED_FILTER_CLASS->wrapStorage(Ljava/lang/Object;)V",
                    )
                }
            }
        }
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
