package app.template.patches.pizzabusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val BASE = "Lcom/tapblaze/pizzabusiness/BaseIronSourceWrapper;"
internal const val BRIDGE = "Lcom/tapblaze/pizzabusiness/IronSourceWrapper;"
internal const val STRING = "Ljava/lang/String;"
internal const val RUNNABLE = "Ljava/lang/Runnable;"
internal const val ACTIVITY = "Lorg/cocos2dx/lib/Cocos2dxActivity;"
internal const val HELPER = "Lpl/dudek/extension/pizzabusiness/RewardedAds;"
private const val AD = "Lcom/unity3d/mediation/rewarded/LevelPlayRewardedAd;"

internal fun requirePizza(value: Boolean, message: String) {
    if (!value) throw PatchException("Pizza: $message. Use a complete clean APKM/XAPK for a supported bootstrap profile.")
}

internal fun Method.calls(owner: String, name: String): Boolean =
    implementation?.instructions?.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == owner && ref.name == name
    } == true

internal fun Method.hasString(value: String): Boolean = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

internal fun BytecodePatchContext.pizzaMethod(
    owner: String, name: String, parameters: List<String>, returns: String,
    static: Boolean = true,
): MutableMethod {
    val method = mutableClassDefBy(owner).methods.singleOrNull {
        it.name == name && it.parameterTypes == parameters && it.returnType == returns
    } ?: throw PatchException("Skip rewarded ads: missing $owner->$name signature")
    requirePizza(AccessFlags.STATIC.isSet(method.accessFlags) == static, "$name static/instance shape changed")
    return method
}

@Suppress("unused")
val skipRewardedAdsPatch = bytecodePatch(
    name = "Skip rewarded ads",
    description = "Completes the game's rewarded-video flow without playing an ad, keeping the requested placement and normal reward. Includes re-signed startup support.",
    default = true,
) {
    compatibleWith(PizzaProfiles.compatibility)
    dependsOn(pizzaStartupSupport)
    extendWith("extensions/pizzabusiness.mpe")

    execute {
        val show = pizzaMethod(BASE, "showRewardedVideo", listOf(STRING), "V")
        val allocations = show.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }.map {
            ((it as ReferenceInstruction).reference as TypeReference).type
        }
        requirePizza(allocations.size == 1 && RUNNABLE in classDefBy(allocations.single()).interfaces,
            "reward request allocation changed")
        val request = allocations.single()
        val ready = pizzaMethod(BASE, "isRewardedVideoReady", listOf(STRING), "Z")
        val initialize = pizzaMethod(BASE, "Initialize", listOf(STRING, STRING, STRING, "Z", "I"), "V")
        val run = pizzaMethod(request, "run", emptyList(), "V", static = false)
        val constructor = pizzaMethod(request, "<init>", listOf(STRING), "V", static = false)
        val sdkCallbacks = mutableListOf<Method>()
        classDefForEach { cls ->
            if (cls.type.startsWith(BASE.removeSuffix(";") + "$")) cls.methods.filterTo(sdkCallbacks) {
                it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                    it.calls(BRIDGE, "onVideoReady") &&
                    it.implementation?.instructions?.map { instruction -> instruction.opcode } ==
                    listOf(Opcode.INVOKE_STATIC, Opcode.RETURN_VOID)
            }
        }
        requirePizza(sdkCallbacks.size == 1, "SDK readiness callback missing or ambiguous")
        val sdkReady = pizzaMethod(sdkCallbacks.single().definingClass, "run", emptyList(), "V", static = false)

        requirePizza(classDefBy(BRIDGE).superclass == BASE, "JNI bridge superclass changed")
        listOf("onInitialized", "onVideoReady", "onVideoStarted", "onVideoEnded", "onVideoWatched").forEach { name ->
            val callback = pizzaMethod(BRIDGE, name, if (name == "onVideoWatched") listOf(STRING) else emptyList(), "V")
            requirePizza(AccessFlags.NATIVE.isSet(callback.accessFlags) && callback.implementation == null,
                "$name is no longer the original native callback")
        }
        requirePizza(RUNNABLE in classDefBy(request).interfaces &&
            classDefBy(request).fields.count { it.name == "val\$placement" && it.type == STRING } == 1,
            "placement capture changed")
        requirePizza(constructor.implementation?.registerCount == 2 &&
            constructor.instructions.map { it.opcode } == listOf(Opcode.IPUT_OBJECT, Opcode.INVOKE_DIRECT, Opcode.RETURN_VOID),
            "request constructor changed")
        val capture = constructor.instructions.first() as TwoRegisterInstruction
        val captureField = (capture as ReferenceInstruction).reference as FieldReference
        requirePizza(capture.registerA == 1 && capture.registerB == 0 &&
            captureField.definingClass == request && captureField.name == "val\$placement" && captureField.type == STRING,
            "constructor no longer captures its placement argument")
        requirePizza((run.implementation?.registerCount ?: 0) >= 2 && run.implementation!!.tryBlocks.isEmpty() &&
            run.calls(AD, "showAd") && run.calls(AD, "isAdReady"), "reward request body changed or already patched")
        requirePizza(ready.implementation?.registerCount == 1 && ready.implementation!!.tryBlocks.isEmpty() &&
            ready.calls(AD, "isAdReady"), "readiness body changed or already patched")
        requirePizza(initialize.hasString("[BaseIronSourceWrapper] TD cache in Initialize: ") &&
            initialize.calls("Landroid/app/Activity;", "runOnUiThread") && !initialize.calls(HELPER, "initialize"),
            "initialization changed or already patched")
        requirePizza(pizzaMethod(ACTIVITY, "runOnGLThread", listOf(RUNNABLE), "V", static = false)
            .calls("Landroid/opengl/GLSurfaceView;", "queueEvent"), "game queue changed")
        pizzaMethod("Lorg/cocos2dx/lib/Cocos2dxHelper;", "runOnGLThread", listOf(RUNNABLE), "V")
        requirePizza(sdkReady.instructions.map { it.opcode } == listOf(Opcode.INVOKE_STATIC, Opcode.RETURN_VOID) &&
            sdkReady.calls(BRIDGE, "onVideoReady"), "SDK readiness callback changed")

        // This Runnable is private to the rewarded gateway, not interstitials.
        var constructorCalls = 0
        classDefForEach { cls ->
            cls.methods.forEach { method ->
                constructorCalls += method.implementation?.instructions?.count {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == request && ref.name == "<init>"
                } ?: 0
            }
        }
        requirePizza(constructorCalls == 1 && show.calls(request, "<init>"), "request is shared with another flow")
        val code = show.instructions.toList()
        requirePizza(code.map { it.opcode } == listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
            Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) &&
            show.calls("Landroid/app/Activity;", "runOnUiThread"), "show gateway changed")
        val post = code[4] as FiveRegisterInstruction
        requirePizza(post.registerCount == 2, "dispatch arguments changed")

        // All guards finish before these related bytecode changes are made.
        initialize.addInstructions(0, "invoke-static {}, $HELPER->initialize()V")
        ready.replaceBody("const/4 p0, 0x1\nreturn p0")
        // Background SDK loads must not reuse the native readiness timer key
        // ahead of the locally queued reward/end sequence.
        sdkReady.replaceBody("return-void")
        show.replaceInstruction(4,
            "invoke-virtual {v${post.registerC}, v${post.registerD}}, $ACTIVITY->runOnGLThread($RUNNABLE)V")
        // The same captured placement is passed to the native reward handler.
        // Its scheduler preserves insertion order for these distinct timer keys.
        // No LevelPlay display, impression, revenue or postback is synthesized.
        run.replaceBody("""
            invoke-static {}, $BRIDGE->onVideoStarted()V
            iget-object v0, p0, $request->val${'$'}placement:$STRING
            if-nez v0, :placement_ready
            const-string v0, "DefaultRewardedVideo"
            :placement_ready
            invoke-static {v0}, $BRIDGE->onVideoWatched($STRING)V
            invoke-static {}, $BRIDGE->onVideoEnded()V
            invoke-static {}, $BRIDGE->onVideoReady()V
            return-void
        """.trimIndent())
    }
}
