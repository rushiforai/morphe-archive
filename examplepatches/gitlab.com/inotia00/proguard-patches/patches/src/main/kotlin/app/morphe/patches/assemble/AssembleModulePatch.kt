package app.morphe.patches.assemble

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_LSPOSED
import app.morphe.util.isAndroid
import app.morphe.util.isTermux
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.google.gson.Gson
import java.io.File
import java.io.InputStreamReader
import java.util.logging.Logger

data class Dump(
    val packageName: String,
    val versionName: String,
    val versionCode: String,
    val classes: List<String>
)

private lateinit var rawResourceContext: ResourcePatchContext

private val assembleModuleRawResourcePatch = rawResourcePatch {
    execute {
        rawResourceContext = this
    }
}

@Suppress("unused")
val assembleModulePatch = bytecodePatch(
    name = "Assemble LSPosed module",
    description = "Assembles LSPosed modules based on the JSON file."
) {
    compatibleWith(COMPATIBILITY_LSPOSED)

    dependsOn(assembleModuleRawResourcePatch)

    execute {
        val isManager = isAndroid() && !isTermux()
        val path = if (isManager) {
            "/storage/emulated/0/Download/input.json"
        } else {
            "input.json"
        }
        val log = Logger.getLogger(this::class.java.name)
        val file = File(path.trim())
        val absolutePath = file.absolutePath
        if (!file.exists() || !file.isFile) {
            throw PatchException("JSON file does not exist in $absolutePath")
        }

        var parsedJSON: Dump? = null

        try {
            val inputStreamReader = InputStreamReader(file.inputStream(), Charsets.UTF_8)
            parsedJSON = Gson().fromJson(inputStreamReader, Dump::class.java)
        } catch (_ : Exception) {
        }

        if (parsedJSON == null) {
            throw PatchException("Failed to load the JSON: $absolutePath")
        }

        val packageName = parsedJSON.packageName
        val versionName = parsedJSON.versionName
        val versionCode = parsedJSON.versionCode
        val classes = parsedJSON.classes

        GetPackageNameFingerprint.let {
            it.method.apply {
                val register = getInstruction<OneRegisterInstruction>(0).registerA
                replaceInstruction(
                    0,
                    "const-string v$register, \"$packageName\""
                )
            }
        }

        val insertMethod = with(GetClassesFingerprint) {
            method.apply {
                val startIndex = instructionMatches.first().index
                val reference = getInstruction<ReferenceInstruction>(startIndex).reference
                replaceInstruction(
                    startIndex,
                    "invoke-static { v0 }, $reference"
                )
                removeInstructions(0, startIndex)
            }
            method
        }

        var classCount = 0
        var insertIndex = 0

        fun addClass(classDescriptor: String) {
            insertMethod.addInstructions(
                insertIndex,
                """
                    const/16 v1, ${classCount++}
                    const-string v2, "$classDescriptor"
                    aput-object v2, v0, v1
                """
            )
            insertIndex += 3
        }

        classes.forEach { classDescriptor ->
            addClass(classDescriptor)
        }

        insertMethod.addInstructions(
            0,
            """
                const/16 v0, $classCount
                new-array v0, v0, [Ljava/lang/String;
            """
        )

        rawResourceContext.apply {
            val meta = get("META-INF")
            val xposed = meta.resolve("xposed")
            val file = File(xposed, "scope.list")
            file.writeText(packageName)
        }
    }
}
