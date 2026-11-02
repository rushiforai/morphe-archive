package dev.hyzor.patches.duolingo.misc.debug

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.hyzor.patches.duolingo.shared.Constants.DUOLINGO
import dev.hyzor.patches.duolingo.shared.integrity.disableLoginIntegrityPatch
import dev.hyzor.patches.util.addInstructionsBeforeReturn
import dev.hyzor.patches.util.constructor
import dev.hyzor.patches.util.getReference

/**
 * `BuildConfigProvider`-style class whose `isDebug` field decides `BUILD_TARGET`, and with it the
 * hidden developer menu in Settings. The class is obfuscated, so it is found through the field
 * reference in the `BUILD_TARGET` provider.
 */
@Suppress("unused")
val enableDebugModePatch = bytecodePatch(
    name = "Enable debug mode",
    description = "Enables hidden debug menu in settings.",
    default = false,
) {
    compatibleWith(DUOLINGO)

    dependsOn(disableLoginIntegrityPatch)

    execute {
        val isDebugFieldRef = BuildTargetFieldFingerprint.match()
            .instructionMatches.first()
            .instruction
            .getReference<FieldReference>()
            ?: throw PatchException("Could not find the isDebug field reference")

        val buildConfigProviderClass = mutableClassDefBy(isDebugFieldRef.definingClass)

        buildConfigProviderClass.constructor.addInstructionsBeforeReturn(
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, ${buildConfigProviderClass.type}->${isDebugFieldRef.name}:Z
            """.trimIndent(),
        )
    }
}
