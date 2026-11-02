package app.morphe.patches.googlephotos.misc.backup

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun Method.referencesString(value: String) =
    implementation?.instructions?.any {
        it.getReference<StringReference>()?.string == value
    } == true

private fun Method.referencesStringContaining(value: String) =
    implementation?.instructions?.any {
        it.getReference<StringReference>()?.string?.contains(value) == true
    } == true

internal object InCameraFolderSetterFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("Missing required properties:"),
    custom = { method, classDef ->
        classDef.methods.any { it.referencesStringContaining(" inCameraFolder") } &&
        method.implementation?.instructions?.any {
            it is NarrowLiteralInstruction && it.narrowLiteral == 32
        } == true
    }
)

internal object LegacyDCIMCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("/dcim"),
    custom = { method, _ ->
        method.referencesStringContaining("/dcim")
    }
)

internal object BackupNotificationManagerFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("BackupNotificationMgr"),
)

internal object BackupEligibilityQueryFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf(" OR backup_folders.bucket_id IS NOT NULL "),
)

internal object UploadStatusModelViewModelFingerprint : Fingerprint(
    strings = listOf("UploadStatusModelViewModel"),
)

internal object CreateItemUpdateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
        method.parameterTypes[0] == "Ljava/lang/Object;" &&
        method.implementation?.instructions?.any { inst ->
            inst is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction && (
                (inst.reference as? com.android.tools.smali.dexlib2.iface.reference.TypeReference)?.type?.let { it == "Lsll;" || it == "Lsob;" } == true ||
                (inst.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)?.let { it.name == "f" && (it.type.endsWith("slm;") || it.type.endsWith("soc;")) } == true
            )
        } == true
    }
)

internal object DeviceFoldersSettingsQueryFingerprint : Fingerprint(
    returnType = "Landroid/database/Cursor;",
    parameters = listOf("I"),
    custom = { method, classDef ->
        method.name == "a" && classDef.methods.any { it.referencesStringContaining("getNonCameraBuckets") }
    }
)

internal object InCameraFolderFeatureFingerprint : Fingerprint(
    returnType = "I",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.fields.any { it.name == "a" && it.type == "Z" } &&
        classDef.fields.any { it.name == "b" && it.type == "Ljava/lang/Integer;" } &&
        method.name == "a"
    }
)

internal object CreateItemButtonTextFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
        (
            (method.parameterTypes[0] == "Lslm;" && method.parameterTypes[1] == "Leky;") ||
            (method.parameterTypes[0] == "Lsoc;" && method.parameterTypes[1] == "Lelp;")
        )
    }
)
