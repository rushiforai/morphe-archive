package dev.jason.gboardpatches.patches.gboard.features.ioslayout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

/**
 * `KeyboardDefManager.requestKeyboardDef()` keeps the parsed keyboard definitions in a cache that is
 * stored in the app data, so it survives updates. Its key is computed from the keyboard definition
 * ids only:
 *
 *     String key = (String) cache.keyFunction.apply(defIds);
 *     cache.store.get(key, ...)   // and put(key, ...) after parsing
 *
 * so an updated patched Gboard keeps showing the old keys until its data is cleared. The patch
 * appends a suffix that is unique to each patching run to that key: the first time after an update
 * nothing is found under the new keys, the definitions are parsed and cached again, and after that
 * the cache works as usual.
 *
 * The register that receives the next `new-instance` right after the key is computed is free at that
 * point, so it holds the suffix.
 *
 * Ported from twelvehouse/gboard-ios-style-jp-en-morphe-patches (GPLv3); it is a dependency of the
 * layout patches, not a published entry of its own.
 */
internal object GboardKeyboardDefCacheKeyFingerprint : Fingerprint(
    strings = listOf("requestKeyboardDef(): getOrCreate from cache, info=%s"),
    filters = listOf(
        methodCall(name = "apply", returnType = "Ljava/lang/Object;"),
    ),
)

internal val gboardKeyboardDefCacheRefreshPatch = bytecodePatch(
    description = "Makes Gboard rebuild its cached keyboard definitions once after the patched app is updated.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val method = GboardKeyboardDefCacheKeyFingerprint.method
        val applyIndex = GboardKeyboardDefCacheKeyFingerprint.instructionMatches.first().index

        val moveResult = method.getInstruction(applyIndex + 1)
        check(moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
            "Unexpected instruction after the cache key"
        }
        val keyRegister = (moveResult as OneRegisterInstruction).registerA

        val next = method.getInstruction(applyIndex + 2)
        check(next.opcode == Opcode.NEW_INSTANCE) { "Unexpected instruction after the cache key" }
        val freeRegister = (next as OneRegisterInstruction).registerA
        check(freeRegister != keyRegister) { "No free register next to the cache key" }

        val suffix = "#gboard-ios-layout-${System.currentTimeMillis()}"
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
