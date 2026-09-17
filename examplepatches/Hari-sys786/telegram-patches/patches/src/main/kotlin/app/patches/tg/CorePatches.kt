package app.patches.tg

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.patches.tg.TgSupport.constLiteral
import app.patches.tg.TgSupport.forceFieldReads
import app.patches.tg.TgSupport.methodsAnywhere
import app.patches.tg.TgSupport.replaceConst
import app.patches.tg.TgSupport.replaceMethodBody
import app.patches.tg.TgSupport.replaceWithSmali
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * tgpatcher_final.py patches 1-7 (patch 5 lives in StoriesPatches.kt).
 */

/**
 * Patch 22 — Increase upload speed.
 *
 * R8 inlined the constants, so the field declarations
 * (`initialRequestsCount`, `maxUploadingKBytes`, ...) are dead in the DEX — the live values sit in
 * FileUploadOperation.startUploadRequest():
 *
 *     const/16 v0, 0x20   / const/16 v0, 0x800   (slow network / normal)
 *     div-int/2addr v0, uploadChunkSize
 *     max -> maxRequestsCount
 *
 * 0x800 KB/s / 512 KB parts = the stock 4 parallel upload requests. Raising it to 0x2000 (8 MB/s)
 * allows up to 4x more parallel parts. The 0x20 slow-network branch is left untouched.
 */
@Suppress("unused")
val increaseUploadSpeedPatch = bytecodePatch(
    name = "Increase upload speed",
    description = "Raises FileUploadOperation's inlined throughput cap (0x800 -> 0x2000) so Telegram " +
        "uses up to 4x more parallel upload parts (maxRequestsCount).",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        val method = methodsAnywhere("startUploadRequest").firstOrNull { candidate ->
            val implementation = candidate.implementation ?: return@firstOrNull false
            implementation.instructions.any { it.opcode == Opcode.CONST_16 && constLiteral(it) == 0x800L } &&
                implementation.instructions.any { it.opcode == Opcode.CONST_16 && constLiteral(it) == 0x20L }
        } ?: throw PatchException("FileUploadOperation.startUploadRequest() throughput cap not found")

        val edits = replaceConst(method, Opcode.CONST_16, 0x800L, 0x2000L)
        if (edits == 0) {
            throw PatchException("startUploadRequest(): no 0x800 throughput cap replaced")
        }
    }
}

/** Patch 1 — Disable signature verification. */
@Suppress("unused")
val disableSignatureVerificationPatch = bytecodePatch(
    name = "Disable signature verification",
    description = "Forces AndroidUtilities.getCertificateSHA256Fingerprint() to return the mod's known " +
        "certificate SHA-256 so the official Telegram build can run after a repack.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        replaceMethodBody(
            classType = TgSupport.desc("org/telegram/messenger/AndroidUtilities"),
            name = "getCertificateSHA256Fingerprint",
            locals = 1,
            body = """
                const-string v0, "49C1522548EBACD46CE322B6FD47F6092BB745D0F88082145CAF35E14DCC38E1"
                return-object v0
            """.trimIndent(),
        )
    }
}

/** Patch 2 — UserConfig.isPremium() -> true. */
@Suppress("unused")
val premiumUserConfigPatch = bytecodePatch(
    name = "Force premium (UserConfig.isPremium)",
    description = "Makes UserConfig.isPremium() always return true.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        replaceMethodBody(
            classType = TgSupport.desc("org/telegram/messenger/UserConfig"),
            name = "isPremium",
            locals = 1,
            body = """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}

/** Patch 3 — StoriesController isPremium(long) -> true. */
@Suppress("unused")
val premiumStoriesControllerPatch = bytecodePatch(
    name = "Force premium (StoriesController.isPremium)",
    description = "Makes StoriesController.isPremium(long) always return true so stories premium features are unlocked.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        replaceMethodBody(
            classType = TgSupport.desc("org/telegram/ui/Stories/StoriesController"),
            name = "isPremium",
            parameters = listOf("J"),
            locals = 1,
            body = """
                const/4 p1, 0x1
                return p1
            """.trimIndent(),
        )
    }
}

/**
 * Patch 4 — PremiumPreviewFragment.forcePremium() -> true.
 *
 * The reference patcher rewrote the synthetic accessor `access$3000(PremiumPreviewFragment)Z`,
 * which does not exist in 12.10.1. Forcing every read of the `forcePremium` field to true is the
 * version-independent equivalent.
 */
@Suppress("unused")
val premiumPreviewFragmentPatch = bytecodePatch(
    name = "Force premium (PremiumPreviewFragment.forcePremium)",
    description = "Forces every read of PremiumPreviewFragment.forcePremium to true.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        forceFieldReads(
            opcodes = setOf(Opcode.IGET_BOOLEAN),
            fieldName = "forcePremium",
            constRead = { dest -> "const/4 v$dest, 0x1" },
            fieldClassFilter = { it == TgSupport.desc("org/telegram/ui/PremiumPreviewFragment") },
            minimum = 1,
        )
    }
}

/** Patch 6 — isPremiumFeatureAvailable(int) -> true. */
@Suppress("unused")
val premiumFeatureAvailablePatch = bytecodePatch(
    name = "Force premium feature available",
    description = "Makes isPremiumFeatureAvailable(...) report available by flipping its false constant to true.",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        val method = methodsAnywhere("isPremiumFeatureAvailable", listOf("I")).firstOrNull()
            ?: methodsAnywhere("isPremiumFeatureAvailable", listOf("I", "I")).firstOrNull()
            ?: throw PatchException("isPremiumFeatureAvailable(I)Z / (II)Z not found")

        val impl = method.implementation
            ?: throw PatchException("isPremiumFeatureAvailable has no implementation")
        var edits = 0
        impl.instructions.forEachIndexed { index, instruction ->
            if (instruction.opcode != Opcode.CONST_4) return@forEachIndexed
            val register = (instruction as OneRegisterInstruction).registerA
            if (register == 1 && constLiteral(instruction) == 0L) {
                method.replaceWithSmali(index, "const/4 v1, 0x1")
                edits++
            }
        }
        if (edits == 0) throw PatchException("No 'const/4 v1, 0x0' found in isPremiumFeatureAvailable")
    }
}

/** Patch 7 — Download speed boost (FileLoadOperation.updateParams). */
@Suppress("unused")
val downloadSpeedPatch = bytecodePatch(
    name = "Increase download speed",
    description = "Raises FileLoadOperation.updateParams() chunk size (0x20000 -> 0x80000) and max requests (4 -> 8).",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        val method = methodsAnywhere("updateParams").firstOrNull { candidate ->
            candidate.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.CONST_HIGH16 && constLiteral(instruction) == 0x20000L
            } == true
        } ?: throw PatchException("updateParams()V with const/high16 0x20000 not found")

        val impl = method.implementation!!
        var edits = 0
        impl.instructions.forEachIndexed { index, instruction ->
            when {
                instruction.opcode == Opcode.CONST_HIGH16 && constLiteral(instruction) == 0x20000L -> {
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceWithSmali(index, "const/high16 v$register, 0x80000")
                    edits++
                }
                instruction.opcode == Opcode.CONST_4 && constLiteral(instruction) == 4L -> {
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceWithSmali(index, "const/16 v$register, 0x8")
                    edits++
                }
            }
        }
        if (edits == 0) throw PatchException("updateParams(): no speed constants replaced")
    }
}
