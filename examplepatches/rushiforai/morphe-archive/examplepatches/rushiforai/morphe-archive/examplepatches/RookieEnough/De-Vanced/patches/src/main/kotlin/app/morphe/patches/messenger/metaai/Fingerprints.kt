/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/messenger/metaai/Fingerprints.kt
 */
package app.morphe.patches.messenger.metaai

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.Opcode

internal object GetMobileConfigBoolFingerprint : Fingerprint(
    parameters = listOf("J"),
    returnType = "Z",
    filters = OpcodesFilter.opcodesToFilters(Opcode.RETURN),
    custom = { _, classDef ->
        classDef.interfaces.contains("Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;")
    },
)

internal object MetaAIKillSwitchCheckFingerprint : Fingerprint(
    strings = listOf("SearchAiagentImplementationsKillSwitch"),
    filters = OpcodesFilter.opcodesToFilters(Opcode.CONST_WIDE),
)

internal object ExtensionMethodFingerprint : Fingerprint(
    strings = listOf("REPLACED_BY_PATCH"),
    custom = { method, classDef ->
        method.name == EXTENSION_METHOD_NAME && classDef.type == EXTENSION_CLASS_DESCRIPTOR
    },
)
