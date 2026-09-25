package app.morphe.patches.tiktok.interaction.offlinevideos

import app.morphe.patches.tiktok.shared.discovery.TikTokFingerprint as Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal object OfflineModeSheetOptionsFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.endsWith("/OfflineModeSheetPageAssem;") &&
            method.name == "<clinit>" &&
            method.parameterTypes.isEmpty()
    },
)

internal object OfflineModeListConstructorFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.endsWith("/OfflineModeListVM;") &&
            method.name == "<init>" &&
            method.parameterTypes.isEmpty()
    },
)

/**
 * Offline option list configuration.
 *
 * The owner is obfuscated and changed after 46.4.3. The fields consumed by the
 * patch (`LJ` and `LJFF`, both List) are the stable structural contract, so use
 * the class initializer that writes both instead of pinning an LX name.
 */
internal object OfflineModeOptionConfigFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        if (method.name != "<clinit>" || method.parameterTypes.isNotEmpty()) {
            false
        } else {
            val fields = method.implementation?.instructions
                ?.filter { it.opcode == Opcode.SPUT_OBJECT }
                ?.mapNotNull { it.getReference<FieldReference>() }
                ?.filter { it.definingClass == classDef.type && it.type == "Ljava/util/List;" }
                ?.map { it.name }
                ?.toSet()
                ?: emptySet()
            "LJ" in fields && "LJFF" in fields
        }
    },
)

internal object OfflineModeOptionEnumFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.name == "<clinit>" &&
            method.parameterTypes.isEmpty() &&
            classDef.fields.any { field ->
                field.name == "DOWNLOAD_200_VIDEOS" &&
                    field.type == classDef.type
            }
    },
)
