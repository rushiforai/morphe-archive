package app.template.patches.yandexnavi

import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_YANDEX_NAVIGATOR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Removes the block in **`Lcom/yandex/passport/internal/c0;->a(...)`** (`releaseRuntimeChecks`) that builds
 * `IllegalStateException("Internal error, application signature mismatch")`, logs **PassportRuntime**, and posts the
 * error runnable — so a Morphe‑signed APK can continue past Passport init without relying on the debuggable manifest path.
 *
 * **Fragile** across Navigator / Passport updates; prefer [debuggableApplicationManifestPatch] when acceptable.
 */
@Suppress("unused")
val passportSignatureMismatchCrashBypassPatch = bytecodePatch(
    name = "Bypass Passport signature mismatch crash",
    description = "Strips the IllegalStateException + PassportRuntime handler block in c0.releaseRuntimeChecks (smali-aligned).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YANDEX_NAVIGATOR)

    execute {
        val method = PassportReleaseRuntimeChecksSignatureCrashFingerprint.method
            ?: throw PatchException("Passport releaseRuntimeChecks fingerprint not resolved")

        method.apply {
            val impl = implementation
                ?: throw PatchException("Passport c0.a has no implementation")

            val arr = impl.instructions.toList()
            val strIdx = arr.indexOfFirst { insn ->
                val op = insn.opcode
                if (op != Opcode.CONST_STRING && op != Opcode.CONST_STRING_JUMBO) return@indexOfFirst false
                val ref = (insn as ReferenceInstruction).reference
                ref is StringReference &&
                    (ref as StringReference).string == "Internal error, application signature mismatch"
            }
            if (strIdx < 1) {
                throw PatchException("const-string signature mismatch not found in c0.a")
            }
            val newInstanceIdx = strIdx - 1
            if (arr[newInstanceIdx].opcode != Opcode.NEW_INSTANCE) {
                throw PatchException("Expected NEW_INSTANCE before signature mismatch string")
            }

            var endExclusive = strIdx + 1
            while (endExclusive < arr.size) {
                val insn = arr[endExclusive]
                if (insn.opcode == Opcode.INVOKE_VIRTUAL) {
                    val ref = (insn as ReferenceInstruction).reference as? MethodReference
                    if (ref?.definingClass == "Landroid/os/Handler;" && ref.name == "post") {
                        endExclusive++
                        break
                    }
                }
                endExclusive++
            }

            removeInstructions(newInstanceIdx, endExclusive - newInstanceIdx)
        }
    }
}
