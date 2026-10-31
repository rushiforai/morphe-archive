package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.Fingerprint

object SettingsActivityV2OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/photos/settings/SettingsActivityV2;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

object PhotosAboutSettingsActivityV2OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/photos/settings/PhotosAboutSettingsActivityV2;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)




object InternalActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/photos/settings/InternalActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
)

object StringResourceResolverFingerprint : Fingerprint(
    parameters = listOf("I", "Lelp;"),
    returnType = "Ljava/lang/String;",
    custom = { method, classDef ->
        classDef.methods.count() == 2 &&
        method.implementation?.instructions?.any {
            it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
            it.reference.toString() == "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;"
        } == true
    },
)

object SettingsMenuBuilderFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.name != "<init>" &&
        method.parameterTypes.size == 1 &&
        method.implementation?.instructions?.any {
            it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
            it.reference.toString().contains("-><init>(Ljava/util/List;)V") &&
            it.reference.toString().contains("bgcm")
        } == true
    },
)

object SettingsMenuBuilderClinitFingerprint : Fingerprint(
    name = "<clinit>",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
            it.reference.toString().contains("->r:Lbgcj;")
        } == true
    },
)

internal object SkottieFontUriResolverFingerprint : Fingerprint(
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/CancellationSignal;"),
)

internal object SkottieFontLoaderDispatcherFingerprint : Fingerprint(
    custom = { method, _ ->
        method.parameterTypes.size == 8 &&
            method.parameterTypes[0] == "Landroid/content/Context;" &&
            method.parameterTypes.any { it.contains("ConcurrentHashMap") } &&
            method.returnType != "V"
    },
)

