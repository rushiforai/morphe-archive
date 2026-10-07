package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val SYSTEM_CAMERA = "system_camera"
internal const val MONTAGE_PARAMS = "Lcom/facebook/messaging/montage/composer/model/MontageComposerFragmentParams;"
internal const val NAVIGATION_TRIGGER = "Lcom/facebook/messaging/send/trigger/NavigationTrigger;"
internal const val MONTAGE_ACTIVITY = "Lcom/facebook/messaging/montage/composer/MontageComposerActivity;"
/** The request code the chat composer starts Messenger's own camera with, and reads its sent message back under. */
internal const val CAMERA_REQUEST = 7377
/** The request code a photo picked in another app comes back under, which opens Messenger's editor for the open chat. */
internal const val EXTERNAL_MEDIA_REQUEST = 1112
internal const val EXTERNAL_MEDIA_NULL_DATA = "ComposeFragment:externalMediaGalleryActivityResultNullData"
internal const val CAMERA_NULL_DATA = "ComposeFragment:montageMessageActivityResultNullData"
internal const val CAMERA_ACTIVITY = "app.hushmessenger.extension.CameraActivity"
internal const val CAMERA_PROVIDER = "app.hushmessenger.extension.CameraProvider"
/** The capture provider's authority is the package name plus this, the way the extension looks it up. */
internal const val CAMERA_AUTHORITY_SUFFIX = ".hush.camera"
private const val CAMERA_INTENT_CALL = "$SETTINGS->systemCamera(Landroid/content/Intent;)Landroid/content/Intent;"
private const val CAMERA_REQUEST_CALL = "$SETTINGS->cameraRequestCode(Landroid/content/Intent;I)I"

private fun cameraChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the chat camera launch moved ($detail)")

private fun Instruction.literal() = (this as? NarrowLiteralInstruction)?.narrowLiteral
private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** Messenger's static helper that builds the camera screen's intent from the composer's params. */
private fun MethodReference.isCameraIntent() = definingClass == MONTAGE_ACTIVITY && returnType == "Landroid/content/Intent;" &&
    parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;", MONTAGE_PARAMS, NAVIGATION_TRIGGER)

/** Messenger's in-app launcher: start this intent for a result on the chat's fragment. */
private fun MethodReference.isFragmentLauncher() = returnType == "Z" &&
    parameterTypes.map { it.toString() } == listOf("Landroid/content/Intent;", ANDROIDX_FRAGMENT, "I")

/** The chat composer's camera listener: it builds Messenger's camera intent and starts it with [CAMERA_REQUEST]. */
internal fun Method.isCameraLaunch(): Boolean {
    if (returnType != "V" || parameterTypes.map { it.toString() } != listOf(MONTAGE_PARAMS, NAVIGATION_TRIGGER) ||
        AccessFlags.STATIC.isSet(accessFlags)) return false
    val code = implementation?.instructions ?: return false
    return code.any { it.literal() == CAMERA_REQUEST } && code.any { it.methodRef()?.isCameraIntent() == true }
}

/**
 * The chat's fragment reads both results: Messenger's camera hands back a finished message under [CAMERA_REQUEST], and
 * a photo picked in another app comes back under [EXTERNAL_MEDIA_REQUEST] as a content URI, which Messenger copies and
 * opens in its own editor for the open chat. The switch relies on that second path, so it needs exactly one such reader.
 */
internal fun Method.isComposerResult(): Boolean {
    if (name != "onActivityResult" || returnType != "V" || parameterTypes.map { it.toString() } != listOf("I", "I", "Landroid/content/Intent;")) return false
    val code = implementation?.instructions ?: return false
    val strings = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.toSet()
    return code.any { it.literal() == CAMERA_REQUEST } && code.any { it.literal() == EXTERNAL_MEDIA_REQUEST } &&
        EXTERNAL_MEDIA_NULL_DATA in strings && CAMERA_NULL_DATA in strings
}

/** Every camera listener, or none when the chat fragment no longer reads a photo from another app. */
internal fun findSystemCamera(classes: Iterable<ClassDef>): List<Method> {
    val methods = classes.flatMap { it.methods }
    if (methods.count { it.isComposerResult() } != 1) return emptyList()
    return methods.filter { it.isCameraLaunch() }
}

/**
 * Index of the launcher call that starts Messenger's camera:
 *
 *     invoke-static {vContext, p1, p2}, MontageComposerActivity->A1E(Context, Params, Trigger)Intent
 *     move-result-object vIntent
 *     ...                                   (the launcher and the chat fragment)
 *     const/16 vCode, 7377
 *     invoke-virtual {vLauncher, vIntent, vFragment, vCode}, <launcher>(Intent, Fragment, I)Z   <- returned
 *     return-void
 *
 * The listener only starts the camera, so the launcher's answer is dropped and nothing else reads the intent.
 */
internal fun Method.cameraLaunchSite(): Int {
    val code = implementation?.instructions?.toList() ?: cameraChanged("no code")
    val builds = code.indices.filter { code[it].methodRef()?.isCameraIntent() == true }
    val b = builds.singleOrNull() ?: cameraChanged("${builds.size} camera intents")
    val build = code[b] as FiveRegisterInstruction
    val params = implementation!!.registerCount - 2
    if (code[b].opcode != Opcode.INVOKE_STATIC || build.registerCount != 3 || build.registerD != params || build.registerE != params + 1) {
        cameraChanged("camera intent arguments")
    }
    val moved = code.getOrNull(b + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
        ?: cameraChanged("camera intent result")
    val intent = moved.registerA
    val launches = code.indices.filter { code[it].methodRef()?.isFragmentLauncher() == true }
    val l = launches.singleOrNull() ?: cameraChanged("${launches.size} launches")
    val launch = code[l] as FiveRegisterInstruction
    val request = code[l - 1]
    if (code[l].opcode != Opcode.INVOKE_VIRTUAL || launch.registerCount != 4 || launch.registerD != intent ||
        request.opcode != Opcode.CONST_16 || request.literal() != CAMERA_REQUEST ||
        (request as OneRegisterInstruction).registerA != launch.registerF) cameraChanged("launch arguments")
    if (code.getOrNull(l + 1)?.opcode != Opcode.RETURN_VOID || l + 2 != code.size) cameraChanged("after the launch")
    if (code.count { it.literal() == CAMERA_REQUEST } != 1) cameraChanged("request codes")
    // Nothing between building the intent and the launch may write the intent register, and nothing may jump in.
    for (at in b + 2 until l) {
        if (!code[at].opcode.setsRegister()) continue
        val written = (code[at] as? OneRegisterInstruction)?.registerA ?: continue
        if (written == intent || (code[at].opcode.setsWideRegister() && written + 1 == intent)) cameraChanged("intent register reused")
    }
    if (jumpTargets().any { it in b + 1..l }) cameraChanged("a branch lands on the launch")
    // The helper calls are plain invokes, so both registers stay at v15 or below.
    if (intent > 15 || launch.registerF > 15 || intent == launch.registerF) cameraChanged("registers out of range")
    return l
}

internal fun MutableMethod.validateSystemCamera(): Int {
    if (AccessFlags.STATIC.isSet(accessFlags) || !isCameraLaunch()) {
        throw PatchException("Messenger controls: unexpected camera listener ${hookId()}")
    }
    return cameraLaunchSite()
}

/**
 * Swaps the intent and its request code right before the launch. With the switch on, the intent opens the extension's
 * capture screen, which hands the phone camera's photo back the way another app's picked photo comes back, so the chat
 * fragment's own code opens it in Messenger's editor for this chat. Off, Pause and safe mode get Messenger's camera.
 */
internal fun MutableMethod.injectSystemCamera() {
    val l = validateSystemCamera()
    val launch = implementation!!.instructions.elementAt(l) as FiveRegisterInstruction
    val intent = launch.registerD
    val request = launch.registerF
    addInstructions(l, """
        invoke-static {v$intent}, $CAMERA_INTENT_CALL
        move-result-object v$intent
        invoke-static {v$intent, v$request}, $CAMERA_REQUEST_CALL
        move-result v$request
    """.trimIndent())
}

/**
 * Declares the capture screen and its photo provider once the switch's hook is in. The provider's authority follows the
 * manifest's package name at that point, and the clone patch moves it like Messenger's own when it runs later.
 */
internal fun Document.addSystemCamera() {
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("Messenger controls: expected one application")
    val packageName = documentElement.getAttribute("package").ifEmpty { throw PatchException("Messenger controls: the manifest has no package") }
    fun child(tag: String, vararg attributes: Pair<String, String>) = createElement(tag).also { node ->
        attributes.forEach { (name, value) -> node.setAttribute("android:$name", value) }
        application.appendChild(node)
    }
    child("activity", "name" to CAMERA_ACTIVITY, "exported" to "false", "excludeFromRecents" to "true",
        "theme" to "@android:style/Theme.Translucent.NoTitleBar",
        "configChanges" to "orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden")
    child("provider", "name" to CAMERA_PROVIDER, "authorities" to packageName + CAMERA_AUTHORITY_SUFFIX,
        "exported" to "false", "grantUriPermissions" to "true")
}
