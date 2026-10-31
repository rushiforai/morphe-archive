package app.ahmedyarub.patches.instagram.distractionFree

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.utils.changeString
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val REELS_BUTTONS_CLASS = "Lapp/ahmedyarub/extension/instagram/ReelsButtons;"
private const val MEDIA_OPTION = "Lcom/instagram/feed/media/mediaoption/MediaOption\$Option;"

private object AppShellOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/app/InstagramAppShell;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

private object ActionSheetViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/igds/components/bottomsheet/BottomSheetFragment;",
    name = "onViewCreated",
)

/** Finds a reel's ⋯ button by its integer tag, then by its name. */
private object FindMoreButtonFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("clips_ufi_more_button_component"),
)

/** The Reels ⋯ menu's options helper adding a row; the helper is bound to that menu's reel. */
private object AddMenuRowFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(string("MoreOptionsHelper_addBottomSheetRowItem", StringComparisonType.CONTAINS)),
)

/** The Reels ⋯ menu: its header items, then its rows, Interested and Not interested among them. */
private object ReelsMenuFingerprint : Fingerprint(
    strings = listOf(string("MoreOptionsController_getBottomSheetHeaderItems", StringComparisonType.CONTAINS)),
)

private object MoreTagIdFingerprint : Fingerprint(
    definingClass = REELS_BUTTONS_CLASS,
    name = "moreTagId",
)

private object OptionHandlerFingerprint : Fingerprint(
    definingClass = REELS_BUTTONS_CLASS,
    name = "optionHandler",
)

@Suppress("unused")
val reelsInterestedButtonsPatch = bytecodePatch(
    name = "Reels interested buttons",
    description = "Adds Interested and Not interested buttons above the like button in Reels.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(instagramExtensionPatch)

    execute {
        FindMoreButtonFingerprint.method.apply {
            val lookup = instructions.indexOfFirst {
                it.getReference<MethodReference>()?.name == "findViewWithTag"
            }
            val tagId = instructions.take(lookup).lastOrNull { it is NarrowLiteralInstruction && it.opcode != Opcode.CONST_4 }
                ?: throw PatchException("The ⋯ button lookup has no integer tag")
            MoreTagIdFingerprint.method.addInstructions(
                0,
                "const v0, ${(tagId as NarrowLiteralInstruction).narrowLiteral}\nreturn v0",
            )
        }

        // The helper runs an option through one method, which the menu's Interested and Not
        // interested rows call with that option, whichever way the menu lays them out.
        val helper = AddMenuRowFingerprint.method.definingClass
        var handler: String? = null
        classDefForEach { classDef ->
            if (handler != null) return@classDefForEach
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                for (index in 1 until instructions.size) {
                    val option = instructions[index - 1].getReference<FieldReference>()
                    if (option?.definingClass != MEDIA_OPTION || option.name != "INTERESTED") continue
                    val call = instructions[index].getReference<MethodReference>() ?: continue
                    if (call.definingClass == helper && call.parameterTypes.map { it.toString() } == listOf(MEDIA_OPTION)) {
                        handler = call.name
                        return@forEach
                    }
                }
            }
        }
        OptionHandlerFingerprint.changeString("optionHandler", handler ?: throw PatchException("No option handler on the menu helper"))

        // The menu lists Interested (SEE_MORE) only while two server config flags say so, which a
        // reinstall resets, though it lists Not interested regardless. The check of those flags,
        // the last the menu makes before Interested, passes.
        ReelsMenuFingerprint.method.instructions.toList().let { menu ->
            val seeMore = menu.indexOfFirst {
                it.getReference<FieldReference>()?.let { field -> field.definingClass == MEDIA_OPTION && field.name == "SEE_MORE" } == true
            }
            if (seeMore < 0) throw PatchException("The Reels menu never adds Interested")
            val flagsCheck = menu.take(seeMore).last { instruction ->
                instruction.opcode == Opcode.INVOKE_STATIC && instruction.getReference<MethodReference>()?.let {
                    it.returnType == "Z" && it.parameterTypes.lastOrNull()?.toString() == "Lcom/instagram/common/session/UserSession;"
                } == true
            }.getReference<MethodReference>()!!
            mutableClassDefBy(flagsCheck.definingClass).methods.first {
                it.name == flagsCheck.name && it.parameterTypes.map { type -> type.toString() } == flagsCheck.parameterTypes.map { type -> type.toString() }
            }.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // The menu's options, for their labels.
        OverflowSheetPresenterFingerprint.method.apply {
            val linkedListRead = instructions.withIndex().firstOrNull { (_, instruction) ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    instruction.getReference<FieldReference>()?.type == "Ljava/util/LinkedList;"
            } ?: throw PatchException("No LinkedList field read found in the sheet presenter")
            val listRegister = getInstruction<TwoRegisterInstruction>(linkedListRead.index).registerA
            addInstruction(
                linkedListRead.index + 1,
                "invoke-static { v$listRegister }, $REELS_BUTTONS_CLASS->onMenuOptions(Ljava/util/List;)V",
            )
        }

        AddMenuRowFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $REELS_BUTTONS_CLASS->onMenuHelper(Ljava/lang/Object;)V",
        )

        ActionSheetViewCreatedFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (returnIndex < 0) throw PatchException("No return-void in onViewCreated")
            addInstruction(returnIndex, "invoke-static { p0 }, $REELS_BUTTONS_CLASS->onActionSheetCreated(Ljava/lang/Object;)V")
        }

        AppShellOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $REELS_BUTTONS_CLASS->install(Landroid/app/Application;)V",
        )
    }
}
