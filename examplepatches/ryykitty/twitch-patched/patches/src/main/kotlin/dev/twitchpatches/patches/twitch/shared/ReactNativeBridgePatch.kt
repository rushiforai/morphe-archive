package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.settings.settingsPatch

private const val RN = "Lcom/facebook/react/runtime/ReactInstance;"
private const val RUNTIME = "Ldev/twitchpatches/extension/shared/ReactNativeRuntime;"
private const val ARRAY = "Lcom/facebook/react/bridge/WritableNativeArray;"

internal val reactNativeBridgePatch = bytecodePatch {
    dependsOn(settingsPatch, reactNativeAssetsPatch)
    execute {
        val type = classDefBy(RN)
        val nativeSegment = type.methods.filter {
            it.parameterTypes.map { parameter -> parameter.toString() } ==
                listOf("I", "Ljava/lang/String;") && it.returnType == "V" && it.name == "registerSegmentNative" &&
                it.accessFlags and AccessFlags.NATIVE.value != 0 && it.accessFlags and AccessFlags.PRIVATE.value != 0
        }.uniqueHook("RN separate script loader")
        val load = type.methods.filter {
            it.isInstance(listOf("Lcom/facebook/react/bridge/JSBundleLoader;"), "V") &&
                it.hasStrings("ReactInstance.loadJSBundle")
        }.uniqueHook("RN main bundle loader")
        require(load.code().none { it.opcode == Opcode.THROW } && load.implementation?.tryBlocks?.isEmpty() == true)
        val loaderCalls = load.code().filter { ins ->
            val reference = (ins as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Lcom/facebook/react/bridge/JSBundleLoader;" && reference.name == "loadScript" &&
                reference.returnType == "Ljava/lang/String;" && reference.parameterTypes.map { it.toString() } ==
                listOf("Lcom/facebook/react/bridge/JSBundleLoaderDelegate;")
        }
        require(loaderCalls.size == 1) { "RN main loader invocation changed." }
        val call = type.methods.filter {
            it.name == "callFunctionOnModule" && it.parameterTypes.map { parameter -> parameter.toString() } ==
                listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lcom/facebook/react/bridge/NativeArray;") &&
                it.returnType == "V" && it.accessFlags and AccessFlags.PUBLIC.value != 0 &&
                it.accessFlags and AccessFlags.NATIVE.value != 0
        }.uniqueHook("RN ordered module call")
        classDefBy(ARRAY).methods.filter { it.name == "<init>" && it.parameterTypes.isEmpty() &&
            it.accessFlags and AccessFlags.PUBLIC.value != 0 }.uniqueHook("RN array constructor")
        classDefBy(ARRAY).methods.filter { it.name == "pushBoolean" && it.parameterTypes.map { p -> p.toString() } ==
            listOf("Z") && it.returnType == "V" && it.accessFlags and AccessFlags.PUBLIC.value != 0 }
            .uniqueHook("RN boolean array writer")

        val mutable = mutableClassDefBy(RN)
        val preload = ImmutableMethod(RN, "twitchPatchPreload", listOf(ImmutableMethodParameter(RN, null, null)),
            "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
            null, null, MutableMethodImplementation(4)).toMutable()
        require(mutable.methods.none { it.name == preload.name })
        preload.addInstructionsWithLabels(0, """
            invoke-static {}, $RUNTIME->bootstrapPath()Ljava/lang/String;
            move-result-object v1
            if-eqz v1, :skip
            const v0, 0x7ffffffe
            invoke-direct {p0, v0, v1}, ${nativeSegment.reference}
            invoke-static/range {p0 .. p0}, $RUNTIME->preloaded(Ljava/lang/Object;)V
            :skip
            return-void
        """)
        mutable.methods.add(preload)
        val main = mutable.methods.single { it.reference == load.reference }
        main.addInstruction(0, "invoke-static/range {p0 .. p0}, ${preload.reference}")
        main.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
            .asReversed().forEach { main.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $RUNTIME->attach(Ljava/lang/Object;)V") }
        val destroy = mutable.methods.filter { it.name == "destroy" && it.isInstance(emptyList(), "V") }
            .uniqueHook("RN lifecycle destruction")
        destroy.addInstruction(0, "invoke-static/range {p0 .. p0}, $RUNTIME->detach(Ljava/lang/Object;)V")

        val destination = mutableClassDefBy(RUNTIME)
        val stub = destination.methods.filter { it.name == "dispatch" &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;", "[Z") && it.returnType == "V" }
            .uniqueHook("extension RN policy bridge")
        val dispatch = ImmutableMethod(RUNTIME, stub.name, stub.parameters, "V", stub.accessFlags,
            stub.annotations, stub.hiddenApiRestrictions, MutableMethodImplementation(7)).toMutable()
        val writes = (0..7).joinToString("\n") { index -> """
            const/4 v1, $index
            aget-boolean v2, p1, v1
            invoke-virtual {v0, v2}, $ARRAY->pushBoolean(Z)V
        """ }
        dispatch.addInstructionsWithLabels(0, """
            check-cast p0, $RN
            new-instance v0, $ARRAY
            invoke-direct {v0}, $ARRAY-><init>()V
            $writes
            const-string v1, "TwitchPatchPolicy"
            const-string v2, "set"
            invoke-virtual {p0, v1, v2, v0}, ${call.reference}
            return-void
        """)
        destination.methods.remove(stub); destination.methods.add(dispatch)
        val app = mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods
            .filter { it.name == "onCreate" && it.isInstance(emptyList(), "V") }.uniqueHook("RN application lifetime")
        app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
            app.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $RUNTIME->initialize(Landroid/app/Application;)V")
        }
    }
}
