/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/misc/settings/Fingerprints.kt
 */
package app.czyeru.patches.tiktok.misc.settings

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object AddSettingsEntryFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/SettingNewVersionFragment;") && method.name == "initUnitManger"
    },
)

internal object AdPersonalizationActivityOnCreateFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/AdPersonalizationActivity;") && method.name == "onCreate"
    },
)

internal object AdPersonalizationActivityOnBackPressedFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/AdPersonalizationActivity;") &&
            method.name == "onBackPressed" &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "V"
    },
)

internal object SettingsEntryFingerprint : Fingerprint(
    strings = listOf("pls pass item or extends the EventUnit"),
)

internal object SettingsEntryInfoFingerprint : Fingerprint(
    strings = listOf(
        "ExposeItem(title=",
        ", icon=",
    ),
)

internal object SettingsStatusLoadFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("Lapp/czyeru/extension/tiktok/settings/SettingsStatus;") && method.name == "load"
    },
)

internal object NpthExtentTaskInitFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/NpthExtentTask;") &&
            method.name == "LIZ" &&
            method.returnType == "V"
    },
)

private fun MethodReference.isSettingsRowsSort(): Boolean =
    parameterTypes == listOf("Ljava/util/Comparator;", "Ljava/lang/Iterable;") &&
        returnType == "Ljava/util/List;"

private fun isSettingsComposeRowsMethod(method: Method, classDef: ClassDef): Boolean =
    classDef.type.endsWith("/SettingsComposeRvmpFragment;") &&
        method.returnType == "V" &&
        method.implementation?.instructions?.any { instruction ->
            if (instruction.opcode != Opcode.INVOKE_STATIC) return@any false
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@any false
            reference.isSettingsRowsSort()
        } == true

/**
 * The compose function that builds the whole settings list: it reads the group view models,
 * sorts their rows and hands the result to the lazy column. Matched by the comparator-plus-iterable
 * sort call rather than parameter count so new TikTok builds don't break it.
 */
internal object SettingsComposeRowsFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/setting/ui/rvmpcompose/SettingsComposeRvmpFragment;",
    returnType = "V",
    custom = ::isSettingsComposeRowsMethod,
)

internal object SupportGroupDefaultStateFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/SupportGroupVM;") && method.name == "defaultState"
    },
)

internal object OpenDebugCellVmDefaultStateFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("/OpenDebugCellVM;") && method.name == "defaultState"
    },
)

internal object OpenDebugCellClickWrapperFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith("Lkotlin/jvm/internal/AwS350S0200000_2;") &&
            method.name == "invoke\$85" &&
            method.parameterTypes == listOf("Lkotlin/jvm/internal/AwS350S0200000_2;")
    },
)

