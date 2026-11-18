package app.gboardios.patches.defcache

import app.gboardios.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.gboardios.patches.signature.signatureCheckBypassPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * `KeyboardDefManager.requestKeyboardDef()` (class `qcb` in Gboard 18.5.4) keeps the parsed
 * keyboard definitions in a cache that is stored in the app data, so it survives updates. Its
 * key is computed from the keyboard definition ids only:
 *
 *     String key = (String) cache.keyFunction.apply(defIds);
 *     cache.store.get(key, ...)   // and put(key, ...) after parsing
 *
 * so a patched Gboard that is updated over an older one keeps showing the old keys until its
 * data is cleared. The patch appends a suffix that is unique to each patching run to that key:
 * the first time after an update, nothing is found under the new keys and the definitions are
 * parsed and cached again; after that, the cache works as usual.
 *
 * The register that receives the next `new-instance` right after the key is computed is free at
 * that point, so it holds the suffix.
 */
internal object KeyboardDefCacheKeyFingerprint : Fingerprint(
    strings = listOf("requestKeyboardDef(): getOrCreate from cache, info=%s"),
    filters = listOf(
        methodCall(name = "apply", returnType = "Ljava/lang/Object;"),
    ),
)

/** Used by the patches that change keyboard definitions, so that their updates show up. */
internal val keyboardDefCacheRefreshPatch = patch(
    description = "Makes Gboard rebuild its cached keyboard definitions once after the patched app is updated.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(signatureCheckBypassPatch)

    execute {
        val method = KeyboardDefCacheKeyFingerprint.method
        val applyIndex = KeyboardDefCacheKeyFingerprint.instructionMatches.first().index

        val moveResult = method.getInstruction(applyIndex + 1)
        check(moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) { "Unexpected instruction after the cache key" }
        val keyRegister = (moveResult as OneRegisterInstruction).registerA

        val next = method.getInstruction(applyIndex + 2)
        check(next.opcode == Opcode.NEW_INSTANCE) { "Unexpected instruction after the cache key" }
        val freeRegister = (next as OneRegisterInstruction).registerA
        check(freeRegister != keyRegister) { "No free register next to the cache key" }

        val suffix = "#gboardios-${System.currentTimeMillis()}"
        method.addInstructions(
            applyIndex + 2,
            """
                check-cast v$keyRegister, Ljava/lang/String;
                const-string v$freeRegister, "$suffix"
                invoke-virtual {v$keyRegister, v$freeRegister}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$keyRegister
            """,
        )
    }
}
