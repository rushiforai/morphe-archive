package app.pepper.patches.debug

import app.morphe.patcher.Fingerprint

/**
 * MainActivity.onCreateOptionsMenu(Menu)Z — fixed name (referenced from manifest
 * <activity> as the launcher), so it isn't obfuscated by R8. Pin by class type
 * + method signature.
 */
internal object MainActivityOnCreateOptionsMenuFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/pepper/apps/android/presentation/MainActivity;" &&
            method.name == "onCreateOptionsMenu"
    },
)
