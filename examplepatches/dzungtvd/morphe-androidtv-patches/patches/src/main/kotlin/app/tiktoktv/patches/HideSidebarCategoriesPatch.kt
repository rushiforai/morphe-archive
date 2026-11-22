package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val hideSidebarCategoriesPatch = bytecodePatch(
    name = "Remove TV sidebar categories",
    description = "Empties the TV category lists so the sidebar only shows Search, For You, and Following, like TikTok Lite.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)

    execute {
        // Hardcoded list: Funny, Movies & TV, Food & Cooking, Music, More.
        TvCategoryListFingerprint.let { fingerprint ->
            val listRegister = fingerprint.method
                .getFreeRegisterProvider(0, 1)
                .getFreeRegister4Bit()

            fingerprint.method.addInstructions(
                0,
                """
                    new-instance v$listRegister, Ljava/util/ArrayList;
                    invoke-direct { v$listRegister }, Ljava/util/ArrayList;-><init>()V
                    return-object v$listRegister
                """,
            )
        }

        // Remote list: returns the cached category list. Clearing it is the last work
        // the method does, so return the empty list right after the clear.
        RemoteCategoryListFingerprint.let { fingerprint ->
            val listRegister = fingerprint.instructionMatches.first()
                .getInstruction<OneRegisterInstruction>().registerA
            val clearIndex = fingerprint.instructionMatches[1].index

            fingerprint.method.addInstruction(clearIndex + 1, "return-object v$listRegister")
        }
    }
}
