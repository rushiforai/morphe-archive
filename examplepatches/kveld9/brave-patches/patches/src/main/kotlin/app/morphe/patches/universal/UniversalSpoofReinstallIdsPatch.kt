package app.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.clearTryBlocks
import app.morphe.patches.shared.ensureRegisterCount

private const val TAG = "[Spoof Reinstall IDs]"
private const val DEFAULT_APP_SET_ID = "00000000-0000-0000-0000-000000000000"
private const val DEFAULT_INSTALL_ID = "0000000000000000000000"

private const val APP_SET_ID_INFO_CLASS = "Lcom/google/android/gms/appset/AppSetIdInfo;"
private const val FIREBASE_INSTANCE_ID_CLASS = "Lcom/google/firebase/iid/FirebaseInstanceId;"

@Suppress("unused")
val universalSpoofReinstallIdsPatch = bytecodePatch(
    name = "Spoof Reinstall IDs",
    description = "Prevents apps from linking reinstalls to your device by resetting app and install IDs.",
    default = false,
) {
    val appSetId by stringOption(
        key = "appSetId",
        title = "App set ID",
        description = "Identifier returned as the app-set ID.",
        default = DEFAULT_APP_SET_ID,
        required = false,
    )

    val installId by stringOption(
        key = "installId",
        title = "Install ID",
        description = "Identifier returned as the install and instance ID.",
        default = DEFAULT_INSTALL_ID,
        required = false,
    )

    val spoofScope by booleanOption(
        key = "spoofScope",
        title = "Scope to single app",
        description = "Reports the ID scope as app-specific rather than shared across developer apps.",
        default = true,
        required = false,
    )

    execute {
        val targetAppSetId = appSetId?.trim()?.let(::escapeSmaliString)?.takeIf { it.isNotEmpty() } ?: DEFAULT_APP_SET_ID
        val targetInstallId = installId?.trim()?.let(::escapeSmaliString)?.takeIf { it.isNotEmpty() } ?: DEFAULT_INSTALL_ID
        val shouldSpoofScope = spoofScope != false

        var patched = 0
        var touchedClasses = 0

        classDefForEach { classDef ->
            val isAppSet = classDef.type == APP_SET_ID_INFO_CLASS ||
                classDef.superclass == APP_SET_ID_INFO_CLASS ||
                classDef.interfaces.contains(APP_SET_ID_INFO_CLASS)
            val isFirebase = classDef.type == FIREBASE_INSTANCE_ID_CLASS ||
                classDef.superclass == FIREBASE_INSTANCE_ID_CLASS ||
                classDef.interfaces.contains(FIREBASE_INSTANCE_ID_CLASS)

            if (!isAppSet && !isFirebase) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            var classModified = false

            mutableClass.methods.forEach { method ->
                if (method.implementation == null) return@forEach

                if (isAppSet) {
                    if (method.name == "getId" && method.returnType == "Ljava/lang/String;") {
                        method.replaceWithConstString(targetAppSetId)
                        patched++
                        classModified = true
                    } else if (shouldSpoofScope && method.name == "getScope" && method.returnType == "I") {
                        method.replaceWithConstInt(1)
                        patched++
                        classModified = true
                    }
                }

                if (isFirebase) {
                    if (method.name == "getId" && method.returnType == "Ljava/lang/String;") {
                        method.replaceWithConstString(targetInstallId)
                        patched++
                        classModified = true
                    }
                }
            }

            if (classModified) {
                touchedClasses++
            }
        }

        if (patched == 0) {
            println("$TAG Target APK does not contain reinstall tracking identifiers (0 methods found).")
            return@execute
        }

        println("$TAG Replaced $patched reinstall tracking identifier getter(s) across $touchedClasses class(es).")
    }
}

private fun MutableMethod.replaceWithConstString(value: String) {
    val impl = implementation ?: return
    clearTryBlocks()
    ensureRegisterCount(1)
    removeInstructions(0, impl.instructions.count())
    addInstructions(
        0,
        """
            const-string v0, "$value"
            return-object v0
        """.trimIndent(),
    )
}

private fun MutableMethod.replaceWithConstInt(value: Int) {
    val impl = implementation ?: return
    clearTryBlocks()
    ensureRegisterCount(1)
    removeInstructions(0, impl.instructions.count())
    addInstructions(
        0,
        """
            const/4 v0, $value
            return v0
        """.trimIndent(),
    )
}

private fun escapeSmaliString(value: String): String {
    return value
        .replace("\\", "\\\\")
        .replace("\"", "")
        .replace("\n", "\\n")
        .replace("\r", "\\r")
        .replace("\t", "\\t")
}
