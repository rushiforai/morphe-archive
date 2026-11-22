package app.revanced.patches.rif.video

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.revanced.patches.rif.ads.platinumAdSlotFixPatch
import app.revanced.patches.rif.comments.rifVideoPlayerFingerprint
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.revanced.patches.rif.shared.classDefs
import app.revanced.patches.rif.shared.proxy

private const val EXTENSION = "Lapp/revanced/extension/rif/VideoProcessing;"
private const val VIDEO_MODEL = "Lcom/andrewshu/android/reddit/things/objects/ThreadMediaRedditVideo;"
private const val CONTEXT = "Landroid/content/Context;"
private const val BAD_VIDEO_ID = "Bad Reddit video ID for Uri %s"

private fun Method.hasString(value: String) = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == value
} == true

private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** `invoke-static {Context, int, int}` returning void: rif's toast helper (free o5.q0.a, Platinum p5.q0.a). */
private fun Instruction.isToastCall(): Boolean =
    opcode == Opcode.INVOKE_STATIC && methodRef()?.let { ref ->
        ref.returnType == "V" && ref.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, "I", "I")
    } == true

private fun Method.toastCallIndexes(): List<Int> =
    implementation!!.instructions.withIndex().filter { it.value.isToastCall() }.map { it.index }

// rif's Reddit video metadata loader (free j2.e / Platinum k2.e): the class with the only
// "Bad Reddit video ID for Uri %s". The method is its response parser e0(InputStream) ->
// ThreadMediaRedditVideo (j2.a$b.g0 has the same signature in another class).
internal val videoMetadataParseFingerprint = fingerprint {
    returns(VIDEO_MODEL)
    parameters("Ljava/io/InputStream;")
    custom { _, classDef -> classDef.methods.any { it.hasString(BAD_VIDEO_ID) } }
}

// rif's player fragment's fetchVideoMetadata (free v1.k0.N6 / Platinum w1.k0.C6): no parameters, and the
// only (Context,int,int)V toast call plus a Handler.post(Runnable).
private fun Method.isFetchVideoMetadata(): Boolean =
    parameterTypes.isEmpty() && returnType == "V" && implementation != null &&
        toastCallIndexes().size == 1 &&
        implementation!!.instructions.any {
            it.opcode == Opcode.INVOKE_VIRTUAL && it.methodRef()?.let { ref ->
                ref.definingClass == "Landroid/os/Handler;" && ref.name == "post"
            } == true
        }

// The player fragment's onPlayerError (free v1.k0.S0 / Platinum w1.k0.M): one reference parameter, returns
// void, first instruction `invoke-static (Throwable)V` (rif's error logger), and it calls fetchVideoMetadata.
private fun Method.isPlayerError(fetch: Method, ownerType: String): Boolean {
    if (returnType != "V" || parameterTypes.size != 1 || !parameterTypes[0].startsWith("L")) return false
    val insns = implementation?.instructions?.toList() ?: return false
    val first = insns.firstOrNull() ?: return false
    if (first.opcode != Opcode.INVOKE_STATIC) return false
    val ref = first.methodRef() ?: return false
    if (ref.returnType != "V" || ref.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Throwable;")) {
        return false
    }
    return insns.any {
        it.opcode == Opcode.INVOKE_DIRECT && it.methodRef()?.let { call ->
            call.definingClass == ownerType && call.name == fetch.name && call.parameterTypes.isEmpty()
        } == true
    }
}

private fun BytecodePatchContext.hookMetadataLoader() {
    // A. Tee the loader's response body (pattern of SubmitTask.k0 + ImageHosting.wrapResponse).
    val parser = videoMetadataParseFingerprint.method
    parser.addInstructions(
        0,
        """
            invoke-static { p0, p1 }, $EXTENSION->teeMetadata(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;
            move-result-object p1
        """,
    )

    // B. The loader's result handler (its only subclass): the null branch's toast call.
    val loaderType = videoMetadataParseFingerprint.classDef.type
    val subclasses = classDefs.filter { it.superclass == loaderType }
    val handlerClass = subclasses.singleOrNull { cls ->
        cls.methods.any { it.isResultHandlerWithToast() }
    } ?: throw PatchException("video loader's result handler class not found (subclasses of $loaderType: ${subclasses.size})")
    val handler = proxy(handlerClass).mutableClass.methods.single { it.isResultHandlerWithToast() }
    replaceToast(handler, "metadataToast")
}

private fun Method.isResultHandlerWithToast(): Boolean =
    returnType == "V" && parameterTypes.size == 1 && parameterTypes[0].toString() == VIDEO_MODEL &&
        implementation != null && toastCallIndexes().size == 1

private fun BytecodePatchContext.hookPlayer() {
    val playerClass = proxy(rifVideoPlayerFingerprint.classDef).mutableClass

    // D. fetchVideoMetadata's toast.
    val fetchMatches = playerClass.methods.filter { it.isFetchVideoMetadata() }
    val fetch = fetchMatches.singleOrNull()
        ?: throw PatchException("fetchVideoMetadata not found in ${playerClass.type} (${fetchMatches.size} matches)")
    replaceToast(fetch, "formatToast")

    // C. onPlayerError records which playlists were refused.
    val errorMatches = playerClass.methods.filter { it.isPlayerError(fetch, playerClass.type) }
    val onError = errorMatches.singleOrNull()
        ?: throw PatchException("onPlayerError not found in ${playerClass.type} (${errorMatches.size} matches)")
    onError.addInstructions(
        0,
        "invoke-static { p0, p1 }, $EXTENSION->playerError(Ljava/lang/Object;Ljava/lang/Throwable;)V",
    )
}

/**
 * Replaces `q0.a(Context, resId, duration)` in [method] (it has exactly one) with
 * `VideoProcessing.<hook>(this, Context, resId, duration)`; the extension shows rif's toast or ours.
 */
private fun replaceToast(method: MutableMethod, hook: String) {
    val at = method.toastCallIndexes().singleOrNull()
        ?: throw PatchException("expected one toast call in ${method.name}")
    val call = method.implementation!!.instructions.toList()[at] as FiveRegisterInstruction
    val registers = listOf(call.registerC, call.registerD, call.registerE)
    if (call.registerCount != 3 || registers.any { it > 15 }) {
        throw PatchException("toast call in ${method.name} doesn't fit invoke-static with p0")
    }
    method.replaceInstruction(
        at,
        "invoke-static { p0, v${registers[0]}, v${registers[1]}, v${registers[2]} }, " +
            "$EXTENSION->$hook(Ljava/lang/Object;${CONTEXT}II)V",
    )
}

@Suppress("unused")
val explainProcessingVideosPatch = bytecodePatch(
    name = "Explain processing videos",
    description = "Says when a Reddit video is still processing instead of showing an error.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(platinumAdSlotFixPatch)
    extendWith("extensions/extension.mpe")

    execute {
        hookMetadataLoader()
        hookPlayer()
    }
}
