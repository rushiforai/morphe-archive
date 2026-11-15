package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val RECENT_MEDIA = "recent_media"

/**
 * The event that puts the recent photo card above a chat's composer, offering to send the photo, screenshot or video
 * taken just before the chat opened. It keeps this name on every build, and its static factory is the only way to make one.
 */
internal const val QUICK_SEND_SHOW = "Lcom/facebook/xapp/messaging/composer/recentmedia/quicksend/event/QuickSendShowEvent;"

/** The newest photo is looked up here, before the newest video. */
internal const val IMAGES_URI = "Landroid/provider/MediaStore\$Images\$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;"

private fun Method.recentMediaRefs() = implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference } ?: emptyList()

/**
 * The detector a chat runs when it resumes: static and void, it reads the newest photo and video from the phone's media
 * store and raises the card's event for the newer one. The quick send plugin's handler also makes the event, from the
 * one it was handed, so a method that takes the event is never the detector.
 */
internal fun Method.isRecentMediaDetector(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || definingClass == QUICK_SEND_SHOW) return false
    if (parameterTypes.any { it.toString() == QUICK_SEND_SHOW }) return false
    val code = implementation?.instructions ?: return false
    val factory = code.any { instruction ->
        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ((instruction as ReferenceInstruction).reference as MethodReference).let { it.definingClass == QUICK_SEND_SHOW && it.returnType == QUICK_SEND_SHOW }
    }
    return factory && recentMediaRefs().any { it is FieldReference && it.toString() == IMAGES_URI }
}

internal fun findRecentMedia(classes: Iterable<ClassDef>): List<Method> = recentMediaDetectors.methods(classes)

internal val recentMediaDetectors = methodCheck { _, method -> method.isRecentMediaDetector() }

internal fun MutableMethod.validateRecentMedia() {
    if (!isRecentMediaDetector()) throw PatchException("Messenger controls: ${hookId()} isn't the recent photo detector")
    validateSwitch()
}

/**
 * While the switch is on the detector returns before it reads the media store, so the card never shows. A chat that
 * opens with Off, Pause or safe mode runs Messenger's own check, card and all.
 */
internal fun MutableMethod.injectRecentMedia() {
    validateRecentMedia()
    injectSwitch("$SETTINGS->hideRecentMedia()Z", "0x0")
}
