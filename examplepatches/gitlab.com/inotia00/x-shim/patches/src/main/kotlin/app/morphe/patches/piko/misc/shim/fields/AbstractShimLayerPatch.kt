package app.morphe.patches.piko.misc.shim.fields

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.stringsOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.piko.misc.extension.sharedExtensionPatch
import app.morphe.patches.piko.misc.version.is_12_05_or_greater
import app.morphe.patches.piko.misc.version.versionCheckPatch
import app.morphe.patches.piko.shared.Constants.COMPATIBILITY_PIKO
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.escapeString
import app.morphe.patches.piko.util.toSmaliClass
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.google.gson.Gson
import com.google.gson.annotations.SerializedName
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.io.BufferedInputStream
import java.io.File
import java.io.InputStream
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import java.util.logging.Logger

private const val GITLAB_GENERATED_MOCK_URL = "https://gitlab.com/inotia00/piko-proguard-mock"

data class CipherClass(
    @SerializedName("type")
    val type: String,

    @SerializedName("fields")
    val fields: Map<String, String>
)

@Suppress("unused")
val abstractShimLayerPatch = bytecodePatch(
    name = "Abstract shim layer",
    description = "Adds an abstracted shim layer for fields, which improves compatibility to allow legacy patches to work."
) {
    compatibleWith(COMPATIBILITY_PIKO)

    dependsOn(
        versionCheckPatch,
        sharedExtensionPatch
    )

    val fieldJSON by stringOption(
        key = "fieldJSON",
        default = "",
        title = "Field JSON",
        description = "JSON containing static field initialization strings. If this is not provided, the patch may fail.",
        required = true
    )

    val exceptions by stringsOption(
        key = "exceptions",
        default = listOf(),
        title = "Exceptions",
        description = "Strings that must be used as local variables rather than global variables" +
                " to restore the original method structure"
    )

    execute {
        if (is_12_05_or_greater) {
            return@execute
        }

        val log = Logger.getLogger(this::class.java.name)

        // String fields are initialized by the extension when the app cold start.
        val insertMethod: MutableMethod
        var insertIndex = 0

        SetFieldFingerprint.method.apply {
            cleanup()
            returnEarly(true)
            insertMethod = this
        }

        val versionCode = packageMetadata.versionCode.toInt()
        var inputStream: InputStream? = null

        if (fieldJSON.isNullOrEmpty()) {
            log.info("Field JSON was not provided, try downloading JSON from mock")

            @OptIn(DelicateCoroutinesApi::class)
            GlobalScope.launch(Dispatchers.IO) {
                try {
                    val url = URL("$GITLAB_GENERATED_MOCK_URL/-/raw/main/mock/$versionCode.json?ref_type=heads&inline=false")

                    val urlConnection = url.openConnection() as HttpURLConnection

                    urlConnection.requestMethod = "GET"
                    urlConnection.connectTimeout = 3000
                    urlConnection.readTimeout = 3000
                    urlConnection.doInput = true

                    val responseCode = urlConnection.responseCode
                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        inputStream = BufferedInputStream(urlConnection.inputStream)
                    }
                } catch (ex: Exception) {
                    log.info("Exception while downloading from mock: $ex")
                }
            }
            // TODO: Use coroutines runBlocking.
            Thread.sleep(3000)

            if (inputStream != null) {
                log.info("Field JSON downloaded from mock")
            } else {
                throw RuntimeException(
                    "\n\n#####################################\n\n" +
                            "Field JSON was not provided" +
                            "\n\n1. Check your internet connection" +
                            "\n2. Check if a valid JSON path has been entered in the patch options\n\n" +
                            "#####################################\n\n"
                )
            }
        } else {
            val path = fieldJSON!!.trim()
            val file = File(path)
            val absolutePath = file.absolutePath
            if (!file.exists() || !file.isFile) {
                throw PatchException("Field JSON not found: $absolutePath")
            } else {
                // Reads JSON containing strings.
                inputStream = file.inputStream()
                log.info("Field JSON loaded: $absolutePath")
            }
        }

        // In certain versions, Piko patches may fail to resolve fingerprints.
        //
        // For example, in X 12.2.0-release.0, the string 'currentSelectedElements' is missing from the original method,
        // which causes 'CustomiseNavBarSecondaryFingerprint' to fail to resolve.
        //
        // As a workaround for this, strings required for patching in specific versions are injected into the original method instead of being extended.
        val fieldExceptions: MutableSet<String> = mutableSetOf()

        StringExceptions.entries.forEach { v ->
            if (v.versionCode == versionCode) {
                val elements = v.exceptions
                fieldExceptions.addAll(elements)
                log.info("Field exception found in ${v.versionName}: $elements")
            }
        }
        // Even if a string is not in [StringExceptions],
        // if it exists in the patch option [exceptions], it is injected into the original method.
        if (!exceptions.isNullOrEmpty()) {
            fieldExceptions.addAll(exceptions!!)
            log.info("Field exception found in patch option: $exceptions")
        }
        val exceptionsIsNotEmpty = fieldExceptions.isNotEmpty()

        val classType =
            object : com.google.gson.reflect.TypeToken<Map<String, CipherClass>>() {}.type
        val inputStreamReader = InputStreamReader(inputStream, Charsets.UTF_8)
        val cipherClass: Map<String, CipherClass> = Gson().fromJson(inputStreamReader, classType)

        val stringClass = "java.lang.String"
        val stringType = stringClass.toSmaliClass()

        fun containsAny(vararg strings: String): Boolean {
            if (exceptionsIsNotEmpty) {
                strings.forEach {
                    if (fieldExceptions.contains(it)) {
                        return true
                    }
                }
            }

            return false
        }

        cipherClass.forEach { (className, fieldArr) ->
            if (stringClass == fieldArr.type) {
                val definingClass = className.toSmaliClass()

                fieldArr.fields.forEach fieldLoop@{ (fieldName, fieldValue) ->
                    val fieldCall = "$definingClass->$fieldName:$stringType"
                    val escapedString = fieldValue.escapeString()
                    val patchOriginalMethod = containsAny(escapedString, fieldValue)

                    // If the string is included in the exception, inject it into the original method.
                    if (patchOriginalMethod) {
                        try {
                            originalMethodFingerprint(fieldCall).let {
                                it.clearMatch()
                                it.method.apply {
                                    val index = it.instructionMatches.first().index
                                    val register =
                                        getInstruction<OneRegisterInstruction>(index).registerA

                                    replaceInstruction(
                                        index,
                                        "const-string v$register, \"$escapedString\""
                                    )

                                    if (getInstruction(index - 1).opcode == Opcode.CONST_4
                                        && (getInstruction(index - 1) as OneRegisterInstruction).registerA == register) {
                                        removeInstruction(index - 1)
                                    }

                                    return@fieldLoop
                                }
                            }
                        } catch (_: Exception) {
                            // If fingerprint resolution fails for an unknown reason, print a warning and inject it into the extension.
                            log.warning("Fingerprint match failed: $escapedString")
                        }
                    }
                    insertMethod.addInstructions(
                        insertIndex,
                        """
                            const-string v0, "$escapedString"
                            sput-object v0, $fieldCall
                        """
                    )
                    insertIndex += 2
                }
            }
        }

        // Hook the <clinit> method so that the extension runs when the app cold starts.
        listOf(
            AppComponentFactoryConstructorFingerprint,
            ApplicationConstructorFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.replaceInstruction(
                0,
                "invoke-static { }, $EXTENSION_CLASS->init()V"
            )
        }

        TwitterApplicationFingerprint.method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    invoke-super { p0, p1 }, $TWITTER_ACTIVITY_CLASS->attachBaseContext(Landroid/content/Context;)V
                    return-void
                """
            )
        }
    }
}
