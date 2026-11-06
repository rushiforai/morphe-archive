package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val RN_HOST_FACTORY = "Ltv/twitch/android/feature/discovery/feed/rn/runtime/RNReactHostFactory;"
private const val RN_SOURCE = "Ltv/twitch/android/feature/discovery/feed/rn/runtime/RNSourceSelection;"
internal const val RN_BUNDLE_ASSET = "assets://index.android.bundle"

internal data class BundleSourceHook(val method: Method, val resultIndex: Int, val register: Int)

internal fun bundledReactNativeHook(methods: Iterable<Method>): BundleSourceHook = methods
    .filter { it.definingClass == RN_HOST_FACTORY }
    .flatMap { method ->
        val code = method.code()
        code.mapIndexedNotNull { index, instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL || call?.definingClass != RN_SOURCE ||
                call.name != "getBundleFile" || call.parameterTypes.isNotEmpty() ||
                call.returnType != "Ljava/lang/String;") return@mapIndexedNotNull null
            val result = code.getOrNull(index + 1)
            require(result?.opcode == Opcode.MOVE_RESULT_OBJECT && result is OneRegisterInstruction) {
                "React Native bundle source result changed."
            }
            BundleSourceHook(method, index + 1, result.registerA)
        }
    }.uniqueHook("React Native host bundle source")

internal fun BytecodePatchContext.pinBundledReactNative() {
    val hook = bundledReactNativeHook(classDefBy(RN_HOST_FACTORY).methods)
    // Metro module identifiers and Hermes edits belong to this APK, not downloaded hot updates.
    mutableClassDefBy(RN_HOST_FACTORY).methods.single { it.reference == hook.method.reference }
        .replaceInstruction(hook.resultIndex, "const-string v${hook.register}, \"$RN_BUNDLE_ASSET\"")
}
