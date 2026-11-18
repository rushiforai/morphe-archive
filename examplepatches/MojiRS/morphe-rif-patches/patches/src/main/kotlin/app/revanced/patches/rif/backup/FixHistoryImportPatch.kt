package app.revanced.patches.rif.backup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.revanced.patches.rif.settings.revancedSettingsPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION = "Lapp/revanced/extension/rif/HistoryImport;"
private const val EXPORT_PACKAGE = "Lcom/andrewshu/android/reddit/settings/export/"

private fun ReferenceInstruction.refString() = reference.toString()

// The background task of rif's "Import settings" (settings/export/c, free and Platinum alike; the
// dex method is A(Void[])Boolean, jadx shows it as h). It walks the backup zip entry by entry and
// throws SecurityException("Bad zip entry") for a path that leaves the files folder. Matched by
// that string, in a class of the export package.
internal val importTaskFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type.startsWith(EXPORT_PACKAGE) &&
            method.implementation?.instructions?.any {
                it.opcode == Opcode.CONST_STRING && (it as ReferenceInstruction).refString() == "Bad zip entry"
            } == true
    }
}

// rif's Settings → Backup → "Import settings" entry (backup_preferences.xml). Only the strings
// change, never that XML, which Arnaumes' own bundle edits. Other languages keep rif's text.
private val IMPORT_STRINGS = mapOf(
    "pref_settings_import" to "Import settings and history",
    "pref_settings_import_summary" to "WARNING: Will overwrite ALL settings. Importing history optional.",
)

private val historyImportStringsPatch = resourcePatch(
    description = "Renames \"Import settings\" to \"Import settings and history\".",
) {
    compatibleWith(*RIF_COMPATIBILITY)

    execute {
        document("res/values/strings.xml").use { doc ->
            val nodes = doc.getElementsByTagName("string")
            var changed = 0
            for (i in 0 until nodes.length) {
                val node = nodes.item(i)
                val text = IMPORT_STRINGS[node.attributes?.getNamedItem("name")?.nodeValue] ?: continue
                node.textContent = text
                changed++
            }
            if (changed != IMPORT_STRINGS.size) {
                throw PatchException("expected ${IMPORT_STRINGS.size} import strings, found $changed")
            }
        }
    }
}

@Suppress("unused")
val fixHistoryImportPatch = bytecodePatch(
    name = "Fix history import",
    description = "Makes \"Import settings\" restore the history from backups made with \"Export settings and history\".",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    // The extension needs the app Context the settings patch captures.
    dependsOn(historyImportStringsPatch, revancedSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val method = importTaskFingerprint.method
        val instructions = method.instructions.toList()

        // `ZipEntry e = zip.getNextEntry(); ... String name = e.getName();`: the receiver of
        // getNextEntry is the ZipInputStream, the register getName's result lands in the name.
        val nextEntry = instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_VIRTUAL &&
                (it as ReferenceInstruction).refString() == "Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;"
        }
        if (nextEntry == -1) throw PatchException("getNextEntry call not found in ${method.name}")
        val zipRegister = (instructions[nextEntry] as FiveRegisterInstruction).registerC

        val getName = (nextEntry + 1 until instructions.size).firstOrNull {
            instructions[it].opcode == Opcode.INVOKE_VIRTUAL &&
                (instructions[it] as ReferenceInstruction).refString() == "Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;"
        } ?: throw PatchException("getName call not found in ${method.name}")
        val moveResult = instructions[getName + 1]
        if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("unexpected code after getName")
        val nameRegister = (moveResult as OneRegisterInstruction).registerA

        if (zipRegister > 15 || nameRegister > 15) throw PatchException("registers too high for invoke-static")

        // Right after the name is read, before rif decides what to do with the entry. The call only
        // reads both registers and never throws, so rif's own handling carries on unchanged.
        method.addInstructions(
            getName + 2,
            "invoke-static { v$nameRegister, v$zipRegister }, $EXTENSION->onImportEntry(Ljava/lang/String;Ljava/util/zip/ZipInputStream;)V",
        )
    }
}
