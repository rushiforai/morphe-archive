package app.template.patches.playz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.addInstructionsAfterSuperInit
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYZ_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * PlayZ TV 2.3.1 - pin categories to the top of the Category section, at runtime, from the app.
 *
 * Issue #52, ported from Playfy TV. Every anchor below was read off THIS app's disassembly; the
 * notes say what was found, because two of PlayZ's shapes are different from the apps before it.
 *
 * Anchors, verified against PlayZ TV 2.3.1 (versionCode 8),
 * sha256 003c8b6e9afe4a3f17ab45112a99ad8d2bf715f1981a521c61dab5f453a1d827:
 *
 *   1. ProApplication.onCreate()V      -> init(Context) + useProfile(2)
 *   2. ic.b.<init>(Context,String,String) -> seeAdapter(this)
 *   3. ic.b.g(List)                    -> onSubmitList(this, list), the one place every submit and
 *                                         every filter funnels through
 *   4. ic.b.d(Lo4/z0;I)                -> bindRow(holder, item) after both casts
 *   5. ic.b.d(Lo4/z0;I)                -> decorate(title) after the title setText
 *
 * Why this is not a copy of SK Tech:
 *
 *   - The category model is qc.b, not qc.f. qc.f is the model of the adapter's OTHER bind branch
 *     (adapter field h == 0, holder ic.m, a "a | b" label) which is a different screen entirely.
 *     Getting this wrong would compile, apply, and pin nothing.
 *   - The list lives in a FINAL ArrayList that the adapter mutates in place, and the app appends a
 *     null row to it for a loading spinner. There is no field to write, so the sort goes through
 *     the app's own g(List).
 *   - There is no notifyDataSetChanged anywhere in this dex: the adapter base is a local class and
 *     the refresh is adapter.a.b(). The extension handles that by name, not from here.
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

/** Application entry point. One no-argument onCreate in ProApplication. */
private object PlayZAppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/playz/tv/app/ProApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `ic.b.<init>(Context,String,String)V` - the adapter base's constructor.
 *
 * The hook registers the adapter itself, where `this` IS the adapter. Both ic.d constructors chain
 * here, so the category adapter and the one beside it are both registered, and the hook that sorts
 * passes the adapter it was called on anyway.
 */
private object PlayZAdapterInitFingerprint : Fingerprint(
    definingClass = "Lic/b;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

/**
 * `ic.b.g(Ljava/util/List;)V` - the adapter's own setter.
 *
 * Every submit goes through here: the category constructor calls it, the filter calls it twice,
 * and the second adapter subclass calls it too. The body clears the field, copies the argument in,
 * and appends a null loading row, which is why the sort must run on the argument and not on the
 * field afterwards.
 */
private object PlayZAdapterSetListFingerprint : Fingerprint(
    definingClass = "Lic/b;",
    name = "g",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

/**
 * `ic.d.d(Lo4/z0;I)V` - the row bind of both adapter modes.
 *
 * Pinned to the defining class on purpose: `d(ViewHolder,int)` exists on every adapter in the dex.
 * The two casts below are then used to prove which branch was reached, rather than trusting a
 * switch value.
 */
private object PlayZCategoryBindFingerprint : Fingerprint(
    definingClass = "Lic/d;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lq4/z0;", "I"),
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
    compatibleWith(COMPATIBILITY_PLAYZ_TV)
    extendWith("extensions/playfy.mpe")

    execute {
        check(
            packageMetadata.packageName == "com.playz.tv" &&
                packageMetadata.versionName == "2.3.1" &&
                packageMetadata.versionCode == "8"
        ) { "Unsupported PlayZ TV build for the category pinning patch." }

        // ---- 0. refuse a second application -----------------------------------------------
        // This patch inserts at a fixed offset, so it cannot tell an unpatched method from one it
        // has already patched: running it twice would inject PLAYZ twice into the same method and
        // put two copies of the extension in the APK. Nothing breaks at runtime - `init` is
        // guarded and `useProfile` is idempotent - but a silently doubled APK is not something to
        // hand out. The hook call is the evidence: it only exists if this patch (or a bundle
        // carrying it) has already run. Refuse loudly instead.
        //
        // Applying DIFFERENT patches to an already-patched APK is fine and stays supported; only
        // re-applying THIS one is refused.
        checkNotAlreadyPatched(PlayZAppCreateFingerprint.method)


        // ---- 1. which app this is --------------------------------------------------------
        // One integer, never strings: ProApplication.onCreate runs in four registers, and the
        // per-app names live in the extension as constants.
        PlayZAppCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, L$PINS;->init(Landroid/content/Context;)V
                const/4 v1, 0x2
                invoke-static {v1}, L$PINS;->useProfile(I)V
            """.trimIndent(),
        )

        // ---- 2. register the adapter when it is built --------------------------------------
        PlayZAdapterInitFingerprint.method.addInstructionsAfterSuperInit(
            "invoke-static {p0}, L$PINS;->seeAdapter(Ljava/lang/Object;)V",
        )

        // ---- 3. sort on the way into the adapter -------------------------------------------
        //
        // The hook sits at the very top of g(List), before the body copies the list into the
        // adapter's own ArrayList. The argument is p1 and it is replaced, so the copy the app makes
        // a few instructions later is the sorted one. `this` is p0 and is passed with it, which is
        // what makes the re-submit go to the adapter the user is looking at.
        //
        // Registers: this method declares 3 (v0, v1, v2) and the hook writes nothing but p1, so no
        // frame is widened and no scratch register is borrowed.
        PlayZAdapterSetListFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, L$PINS;->onSubmitList(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """.trimIndent(),
        )

        // ---- 4 + 5. the category rows ------------------------------------------------------
        val bind = PlayZCategoryBindFingerprint.method
        val row = bind.instructions.toList()

        // The category branch is the one that casts the holder to Lic/c and its model to Lqc/b:
        // the other branch casts Lic/m and Lqc/f. Both casts must be present before this patch
        // writes anything, because the row hook is inside that branch and nowhere else.
        val holderIdx = row.indexOfFirst { i ->
            val t = (i as? ReferenceInstruction)?.reference?.toString()
            t == "Lic/c;" && i.opcode == Opcode.CHECK_CAST
        }
        val modelIdx = row.indexOfFirst { i ->
            val t = (i as? ReferenceInstruction)?.reference?.toString()
            t == "Lqc/b;" && i.opcode == Opcode.CHECK_CAST
        }
        check(holderIdx >= 0 && modelIdx >= 0) {
            "PlayZ's category bind branch (Lic/c + Lqc/b) was not found in Lic/d;->d; " +
                "refusing to patch a screen this patch cannot name."
        }

        // The title setText in that branch: the first TextView.setText after the model cast. The
        // holder is p1 and the view is in a register; the instruction is read back for its register
        // rather than assumed.
        val setTextIdx = row.indices.firstOrNull { i ->
            if (i <= modelIdx) return@firstOrNull false
            val m = (row[i] as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Landroid/widget/TextView;" && m.name == "setText" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;")
        }
        check(setTextIdx != null) {
            "Could not find the category title setText in Lic/d;->d; refusing to patch."
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
