package app.morphe.library.instagram.patches

import app.morphe.library.instagram.utility.JsonParserFingerprint
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.findFreeRegister
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/library/extension/instagram/patches/FilterStoriesListPatch;"

private object ReelTypeEnumFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("ads_reel", "suggested_user", "suggested_user_reel")
)

private object ReelResponseItemFingerprint : Fingerprint (
    definingClass = "ReelResponseItem"
)

private object TrayFingerprint : JsonParserFingerprint(
    "tray",
    "hallpass_share_info"
)

private object GetBlockedStoryTypesFingerprint : Fingerprint (
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "<clinit>"
)

@Suppress("unused")
val filterStoriesListPatch = bytecodePatch {
    dependsOn(instagramExtensionPatch)

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

                val freeRegister = findFreeRegister(
                    addStoryObjectIndex,
                    storiesListRegister,
                    currentStoryObjectRegister
                )

                val reelTypeFieldName = ReelResponseItemFingerprint.classDef.fields.first {
                    ReelTypeEnumFingerprint.matchAll().map { it.classDef.type }.contains(it.type)
                }.name

                removeInstruction(addStoryObjectIndex)

                addInstructions(
                    addStoryObjectIndex,
                    """
                        const-string v$freeRegister, "$reelTypeFieldName"
                        invoke-static { v$storiesListRegister, v$currentStoryObjectRegister, v$freeRegister }, $EXTENSION_CLASS_DESCRIPTOR->addStoryIfNotBlocked(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;)V
                    """
                )
            }
        }
    }
}

@Suppress("unused")
context(_: BytecodePatchContext)
fun filterStories(vararg blockedStoryTypes: String) = GetBlockedStoryTypesFingerprint.method.apply {
    val returnIndex = indexOfFirstInstructionOrThrow(Opcode.RETURN_VOID)

    addInstructions(
        returnIndex,
        blockedStoryTypes.joinToString("\n") {
            """
                const-string v0, "$it"
                sget-object v1, $EXTENSION_CLASS_DESCRIPTOR->BLOCKED_STORY_TYPES:Ljava/util/Set;
                invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
            """
        }
    )
}
