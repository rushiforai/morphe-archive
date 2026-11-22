package app.template.patches.cricfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.cricfy.repairedMethod
import app.template.patches.shared.Constants.COMPATIBILITY_CRICFY_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * CRICFy TV 7.5 - pin categories to the top of the Categories screen, at runtime, from the app.
 *
 * Issue #52, ported from Playfy TV. Every anchor was read off THIS app's disassembly.
 *
 * Anchors, verified against CRICFy TV 7.5 (versionCode 55),
 * sha256 a6c12f1c5bdc1eff9da78788b27560c9c6fed7527b32e267f207eb746f0a23b7:
 *
 *   1. Lcom/android/vending/App;->onCreate()V              -> init(Context) + useProfile(4)
 *   2. Ll23;->k0(RecyclerView,Lgo1,List)V  idx 0           -> onSubmitList(adapter, list)
 *   3. Lkt;->k(Lxx2;I)V  after `check-cast v4, Lgt`        -> bindRow(holder, item)
 *   4. Lkt;->k(Lxx2;I)V  after `setSafeText` on the title  -> decorate(title)
 *
 * Why this patch is much smaller than the PlayZ and CricZ ones, and why that is not laziness:
 *
 *   - There is exactly ONE submit funnel. `l23.k0` is called by the categories, home, notifications
 *     and one more screen, and it does the whole job in six instructions: it copies the caller's
 *     list, wraps a commit callback and hands both to `Ldf.b`, which IS AsyncListDiffer.submitList.
 *     The other ports had to hook four separate writes because their fragments each wrote the
 *     adapter's field themselves. Here there is nothing to miss, so nothing is counted and nothing
 *     can go stale when the app adds a screen.
 *   - The hook sits at instruction 0 of k0, where the method's three parameters are still intact in
 *     their own registers: v4 is the adapter (`Lgo1`) and v5 the list. Two instructions later v5 is
 *     overwritten by the copy, which is why the sort has to be applied to the ARGUMENT and not to
 *     the copy. Applying it to the copy would work today and would break the moment the app sorts
 *     its own list before submitting.
 *   - Nothing is registered with seeAdapter(): k0 is handed the adapter and the list together, which
 *     is the strongest of the three submit hooks the extension offers. That matters more here than
 *     elsewhere because the fragment wraps its adapter in an anonymous `Lz20` before handing it to
 *     the RecyclerView, so reflecting on the RecyclerView finds the wrapper, not the list adapter.
 *
 * Reading this APK at all: 7.5 ships **78,541** array-payloads whose element width no dalvik
 * verifier would accept, so baksmali stops after a fraction of the classes. The three methods this
 * patch touches are each repaired through `repairedMethod` (the project's existing
 * DexPayloadRepair helper) before any instruction is added. The repair is idempotent per class and
 * touches only the payloads it has to.
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

/**
 * The register holding the view a `setText`-style call is made on.
 *
 * `invoke-virtual {vX, vY}, Utf8SafeTextView->setSafeText(CharSequence)` is a five-register
 * instruction: vX is the receiver. Only the receiver is wanted, and only when the instruction
 * really is a five-register form; anything else is refused rather than guessed at.
 */
private fun receiverRegisterOf(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction): Int? {
    val five = instruction as? FiveRegisterInstruction ?: return null
    if (five.registerCount < 1) return null
    return five.registerC
}

private fun ReferenceInstruction.methodRef() = reference as? MethodReference

/** Application entry point. */
private object CricFyAppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/android/vending/App;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `l23.k0(RecyclerView, go1, List)V` - the single funnel every list in the app goes through.
 *
 * The parameter list is what makes this fingerprint unambiguous: the same helper class carries a
 * `V` overload that only sets up the grid, and that one must not be touched.
 */
private object CricFySubmitFunnelFingerprint : Fingerprint(
    definingClass = "Ll23;",
    name = "k0",
    returnType = "V",
    parameters = listOf(
        "Landroidx/recyclerview/widget/RecyclerView;",
        "Lgo1;",
        "Ljava/util/List;",
    ),
)

/**
 * `Lkt;->k(Lxx2;I)V` - the category row bind.
 *
 * `Lkt` extends the app-wide adapter base `Lgo1`; this is the one subclass that binds the
 * category grid, and its holder is `Lht` carrying the `CatItemBinding` in `u`.
 */
private object CricFyBindRowFingerprint : Fingerprint(
    definingClass = "Lkt;",
    name = "k",
    returnType = "V",
    parameters = listOf("Lxx2;", "I"),
)

/**
 * `Ldf;->a(Ljava/lang/Runnable;)V` - AsyncListDiffer commit completion on main thread.
 */
private object CricFyDifferCommitFingerprint : Fingerprint(
    definingClass = "Ldf;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/lang/Runnable;"),
)

/** `Lgo1;` - list adapter base class holding `d:Ldf;`. */
private object CricFyAdapterBaseFingerprint : Fingerprint(
    definingClass = "Lgo1;",
    name = "t",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

/** `LinearLayoutManager` - verify pending scroll fields `x`, `y`, `z`. */
private object CricFyLinearLayoutManagerFingerprint : Fingerprint(
    definingClass = "Landroidx/recyclerview/widget/LinearLayoutManager;",
    name = "h0",
    returnType = "Landroid/os/Parcelable;",
    parameters = emptyList(),
)

/** `Lkx2;` (`RecyclerView.LayoutParams`) - verify `b:Landroid/graphics/Rect;` (`mDecorInsets`). */
private object CricFyLayoutParamsFingerprint : Fingerprint(
    definingClass = "Lkx2;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("I", "I"),
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
    compatibleWith(COMPATIBILITY_CRICFY_TV)
    extendWith("extensions/playfy.mpe")

    execute {
        check(
            packageMetadata.packageName == "com.cricfytv.sports" &&
                packageMetadata.versionName == "7.5" &&
                packageMetadata.versionCode == "55"
        ) { "Unsupported CRICFy TV build for the category pinning patch." }

        // ---- 0. refuse a second application -----------------------------------------------
        // This patch inserts at a fixed offset, so it cannot tell an unpatched method from one it
        // has already patched: running it twice would inject CRICFY twice into the same method and
        // put two copies of the extension in the APK. Nothing breaks at runtime - `init` is
        // guarded and `useProfile` is idempotent - but a silently doubled APK is not something to
        // hand out. The hook call is the evidence: it only exists if this patch (or a bundle
        // carrying it) has already run. Refuse loudly instead.
        //
        // Applying DIFFERENT patches to an already-patched APK is fine and stays supported; only
        // re-applying THIS one is refused.
        checkNotAlreadyPatched(CricFyAppCreateFingerprint.repairedMethod)

        // Verify AsyncListDiffer / LayoutManager / LayoutParams fields used by enableCricfyDifferAnchor()
        val adapterBaseClass = CricFyAdapterBaseFingerprint.originalClassDef
        check(adapterBaseClass.fields.any { it.name == "d" && it.type == "Ldf;" }) {
            "Lgo1;->d:Ldf; missing; refusing to enable CRICFy differ anchor."
        }
        val differCommit = CricFyDifferCommitFingerprint.repairedMethod
        val differClass = classDefBy("Ldf;")
        check(differClass.fields.any { it.name == "d" && it.type == "Ljava/util/concurrent/CopyOnWriteArrayList;" }) {
            "Ldf;->d:CopyOnWriteArrayList missing; refusing to patch."
        }
        check(differClass.fields.any { it.name == "e" && it.type == "Ljava/util/List;" }) {
            "Ldf;->e:List missing; refusing to patch."
        }
        check(differClass.fields.any { it.name == "f" && it.type == "Ljava/util/List;" }) {
            "Ldf;->f:List missing; refusing to patch."
        }
        check(differClass.fields.any { it.name == "g" && it.type == "I" }) {
            "Ldf;->g:I missing; refusing to patch."
        }
        check(
            differClass.methods.any {
                it.name == "b" && it.returnType == "V" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/util/List;", "Llb;")
            }
        ) { "Ldf;->b(List, Llb) missing; refusing to patch." }
        val lmClass = CricFyLinearLayoutManagerFingerprint.originalClassDef
        check(lmClass.fields.any { it.name == "x" && it.type == "I" }) {
            "LinearLayoutManager;->x:I missing; refusing to patch."
        }
        check(lmClass.fields.any { it.name == "y" && it.type == "I" }) {
            "LinearLayoutManager;->y:I missing; refusing to patch."
        }
        check(lmClass.fields.any { it.name == "z" && it.type == "Lyn1;" }) {
            "LinearLayoutManager;->z:Lyn1; missing; refusing to patch."
        }
        val gridLmClass = classDefBy("Landroidx/recyclerview/widget/GridLayoutManager;")
        check(gridLmClass.fields.any { it.name == "F" && it.type == "I" }) {
            "GridLayoutManager;->F:I missing; refusing to patch."
        }
        val rvClass = classDefBy("Landroidx/recyclerview/widget/RecyclerView;")
        check(rvClass.methods.any { it.name == "Q" && it.returnType == "V" && it.parameterTypes.isEmpty() }) {
            "RecyclerView;->Q()V (markItemDecorInsetsDirty) missing; refusing to patch."
        }
        val rvLmBaseClass = classDefBy("Ljx2;")
        check(rvLmBaseClass.fields.any { it.name == "h" && it.type == "Z" }) {
            "Ljx2;->h:Z (mMeasurementCacheEnabled) missing; refusing to patch."
        }
        val lpClass = CricFyLayoutParamsFingerprint.originalClassDef
        check(lpClass.fields.any { it.name == "b" && it.type == "Landroid/graphics/Rect;" }) {
            "Lkx2;->b:Rect missing; refusing to patch."
        }
        check(differCommit.implementation?.registerCount == 3) {
            "Ldf;->a(Runnable) registerCount != 3 (${differCommit.implementation?.registerCount}); refusing to patch."
        }

        // ---- 1. which app this is --------------------------------------------------------
        // onCreate opens with `ob.k()` and only then starts using v0 (`iget-object v0, v5` at
        // instruction 2), so v0 is dead at index 0 and can hold the profile id. Using a register
        // that the method body has not reached yet is what keeps this to three instructions
        // instead of widening a register frame the app's own code depends on.
        CricFyAppCreateFingerprint.repairedMethod.addInstructions(
            0,
            """
                invoke-static {p0}, L$PINS;->init(Landroid/content/Context;)V
                const/4 v0, 0x4
                invoke-static {v0}, L$PINS;->useProfile(I)V
                invoke-static {}, L$PINS;->enableCricfyDifferAnchor()V
            """.trimIndent(),
        )

        // ---- 2. the one place every list is submitted ------------------------------------
        // Registers: `k0` declares six with three parameters, so p0=v3 (the RecyclerView),
        // p1=v4 (the adapter) and p2=v5 (the list). Both parameters read here are still the
        // caller's objects: v5 is not overwritten until instruction 7, by the copy.
        val funnel = CricFySubmitFunnelFingerprint.repairedMethod
        val funnelInsns = funnel.instructions.toList()
        check(funnelInsns.size > 8) {
            "Ll23;->k0 is shorter than the body this patch was written against (${funnelInsns.size} " +
                "instructions); refusing to patch a build this patch has not been verified against."
        }
        // The method must still be the shape the register numbers were read off: six registers and
        // a three-parameter signature. Anything else means the frame moved.
        check(funnel.implementation?.registerCount == 6) {
            "Ll23;->k0 now declares ${funnel.implementation?.registerCount} registers, not 6; the " +
                "adapter and list are no longer in v4/v5. Refusing to patch."
        }
        val submit = funnelInsns.firstOrNull {
            val m = (it as? ReferenceInstruction)?.methodRef()
            m != null && m.name == "b" && m.definingClass == "Ldf;" &&
                m.parameterTypes.map { p -> p.toString() } ==
                listOf("Ljava/util/List;", "Llb;")
        }
        check(submit != null) {
            "Ll23;->k0 no longer submits through Ldf;->b(List, Llb); refusing to patch a build " +
                "this patch has not been verified against."
        }
        funnel.addInstructions(
            0,
            """
                invoke-static {v3, v4}, L$PINS;->seeAdapterRecycler(Ljava/lang/Object;Ljava/lang/Object;)V
                invoke-static {v4, v5}, L$PINS;->onSubmitList(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object v5
            """.trimIndent(),
        )

        // ---- 2b. hook Ldf;->a(Runnable) for post-diff viewport anchoring ------------------
        // Ldf;->b takes (List, Llb) rather than (List, Runnable), so Pins.submitWithAnchor stores
        // a PendingAnchor keyed by differ and Ldf;->a notifies onDifferCommitted(this) on the
        // main thread right after any commitCallback completes. Rebuilding with 4 registers keeps
        // p0 (v2) intact across the CopyOnWriteArrayList loop and strips dead trailing payloads.
        val commitReplacement = MutableMethod(
            ImmutableMethod(
                differCommit.definingClass,
                differCommit.name,
                differCommit.parameters,
                differCommit.returnType,
                differCommit.accessFlags,
                differCommit.annotations,
                differCommit.hiddenApiRestrictions,
                MutableMethodImplementation(4),
            ),
        )
        commitReplacement.addInstructions(
            0,
            """
                iget-object v0, v2, Ldf;->d:Ljava/util/concurrent/CopyOnWriteArrayList;
                invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :loop
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :done
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Lfo1;
                iget-object v1, v1, Lfo1;->a:Lgo1;
                goto :loop
                :done
                if-eqz v3, :after
                invoke-interface {v3}, Ljava/lang/Runnable;->run()V
                :after
                invoke-static {v2}, L$PINS;->onDifferCommitted(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )
        val mutableDifferClass = mutableClassDefBy("Ldf;")
        @Suppress("UNCHECKED_CAST")
        val differMethods = (mutableDifferClass as ClassDef).methods as MutableSet<MutableMethod>
        check(differMethods.removeAll { it.name == "a" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Runnable;") }) {
            "Failed to replace Ldf;->a(Runnable) for differ commit hook."
        }
        differMethods.add(commitReplacement)

        // ---- 3. the category rows ---------------------------------------------------------
        val bind = CricFyBindRowFingerprint.repairedMethod
        val row = bind.instructions.toList()

        // The item is cast to the category model right after it is read off the adapter. Both the
        // holder (v5) and the item (v4) are in hand from there on; the hook is placed after the
        // cast so the item is known to be the right class and the extension never has to guess.
        val modelIdx = row.indexOfFirst { i ->
            i.opcode == Opcode.CHECK_CAST &&
                (i as? ReferenceInstruction)?.reference?.toString() == "Lgt;"
        }
        check(modelIdx >= 0) {
            "The category model cast (Lgt) was not found in Lkt;->k; refusing to patch."
        }
        val holderIdx = row.indexOfFirst { i ->
            i.opcode == Opcode.CHECK_CAST &&
                (i as? ReferenceInstruction)?.reference?.toString() == "Lht;"
        }
        check(holderIdx >= 0) {
            "The holder cast (Lht) was not found in Lkt;->k; refusing to patch."
        }

        // The title is NOT drawn with setText. `Utf8SafeTextView` adds `setSafeText`, which
        // sanitises the string and then calls the inherited setText; anchoring on setText would
        // land inside that helper, which never runs for a row. This is the call that draws.
        val titleIdx = row.indices.firstOrNull { i ->
            if (i <= modelIdx) return@firstOrNull false
            val m = (row[i] as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Lcom/cricfytv/sports/Utf8SafeTextView;" &&
                m.name == "setSafeText" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;")
        }
        check(titleIdx != null) {
            "Could not find the category title setSafeText in Lkt;->k; refusing to patch."
        }
        val titleRegNo = receiverRegisterOf(row[titleIdx!!])
            ?: error("The title setSafeText is not a five-register invoke; refusing to guess a view.")
        check(titleRegNo <= 15) {
            "The title setSafeText reads register v$titleRegNo; this hook stays in the low range " +
                "on purpose. Refusing to patch rather than widen a register frame."
        }
        val titleReg = "v$titleRegNo"

        // Insert the later hook first so the earlier index stays valid.
        bind.addInstructions(
            titleIdx + 1,
            "invoke-static {$titleReg}, L$PINS;->decorate(Landroid/view/View;)V",
        )
        bind.addInstructions(
            maxOf(holderIdx, modelIdx) + 1,
            "invoke-static {v5, v4}, L$PINS;->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
