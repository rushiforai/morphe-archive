package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val LIST_EDITOR = "Lcom/letterboxd/letterboxd/ui/activities/list/EditListViewModel;"
private const val ACCOUNT = "Lcom/letterboxd/api/model/MemberAccount;"
private const val CLONE_CAPABILITY = "${ACCOUNT}->getCanCloneLists()Ljava/lang/Boolean;"

private val customizationCompatibility = Compatibility(
    name = "Letterboxd",
    packageName = "com.letterboxd.letterboxd",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFF8000,
    targets = listOf(AppTarget(version = "3.6.7")),
)

private val listActions = Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/lists/ListActionsFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

private val saveList = Fingerprint(
    definingClass = LIST_EDITOR,
    name = "save",
    returnType = "V",
    parameters = listOf("Ljava/lang/Runnable;", "Lkotlin/jvm/functions/Function1;"),
)

private val appIconCapability = Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/user/SettingsAppIconFragment;",
    name = "canChangeAppIcon_delegate\$lambda\$0",
    returnType = "Z",
    parameters = emptyList(),
)

private fun MutableMethod.referenceIndex(opcode: Opcode, reference: String): Int {
    val matches = implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == opcode && (instruction as? ReferenceInstruction)?.reference.toString() == reference
    }
    return matches.singleOrNull()?.index
        ?: throw PatchException("Expected one reference to $reference in $definingClass->$name.")
}

@Suppress("unused")
val copyListsPatch = bytecodePatch(
    name = "Copy lists",
    description = "Use Clone in a list's More menu to save an independent copy with the films in order.",
    default = true,
) {
    compatibleWith(customizationCompatibility)

    execute {
        val actions = listActions.method
        val resultIndex = actions.referenceIndex(Opcode.INVOKE_VIRTUAL, CLONE_CAPABILITY) + 1
        val result = actions.implementation!!.instructions.elementAt(resultIndex)
        if (result.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Expected a Boolean result from the list clone capability check.")
        }
        actions.addInstruction(
            resultIndex + 1,
            "sget-object v${(result as OneRegisterInstruction).registerA}, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
        )

        // The editor already downloads every entry and serializes the edited order for creation.
        // Omitting clonedFrom makes this a regular list creation using those explicit entries.
        val save = saveList.method
        val sourceIdIndex = save.referenceIndex(Opcode.IGET_OBJECT, "${LIST_EDITOR}->listId:Ljava/lang/String;")
        val sourceId = save.implementation!!.instructions.elementAt(sourceIdIndex) as OneRegisterInstruction
        save.replaceInstruction(sourceIdIndex, "const/4 v${sourceId.registerA}, 0x0")
    }
}

@Suppress("unused")
val changeAppIconPatch = bytecodePatch(
    name = "Change app icon",
    description = "Choose a built-in Letterboxd launcher icon from the App icon settings.",
    default = true,
) {
    compatibleWith(customizationCompatibility)

    execute {
        appIconCapability.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
