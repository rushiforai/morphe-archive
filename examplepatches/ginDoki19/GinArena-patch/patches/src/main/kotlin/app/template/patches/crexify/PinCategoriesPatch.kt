package app.template.patches.crexify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CREXIFY_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * CrexiFy TV 4.5 - pin categories to the top of the Categories screen, at runtime, from the app.
 *
 * Issue #52, ported from Playfy TV. Every anchor was read off THIS app's disassembly.
 *
 * Anchors, verified against CrexiFy TV 4.5 (versionCode 12),
 * sha256 76f9bac391a3b109025f465dd922b6d14555acd4806dd994e2156022c0bc76c7:
 *
 *   1. com/crexify/tv/app/ProApplication;->onCreate()V      -> init(Context) + useProfile(5)
 *   2. Lqk;->g(List)V  immediately before the call         -> onSubmitList(adapter, list)
 *   3. Ltr;->d(Lth2;I)V  inside pswitch_cb only            -> bindRow + decorate
 *
 * Why the two site-restrictions below matter more here than in any earlier port:
 *
 *   - `Lqk;->g(List)` is the app's ONE list setter. Eleven call sites in six classes, because every
 *     list screen in the app shares the same adapter base. Hooking it means the extension sees
 *     match cards and channel lists too, so the ONLY thing standing between this patch and a
 *     reordered screen the user did not ask about is the extension's model-class guard: onSubmit
 *     returns any list whose items are not `Lxr` untouched. That guard is tested in section 6 of
 *     CricFyHunt's sibling, CrexiFyHunt, with a list of the app's other model.
 *   - `Ltr;->d` binds TWO different models from one method, chosen by the synthetic field `h`. Mode
 *     0 (pswitch_cb) is the category grid: cast to Lxr, holder Lsr. Mode 1 is a different screen
 *     entirely: Lk61 and holder Lj61, with `w`/`x` team goals. A hook placed by row shape would
 *     decorate match cards. The row hooks are therefore placed inside the branch whose casts prove
 *     it, which is the same discipline the CricZ port needed.
 *
 * The register frame of `d` is `.registers 9`, so p0 = v6 is the adapter and p1 = v7 / p2 = v8 are
 * the holder and the position. The extension is handed the HOLDER and the ITEM, not view indices,
 * exactly as the other ports do.
 *
 * This patch deliberately does not touch the app's native signing/decoder compatibility. That is a
 * separate, pre-existing concern (`crexifySigningCompatibility`); a pin patch has no business
 * replacing an app's response decoder, and mixing the two would make a playback failure impossible
 * to attribute.
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
 * `invoke-virtual {vX, vY}, TextView->setText(CharSequence)` is a five-register instruction: vX is
 * the receiver. Only the receiver is wanted, and only when the instruction really is that form.
 */
private fun receiverRegisterOf(instruction: Instruction): Int? {
    val five = instruction as? FiveRegisterInstruction ?: return null
    if (five.registerCount < 1) return null
    return five.registerC
}

private fun ReferenceInstruction.methodRef() = reference as? MethodReference
private fun ReferenceInstruction.fieldRef() = reference as? FieldReference

/** Application entry point. */
private object CrexifyAppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/crexify/tv/app/ProApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `Ltr;->d(Lth2;I)V` - the bind shared by every list screen, branched on the mode field.
 *
 * The parameter list is what separates it from `f(ViewGroup;I)` (onCreateViewHolder) and `e`.
 */
private object CrexifyBindFingerprint : Fingerprint(
    definingClass = "Ltr;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lth2;", "I"),
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
    compatibleWith(COMPATIBILITY_CREXIFY_TV)
    extendWith("extensions/playfy.mpe")

    execute {
        check(
            packageMetadata.packageName == "com.crexify.tv" &&
                packageMetadata.versionName == "4.5" &&
                packageMetadata.versionCode == "12"
        ) { "Unsupported CrexiFy TV build for the category pinning patch." }

        // ---- 0. refuse a second application -----------------------------------------------
        // This patch inserts at a fixed offset, so it cannot tell an unpatched method from one it
        // has already patched: running it twice would inject CREXIFY twice into the same method and
        // put two copies of the extension in the APK. Nothing breaks at runtime - `init` is
        // guarded and `useProfile` is idempotent - but a silently doubled APK is not something to
        // hand out. The hook call is the evidence: it only exists if this patch (or a bundle
        // carrying it) has already run. Refuse loudly instead.
        //
        // Applying DIFFERENT patches to an already-patched APK is fine and stays supported; only
        // re-applying THIS one is refused.
        checkNotAlreadyPatched(CrexifyAppCreateFingerprint.method)


        // ---- 1. which app this is --------------------------------------------------------
        // onCreate declares four registers and its first instruction is `invoke-super {p0}`.
        // Neither v0 nor v1 has been written at index 0, so v0 can carry the profile id without
        // disturbing `spget ProApplication.O` or the Hello.check call that follow.
        CrexifyAppCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, L$PINS;->init(Landroid/content/Context;)V
                const/4 v0, 0x5
                invoke-static {v0}, L$PINS;->useProfile(I)V
            """.trimIndent(),
        )

        // ---- 2. the one setter every list in the app goes through --------------------------
        // The fingerprint is the setter itself, so its body is scanned for calls to itself and
        // finds none. What has to be located is the CALL SITES, across every class. They are
        // `invoke-virtual {vA, vB}, Lqk;->g(List)V` - never the /range form, which is asserted
        // rather than assumed - and each hook rewrites the list register in place, which works the
        // same whether that register holds a parameter or a local.
        // The three methods that hand THE CATEGORIES list to the setter, by name. Enumerating every
        // Lqk;->g call site in the dex is not possible from a patch context (classDefForEach only
        // walks classes already made mutable), and it is not wanted: naming the three keeps the
        // patch off the eight sites that belong to other screens.
        // Lwr;->U has two: one for the unfiltered list, one for the filtered one. Both are the
        // categories. Lz4;->onClick has one, on the category card's click, which re-submits after
        // marking the row. If any of those counts changes, this patch has not been verified
        // against that build and stops.
        // Hook the setter from INSIDE, not at two chosen call sites.
        //
        // Issue #52 stage 8. CrexiFy on a phone showed "resubmit: no adapter registered" for every
        // Move left/right, with no onSubmit line at all: neither Lwr;->U nor Lz4;->onClick runs on
        // the path the phone takes into Categories, so the adapter was never registered and the list
        // was never sorted. qk.g(List) itself has 9 callers, one of them qk.<init> - naming two of
        // them was always going to miss the one that matters.
        //
        // Injecting at the head of g(List) covers every caller, present and future, including the
        // constructor. The adapter is `this` (p0) and the list is p1; both are cleared for the low
        // register range by construction, and the result is written back into p1 so the app's own
        // clear-and-copy still receives the sorted order.
        //
        // The two call-site hooks are kept: they cost nothing and they keep sorting correct even if
        // a future build inlines g.
        hookCategorySubmits(
            Triple("Lwr;", "U", 2),
            Triple("Lz4;", "onClick", 1),
        )
        hookSetterItself()

        // ---- 3. the category rows, inside the branch that proves it -----------------------
        val bind = CrexifyBindFingerprint.method
        val row = bind.instructions.toList()

        val modelIdx = row.indexOfFirst { i ->
            i.opcode == Opcode.CHECK_CAST &&
                (i as? ReferenceInstruction)?.reference?.toString() == "Lxr;"
        }
        val holderIdx = row.indexOfFirst { i ->
            i.opcode == Opcode.CHECK_CAST &&
                (i as? ReferenceInstruction)?.reference?.toString() == "Lsr;"
        }
        check(modelIdx >= 0 && holderIdx >= 0) {
            "CrexiFy's category branch (Lxr + Lsr) was not found in Ltr;->d; this bind serves more " +
                "than one screen and the patch will not guess which branch is the category grid."
        }
        // The other row shape must be a DIFFERENT branch, and in this dex it comes first: mode 1
        // is the fall-through after the switch, so its casts sit earlier in the instruction list
        // than mode 0's. What has to be true is that both of our casts come after it, which puts
        // us inside pswitch_cb's body and not inside the match-card branch.
        val foreignIdx = row.indexOfFirst { i ->
            i.opcode == Opcode.CHECK_CAST &&
                (i as? ReferenceInstruction)?.reference?.toString() == "Lk61;"
        }
        check(foreignIdx in 0 until modelIdx) {
            "CrexiFy's two row branches are not in the order this patch was written against " +
                "(foreign=$foreignIdx, model=$modelIdx); refusing to patch."
        }

        // The title is drawn with a plain setText on the holder's `v` TextView, after the item read.
        val titleIdx = row.indices.firstOrNull { i ->
            if (i <= modelIdx) return@firstOrNull false
            val m = (row[i] as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Landroid/widget/TextView;" && m.name == "setText" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;")
        }
        check(titleIdx != null) {
            "Could not find the category title setText in Ltr;->d; refusing to patch."
        }
        val titleRegNo = receiverRegisterOf(row[titleIdx!!])
            ?: error("The title setText is not a five-register invoke; refusing to guess a view.")
        check(titleRegNo <= 15) {
            "The title setText reads register v$titleRegNo; this hook stays in the low range on " +
                "purpose. Refusing to patch rather than widen a register frame."
        }
        val titleReg = "v$titleRegNo"

        // Insert the later hook first so the earlier index stays valid.
        bind.addInstructions(
            titleIdx + 1,
            "invoke-static {$titleReg}, L$PINS;->decorate(Landroid/view/View;)V",
        )
        bind.addInstructions(
            maxOf(holderIdx, modelIdx) + 1,
            "invoke-static {p1, p2}, L$PINS;->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}

/**
 * Hook every `Lqk;->g(List)` call inside the named methods.
 *
 * Each listed method is re-read from the original dex class table, so the method does not have to
 * have been matched by a fingerprint first, and each call site is rewritten in place:
 *
 *   invoke-virtual {vA, vB}, Lqk;->g(List)V
 *     ->
 *   invoke-static {vA, vB}, Pins;->onSubmitList(Object,List)List
 *   move-result-object vB
 *
 * The list register is a local or a parameter depending on the site, and rewriting it works the
 * same either way. No register frame is widened and no other instruction is touched.
 */
/**
 * Sort the list inside `qk.g(List)` itself, so every caller is covered.
 *
 * The store targets `qk.d`, declared `Ljava/util/ArrayList;`, and `g` clears it then addAll()s its
 * own argument into it -- so the sorted result must be written back into p1 before the body runs,
 * and it must stay an ArrayList for the field's type. `onSubmitListTyped` returns exactly that.
 */
private fun BytecodePatchContext.hookSetterItself() {
    val original = classDefBy("Lqk;")
    val method = original.methods.firstOrNull { m ->
        m.name == "g" && m.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
    } ?: error("Lqk;->g(List) is missing; refusing to patch a build this patch has not been verified against.")

    val mutableMethods =
        (mutableClassDefBy("Lqk;") as com.android.tools.smali.dexlib2.iface.ClassDef)
            .methods as MutableSet<MutableMethod>
    val mutable = mutableMethods.firstOrNull { m ->
        m.name == "g" && m.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
    } ?: error("Could not re-open Lqk;->g(List) to hook it.")

    val regs = method.implementation?.registerCount ?: error("Lqk;->g has no code")
    // p0 = this (the adapter), p1 = the incoming list.
    val p0 = regs - 2
    val p1 = regs - 1
    mutable.addInstructions(
        0,
        """
            invoke-static {v$p0, v$p1}, L$PINS;->onSubmitListTyped(Ljava/lang/Object;Ljava/util/List;)Ljava/util/ArrayList;
            move-result-object v$p1
        """.trimIndent(),
    )
}

private fun BytecodePatchContext.hookCategorySubmits(
    vararg targets: Triple<String, String, Int>,
) {
    var hooked = 0
    for ((type, name, expected) in targets) {
        val original = classDefBy(type)
        val method = original.methods.firstOrNull { it.name == name }
            ?: error("$type->$name is missing; refusing to patch a build this patch has not been verified against.")
        val insns = method.implementation?.instructions?.toList().orEmpty()
        val sites = insns.indices.filter { i ->
            val m = (insns[i] as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Lqk;" && m.name == "g" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
        }
        check(sites.size == expected) {
            "Expected $expected Lqk;->g(List) call(s) in $type->$name, found ${sites.size}; " +
                "refusing to patch rather than hook a list this patch has not identified."
        }

        val want = method.parameterTypes.map { it.toString() }
        @Suppress("UNCHECKED_CAST")
        val mutableMethods =
            (mutableClassDefBy(type) as com.android.tools.smali.dexlib2.iface.ClassDef)
                .methods as MutableSet<MutableMethod>
        val mutable = mutableMethods.firstOrNull { candidate ->
            candidate.name == name && candidate.returnType == method.returnType &&
                candidate.parameterTypes.map { p -> p.toString() } == want
        } ?: error("Could not re-open $type->$name to hook its submit.")

        // Back to front, so the earlier indices stay valid while the instruction list grows.
        for (idx in sites.sortedDescending()) {
            val five = insns[idx] as? FiveRegisterInstruction
                ?: error("The Lqk;->g call in $type->$name is not a five-register invoke; refusing to guess.")
            check(five.registerCount == 2) {
                "The Lqk;->g call in $type->$name passes ${five.registerCount} registers, not 2."
            }
            val adapter = five.registerC
            val list = five.registerE
            check(adapter <= 15 && list <= 15) {
                "The Lqk;->g call in $type->$name reads high registers; this hook keeps to the low range " +
                    "on purpose. Refusing to patch rather than widen a register frame."
            }
            mutable.addInstructions(
                idx,
                """
                    invoke-static {v$adapter, v$list}, L$PINS;->onSubmitList(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                    move-result-object v$list
                """.trimIndent(),
            )
            hooked++
        }
    }
    val wanted = targets.sumOf { it.third }
    check(hooked == wanted) { "Hooked $hooked of $wanted category submit sites." }
}
