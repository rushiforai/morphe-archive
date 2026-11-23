package patches.gboard.features.ocr

import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.mutableClass
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

internal object GboardOcrPatchTargets {
    val taskCompletionListener = GboardMethodTarget("Lzdv;", "l", listOf("Lzdk;"), "V")

    internal fun requireTaskCompletionRegistration(owner: MutableClass): MutableMethod {
        val method = taskCompletionListener.resolve(owner)
        check(owner.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value))
        check(method.accessFlags == AccessFlags.PUBLIC.value) { "Expected public instance task registration" }
        return method
    }

    fun preflight(context: BytecodePatchContext) {
        val methods = listOf(configLabel, languageHint, loggingLibrary, optionalModuleName, moduleId,
            moduleAvailability, optionalModuleBuilder, moduleManagerRequest, thinRecognizerInit) + listOf(
            GboardMethodTarget("Lxli;", "<init>", listOf("Ljava/lang/String;", "I", "J", "Z"), "V"),
            GboardMethodTarget("Lazjo;", "b", emptyList(), "Lazjo;"),
            GboardMethodTarget("Lazjo;", "a", emptyList(), "Landroid/content/Context;"),
            GboardMethodTarget("Lyaz;", "a", listOf("Landroid/content/Context;", "Ljava/lang/String;"), "I"),
            GboardMethodTarget("Lyaz;", "d", listOf("Landroid/content/Context;", "Lyay;", "Ljava/lang/String;"), "Lyaz;"),
            GboardMethodTarget("Lyaz;", "c", listOf("Ljava/lang/String;"), "Landroid/os/IBinder;"),
            GboardMethodTarget("Lyak;", "<init>", listOf("Ljava/lang/Object;"), "V"),
            GboardMethodTarget("Lbajh;", "<init>", listOf("Landroid/os/IBinder;"), "V"),
            GboardMethodTarget("Lbajg;", "<init>", listOf("Landroid/os/IBinder;"), "V"),
            GboardMethodTarget("Lhrd;", "a", emptyList(), "Landroid/os/Parcel;"),
            GboardMethodTarget("Lhrd;", "J", listOf("I", "Landroid/os/Parcel;"), "Landroid/os/Parcel;"),
            GboardMethodTarget("Lhrd;", "L", listOf("I", "Landroid/os/Parcel;"), "V"),
            GboardMethodTarget("Lhrf;", "d", listOf("Landroid/os/Parcel;", "Landroid/os/IInterface;"), "V"),
            GboardMethodTarget("Lhrf;", "c", listOf("Landroid/os/Parcel;", "Landroid/os/Parcelable;"), "V"),
            GboardMethodTarget("Lbajq;", "<init>", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Z", "I", "Ljava/lang/String;", "Z"), "V"),
            GboardMethodTarget("Lbajx;", "c", emptyList(), "V"),
            GboardMethodTarget("Lxws;", "<init>", listOf("Landroid/content/Context;"), "V"),
            GboardMethodTarget("Lxws;", "a", listOf("[Lxns;"), "Lzdv;"),
            GboardMethodTarget("Lxws;", "c", listOf("Lxvo;"), "V"),
            GboardMethodTarget("Lxvo;", "a", listOf("Lxvx;"), "V"),
            GboardMethodTarget("Lzdv;", "g", emptyList(), "Z"),
            GboardMethodTarget("Lzdv;", "e", emptyList(), "Ljava/lang/Object;"),
            GboardMethodTarget("Lzdv;", "d", emptyList(), "Ljava/lang/Exception;"),
        )
        methods.forEach { it.resolve(context) }
        requireTaskCompletionRegistration(context.mutableClass("Lzdv;"))
        listOf(
            GboardFieldTarget("Lbajx;", "a", "Landroid/content/Context;"),
            GboardFieldTarget("Lbajx;", "b", "Lbaje;"),
            GboardFieldTarget("Lbajx;", "f", "Lbajg;"),
            GboardFieldTarget("Lyaz;", "b", "Lyay;"),
            GboardFieldTarget("Lxli;", "a", "Ljava/lang/String;"),
            GboardFieldTarget("Lxvx;", "b", "I"), GboardFieldTarget("Lxvx;", "e", "I"),
            GboardFieldTarget("Lxvv;", "a", "I"), GboardFieldTarget("Lxvv;", "b", "Z"),
        ).forEach { it.resolve(context) }
        check(context.mutableClass("Lbajh;").superclass == "Lhrd;")
        check(context.mutableClass("Lbajg;").superclass == "Lhrd;")
        check("Lbaje;" in context.mutableClass("Lbaks;").interfaces)
    }
    val configLabel = method("b", "Ljava/lang/String;")
    val languageHint = method("c", "Ljava/lang/String;")
    val loggingLibrary = method("d", "Ljava/lang/String;")
    val optionalModuleName = method("e", "Ljava/lang/String;")
    val moduleId = method("f", "Ljava/lang/String;")
    val moduleAvailability = method("g", "Z")

    val optionalModuleBuilder = GboardMethodTarget(
        classType = "Lbaki;",
        name = "a",
        parameterTypes = listOf("Lbaje;"),
        returnType = "[Lxli;",
    )
    val moduleManagerRequest = GboardMethodTarget(
        classType = "Lbakk;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "[Lxli;",
    )
    val thinRecognizerInit = GboardMethodTarget(
        classType = "Lbajx;",
        name = "b",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    private fun method(name: String, returnType: String) = GboardMethodTarget(
        classType = "Lbaks;",
        name = name,
        parameterTypes = emptyList(),
        returnType = returnType,
    )
}
