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
    parameters = listOf("I", "L"),
    returnType = "Ljava/lang/String;",
    custom = { method, classDef ->
        classDef.methods.count() == 2 &&
        method.implementation?.instructions?.any {
            it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
            it.reference.toString() == "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;"
        } == true
    },
)

object SettingsMenuBuilderClinitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("LOAD_ELLMANN_READY_PROGRESS"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
            it.reference.toString().contains("->r:L")
        } == true
    },
)

object SettingsMenuBuilderFingerprint : Fingerprint(
    classFingerprint = SettingsMenuBuilderClinitFingerprint,
    returnType = "V",
    parameters = listOf("L"),
    custom = { method, _ ->
        method.name != "<init>" &&
        method.implementation?.instructions?.any {
            it is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
            it.reference.toString().contains("-><init>(Ljava/util/List;)V")
        } == true
    },
)


internal object SkottieFontUriResolverClassFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("TextRenderingUtils"),
)

internal object SkottieFontUriResolverFingerprint : Fingerprint(
    classFingerprint = SkottieFontUriResolverClassFingerprint,
    returnType = "Landroid/net/Uri;",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/CancellationSignal;"),
)

internal object SkottieFontLoaderDispatcherClassFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("SkottieRenderGraphUtil"),
)

internal object SkottieFontLoaderDispatcherFingerprint : Fingerprint(
    classFingerprint = SkottieFontLoaderDispatcherClassFingerprint,
    custom = { method, _ ->
        method.parameterTypes.size == 8 &&
            method.parameterTypes[0] == "Landroid/content/Context;" &&
            method.parameterTypes.any { it.contains("ConcurrentHashMap") } &&
            method.returnType != "V"
    },
)

internal object MemoryViewBinderClinitFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("MemoryViewBinder"),
)
