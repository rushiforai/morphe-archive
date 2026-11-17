package app.template.patches.daylio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_DAYLIO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Daylio 1.72.0 (291) - retargeted from 1.71.1 (289).
//
// Obfuscated names move between builds (1.71.1 -> 1.72.0 shifted the preferences holder
// Lt38; -> Lq48; and the pref-key type Ls38; -> Lp48;), so every target below was re-derived from
// the 1.72.0 dex rather than assumed, and each one is validated structurally before anything is
// edited. If the layout does not match, the patch refuses instead of editing blind.
//
// How premium is decided in this app
// ----------------------------------
// Every premium flag is a static key object read through ONE accessor:
//
//     q48.f(Lp48 key) -> Object      the reader used by ~everything
//     q48.i(Lp48 key, Object value)  the writer used by ~everything
//
//     IS_PRO_VERSION_PURCHASED -> q48.E
//     IS_PREMIUM_EXPIRED       -> q48.e1
//
// So the patch pins those two keys at both ends:
//   * the reader answers TRUE for E and FALSE for e1, whatever is stored;
//   * the writer ignores writes to E and e1, so a "premium lost"/"premium expired" event coming
//     back from the billing backend cannot put the app back to free while it runs.
//
// 1.71.1 did this by replacing two event-handler bodies. Pinning the write path instead is both
// smaller and stricter: it covers every writer, not the two that were known about, and it leaves
// the handlers' own callback dispatch completely untouched.
//
// This is a local unlock. Anything that needs the billing backend (restore purchase, cloud
// entitlements) will still behave as it does on a free account.

private val preferenceInit = Fingerprint(
    definingClass = "Lq48;", name = "<clinit>", returnType = "V", parameters = emptyList(),
)
private val preferenceGet = Fingerprint(
    definingClass = "Lq48;", name = "f", returnType = "Ljava/lang/Object;", parameters = listOf("Lp48;"),
)
private val preferenceSet = Fingerprint(
    definingClass = "Lq48;", name = "i", returnType = "V", parameters = listOf("Lp48;", "Ljava/lang/Object;"),
)

private fun reference(i: com.android.tools.smali.dexlib2.iface.instruction.Instruction) =
    (i as? ReferenceInstruction)?.reference
private fun field(i: com.android.tools.smali.dexlib2.iface.instruction.Instruction) = reference(i) as? FieldReference
private fun method(i: com.android.tools.smali.dexlib2.iface.instruction.Instruction) = reference(i) as? MethodReference
private fun str(i: com.android.tools.smali.dexlib2.iface.instruction.Instruction) = (reference(i) as? StringReference)?.string

/**
 * True when the method already reads one of the two premium keys. The stock reader and writer are
 * generic (neither ever mentions E or e1), so such a read can only be this patch's own prologue.
 * Used to make the card idempotent: re-patching an already-patched APK must not stack a second pin.
 */
private fun MutableMethod.alreadyPinsPremium(): Boolean = instructions.any { i ->
    i.opcode == Opcode.SGET_OBJECT && (i as? ReferenceInstruction)?.reference.let {
        it is FieldReference && it.definingClass == "Lq48;" && (it.name == "E" || it.name == "e1")
    }
}

internal val enableDaylioPremium = bytecodePatch(
    name = "Enable premium",
    description = "Unlocks Daylio's local premium state. Account- or server-dependent features (restore " +
        "purchase, cloud entitlements) still behave as they do on a free account; this is not a purchase.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DAYLIO)
    execute {
        check(packageMetadata.packageName == "net.daylio" && packageMetadata.versionName == "1.72.0" &&
            packageMetadata.versionCode == "291") { "Unsupported Daylio build; this patch targets 1.72.0 (291)." }

        // ---- 1. the two premium keys must still map to the two fields we know about -------------
        val init = preferenceInit.method.instructions.toList()
        fun keyMapsTo(key: String, fieldName: String): Boolean {
            val indexes = init.indices.filter { str(init[it]) == key }
            if (indexes.size != 1) return false
            val i = indexes.single()
            val constructor = init.getOrNull(i + 1)?.let(::method)
            val stored = init.getOrNull(i + 2)?.let(::field)
            return init.getOrNull(i + 1)?.opcode == Opcode.INVOKE_DIRECT &&
                init.getOrNull(i + 2)?.opcode == Opcode.SPUT_OBJECT &&
                constructor?.definingClass == "Lp48;" &&
                stored?.definingClass == "Lq48;" && stored.name == fieldName && stored.type == "Lp48;"
        }
        check(keyMapsTo("IS_PRO_VERSION_PURCHASED", "E")) { "Unexpected mapping for IS_PRO_VERSION_PURCHASED." }
        check(keyMapsTo("IS_PREMIUM_EXPIRED", "e1")) { "Unexpected mapping for IS_PREMIUM_EXPIRED." }

        // ---- 2. the reader must still be the one shared accessor -------------------------------
        val get = preferenceGet.method
        val getInstructions = get.instructions.toList()
        check(get.accessFlags and 0x8 != 0) { "premium reader is no longer static." }
        check(get.implementation?.registerCount ?: 0 >= 3) { "premium reader lost its registers." }
        check(getInstructions.any {
            val m = method(it)
            m?.definingClass == "Landroid/content/SharedPreferences;" && m.name == "getBoolean"
        }) { "premium reader no longer reads a boolean preference." }

        // ---- 3. the writer must still be the one shared setter ---------------------------------
        val set = preferenceSet.method
        check(set.accessFlags and 0x8 != 0) { "premium writer is no longer static." }
        check((set.implementation?.registerCount ?: 0) >= 3) { "premium writer lost its registers." }

        // Snapshot both methods BEFORE editing them: the idempotency test must describe the input
        // APK, not the state we are about to create. (Testing afterwards makes a fresh stock APK
        // look "already pinned", which is what a previous version of this log line got wrong.)
        val readerWasPinned = get.alreadyPinsPremium()
        val writerWasPinned = set.alreadyPinsPremium()

        // ---- 4. pin the reader ------------------------------------------------------------------
        // Prepended, so the original body stays intact and simply becomes unreachable for these keys.
        if (readerWasPinned) {
            println("Daylio premium: reader already pinned - leaving it (re-patched APK).")
        } else {
        get.addInstructionsWithLabels(
            0,
            """
                sget-object v0, Lq48;->E:Lp48;
                if-ne p0, v0, :daylio_check_expired
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
                :daylio_check_expired
                sget-object v0, Lq48;->e1:Lp48;
                if-ne p0, v0, :daylio_ordinary
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
                :daylio_ordinary
                nop
            """.trimIndent(),
        )
        }

        // ---- 5. pin the writer ------------------------------------------------------------------
        // No event from the billing backend can turn premium off while the app runs.
        if (writerWasPinned) {
            println("Daylio premium: writer already pinned - leaving it (re-patched APK).")
        } else {
        set.addInstructionsWithLabels(
            0,
            """
                sget-object v0, Lq48;->E:Lp48;
                if-ne p0, v0, :daylio_set_expired
                return-void
                :daylio_set_expired
                sget-object v0, Lq48;->e1:Lp48;
                if-ne p0, v0, :daylio_set_ordinary
                return-void
                :daylio_set_ordinary
                nop
            """.trimIndent(),
        )
        }

        if (readerWasPinned && writerWasPinned) {
            println("Daylio premium: reader and writer already pinned - nothing to do (re-patched APK).")
        } else {
            println(
                "Daylio premium: IS_PRO_VERSION_PURCHASED pinned TRUE and IS_PREMIUM_EXPIRED pinned FALSE " +
                    "(reader q48.f + writer q48.i).",
            )
        }
    }
}
