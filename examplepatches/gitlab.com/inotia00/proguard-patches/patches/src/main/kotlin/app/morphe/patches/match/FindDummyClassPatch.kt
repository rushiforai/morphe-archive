package app.morphe.patches.match

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_LSPOSED
import app.morphe.util.isAndroid
import app.morphe.util.isTermux
import app.morphe.util.toJavaClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.google.gson.GsonBuilder
import com.google.gson.JsonArray
import com.google.gson.JsonObject
import java.io.File
import java.nio.file.Paths
import java.util.logging.Logger

@Suppress("unused")
val findDummyClassPatch = bytecodePatch(
    name = "Find dummy classes",
    description = "Find the dummy classes and write them to a JSON file"
) {
    execute {
        if (packageMetadata.packageName == COMPATIBILITY_LSPOSED.packageName) {
            return@execute
        }

        val classDefSet = mutableSetOf<String>()
        val targetAccessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

        classDefForEach { classDef ->
            val mutableClassDef by lazy {
                mutableClassDefBy(classDef)
            }
            val fields = mutableClassDef.fields
            if (mutableClassDef.methods.count() == 0) {
                val fieldCount = fields.count()
                if (fieldCount > 0) {
                    if (fieldCount < 20) {
                        fields.forEach { field ->
                            if (field.accessFlags != targetAccessFlags) {
                                return@classDefForEach
                            }
                            if (field.type != "Ljava/lang/reflect/Method;") {
                                return@classDefForEach
                            }
                        }
                    } else if (fieldCount > 25) {
                        fields.forEach { field ->
                            if (field.accessFlags != targetAccessFlags) {
                                return@classDefForEach
                            }
                            if (field.type != "Ljava/lang/String;") {
                                return@classDefForEach
                            }
                        }
                    } else {
                        return@classDefForEach
                    }
                    classDefSet.add(classDef.type.toJavaClass())
                }
            }
        }

        val gson = GsonBuilder().setPrettyPrinting().create()
        val json = JsonObject()
        val jsonArray = JsonArray()
        classDefSet.sorted().forEach { tag ->
            jsonArray.add(tag)
        }

        json.addProperty("packageName", packageMetadata.packageName)
        json.addProperty("versionName", packageMetadata.versionName)
        json.addProperty("versionCode", packageMetadata.versionCode)
        json.add("classes", jsonArray)

        val isManager = isAndroid() && !isTermux()
        val parentPath = if (isManager) {
            "/storage/emulated/0/Download"
        } else {
            Paths.get("").toAbsolutePath().toString()
        }
        val file = File(parentPath, "input.json")
        val log = Logger.getLogger(this::class.java.name)

        try {
            file.writeText(gson.toJson(json))
            log.info("Successfully saved to file")
        } catch (_: Exception) {
            log.warning("Failed to save to file")
        }

        throw PatchException(
            "\n!!!" +
                    "\n!!! Patch was aborted to skip unnecessary build processes" +
                    "\n!!! Check if the file was created in ${file.absolutePath}" +
                    "\n!!!"
        )
    }
}
