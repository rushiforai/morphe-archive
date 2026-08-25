package io.github.liongalahad.stremio.patches.multiaccount

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun Method.parameters() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(definingClass: String, name: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        reference.definingClass == definingClass && reference.name == name
    } == true

internal object CoreErrorResetFingerprint : Fingerprint(
    returnType = "Lkotlin/Unit;",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/tv/CoreErrorKt;" &&
            method.name == "CoreError\$lambda\$0\$0" &&
            method.parameters() == listOf(
                "Landroid/content/SharedPreferences;",
                "Landroid/content/SharedPreferences;",
                "Landroid/content/Context;"
            ) && method.calls(
                "Lcom/stremio/common/extensions/ContextExtKt;",
                "restartApp"
            )
    }
)

internal object CorePreferencesFingerprint : Fingerprint(
    returnType = "Landroid/content/SharedPreferences;",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/common/platform/KoinKt;" &&
            method.name == "platformModule\$lambda\$0\$0" &&
            method.parameters() == listOf(
                "Lorg/koin/core/scope/Scope;",
                "Lorg/koin/core/parameter/ParametersHolder;"
            ) && method.calls("Landroid/content/Context;", "getSharedPreferences")
    }
)

internal object ProfilePreferencesFingerprint : Fingerprint(
    returnType = "Landroid/content/SharedPreferences;",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/common/platform/KoinKt;" &&
            method.name == "platformModule\$lambda\$0\$1" &&
            method.parameters() == listOf(
                "Lorg/koin/core/scope/Scope;",
                "Lorg/koin/core/parameter/ParametersHolder;"
            ) && method.calls(
                "Landroidx/preference/PreferenceManager;",
                "getDefaultSharedPreferences"
            )
    }
)

internal object DestinationChangedFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/tv/views/menu/NavigationMenuKt;" &&
            method.name == "NavigationMenu\$lambda\$14\$0\$0" &&
            method.parameters() == listOf(
                "Landroidx/compose/runtime/MutableState;",
                "Landroidx/compose/runtime/MutableState;",
                "Landroidx/navigation/NavController;",
                "Landroidx/navigation/NavDestination;",
                "Landroid/os/Bundle;"
            ) && method.calls("Landroidx/navigation/NavDestination;", "getId")
    }
)

internal object MenuFocusChangedFingerprint : Fingerprint(
    returnType = "Lkotlin/Unit;",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/tv/views/menu/NavigationMenuKt;" &&
            method.name == "NavigationMenu\$lambda\$15\$0\$0" &&
            method.parameters() == listOf(
                "Landroidx/compose/runtime/MutableState;",
                "Landroidx/compose/ui/focus/FocusState;"
            ) && method.calls(
                "Lcom/stremio/tv/views/menu/NavigationMenuKt;",
                "NavigationMenu\$lambda\$8"
            )
    }
)

internal object NavigationTabsFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/stremio/tv/views/menu/NavigationMenuKt;" &&
            method.name == "Tabs" &&
            method.parameters().size == 8 &&
            method.calls(
                "Landroidx/compose/foundation/layout/PaddingKt;",
                "padding-VpY3zN4"
            )
    }
)
