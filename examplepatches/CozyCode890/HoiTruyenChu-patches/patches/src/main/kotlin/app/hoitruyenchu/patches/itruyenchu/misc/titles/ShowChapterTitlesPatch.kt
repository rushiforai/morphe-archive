package app.hoitruyenchu.patches.itruyenchu.misc.titles

import app.hoitruyenchu.patches.itruyenchu.misc.extension.sharedExtensionPatch
import app.hoitruyenchu.patches.itruyenchu.shared.ASYNC_STORAGE_MODULE
import app.hoitruyenchu.patches.itruyenchu.shared.AsyncStorageMultiGetFingerprint
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_CHAPTER_TITLES
import app.hoitruyenchu.patches.itruyenchu.shared.CreateClientBuilderFingerprint
import app.hoitruyenchu.patches.itruyenchu.shared.OKHTTP_CLIENT_BUILDER
import app.hoitruyenchu.patches.itruyenchu.shared.READABLE_ARRAY
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val showChapterTitlesPatch = patch(
    name = "Show chapter titles",
    description = "Shows the real chapter titles instead of \"Vô Đề Mục\" in the chapter list, the reader " +
            "and the TTS: books whose chapter list only has \"Chương N\" get the title from the first " +
            "line of the chapter text (public preview, no login needed), cached on the device.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    dependsOn(sharedExtensionPatch)

    execute {
        // 1. The chapter list downloaded by the app gets the real titles.
        CreateClientBuilderFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
                .forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstruction(
                        index,
                        "invoke-static { v$register }, $EXTENSION_CHAPTER_TITLES->" +
                                "onCreateClientBuilder($OKHTTP_CLIENT_BUILDER)V",
                    )
                }
        }

        // 2. So does the copy the app keeps in AsyncStorage (refreshed only every hour).
        AsyncStorageMultiGetFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $ASYNC_STORAGE_MODULE->executor:Lcom/reactnativecommunity/asyncstorage/SerialExecutor;
                invoke-static { p1, v0 }, $EXTENSION_CHAPTER_TITLES->beforeStorageGet(${READABLE_ARRAY}Ljava/util/concurrent/Executor;)V
            """,
        )
    }
}
