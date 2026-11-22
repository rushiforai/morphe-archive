package app.template.patches.cricz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.addInstructionsAfterSuperInit
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.COMPATIBILITY_CRICZ_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * CricZ TV 7.3 - pin categories to the top of the Category section, at runtime, from the app.
 *
 * Issue #52, ported from Playfy TV. Every anchor was read off THIS app's disassembly.
 *
 * Anchors, verified against CricZ TV 7.3 (versionCode 10),
 * sha256 74a8a13da7ab1865dc9e3bbb511fe82bb0f8c093fcf2404ac4a59ecdce44fb82:
 *
 *   1. App.onCreate()V                                     -> init(Context) + useProfile(3)
 *   2. g4.m.<init>(Context,FragmentManager,mc.b,ArrayList) -> seeAdapter(this)
 *   3. mc.c.W(JSONArray)  iput-object v0, p0, Lmc/c;->y0  -> onSubmitList(v0)
 *   4. mc.c.W(JSONArray)  iput-object v0, p1, Lg4/m;->g   -> onSubmitList(v0)
 *   5. mc.c.U(String)     iput-object v0, v1, Lg4/m;->g   -> onSubmitList(v0)   (the filter)
 *   6. hc.a.onClick(View) iput-object v3, v1, Lg4/m;->g   -> onSubmitList(v3)   (a second screen)
 *   7. g4.m.d(Lo4/z0;I)   the Lhc/b + Lpc/b branch        -> bindRow + decorate
 *
 * Why this is not a copy of the apps before it:
 *
 *   - `g4.m` is ONE class serving THREE screens. Each constructor writes a final synthetic field
 *     `d` and `d()` switches on it: 0 is a plain list of Lpc/d in holder Lhc/i, 1 is the category
 *     grid of Lpc/b in holder Lhc/b, 2 is a third screen. A hook anchored on a row shape instead of
 *     on that mode would decorate the wrong rows on the other two screens and nothing would crash.
 *     The row hooks below are therefore placed inside the branch whose two casts prove it.
 *   - The fragment does not keep one list: it reassigns the adapter's `g` field on every new list,
 *     from three places in mc.c plus one in hc.a. A sort applied once would be undone by the next
 *     filter, so each of the four writes is hooked. onSubmitList returns the list unchanged when
 *     nothing is pinned, so the cost at each is one class-name comparison.
 *   - Like PlayZ, there is no notifyDataSetChanged in this dex: the refresh is o4/c0.b().
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

private fun ReferenceInstruction.methodRef() = reference as? MethodReference
private fun ReferenceInstruction.fieldRef() = reference as? FieldReference

/**
 * The register holding the view a `setText` is called on.
 *
 * `invoke-virtual {vX, vY}, TextView->setText(CharSequence)` is a five-register instruction: vX is
 * the TextView (the receiver) and vY the text. Only the receiver is wanted, and only when the
 * instruction really is a five-register form; anything else is refused rather than guessed at.
 */
private fun receiverRegisterOf(instruction: Instruction): Int? {
    val five = instruction as? FiveRegisterInstruction ?: return null
    if (five.registerCount < 1) return null
    return five.registerC
}

/** Application entry point. */
private object CricZAppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/app/App;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * The category constructor of `g4.m`.
 *
 * The exact parameter list separates it from the class's other two constructors, which build the
 * other two screens.
 */
private object CricZCategoryAdapterInitFingerprint : Fingerprint(
    definingClass = "Lg4/m;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroidx/fragment/app/q0;",
        "Lmc/b;",
        "Ljava/util/ArrayList;",
    ),
)

/**
 * `mc.c.W(JSONArray)V` - the Categories fragment parses its payload, builds the list, stores it on
 * the fragment and hands the same list to the adapter. Both writes are hooked.
 */
private object CricZCategoriesPayloadFingerprint : Fingerprint(
    definingClass = "Lmc/c;",
    name = "W",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONArray;"),
    filters = listOf(
        string("cat"),
        string("visible"),
    ),
)

/** `mc.c.U(String)V` - the search filter: it builds a new list and gives it to the adapter. */
private object CricZFilterFingerprint : Fingerprint(
    definingClass = "Lmc/c;",
    name = "U",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * `hc.a.onClick(View)V` - a second screen that shows the same categories through the same adapter
 * and writes the fragment's list into it.
 */
private object CricZSecondScreenFingerprint : Fingerprint(
    definingClass = "Lhc/a;",
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

/**
 * `g4.m.d(Lo4/z0;I)V` - the row bind of all three modes.
 *
 * The mode is not taken from the switch: it is proven below by finding the branch that casts the
 * holder to Lhc/b and the model to Lpc/b, and the row hooks go inside that branch.
 */
private object CricZCategoryBindFingerprint : Fingerprint(
    definingClass = "Lg4/m;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lo4/z0;", "I"),
)

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
    compatibleWith(COMPATIBILITY_CRICZ_TV)
    extendWith("extensions/playfy.mpe")

    execute {
        sortCategoryWrites()
        check(
            packageMetadata.packageName == "com.pro.cricztv" &&
                packageMetadata.versionName == "7.3" &&
                packageMetadata.versionCode == "10"
        ) { "Unsupported CricZ TV build for the category pinning patch." }

        // ---- 0. refuse a second application -----------------------------------------------
        // This patch inserts at a fixed offset, so it cannot tell an unpatched method from one it
        // has already patched: running it twice would inject CRICZ twice into the same method and
        // put two copies of the extension in the APK. Nothing breaks at runtime - `init` is
        // guarded and `useProfile` is idempotent - but a silently doubled APK is not something to
        // hand out. The hook call is the evidence: it only exists if this patch (or a bundle
        // carrying it) has already run. Refuse loudly instead.
        //
        // Applying DIFFERENT patches to an already-patched APK is fine and stays supported; only
        // re-applying THIS one is refused.
        checkNotAlreadyPatched(CricZAppCreateFingerprint.method)


        // ---- 1. which app this is --------------------------------------------------------
        // App.onCreate declares two registers; this writes neither of them.
        CricZAppCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, L$PINS;->init(Landroid/content/Context;)V
                const/4 v0, 0x3
                invoke-static {v0}, L$PINS;->useProfile(I)V
            """.trimIndent(),
        )

        // ---- 2. register the adapter, from the category constructor only -------------------
        CricZCategoryAdapterInitFingerprint.method.addInstructionsAfterSuperInit(
            "invoke-static {p0}, L$PINS;->seeAdapter(Ljava/lang/Object;)V",
        )
        // The app builds this adapter with the decrypted list already inside and draws from it
        // before anything writes the field back, so a cold open showed the app's order until a
        // refresh. Sorting at the end of the constructor means the first row drawn is already in
        // pin order. Only apps that name a writable list field are primed; PlayZ's is final and its
        // screen re-submits on entry.
        // BEFORE the final return-void, not after it. Appending at the end put the call after
        // `return-void`, which is legal dex and therefore passes every static check while never
        // executing - the first build of this did exactly that.
        val adapterCtor = CricZCategoryAdapterInitFingerprint.method
        val ctorInsns = adapterCtor.instructions.toList()
        val lastReturn = ctorInsns.indexOfLast { i -> i.opcode == Opcode.RETURN_VOID }
        check(lastReturn >= 0) {
            "The category adapter constructor has no return-void; refusing to guess where to prime."
        }
        adapterCtor.addInstructions(
            lastReturn,
            "invoke-static {p0}, L$PINS;->primeAdapter(Ljava/lang/Object;)V",
        )

        // ---- 3 to 6. the list writes are hooked by sortCategoryWrites() below --------------
        // ---- 7. the category rows ----------------------------------------------------------
        val bind = CricZCategoryBindFingerprint.method
        val row = bind.instructions.toList()

        val holderIdx = row.indexOfFirst { i ->
            i.opcode == Opcode.CHECK_CAST && (i as? ReferenceInstruction)?.reference?.toString() == "Lhc/b;"
        }
        val modelIdx = row.indexOfFirst { i ->
            i.opcode == Opcode.CHECK_CAST && (i as? ReferenceInstruction)?.reference?.toString() == "Lpc/b;"
        }
        check(holderIdx >= 0 && modelIdx >= 0) {
            "CricZ's category branch (Lhc/b + Lpc/b) was not found in Lg4/m;->d; this adapter " +
                "serves three screens and the patch will not guess which branch is the grid."
        }

        val setTextIdx = row.indices.firstOrNull { i ->
            if (i <= modelIdx) return@firstOrNull false
            val m = (row[i] as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Landroid/widget/TextView;" && m.name == "setText" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;")
        }
        check(setTextIdx != null) {
            "Could not find the category title setText in Lg4/m;->d; refusing to patch."
        }
        val titleRegNo = receiverRegisterOf(row[setTextIdx!!])
            ?: error("The title setText is not a five-register invoke; refusing to guess a view.")
        check(titleRegNo <= 15) {
            "The title setText reads register v$titleRegNo; this hook stays in the low range on " +
                "purpose. Refusing to patch rather than widen a register frame."
        }
        val titleReg = "v$titleRegNo"

        // Insert the later hook first so the earlier index stays valid.
        bind.addInstructions(
            setTextIdx + 1,
            "invoke-static {$titleReg}, L$PINS;->decorate(Landroid/view/View;)V",
        )
        bind.addInstructions(
            maxOf(holderIdx, modelIdx) + 1,
            "invoke-static {p1, p2}, L$PINS;->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}

/**
 * Put the sort immediately before each write of the category list into the adapter.
 *
 * The writes are `iput-object <reg>, <host>, Lg4/m;->g:Ljava/lang/Object;`. `expected` is the exact
 * number of them in the method: a build where that number changed is a build this patch has not
 * been verified against, so it refuses to patch rather than sort some writes and miss others.
 */
private fun BytecodePatchContext.sortCategoryWrites() {
    // One write in W (it also stores the list on the fragment, which is not the adapter's field),
    // two in the filter, one on the second screen. Four in total, which is what the investigation
    // counted; if a build changes that, the patch refuses instead of sorting some and missing others.
    sortCategoryWrites(CricZCategoriesPayloadFingerprint.method, "Lmc/c;->W", expected = 1)
    sortCategoryWrites(CricZFilterFingerprint.method, "Lmc/c;->U", expected = 2)
    sortCategoryWrites(CricZSecondScreenFingerprint.method, "Lhc/a;->onClick", expected = 1)
}

private fun BytecodePatchContext.sortCategoryWrites(
    method: MutableMethod,
    where: String, expected: Int,
) {
    val all = method.instructions.toList()
    // IPUT_OBJECT, not just "mentions the field": hc/a reads this same field (iget-object) and a
    // read is not a write. Counting it as one is how the first build of this patch was refused.
    val writes = all.indices.filter { i ->
        if (all[i].opcode != Opcode.IPUT_OBJECT) return@filter false
        val f = (all[i] as? ReferenceInstruction)?.fieldRef()
        f != null && f.definingClass == "Lg4/m;" && f.name == "g"
    }
    check(writes.size == expected) {
        "Expected $expected category list writes in $where, found ${writes.size}; refusing to " +
            "patch a build this patch has not been verified against."
    }
    // Back to front, so the earlier indices stay valid while the list grows.
    for (idx in writes.sortedDescending()) {
        val store = all[idx] as? OneRegisterInstruction
            ?: error("The list write in $where is not a single-register store; refusing to guess.")
        check(store.registerA <= 15) {
            "The list write in $where targets register v${store.registerA}; this hook keeps to " +
                "the low range on purpose. Refusing to patch rather than widen a register frame."
        }
        val reg = "v${store.registerA}"
        method.addInstructions(
            idx,
            """
                invoke-static {$reg}, L$PINS;->onSubmitList(Ljava/util/List;)Ljava/util/List;
                move-result-object $reg
            """.trimIndent(),
        )
    }
}
