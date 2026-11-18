package patches.gboard.features.ocr

import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.mutableClass
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

internal object GboardOcrPatchTargets {
    val taskCompletionListener = GboardMethodTarget("Llxk;", "l", listOf("Llxd;"), "V")

    internal fun requireTaskCompletionRegistration(owner: MutableClass): MutableMethod {
        val method = taskCompletionListener.resolve(owner)
        check(owner.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value))
        check(method.accessFlags == AccessFlags.PUBLIC.value) { "Expected public instance task registration" }
        return method
    }

    fun preflight(context: BytecodePatchContext) {
        val methods = listOf(configLabel, languageHint, loggingLibrary, optionalModuleName, moduleId,
            moduleAvailability, optionalModuleBuilder, moduleManagerRequest, thinRecognizerInit) + listOf(
            GboardMethodTarget("Lkzf;", "<init>", listOf("Ljava/lang/String;", "I", "J", "Z"), "V"),
            GboardMethodTarget("Lzey;", "b", emptyList(), "Lzey;"),
            GboardMethodTarget("Lzey;", "a", emptyList(), "Landroid/content/Context;"),
            GboardMethodTarget("Lliv;", "a", listOf("Landroid/content/Context;", "Ljava/lang/String;"), "I"),
            GboardMethodTarget("Lliv;", "d", listOf("Landroid/content/Context;", "Lliu;", "Ljava/lang/String;"), "Lliv;"),
            GboardMethodTarget("Lliv;", "c", listOf("Ljava/lang/String;"), "Landroid/os/IBinder;"),
            GboardMethodTarget("Llii;", "<init>", listOf("Ljava/lang/Object;"), "V"),
            GboardMethodTarget("Laabe;", "<init>", listOf("Landroid/os/IBinder;"), "V"),
            GboardMethodTarget("Laabd;", "<init>", listOf("Landroid/os/IBinder;"), "V"),
            GboardMethodTarget("Lejy;", "a", emptyList(), "Landroid/os/Parcel;"),
            GboardMethodTarget("Lejy;", "z", listOf("I", "Landroid/os/Parcel;"), "Landroid/os/Parcel;"),
            GboardMethodTarget("Lejy;", "C", listOf("I", "Landroid/os/Parcel;"), "V"),
            GboardMethodTarget("Leka;", "d", listOf("Landroid/os/Parcel;", "Landroid/os/IInterface;"), "V"),
            GboardMethodTarget("Leka;", "c", listOf("Landroid/os/Parcel;", "Landroid/os/Parcelable;"), "V"),
            GboardMethodTarget("Laabj;", "<init>", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "I", "Ljava/lang/String;", "Z"), "V"),
            GboardMethodTarget("Laabn;", "b", emptyList(), "V"),
            GboardMethodTarget("Llgl;", "<init>", listOf("Landroid/content/Context;"), "V"),
            GboardMethodTarget("Llgl;", "a", listOf("[Llau;"), "Llxk;"),
            GboardMethodTarget("Llgl;", "b", listOf("Llfv;"), "V"),
            GboardMethodTarget("Llgl;", "c", listOf("Lquw;"), "Llxk;"),
            GboardMethodTarget("Lquw;", "<init>", listOf("Ljava/util/List;", "Llfv;"), "V"),
            GboardMethodTarget("Llfv;", "a", listOf("Llga;"), "V"),
            GboardMethodTarget("Llxk;", "g", emptyList(), "Z"),
            GboardMethodTarget("Llxk;", "e", emptyList(), "Ljava/lang/Object;"),
            GboardMethodTarget("Llxk;", "d", emptyList(), "Ljava/lang/Exception;"),
        )
        methods.forEach { it.resolve(context) }
        requireTaskCompletionRegistration(context.mutableClass("Llxk;"))
        listOf(
            GboardFieldTarget("Laabn;", "a", "Landroid/content/Context;"),
            GboardFieldTarget("Laabn;", "b", "Laabb;"),
            GboardFieldTarget("Laabn;", "f", "Laabd;"),
            GboardFieldTarget("Lliv;", "b", "Lliu;"),
            GboardFieldTarget("Lkzf;", "a", "Ljava/lang/String;"),
            GboardFieldTarget("Llga;", "b", "I"), GboardFieldTarget("Llga;", "e", "I"),
            GboardFieldTarget("Llfz;", "a", "I"), GboardFieldTarget("Llfz;", "b", "Z"),
        ).forEach { it.resolve(context) }
        check(context.mutableClass("Laabe;").superclass == "Lejy;")
        check(context.mutableClass("Laabd;").superclass == "Lejy;")
        check("Laabb;" in context.mutableClass("Laaby;").interfaces)
    }
    val configLabel = method("b", "Ljava/lang/String;")
    val languageHint = method("c", "Ljava/lang/String;")
    val loggingLibrary = method("d", "Ljava/lang/String;")
    val optionalModuleName = method("e", "Ljava/lang/String;")
    val moduleId = method("f", "Ljava/lang/String;")
    val moduleAvailability = method("g", "Z")

    val optionalModuleBuilder = GboardMethodTarget(
        classType = "Lzer;",
        name = "a",
        parameterTypes = listOf("Laabb;"),
        returnType = "[Lkzf;",
    )
    val moduleManagerRequest = GboardMethodTarget(
        classType = "Laabt;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "[Lkzf;",
    )
    val thinRecognizerInit = GboardMethodTarget(
        classType = "Laabn;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    private fun method(name: String, returnType: String) = GboardMethodTarget(
        classType = "Laaby;",
        name = name,
        parameterTypes = emptyList(),
        returnType = returnType,
    )
}
