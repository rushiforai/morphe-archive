/*
 * Repo reimplementation of the instagram-morphe-patches-library story-tray hook.
 *
 * The library's filterStoriesListPatch finds the reel-type field by matching a class whose name
 * ENDS_WITH "ReelResponseItem" and taking a field of the reel-type enum. On 448 that also matches
 * ImmutablePandoReelResponseItem (no enum field), so the field lookup throws
 * "Collection contains no element matching the predicate" and both story-filter patches abort.
 *
 * This version pins the exact concrete class com.instagram.model.reels.ReelResponseItem (which
 * carries the reel-type enum field) and routes each tray item through StoryTray, which asks the
 * library's filter and falls back to a plain add if the filter throws. filterStories(...), which
 * fills the blocked-type set the filter reads, is still the library helper and is unchanged.
 */
package app.ahmedyarub.patches.instagram.distractionFree

import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val STORY_TRAY_CLASS = "Lapp/ahmedyarub/extension/instagram/StoryTray;"
private const val REEL_RESPONSE_ITEM_CLASS = "Lcom/instagram/model/reels/ReelResponseItem;"

/**
 * The story tray parser: parses the "tray" json array of reel response items. Named because the
 * strings alone also match the tray's serializer, which writes the same keys back out.
 */
internal object TrayParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    strings = listOf("tray", "hallpass_share_info"),
)

val filterStoriesTrayHook =
    bytecodePatch(
        description = "Hooks the story tray parser to drop blocked reel types.",
    ) {
        dependsOn(instagramExtensionPatch)

        execute {
            // The reel-type field is the ReelResponseItem instance field whose type is the reel
            // kind enum — identified by the enum carrying "suggested_user_reel" in its <clinit>.
            val reelResponseItem = classDefBy(REEL_RESPONSE_ITEM_CLASS)
            val reelTypeFieldName =
                reelResponseItem.fields.firstOrNull { field ->
                    if (AccessFlags.STATIC.isSet(field.accessFlags)) return@firstOrNull false
                    val enumClass = classDefByOrNull(field.type) ?: return@firstOrNull false
                    enumClass.superclass == "Ljava/lang/Enum;" &&
                        enumClass.methods.any { method ->
                            method.name == "<clinit>" &&
                                method.implementation?.instructions?.any { instruction ->
                                    (instruction.opcode == Opcode.CONST_STRING ||
                                        instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                                        instruction.getReference<StringReference>()?.string ==
                                        "suggested_user_reel"
                                } == true
                        }
                }?.name
                    ?: throw PatchException("Could not find the reel-type enum field on ReelResponseItem")

            TrayParserFingerprint.method.apply {
                val trayStringIndex =
                    instructions.indexOfFirst { instruction ->
                        (instruction.opcode == Opcode.CONST_STRING ||
                            instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                            instruction.getReference<StringReference>()?.string == "tray"
                    }
                if (trayStringIndex < 0) throw PatchException("The tray key is not in the tray parser")

                val addIndex =
                    instructions.drop(trayStringIndex).firstOrNull { instruction ->
                        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                            instruction.getReference<MethodReference>()?.let { reference ->
                                reference.name == "add" &&
                                    reference.definingClass == "Ljava/util/AbstractCollection;"
                            } == true
                    }?.location?.index
                        ?: throw PatchException("No story-list add after the tray key")

                // add() returns a boolean. The replacement returns nothing, so a move-result of
                // that boolean would be left reading a result that no longer exists.
                if (getInstruction(addIndex + 1).opcode == Opcode.MOVE_RESULT) {
                    throw PatchException("The tray parser uses the result of its story-list add")
                }

                val addInstruction = getInstruction<FiveRegisterInstruction>(addIndex)
                val storiesListRegister = addInstruction.registerC
                val currentStoryRegister = addInstruction.registerD
                // The replacement is a four-bit invoke like the add it replaces, so the extra
                // register has to fit in four bits as well.
                val freeRegister =
                    getFreeRegisterProvider(
                        addIndex,
                        numberOfFreeRegistersNeeded = 1,
                        storiesListRegister,
                        currentStoryRegister,
                    ).getFreeRegister4Bit()

                removeInstruction(addIndex)
                addInstructions(
                    addIndex,
                    """
                    const-string v$freeRegister, "$reelTypeFieldName"
                    invoke-static { v$storiesListRegister, v$currentStoryRegister, v$freeRegister }, $STORY_TRAY_CLASS->addStoryIfNotBlocked(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;)V
                    """.trimIndent(),
                )
            }
        }
    }
