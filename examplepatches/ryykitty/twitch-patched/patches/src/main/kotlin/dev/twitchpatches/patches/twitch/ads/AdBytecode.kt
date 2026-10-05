package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*

internal const val AD_SETTINGS = "Ldev/twitchpatches/extension/ads/AdSettings;"
internal const val AD_RUNTIME = "Ldev/twitchpatches/extension/ads/AdRuntime;"

internal fun BytecodePatchContext.initializeAdFeature(feature: Int) {
    val app = mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;")
    val method = app.methods.filter { it.name == "onCreate" && it.isInstance(emptyList(), "V") }
        .uniqueHook("ad preferences initialization")
    val bridge = createAdMethod(app.type, "twitchPatchesInitializeAds$feature",
        listOf("Landroid/app/Application;"), "V", 1, """
        const/4 v0, $feature
        invoke-static {p0, v0}, $AD_SETTINGS->initialize(Landroid/app/Application;I)V
        return-void
    """)
    method.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }.asReversed().forEach { method.insertAtReturn(it,
            "invoke-static/range {p0 .. p0}, ${bridge.reference}") }
}

internal fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.filter { it.reference == method.reference }
        .uniqueHook("resolved ad method")

internal fun BytecodePatchContext.createAdMethod(owner: String, name: String, parameters: List<String>,
    returns: String, locals: Int, instructions: String): MutableMethod {
    val type = mutableClassDefBy(owner)
    if (type.methods.any { it.name == name }) throw PatchException("Ads: bridge already exists: $name")
    val words = parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val method = ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, null, null) },
        returns, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        MutableMethodImplementation(locals + words)).toMutable()
    method.addInstructionsWithLabels(0, instructions)
    type.methods.add(method)
    return method
}

internal fun parameterWord(method: Method, index: Int): Int =
    (if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1) +
        method.parameterTypes.take(index).sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }
