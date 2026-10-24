package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Car screen fits its window (opt-in, default off).
 *
 * Waze builds the car screen from the *display* metrics, not from the window it was actually given:
 *
 *     Session.getCarContext().getResources().getDisplayMetrics()
 *     new Size(metrics.widthPixels, metrics.heightPixels)   // com/waze/car_lib/bm.onCreateScreen
 *
 * and that Size is handed straight to the screen-layout objects (`com/waze/al`, `com/waze/an`). On a
 * head unit that splits the display - Waze on two thirds, a media app on the left third - the display
 * is wider than the window, so the car screen lays itself out for the full width: the arrow is centred
 * on the display instead of the window, and the speedometer / limit sign / report control sit where
 * the visible area ends.
 *
 * This row replaces that Size with the app window's real bounds (`WindowMetrics.getBounds()`), which
 * is what the host actually gave Waze. On a full-screen car app the two are identical, so the row is
 * a no-op there. Below API 30 `getCurrentWindowMetrics` does not exist, so the original
 * DisplayMetrics path is kept as the fallback branch and the row degrades to today's behaviour rather
 * than crashing.
 *
 * The map surface itself is already sized from the `SurfaceContainer` (`car_lib/i/a/h|i`), which is
 * why only the template layout - not the surface - looks wrong today.
 */
private val CarScreenFingerprint = Fingerprint(
    definingClass = "Lcom/waze/car_lib/bm;",
    name = "onCreateScreen",
    parameters = listOf("Landroid/content/Intent;"),
    returnType = "Landroidx/car/app/Screen;",
)

/** The six instructions Waze uses to derive the car screen size. */
private const val DISPLAY_METRICS_SIZE = 6

@Suppress("unused")
val carScreenWindowSizePatch = bytecodePatch(
    name = "Car screen fits its window",
    description = "Fits the car screen to its window, not the full display.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Experimental")

    execute {
        val method = CarScreenFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("carScreenWindowSizePatch: onCreateScreen has no implementation")

        val instructions = implementation.instructions.toList()
        val start = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;"
        }
        if (start < 0 || start + DISPLAY_METRICS_SIZE > instructions.size) {
            throw PatchException("carScreenWindowSizePatch: the display-metrics size block is gone")
        }

        // Keep the shape check honest: getDisplayMetrics, move-result, new-instance Size, iget, iget, invoke-direct.
        val shape = listOf(
            Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT_OBJECT,
            Opcode.NEW_INSTANCE,
            Opcode.IGET,
            Opcode.IGET,
            Opcode.INVOKE_DIRECT,
        )
        instructions.subList(start, start + DISPLAY_METRICS_SIZE).forEachIndexed { offset, instruction ->
            if (instruction.opcode != shape[offset]) {
                throw PatchException(
                    "carScreenWindowSizePatch: unexpected instruction ${instruction.opcode} at +$offset; " +
                        "Waze changed how it sizes the car screen, refusing to guess",
                )
            }
        }

        method.removeInstructions(start, DISPLAY_METRICS_SIZE)
        // No branches: Waze 5.26 ships minSdkVersion 32, so WindowMetrics (API 30) always exists.
        // A linear block also keeps the assemblable smali free of labels, which is what broke the
        // first attempt at this row.
        method.addInstructions(
            start,
            """
                move-object/from16 v10, p0
                invoke-virtual {v10}, Landroidx/car/app/Session;->getCarContext()Landroidx/car/app/CarContext;
                move-result-object v10
                const-string v11, "window"
                invoke-virtual {v10, v11}, Landroid/content/ContextWrapper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v10
                check-cast v10, Landroid/view/WindowManager;
                invoke-interface {v10}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;
                move-result-object v10
                invoke-virtual {v10}, Landroid/view/WindowMetrics;->getBounds()Landroid/graphics/Rect;
                move-result-object v10
                invoke-virtual {v10}, Landroid/graphics/Rect;->width()I
                move-result v8
                invoke-virtual {v10}, Landroid/graphics/Rect;->height()I
                move-result v9
                new-instance v7, Landroid/util/Size;
                invoke-direct {v7, v8, v9}, Landroid/util/Size;-><init>(II)V
            """.trimIndent(),
        )

        println(
            "carScreenWindowSizePatch: car screen size now comes from WindowMetrics.getBounds()",
        )
    }
}
