package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal val displayAdsPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        // Report display ads as disabled in the policy model.
        val hasAdType = mutableClassDefBy("Lcom/deezer/core/data/model/policy/lIIIIIlllllIIIII;").methods.single {
            it.name == "IIIIlIIllIIlIIIl" && it.parameterTypes == listOf("LIllllIlllllllIll;") && it.returnType == "Z"
        }
        check(
            checkNotNull(hasAdType.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "Lcom/deezer/core/data/model/policy/lIIIIIlllllIIIII;->lIlIIlIIlIlIll:I"
            },
        )
        hasAdType.addInstructionsWithLabels(
            0,
            """
                sget-object v0, LIllllIlllllllIll;->lIIlIlIllIl:LIllllIlllllllIll;
                if-ne p1, v0, :original
                const/4 v0, 0x0
                return v0
                :original
                nop
            """.trimIndent(),
        )

        // Disable banner placements and ad-unit path generation on album, playlist, and artist pages.
        val displayAdHelper = mutableClassDefBy("LIIIlllIllllIllIl;")
        val isBannerEnabled = displayAdHelper.methods.single {
            it.name == "lIIlIIlIlllllII" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        check(
            checkNotNull(isBannerEnabled.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    (instruction as ReferenceInstruction).reference.toString() == "banner"
            },
        )
        isBannerEnabled.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        val adUnitPath = displayAdHelper.methods.single {
            it.name == "IllIlllIIIllIlII" && it.parameterTypes == listOf("Ljava/lang/String;") && it.returnType == "Ljava/lang/String;"
        }
        check(
            checkNotNull(adUnitPath.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    (instruction as ReferenceInstruction).reference.toString() == "smart"
            },
        )
        adUnitPath.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )

        // Skip loading native ad cards on the home feed.
        val homeNativeAdLoader = mutableClassDefBy("LIIIIIIlIllIIlIIl;").methods.single {
            it.name == "lIIlIlIllIl" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        check(
            checkNotNull(homeNativeAdLoader.implementation).instructions.any { instruction ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "LIIIIIIlIllIIlIIl;->lIIllIIlIlIllI:LIIIllIIlIIIIIIIl;"
            },
        )
        homeNativeAdLoader.addInstructions(0, "return-void")
    }
}
