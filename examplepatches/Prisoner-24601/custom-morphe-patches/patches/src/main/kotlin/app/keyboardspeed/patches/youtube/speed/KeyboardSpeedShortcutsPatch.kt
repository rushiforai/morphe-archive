package app.keyboardspeed.patches.youtube.speed

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val EXTENSION_CLASS = "Lapp/keyboardspeed/extension/KeyboardSpeedPatch;"

private const val EXTENSION_DISPATCH_KEY_EVENT =
    "$EXTENSION_CLASS->dispatchKeyEvent(Landroid/app/Activity;Landroid/view/KeyEvent;)Z"

private fun MutableMethod.isDispatchKeyEvent() =
    name == "dispatchKeyEvent" &&
        returnType == "Z" &&
        parameterTypes.map { it.toString() } == listOf("Landroid/view/KeyEvent;")

private fun MutableMethod.removeFinalFlag() =
    setAccessFlags(accessFlags and AccessFlags.FINAL.value.inv())

@Suppress("unused")
val keyboardSpeedShortcutsPatch = bytecodePatch(
    name = "Keyboard speed shortcuts",
    description = "Makes the - and = keys of a hardware keyboard decrease and increase the playback speed. " +
        "Apply together with the Morphe YouTube patches, which this patch uses to change the speed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/extension.mpe")

    val speedStep by intOption(
        key = "speedStep",
        default = 25,
        values = mapOf(
            "0.05x" to 5,
            "0.10x" to 10,
            "0.25x" to 25,
            "0.50x" to 50,
        ),
        title = "Speed step",
        description = "How much each key press changes the playback speed, in hundredths of 1x (25 = 0.25x).",
        required = true,
    ) { it != null && it in 1..100 }

    execute {
        SpeedStepFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, $speedStep
                return v0
            """,
        )

        val mainActivity = MainActivityOnCreateFingerprint.classDef

        // An override of dispatchKeyEvent fails to load if a superclass declares it final.
        var superType = mainActivity.superclass
        while (superType != null) {
            val superClass = mutableClassDefByOrNull(superType) ?: break
            superClass.methods.filter { it.isDispatchKeyEvent() }.forEach { it.removeFinalFlag() }
            superType = superClass.superclass
        }

        val existingMethod = mainActivity.methods.firstOrNull { it.isDispatchKeyEvent() }
        if (existingMethod != null) {
            existingMethod.removeFinalFlag()

            // v0 must be a local register, not one of the 2 parameter registers.
            if (existingMethod.implementation!!.registerCount < 3) {
                throw PatchException("MainActivity.dispatchKeyEvent has no free register")
            }

            existingMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_DISPATCH_KEY_EVENT
                    move-result v0
                    if-eqz v0, :original
                    return v0
                """,
                ExternalLabel("original", existingMethod.getInstruction(0)),
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
