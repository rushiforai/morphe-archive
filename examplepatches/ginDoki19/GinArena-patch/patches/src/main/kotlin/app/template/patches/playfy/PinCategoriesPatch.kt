package app.template.patches.playfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYFY_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Playfy TV 1.7 — pin categories to the top of the Category section, at runtime, from the app.
 *
 * Long-press a category card (press-and-hold OK on a TV, long-press with a finger on a phone) and
 * a small dialog offers Pin / Unpin. Pinned categories sort to the top and stay there after a
 * restart. Nothing moves until the user pins something.
 *
 * On Android TV the same menu reorders: Arrange first (keeps the remote on one card until the user
 * finishes), then Move to top, then left and right one place, then up and down one whole row.
 * On a phone the same menu offers Move left, Move right, Move to top and Unpin, one place at a
 * time; there is no Arrange there, because arrange-by-gesture could not be made dependable on a
 * handset and was dropped on purpose. No swipe reorders anything on either device. The split
 * follows the input in use (see Pins.remoteInput), not the device model.
 *
 * The row width the up/down entries use is measured from the laid-out grid, with the app's own
 * 8-or-4 column rule as the fallback. It is never assumed to be one: a one-place "row" is the
 * defect the tester reported on the previous build.
 *
 * The logic lives in the bundled extension `extensions/playfy.mpe`
 * (`app.template.extension.playfy.Pins`) so that only four one-call hooks go into the app's dex:
 *
 *   1. App.onCreate()                      -> Pins.init(Context)          load saved ids
 *   2. nd.e.S(List) before submitList      -> Pins.onSubmit(Object,List)  sort a copy
 *   3. gd.c.d(...) after the binding read  -> Pins.bindRow(Object,Object) long-press + row info
 *   4. gd.c.d(...) after the app's setText -> Pins.decorate(View)         draw the pin marker
 *
 * Every hook passes registers that already hold the needed values, so no scratch register and no
 * injected label is required — that is what keeps the verifier happy.
 *
 * Anchors are checked against the exact build (package 1.7 / versionCode 8) and every hook fails
 * loudly with a named anchor rather than patching a guess.
 */
private const val PINS = "app/template/extension/playfy/Pins"

/**
 * Refuse to apply this patch to an APK that already carries it.
 *
 * Every hook below calls into `Pins`, a descriptor that cannot appear in one of these apps before
 * the patch has run. So one match is proof the work is already done - and because the patch writes
 * at a fixed offset in a fixed method, a second run would insert the same call again rather than
 * noticing. That double injection does not break the app (`init` is guarded, `useProfile` is
 * idempotent), but handing out a silently doubled APK is worse than refusing.
 *
 * Applying *different* patches to an already-patched APK is unaffected and stays supported.
 */
private fun checkNotAlreadyPatched(method: com.android.tools.smali.dexlib2.iface.Method) {
    val already = method.implementation?.instructions?.any { insn ->
        (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference
            ?.let { it is com.android.tools.smali.dexlib2.iface.reference.MethodReference && it.definingClass == "L$PINS;" }
            ?: false
    } ?: false
    check(!already) {
        "This APK already has the category pinning patch applied. Patching it again would insert " +
            "the same hooks a second time. Patch the stock APK instead, or apply a different patch."
    }
}

/** Application entry point; the only `onCreate` in `com.playfy.tv.App`. */
private object PlayfyAppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/playfy/tv/App;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * The shared "hand a list to the adapter" helper in the fragment base class.
 * Single definition in the dex, two callers, both in `cf.n`; Settings submits directly instead,
 * so this is safe to hook — and the extension additionally only touches lists of `kd.i`.
 */
private object PlayfySetItemsFingerprint : Fingerprint(
    definingClass = "Lnd/e;",
    name = "S",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

/**
 * `Lgd/c;` is the Category adapter (a `Lw4/e0` ListAdapter). The class MUST be pinned here:
 * `d(Lw4/i1;I)V` is defined by THIRTEEN different classes in this dex, so a fingerprint without
 * `definingClass` could land on any of them - including `Lgd/s;`, which `nd.e.S` also mentions.
 */
private object PlayfyCategoryBindFingerprint : Fingerprint(
    definingClass = "Lgd/c;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lw4/i1;", "I"),
)

private object PlayfyListAdapterSubmitFingerprint : Fingerprint(
    definingClass = "Lw4/e0;",
    name = "i",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

private object PlayfyListAdapterGetItemFingerprint : Fingerprint(
    definingClass = "Lw4/e0;",
    name = "h",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("I"),
)

private object PlayfyDifferSubmitFingerprint : Fingerprint(
    definingClass = "Lw4/e;",
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Ljava/lang/Runnable;"),
)

private object PlayfyLlmScrollToPosFingerprint : Fingerprint(
    definingClass = "Landroidx/recyclerview/widget/LinearLayoutManager;",
    name = "p0",
    returnType = "V",
    parameters = listOf("I"),
)

private fun ReferenceInstruction.methodRef() = reference as? MethodReference
private fun ReferenceInstruction.fieldRef() = reference as? FieldReference

@Suppress("unused")
val pinCategoriesPatch = bytecodePatch(
    name = "Pin favourite categories to the top",
    description = "Long-press a category to pin it to the top of the Category list. " +
        "Long-press a pinned category to reorder it. On Android TV the menu offers Arrange to move " +
        "several in one go, Move to top, Move left and Move right one place, and Move up and Move " +
        "down a whole row. On a phone it offers Move left, Move right, Move to top and Unpin, one " +
        "place at a time. The order you choose is the order you get, and it survives a restart. " +
        "Nothing moves until you pin something.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_PLAYFY_TV)
    extendWith("extensions/playfy.mpe")

    execute {
        check(
            packageMetadata.packageName == "com.playfy.tv" &&
                packageMetadata.versionName == "1.7" &&
                packageMetadata.versionCode == "8"
        ) { "Unsupported Playfy build for the category pinning patch." }

        // ---- 0. refuse a second application -----------------------------------------------
        // This patch inserts at a fixed offset, so it cannot tell an unpatched method from one it
        // has already patched: running it twice would inject PLAYFY twice into the same method and
        // put two copies of the extension in the APK. Nothing breaks at runtime - `init` is
        // guarded and `useProfile` is idempotent - but a silently doubled APK is not something to
        // hand out. The hook call is the evidence: it only exists if this patch (or a bundle
        // carrying it) has already run. Refuse loudly instead.
        //
        // Applying DIFFERENT patches to an already-patched APK is fine and stays supported; only
        // re-applying THIS one is refused.
        val onCreate = PlayfyAppCreateFingerprint.method
        checkNotAlreadyPatched(onCreate)

        // Verify the AsyncListDiffer + LinearLayoutManager anchor names expected by
        // Pins.enablePlayfyDifferAnchor() so a different build fails loudly instead of guessing.
        val adapterSubmitInsns = PlayfyListAdapterSubmitFingerprint.method.instructions.toList()
        val hasDifferField = adapterSubmitInsns.any { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            f != null && f.definingClass == "Lw4/e0;" && f.name == "A" && f.type == "Lw4/e;"
        }
        val hasDifferSubmit = adapterSubmitInsns.any { i ->
            val m = (i as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Lw4/e;" && m.name == "b" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;", "Ljava/lang/Runnable;")
        }
        check(hasDifferField && hasDifferSubmit) {
            "Unexpected Lw4/e0;->i(List) shape; refusing to patch."
        }
        val hasDifferList = PlayfyListAdapterGetItemFingerprint.method.instructions.any { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            f != null && f.definingClass == "Lw4/e;" && f.name == "f" && f.type == "Ljava/util/List;"
        }
        val hasDifferRawList = PlayfyDifferSubmitFingerprint.method.instructions.any { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            f != null && f.definingClass == "Lw4/e;" && f.name == "e" && f.type == "Ljava/util/List;"
        }
        check(hasDifferList && hasDifferRawList) { "Unexpected Lw4/e0/Lw4/e shape; refusing to patch." }
        val llmScrollInsns = PlayfyLlmScrollToPosFingerprint.method.instructions.toList()
        val hasLlmPos = llmScrollInsns.any { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            i.opcode == Opcode.IPUT && f != null &&
                f.definingClass == "Landroidx/recyclerview/widget/LinearLayoutManager;" &&
                f.name == "x" && f.type == "I"
        }
        val hasLlmOff = llmScrollInsns.any { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            i.opcode == Opcode.IPUT && f != null &&
                f.definingClass == "Landroidx/recyclerview/widget/LinearLayoutManager;" &&
                f.name == "y" && f.type == "I"
        }
        val hasLlmState = llmScrollInsns.any { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            f != null && f.definingClass == "Landroidx/recyclerview/widget/LinearLayoutManager;" &&
                f.name == "z" && f.type == "Lw4/b0;"
        }
        check(hasLlmPos && hasLlmOff && hasLlmState) {
            "Unexpected LinearLayoutManager;->p0(I) anchor fields; refusing to patch."
        }

        // ---- 1. load the saved pins before any screen exists -------------------------------
        onCreate.addInstructions(
            0,
            """
                invoke-static {p0}, L$PINS;->init(Landroid/content/Context;)V
                invoke-static {}, L$PINS;->enablePlayfyDifferAnchor()V
            """.trimIndent(),
        )

        // ---- 2. sort a copy just before it reaches the ListAdapter -------------------------
        val setItems = PlayfySetItemsFingerprint.method
        val items = setItems.instructions.toList()
        val submitIndices = items.indices.filter { i ->
            val m = (items[i] as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Lw4/e0;" && m.name == "i" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
        }
        check(submitIndices.size == 2) {
            "Expected two submitList calls in nd.e.S(List), found ${submitIndices.size}."
        }
        val submitIdx = submitIndices.firstOrNull { i ->
            i > 0 && items[i - 1].opcode == Opcode.CHECK_CAST
        } ?: error("Could not find the direct submitList (no check-cast before it); refusing to patch.")
        setItems.replaceInstruction(
            submitIdx,
            "invoke-static {v0, p1}, L$PINS;->submitWithAnchor(Ljava/lang/Object;Ljava/util/List;)V",
        )
        setItems.addInstructions(
            submitIdx,
            """
                invoke-static {v0, p1}, L$PINS;->onSubmit(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """.trimIndent(),
        )

        // ---- 3 + 4. the category row ------------------------------------------------------
        val bind = PlayfyCategoryBindFingerprint.method
        val insns = bind.instructions.toList()

        // 3: right after `iget-object p1, p1, Lgd/b;->u:Lcom/playfy/tv/databinding/CatItemBinding;`
        //    -> p1 = the binding, p2 = the kd.i item. Both are live here.
        val bindingIdx = insns.indexOfFirst { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            f != null && f.definingClass == "Lgd/b;" && f.name == "u" &&
                f.type == "Lcom/playfy/tv/databinding/CatItemBinding;"
        }
        check(bindingIdx >= 0) { "Could not find the category binding read in Lgd/c;->d; refusing to patch." }

        // 4: the app's own `setText` for the CATEGORY title, identified by what feeds it.
        //
        // BUGFIX: the first `TextView->setText` in this method (index 13) belongs to the SETTINGS
        // branch. Selecting it and asserting "after the binding read" aborted the patch on the
        // real build. Anchor on intent instead: a setText whose argument was just read from
        // `Lkd/i;->b` (the category title field), after the category branch starts.
        val setTextIdx = insns.indices.firstOrNull { i ->
            if (i <= bindingIdx) return@firstOrNull false
            val m = (insns[i] as? ReferenceInstruction)?.methodRef()
            val feedsTitle = (insns.getOrNull(i - 1) as? ReferenceInstruction)?.fieldRef()?.let { f ->
                f.definingClass == "Lkd/i;" && f.name == "b" && f.type == "Ljava/lang/String;"
            } ?: false
            m != null && m.definingClass == "Landroid/widget/TextView;" && m.name == "setText" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;") && feedsTitle
        }
        check(setTextIdx != null) {
            "Could not find the category title setText (a setText fed by Lkd/i->b after the " +
                "category binding read); refusing to patch."
        }

        // Insert the later hook first so the earlier index stays valid.
        bind.addInstructions(
            setTextIdx!! + 1,
            "invoke-static {p1}, L$PINS;->decorate(Landroid/view/View;)V",
        )
        bind.addInstructions(
            bindingIdx + 1,
            "invoke-static {p1, p2}, L$PINS;->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
