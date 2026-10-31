package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21lh
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21lh
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Let Waze run on a high-refresh-rate display.
 *
 * Waze chooses the display mode for its own surface and deliberately refuses anything above 60 Hz: the
 * mode-picker in `com/waze/utils/o` (`RefreshRateDisplayListener`) floors the candidate mode's refresh
 * rate, compares it against 60, and rejects the mode above it -
 *
 *     const-wide/high16 v10, 0x404e000000000000L   # 60.0
 *     cmpl-double v6, v6, v10
 *     if-lez v6, :cond_0
 *     ...
 *     const-string v5, "Ignoring mode with ID = %d. Refresh rate is too high: %.6f"
 *
 * - so a 120 Hz panel is served 60 Hz by Waze even though the system could go higher.
 *
 * This patch rewrites that ceiling constant from 60.0 to the requested rate. It is the *only* 60 Hz gate
 * that was found: the renderer's `frameRateLimiter` dependency carries flags, not a per-frame delay, and
 * no ms-per-frame constant exists in `com/waze/map/opengl`.
 *
 * Off by default on purpose: the 60 Hz ceiling is Waze's battery/heat decision, and forcing 120 Hz on a
 * phone that is already thermally throttled makes it hotter without looking smoother. Enable it, compare,
 * and lower [targetRefreshRate] if the device starts throttling.
 */
private const val MODE_REJECTED_LOG = "Ignoring mode with ID = %d. Refresh rate is too high: %.6f"

/** 60.0 as a `const-wide/high16` literal - the ceiling this patch moves. */
private const val SIXTY_HZ_LITERAL = 0x404e000000000000L

private val DisplayModeCeilingFingerprint = Fingerprint(
    strings = listOf(MODE_REJECTED_LOG),
)

@Suppress("unused")
val highRefreshRatePatch = bytecodePatch(
    name = "Allow high refresh rate",
    description = "Runs above 60 Hz, up to your screen's limit.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("UI Customization")

    val targetRefreshRate by intOption(
        "targetRefreshRate", 120,
        title = "Target refresh rate (Hz)",
        description = "Refresh rate ceiling. 120 suits most phones; lower it if the phone gets hot.",
    )

    execute {
        val method = DisplayModeCeilingFingerprint.method
        val rate = targetRefreshRate ?: 120
        val replacement = java.lang.Double.doubleToRawLongBits(rate.toDouble())
        val implementation = method.implementation
            ?: error(
                "highRefreshRatePatch: the display-mode method was found but has no implementation; " +
                    "refusing to report success for a patch that would change nothing",
            )

        val instructions = implementation.instructions.toList()
        // The ceiling shows up as a const-wide/high16 sixty feeding a double comparison. Match on the
        // raw literal (accepting either encoding of the high word) and require a compare nearby, so a
        // bare 60.0 somewhere else in the method is left alone.
        val sites = instructions.indices.filter { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.CONST_WIDE_HIGH16 &&
                instruction is Instruction21lh &&
                (instruction.wideLiteral == SIXTY_HZ_LITERAL || instruction.wideLiteral == 0x404eL) &&
                instructions.subList(index + 1, minOf(index + 5, instructions.size)).any {
                    it.opcode == Opcode.CMPL_DOUBLE || it.opcode == Opcode.CMPG_DOUBLE
                }
        }

        // A fingerprint that matches a method which no longer holds the 60 Hz ceiling would otherwise
        // produce "at 0 site(s)" and a patch that silently does nothing while Morphe reports success.
        if (sites.isEmpty()) {
            error(
                "highRefreshRatePatch: no 60 Hz display-mode ceiling found in " +
                    "com/waze/utils/o - Waze may have changed; refusing to no-op silently",
            )
        }

        sites.asReversed().forEach { index ->
            val old = instructions[index] as Instruction21lh
            method.replaceInstruction(
                index,
                BuilderInstruction21lh(Opcode.CONST_WIDE_HIGH16, old.registerA, replacement),
            )
        }

        println("highRefreshRatePatch: display-mode ceiling raised to ${rate}Hz at ${sites.size} site(s)")
    }
}
