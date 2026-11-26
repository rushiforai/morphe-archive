package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal val preRollAdsPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        // The player passes the same continuation to both the ad callback and its no-ad path.
        mutableClassDefBy("LlIlIllIIIIIlIIl;").methods.single {
            it.name == "IllIIlIlllIIIIII" && it.parameterTypes == listOf("Ljava/lang/Runnable;", "Z", "Z")
        }.addInstructions(
            0,
            """
                invoke-interface {p1}, Ljava/lang/Runnable;->run()V
                return-void
            """.trimIndent(),
        )
    }
}

private fun MutableMethod.openLyrics() {
    val instructions = checkNotNull(implementation).instructions
    val featureFlag = instructions.indices.single { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
            ?.string == "disable_lyrics_feature"
    }
    val upsell = instructions.indices.single { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
            ?.string == "try_to_go_lyrics"
    }
    check(featureFlag < upsell)
    val upsellBranch = (featureFlag + 1 until upsell).first { instructions[it].opcode == Opcode.IF_NEZ }
    replaceInstruction(upsellBranch, "nop")
}

@Suppress("unused")
val lyricsPatch = patch(
    name = "Open lyrics from the player",
    description = "Opens Deezer's lyrics view instead of the Premium prompt when a lyrics button is tapped.",
) {
    compatibleWith(deezerCompatibility)
    dependsOn(appBasePatch)

    execute {
        // The legacy and Compose players have separate click handlers for the same feature.
        mutableClassDefBy("LIIIIIllIIlIIl;").methods.single {
            it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;")
        }.openLyrics()
        mutableClassDefBy("LIlIlIIllllIllIII;").methods.single {
            it.name == "IIIllIlIlllII" && it.parameterTypes == listOf("LIlIIlIIlIIIIIIlI;", "LlllllIIlIIlIIl;")
        }.openLyrics()
    }
}
