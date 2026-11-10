package app.zdrgon.patches.rainviewer.integrity

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.rainviewer.shared.Constants
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

@Suppress("unused")
val bypassIntegrityCheckPatch = bytecodePatch(
    name = "Bypass integrity check",
    description = "Stops the Play Integrity (Raindrop) verdict from blocking the app. " +
        "If the app already shows App Blocked, reinstall it fresh after patching.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // The block is a server verdict in two steps: the app POSTs a Play
        // Integrity token to mobile/verify/android/raindrop/, the server
        // flags this install's API key when the verdict fails (a re-signed
        // build always fails app recognition), and from then on API
        // responses carry code "81", which the response checker turns into
        // the BLOCKED error state behind the App Blocked dialog.
        //
        // Step one never has to happen: Ljz5;->b is the token fetch, and
        // its only caller posts the token — a null token aborts the post.
        // Return null before any Play Integrity code runs, so no verdict is
        // ever sent for this install. (Returning a value directly is the
        // normal non-suspending completion for a suspend function.)
        RaindropTokenFingerprint.method.addInstructions(
            0,
            "const/4 v0, 0x0\n" +
                "return-object v0",
        )
        logger.info("RainViewer: Raindrop integrity token fetch disabled.")

        // Belt and braces, in case an install's key was already flagged
        // before this patch: in Lsl;->e the "81" code is the only one that
        // throws Lez5; (the blocked exception). Its throw site is the
        // new-instance of Lez5; that is immediately followed by a THROW of
        // the same register (the other Lez5; allocation in the method is a
        // dead pre-allocation with no throw after it). Return true (OK)
        // instead of throwing, leaving every other response code — 88,
        // 400, 5001, 5002, 5009, 11404 — handled exactly as stock.
        //
        // The return is inserted at the THROW, not at the new-instance:
        // the throw blocks at the end of the method are reached by
        // branches that target the new-instance instruction itself, and
        // instructions inserted at a branch target are skipped by the
        // branch-taken path. The throw is reached by fall-through from
        // the <init> call, so inserting there intercepts every path.
        // (First shipped version inserted at the new-instance; on-device
        // the blocked screen still flashed once when an 81 came back.)
        ApiResponseCodeFingerprint.method.run {
            val insns = instructions.toList()
            val blockedIndex = insns.indices.firstOrNull { idx ->
                insns[idx].opcode == Opcode.NEW_INSTANCE &&
                    insns[idx].getReference<TypeReference>()?.type == "Lez5;" &&
                    idx + 2 < insns.size &&
                    insns[idx + 2].opcode == Opcode.THROW &&
                    (insns[idx + 2] as? OneRegisterInstruction)?.registerA ==
                    (insns[idx] as? OneRegisterInstruction)?.registerA
            } ?: throw PatchException("Could not find the blocked (81) throw in the API response checker.")
            val register = (insns[blockedIndex] as OneRegisterInstruction).registerA
            addInstructions(
                blockedIndex + 2,
                "const/4 v$register, 0x1\n" +
                    "return v$register",
            )
        }
        logger.info("RainViewer: API response code 81 (blocked) neutralized.")
    }
}
