package app.ahmedyarub.patches.x.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch

internal const val EXTENSION_PACKAGE = "Lapp/ahmedyarub/extension/x"

private object XApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/x/android/XApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** Merges the shared and X extensions and hands them the application context on start. */
val xExtensionPatch = sharedExtensionPatch(
    listOf("shared", "x"),
    ExtensionHook(fingerprint = XApplicationOnCreateFingerprint),
)
