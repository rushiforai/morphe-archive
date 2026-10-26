package app.template.patches.mydialog.power

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The server sends per-install feature flags inside `getDeviceSettings` that
 * hide whole app features (MITM-captured 2026-10-25): showO2A / showO2AShop /
 * showO2ABuy / showUber / showDeleteAccount are all `false`. The JS renders
 * those screens when a flag is true — they ship in the bundle but stay
 * invisible.
 *
 * This patch rewrites the flags to `true` in EVERY response body crossing the
 * native->JS bridge, at the single hand-off point:
 * com.toyberman.RNSslPinningModule$2.c(Call, Response) builds the JS response
 * map and delivers the raw body text via putString("bodyString", str). Right
 * after the body String is constructed (new String(bytes, "UTF-8")) we chain
 * String.replace for each pair `"flag":false` -> `"flag":true`.
 *
 * Why here: the ajaxCall stack is JS-driven (Hermes), so the only native
 * leverage over response contents is this bridge boundary. The rewrite is a
 * plain string replace — no JSON parsing, immune to JS obfuscation. Responses
 * without those keys pass through untouched (replace = no-op).
 *
 * Register safety: the insertion point is directly after the String ctor.
 * p1 (the byte[]) is NOT clobbered — the base64 response path re-reads it
 * later and the verifier type-merges both paths (first build died with
 * VerifyError "register v6 has type String but expected byte[]"). We use
 * v3/v4 instead: unwritten at the insert point, and the original code
 * redefines both before reading them. NO register-count bump — an in-place
 * bump would shift existing pN references and corrupt the method.
 *
 * Honest limits: flags only UNLOCK UI; the backing features may still need
 * server data or entitlements — a revealed screen can legitimately be empty.
 */
@Suppress("unused")
val myDialogHiddenFlagsPatch = bytecodePatch(
    name = "Unlock hidden feature flags",
    description = "Flips the server-sent feature flags showO2A/showO2AShop/" +
        "showO2ABuy/showUber/showDeleteAccount to true in every API response " +
        "before the JS sees it, revealing app screens the server hides.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        val cls = "Lcom/toyberman/RNSslPinningModule\$2;"
        val m = mutableClassDefBy(cls).methods.first {
            it.name == "c" && it.parameterTypes.size == 2
        }

        // Anchor: the unique const-string "UTF-8"; the String ctor is the next
        // instruction (invoke-direct {v0, p1, v1}) — insert right after it.
        val utf8 = m.indexOfFirstInstruction {
            (this as? ReferenceInstruction)?.reference.let { it as? StringReference }?.string == "UTF-8"
        }
        check(utf8 >= 0) { "UTF-8 const not found in RNSslPinningModule\$2.c" }
        val insertAt = utf8 + 2

        val smali = buildString {
            for (f in listOf("showO2A", "showO2AShop", "showO2ABuy", "showUber", "showDeleteAccount")) {
                // find/repl are the plain JSON text: "flag":false  (real quote chars)
                fun esc(s: String) = s.replace("\"", "\\\"")
                val find = esc("\"$f\":false")
                val repl = esc("\"$f\":true")
                append("const-string v3, \"$find\"\n")
                append("const-string v4, \"$repl\"\n")
                append("invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;\n")
                append("move-result-object v0\n")
            }
        }
        m.addInstructions(insertAt, smali)
    }
}
