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
    custom = { method, classDef ->
        classDef.methods.any { it.referencesString("Missing required properties:") } &&
        classDef.methods.any { it.referencesStringContaining(" inCameraFolder") } &&
        method.implementation?.instructions?.any {
            it is NarrowLiteralInstruction && it.narrowLiteral == 32
        } == true
    }
)

internal object LegacyDCIMCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    custom = { method, _ ->
        method.referencesStringContaining("/dcim")
    }
)

internal object BackupNotificationManagerFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.methods.any { m ->
            m.implementation?.instructions?.any {
                it.getReference<StringReference>()?.string == "BackupNotificationMgr"
            } == true
        } && method.name == "b"
    }
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
                (inst.reference as? com.android.tools.smali.dexlib2.iface.reference.TypeReference)?.type == "Lsll;" ||
                (inst.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)?.let { it.name == "f" && it.type.endsWith("slm;") } == true
            )
        } == true
    }
)

internal object DeviceFoldersSettingsQueryFingerprint : Fingerprint(
    returnType = "Landroid/database/Cursor;",
    parameters = listOf("I"),
    custom = { method, classDef ->
        method.name == "a" &&
        classDef.methods.any { it.referencesStringContaining("getNonCameraBuckets") }
    }
)

internal object InCameraFolderFeatureFingerprint : Fingerprint(
    returnType = "I",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.interfaces.any { it.endsWith("bypk;") } &&
        classDef.fields.any { it.name == "a" && it.type == "Z" } &&
        classDef.fields.any { it.name == "b" && it.type == "Ljava/lang/Integer;" } &&
        method.name == "a"
    }
)

internal object CreateItemButtonTextFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lslm;", "Leky;"),
)

internal object AuraTabViewModelFingerprint : Fingerprint(
    strings = listOf("AuraTabViewModel", "AURA_TAB_VIEW_MODEL_FETCH_MFT_STATUS"),
)
