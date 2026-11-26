package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val playbackRestorePatch = patch {
    compatibleWith(deezerCompatibility)
    execute {
        // Cold restoration checks the effective MOD feature again, independently of
        // selectable rows. Keep that verdict consistent with on-demand playback.
        val feature = mutableClassDefBy("Lcom/deezer/core/data/model/policy/lIIIIIlllllIIIII;").methods.single {
            it.name == "IIIlIIIIIIIlIl" && it.parameterTypes == listOf("LIIllIlIllllllIlI;") &&
                it.returnType == "Z"
        }
        check(checkNotNull(feature.implementation).instructions.any {
            (it as? ReferenceInstruction)?.reference.toString() ==
                "Lcom/deezer/core/data/model/policy/lIIIIIlllllIIIII;->IIllIIlIIIlIIlll:I"
        })
        feature.addInstructionsWithLabels(0, """
            sget-object v0, LIIllIlIllllllIlI;->lIIlIlIllIl:LIIllIlIllllllIlI;
            if-ne p1, v0, :native
            const/4 v0, 0x1
            return v0
            :native
            nop
        """.trimIndent())
    }
}
