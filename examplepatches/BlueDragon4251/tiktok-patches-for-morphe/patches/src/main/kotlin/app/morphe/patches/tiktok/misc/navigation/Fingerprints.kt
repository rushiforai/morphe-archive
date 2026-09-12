package app.morphe.patches.tiktok.misc.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private fun hasTabKindReference(method: com.android.tools.smali.dexlib2.iface.Method, fieldName: String): Boolean =
    method.implementation?.instructions
        ?.mapNotNull { it.getReference<FieldReference>() }
        ?.any { it.name == fieldName }
        ?: false

internal object TopTabModelListFingerprint : Fingerprint(
    definingClass = "/TabAbilityAssem;",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
    custom = { method, _ -> hasTabKindReference(method, "TOP_TAB") },
)

internal object BottomTabModelListFingerprint : Fingerprint(
    definingClass = "/TabAbilityAssem;",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
    custom = { method, _ -> hasTabKindReference(method, "BOTTOM_TAB") },
)
