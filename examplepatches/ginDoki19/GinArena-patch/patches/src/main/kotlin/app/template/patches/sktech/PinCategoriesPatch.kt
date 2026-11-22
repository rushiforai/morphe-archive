package app.template.patches.sktech

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.addInstructionsAfterSuperInit
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.COMPATIBILITY_SK_TECH_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * SK Tech TV 2.7 - pin categories to the top of the Category section, at runtime, from the app.
 *
 * The issue #52 feature, ported from Playfy TV. The behaviour is identical; only the anchors
 * differ, and each anchor below was read off THIS app's disassembly rather than copied from
 * Playfy. SK Tech is a different fork with different obfuscated names, and the Playfy row-move
 * defect came from assuming a structure instead of reading one.
 *
 * Anchors, verified against SK Tech TV 2.7 (versionCode 17),
 * sha256 5095235d7a77e588d570780cea99a25dd807c9cb3ee814e450af82a49423cdcd:
 *
 *   1. ProApplication.onCreate()V       -> init(Context) + configure(...)
 *   2. lc.f.V(JSONArray)V               -> onSubmit(adapter, list) before the adapter list write
 *   3. gc.c.d(Lo4/z0;I)V                -> bindRow(holder, item) after the model read
 *   4. gc.c.d(Lo4/z0;I)V                -> decorate(title) after the title setText
 *
 * How this app differs from Playfy, and why this is not a copy:
 *
 *   - The model is Lmc/b. Field `a` is the display name AND the only stable identity (there is no
 *     numeric id); `c` is the stream URL. The extension is told so by configure().
 *   - The adapter Lgc/c is a plain RecyclerView adapter with its list in public field `f`, and
 *     there is no submitList(List) anywhere in this dex. The extension therefore writes `f` and
 *     calls notifyDataSetChanged. PortHunt covers that path.
 *   - The grid is 3 or 6 wide, decided by lc.f's own TV-or-not test. Nothing here hard-codes
 *     either number: the extension measures the laid-out grid and only falls back to a rule.
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

/** Application entry point. One `onCreate` with no arguments in ProApplication. */
private object SkTechAppCreateFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/app/ProApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `lc.f.V(JSONArray)V` - the Categories fragment receives its payload and builds the list.
 *
 * The matching strings are the payload keys this method reads (`cat`, `visible`), which is what
 * separates it from the fragment's other void methods.
 */
private object SkTechCategoriesPayloadFingerprint : Fingerprint(
    definingClass = "Llc/f;",
    name = "V",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONArray;"),
    filters = listOf(
        string("cat"),
        string("visible"),
    ),
)

/**
 * `gc.c.d(Lo4/z0;I)V` - the category row bind.
 *
 * Pinned to the defining class on purpose: `d(...)` with these parameters exists on many adapter
 * classes in this dex, and a fingerprint without it could land on a different adapter and quietly
 * decorate the wrong list.
 */
private object SkTechCategoryBindFingerprint : Fingerprint(
    definingClass = "Lgc/c;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lo4/z0;", "I"),
    filters = listOf(opcode(Opcode.CHECK_CAST)),
)

/**
 * `gc.c.<init>(Context, Llc/e, ArrayList, Z)V` - the category adapter's constructor.
 *
 * The hook here is `Pins.seeAdapter(this)`, which registers the adapter so the list hook can use
 * it later. The constructor is anchored by its exact parameter list, which no other class in this
 * dex shares with this defining class.
 */
private object SkTechCategoryAdapterInitFingerprint : Fingerprint(
    definingClass = "Lgc/c;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Llc/e;", "Ljava/util/ArrayList;", "Z"),
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
    compatibleWith(COMPATIBILITY_SK_TECH_TV)
    extendWith("extensions/playfy.mpe")

    execute {
        check(
            packageMetadata.packageName == "com.live.sktechtv" &&
                packageMetadata.versionName == "2.7" &&
                packageMetadata.versionCode == "17"
        ) { "Unsupported SK Tech TV build for the category pinning patch." }

        // ---- 0. refuse a second application -----------------------------------------------
        // This patch inserts at a fixed offset, so it cannot tell an unpatched method from one it
        // has already patched: running it twice would inject SKTECH twice into the same method and
        // put two copies of the extension in the APK. Nothing breaks at runtime - `init` is
        // guarded and `useProfile` is idempotent - but a silently doubled APK is not something to
        // hand out. The hook call is the evidence: it only exists if this patch (or a bundle
        // carrying it) has already run. Refuse loudly instead.
        //
        // Applying DIFFERENT patches to an already-patched APK is fine and stays supported; only
        // re-applying THIS one is refused.
        val onCreate = SkTechAppCreateFingerprint.method
        checkNotAlreadyPatched(onCreate)

        // ---- 1. tell the extension which app it is inside ---------------------------------
        //
        // One integer, no strings. The per-app names live in the extension as constants
        // (Pins.useProfile); passing them as strings from here would need six registers in a
        // method that has two, and the constants would overwrite `this` before onCreate's own
        // body ran. This costs one register and no assumptions.
        onCreate.addInstructions(
            0,
            """
                invoke-static {p0}, L$PINS;->init(Landroid/content/Context;)V
                const/4 v0, 0x1
                invoke-static {v0}, L$PINS;->useProfile(I)V
            """.trimIndent(),
        )

        // ---- 2. register the adapter when it is built --------------------------------------
        //
        // The Categories fragment writes the list into the adapter's field after the adapter
        // exists, so the list hook has no adapter to pass. Registering it here, where `this` IS
        // the adapter, costs no registers and cannot name the wrong object.
        val adapterInit = SkTechCategoryAdapterInitFingerprint.method
        adapterInit.addInstructionsAfterSuperInit(
            "invoke-static {p0}, L$PINS;->seeAdapter(Ljava/lang/Object;)V",
        )
        // Prime before the first row is drawn, the same fix CricZ needed.
        //
        // gc/c holds its rows in field `f`, a writable ArrayList (not final), and the adapter is
        // built with the list already inside. Without this, a cold open can show the app's order
        // until something writes the field again. It goes BEFORE the final return-void: appending
        // after it is legal dex that never executes, which is how the CricZ version of this call
        // was silently dead the first time it was written.
        val ctorInsns = adapterInit.instructions.toList()
        val lastReturn = ctorInsns.indexOfLast { i -> i.opcode == Opcode.RETURN_VOID }
        check(lastReturn >= 0) {
            "The category adapter constructor has no return-void; refusing to guess where to prime."
        }
        adapterInit.addInstructions(
            lastReturn,
            "invoke-static {p0}, L$PINS;->primeAdapter(Ljava/lang/Object;)V",
        )

        // ---- 3. sort a copy on its way into the adapter ------------------------------------
        //
        // The app never calls submitList: it writes `Lgc/c;->f` and calls notifyDataSetChanged.
        // The sorted list must be the one that reaches that field, so the hook sits immediately
        // before the write, takes the list in the register the write is about to store, and leaves
        // the sorted result in that same register. No other register is read or written.
        val payload = SkTechCategoriesPayloadFingerprint.method
        val insns = payload.instructions.toList()
        val writeIdx = insns.indexOfFirst { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            f != null && f.definingClass == "Lgc/c;" && f.name == "f" &&
                f.type == "Ljava/util/ArrayList;"
        }
        check(writeIdx > 0) {
            "Could not find the category adapter list write in Llc/f;->V; refusing to patch."
        }
        val store = insns[writeIdx] as? OneRegisterInstruction
            ?: error("The adapter list write is not a single-register store; refusing to patch a guess.")
        check(store.registerA <= 15) {
            "The adapter list write targets register ${store.registerA}; this hook keeps to the " +
                "low range on purpose. Refusing to patch rather than widen a register frame."
        }
        val listReg = "v${store.registerA}"

        // The typed overload is mandatory here, not cosmetic.
        //
        // This store targets `Lgc/c;->f`, declared Ljava/util/ArrayList;. Injecting the generic
        // onSubmitList leaves Ljava/util/List; in the register, and ART then rejects the WHOLE
        // method at class load:
        //
        //   [0x87] register v2 has type Reference: java.util.List
        //          but expected Reference: java.util.ArrayList
        //
        // which is the crash the reporter sees when opening Categories. The hook signature now
        // matches the field's own type, so the verifier has nothing to complain about.
        payload.addInstructions(
            writeIdx,
            """
                invoke-static {$listReg}, L$PINS;->onSubmitListTyped(Ljava/util/List;)Ljava/util/ArrayList;
                move-result-object $listReg
            """.trimIndent(),
        )

        // ---- 4 + 5. the category row -------------------------------------------------------
        val bind = SkTechCategoryBindFingerprint.method
        val row = bind.instructions.toList()

        // 4: the model read. `iget-object v0, p2, Lmc/b;->a` -> p1 is the row holder. gc.b holds
        //    u = card and v = title, which the profile tells the extension about.
        val modelIdx = row.indexOfFirst { i ->
            val f = (i as? ReferenceInstruction)?.fieldRef()
            f != null && f.definingClass == "Lmc/b;" && f.name == "a" &&
                f.type == "Ljava/lang/String;"
        }
        check(modelIdx >= 0) {
            "Could not find the category model read (Lmc/b->a) in Lgc/c;->d; refusing to patch."
        }

        // 5: the title setText, the first one after the model read. The method sets the image
        //    afterwards; anchoring after the model read is what keeps this off the wrong call.
        val setTextIdx = row.indices.firstOrNull { i ->
            if (i <= modelIdx) return@firstOrNull false
            val m = (row[i] as? ReferenceInstruction)?.methodRef()
            m != null && m.definingClass == "Landroid/widget/TextView;" && m.name == "setText" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;")
        }
        check(setTextIdx != null) {
            "Could not find the category title setText in Lgc/c;->d; refusing to patch."
        }

        // Insert the later hook first so the earlier index stays valid.
        bind.addInstructions(
            setTextIdx!! + 1,
            "invoke-static {v1}, L$PINS;->decorate(Landroid/view/View;)V",
        )
        bind.addInstructions(
            modelIdx + 1,
            "invoke-static {p1, p2}, L$PINS;->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
