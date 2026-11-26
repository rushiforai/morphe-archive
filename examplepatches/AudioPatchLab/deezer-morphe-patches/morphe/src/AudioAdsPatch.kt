package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val AUDIO_AD_CONTROLLER = "LllIllIIIIIIlIII;"

internal val audioAdsPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val schedule = mutableClassDefBy(AUDIO_AD_CONTROLLER).methods.single {
            it.name == "IllIlllIIIllIlII" &&
                it.parameterTypes == listOf("Ljava/lang/Runnable;") && it.returnType == "V"
        }
        check(checkNotNull(schedule.implementation).instructions.any {
            it.opcode == Opcode.IPUT_OBJECT && (it as ReferenceInstruction).reference.toString() ==
                "LllIllIIIIIIlIII;->IlIIllIlllllllIl:Ljava/lang/Runnable;"
        })

        // Follow the existing no-ad completion path before the controller can queue an ad.
        schedule.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :finished
                invoke-interface {p1}, Ljava/lang/Runnable;->run()V
                :finished
                return-void
            """.trimIndent(),
        )
    }
}
