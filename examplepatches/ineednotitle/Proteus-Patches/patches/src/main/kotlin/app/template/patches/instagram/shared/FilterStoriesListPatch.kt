/*
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.getFreeRegisterProvider
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/extension/InstagramFilterStoriesListPatch;"

private object ReelTypeEnumFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("ads_reel", "suggested_user", "suggested_user_reel"),
)

private object ReelResponseItemFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.type.contains("ReelResponseItem") },
)

private object TrayFingerprint : JsonParserFingerprint(
    "tray",
    "hallpass_share_info",
)

private object GetBlockedStoryTypesFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "<clinit>",
)

val instagramFilterStoriesListPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        with(TrayFingerprint.match()) {
            method.apply {
                val addStoryObjectIndex = indexOfFirstInstructionOrThrow(matchIndex) {
                    getReference<MethodReference>().let {
                        it?.name == "add" &&
                            it.definingClass == "Ljava/util/AbstractCollection;"
                    }
                }

                val (storiesListRegister, currentStoryObjectRegister) =
                    with(getInstruction<FiveRegisterInstruction>(addStoryObjectIndex)) {
                        registerC to registerD
                    }

                val freeRegister = getFreeRegisterProvider(
                    index = addStoryObjectIndex,
                    numberOfFreeRegistersNeeded = 1,
                    storiesListRegister,
                    currentStoryObjectRegister,
                ).getFreeRegister4Bit()

                val reelTypeClasses = ReelTypeEnumFingerprint.matchAll().map { it.classDef.type }.toSet()
                val reelTypeFieldName = ReelResponseItemFingerprint.classDef.fields.first {
                    it.type in reelTypeClasses
                }.name

                removeInstruction(addStoryObjectIndex)

                addInstructions(
                    addStoryObjectIndex,
                    """
                        const-string v$freeRegister, "$reelTypeFieldName"
                        invoke-static { v$storiesListRegister, v$currentStoryObjectRegister, v$freeRegister }, $EXTENSION_CLASS_DESCRIPTOR->addStoryIfNotBlocked(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;)V
                    """.trimIndent(),
                )
            }
        }
    }
}

context(patchContext: BytecodePatchContext)
fun filterInstagramStories(vararg blockedStoryTypes: String) = GetBlockedStoryTypesFingerprint.method.apply {
    val returnIndex = indexOfFirstInstructionOrThrow(Opcode.RETURN_VOID)

    addInstructions(
        returnIndex,
        blockedStoryTypes.joinToString("\n") {
            """
                const-string v0, "$it"
                sget-object v1, $EXTENSION_CLASS_DESCRIPTOR->BLOCKED_STORY_TYPES:Ljava/util/Set;
                invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
            """.trimIndent()
        },
    )
}
