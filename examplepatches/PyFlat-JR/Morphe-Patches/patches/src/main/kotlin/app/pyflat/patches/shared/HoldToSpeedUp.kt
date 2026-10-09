package app.pyflat.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.floatSliderOption
import app.morphe.patcher.patch.intSliderOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val VIBRATE_PERMISSION = "android.permission.VIBRATE"

// Needed for the haptic feedback, not every app declares it.
private val vibratePermissionPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            val usesPermissions = document.getElementsByTagName("uses-permission")
            val alreadyDeclared = (0 until usesPermissions.length).any { index ->
                (usesPermissions.item(index) as Element).getAttribute("android:name") == VIBRATE_PERMISSION
            }
            if (alreadyDeclared) return@use

            manifest.appendChild(
                document.createElement("uses-permission").apply {
                    setAttribute("android:name", VIBRATE_PERMISSION)
                },
            )
        }
    }
}

/**
 * @param extensionClass must declare getSpeed()F and getHoldDelayMs()J, overridden by the options.
 */
internal fun holdToSpeedUpPatch(
    compatibility: Compatibility,
    extensionClass: String,
    hook: BytecodePatchContext.() -> Unit,
) = bytecodePatch(
    name = "Hold to speed up",
    description = "Adds a YouTube-like gesture: hold the video to temporarily play it faster.",
) {
    compatibleWith(compatibility)
    dependsOn(vibratePermissionPatch)
    extendWith("extensions/extension.mpe")

    val speed by floatSliderOption(
        key = "speed",
        min = 1.25f,
        max = 4f,
        default = 2f,
        step = 0.25f,
        title = "Speed",
        description = "Playback speed while holding the video.",
        required = true,
    )

    val holdDelay by intSliderOption(
        key = "holdDelay",
        min = 200,
        max = 1500,
        default = 400,
        step = 50,
        title = "Hold delay",
        description = "Milliseconds the video must be held before it speeds up.",
        required = true,
    )

    execute {
        hook()

        mutableClassDefBy(extensionClass).methods.apply {
            first { it.name == "getSpeed" }.addInstructions(
                0,
                """
                    const v0, ${speed!!.toRawBits()}
                    return v0
                """,
            )
            first { it.name == "getHoldDelayMs" }.addInstructions(
                0,
                """
                    const-wide v0, ${holdDelay!!.toLong()}L
                    return-wide v0
                """,
            )
        }
    }
}

/** @return index and value register of the first iput-object into a field of [fieldType]. */
internal fun MutableMethod.findFieldStore(fieldType: String): Pair<Int, Int> {
    val index = implementation!!.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IPUT_OBJECT &&
            ((instruction as ReferenceInstruction).reference as FieldReference).type == fieldType
    }
    if (index < 0) throw PatchException("Store into field of type $fieldType not found in $this")

    val register = (implementation!!.instructions.elementAt(index) as TwoRegisterInstruction).registerA
    return index to register
}
