package io.github.pengusto.patches.filemanager

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val favoritePathsPatch = bytecodePatch(
    name = "Keep favorites consistent after folder rename or removal",
    description = "Update nested favorite paths after successful single or multiple renames and remove nested favorites with their deleted parent.",
    default = true
) {
    compatibleWith(Compatibility(name = "Fossify File Manager", packageName = "org.fossify.filemanager", targets = listOf(AppTarget(version = "1.6.2"))))
    extendWith("extensions/extension.mpe")
    execute {
        val rename = Fingerprint(
            definingClass = "Lorg/fossify/commons/extensions/ActivityKt;", name = "renameFile", returnType = "V",
            parameters = listOf("Lorg/fossify/commons/activities/BaseSimpleActivity;", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Lg11;")
        ).method
        // Wrap the original callback, so failed/canceled renames never rewrite favorites.
        // All single/multiple rename dialogs use this shared operation, including SAF branches.
        rename.addInstructions(0, """
            invoke-static/range {p0 .. p4}, Lio/github/pengusto/patches/extension/filemanager/FavoritePaths;->wrapRename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)Ljava/lang/Object;
            move-result-object p4
            check-cast p4, Lg11;
        """.trimIndent())

        // Extend only deletion selection, not ordinary "Remove favorite" actions.
        val remove = Fingerprint(
            definingClass = "Lorg/fossify/filemanager/adapters/ItemsAdapter;",
            name = "deleteFiles\$lambda\$80\$lambda\$79", returnType = "Lsh3;",
            parameters = listOf("Lorg/fossify/filemanager/adapters/ItemsAdapter;", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;")
        ).method
        val code = remove.implementation!!.instructions
        val matches = code.indices.filter {
            (code[it] as? ReferenceInstruction)?.reference.toString() == "Lorg/fossify/filemanager/helpers/Config;->removeFavorite(Ljava/lang/String;)V"
        }
        check(matches.size == 1 && remove.implementation!!.registerCount == 9) { "Unsupported File Manager deletion binding" }
        val index = matches.single()
        val call = code[index] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        check(call.registerC == 2 && call.registerD == 3 &&
            (code[index + 1] as? ReferenceInstruction)?.reference.toString() == "Lorg/fossify/filemanager/adapters/ItemsAdapter;->listItems:Ljava/util/List;") {
            "Unexpected File Manager deletion registers"
        }
        // v2 is dead after removeFavorite and reassigned by the following instruction.
        remove.addInstructions(index + 1, """
            invoke-virtual {v2}, Lorg/fossify/commons/helpers/BaseConfig;->getContext()Landroid/content/Context;
            move-result-object v2
            invoke-static {v2, v3}, Lio/github/pengusto/patches/extension/filemanager/FavoritePaths;->removeSelected(Landroid/content/Context;Ljava/lang/String;)V
        """.trimIndent())
    }
}
