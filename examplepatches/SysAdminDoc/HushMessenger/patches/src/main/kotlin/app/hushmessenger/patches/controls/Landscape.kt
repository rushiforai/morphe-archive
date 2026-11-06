package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Messenger's portrait lock. A screen that opts into it asks its activity helper, as the screen is created, whether to
 * lock, and the helper says yes while Meta's server flag is on. The same answer turns away the orientation changes the
 * screen asks for later, like a video going full screen. The photo and video viewers lock portrait again as they close,
 * on the same flag. Screens the manifest itself locks (calls, the cameras, payments) never ask.
 */
internal const val LANDSCAPE = "landscape"
internal const val LANDSCAPE_LOCK = "landscape_lock"
internal const val LANDSCAPE_MEDIA = "landscape_media"

internal const val FB_FRAGMENT_ACTIVITY = "Lcom/facebook/base/activity/FbFragmentActivity;"

/** Meta's server flag for the portrait lock, as 586 numbers it. */
internal const val LANDSCAPE_FLAG = 0x8105f000002c01L

/** The option the photo and video viewers' orientation helper reads as it's built, the one place 586 names it. */
internal const val MEDIA_ORIENTATION_OPTION = "allowOrientationChanges"

internal const val PORTRAIT_LOCK_HELPER = "$SETTINGS->portraitLock(ZLandroid/app/Activity;)Z"
internal const val MEDIA_ORIENTATION_HELPER = "$SETTINGS->mediaOrientation(I)I"

/** The lock check's activity field and the returns its answer leaves through. */
internal class PortraitLock(val field: FieldReference, val returns: List<Int>)

private fun lockChanged(method: Method, detail: String): Nothing =
    throw PatchException("Messenger controls: the portrait lock in ${method.hookId()} no longer matches the tested build ($detail)")

private fun Method.code() = implementation?.instructions?.toList()

private fun Method.writes(register: Int) = code().orEmpty().any {
    val written = (it as? OneRegisterInstruction)?.registerA
    written != null && ((it.opcode.setsRegister() && written == register) || (it.opcode.setsWideRegister() && written + 1 == register))
}

/**
 * The check reads the flag, then asks the screen's own opt-in through the one activity field it holds, and answers
 * with a plain boolean return. Nothing jumps onto a return, `this` is never overwritten, and there are two locals in
 * the low sixteen registers for the answer and the activity. Any other shape refuses the switch.
 */
internal fun Method.portraitLock(): PortraitLock {
    val code = code() ?: lockChanged(this, "no code")
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes.isNotEmpty()) lockChanged(this, "signature")
    val registers = implementation!!.registerCount
    if (registers > 16 || registers < 3) lockChanged(this, "registers")
    if (code.none { it.opcode == Opcode.CONST_WIDE && (it as WideLiteralInstruction).wideLiteral == LANDSCAPE_FLAG }) lockChanged(this, "flag")
    val self = parameterRegister(0)
    val reads = code.filter {
        it.opcode == Opcode.IGET_OBJECT && ((it as ReferenceInstruction).reference as FieldReference).type == FB_FRAGMENT_ACTIVITY
    }
    val field = reads.map { (it as ReferenceInstruction).reference as FieldReference }.distinctBy { it.toString() }.singleOrNull()
        ?: lockChanged(this, "activity field")
    if (field.definingClass != definingClass || reads.any { (it as TwoRegisterInstruction).registerB != self } || writes(self)) {
        lockChanged(this, "activity field")
    }
    val asksOptIn = code.any { instruction ->
        val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL && called?.definingClass == FB_FRAGMENT_ACTIVITY &&
            called.parameterTypes.isEmpty() && called.returnType == "Z"
    }
    if (!asksOptIn) lockChanged(this, "opt-in")
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN }
    val targets = jumpTargets()
    if (returns.isEmpty() || returns.any { it in targets }) lockChanged(this, "returns")
    return PortraitLock(field, returns)
}

/** The one method that reads the lock flag with this shape. */
internal fun findPortraitLock(classes: Iterable<ClassDef>): List<Method> {
    val checks = classes.flatMap { cls ->
        cls.methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() && method.code()?.any {
                it.opcode == Opcode.CONST_WIDE && (it as WideLiteralInstruction).wideLiteral == LANDSCAPE_FLAG
            } == true && runCatching { method.portraitLock() }.isSuccess
        }
    }
    return listOfNotNull(checks.singleOrNull())
}

internal fun MutableMethod.validatePortraitLock() {
    portraitLock()
}

/**
 * Each answer passes through the extension with the screen it's for, which can only turn a yes into a no. A no from
 * Messenger's own check returns as it was. Later returns go first, so the earlier indexes still hold.
 */
internal fun MutableMethod.injectPortraitLock() {
    val lock = portraitLock()
    for (at in lock.returns.asReversed()) {
        val answer = (getInstruction(at) as OneRegisterInstruction).registerA
        val screen = (0 until implementation!!.registerCount - 1).first { it != answer }
        addInstructions(at, """
            iget-object v$screen, p0, ${lock.field.definingClass}->${lock.field.name}:${lock.field.type}
            invoke-static {v$answer, v$screen}, $PORTRAIT_LOCK_HELPER
            move-result v$answer
        """.trimIndent())
    }
}

private fun Method.namesMediaOrientation() = code()?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == MEDIA_ORIENTATION_OPTION
} == true

private fun mediaChanged(method: Method, detail: String): Nothing =
    throw PatchException("Messenger controls: the media viewers' orientation call in ${method.hookId()} no longer matches the tested build ($detail)")

/**
 * The viewers' static (helper, orientation) call: it checks for Messenger's activity type and hands the orientation it
 * got straight to each (I)V call it makes. p1 has to be one of the low sixteen registers for the rewrite at its start.
 */
internal fun Method.validateMediaShape() {
    val code = code() ?: mediaChanged(this, "no code")
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" ||
        parameterTypes.map { it.toString() } != listOf(definingClass, "I")) mediaChanged(this, "signature")
    if (implementation!!.registerCount > 16) mediaChanged(this, "registers")
    val orientation = parameterRegister(1)
    if (code.none { it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == FB_FRAGMENT_ACTIVITY }) {
        mediaChanged(this, "activity check")
    }
    val handOffs = code.filter { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { called ->
        called.returnType == "V" && called.parameterTypes.map { type -> type.toString() } == listOf("I")
    } == true }
    val passes = handOffs.all { call ->
        val invoke = call as? FiveRegisterInstruction
        invoke != null && invoke.registerCount == 2 && invoke.registerD == orientation
    }
    if (handOffs.isEmpty() || !passes) mediaChanged(this, "orientation hand-off")
}

/** The one class that names the viewers' orientation option, and its one static method with this shape. */
internal fun findMediaOrientation(classes: Iterable<ClassDef>): List<Method> {
    val helper = classes.filter { cls -> cls.methods.any { it.namesMediaOrientation() } }.singleOrNull() ?: return emptyList()
    return listOfNotNull(helper.methods.filter { runCatching { it.validateMediaShape() }.isSuccess }.singleOrNull())
}

internal fun MutableMethod.validateMediaOrientation() {
    validateMediaShape()
}

/** The orientation the viewer asks for goes through the extension first, which can only turn portrait into unlocked. */
internal fun MutableMethod.injectMediaOrientation() {
    validateMediaShape()
    addInstructions(0, """
        invoke-static {p1}, $MEDIA_ORIENTATION_HELPER
        move-result p1
    """.trimIndent())
}
