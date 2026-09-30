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
 * Drops ads and out-of-range videos from the feed page.
 *
 * Three hooks, because a page's `items` is written in three ways on 47.0.3 — the parse inside the
 * fetch, the setter, and `clone`. A filter with only the first looks correct and does nothing once
 * the app copies the page, which is what "the ad is still there" turns out to be.
 *
 *  1. the fetch's return, after the app has merged its preloaded ads into the page;
 *  2. `FeedItemList#setItems`, on entry, for every list stored as a page's items;
 *  3. `FeedItemList#clone`, before it returns, for the copy.
 *
 * The extension reads its own switches, so a build with everything off pays three calls per page.
 */
@Suppress("unused")
val tiktokFeedFilterPatch = bytecodePatch(
    name = "Feed filter",
    description = "Removes ads and promotional-music posts, and videos outside a view- or " +
        "like-count range, from the feed. Each part has a switch in Tweaks; ads are on by default.",
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

        // The list that is stored: filtered on entry, because that is the only moment the setter's
        // argument is in hand. `p0` is the page itself on an instance method, so there is no local to
        // borrow here and none is needed.
        val setItems = FeedItemListSetItemsFingerprint.methodOrNull
            ?: throw PatchException("Feed filter: FeedItemList#setItems was not found.")
        setItems.addInstructions(
            0,
            "invoke-static {p1}, $FEED_FILTER_CLASS->filterSet(Ljava/lang/Object;)V",
        )

        val clone = FeedItemListCloneFingerprint.methodOrNull
            ?: throw PatchException("Feed filter: FeedItemList#clone was not found.")
        clone.filterOnReturns("filterClone")

        // The pager's own item model — the list the feed renders from, behind the fetched page.
        //
        // Filtering where items are *taken in* was tried and did nothing: the two hooks fired but
        // never removed anything, and the page kept rebuilding from this model. So the filter goes
        // where the pager *reads* the list instead — the model's own accessor, which returns the
        // live list (`X.07zq#getItems` → `X.07sw#getList` on 47.0.3), so a removal changes what the
        // next read sees rather than a copy that is replaced.
        val models = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            val names = classDef.methods.map { it.name }.toSet()
            if (!names.containsAll(PAGER_MODEL_METHODS)) return@classDefForEach
            val takesItems = classDef.methods.any { method ->
                method.name == PAGER_MODEL_INSERT &&
                    method.parameterTypes.size == 2 &&
                    method.implementation != null
            }
            if (takesItems) models += classDef
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
        // shorter list shifts its positions and it runs to "No more results" while items remain. The
        // filter belongs where items enter the storage instead, as if the page had never carried
        // them — nothing is ever removed under a position the pager already has.
        //
        // The contract is named by the model itself: its `getItems` calls exactly one method, and
        // that method's owner is the contract — no obfuscated name has to be written down.
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
        }
        if (hooks == 0) {
            throw PatchException("Feed filter: $contract stores take no list to filter.")
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
