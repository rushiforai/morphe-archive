package app.keyboardspeed.patches.youtube.keyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val EXTENSION_SHORTCUTS_CLASS = "Lapp/keyboardspeed/extension/KeyboardShortcutsPatch;"
internal const val EXTENSION_SPEED_CLASS = "Lapp/keyboardspeed/extension/KeyboardSpeedPatch;"
internal const val EXTENSION_COMMENTS_CLASS = "Lapp/keyboardspeed/extension/KeyboardCommentsPatch;"
internal const val EXTENSION_FULLSCREEN_CLASS = "Lapp/keyboardspeed/extension/KeyboardFullscreenPatch;"
internal const val EXTENSION_MINIMIZE_CLASS = "Lapp/keyboardspeed/extension/KeyboardMinimizePatch;"

private const val EXTENSION_DISPATCH_KEY_EVENT =
    "$EXTENSION_SHORTCUTS_CLASS->dispatchKeyEvent(Landroid/app/Activity;Landroid/view/KeyEvent;)Z"

private const val DISPATCH_KEY_EVENT_PARAMETERS = "Landroid/view/KeyEvent;"

/**
 * Keys with a name instead of a single character, such as "Esc".
 */
private val NAMED_KEY_CODES = mapOf(
    "ESC" to 111, // KeyEvent.KEYCODE_ESCAPE
    "ESCAPE" to 111,
    "BACKSPACE" to 67, // KeyEvent.KEYCODE_DEL
    "TAB" to 61, // KeyEvent.KEYCODE_TAB
)

private fun MutableMethod.isMethod(name: String, returnType: String, parameters: String) =
    this.name == name &&
        this.returnType == returnType &&
        parameterTypes.joinToString("") { it.toString() } == parameters

private fun MutableMethod.removeFinalFlag() =
    setAccessFlags(accessFlags and AccessFlags.FINAL.value.inv())

/**
 * An override of a method fails to load if a superclass declares the method final.
 */
private fun BytecodePatchContext.removeFinalFlagOfSuperclasses(
    mainActivity: MutableClass,
    name: String,
    returnType: String,
    parameters: String,
) {
    var superType = mainActivity.superclass
    while (superType != null) {
        val superClass = mutableClassDefByOrNull(superType) ?: break
        superClass.methods.filter { it.isMethod(name, returnType, parameters) }.forEach { it.removeFinalFlag() }
        superType = superClass.superclass
    }
}

/**
 * Replaces the body of a method of the extension that returns a constant,
 * such as the methods that tell if a shortcut is enabled.
 */
internal fun BytecodePatchContext.returnConstant(classType: String, methodName: String, value: Int) {
    val method = mutableClassDefBy(classType).methods.firstOrNull { it.name == methodName }
        ?: throw PatchException("Extension method not found: $classType->$methodName")
    method.addInstructions(
        0,
        """
            const v0, $value
            return v0
        """,
    )
}

private fun keyCodeOrNull(key: String?): Int? {
    val name = key?.trim()?.uppercase() ?: return null
    NAMED_KEY_CODES[name]?.let { return it }
    return when (val char = name.singleOrNull()) {
        in 'A'..'Z' -> 29 + (char!! - 'A') // KeyEvent.KEYCODE_A
        in '0'..'9' -> 7 + (char!! - '0') // KeyEvent.KEYCODE_0
        else -> null
    }
}

/**
 * @return The Android key code of a letter, digit or named key, such as KEYCODE_M for "M" or KEYCODE_ESCAPE for "Esc".
 */
internal fun keyCodeOf(key: String): Int =
    keyCodeOrNull(key) ?: throw PatchException("The key must be a single letter or digit, Esc, Backspace or Tab: '$key'")

internal fun isValidKey(key: String?) = keyCodeOrNull(key) != null

/**
 * Hooks the hardware keyboard keys of the main activity, which the keyboard shortcut patches share.
 */
internal val keyboardShortcutsHookPatch = bytecodePatch(
    description = "Hooks the hardware keyboard keys of the video player.",
) {
    extendWith("extensions/extension.mpe")

    execute {
        val mainActivity = MainActivityOnCreateFingerprint.classDef

        // dispatchKeyEvent: the extension consumes the shortcut keys before the app handles them.
        removeFinalFlagOfSuperclasses(mainActivity, "dispatchKeyEvent", "Z", DISPATCH_KEY_EVENT_PARAMETERS)
        val existingDispatch = mainActivity.methods.firstOrNull {
            it.isMethod("dispatchKeyEvent", "Z", DISPATCH_KEY_EVENT_PARAMETERS)
        }
        if (existingDispatch != null) {
            existingDispatch.removeFinalFlag()

            // v0 must be a local register, not one of the 2 parameter registers.
            if (existingDispatch.implementation!!.registerCount < 3) {
                throw PatchException("MainActivity.dispatchKeyEvent has no free register")
            }

            existingDispatch.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_DISPATCH_KEY_EVENT
                    move-result v0
                    if-eqz v0, :original
                    return v0
                """,
                ExternalLabel("original", existingDispatch.getInstruction(0)),
            )
        } else {
            mainActivity.methods.add(
                ImmutableMethod(
                    mainActivity.type,
                    "dispatchKeyEvent",
                    listOf(ImmutableMethodParameter("Landroid/view/KeyEvent;", null, null)),
                    "Z",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(3),
                ).toMutable().apply {
                    // Activity is used for the super call, as the Morphe swipe controls patch
                    // may insert another class between MainActivity and its current superclass.
                    addInstructionsWithLabels(
                        0,
                        """
                            invoke-static { p0, p1 }, $EXTENSION_DISPATCH_KEY_EVENT
                            move-result v0
                            if-nez v0, :handled
                            invoke-super { p0, p1 }, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z
                            move-result v0
                            :handled
                            return v0
                        """,
                    )
                },
            )
        }
    }
}
