package app.sigstick.patches.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.sigstick.patches.shared.Constants.COMPATIBILITY_SIGSTICK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

// ── How SigStick dark mode is colored (5.25.0) ───────────────────────────────
//
// The UI is Compose (Flutter only hosts the sticker editor). `ThemeKt.<clinit>` builds a
// static `DarkColorScheme = darkColorScheme(...)` from literal ARGB longs; there is no dynamic
// color. Two of those literals carry every dark surface:
//   - 0xff111111 → background (and inverseOnSurface, the text on light snackbars)
//   - 0xff222222 → surface and surfaceContainer (the settings / section cards)
// Both appear only in the dark scheme (the light one uses 0xfff7f7f7), so swapping the
// literals to pure black leaves light mode untouched. Accent, text and #333333 containers
// (chips, selected states) stay as they are so they remain visible on black.

private val AMOLED_LITERALS = setOf(0xff111111L, 0xff222222L)

private object ThemeStaticInitFingerprint : Fingerprint(
    definingClass = "Lcom/sigstick/myapp/ui/theme/ThemeKt;",
    name = "<clinit>",
)

@Suppress("unused")
val amoledDarkThemePatch = bytecodePatch(
    name = "AMOLED Dark Theme",
    description = "Makes the dark theme pure black: background, cards and surfaces become " +
        "#000000 instead of the stock #111111 / #222222 grays.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SIGSTICK)

    execute {
        val method = ThemeStaticInitFingerprint.method
        val targets = method.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.CONST_WIDE &&
                (instruction as WideLiteralInstruction).wideLiteral in AMOLED_LITERALS
        }
        if (targets.size != AMOLED_LITERALS.size) {
            throw PatchException("Expected one load per dark gray, found ${targets.size}")
        }

        targets.forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            method.replaceInstruction(index, "const-wide v$register, 0xff000000L")
        }
    }
}
