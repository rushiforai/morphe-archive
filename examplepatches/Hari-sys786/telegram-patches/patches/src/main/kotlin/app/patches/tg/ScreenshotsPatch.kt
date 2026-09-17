package app.patches.tg

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.patches.tg.TgSupport.constLiteral
import app.patches.tg.TgSupport.desc
import app.patches.tg.TgSupport.forceFieldReads
import app.patches.tg.TgSupport.referencesWindowFlags
import app.patches.tg.TgSupport.replaceConst
import app.patches.tg.TgSupport.replaceOrIntLit16
import app.patches.tg.TgSupport.replaceWithSmali
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Patch 13 — Enable screenshots.
 *
 * Three sub-transforms, mirroring the reference patcher:
 *  a) In classes that call Window.{add,clear}Flags, neutralise the `const/16 .., 0x2000`
 *     (FLAG_SECURE) window-flag value.
 *  b) Force reads of SharedConfig.allowScreenCapture and *->allowScreenshots to true.
 *  c) In SecretMediaViewer/PhotoViewer clear the 0x2000 bit from the OR-ed window flags and
 *     fix the secret-media window flag constant in SecretMediaViewer.
 */
@Suppress("unused")
val enableScreenshotsPatch = bytecodePatch(
    name = "Enable screenshots",
    description = "Removes FLAG_SECURE everywhere (window flags, allowScreenCapture, allowScreenshots, " +
        "secret media viewers).",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    execute {
        // (a) window flags — immutable scan for the affected classes first.
        val windowTypes = ArrayList<String>()
        classDefForEach { classDef ->
            if (referencesWindowFlags(classDef)) windowTypes += classDef.type
        }

        var windowEdits = 0
        for (type in windowTypes) {
            val clazz = mutableClassDefByOrNull(type) ?: continue
            for (method in clazz.methods) {
                val impl = method.implementation ?: continue
                impl.instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode == Opcode.CONST_16 && constLiteral(instruction) == 0x2000L) {
                        val register = (instruction as OneRegisterInstruction).registerA
                        method.replaceWithSmali(index, "const/16 v$register, 0x0")
                        windowEdits++
                    }
                }
            }
        }
        if (windowEdits == 0) {
            throw PatchException("Enable screenshots: no const/16 0x2000 found in Window-flag classes")
        }

        // (b) allowScreenCapture / allowScreenshots
        forceFieldReads(
            opcodes = setOf(Opcode.SGET_BOOLEAN),
            fieldName = "allowScreenCapture",
            constRead = { dest -> "const/4 v$dest, 0x1" },
            fieldClassFilter = { it == desc("org/telegram/messenger/SharedConfig") },
            minimum = 1,
        )
        forceFieldReads(
            opcodes = setOf(Opcode.IGET_BOOLEAN),
            fieldName = "allowScreenshots",
            constRead = { dest -> "const/4 v$dest, 0x1" },
            fieldClassFilter = { it.startsWith("Lorg/telegram/ui/") },
            minimum = 1,
        )

        // (c) secret media viewers
        var orEdits = 0
        for (className in listOf("org/telegram/ui/SecretMediaViewer", "org/telegram/ui/PhotoViewer")) {
            val clazz = mutableClassDefByOrNull(desc(className)) ?: continue
            clazz.methods.forEach { method -> orEdits += replaceOrIntLit16(method, 0x2000, 0x0) }
        }
        if (orEdits == 0) {
            throw PatchException("Enable screenshots: no or-int/lit16 0x2000 in SecretMediaViewer/PhotoViewer")
        }

        var constEdits = 0
        mutableClassDefByOrNull(desc("org/telegram/ui/SecretMediaViewer"))?.methods?.forEach { method ->
            constEdits += replaceConst(method, Opcode.CONST, -0x7ffedef8L, -0x7ffefef8L)
        }
        if (constEdits == 0) {
            throw PatchException("Enable screenshots: no const -0x7ffedef8 in SecretMediaViewer")
        }
    }
}
