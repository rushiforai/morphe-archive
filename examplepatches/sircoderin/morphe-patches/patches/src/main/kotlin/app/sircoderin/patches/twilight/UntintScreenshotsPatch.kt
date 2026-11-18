package app.sircoderin.patches.twilight

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.sircoderin.patches.shared.Constants.COMPATIBILITY_TWILIGHT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXT = "Lapp/sircoderin/extension/twilight/Untint;"
private const val CANVAS = "Landroid/graphics/Canvas;"
private const val MATTE_FINISH = "Lcom/urbandroid/lux/ui/MatteFinish2;"

private val PERMISSIONS = listOf(
    "android.permission.MANAGE_EXTERNAL_STORAGE",
    "android.permission.READ_MEDIA_IMAGES",
)

/**
 * Twilight draws its tint as a full-screen accessibility overlay, which the system screenshot (power + volume)
 * captures. This records what the overlay draws (tint colour, dim, window alpha) and, when a screenshot is saved,
 * inverts the blend on the image file in place.
 */
@Suppress("unused")
val untintScreenshotsPatch = patch(
    name = "Untint screenshots",
    description = "Removes Twilight's screen tint from screenshots taken with the system shortcut " +
        "(power + volume). Needs \"All files access\" granted to Twilight.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TWILIGHT)

    extendWith("extensions/extension.mpe")

    execute {
        TwilightViewOnDrawFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            // Back to front so earlier indices stay valid while inserting.
            for (index in instructions.indices.reversed()) {
                val instruction = instructions[index]
                if (instruction !is ReferenceInstruction) continue
                val ref = instruction.reference as? MethodReference ?: continue
                val isCanvasCall = ref.definingClass == CANVAS
                val isPaperCall = ref.definingClass == MATTE_FINISH && ref.name == "onDraw"
                if (!isCanvasCall && !isPaperCall) continue

                val wrapper = when {
                    isCanvasCall && ref.name == "drawColor" && ref.parameterTypes == listOf("I") ->
                        "$EXT->drawColor($CANVAS" + "I)V"
                    isCanvasCall && ref.name == "drawRect" &&
                        ref.parameterTypes == listOf("F", "F", "F", "F", "Landroid/graphics/Paint;") ->
                        "$EXT->drawRect($CANVAS" + "FFFFLandroid/graphics/Paint;)V"
                    else -> null
                }

                if (wrapper == null) {
                    // Any other draw (paper texture, bitmaps, ...) makes the frame non-invertible; just flag it.
                    addInstruction(index, "invoke-static {}, $EXT->markTextured()V")
                    continue
                }

                val call = when (instruction) {
                    is RegisterRangeInstruction ->
                        "invoke-static/range { v${instruction.startRegister} .. " +
                            "v${instruction.startRegister + instruction.registerCount - 1} }, $wrapper"
                    is FiveRegisterInstruction -> {
                        val regs = listOf(
                            instruction.registerC, instruction.registerD, instruction.registerE,
                            instruction.registerF, instruction.registerG,
                        ).take(instruction.registerCount).joinToString(", ") { "v$it" }
                        "invoke-static { $regs }, $wrapper"
                    }
                    else -> error("Unexpected canvas call format: ${instruction.opcode}")
                }
                replaceInstruction(index, call)
            }
            addInstruction(0, "invoke-static { p0 }, $EXT->beginFrame(Landroid/view/View;)V")
        }

        TwilightServiceOnCreateFingerprint.method.apply {
            val superCall = implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_SUPER &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "onCreate"
            }
            require(superCall >= 0) { "super.onCreate() call not found" }
            addInstruction(superCall + 1, "invoke-static { p0 }, $EXT->start(Landroid/content/Context;)V")
        }

        TwilightServiceOnDestroyFingerprint.method.addInstruction(0, "invoke-static { }, $EXT->stop()V")

        resourceXml("AndroidManifest.xml").use { manifest ->
            val root = manifest.root
            val existing = root.elements("uses-permission").map { it.attribute("android:name") }.toSet()
            for (permission in PERMISSIONS) {
                if (permission in existing) continue
                root.appendChild("uses-permission") { setAttribute("android:name", permission) }
            }
        }
    }
}
